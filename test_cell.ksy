meta:
  id: test_cell
  license: MIT
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
    - id: table_rows
      type: table_row
      repeat: expr
      repeat-expr: n_rows
  table_row:
    seq:
    - id: flags
      type: u1
    - id: entries
      repeat: expr
      repeat-expr: _parent.n_columns
      type:
        switch-on: _parent.column_types[_index]
        cases:
          10: u1
          11: u1
          12: u1
          13: u1
          14: u1
          15: u1
          16: u1
          17: u1
          18: u1
          19: u1
          1: u2
          20: u1
          21: u1
          22: u1
          23: u1
          24: u1
          25: u1
          26: u1
          27: u1
          28: u1
          29: u1
          2: u4
          30: u1
          31: u1
          32: u1
          33: u1
          34: u1
          35: u1
          36: u1
          37: u1
          38: u1
          39: u1
          3: f4
          40: u1
          41: u1
          42: u1
          43: u1
          44: u1
          45: u1
          46: u1
          47: u1
          48: u1
          49: u1
          4: f8
