type body_encoding = Gzip [@@deriving show, eq]

let compress_gzip (input : string) : string =
  let temp_file = Filename.temp_file "smaws_compress" ".gz" in
  let gzip_out = Gzip.open_out temp_file in
  let input_bytes = Bytes.of_string input in
  Gzip.output gzip_out input_bytes 0 (Bytes.length input_bytes);
  Gzip.close_out gzip_out;

  let ic = open_in_bin temp_file in
  let length = in_channel_length ic in
  let result = really_input_string ic length in
  close_in ic;
  Sys.remove temp_file;
  result

let body_encoding_to_string = function Gzip -> "gzip"
let body_encoding_to_header_value = function Gzip -> "gzip"
