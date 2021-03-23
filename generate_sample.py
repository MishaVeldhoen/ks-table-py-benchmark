from kaitaistruct import KaitaiStream
import random

N_ROWS = 65536
N_COLUMNS_BASE = 4
N_COLUMN_REPS = 5
COLUMN_TYPES = N_COLUMN_REPS * [1, 2, 3, 4]
N_COLUMNS = N_COLUMNS_BASE * N_COLUMN_REPS

is_row_0_fixed = True

COL_U2 = 1
COL_U4 = 2
COL_F4 = 3
COL_F8 = 4

assert len(COLUMN_TYPES) == N_COLUMNS, 'len(COLUMN_TYPES) = {} must be equal to n_columns = {}'.format(
    len(COLUMN_TYPES),
    N_COLUMNS
)

pk_u1 = KaitaiStream.packer_u1
pk_u2le = KaitaiStream.packer_u2le
pk_u4le = KaitaiStream.packer_u4le
pk_f4le = KaitaiStream.packer_f4le
pk_f8le = KaitaiStream.packer_f8le

with open('./sample.bin', 'wb') as f:
    f.write(pk_u4le.pack(N_ROWS))
    f.write(pk_u1.pack(N_COLUMNS))
    for t in COLUMN_TYPES:
        f.write(pk_u2le.pack(t))

    if is_row_0_fixed:
        assert COLUMN_TYPES == N_COLUMN_REPS * [1, 2, 3, 4], 'column_types = {} does not match the row_0 format'.format(COLUMN_TYPES)
        row_0 = N_COLUMN_REPS * [0x7a46, 0x86b97d9c, 0.842150092124939, 0.5340359913176319]

        f.write(b'\x00')
        for _ in range(N_COLUMN_REPS):
            f.write(pk_u2le.pack(row_0[0]))
            f.write(pk_u4le.pack(row_0[1]))
            f.write(pk_f4le.pack(row_0[2]))
            f.write(pk_f8le.pack(row_0[3]))

    for y in range(N_ROWS - 1):
        f.write(b'\x00')
        for t in COLUMN_TYPES:
            if t == COL_U2:
                f.write(pk_u2le.pack(random.randrange(0, 0xffff)))
            elif t == COL_U4:
                f.write(pk_u4le.pack(random.randrange(0, 0xffffffff)))
            elif t == COL_F4:
                f.write(pk_f4le.pack(random.random()))
            elif t == COL_F8:
                f.write(pk_f8le.pack(random.random()))
    print('{} bytes written'.format(f.tell()))
