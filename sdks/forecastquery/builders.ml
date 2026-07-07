open Types

let make_data_point ?value:(value_ : double option) ?timestamp:(timestamp_ : timestamp option) () =
  ({ value = value_; timestamp = timestamp_ } : data_point)

let make_forecast ?predictions:(predictions_ : predictions option) () =
  ({ predictions = predictions_ } : forecast)

let make_query_what_if_forecast_response ?forecast:(forecast_ : forecast option) () =
  ({ forecast = forecast_ } : query_what_if_forecast_response)

let make_query_what_if_forecast_request ?next_token:(next_token_ : next_token option)
    ?end_date:(end_date_ : date_time option) ?start_date:(start_date_ : date_time option)
    ~filters:(filters_ : filters) ~what_if_forecast_arn:(what_if_forecast_arn_ : long_arn) () =
  ({
     next_token = next_token_;
     filters = filters_;
     end_date = end_date_;
     start_date = start_date_;
     what_if_forecast_arn = what_if_forecast_arn_;
   }
    : query_what_if_forecast_request)

let make_query_forecast_response ?forecast:(forecast_ : forecast option) () =
  ({ forecast = forecast_ } : query_forecast_response)

let make_query_forecast_request ?next_token:(next_token_ : next_token option)
    ?end_date:(end_date_ : date_time option) ?start_date:(start_date_ : date_time option)
    ~filters:(filters_ : filters) ~forecast_arn:(forecast_arn_ : arn) () =
  ({
     next_token = next_token_;
     filters = filters_;
     end_date = end_date_;
     start_date = start_date_;
     forecast_arn = forecast_arn_;
   }
    : query_forecast_request)
