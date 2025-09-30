[@@@warning "-33"]

open Http_types

type t = unit

module Response = struct
  type t = Httpcats.response

  let status x =
    let open Httpcats in
    x.status |> Httpcats.Status.to_code

  let headers x =
    let open Httpcats in
    x.headers |> Httpcats.Headers.to_list
end

module Body = struct
  type t = string option

  let to_string x = x
  let drain x = ()
end

let httpcats_error_to_http_failure (error : Httpcats.error) : http_failure =
  match error with
  | `V1 H1.(`Exn e) -> Http_types.HttpException e
  | `V1 H1.(`Malformed_response x) -> Http_types.MalformedResponse x
  | `V1 H1.(`Invalid_response_body_length x) ->
      Http_types.MalformedResponse "Invalid response body length"
  | `V2 H2.(`Exn e) -> Http_types.HttpException e
  | `V2 H2.(`Malformed_response x) -> Http_types.MalformedResponse x
  | `V2 H2.(`Invalid_response_body_length x) ->
      Http_types.MalformedResponse "Invalid response body length"
  | `V2 H2.(`Protocol_error (code, s)) ->
      Http_types.ProtocolError (Fmt.str "%a: %s" H2.Error_code.pp_hum code s)
  | `Protocol x -> Http_types.ProtocolError x
  | `Msg x -> Http_types.ProtocolError x
  | `Exn exn -> Http_types.HttpException exn

let request ~method_ ~uri ?(headers : headers option) ?(body : input_body option) _ :
    (Response.t * Body.t, Http_types.http_failure) result =
  let open Httpcats in
  let headers = headers |> Option.value ~default:[] in
  let headers, body =
    match body with
    | None -> (headers, None)
    | Some (`String body) -> (headers, Some (String body))
    | Some (`Compressed (body, Compression.Gzip)) ->
        (("Content-Encoding", "gzip") :: headers, Some (String body))
    | Some (`Form assoc_list) ->
        ( ("Content-Type", "application/x-www-form-urlencoded") :: headers,
          Some (String (Uri.encoded_of_query assoc_list)) )
    | Some `None -> (headers, None)
  in
  let fn meta request response acc chunk =
    match (acc, chunk) with
    | None, None -> None
    | None, Some chunk -> Some chunk
    | Some acc, None -> Some acc
    | Some acc, Some chunk -> Some (acc ^ chunk)
  in
  let acc : string option = None in
  let uri = Uri.to_string uri in
  let response = Httpcats.request ~meth:method_ ~headers ?body ~fn ~uri acc in
  match response with
  | Ok (response, body) -> Ok (response, body)
  | Error error -> Error (httpcats_error_to_http_failure error)

let make () = ()
