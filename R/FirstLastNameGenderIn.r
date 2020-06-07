# NamSor API v2
#
# NamSor API v2 : enpoints to process personal names (gender, cultural origin or ethnicity) in all alphabets or languages. Use GET methods for small tests, but prefer POST methods for higher throughput (batch processing of up to 100 names at a time). Need something you can't find here? We have many more features coming soon. Let us know, we'll do our best to add it! 
#
# OpenAPI spec version: 2.0.10
# Contact: contact@namsor.com
# Generated by: https://openapi-generator.tech


#' FirstLastNameGenderIn Class
#'
#' @field id 
#' @field firstName 
#' @field lastName 
#' @field gender 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
FirstLastNameGenderIn <- R6::R6Class(
  'FirstLastNameGenderIn',
  public = list(
    `id` = NULL,
    `firstName` = NULL,
    `lastName` = NULL,
    `gender` = NULL,
    initialize = function(`id`, `firstName`, `lastName`, `gender`){
      if (!missing(`id`)) {
        stopifnot(is.character(`id`), length(`id`) == 1)
        self$`id` <- `id`
      }
      if (!missing(`firstName`)) {
        stopifnot(is.character(`firstName`), length(`firstName`) == 1)
        self$`firstName` <- `firstName`
      }
      if (!missing(`lastName`)) {
        stopifnot(is.character(`lastName`), length(`lastName`) == 1)
        self$`lastName` <- `lastName`
      }
      if (!missing(`gender`)) {
        stopifnot(is.character(`gender`), length(`gender`) == 1)
        self$`gender` <- `gender`
      }
    },
    toJSON = function() {
      FirstLastNameGenderInObject <- list()
      if (!is.null(self$`id`)) {
        FirstLastNameGenderInObject[['id']] <- self$`id`
      }
      if (!is.null(self$`firstName`)) {
        FirstLastNameGenderInObject[['firstName']] <- self$`firstName`
      }
      if (!is.null(self$`lastName`)) {
        FirstLastNameGenderInObject[['lastName']] <- self$`lastName`
      }
      if (!is.null(self$`gender`)) {
        FirstLastNameGenderInObject[['gender']] <- self$`gender`
      }

      FirstLastNameGenderInObject
    },
    fromJSON = function(FirstLastNameGenderInJson) {
      FirstLastNameGenderInObject <- jsonlite::fromJSON(FirstLastNameGenderInJson)
      if (!is.null(FirstLastNameGenderInObject$`id`)) {
        self$`id` <- FirstLastNameGenderInObject$`id`
      }
      if (!is.null(FirstLastNameGenderInObject$`firstName`)) {
        self$`firstName` <- FirstLastNameGenderInObject$`firstName`
      }
      if (!is.null(FirstLastNameGenderInObject$`lastName`)) {
        self$`lastName` <- FirstLastNameGenderInObject$`lastName`
      }
      if (!is.null(FirstLastNameGenderInObject$`gender`)) {
        self$`gender` <- FirstLastNameGenderInObject$`gender`
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "id": %s,
           "firstName": %s,
           "lastName": %s,
           "gender": %s
        }',
        self$`id`,
        self$`firstName`,
        self$`lastName`,
        self$`gender`
      )
    },
    fromJSONString = function(FirstLastNameGenderInJson) {
      FirstLastNameGenderInObject <- jsonlite::fromJSON(FirstLastNameGenderInJson)
      self$`id` <- FirstLastNameGenderInObject$`id`
      self$`firstName` <- FirstLastNameGenderInObject$`firstName`
      self$`lastName` <- FirstLastNameGenderInObject$`lastName`
      self$`gender` <- FirstLastNameGenderInObject$`gender`
    }
  )
)
