.mode csv

BEGIN TRANSACTION;

-- skip argument fairly new addition to command line tooling

.import --skip 1 acquisition_samples.csv acquisition_samples
.import --skip 1 agricultural_acquisition.csv agricultural_acquisition
.import --skip 1 all_downloaded_table_record_counts.csv all_downloaded_table_record_counts
.import --skip 1 branded_food.csv branded_food
.import --skip 1 fndds_derivation.csv fndds_derivation
.import --skip 1 fndds_ingredient_nutrient_value.csv fndds_ingredient_nutrient_value
.import --skip 1 food_attribute.csv food_attribute
.import --skip 1 food_attribute_type.csv food_attribute_type
.import --skip 1 food_calorie_conversion_factor.csv food_calorie_conversion_factor
.import --skip 1 food_category.csv food_category
.import --skip 1 food_component.csv food_component
.import --skip 1 food.csv food
.import --skip 1 food_nutrient_conversion_factor.csv food_nutrient_conversion_factor
.import --skip 1 food_nutrient.csv food_nutrient
.import --skip 1 food_nutrient_derivation.csv food_nutrient_derivation
.import --skip 1 food_nutrient_source.csv food_nutrient_source
.import --skip 1 food_portion.csv food_portion
.import --skip 1 food_protein_conversion_factor.csv food_protein_conversion_factor
.import --skip 1 food_update_log_entry.csv food_update_log_entry
.import --skip 1 foundation_food.csv foundation_food
.import --skip 1 input_food.csv input_food
.import --skip 1 lab_method_code.csv lab_method_code
.import --skip 1 lab_method.csv lab_method
.import --skip 1 lab_method_nutrient.csv lab_method_nutrient
.import --skip 1 market_acquisition.csv market_acquisition
.import --skip 1 measure_unit.csv measure_unit
.import --skip 1 nutrient.csv nutrient
.import --skip 1 nutrient_incoming_name.csv nutrient_incoming_name
.import --skip 1 retention_factor.csv retention_factor
.import --skip 1 sample_food.csv sample_food
.import --skip 1 sr_legacy_food.csv sr_legacy_food
.import --skip 1 sub_sample_food.csv sub_sample_food
.import --skip 1 sub_sample_result.csv sub_sample_result
.import --skip 1 survey_fndds_food.csv survey_fndds_food
.import --skip 1 wweia_food_category.csv wweia_food_category

COMMIT;
