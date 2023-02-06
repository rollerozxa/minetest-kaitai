meta:
  id: minetest_mapblock
  file-extension: idk
  endian: be
seq:
  - id: version
    type: u1
    doc: For this Kaitai, only version 29 (0x1d) is supported.
  - id: zstd_buffer
    size-eos: true
    doc: This buffer is zstd compressed. Decompress using zstd.