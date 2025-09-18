module Types = struct
  type unit_ = unit [@@deriving show, eq]
  type short = int [@@deriving show, eq]
  type long = int [@@deriving show, eq]
  type integer = int [@@deriving show, eq]
  type byte = int [@@deriving show, eq]
  type float_ = float [@@deriving show, eq]
  type double = float [@@deriving show, eq]
  type string_ = string [@@deriving show, eq]
  type boolean_ = bool [@@deriving show, eq]
  type char_ = int [@@deriving show, eq]
  type bigint = int64 [@@deriving show, eq]
  type timestamp = CoreTypes.Timestamp.t [@@deriving show, eq]
  type document = CoreTypes.Document.t [@@deriving show, eq]
  type resource = CoreTypes.Resource.t [@@deriving show, eq]
  type blob = Bytes.t [@@deriving show, eq]
  type 'a nullable = 'a CoreTypes.Nullable.t [@@deriving show, eq]
end

module Json_serializers = struct
  let unit__to_yojson = Json.SerializeHelpers.unit_to_yojson
  let short_to_yojson = Json.SerializeHelpers.short_to_yojson
  let long_to_yojson = Json.SerializeHelpers.long_to_yojson
  let integer_to_yojson = Json.SerializeHelpers.int_to_yojson
  let byte_to_yojson = Json.SerializeHelpers.byte_to_yojson
  let float__to_yojson = Json.SerializeHelpers.float_to_yojson
  let double_to_yojson = Json.SerializeHelpers.double_to_yojson
  let string__to_yojson = Json.SerializeHelpers.string_to_yojson
  let boolean__to_yojson = Json.SerializeHelpers.bool_to_yojson
  let char__to_yojson = Json.SerializeHelpers.int_to_yojson
  let bigint_to_yojson = Json.SerializeHelpers.big_int_to_yojson
  let timestamp_to_yojson = Json.SerializeHelpers.timestamp_epoch_seconds_to_yojson
  let document_to_yojson = Json.SerializeHelpers.json_to_yojson
  let blob_to_yojson = Json.SerializeHelpers.blob_to_yojson
end

module Json_deserializers = struct
  let unit__of_yojson = Json.DeserializeHelpers.unit_of_yojson
  let short_of_yojson = Json.DeserializeHelpers.short_of_yojson
  let long_of_yojson = Json.DeserializeHelpers.long_of_yojson
  let integer_of_yojson = Json.DeserializeHelpers.int_of_yojson
  let byte_of_yojson = Json.DeserializeHelpers.byte_of_yojson
  let float__of_yojson = Json.DeserializeHelpers.float_of_yojson
  let double_of_yojson = Json.DeserializeHelpers.double_of_yojson
  let string__of_yojson = Json.DeserializeHelpers.string_of_yojson
  let boolean__of_yojson = Json.DeserializeHelpers.bool_of_yojson
  let char__of_yojson = Json.DeserializeHelpers.int_of_yojson
  let bigint_of_yojson = Json.DeserializeHelpers.big_int_of_yojson
  let timestamp_of_yojson = Json.DeserializeHelpers.timestamp_epoch_seconds_of_yojson
  let document_of_yojson = Json.DeserializeHelpers.json_of_yojson
  let blob_of_yojson = Json.DeserializeHelpers.blob_of_yojson
end
