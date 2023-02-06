meta:
  id: minetest_mapblock_uncompressed
  file-extension: idk
  endian: be

seq:
  - id: flags
    type: u1
  - id: lighting_complete
    type: u2

  - id: timestamp
    type: u4
  - id: name_id_mapping_version
    type: u1
  - id: num_name_id_mappings
    type: u2
  - id: name_id_mappings
    type: name_id_mapping
    repeat: expr
    repeat-expr: num_name_id_mappings

  - id: content_width
    type: u1
  - id: params_width
    type: u1

  - id: param0
    type: u2
    repeat: expr
    repeat-expr: 4096
    doc: Node ID (palette ID from name ID mappings)
  - id: param1
    type: u1
    repeat: expr
    repeat-expr: 4096
  - id: param2
    type: u1
    repeat: expr
    repeat-expr: 4096

# TODO: Node metadata (can only parse regular key-value metadata rn, not inventories)
#  - id: node_metadata
#    type: node_metadata

types:
  name_id_mapping:
    seq:
      - id: id
        type: u2
      - id: name_len
        type: u2
      - id: name
        type: str
        size: name_len
        encoding: UTF-8

  node_metadata:
    seq:
      - id: version
        type: u1
      - id: count
        type: u2
      - id: meta
        type: meta

    types:
      meta:
        seq:
          - id: position
            type: u2
          - id: num_vars
            type: u4
          - id: data
            type: metadata
            repeat: expr
            repeat-expr: num_vars
      metadata:
        seq:
          - id: key_len
            type: u2
          - id: key
            type: str
            size: key_len
            encoding: UTF-8
          - id: val_len
            type: u4
          - id: value
            type: str
            size: val_len
            encoding: UTF-8
          - id: is_private
            type: u1
