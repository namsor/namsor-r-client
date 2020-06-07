# NamSor API v2
#
# NamSor API v2 : enpoints to process personal names (gender, cultural origin or ethnicity) in all alphabets or languages. Use GET methods for small tests, but prefer POST methods for higher throughput (batch processing of up to 100 names at a time). Need something you can't find here? We have many more features coming soon. Let us know, we'll do our best to add it! 
#
# OpenAPI spec version: 2.0.10
# Contact: contact@namsor.com
# Generated by: https://openapi-generator.tech


#' StripeCardOut Class
#'
#' @field defaultCard 
#' @field sourceId 
#' @field expMonth 
#' @field expYear 
#' @field last4 
#' @field brand 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
StripeCardOut <- R6::R6Class(
  'StripeCardOut',
  public = list(
    `defaultCard` = NULL,
    `sourceId` = NULL,
    `expMonth` = NULL,
    `expYear` = NULL,
    `last4` = NULL,
    `brand` = NULL,
    initialize = function(`defaultCard`, `sourceId`, `expMonth`, `expYear`, `last4`, `brand`){
      if (!missing(`defaultCard`)) {
        self$`defaultCard` <- `defaultCard`
      }
      if (!missing(`sourceId`)) {
        stopifnot(is.character(`sourceId`), length(`sourceId`) == 1)
        self$`sourceId` <- `sourceId`
      }
      if (!missing(`expMonth`)) {
        stopifnot(is.numeric(`expMonth`), length(`expMonth`) == 1)
        self$`expMonth` <- `expMonth`
      }
      if (!missing(`expYear`)) {
        stopifnot(is.numeric(`expYear`), length(`expYear`) == 1)
        self$`expYear` <- `expYear`
      }
      if (!missing(`last4`)) {
        stopifnot(is.character(`last4`), length(`last4`) == 1)
        self$`last4` <- `last4`
      }
      if (!missing(`brand`)) {
        stopifnot(is.character(`brand`), length(`brand`) == 1)
        self$`brand` <- `brand`
      }
    },
    toJSON = function() {
      StripeCardOutObject <- list()
      if (!is.null(self$`defaultCard`)) {
        StripeCardOutObject[['defaultCard']] <- self$`defaultCard`
      }
      if (!is.null(self$`sourceId`)) {
        StripeCardOutObject[['sourceId']] <- self$`sourceId`
      }
      if (!is.null(self$`expMonth`)) {
        StripeCardOutObject[['expMonth']] <- self$`expMonth`
      }
      if (!is.null(self$`expYear`)) {
        StripeCardOutObject[['expYear']] <- self$`expYear`
      }
      if (!is.null(self$`last4`)) {
        StripeCardOutObject[['last4']] <- self$`last4`
      }
      if (!is.null(self$`brand`)) {
        StripeCardOutObject[['brand']] <- self$`brand`
      }

      StripeCardOutObject
    },
    fromJSON = function(StripeCardOutJson) {
      StripeCardOutObject <- jsonlite::fromJSON(StripeCardOutJson)
      if (!is.null(StripeCardOutObject$`defaultCard`)) {
        self$`defaultCard` <- StripeCardOutObject$`defaultCard`
      }
      if (!is.null(StripeCardOutObject$`sourceId`)) {
        self$`sourceId` <- StripeCardOutObject$`sourceId`
      }
      if (!is.null(StripeCardOutObject$`expMonth`)) {
        self$`expMonth` <- StripeCardOutObject$`expMonth`
      }
      if (!is.null(StripeCardOutObject$`expYear`)) {
        self$`expYear` <- StripeCardOutObject$`expYear`
      }
      if (!is.null(StripeCardOutObject$`last4`)) {
        self$`last4` <- StripeCardOutObject$`last4`
      }
      if (!is.null(StripeCardOutObject$`brand`)) {
        self$`brand` <- StripeCardOutObject$`brand`
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "defaultCard": %s,
           "sourceId": %s,
           "expMonth": %d,
           "expYear": %d,
           "last4": %s,
           "brand": %s
        }',
        self$`defaultCard`,
        self$`sourceId`,
        self$`expMonth`,
        self$`expYear`,
        self$`last4`,
        self$`brand`
      )
    },
    fromJSONString = function(StripeCardOutJson) {
      StripeCardOutObject <- jsonlite::fromJSON(StripeCardOutJson)
      self$`defaultCard` <- StripeCardOutObject$`defaultCard`
      self$`sourceId` <- StripeCardOutObject$`sourceId`
      self$`expMonth` <- StripeCardOutObject$`expMonth`
      self$`expYear` <- StripeCardOutObject$`expYear`
      self$`last4` <- StripeCardOutObject$`last4`
      self$`brand` <- StripeCardOutObject$`brand`
    }
  )
)
