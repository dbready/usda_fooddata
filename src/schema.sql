CREATE TABLE IF NOT EXISTS "acquisition_samples" (
  "fdc_id_of_sample_food" INTEGER,
  "fdc_id_of_acquisition_food" INTEGER
);
CREATE TABLE IF NOT EXISTS "agricultural_acquisition" (
  "fdc_id" INTEGER PRIMARY KEY,
  "acquisition_date" TEXT,
  "market_class" TEXT,
  "treatment" TEXT,
  "state" TEXT,
  FOREIGN KEY (fdc_id) REFERENCES food(fdc_id)
);
CREATE TABLE IF NOT EXISTS "branded_food" (
  "fdc_id" INTEGER PRIMARY KEY,
  "brand_owner" TEXT,
  "gtin_upc" TEXT,
  "ingredients" TEXT,
  "serving_size" REAL,
  "serving_size_unit" TEXT,
  "household_serving_fulltext" TEXT,
  "branded_food_category" TEXT,
  "data_source" TEXT,
  "modified_date" TEXT,
  "available_date" TEXT,
  "market_country" TEXT,
  "discontinued_date" TEXT,
  FOREIGN KEY (fdc_id) REFERENCES food(fdc_id)
);
CREATE TABLE IF NOT EXISTS "fndds_derivation" (
  "derivation_code" TEXT,
  "derivation_description" TEXT
);
CREATE TABLE IF NOT EXISTS "fndds_ingredient_nutrient_value" (
  "ingredient_code" INTEGER,
  "ingredient_description" TEXT,
  "nutrient_code" INTEGER,
  "nutrient_value" REAL,
  "nutrient_value_source" TEXT,
  "fdc_id" INTEGER,
  "derivation_code" TEXT,
  "sr_addmod_year" INTEGER,
  "foundation_year_acquired" INTEGER,
  "start_date" TEXT,
  "end_date" TEXT
);
CREATE TABLE IF NOT EXISTS "food" (
  "fdc_id" INTEGER PRIMARY KEY,
  "data_type" TEXT,
  "description" TEXT,
  "food_category_id" INTEGER,
  -- nearly always null
  "publication_date" TEXT,
  FOREIGN KEY (food_category_id) REFERENCES food_category(id)
);
CREATE TABLE IF NOT EXISTS "food_attribute" (
  "id" INTEGER PRIMARY KEY,
  "fdc_id" INTEGER,
  "seq_num" INTEGER,
  "food_attribute_type_id" INTEGER,
  "name" TEXT,
  "value" TEXT,
  FOREIGN KEY (fdc_id) REFERENCES food(fdc_id),
  FOREIGN KEY (food_attribute_type_id) REFERENCES food_attribute_type(id)
);
CREATE TABLE IF NOT EXISTS "food_attribute_type" (
  "id" INTEGER PRIMARY KEY,
  "name" TEXT,
  "description" TEXT
);
CREATE TABLE IF NOT EXISTS "food_calorie_conversion_factor" (
  "food_nutrient_conversion_factor_id" INTEGER PRIMARY KEY,
  "protein_value" REAL,
  "fat_value" REAL,
  "carbohydrate_value" REAL
);
CREATE TABLE IF NOT EXISTS "food_category" (
  "id" INTEGER PRIMARY KEY,
  "code" INTEGER,
  "description" TEXT
);
CREATE TABLE IF NOT EXISTS "food_component" (
  "id" INTEGER PRIMARY KEY,
  "fdc_id" INTEGER,
  "name" TEXT,
  "pct_weight" REAL,
  "is_refuse" TEXT,
  "gram_weight" REAL,
  "data_points" INTEGER,
  "min_year_acquired" REAL,
  FOREIGN KEY (fdc_id) REFERENCES food(fdc_id)
);
CREATE TABLE IF NOT EXISTS "food_nutrient" (
  "id" INTEGER PRIMARY KEY,
  "fdc_id" INTEGER,
  "nutrient_id" INTEGER,
  "amount" REAL,
  "data_points" INTEGER,
  "derivation_id" INTEGER,
  "min" REAL,
  "max" REAL,
  "median" REAL,
  "footnote" TEXT,
  "min_year_acquired" INTEGER,
  FOREIGN KEY (fdc_id) REFERENCES food(fdc_id),
  FOREIGN KEY (nutrient_id) REFERENCES nutrient(id),
  FOREIGN KEY (derivation_id) REFERENCES food_nutrient_derivation(id)
);
CREATE TABLE IF NOT EXISTS "food_nutrient_conversion_factor" (
  "id" INTEGER PRIMARY KEY,
  "fdc_id" INTEGER,
  FOREIGN KEY (fdc_id) REFERENCES food(fdc_id)
);
CREATE TABLE IF NOT EXISTS "food_nutrient_derivation" (
  "id" INTEGER PRIMARY KEY,
  "code" TEXT,
  "description" TEXT,
  "source_id" INTEGER,
  FOREIGN KEY (source_id) REFERENCES food_nutrient_source(id)
);
CREATE TABLE IF NOT EXISTS "food_nutrient_source" (
  "id" INTEGER PRIMARY KEY,
  "code" INTEGER,
  "description" TEXT
);
CREATE TABLE IF NOT EXISTS "food_portion" (
  "id" INTEGER PRIMARY KEY,
  "fdc_id" INTEGER,
  "seq_num" INTEGER,
  "amount" REAL,
  "measure_unit_id" INTEGER,
  "portion_description" TEXT,
  "modifier" TEXT,
  "gram_weight" REAL,
  "data_points" REAL,
  "footnote" REAL,
  "min_year_acquired" REAL,
  FOREIGN KEY (fdc_id) REFERENCES food(fdc_id),
  FOREIGN KEY (measure_unit_id) REFERENCES measure_unit(id)
);
CREATE TABLE IF NOT EXISTS "food_protein_conversion_factor" (
  "food_nutrient_conversion_factor_id" INTEGER,
  "value" REAL,
  FOREIGN KEY (food_nutrient_conversion_factor_id) REFERENCES food_nutrient_conversion_factor(id)
);
CREATE TABLE IF NOT EXISTS "food_update_log_entry" (
  "id" INTEGER PRIMARY KEY,
  "description" TEXT,
  "last_updated" TEXT
);
CREATE TABLE IF NOT EXISTS "foundation_food" (
  "fdc_id" INTEGER PRIMARY KEY,
  "ndb_number" INTEGER,
  "footnote" TEXT,
  FOREIGN KEY (fdc_id) REFERENCES food(fdc_id)
);
CREATE TABLE IF NOT EXISTS "input_food" (
  "id" INTEGER PRIMARY KEY,
  "fdc_id" INTEGER,
  "fdc_id_of_input_food" INTEGER,
  "seq_num" INTEGER,
  "amount" REAL,
  "sr_code" INTEGER,
  "sr_description" TEXT,
  "unit" TEXT,
  "portion_code" INTEGER,
  "portion_description" TEXT,
  "gram_weight" REAL,
  "retention_code" INTEGER,
  "survey_flag" REAL,
  FOREIGN KEY (fdc_id) REFERENCES food(fdc_id),
  FOREIGN KEY (fdc_id_of_input_food) REFERENCES food(fdc_id)
);
CREATE TABLE IF NOT EXISTS "lab_method" (
  "id" INTEGER PRIMARY KEY,
  "description" TEXT,
  "technique" TEXT
);
CREATE TABLE IF NOT EXISTS "lab_method_code" (
  "id" INTEGER PRIMARY KEY,
  "lab_method_id" INTEGER,
  "code" TEXT,
  FOREIGN KEY (lab_method_id) REFERENCES lab_method(id)
);
CREATE TABLE IF NOT EXISTS "lab_method_nutrient" (
  "id" INTEGER,
  "lab_method_id" INTEGER,
  "nutrient_id" INTEGER,
  FOREIGN KEY (lab_method_id) REFERENCES lab_method(id),
  FOREIGN KEY (nutrient_id) REFERENCES nutrient(id)
);
CREATE TABLE IF NOT EXISTS "market_acquisition" (
  "fdc_id" INTEGER PRIMARY KEY,
  "brand_description" TEXT,
  "expiration_date" TEXT,
  "label_weight" REAL,
  "location" TEXT,
  "acquisition_date" REAL,
  "sales_type" TEXT,
  "sample_lot_nbr" TEXT,
  "sell_by_date" TEXT,
  "store_city" TEXT,
  "store_name" TEXT,
  "store_state" TEXT,
  "upc_code" TEXT,
  FOREIGN KEY (fdc_id) REFERENCES food(fdc_id)
);
CREATE TABLE IF NOT EXISTS "measure_unit" ("id" INTEGER PRIMARY KEY, "name" TEXT);
CREATE TABLE IF NOT EXISTS "nutrient" (
  "id" INTEGER PRIMARY KEY,
  "name" TEXT,
  "unit_name" TEXT,
  "nutrient_nbr" REAL,
  "rank" REAL
);
CREATE TABLE IF NOT EXISTS "nutrient_incoming_name" (
  "id" INTEGER PRIMARY KEY,
  "name" TEXT,
  "nutrient_id" INTEGER,
  FOREIGN KEY (nutrient_id) REFERENCES nutrient(id)
);
CREATE TABLE IF NOT EXISTS "retention_factor" (
  "id" INTEGER PRIMARY KEY,
  "code" INTEGER,
  "food_group_id" INTEGER,
  "description" TEXT
);
CREATE TABLE IF NOT EXISTS "sample_food" (
  "fdc_id" INTEGER,
  FOREIGN KEY (fdc_id) REFERENCES food(fdc_id)
);
CREATE TABLE IF NOT EXISTS "sr_legacy_food" (
  "fdc_id" INTEGER,
  "ndb_number" INTEGER,
  FOREIGN KEY (fdc_id) REFERENCES food(fdc_id)
);
CREATE TABLE IF NOT EXISTS "sub_sample_food" (
  "fdc_id" INTEGER,
  "fdc_id_of_sample_food" INTEGER,
  FOREIGN KEY (fdc_id) REFERENCES food(fdc_id)
);
CREATE TABLE IF NOT EXISTS "sub_sample_result" (
  "food_nutrient_id" INTEGER PRIMARY KEY,
  "adjusted_amount" REAL,
  "lab_method_id" INTEGER,
  "nutrient_name" TEXT
);
CREATE TABLE IF NOT EXISTS "survey_fndds_food" (
  "fdc_id" INTEGER PRIMARY KEY,
  "food_code" INTEGER,
  "wweia_category_code" INTEGER,
  "start_date" TEXT,
  "end_date" TEXT,
  FOREIGN KEY (fdc_id) REFERENCES food(fdc_id),
  FOREIGN KEY (wweia_category_code) REFERENCES wweia_food_category(wweia_food_category)
);
CREATE TABLE IF NOT EXISTS "wweia_food_category" (
  "wweia_food_category" INTEGER PRIMARY KEY,
  "wweia_food_category_description" TEXT
);