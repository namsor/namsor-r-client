# NamSor API v2
#
# NamSor API v2 : enpoints to process personal names (gender, cultural origin or ethnicity) in all alphabets or languages. Use GET methods for small tests, but prefer POST methods for higher throughput (batch processing of up to 100 names at a time). Need something you can't find here? We have many more features coming soon. Let us know, we'll do our best to add it! 
#
# The version of the OpenAPI document: 2.0.10
# Contact: contact@namsor.com
# Generated by: https://openapi-generator.tech

#' @docType class
#' @title PersonalNameGeoIn
#' @description PersonalNameGeoIn Class
#' @format An \code{R6Class} generator object
#' @field id  character [optional]
#'
#' @field name  character [optional]
#'
#' @field countryIso2  character [optional]
#'
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
PersonalNameGeoIn <- R6::R6Class(
  'PersonalNameGeoIn',
  public = list(
    `id` = NULL,
    `name` = NULL,
    `countryIso2` = NULL,
    initialize = function(`id`=NULL, `name`=NULL, `countryIso2`=NULL, ...){
      local.optional.var <- list(...)
      if (!is.null(`id`)) {
        stopifnot(is.character(`id`), length(`id`) == 1)
        self$`id` <- `id`
      }
      if (!is.null(`name`)) {
        stopifnot(is.character(`name`), length(`name`) == 1)
        self$`name` <- `name`
      }
      if (!is.null(`countryIso2`)) {
        stopifnot(is.character(`countryIso2`), length(`countryIso2`) == 1)
        self$`countryIso2` <- `countryIso2`
      }
    },
    toJSON = function() {
      PersonalNameGeoInObject <- list()
      if (!is.null(self$`id`)) {
        PersonalNameGeoInObject[['id']] <-
          self$`id`
      }
      if (!is.null(self$`name`)) {
        PersonalNameGeoInObject[['name']] <-
          self$`name`
      }
      if (!is.null(self$`countryIso2`)) {
        PersonalNameGeoInObject[['countryIso2']] <-
          self$`countryIso2`
      }

      PersonalNameGeoInObject
    },
    fromJSON = function(PersonalNameGeoInJson) {
      PersonalNameGeoInObject <- jsonlite::fromJSON(PersonalNameGeoInJson)
      if (!is.null(PersonalNameGeoInObject$`id`)) {
        self$`id` <- PersonalNameGeoInObject$`id`
      }
      if (!is.null(PersonalNameGeoInObject$`name`)) {
        self$`name` <- PersonalNameGeoInObject$`name`
      }
      if (!is.null(PersonalNameGeoInObject$`countryIso2`)) {
        self$`countryIso2` <- PersonalNameGeoInObject$`countryIso2`
      }
    },
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`id`)) {
        sprintf(
        '"id":
          "%s"
                ',
        self$`id`
        )},
        if (!is.null(self$`name`)) {
        sprintf(
        '"name":
          "%s"
                ',
        self$`name`
        )},
        if (!is.null(self$`countryIso2`)) {
        sprintf(
        '"countryIso2":
          "%s"
                ',
        self$`countryIso2`
        )}
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      paste('{', jsoncontent, '}', sep = "")
    },
    fromJSONString = function(PersonalNameGeoInJson) {
      PersonalNameGeoInObject <- jsonlite::fromJSON(PersonalNameGeoInJson)
      self$`id` <- PersonalNameGeoInObject$`id`
      self$`name` <- PersonalNameGeoInObject$`name`
      self$`countryIso2` <- PersonalNameGeoInObject$`countryIso2`
      self
    }
  )
)
