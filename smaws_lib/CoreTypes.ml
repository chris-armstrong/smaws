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
