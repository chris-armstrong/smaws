open Smaws_Lib.Json.SerializeHelpers
open Types

let timestamp_to_yojson = string_to_yojson
let double_to_yojson = double_to_yojson

let data_point_to_yojson (x : data_point) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson double_to_yojson x.value);
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
    ]

let time_series_to_yojson tree = list_to_yojson data_point_to_yojson tree
let statistic_to_yojson = string_to_yojson
let error_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let predictions_to_yojson tree = map_to_yojson statistic_to_yojson time_series_to_yojson tree

let forecast_to_yojson (x : forecast) =
  assoc_to_yojson [ ("Predictions", option_to_yojson predictions_to_yojson x.predictions) ]

let query_what_if_forecast_response_to_yojson (x : query_what_if_forecast_response) =
  assoc_to_yojson [ ("Forecast", option_to_yojson forecast_to_yojson x.forecast) ]

let long_arn_to_yojson = string_to_yojson
let date_time_to_yojson = string_to_yojson
let attribute_value_to_yojson = string_to_yojson
let attribute_name_to_yojson = string_to_yojson
let filters_to_yojson tree = map_to_yojson attribute_name_to_yojson attribute_value_to_yojson tree
let next_token_to_yojson = string_to_yojson

let query_what_if_forecast_request_to_yojson (x : query_what_if_forecast_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", Some (filters_to_yojson x.filters));
      ("EndDate", option_to_yojson date_time_to_yojson x.end_date);
      ("StartDate", option_to_yojson date_time_to_yojson x.start_date);
      ("WhatIfForecastArn", Some (long_arn_to_yojson x.what_if_forecast_arn));
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_input_exception_to_yojson (x : invalid_input_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let query_forecast_response_to_yojson (x : query_forecast_response) =
  assoc_to_yojson [ ("Forecast", option_to_yojson forecast_to_yojson x.forecast) ]

let arn_to_yojson = string_to_yojson

let query_forecast_request_to_yojson (x : query_forecast_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", Some (filters_to_yojson x.filters));
      ("EndDate", option_to_yojson date_time_to_yojson x.end_date);
      ("StartDate", option_to_yojson date_time_to_yojson x.start_date);
      ("ForecastArn", Some (arn_to_yojson x.forecast_arn));
    ]
