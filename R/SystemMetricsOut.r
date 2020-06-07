# NamSor API v2
#
# NamSor API v2 : enpoints to process personal names (gender, cultural origin or ethnicity) in all alphabets or languages. Use GET methods for small tests, but prefer POST methods for higher throughput (batch processing of up to 100 names at a time). Need something you can't find here? We have many more features coming soon. Let us know, we'll do our best to add it! 
#
# OpenAPI spec version: 2.0.10
# Contact: contact@namsor.com
# Generated by: https://openapi-generator.tech


#' SystemMetricsOut Class
#'
#' @field cacheMetrics 
#' @field classifierMetrics 
#' @field sourceMetrics 
#' @field totalMem 
#' @field freeMem 
#' @field maxMem 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
SystemMetricsOut <- R6::R6Class(
  'SystemMetricsOut',
  public = list(
    `cacheMetrics` = NULL,
    `classifierMetrics` = NULL,
    `sourceMetrics` = NULL,
    `totalMem` = NULL,
    `freeMem` = NULL,
    `maxMem` = NULL,
    initialize = function(`cacheMetrics`, `classifierMetrics`, `sourceMetrics`, `totalMem`, `freeMem`, `maxMem`){
      if (!missing(`cacheMetrics`)) {
        stopifnot(is.list(`cacheMetrics`), length(`cacheMetrics`) != 0)
        lapply(`cacheMetrics`, function(x) stopifnot(R6::is.R6(x)))
        self$`cacheMetrics` <- `cacheMetrics`
      }
      if (!missing(`classifierMetrics`)) {
        stopifnot(is.list(`classifierMetrics`), length(`classifierMetrics`) != 0)
        lapply(`classifierMetrics`, function(x) stopifnot(R6::is.R6(x)))
        self$`classifierMetrics` <- `classifierMetrics`
      }
      if (!missing(`sourceMetrics`)) {
        stopifnot(is.list(`sourceMetrics`), length(`sourceMetrics`) != 0)
        lapply(`sourceMetrics`, function(x) stopifnot(R6::is.R6(x)))
        self$`sourceMetrics` <- `sourceMetrics`
      }
      if (!missing(`totalMem`)) {
        stopifnot(is.numeric(`totalMem`), length(`totalMem`) == 1)
        self$`totalMem` <- `totalMem`
      }
      if (!missing(`freeMem`)) {
        stopifnot(is.numeric(`freeMem`), length(`freeMem`) == 1)
        self$`freeMem` <- `freeMem`
      }
      if (!missing(`maxMem`)) {
        stopifnot(is.numeric(`maxMem`), length(`maxMem`) == 1)
        self$`maxMem` <- `maxMem`
      }
    },
    toJSON = function() {
      SystemMetricsOutObject <- list()
      if (!is.null(self$`cacheMetrics`)) {
        SystemMetricsOutObject[['cacheMetrics']] <- lapply(self$`cacheMetrics`, function(x) x$toJSON())
      }
      if (!is.null(self$`classifierMetrics`)) {
        SystemMetricsOutObject[['classifierMetrics']] <- lapply(self$`classifierMetrics`, function(x) x$toJSON())
      }
      if (!is.null(self$`sourceMetrics`)) {
        SystemMetricsOutObject[['sourceMetrics']] <- lapply(self$`sourceMetrics`, function(x) x$toJSON())
      }
      if (!is.null(self$`totalMem`)) {
        SystemMetricsOutObject[['totalMem']] <- self$`totalMem`
      }
      if (!is.null(self$`freeMem`)) {
        SystemMetricsOutObject[['freeMem']] <- self$`freeMem`
      }
      if (!is.null(self$`maxMem`)) {
        SystemMetricsOutObject[['maxMem']] <- self$`maxMem`
      }

      SystemMetricsOutObject
    },
    fromJSON = function(SystemMetricsOutJson) {
      SystemMetricsOutObject <- jsonlite::fromJSON(SystemMetricsOutJson)
      if (!is.null(SystemMetricsOutObject$`cacheMetrics`)) {
        self$`cacheMetrics` <- lapply(SystemMetricsOutObject$`cacheMetrics`, function(x) {
          cacheMetricsObject <- CacheMetricsOut$new()
          cacheMetricsObject$fromJSON(jsonlite::toJSON(x, auto_unbox = TRUE))
          cacheMetricsObject
        })
      }
      if (!is.null(SystemMetricsOutObject$`classifierMetrics`)) {
        self$`classifierMetrics` <- lapply(SystemMetricsOutObject$`classifierMetrics`, function(x) {
          classifierMetricsObject <- ClassifierMetricsOut$new()
          classifierMetricsObject$fromJSON(jsonlite::toJSON(x, auto_unbox = TRUE))
          classifierMetricsObject
        })
      }
      if (!is.null(SystemMetricsOutObject$`sourceMetrics`)) {
        self$`sourceMetrics` <- lapply(SystemMetricsOutObject$`sourceMetrics`, function(x) {
          sourceMetricsObject <- SourceMetricsOut$new()
          sourceMetricsObject$fromJSON(jsonlite::toJSON(x, auto_unbox = TRUE))
          sourceMetricsObject
        })
      }
      if (!is.null(SystemMetricsOutObject$`totalMem`)) {
        self$`totalMem` <- SystemMetricsOutObject$`totalMem`
      }
      if (!is.null(SystemMetricsOutObject$`freeMem`)) {
        self$`freeMem` <- SystemMetricsOutObject$`freeMem`
      }
      if (!is.null(SystemMetricsOutObject$`maxMem`)) {
        self$`maxMem` <- SystemMetricsOutObject$`maxMem`
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "cacheMetrics": [%s],
           "classifierMetrics": [%s],
           "sourceMetrics": [%s],
           "totalMem": %d,
           "freeMem": %d,
           "maxMem": %d
        }',
        lapply(self$`cacheMetrics`, function(x) paste(x$toJSON(), sep=",")),
        lapply(self$`classifierMetrics`, function(x) paste(x$toJSON(), sep=",")),
        lapply(self$`sourceMetrics`, function(x) paste(x$toJSON(), sep=",")),
        self$`totalMem`,
        self$`freeMem`,
        self$`maxMem`
      )
    },
    fromJSONString = function(SystemMetricsOutJson) {
      SystemMetricsOutObject <- jsonlite::fromJSON(SystemMetricsOutJson)
      self$`cacheMetrics` <- lapply(SystemMetricsOutObject$`cacheMetrics`, function(x) CacheMetricsOut$new()$fromJSON(jsonlite::toJSON(x, auto_unbox = TRUE)))
      self$`classifierMetrics` <- lapply(SystemMetricsOutObject$`classifierMetrics`, function(x) ClassifierMetricsOut$new()$fromJSON(jsonlite::toJSON(x, auto_unbox = TRUE)))
      self$`sourceMetrics` <- lapply(SystemMetricsOutObject$`sourceMetrics`, function(x) SourceMetricsOut$new()$fromJSON(jsonlite::toJSON(x, auto_unbox = TRUE)))
      self$`totalMem` <- SystemMetricsOutObject$`totalMem`
      self$`freeMem` <- SystemMetricsOutObject$`freeMem`
      self$`maxMem` <- SystemMetricsOutObject$`maxMem`
    }
  )
)
