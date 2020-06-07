# NamSor API v2
#
# NamSor API v2 : enpoints to process personal names (gender, cultural origin or ethnicity) in all alphabets or languages. Use GET methods for small tests, but prefer POST methods for higher throughput (batch processing of up to 100 names at a time). Need something you can't find here? We have many more features coming soon. Let us know, we'll do our best to add it! 
#
# OpenAPI spec version: 2.0.10
# Contact: contact@namsor.com
# Generated by: https://openapi-generator.tech


#' PersonalNameParsedOut Class
#'
#' @field id 
#' @field name 
#' @field nameParserType 
#' @field nameParserTypeAlt 
#' @field firstLastName 
#' @field score 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
PersonalNameParsedOut <- R6::R6Class(
  'PersonalNameParsedOut',
  public = list(
    `id` = NULL,
    `name` = NULL,
    `nameParserType` = NULL,
    `nameParserTypeAlt` = NULL,
    `firstLastName` = NULL,
    `score` = NULL,
    initialize = function(`id`, `name`, `nameParserType`, `nameParserTypeAlt`, `firstLastName`, `score`){
      if (!missing(`id`)) {
        stopifnot(is.character(`id`), length(`id`) == 1)
        self$`id` <- `id`
      }
      if (!missing(`name`)) {
        stopifnot(is.character(`name`), length(`name`) == 1)
        self$`name` <- `name`
      }
      if (!missing(`nameParserType`)) {
        stopifnot(is.character(`nameParserType`), length(`nameParserType`) == 1)
        self$`nameParserType` <- `nameParserType`
      }
      if (!missing(`nameParserTypeAlt`)) {
        stopifnot(is.character(`nameParserTypeAlt`), length(`nameParserTypeAlt`) == 1)
        self$`nameParserTypeAlt` <- `nameParserTypeAlt`
      }
      if (!missing(`firstLastName`)) {
        stopifnot(R6::is.R6(`firstLastName`))
        self$`firstLastName` <- `firstLastName`
      }
      if (!missing(`score`)) {
        stopifnot(is.numeric(`score`), length(`score`) == 1)
        self$`score` <- `score`
      }
    },
    toJSON = function() {
      PersonalNameParsedOutObject <- list()
      if (!is.null(self$`id`)) {
        PersonalNameParsedOutObject[['id']] <- self$`id`
      }
      if (!is.null(self$`name`)) {
        PersonalNameParsedOutObject[['name']] <- self$`name`
      }
      if (!is.null(self$`nameParserType`)) {
        PersonalNameParsedOutObject[['nameParserType']] <- self$`nameParserType`
      }
      if (!is.null(self$`nameParserTypeAlt`)) {
        PersonalNameParsedOutObject[['nameParserTypeAlt']] <- self$`nameParserTypeAlt`
      }
      if (!is.null(self$`firstLastName`)) {
        PersonalNameParsedOutObject[['firstLastName']] <- self$`firstLastName`$toJSON()
      }
      if (!is.null(self$`score`)) {
        PersonalNameParsedOutObject[['score']] <- self$`score`
      }

      PersonalNameParsedOutObject
    },
    fromJSON = function(PersonalNameParsedOutJson) {
      PersonalNameParsedOutObject <- jsonlite::fromJSON(PersonalNameParsedOutJson)
      if (!is.null(PersonalNameParsedOutObject$`id`)) {
        self$`id` <- PersonalNameParsedOutObject$`id`
      }
      if (!is.null(PersonalNameParsedOutObject$`name`)) {
        self$`name` <- PersonalNameParsedOutObject$`name`
      }
      if (!is.null(PersonalNameParsedOutObject$`nameParserType`)) {
        self$`nameParserType` <- PersonalNameParsedOutObject$`nameParserType`
      }
      if (!is.null(PersonalNameParsedOutObject$`nameParserTypeAlt`)) {
        self$`nameParserTypeAlt` <- PersonalNameParsedOutObject$`nameParserTypeAlt`
      }
      if (!is.null(PersonalNameParsedOutObject$`firstLastName`)) {
        firstLastNameObject <- FirstLastNameOut$new()
        firstLastNameObject$fromJSON(jsonlite::toJSON(PersonalNameParsedOutObject$firstLastName, auto_unbox = TRUE))
        self$`firstLastName` <- firstLastNameObject
      }
      if (!is.null(PersonalNameParsedOutObject$`score`)) {
        self$`score` <- PersonalNameParsedOutObject$`score`
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "id": %s,
           "name": %s,
           "nameParserType": %s,
           "nameParserTypeAlt": %s,
           "firstLastName": %s,
           "score": %d
        }',
        self$`id`,
        self$`name`,
        self$`nameParserType`,
        self$`nameParserTypeAlt`,
        self$`firstLastName`$toJSON(),
        self$`score`
      )
    },
    fromJSONString = function(PersonalNameParsedOutJson) {
      PersonalNameParsedOutObject <- jsonlite::fromJSON(PersonalNameParsedOutJson)
      self$`id` <- PersonalNameParsedOutObject$`id`
      self$`name` <- PersonalNameParsedOutObject$`name`
      self$`nameParserType` <- PersonalNameParsedOutObject$`nameParserType`
      self$`nameParserTypeAlt` <- PersonalNameParsedOutObject$`nameParserTypeAlt`
      FirstLastNameOutObject <- FirstLastNameOut$new()
      self$`firstLastName` <- FirstLastNameOutObject$fromJSON(jsonlite::toJSON(PersonalNameParsedOutObject$firstLastName, auto_unbox = TRUE))
      self$`score` <- PersonalNameParsedOutObject$`score`
    }
  )
)
