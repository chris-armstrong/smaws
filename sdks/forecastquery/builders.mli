open Types

val make_data_point : ?value:double -> ?timestamp:timestamp -> unit -> data_point
val make_forecast : ?predictions:predictions -> unit -> forecast

val make_query_what_if_forecast_response :
  ?forecast:forecast -> unit -> query_what_if_forecast_response

val make_query_what_if_forecast_request :
  ?next_token:next_token ->
  ?end_date:date_time ->
  ?start_date:date_time ->
  filters:filters ->
  what_if_forecast_arn:long_arn ->
  unit ->
  query_what_if_forecast_request

val make_query_forecast_response : ?forecast:forecast -> unit -> query_forecast_response

val make_query_forecast_request :
  ?next_token:next_token ->
  ?end_date:date_time ->
  ?start_date:date_time ->
  filters:filters ->
  forecast_arn:arn ->
  unit ->
  query_forecast_request
