open Types

val make_data_point : ?timestamp:timestamp -> ?value:double -> unit -> data_point
val make_forecast : ?predictions:predictions -> unit -> forecast

val make_query_what_if_forecast_response :
  ?forecast:forecast -> unit -> query_what_if_forecast_response

val make_query_what_if_forecast_request :
  ?start_date:date_time ->
  ?end_date:date_time ->
  ?next_token:next_token ->
  what_if_forecast_arn:long_arn ->
  filters:filters ->
  unit ->
  query_what_if_forecast_request

val make_query_forecast_response : ?forecast:forecast -> unit -> query_forecast_response

val make_query_forecast_request :
  ?start_date:date_time ->
  ?end_date:date_time ->
  ?next_token:next_token ->
  forecast_arn:arn ->
  filters:filters ->
  unit ->
  query_forecast_request
