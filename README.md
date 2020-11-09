# R API client for NamSor classifies personal names by gender, country of origin, or ethnicity.

NamSor API v2 : enpoints to process personal names (gender, cultural origin or ethnicity) in all alphabets or languages. Use GET methods for small tests, but prefer POST methods for higher throughput (batch processing of up to 100 names at a time). Need something you can't find here? We have many more features coming soon. Let us know, we'll do our best to add it! 

## Overview
This API client was generated by the [OpenAPI Generator](https://openapi-generator.tech) project. By using the [OpenAPI spec](https://openapis.org) from a remote server, you can easily generate an API client.

- API version: 2.0.11
- Package version: 1.0.0
- Build package: org.openapitools.codegen.languages.RClientCodegen
For more information, please visit [http://www.namsor.com/](http://www.namsor.com/)

## Installation
You'll need the `devtools` package in order to build the API.
Make sure you have a proper CRAN repository from which you can download packages.

### Prerequisites
Install the `devtools` package with the following command.
```R
if(!require(devtools)) { install.packages("devtools") }
```

### Installation of the API package
Make sure you set the working directory to where the API code is located.
Then execute
```R
library(devtools)
install(".")
```

## Alternative Installation

### Prerequisites

Install the dependencies

```R
install.packages("jsonlite")
install.packages("httr")
install.packages("base64enc")
```

### Build the package

```sh
git clone https://github.com/namsor/namsor-r-sdk2
cd namsor-r-sdk2
R CMD build .
R CMD check namsor_2.1.0.tar.gz
R CMD INSTALL namsor_2.1.0.tar.gz
```

### Install the package

```R
install.packages("namsor")
```

To install directly from Github, use `devtools`:
```R
install.packages("devtools")
library(devtools)
install_github("namsor/namsor-r-sdk2")
```


### Usage
```R
library(namsor)

var.first.name <- 'John' # character | 
var.last.name <- 'Smith' # character | 
var.country.iso2 <- 'US' # character | 

#Infer the likely gender of a name, given a local context (ISO2 country code).
api.instance <- PersonalApi$new()
# Configure API key authorization: api_key 
api.instance$apiClient$apiKeys['X-API-KEY'] <- '83ad28e3b3f92de1494181624864bec6';
result <- api.instance$GenderGeo(var.first.name, var.last.name, var.country.iso2)
dput(result)
print(result)
```

### Usage to process a CSV file
```R

#prepare workspace
if(!'devtools' %in% installed.packages()){
  install.packages(devtools)
}

if(!'readr' %in% installed.packages()){
  install.packages("readr")
}

if(!'namsor' %in% installed.packages()){
  install_github("namsor/namsor-r-sdk2")
}

#call packages
library(devtools)
library(namsor)
library(readr)

#call api
httr::set_config(httr::config(ssl_verifypeer = 0L))
api.instance <- PersonalApi$new()
api.instance$apiClient$apiKeys['X-API-KEY'] <- '83ad28e3b3f92de1494181624864bec6';

#call function
extractor <- function(names){
  
### Function calls api to assign gender by attributes ###
  
  #Input:
  
  #names - data.frame with 4 columns:
  # 1. id(char)
  # 2.first name(char)
  # 3. second name(char)
  # 4. country(char)
  
  
  #Output:
  #names - data.frame with 5 columns:
  # 1. id(char)
  # 2.first name(char)
  # 3. second name(char)
  # 4. country(char)
  # 5. gender(char)
  


## SPLIT TO LIST
names_list <- split(names, 
                    factor(rep(seq(ceiling(nrow(names)/100)), 
                               each = 100)[1:nrow(names)]))

## ADD ID
names_list <- lapply(names_list, function(x){
  data.frame('new_id' = seq(nrow(x)), 
             'id' = x[, 1],
             'first_name' = x[, 2], 
             'last_name' = x[, 3], 
             'country' = x[, 4])
})

#create r_gender
r_gender <- lapply(names_list, function(x){
  apply(x, 1, function(y){PersonalNameGeoIn$new(as.character(y[1]),y[3], y[4])})
})
#combine
r_gender <- lapply(r_gender, function(x){c(x)})
#create var gender
var_gender <- lapply(r_gender, function(x){
  BatchPersonalNameGeoIn$new(personalNames = x)})
#call api
api.instance <- PersonalApi$new()
api.instance$apiClient$apiKeys['X-API-KEY'] <- '83ad28e3b3f92de1494181624864bec6';
#get result
result_gender <- lapply(var_gender,
                        function(x){
                          api.instance$GenderFullGeoBatch(
                            batch.personal.name.geo.in=x)})
#extract gender
gender <- lapply(result_gender, function(x){lapply(x$personalNames, 
                                                   function(y){y$likelyGender})})
  
#add gender
names$gender <- unlist(gender)

#return
return(names)
}

#load small data
df1 <- read.csv('example2_csv.csv', stringsAsFactors = FALSE)

#convert to char
df1[, 1] <- sapply(df1[, 1], as.character)

#call function
df1_with_names <- extractor(df1)

#load big data
df2 <- data.frame(read_delim("example1_pipe_input.txt", 
                             "|", escape_double = FALSE, trim_ws = TRUE, 
                             col_names = FALSE))
#all char
str(df2)

#call function
df2_with_names <- extractor(df2)

```


## Documentation for Authorization


### api_key

- **Type**: API key
- **API key parameter name**: X-API-KEY
- **Location**: HTTP header

## Documentation for API Endpoints

All URIs are relative to *https://v2.namsor.com/NamSorAPIv2*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*PersonalApi* | [**Country**](docs/PersonalApi.md#Country) | **GET** /api2/json/country/{personalNameFull} | [USES 10 UNITS PER NAME] Infer the likely country of residence of a personal full name, or one surname. Assumes names as they are in the country of residence OR the country of origin.
*PersonalApi* | [**CountryBatch**](docs/PersonalApi.md#CountryBatch) | **POST** /api2/json/countryBatch | [USES 10 UNITS PER NAME] Infer the likely country of residence of up to 100 personal full names, or surnames. Assumes names as they are in the country of residence OR the country of origin.
*PersonalApi* | [**Diaspora**](docs/PersonalApi.md#Diaspora) | **GET** /api2/json/diaspora/{countryIso2}/{firstName}/{lastName} | [USES 20 UNITS PER NAME] Infer the likely ethnicity/diaspora of a personal name, given a country of residence ISO2 code (ex. US, CA, AU, NZ etc.)
*PersonalApi* | [**DiasporaBatch**](docs/PersonalApi.md#DiasporaBatch) | **POST** /api2/json/diasporaBatch | [USES 20 UNITS PER NAME] Infer the likely ethnicity/diaspora of up to 100 personal names, given a country of residence ISO2 code (ex. US, CA, AU, NZ etc.)
*PersonalApi* | [**Gender**](docs/PersonalApi.md#Gender) | **GET** /api2/json/gender/{firstName}/{lastName} | Infer the likely gender of a name.
*PersonalApi* | [**GenderBatch**](docs/PersonalApi.md#GenderBatch) | **POST** /api2/json/genderBatch | Infer the likely gender of up to 100 names, detecting automatically the cultural context.
*PersonalApi* | [**GenderFull**](docs/PersonalApi.md#GenderFull) | **GET** /api2/json/genderFull/{fullName} | Infer the likely gender of a full name, ex. John H. Smith
*PersonalApi* | [**GenderFullBatch**](docs/PersonalApi.md#GenderFullBatch) | **POST** /api2/json/genderFullBatch | Infer the likely gender of up to 100 full names, detecting automatically the cultural context.
*PersonalApi* | [**GenderFullGeo**](docs/PersonalApi.md#GenderFullGeo) | **GET** /api2/json/genderFullGeo/{fullName}/{countryIso2} | Infer the likely gender of a full name, given a local context (ISO2 country code).
*PersonalApi* | [**GenderFullGeoBatch**](docs/PersonalApi.md#GenderFullGeoBatch) | **POST** /api2/json/genderFullGeoBatch | Infer the likely gender of up to 100 full names, with a given cultural context (country ISO2 code).
*PersonalApi* | [**GenderGeo**](docs/PersonalApi.md#GenderGeo) | **GET** /api2/json/genderGeo/{firstName}/{lastName}/{countryIso2} | Infer the likely gender of a name, given a local context (ISO2 country code).
*PersonalApi* | [**GenderGeoBatch**](docs/PersonalApi.md#GenderGeoBatch) | **POST** /api2/json/genderGeoBatch | Infer the likely gender of up to 100 names, each given a local context (ISO2 country code).
*PersonalApi* | [**Origin**](docs/PersonalApi.md#Origin) | **GET** /api2/json/origin/{firstName}/{lastName} | [USES 10 UNITS PER NAME] Infer the likely country of origin of a personal name. Assumes names as they are in the country of origin. For US, CA, AU, NZ and other melting-pots : use 'diaspora' instead.
*PersonalApi* | [**OriginBatch**](docs/PersonalApi.md#OriginBatch) | **POST** /api2/json/originBatch | [USES 10 UNITS PER NAME] Infer the likely country of origin of up to 100 names, detecting automatically the cultural context.
*PersonalApi* | [**ParseName**](docs/PersonalApi.md#ParseName) | **GET** /api2/json/parseName/{nameFull} | Infer the likely first/last name structure of a name, ex. John Smith or SMITH, John or SMITH; John. 
*PersonalApi* | [**ParseNameBatch**](docs/PersonalApi.md#ParseNameBatch) | **POST** /api2/json/parseNameBatch | Infer the likely first/last name structure of a name, ex. John Smith or SMITH, John or SMITH; John.
*PersonalApi* | [**ParseNameGeo**](docs/PersonalApi.md#ParseNameGeo) | **GET** /api2/json/parseName/{nameFull}/{countryIso2} | Infer the likely first/last name structure of a name, ex. John Smith or SMITH, John or SMITH; John. For better accuracy, provide a geographic context.
*PersonalApi* | [**ParseNameGeoBatch**](docs/PersonalApi.md#ParseNameGeoBatch) | **POST** /api2/json/parseNameGeoBatch | Infer the likely first/last name structure of a name, ex. John Smith or SMITH, John or SMITH; John. Giving a local context improves precision. 
*PersonalApi* | [**ParsedGenderBatch**](docs/PersonalApi.md#ParsedGenderBatch) | **POST** /api2/json/parsedGenderBatch | Infer the likely gender of up to 100 fully parsed names, detecting automatically the cultural context.
*PersonalApi* | [**ParsedGenderGeoBatch**](docs/PersonalApi.md#ParsedGenderGeoBatch) | **POST** /api2/json/parsedGenderGeoBatch | Infer the likely gender of up to 100 fully parsed names, detecting automatically the cultural context.
*PersonalApi* | [**UsRaceEthnicity**](docs/PersonalApi.md#UsRaceEthnicity) | **GET** /api2/json/usRaceEthnicity/{firstName}/{lastName} | [USES 10 UNITS PER NAME] Infer a US resident's likely race/ethnicity according to US Census taxonomy W_NL (white, non latino), HL (hispano latino),  A (asian, non latino), B_NL (black, non latino).
*PersonalApi* | [**UsRaceEthnicityBatch**](docs/PersonalApi.md#UsRaceEthnicityBatch) | **POST** /api2/json/usRaceEthnicityBatch | [USES 10 UNITS PER NAME] Infer up-to 100 US resident's likely race/ethnicity according to US Census taxonomy.
*PersonalApi* | [**UsRaceEthnicityZIP5**](docs/PersonalApi.md#UsRaceEthnicityZIP5) | **GET** /api2/json/usRaceEthnicityZIP5/{firstName}/{lastName}/{zip5Code} | [USES 10 UNITS PER NAME] Infer a US resident's likely race/ethnicity according to US Census taxonomy, using (optional) ZIP5 code info. Output is W_NL (white, non latino), HL (hispano latino),  A (asian, non latino), B_NL (black, non latino).
*PersonalApi* | [**UsZipRaceEthnicityBatch**](docs/PersonalApi.md#UsZipRaceEthnicityBatch) | **POST** /api2/json/usZipRaceEthnicityBatch | [USES 10 UNITS PER NAME] Infer up-to 100 US resident's likely race/ethnicity according to US Census taxonomy, with (optional) ZIP code.
*AdminApi* | [**ApiUsage**](docs/AdminApi.md#ApiUsage) | **GET** /api2/json/apiUsage | Print current API usage.
*AdminApi* | [**ApiUsageHistory**](docs/AdminApi.md#ApiUsageHistory) | **GET** /api2/json/apiUsageHistory | Print historical API usage.
*AdminApi* | [**ApiUsageHistoryAggregate**](docs/AdminApi.md#ApiUsageHistoryAggregate) | **GET** /api2/json/apiUsageHistoryAggregate | Print historical API usage (in an aggregated view, by service, by day/hour/min).
*AdminApi* | [**SoftwareVersion**](docs/AdminApi.md#SoftwareVersion) | **GET** /api2/json/softwareVersion | Get the current software version
*ChineseApi* | [**ChineseNameCandidates**](docs/ChineseApi.md#ChineseNameCandidates) | **GET** /api2/json/chineseNameCandidates/{chineseSurnameLatin}/{chineseGivenNameLatin} | Identify Chinese name candidates, based on the romanized name ex. Wang Xiaoming
*ChineseApi* | [**ChineseNameCandidatesBatch**](docs/ChineseApi.md#ChineseNameCandidatesBatch) | **POST** /api2/json/chineseNameCandidatesBatch | Identify Chinese name candidates, based on the romanized name (firstName = chineseGivenName; lastName=chineseSurname), ex. Wang Xiaoming
*ChineseApi* | [**ChineseNameCandidatesGenderBatch**](docs/ChineseApi.md#ChineseNameCandidatesGenderBatch) | **POST** /api2/json/chineseNameCandidatesGenderBatch | Identify Chinese name candidates, based on the romanized name (firstName = chineseGivenName; lastName=chineseSurname) ex. Wang Xiaoming.
*ChineseApi* | [**ChineseNameGenderCandidates**](docs/ChineseApi.md#ChineseNameGenderCandidates) | **GET** /api2/json/chineseNameGenderCandidates/{chineseSurnameLatin}/{chineseGivenNameLatin}/{knownGender} | Identify Chinese name candidates, based on the romanized name ex. Wang Xiaoming - having a known gender ('male' or 'female')
*ChineseApi* | [**ChineseNameMatch**](docs/ChineseApi.md#ChineseNameMatch) | **GET** /api2/json/chineseNameMatch/{chineseSurnameLatin}/{chineseGivenNameLatin}/{chineseName} | Return a score for matching Chinese name ex. 王晓明 with a romanized name ex. Wang Xiaoming
*ChineseApi* | [**ChineseNameMatchBatch**](docs/ChineseApi.md#ChineseNameMatchBatch) | **POST** /api2/json/chineseNameMatchBatch | Identify Chinese name candidates, based on the romanized name (firstName = chineseGivenName; lastName=chineseSurname), ex. Wang Xiaoming
*ChineseApi* | [**GenderChineseName**](docs/ChineseApi.md#GenderChineseName) | **GET** /api2/json/genderChineseName/{chineseName} | Infer the likely gender of a Chinese full name ex. 王晓明
*ChineseApi* | [**GenderChineseNameBatch**](docs/ChineseApi.md#GenderChineseNameBatch) | **POST** /api2/json/genderChineseNameBatch | Infer the likely gender of up to 100 full names ex. 王晓明
*ChineseApi* | [**GenderChineseNamePinyin**](docs/ChineseApi.md#GenderChineseNamePinyin) | **GET** /api2/json/genderChineseNamePinyin/{chineseSurnameLatin}/{chineseGivenNameLatin} | Infer the likely gender of a Chinese name in LATIN (Pinyin).
*ChineseApi* | [**GenderChineseNamePinyinBatch**](docs/ChineseApi.md#GenderChineseNamePinyinBatch) | **POST** /api2/json/genderChineseNamePinyinBatch | Infer the likely gender of up to 100 Chinese names in LATIN (Pinyin).
*ChineseApi* | [**ParseChineseName**](docs/ChineseApi.md#ParseChineseName) | **GET** /api2/json/parseChineseName/{chineseName} | Infer the likely first/last name structure of a name, ex. 王晓明 -> 王(surname) 晓明(given name)
*ChineseApi* | [**ParseChineseNameBatch**](docs/ChineseApi.md#ParseChineseNameBatch) | **POST** /api2/json/parseChineseNameBatch | Infer the likely first/last name structure of a name, ex. 王晓明 -> 王(surname) 晓明(given name).
*ChineseApi* | [**PinyinChineseName**](docs/ChineseApi.md#PinyinChineseName) | **GET** /api2/json/pinyinChineseName/{chineseName} | Romanize the Chinese name to Pinyin, ex. 王晓明 -> Wang (surname) Xiaoming (given name)
*ChineseApi* | [**PinyinChineseNameBatch**](docs/ChineseApi.md#PinyinChineseNameBatch) | **POST** /api2/json/pinyinChineseNameBatch | Romanize a list of Chinese name to Pinyin, ex. 王晓明 -> Wang (surname) Xiaoming (given name).
*JapaneseApi* | [**GenderJapaneseNameFull**](docs/JapaneseApi.md#GenderJapaneseNameFull) | **GET** /api2/json/genderJapaneseNameFull/{japaneseName} | Infer the likely gender of a Japanese full name ex. 王晓明
*JapaneseApi* | [**GenderJapaneseNameFullBatch**](docs/JapaneseApi.md#GenderJapaneseNameFullBatch) | **POST** /api2/json/genderJapaneseNameFullBatch | Infer the likely gender of up to 100 full names
*JapaneseApi* | [**GenderJapaneseNamePinyin**](docs/JapaneseApi.md#GenderJapaneseNamePinyin) | **GET** /api2/json/genderJapaneseName/{japaneseSurname}/{japaneseGivenName} | Infer the likely gender of a Japanese name in LATIN (Pinyin).
*JapaneseApi* | [**GenderJapaneseNamePinyinBatch**](docs/JapaneseApi.md#GenderJapaneseNamePinyinBatch) | **POST** /api2/json/genderJapaneseNameBatch | Infer the likely gender of up to 100 Japanese names in LATIN (Pinyin).
*JapaneseApi* | [**JapaneseNameKanjiCandidates**](docs/JapaneseApi.md#JapaneseNameKanjiCandidates) | **GET** /api2/json/japaneseNameKanjiCandidates/{japaneseSurnameLatin}/{japaneseGivenNameLatin} | Identify japanese name candidates in KANJI, based on the romanized name ex. Yamamoto Sanae
*JapaneseApi* | [**JapaneseNameKanjiCandidatesBatch**](docs/JapaneseApi.md#JapaneseNameKanjiCandidatesBatch) | **POST** /api2/json/japaneseNameKanjiCandidatesBatch | Identify japanese name candidates in KANJI, based on the romanized name (firstName = japaneseGivenName; lastName=japaneseSurname), ex. Yamamoto Sanae
*JapaneseApi* | [**JapaneseNameLatinCandidates**](docs/JapaneseApi.md#JapaneseNameLatinCandidates) | **GET** /api2/json/japaneseNameLatinCandidates/{japaneseSurnameKanji}/{japaneseGivenNameKanji} | Romanize japanese name, based on the name in Kanji.
*JapaneseApi* | [**JapaneseNameLatinCandidatesBatch**](docs/JapaneseApi.md#JapaneseNameLatinCandidatesBatch) | **POST** /api2/json/japaneseNameLatinCandidatesBatch | Romanize japanese names, based on the name in KANJI
*JapaneseApi* | [**JapaneseNameMatch**](docs/JapaneseApi.md#JapaneseNameMatch) | **GET** /api2/json/japaneseNameMatch/{japaneseSurnameLatin}/{japaneseGivenNameLatin}/{japaneseName} | Return a score for matching Japanese name in KANJI ex. 山本 早苗 with a romanized name ex. Yamamoto Sanae
*JapaneseApi* | [**JapaneseNameMatchBatch**](docs/JapaneseApi.md#JapaneseNameMatchBatch) | **POST** /api2/json/japaneseNameMatchBatch | Return a score for matching a list of Japanese names in KANJI ex. 山本 早苗 with romanized names ex. Yamamoto Sanae
*JapaneseApi* | [**JapaneseNameMatchFeedbackLoop**](docs/JapaneseApi.md#JapaneseNameMatchFeedbackLoop) | **GET** /api2/json/japaneseNameMatchFeedbackLoop/{japaneseSurnameLatin}/{japaneseGivenNameLatin}/{japaneseName} | [CREDITS 1 UNIT] Feedback loop to better perform matching Japanese name in KANJI ex. 山本 早苗 with a romanized name ex. Yamamoto Sanae
*JapaneseApi* | [**ParseJapaneseName**](docs/JapaneseApi.md#ParseJapaneseName) | **GET** /api2/json/parseJapaneseName/{japaneseName} | Infer the likely first/last name structure of a name, ex. 山本 早苗 or Yamamoto Sanae
*JapaneseApi* | [**ParseJapaneseNameBatch**](docs/JapaneseApi.md#ParseJapaneseNameBatch) | **POST** /api2/json/parseJapaneseNameBatch | Infer the likely first/last name structure of a name, ex. 山本 早苗 or Yamamoto Sanae 
*SocialApi* | [**PhoneCode**](docs/SocialApi.md#PhoneCode) | **GET** /api2/json/phoneCode/{firstName}/{lastName}/{phoneNumber} | [USES 11 UNITS PER NAME] Infer the likely country and phone prefix, given a personal name and formatted / unformatted phone number.
*SocialApi* | [**PhoneCodeBatch**](docs/SocialApi.md#PhoneCodeBatch) | **POST** /api2/json/phoneCodeBatch | [USES 11 UNITS PER NAME] Infer the likely country and phone prefix, of up to 100 personal names, detecting automatically the local context given a name and formatted / unformatted phone number.
*SocialApi* | [**PhoneCodeGeo**](docs/SocialApi.md#PhoneCodeGeo) | **GET** /api2/json/phoneCodeGeo/{firstName}/{lastName}/{phoneNumber}/{countryIso2} | [USES 11 UNITS PER NAME] Infer the likely phone prefix, given a personal name and formatted / unformatted phone number, with a local context (ISO2 country of residence).
*SocialApi* | [**PhoneCodeGeoBatch**](docs/SocialApi.md#PhoneCodeGeoBatch) | **POST** /api2/json/phoneCodeGeoBatch | [USES 11 UNITS PER NAME] Infer the likely country and phone prefix, of up to 100 personal names, with a local context (ISO2 country of residence).
*SocialApi* | [**PhoneCodeGeoFeedbackLoop**](docs/SocialApi.md#PhoneCodeGeoFeedbackLoop) | **GET** /api2/json/phoneCodeGeoFeedbackLoop/{firstName}/{lastName}/{phoneNumber}/{phoneNumberE164}/{countryIso2} | [CREDITS 1 UNIT] Feedback loop to better infer the likely phone prefix, given a personal name and formatted / unformatted phone number, with a local context (ISO2 country of residence).


## Documentation for Models

 - [APIBillingPeriodUsageOut](docs/APIBillingPeriodUsageOut.md)
 - [APIClassifierOut](docs/APIClassifierOut.md)
 - [APIClassifierTaxonomyOut](docs/APIClassifierTaxonomyOut.md)
 - [APIClassifiersStatusOut](docs/APIClassifiersStatusOut.md)
 - [APICounterV2Out](docs/APICounterV2Out.md)
 - [APIKeyOut](docs/APIKeyOut.md)
 - [APIPeriodUsageOut](docs/APIPeriodUsageOut.md)
 - [APIPlanOut](docs/APIPlanOut.md)
 - [APIPlanSubscriptionOut](docs/APIPlanSubscriptionOut.md)
 - [APIPlansOut](docs/APIPlansOut.md)
 - [APIServiceOut](docs/APIServiceOut.md)
 - [APIServicesOut](docs/APIServicesOut.md)
 - [APIUsageAggregatedOut](docs/APIUsageAggregatedOut.md)
 - [BatchFirstLastNameDiasporaedOut](docs/BatchFirstLastNameDiasporaedOut.md)
 - [BatchFirstLastNameGenderIn](docs/BatchFirstLastNameGenderIn.md)
 - [BatchFirstLastNameGenderedOut](docs/BatchFirstLastNameGenderedOut.md)
 - [BatchFirstLastNameGeoIn](docs/BatchFirstLastNameGeoIn.md)
 - [BatchFirstLastNameGeoZippedIn](docs/BatchFirstLastNameGeoZippedIn.md)
 - [BatchFirstLastNameIn](docs/BatchFirstLastNameIn.md)
 - [BatchFirstLastNameOriginedOut](docs/BatchFirstLastNameOriginedOut.md)
 - [BatchFirstLastNamePhoneCodedOut](docs/BatchFirstLastNamePhoneCodedOut.md)
 - [BatchFirstLastNamePhoneNumberGeoIn](docs/BatchFirstLastNamePhoneNumberGeoIn.md)
 - [BatchFirstLastNamePhoneNumberIn](docs/BatchFirstLastNamePhoneNumberIn.md)
 - [BatchFirstLastNameUSRaceEthnicityOut](docs/BatchFirstLastNameUSRaceEthnicityOut.md)
 - [BatchMatchPersonalFirstLastNameIn](docs/BatchMatchPersonalFirstLastNameIn.md)
 - [BatchNameMatchCandidatesOut](docs/BatchNameMatchCandidatesOut.md)
 - [BatchNameMatchedOut](docs/BatchNameMatchedOut.md)
 - [BatchParsedFullNameGeoIn](docs/BatchParsedFullNameGeoIn.md)
 - [BatchParsedFullNameIn](docs/BatchParsedFullNameIn.md)
 - [BatchPersonalNameGenderedOut](docs/BatchPersonalNameGenderedOut.md)
 - [BatchPersonalNameGeoIn](docs/BatchPersonalNameGeoIn.md)
 - [BatchPersonalNameGeoOut](docs/BatchPersonalNameGeoOut.md)
 - [BatchPersonalNameIn](docs/BatchPersonalNameIn.md)
 - [BatchPersonalNameParsedOut](docs/BatchPersonalNameParsedOut.md)
 - [BillingHistoryOut](docs/BillingHistoryOut.md)
 - [BillingInfoInOut](docs/BillingInfoInOut.md)
 - [CacheMetricsOut](docs/CacheMetricsOut.md)
 - [ClassifierMetricsOut](docs/ClassifierMetricsOut.md)
 - [CurrenciesOut](docs/CurrenciesOut.md)
 - [DeployUIOut](docs/DeployUIOut.md)
 - [ExpectedClassMetricsOut](docs/ExpectedClassMetricsOut.md)
 - [FeedbackLoopOut](docs/FeedbackLoopOut.md)
 - [FirstLastNameDiasporaedOut](docs/FirstLastNameDiasporaedOut.md)
 - [FirstLastNameGenderIn](docs/FirstLastNameGenderIn.md)
 - [FirstLastNameGenderedOut](docs/FirstLastNameGenderedOut.md)
 - [FirstLastNameGeoIn](docs/FirstLastNameGeoIn.md)
 - [FirstLastNameGeoZippedIn](docs/FirstLastNameGeoZippedIn.md)
 - [FirstLastNameIn](docs/FirstLastNameIn.md)
 - [FirstLastNameOriginedOut](docs/FirstLastNameOriginedOut.md)
 - [FirstLastNameOut](docs/FirstLastNameOut.md)
 - [FirstLastNamePhoneCodedOut](docs/FirstLastNamePhoneCodedOut.md)
 - [FirstLastNamePhoneNumberGeoIn](docs/FirstLastNamePhoneNumberGeoIn.md)
 - [FirstLastNamePhoneNumberIn](docs/FirstLastNamePhoneNumberIn.md)
 - [FirstLastNameUSRaceEthnicityOut](docs/FirstLastNameUSRaceEthnicityOut.md)
 - [InlineObject](docs/InlineObject.md)
 - [InvoiceItemOut](docs/InvoiceItemOut.md)
 - [InvoiceOut](docs/InvoiceOut.md)
 - [MatchPersonalFirstLastNameIn](docs/MatchPersonalFirstLastNameIn.md)
 - [NamSorCounterOut](docs/NamSorCounterOut.md)
 - [NameMatchCandidateOut](docs/NameMatchCandidateOut.md)
 - [NameMatchCandidatesOut](docs/NameMatchCandidatesOut.md)
 - [NameMatchedOut](docs/NameMatchedOut.md)
 - [ParsedFullNameGeoIn](docs/ParsedFullNameGeoIn.md)
 - [ParsedFullNameIn](docs/ParsedFullNameIn.md)
 - [PersonalNameGenderedOut](docs/PersonalNameGenderedOut.md)
 - [PersonalNameGeoIn](docs/PersonalNameGeoIn.md)
 - [PersonalNameGeoOut](docs/PersonalNameGeoOut.md)
 - [PersonalNameIn](docs/PersonalNameIn.md)
 - [PersonalNameParsedOut](docs/PersonalNameParsedOut.md)
 - [RomanizedNameOut](docs/RomanizedNameOut.md)
 - [SoftwareVersionOut](docs/SoftwareVersionOut.md)
 - [SourceDetailedMetricsOut](docs/SourceDetailedMetricsOut.md)
 - [SourceMetricsOut](docs/SourceMetricsOut.md)
 - [StripeCardOut](docs/StripeCardOut.md)
 - [StripeCustomerOut](docs/StripeCustomerOut.md)
 - [SystemMetricsOut](docs/SystemMetricsOut.md)
 - [UserInfoOut](docs/UserInfoOut.md)


## Author

contact@namsor.com

