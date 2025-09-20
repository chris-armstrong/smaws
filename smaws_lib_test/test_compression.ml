open Smaws_Lib.Compression

let test_body_encoding_to_string () =
  Alcotest.(check string) "gzip encoding string" "gzip" (body_encoding_to_string Gzip)

let test_body_encoding_to_header_value () =
  Alcotest.(check string) "gzip header value" "gzip" (body_encoding_to_header_value Gzip)

let test_compress_gzip_basic () =
  let input = "Hello, World!" in
  let compressed = compress_gzip input in
  (* Basic check that compression produces a different result *)
  Alcotest.(check bool)
    "compression produces different output" false (String.equal input compressed);
  (* Check that result contains gzip magic bytes *)
  Alcotest.(check bool)
    "contains gzip magic bytes" true
    (String.length compressed >= 2
    && Char.code (String.get compressed 0) = 0x1f
    && Char.code (String.get compressed 1) = 0x8b)

let test_compress_gzip_empty () =
  let input = "" in
  let compressed = compress_gzip input in
  (* Check that empty string compression still has gzip headers *)
  Alcotest.(check bool)
    "empty string compression has gzip headers" true
    (String.length compressed >= 2
    && Char.code (String.get compressed 0) = 0x1f
    && Char.code (String.get compressed 1) = 0x8b)

let test_compress_gzip_roundtrip () =
  let input =
    "This is a test string for compression. It should compress well because it has repeating \
     patterns. Repeating patterns. Repeating patterns."
  in
  let compressed = compress_gzip input in
  (* Verify it's actually compressed (should be smaller for repetitive text) *)
  Alcotest.(check bool)
    "compression reduces size" true
    (String.length compressed < String.length input);
  (* Verify gzip headers are present *)
  Alcotest.(check bool)
    "has gzip magic bytes" true
    (String.length compressed >= 2
    && Char.code (String.get compressed 0) = 0x1f
    && Char.code (String.get compressed 1) = 0x8b);

  (* Test that we can decompress it back (using system gzip) *)
  let temp_file = Filename.temp_file "test_decompress" ".gz" in
  let oc = open_out_bin temp_file in
  output_string oc compressed;
  close_out oc;

  let decompressed =
    let ic = Unix.open_process_in ("gunzip -c " ^ temp_file) in
    let result = really_input_string ic (String.length input) in
    let _ = Unix.close_process_in ic in
    result
  in

  Sys.remove temp_file;
  Alcotest.(check string) "roundtrip compression/decompression" input decompressed

let compression_tests =
  [
    ("body_encoding_to_string", `Quick, test_body_encoding_to_string);
    ("body_encoding_to_header_value", `Quick, test_body_encoding_to_header_value);
    ("compress_gzip_basic", `Quick, test_compress_gzip_basic);
    ("compress_gzip_empty", `Quick, test_compress_gzip_empty);
    ("compress_gzip_roundtrip", `Quick, test_compress_gzip_roundtrip);
  ]

let () = Alcotest.run "Compression Tests" [ ("compression", compression_tests) ]
