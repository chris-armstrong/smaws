open Smaws_Lib.Json.DeserializeHelpers
open Types

let error_message_of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_not_found_exception)

let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_in_use_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : limit_exceeded_exception)

let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_next_token_exception)

let invalid_input_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_input_exception)

let double_of_yojson = double_of_yojson
let timestamp_of_yojson = string_of_yojson

let data_point_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "Timestamp") _list path;
     value = option_of_yojson (value_for_key double_of_yojson "Value") _list path;
   }
    : data_point)

let time_series_of_yojson tree path = list_of_yojson data_point_of_yojson tree path
let statistic_of_yojson = string_of_yojson

let predictions_of_yojson tree path =
  map_of_yojson statistic_of_yojson time_series_of_yojson tree path

let forecast_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ predictions = option_of_yojson (value_for_key predictions_of_yojson "Predictions") _list path }
    : forecast)

let query_what_if_forecast_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ forecast = option_of_yojson (value_for_key forecast_of_yojson "Forecast") _list path }
    : query_what_if_forecast_response)

let next_token_of_yojson = string_of_yojson
let attribute_value_of_yojson = string_of_yojson
let attribute_name_of_yojson = string_of_yojson

let filters_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_of_yojson tree path

let date_time_of_yojson = string_of_yojson
let long_arn_of_yojson = string_of_yojson

let query_what_if_forecast_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     what_if_forecast_arn = value_for_key long_arn_of_yojson "WhatIfForecastArn" _list path;
     start_date = option_of_yojson (value_for_key date_time_of_yojson "StartDate") _list path;
     end_date = option_of_yojson (value_for_key date_time_of_yojson "EndDate") _list path;
     filters = value_for_key filters_of_yojson "Filters" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : query_what_if_forecast_request)

let query_forecast_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ forecast = option_of_yojson (value_for_key forecast_of_yojson "Forecast") _list path }
    : query_forecast_response)

let arn_of_yojson = string_of_yojson

let query_forecast_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     forecast_arn = value_for_key arn_of_yojson "ForecastArn" _list path;
     start_date = option_of_yojson (value_for_key date_time_of_yojson "StartDate") _list path;
     end_date = option_of_yojson (value_for_key date_time_of_yojson "EndDate") _list path;
     filters = value_for_key filters_of_yojson "Filters" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : query_forecast_request)
