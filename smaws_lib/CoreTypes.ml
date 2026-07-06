(** Nullable types are like option types, but the serialized representation is null instead of
    `undefined` *)
module Nullable = struct
  type 'a t = Null | Value of 'a [@@deriving show, eq]

  let bind v = Value v
  let map ~f v = match v with Null -> Null | Value v -> Value (f v)
  let value ~default v = match v with Null -> default | Value v -> v
end

module Option = struct
  include Option

  let get_or_exn ~exn o = match o with Some v -> v | None -> raise exn
end

module Document = Yojson.Basic
module Timestamp = Ptime

module Resource = struct
  type t = unit [@@deriving show, eq]
end

module Blob = struct
  type t = bytes

  let of_string s = Bytes.of_string s
  let to_string b = Bytes.to_string b
  let concat b1 b2 = Bytes.concat b1 b2
  let length b = Bytes.length b
  let empty = Bytes.empty
  let sub = Bytes.sub
end

module Int64 = struct
  type t = int64 [@@deriving show, eq]

  let of_int = Int64.of_int
  let to_int = Int64.to_int
  let of_string = Int64.of_string
  let to_string = Int64.to_string
end

(** Big integers backed by zarith so they can exceed the 63-bit OCaml [int] range. *)
module BigInt = struct
  type t = Z.t

  let pp fmt v = Fmt.pf fmt "%s" (Z.to_string v)
  let equal = Z.equal
  let of_string = Z.of_string
  let to_string = Z.to_string
  let of_int = Z.of_int
end

(** Big decimals backed by an arbitrary-precision mantissa and a decimal scale. This preserves >15
    significant digits that would be lost in an OCaml [float]. *)
module BigDecimal = struct
  type t = { mantissa : Z.t; scale : int }

  let of_string s =
    match String.index_opt s '.' with
    | None -> { mantissa = Z.of_string s; scale = 0 }
    | Some idx ->
        let int_part = String.sub s 0 idx in
        let frac_part = String.sub s (idx + 1) (String.length s - idx - 1) in
        let scale = String.length frac_part in
        let raw_mantissa = Z.of_string (int_part ^ frac_part) in
        let mantissa =
          if String.length int_part > 0 && s.[0] = '-' then Z.neg (Z.abs raw_mantissa)
          else raw_mantissa
        in
        { mantissa; scale }

  let to_string { mantissa; scale } =
    let s = Z.to_string (Z.abs mantissa) in
    let neg = Z.lt mantissa Z.zero in
    if scale = 0 then (if neg then "-" else "") ^ s
    else (
      let s =
        if String.length s <= scale then String.make (scale - String.length s + 1) '0' ^ s else s
      in
      let int_len = String.length s - scale in
      let int_part = String.sub s 0 int_len in
      let frac_part = String.sub s int_len scale in
      (if neg then "-" else "") ^ int_part ^ "." ^ frac_part)

  let pp fmt t = Fmt.pf fmt "%s" (to_string t)
  let equal a b = Z.equal a.mantissa b.mantissa && Int.equal a.scale b.scale

  let canonical { mantissa; scale } =
    let rec strip_trailing_zero mantissa scale =
      if scale <= 0 then (mantissa, 0)
      else (
        let mantissa', rem = Z.div_rem mantissa (Z.of_int 10) in
        if Z.equal rem Z.zero then strip_trailing_zero mantissa' (scale - 1) else (mantissa, scale))
    in
    let mantissa, scale = strip_trailing_zero mantissa scale in
    { mantissa; scale }
end
