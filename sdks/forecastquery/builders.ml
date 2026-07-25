open Types

let make_data_point ?timestamp:(timestamp_ : timestamp option) ?value:(value_ : double option) () =
  ({ timestamp = timestamp_; value = value_ } : data_point)

let make_forecast ?predictions:(predictions_ : predictions option) () =
  ({ predictions = predictions_ } : forecast)

let make_query_what_if_forecast_response ?forecast:(forecast_ : forecast option) () =
  ({ forecast = forecast_ } : query_what_if_forecast_response)

let make_query_what_if_forecast_request ?start_date:(start_date_ : date_time option)
    ?end_date:(end_date_ : date_time option) ?next_token:(next_token_ : next_token option)
    ~what_if_forecast_arn:(what_if_forecast_arn_ : long_arn) ~filters:(filters_ : filters) () =
  ({
     what_if_forecast_arn = what_if_forecast_arn_;
     start_date = start_date_;
     end_date = end_date_;
     filters = filters_;
     next_token = next_token_;
   }
    : query_what_if_forecast_request)

let make_query_forecast_response ?forecast:(forecast_ : forecast option) () =
  ({ forecast = forecast_ } : query_forecast_response)

let make_query_forecast_request ?start_date:(start_date_ : date_time option)
    ?end_date:(end_date_ : date_time option) ?next_token:(next_token_ : next_token option)
    ~forecast_arn:(forecast_arn_ : arn) ~filters:(filters_ : filters) () =
  ({
     forecast_arn = forecast_arn_;
     start_date = start_date_;
     end_date = end_date_;
     filters = filters_;
     next_token = next_token_;
   }
    : query_forecast_request)
