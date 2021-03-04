.PHONY: all clean

DBNAME=usda.sqlite

build/$(DBNAME) : src/*.sql build/extract/food.csv
	sqlite3 build/$(DBNAME) < src/schema.sql
	# awkward path traversal so as to not hard-code paths in the sql
	cd build/extract; sqlite3 ../$(DBNAME) < ../../src/load_tables.sql

data/raw/food_data_central.zip :
	mkdir -p data/raw
	# latest downloads available from: https://fdc.nal.usda.gov/download-datasets.html
	wget https://fdc.nal.usda.gov/fdc-datasets/FoodData_Central_csv_2020-10-30.zip --output-document=data/raw/food_data_central.zip.temp
	mv data/raw/food_data_central.zip.temp data/raw/food_data_central.zip

# arbitrary target csv from the set
build/extract/food.csv : data/raw/food_data_central.zip
	mkdir -p build/extract
	unzip data/raw/food_data_central.zip -d build/extract
	touch build/extract/*.csv

clean:
	rm -rf build/
