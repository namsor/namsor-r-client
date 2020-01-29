# NamSor API v2
#
# NamSor API v2 : enpoints to process personal names (gender, cultural origin or ethnicity) in all alphabets or languages. Use GET methods for small tests, but prefer POST methods for higher throughput (batch processing of up to 100 names at a time). Need something you can't find here? We have many more features coming soon. Let us know, we'll do our best to add it! 
#
# OpenAPI spec version: 2.0.8
# Contact: contact@namsor.com
# Generated by: https://openapi-generator.tech


#' CacheMetricsOut Class
#'
#' @field cacheName 
#' @field cacheStats 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
CacheMetricsOut <- R6::R6Class(
  'CacheMetricsOut',
  public = list(
    `cacheName` = NULL,
    `cacheStats` = NULL,
    initialize = function(`cacheName`, `cacheStats`){
      if (!missing(`cacheName`)) {
        stopifnot(is.character(`cacheName`), length(`cacheName`) == 1)
        self$`cacheName` <- `cacheName`
      }
      if (!missing(`cacheStats`)) {
        stopifnot(is.character(`cacheStats`), length(`cacheStats`) == 1)
        self$`cacheStats` <- `cacheStats`
      }
    },
    toJSON = function() {
      CacheMetricsOutObject <- list()
      if (!is.null(self$`cacheName`)) {
        CacheMetricsOutObject[['cacheName']] <- self$`cacheName`
      }
      if (!is.null(self$`cacheStats`)) {
        CacheMetricsOutObject[['cacheStats']] <- self$`cacheStats`
      }

      CacheMetricsOutObject
    },
    fromJSON = function(CacheMetricsOutJson) {
      CacheMetricsOutObject <- jsonlite::fromJSON(CacheMetricsOutJson)
      if (!is.null(CacheMetricsOutObject$`cacheName`)) {
        self$`cacheName` <- CacheMetricsOutObject$`cacheName`
      }
      if (!is.null(CacheMetricsOutObject$`cacheStats`)) {
        self$`cacheStats` <- CacheMetricsOutObject$`cacheStats`
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "cacheName": %s,
           "cacheStats": %s
        }',
        self$`cacheName`,
        self$`cacheStats`
      )
    },
    fromJSONString = function(CacheMetricsOutJson) {
      CacheMetricsOutObject <- jsonlite::fromJSON(CacheMetricsOutJson)
      self$`cacheName` <- CacheMetricsOutObject$`cacheName`
      self$`cacheStats` <- CacheMetricsOutObject$`cacheStats`
    }
  )
)