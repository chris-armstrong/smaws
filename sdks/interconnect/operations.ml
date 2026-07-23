open Types
open Service_metadata

module UpdateConnection = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_connection_request) =
    let input = Json_serializers.update_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Interconnect.UpdateConnection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_connection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_connection_request) =
    let input = Json_serializers.update_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Interconnect.UpdateConnection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_connection_response_of_yojson
      ~error_deserializer
end

module ListEnvironments = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_environments_request) =
    let input = Json_serializers.list_environments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Interconnect.ListEnvironments" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_environments_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_environments_request) =
    let input = Json_serializers.list_environments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Interconnect.ListEnvironments"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_environments_response_of_yojson
      ~error_deserializer
end

module ListConnections = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_connections_request) =
    let input = Json_serializers.list_connections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Interconnect.ListConnections" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_connections_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_connections_request) =
    let input = Json_serializers.list_connections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Interconnect.ListConnections"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_connections_response_of_yojson
      ~error_deserializer
end

module ListAttachPoints = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_attach_points_request) =
    let input = Json_serializers.list_attach_points_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Interconnect.ListAttachPoints" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_attach_points_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_attach_points_request) =
    let input = Json_serializers.list_attach_points_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Interconnect.ListAttachPoints"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_attach_points_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Interconnect.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Interconnect.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Interconnect.TagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Interconnect.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Interconnect.UntagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Interconnect.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module GetEnvironment = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_environment_request) =
    let input = Json_serializers.get_environment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Interconnect.GetEnvironment" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_environment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_environment_request) =
    let input = Json_serializers.get_environment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Interconnect.GetEnvironment"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_environment_response_of_yojson ~error_deserializer
end

module GetConnection = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_connection_request) =
    let input = Json_serializers.get_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Interconnect.GetConnection" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_connection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_connection_request) =
    let input = Json_serializers.get_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Interconnect.GetConnection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_connection_response_of_yojson ~error_deserializer
end

module DescribeConnectionProposal = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_connection_proposal_request) =
    let input = Json_serializers.describe_connection_proposal_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Interconnect.DescribeConnectionProposal"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_connection_proposal_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_connection_proposal_request) =
    let input = Json_serializers.describe_connection_proposal_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Interconnect.DescribeConnectionProposal" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_connection_proposal_response_of_yojson
      ~error_deserializer
end

module DeleteConnection = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_connection_request) =
    let input = Json_serializers.delete_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Interconnect.DeleteConnection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_connection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_connection_request) =
    let input = Json_serializers.delete_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Interconnect.DeleteConnection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_connection_response_of_yojson
      ~error_deserializer
end

module CreateConnection = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_connection_request) =
    let input = Json_serializers.create_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Interconnect.CreateConnection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_connection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_connection_request) =
    let input = Json_serializers.create_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Interconnect.CreateConnection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_connection_response_of_yojson
      ~error_deserializer
end

module AcceptConnectionProposal = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : accept_connection_proposal_request) =
    let input = Json_serializers.accept_connection_proposal_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Interconnect.AcceptConnectionProposal" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.accept_connection_proposal_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : accept_connection_proposal_request) =
    let input = Json_serializers.accept_connection_proposal_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Interconnect.AcceptConnectionProposal" ~service ~context ~input
      ~output_deserializer:Json_deserializers.accept_connection_proposal_response_of_yojson
      ~error_deserializer
end
