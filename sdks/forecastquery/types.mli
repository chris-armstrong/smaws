type nonrec timestamp = string [@@ocaml.doc ""]

type nonrec double = float [@@ocaml.doc ""]

type nonrec data_point = {
  value : double option; [@ocaml.doc "The forecast value.\n"]
  timestamp : timestamp option; [@ocaml.doc "The timestamp of the specific forecast.\n"]
}
[@@ocaml.doc "The forecast value for a specific date. Part of the [Forecast] object.\n"]

type nonrec time_series = data_point list [@@ocaml.doc ""]

type nonrec statistic = string [@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec resource_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "We can't find that resource. Check the information that you've provided and try again.\n"]

type nonrec resource_in_use_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified resource is in use.\n"]

type nonrec predictions = (statistic * time_series) list [@@ocaml.doc ""]

type nonrec forecast = {
  predictions : predictions option;
      [@ocaml.doc
        "The forecast.\n\n\
        \ The {i string} of the string-to-array map is one of the following values:\n\
        \ \n\
        \  {ul\n\
        \        {-  p10\n\
        \            \n\
        \             }\n\
        \        {-  p50\n\
        \            \n\
        \             }\n\
        \        {-  p90\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The default setting is [\\[\"0.1\", \"0.5\", \"0.9\"\\]]. Use the optional \
         [ForecastTypes] parameter of the \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/API_CreateForecast.html}CreateForecast} \
         operation to change the values. The values will vary depending on how this is set, with a \
         minimum of [1] and a maximum of [5.] \n\
        \   "]
}
[@@ocaml.doc
  "Provides information about a forecast. Returned as part of the [QueryForecast] response.\n"]

type nonrec query_what_if_forecast_response = { forecast : forecast option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec long_arn = string [@@ocaml.doc ""]

type nonrec date_time = string [@@ocaml.doc ""]

type nonrec attribute_value = string [@@ocaml.doc ""]

type nonrec attribute_name = string [@@ocaml.doc ""]

type nonrec filters = (attribute_name * attribute_value) list [@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec query_what_if_forecast_request = {
  next_token : next_token option;
      [@ocaml.doc
        "If the result of the previous request was truncated, the response includes a [NextToken]. \
         To retrieve the next set of results, use the token in the next request. Tokens expire \
         after 24 hours.\n"]
  filters : filters;
      [@ocaml.doc
        "The filtering criteria to apply when retrieving the forecast. For example, to get the \
         forecast for [client_21] in the electricity usage dataset, specify the following:\n\n\
        \  [{\"item_id\" : \"client_21\"}] \n\
        \ \n\
        \  To get the full what-if forecast, use the \
         {{:https://docs.aws.amazon.com/en_us/forecast/latest/dg/API_CreateWhatIfForecastExport.html}CreateForecastExportJob} \
         operation.\n\
        \  "]
  end_date : date_time option;
      [@ocaml.doc
        "The end date for the what-if forecast. Specify the date using this format: \
         yyyy-MM-dd'T'HH:mm:ss (ISO 8601 format). For example, 2015-01-01T20:00:00. \n"]
  start_date : date_time option;
      [@ocaml.doc
        "The start date for the what-if forecast. Specify the date using this format: \
         yyyy-MM-dd'T'HH:mm:ss (ISO 8601 format). For example, 2015-01-01T08:00:00.\n"]
  what_if_forecast_arn : long_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the what-if forecast to query.\n"]
}
[@@ocaml.doc ""]

type nonrec limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The limit on the number of requests per second has been exceeded.\n"]

type nonrec invalid_next_token_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The token is not valid. Tokens expire after 24 hours.\n"]

type nonrec invalid_input_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The value is invalid or is too long.\n"]

type nonrec query_forecast_response = { forecast : forecast option [@ocaml.doc "The forecast.\n"] }
[@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec query_forecast_request = {
  next_token : next_token option;
      [@ocaml.doc
        "If the result of the previous request was truncated, the response includes a [NextToken]. \
         To retrieve the next set of results, use the token in the next request. Tokens expire \
         after 24 hours.\n"]
  filters : filters;
      [@ocaml.doc
        "The filtering criteria to apply when retrieving the forecast. For example, to get the \
         forecast for [client_21] in the electricity usage dataset, specify the following:\n\n\
        \  [{\"item_id\" : \"client_21\"}] \n\
        \ \n\
        \  To get the full forecast, use the \
         {{:https://docs.aws.amazon.com/en_us/forecast/latest/dg/API_CreateForecastExportJob.html}CreateForecastExportJob} \
         operation.\n\
        \  "]
  end_date : date_time option;
      [@ocaml.doc
        "The end date for the forecast. Specify the date using this format: yyyy-MM-dd'T'HH:mm:ss \
         (ISO 8601 format). For example, 2015-01-01T20:00:00. \n"]
  start_date : date_time option;
      [@ocaml.doc
        "The start date for the forecast. Specify the date using this format: \
         yyyy-MM-dd'T'HH:mm:ss (ISO 8601 format). For example, 2015-01-01T08:00:00.\n"]
  forecast_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the forecast to query.\n"]
}
[@@ocaml.doc ""]
