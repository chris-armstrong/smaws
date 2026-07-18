open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_greeting_struct :
  ?hi:Smaws_Lib.Smithy_api.Types.string_ -> unit -> greeting_struct
(** {1:Serialization and Deserialization} *)

module Query_serializers = Query_serializers
module Query_deserializers = Query_deserializers
module Xml_serializers = Xml_serializers
module Xml_deserializers = Xml_deserializers
module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
