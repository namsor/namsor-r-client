# NamSor API v2
#
# NamSor API v2 : enpoints to process personal names (gender, cultural origin or ethnicity) in all alphabets or languages. Use GET methods for small tests, but prefer POST methods for higher throughput (batch processing of up to 100 names at a time). Need something you can't find here? We have many more features coming soon. Let us know, we'll do our best to add it! 
#
# OpenAPI spec version: 2.0.10
# Contact: contact@namsor.com
# Generated by: https://openapi-generator.tech


#' BatchFirstLastNameGenderedOut Class
#'
#' @field personalNames 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
BatchFirstLastNameGenderedOut <- R6::R6Class(
  'BatchFirstLastNameGenderedOut',
  public = list(
    `personalNames` = NULL,
    initialize = function(`personalNames`){
      if (!missing(`personalNames`)) {
        stopifnot(is.list(`personalNames`), length(`personalNames`) != 0)
        lapply(`personalNames`, function(x) stopifnot(R6::is.R6(x)))
        self$`personalNames` <- `personalNames`
      }
    },
    toJSON = function() {
      BatchFirstLastNameGenderedOutObject <- list()
      if (!is.null(self$`personalNames`)) {
        BatchFirstLastNameGenderedOutObject[['personalNames']] <- lapply(self$`personalNames`, function(x) x$toJSON())
      }

      BatchFirstLastNameGenderedOutObject
    },
    fromJSON = function(BatchFirstLastNameGenderedOutJson) {
      BatchFirstLastNameGenderedOutObject <- jsonlite::fromJSON(BatchFirstLastNameGenderedOutJson)
      if (!is.null(BatchFirstLastNameGenderedOutObject$`personalNames`)) {
        self$`personalNames` <- lapply(BatchFirstLastNameGenderedOutObject$`personalNames`, function(x) {
          personalNamesObject <- FirstLastNameGenderedOut$new()
          personalNamesObject$fromJSON(jsonlite::toJSON(x, auto_unbox = TRUE))
          personalNamesObject
        })
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "personalNames": [%s]
        }',
        lapply(self$`personalNames`, function(x) paste(x$toJSON(), sep=","))
      )
    },
    fromJSONString = function(BatchFirstLastNameGenderedOutJson) {
      BatchFirstLastNameGenderedOutObject <- jsonlite::fromJSON(BatchFirstLastNameGenderedOutJson)
      self$`personalNames` <- lapply(BatchFirstLastNameGenderedOutObject$`personalNames`, function(x) FirstLastNameGenderedOut$new()$fromJSON(jsonlite::toJSON(x, auto_unbox = TRUE)))
    }
  )
)
