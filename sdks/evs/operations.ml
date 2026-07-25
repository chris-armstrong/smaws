open Types
open Service_metadata

module UpdateEnvironmentConnector = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.evs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.evs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.evs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_environment_connector_request) =
    let input = Json_serializers.update_environment_connector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonElasticVMwareService.UpdateEnvironmentConnector" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_environment_connector_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_environment_connector_request) =
    let input = Json_serializers.update_environment_connector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.UpdateEnvironmentConnector" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_environment_connector_response_of_yojson
      ~error_deserializer
end

module ListVmEntitlements = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.evs#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.evs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_vm_entitlements_request) =
    let input = Json_serializers.list_vm_entitlements_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonElasticVMwareService.ListVmEntitlements"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_vm_entitlements_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_vm_entitlements_request) =
    let input = Json_serializers.list_vm_entitlements_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.ListVmEntitlements" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_vm_entitlements_response_of_yojson
      ~error_deserializer
end

module ListEnvironments = struct
  let error_to_string = function
    | `ValidationException _ -> "com.amazonaws.evs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_environments_request) =
    let input = Json_serializers.list_environments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonElasticVMwareService.ListEnvironments"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_environments_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_environments_request) =
    let input = Json_serializers.list_environments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.ListEnvironments" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_environments_response_of_yojson
      ~error_deserializer
end

module ListEnvironmentVlans = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.evs#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.evs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_environment_vlans_request) =
    let input = Json_serializers.list_environment_vlans_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonElasticVMwareService.ListEnvironmentVlans" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_environment_vlans_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_environment_vlans_request) =
    let input = Json_serializers.list_environment_vlans_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.ListEnvironmentVlans" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_environment_vlans_response_of_yojson
      ~error_deserializer
end

module ListEnvironmentHosts = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.evs#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.evs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_environment_hosts_request) =
    let input = Json_serializers.list_environment_hosts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonElasticVMwareService.ListEnvironmentHosts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_environment_hosts_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_environment_hosts_request) =
    let input = Json_serializers.list_environment_hosts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.ListEnvironmentHosts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_environment_hosts_response_of_yojson
      ~error_deserializer
end

module ListEnvironmentConnectors = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.evs#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.evs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_environment_connectors_request) =
    let input = Json_serializers.list_environment_connectors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonElasticVMwareService.ListEnvironmentConnectors" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_environment_connectors_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_environment_connectors_request) =
    let input = Json_serializers.list_environment_connectors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.ListEnvironmentConnectors" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_environment_connectors_response_of_yojson
      ~error_deserializer
end

module GetEnvironment = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.evs#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.evs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_environment_request) =
    let input = Json_serializers.get_environment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonElasticVMwareService.GetEnvironment"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_environment_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_environment_request) =
    let input = Json_serializers.get_environment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.GetEnvironment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_environment_response_of_yojson ~error_deserializer
end

module GetDepotUrl = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.evs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.evs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.evs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_depot_url_request) =
    let input = Json_serializers.get_depot_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonElasticVMwareService.GetDepotUrl"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_depot_url_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_depot_url_request) =
    let input = Json_serializers.get_depot_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.GetDepotUrl" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_depot_url_response_of_yojson ~error_deserializer
end

module DisassociateEipFromVlan = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.evs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.evs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.evs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_eip_from_vlan_request) =
    let input = Json_serializers.disassociate_eip_from_vlan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonElasticVMwareService.DisassociateEipFromVlan" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_eip_from_vlan_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_eip_from_vlan_request) =
    let input = Json_serializers.disassociate_eip_from_vlan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.DisassociateEipFromVlan" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_eip_from_vlan_response_of_yojson
      ~error_deserializer
end

module DeleteEnvironmentHost = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.evs#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.evs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_environment_host_request) =
    let input = Json_serializers.delete_environment_host_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonElasticVMwareService.DeleteEnvironmentHost" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_environment_host_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_environment_host_request) =
    let input = Json_serializers.delete_environment_host_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.DeleteEnvironmentHost" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_environment_host_response_of_yojson
      ~error_deserializer
end

module DeleteEnvironmentConnector = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.evs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.evs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.evs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_environment_connector_request) =
    let input = Json_serializers.delete_environment_connector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonElasticVMwareService.DeleteEnvironmentConnector" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_environment_connector_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_environment_connector_request) =
    let input = Json_serializers.delete_environment_connector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.DeleteEnvironmentConnector" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_environment_connector_response_of_yojson
      ~error_deserializer
end

module DeleteEnvironment = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.evs#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.evs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_environment_request) =
    let input = Json_serializers.delete_environment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonElasticVMwareService.DeleteEnvironment"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_environment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_environment_request) =
    let input = Json_serializers.delete_environment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.DeleteEnvironment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_environment_response_of_yojson
      ~error_deserializer
end

module DeleteEntitlement = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.evs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.evs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.evs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_entitlement_request) =
    let input = Json_serializers.delete_entitlement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonElasticVMwareService.DeleteEntitlement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_entitlement_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_entitlement_request) =
    let input = Json_serializers.delete_entitlement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.DeleteEntitlement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_entitlement_response_of_yojson
      ~error_deserializer
end

module CreateEnvironmentHost = struct
  let error_to_string = function
    | `ThrottlingException _ -> "com.amazonaws.evs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.evs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_environment_host_request) =
    let input = Json_serializers.create_environment_host_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonElasticVMwareService.CreateEnvironmentHost" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_environment_host_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_environment_host_request) =
    let input = Json_serializers.create_environment_host_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.CreateEnvironmentHost" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_environment_host_response_of_yojson
      ~error_deserializer
end

module CreateEnvironmentConnector = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.evs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.evs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.evs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_environment_connector_request) =
    let input = Json_serializers.create_environment_connector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonElasticVMwareService.CreateEnvironmentConnector" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_environment_connector_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_environment_connector_request) =
    let input = Json_serializers.create_environment_connector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.CreateEnvironmentConnector" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_environment_connector_response_of_yojson
      ~error_deserializer
end

module CreateEnvironment = struct
  let error_to_string = function
    | `ValidationException _ -> "com.amazonaws.evs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_environment_request) =
    let input = Json_serializers.create_environment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonElasticVMwareService.CreateEnvironment"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_environment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_environment_request) =
    let input = Json_serializers.create_environment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.CreateEnvironment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_environment_response_of_yojson
      ~error_deserializer
end

module CreateEntitlement = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.evs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.evs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.evs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_entitlement_request) =
    let input = Json_serializers.create_entitlement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonElasticVMwareService.CreateEntitlement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_entitlement_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_entitlement_request) =
    let input = Json_serializers.create_entitlement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.CreateEntitlement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_entitlement_response_of_yojson
      ~error_deserializer
end

module AssociateEipToVlan = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.evs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.evs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.evs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_eip_to_vlan_request) =
    let input = Json_serializers.associate_eip_to_vlan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonElasticVMwareService.AssociateEipToVlan"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_eip_to_vlan_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_eip_to_vlan_request) =
    let input = Json_serializers.associate_eip_to_vlan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.AssociateEipToVlan" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_eip_to_vlan_response_of_yojson
      ~error_deserializer
end

module GetVersions = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.evs#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.evs#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_versions_request) =
    let input = Json_serializers.get_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonElasticVMwareService.GetVersions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_versions_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_versions_request) =
    let input = Json_serializers.get_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.GetVersions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_versions_response_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.evs#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonElasticVMwareService.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.evs#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.evs#ServiceQuotaExceededException"
    | `TagPolicyException _ -> "com.amazonaws.evs#TagPolicyException"
    | `TooManyTagsException _ -> "com.amazonaws.evs#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "TagPolicyException" ->
          `TagPolicyException (Json_deserializers.tag_policy_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonElasticVMwareService.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.evs#ResourceNotFoundException"
    | `TagPolicyException _ -> "com.amazonaws.evs#TagPolicyException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TagPolicyException" ->
          `TagPolicyException (Json_deserializers.tag_policy_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonElasticVMwareService.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonElasticVMwareService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end
