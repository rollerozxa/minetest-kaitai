# Minetest Mapblock Kaitai(s)
These Kaitai files are for reading the Minetest mapblock format. Only version 29 (0x1d) is supported (5.5.0 and above).

This is incomplete and can only parse the basic node data (param0 through param2).

For the raw mapblock data stored as BLOBs in the database, parse it with `minetest_mapblock.ksy`. In level version 29 it is only a u8 version field and rest is a compressed zstd buffer. Strip off the first byte and decompress it:

```php
file_put_contents('mapblock_uncompressed.bin', zstd_uncompress(substr(file_get_contents('mapblock.bin'), 1)));
```

It can then be parsed using `minetest_mapblock_uncompressed.ksy`.

## Further reading:
- [doc/world_format.txt](https://github.com/minetest/minetest/blob/master/doc/world_format.txt) (see "MapBlock serialization format")
- [src/mapblock.cpp](https://github.com/minetest/minetest/blob/master/src/mapblock.cpp) (see `MapBlock::Serialize`)
