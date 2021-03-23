meta:
  id: test_col_fixed
  license: MIT
  ks-version: 0.9 # using `valid`
  endian: le
seq:
  - id: table
    type: data_table
types:
  data_table:
    seq:
    - id: n_rows
      type: u4
    - id: n_columns
      type: u1
    - id: column_types
      type: u2
      repeat: expr
      repeat-expr: n_columns
    - id: check_column_types
      size: 0
      valid:
        expr: |
          column_types.size == 20
          and column_types[0] == 1
          and column_types[1] == 2
          and column_types[2] == 3
          and column_types[3] == 4
          and column_types[4] == 1
          and column_types[5] == 2
          and column_types[6] == 3
          and column_types[7] == 4
          and column_types[8] == 1
          and column_types[9] == 2
          and column_types[10] == 3
          and column_types[11] == 4
          and column_types[12] == 1
          and column_types[13] == 2
          and column_types[14] == 3
          and column_types[15] == 4
          and column_types[16] == 1
          and column_types[17] == 2
          and column_types[18] == 3
          and column_types[19] == 4
    - id: table_rows
      type: table_row
      repeat: expr
      repeat-expr: n_rows
  table_row:
    seq:
    - id: flags
      type: u1
    - id: a
      type: u2
    - id: b
      type: u4
    - id: c
      type: f4
    - id: d
      type: f8
    - id: e
      type: u2
    - id: f
      type: u4
    - id: g
      type: f4
    - id: h
      type: f8
    - id: i
      type: u2
    - id: j
      type: u4
    - id: k
      type: f4
    - id: l
      type: f8
    - id: m
      type: u2
    - id: n
      type: u4
    - id: o
      type: f4
    - id: p
      type: f8
    - id: q
      type: u2
    - id: r
      type: u4
    - id: s
      type: f4
    - id: t
      type: f8

