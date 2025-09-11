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
end
