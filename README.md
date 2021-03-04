# USDA FoodData Central

Build a local copy of the [USDA FoodData Central](https://fdc.nal.usda.gov/download-datasets.html) as a SQLite database. Best faith effort given the available data dictionary is not clear as to all column definitions and relations. Built because it should be the default provided option rather than the MS Access database.

## Quick Start

If running in a Linuxy environment with the SQLite command line tools, should be possible to build the database by invoking `make` from the project root. More specifically:

```bash
>make
```

Will download the data and compile into `build/usda.sqlite`.

## License

Code is dual licensed under [Apache 2](https://www.apache.org/licenses/LICENSE-2.0.html) and [MIT](https://opensource.org/licenses/MIT).
