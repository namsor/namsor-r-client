# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate

context("Test SourceMetricsOut")

model.instance <- SourceMetricsOut$new()

test_that("classifier_name", {
  # tests for the property `classifier_name` (character)

  # uncomment below to test the property 
  #expect_equal(model.instance$`classifier_name`, "EXPECTED_RESULT")
})

test_that("source", {
  # tests for the property `source` (APIKeyOut)

  # uncomment below to test the property 
  #expect_equal(model.instance$`source`, "EXPECTED_RESULT")
})

test_that("ai_estimate_total", {
  # tests for the property `ai_estimate_total` (integer)

  # uncomment below to test the property 
  #expect_equal(model.instance$`ai_estimate_total`, "EXPECTED_RESULT")
})

test_that("ai_estimate_precision", {
  # tests for the property `ai_estimate_precision` (numeric)

  # uncomment below to test the property 
  #expect_equal(model.instance$`ai_estimate_precision`, "EXPECTED_RESULT")
})

test_that("ai_estimate_recall", {
  # tests for the property `ai_estimate_recall` (numeric)

  # uncomment below to test the property 
  #expect_equal(model.instance$`ai_estimate_recall`, "EXPECTED_RESULT")
})

test_that("metric_time_stamp", {
  # tests for the property `metric_time_stamp` (integer)

  # uncomment below to test the property 
  #expect_equal(model.instance$`metric_time_stamp`, "EXPECTED_RESULT")
})

test_that("ai_start_time", {
  # tests for the property `ai_start_time` (integer)

  # uncomment below to test the property 
  #expect_equal(model.instance$`ai_start_time`, "EXPECTED_RESULT")
})

test_that("ai_learn_total", {
  # tests for the property `ai_learn_total` (integer)

  # uncomment below to test the property 
  #expect_equal(model.instance$`ai_learn_total`, "EXPECTED_RESULT")
})

test_that("snapshot_date", {
  # tests for the property `snapshot_date` (integer)

  # uncomment below to test the property 
  #expect_equal(model.instance$`snapshot_date`, "EXPECTED_RESULT")
})

