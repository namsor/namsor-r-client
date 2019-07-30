# NamSor API v2
#
# NamSor API v2 : enpoints to process personal names (gender, cultural origin or ethnicity) in all alphabets or languages. Use GET methods for small tests, but prefer POST methods for higher throughput (batch processing of up to 100 names at a time). Need something you can't find here? We have many more features coming soon. Let us know, we'll do our best to add it! 
#
# OpenAPI spec version: 2.0.5
# Contact: contact@namsor.com
# Generated by: https://openapi-generator.tech


#' BillingHistoryOut Class
#'
#' @field stripeInvoices 
#' @field corporateInvoices 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
BillingHistoryOut <- R6::R6Class(
  'BillingHistoryOut',
  public = list(
    `stripeInvoices` = NULL,
    `corporateInvoices` = NULL,
    initialize = function(`stripeInvoices`, `corporateInvoices`){
      if (!missing(`stripeInvoices`)) {
        stopifnot(is.list(`stripeInvoices`), length(`stripeInvoices`) != 0)
        lapply(`stripeInvoices`, function(x) stopifnot(R6::is.R6(x)))
        self$`stripeInvoices` <- `stripeInvoices`
      }
      if (!missing(`corporateInvoices`)) {
        stopifnot(is.list(`corporateInvoices`), length(`corporateInvoices`) != 0)
        lapply(`corporateInvoices`, function(x) stopifnot(R6::is.R6(x)))
        self$`corporateInvoices` <- `corporateInvoices`
      }
    },
    toJSON = function() {
      BillingHistoryOutObject <- list()
      if (!is.null(self$`stripeInvoices`)) {
        BillingHistoryOutObject[['stripeInvoices']] <- lapply(self$`stripeInvoices`, function(x) x$toJSON())
      }
      if (!is.null(self$`corporateInvoices`)) {
        BillingHistoryOutObject[['corporateInvoices']] <- lapply(self$`corporateInvoices`, function(x) x$toJSON())
      }

      BillingHistoryOutObject
    },
    fromJSON = function(BillingHistoryOutJson) {
      BillingHistoryOutObject <- jsonlite::fromJSON(BillingHistoryOutJson)
      if (!is.null(BillingHistoryOutObject$`stripeInvoices`)) {
        self$`stripeInvoices` <- lapply(BillingHistoryOutObject$`stripeInvoices`, function(x) {
          stripeInvoicesObject <- InvoiceOut$new()
          stripeInvoicesObject$fromJSON(jsonlite::toJSON(x, auto_unbox = TRUE))
          stripeInvoicesObject
        })
      }
      if (!is.null(BillingHistoryOutObject$`corporateInvoices`)) {
        self$`corporateInvoices` <- lapply(BillingHistoryOutObject$`corporateInvoices`, function(x) {
          corporateInvoicesObject <- InvoiceOut$new()
          corporateInvoicesObject$fromJSON(jsonlite::toJSON(x, auto_unbox = TRUE))
          corporateInvoicesObject
        })
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "stripeInvoices": [%s],
           "corporateInvoices": [%s]
        }',
        lapply(self$`stripeInvoices`, function(x) paste(x$toJSON(), sep=",")),
        lapply(self$`corporateInvoices`, function(x) paste(x$toJSON(), sep=","))
      )
    },
    fromJSONString = function(BillingHistoryOutJson) {
      BillingHistoryOutObject <- jsonlite::fromJSON(BillingHistoryOutJson)
      self$`stripeInvoices` <- lapply(BillingHistoryOutObject$`stripeInvoices`, function(x) InvoiceOut$new()$fromJSON(jsonlite::toJSON(x, auto_unbox = TRUE)))
      self$`corporateInvoices` <- lapply(BillingHistoryOutObject$`corporateInvoices`, function(x) InvoiceOut$new()$fromJSON(jsonlite::toJSON(x, auto_unbox = TRUE)))
    }
  )
)