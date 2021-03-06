# NamSor API v2
#
# NamSor API v2 : enpoints to process personal names (gender, cultural origin or ethnicity) in all alphabets or languages. Use GET methods for small tests, but prefer POST methods for higher throughput (batch processing of up to 100 names at a time). Need something you can't find here? We have many more features coming soon. Let us know, we'll do our best to add it! 
#
# The version of the OpenAPI document: 2.0.10
# Contact: contact@namsor.com
# Generated by: https://openapi-generator.tech

#' @docType class
#' @title FirstLastNameGenderedOut
#' @description FirstLastNameGenderedOut Class
#' @format An \code{R6Class} generator object
#' @field id  character [optional]
#'
#' @field firstName  character [optional]
#'
#' @field lastName  character [optional]
#'
#' @field likelyGender  character [optional]
#'
#' @field genderScale  numeric [optional]
#'
#' @field score  numeric [optional]
#'
#' @field probabilityCalibrated  numeric [optional]
#'
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
FirstLastNameGenderedOut <- R6::R6Class(
  'FirstLastNameGenderedOut',
  public = list(
    `id` = NULL,
    `firstName` = NULL,
    `lastName` = NULL,
    `likelyGender` = NULL,
    `genderScale` = NULL,
    `score` = NULL,
    `probabilityCalibrated` = NULL,
    initialize = function(`id`=NULL, `firstName`=NULL, `lastName`=NULL, `likelyGender`=NULL, `genderScale`=NULL, `score`=NULL, `probabilityCalibrated`=NULL, ...){
      local.optional.var <- list(...)
      if (!is.null(`id`)) {
        stopifnot(is.character(`id`), length(`id`) == 1)
        self$`id` <- `id`
      }
      if (!is.null(`firstName`)) {
        stopifnot(is.character(`firstName`), length(`firstName`) == 1)
        self$`firstName` <- `firstName`
      }
      if (!is.null(`lastName`)) {
        stopifnot(is.character(`lastName`), length(`lastName`) == 1)
        self$`lastName` <- `lastName`
      }
      if (!is.null(`likelyGender`)) {
        stopifnot(is.character(`likelyGender`), length(`likelyGender`) == 1)
        self$`likelyGender` <- `likelyGender`
      }
      if (!is.null(`genderScale`)) {
        stopifnot(is.numeric(`genderScale`), length(`genderScale`) == 1)
        self$`genderScale` <- `genderScale`
      }
      if (!is.null(`score`)) {
        stopifnot(is.numeric(`score`), length(`score`) == 1)
        self$`score` <- `score`
      }
      if (!is.null(`probabilityCalibrated`)) {
        stopifnot(is.numeric(`probabilityCalibrated`), length(`probabilityCalibrated`) == 1)
        self$`probabilityCalibrated` <- `probabilityCalibrated`
      }
    },
    toJSON = function() {
      FirstLastNameGenderedOutObject <- list()
      if (!is.null(self$`id`)) {
        FirstLastNameGenderedOutObject[['id']] <-
          self$`id`
      }
      if (!is.null(self$`firstName`)) {
        FirstLastNameGenderedOutObject[['firstName']] <-
          self$`firstName`
      }
      if (!is.null(self$`lastName`)) {
        FirstLastNameGenderedOutObject[['lastName']] <-
          self$`lastName`
      }
      if (!is.null(self$`likelyGender`)) {
        FirstLastNameGenderedOutObject[['likelyGender']] <-
          self$`likelyGender`
      }
      if (!is.null(self$`genderScale`)) {
        FirstLastNameGenderedOutObject[['genderScale']] <-
          self$`genderScale`
      }
      if (!is.null(self$`score`)) {
        FirstLastNameGenderedOutObject[['score']] <-
          self$`score`
      }
      if (!is.null(self$`probabilityCalibrated`)) {
        FirstLastNameGenderedOutObject[['probabilityCalibrated']] <-
          self$`probabilityCalibrated`
      }

      FirstLastNameGenderedOutObject
    },
    fromJSON = function(FirstLastNameGenderedOutJson) {
      FirstLastNameGenderedOutObject <- jsonlite::fromJSON(FirstLastNameGenderedOutJson)
      if (!is.null(FirstLastNameGenderedOutObject$`id`)) {
        self$`id` <- FirstLastNameGenderedOutObject$`id`
      }
      if (!is.null(FirstLastNameGenderedOutObject$`firstName`)) {
        self$`firstName` <- FirstLastNameGenderedOutObject$`firstName`
      }
      if (!is.null(FirstLastNameGenderedOutObject$`lastName`)) {
        self$`lastName` <- FirstLastNameGenderedOutObject$`lastName`
      }
      if (!is.null(FirstLastNameGenderedOutObject$`likelyGender`)) {
        self$`likelyGender` <- FirstLastNameGenderedOutObject$`likelyGender`
      }
      if (!is.null(FirstLastNameGenderedOutObject$`genderScale`)) {
        self$`genderScale` <- FirstLastNameGenderedOutObject$`genderScale`
      }
      if (!is.null(FirstLastNameGenderedOutObject$`score`)) {
        self$`score` <- FirstLastNameGenderedOutObject$`score`
      }
      if (!is.null(FirstLastNameGenderedOutObject$`probabilityCalibrated`)) {
        self$`probabilityCalibrated` <- FirstLastNameGenderedOutObject$`probabilityCalibrated`
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
        if (!is.null(self$`firstName`)) {
        sprintf(
        '"firstName":
          "%s"
                ',
        self$`firstName`
        )},
        if (!is.null(self$`lastName`)) {
        sprintf(
        '"lastName":
          "%s"
                ',
        self$`lastName`
        )},
        if (!is.null(self$`likelyGender`)) {
        sprintf(
        '"likelyGender":
          "%s"
                ',
        self$`likelyGender`
        )},
        if (!is.null(self$`genderScale`)) {
        sprintf(
        '"genderScale":
          %d
                ',
        self$`genderScale`
        )},
        if (!is.null(self$`score`)) {
        sprintf(
        '"score":
          %d
                ',
        self$`score`
        )},
        if (!is.null(self$`probabilityCalibrated`)) {
        sprintf(
        '"probabilityCalibrated":
          %d
                ',
        self$`probabilityCalibrated`
        )}
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      paste('{', jsoncontent, '}', sep = "")
    },
    fromJSONString = function(FirstLastNameGenderedOutJson) {
      FirstLastNameGenderedOutObject <- jsonlite::fromJSON(FirstLastNameGenderedOutJson)
      self$`id` <- FirstLastNameGenderedOutObject$`id`
      self$`firstName` <- FirstLastNameGenderedOutObject$`firstName`
      self$`lastName` <- FirstLastNameGenderedOutObject$`lastName`
      self$`likelyGender` <- FirstLastNameGenderedOutObject$`likelyGender`
      self$`genderScale` <- FirstLastNameGenderedOutObject$`genderScale`
      self$`score` <- FirstLastNameGenderedOutObject$`score`
      self$`probabilityCalibrated` <- FirstLastNameGenderedOutObject$`probabilityCalibrated`
      self
    }
  )
)
