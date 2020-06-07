# NamSor API v2
#
# NamSor API v2 : enpoints to process personal names (gender, cultural origin or ethnicity) in all alphabets or languages. Use GET methods for small tests, but prefer POST methods for higher throughput (batch processing of up to 100 names at a time). Need something you can't find here? We have many more features coming soon. Let us know, we'll do our best to add it! 
#
# OpenAPI spec version: 2.0.10
# Contact: contact@namsor.com
# Generated by: https://openapi-generator.tech


#' BatchFirstLastNamePhoneCodedOut Class
#'
#' @field personalNamesWithPhoneNumbers 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
BatchFirstLastNamePhoneCodedOut <- R6::R6Class(
  'BatchFirstLastNamePhoneCodedOut',
  public = list(
    `personalNamesWithPhoneNumbers` = NULL,
    initialize = function(`personalNamesWithPhoneNumbers`){
      if (!missing(`personalNamesWithPhoneNumbers`)) {
        stopifnot(is.list(`personalNamesWithPhoneNumbers`), length(`personalNamesWithPhoneNumbers`) != 0)
        lapply(`personalNamesWithPhoneNumbers`, function(x) stopifnot(R6::is.R6(x)))
        self$`personalNamesWithPhoneNumbers` <- `personalNamesWithPhoneNumbers`
      }
    },
    toJSON = function() {
      BatchFirstLastNamePhoneCodedOutObject <- list()
      if (!is.null(self$`personalNamesWithPhoneNumbers`)) {
        BatchFirstLastNamePhoneCodedOutObject[['personalNamesWithPhoneNumbers']] <- lapply(self$`personalNamesWithPhoneNumbers`, function(x) x$toJSON())
      }

      BatchFirstLastNamePhoneCodedOutObject
    },
    fromJSON = function(BatchFirstLastNamePhoneCodedOutJson) {
      BatchFirstLastNamePhoneCodedOutObject <- jsonlite::fromJSON(BatchFirstLastNamePhoneCodedOutJson)
      if (!is.null(BatchFirstLastNamePhoneCodedOutObject$`personalNamesWithPhoneNumbers`)) {
        self$`personalNamesWithPhoneNumbers` <- lapply(BatchFirstLastNamePhoneCodedOutObject$`personalNamesWithPhoneNumbers`, function(x) {
          personalNamesWithPhoneNumbersObject <- FirstLastNamePhoneCodedOut$new()
          personalNamesWithPhoneNumbersObject$fromJSON(jsonlite::toJSON(x, auto_unbox = TRUE))
          personalNamesWithPhoneNumbersObject
        })
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "personalNamesWithPhoneNumbers": [%s]
        }',
        lapply(self$`personalNamesWithPhoneNumbers`, function(x) paste(x$toJSON(), sep=","))
      )
    },
    fromJSONString = function(BatchFirstLastNamePhoneCodedOutJson) {
      BatchFirstLastNamePhoneCodedOutObject <- jsonlite::fromJSON(BatchFirstLastNamePhoneCodedOutJson)
      self$`personalNamesWithPhoneNumbers` <- lapply(BatchFirstLastNamePhoneCodedOutObject$`personalNamesWithPhoneNumbers`, function(x) FirstLastNamePhoneCodedOut$new()$fromJSON(jsonlite::toJSON(x, auto_unbox = TRUE)))
    }
  )
)
