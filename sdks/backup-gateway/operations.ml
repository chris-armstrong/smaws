open Types
open Service_metadata

module AssociateGatewayToServer = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_gateway_to_server_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.associate_gateway_to_server_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"BackupOnPremises_v20210101AssociateGatewayToServer" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.associate_gateway_to_server_output_of_yojson
      ~error_deserializer
end

module CreateGateway = struct
  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_gateway_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_gateway_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BackupOnPremises_v20210101CreateGateway"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_gateway_output_of_yojson ~error_deserializer
end

module DeleteGateway = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_gateway_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_gateway_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BackupOnPremises_v20210101DeleteGateway"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_gateway_output_of_yojson ~error_deserializer
end

module DeleteHypervisor = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_hypervisor_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_hypervisor_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BackupOnPremises_v20210101DeleteHypervisor"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_hypervisor_output_of_yojson ~error_deserializer
end

module DisassociateGatewayFromServer = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_gateway_from_server_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.disassociate_gateway_from_server_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"BackupOnPremises_v20210101DisassociateGatewayFromServer" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.disassociate_gateway_from_server_output_of_yojson
      ~error_deserializer
end

module GetBandwidthRateLimitSchedule = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_bandwidth_rate_limit_schedule_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_bandwidth_rate_limit_schedule_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"BackupOnPremises_v20210101GetBandwidthRateLimitSchedule" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_bandwidth_rate_limit_schedule_output_of_yojson
      ~error_deserializer
end

module GetGateway = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_gateway_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_gateway_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BackupOnPremises_v20210101GetGateway" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_gateway_output_of_yojson ~error_deserializer
end

module GetHypervisor = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_hypervisor_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_hypervisor_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BackupOnPremises_v20210101GetHypervisor"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_hypervisor_output_of_yojson ~error_deserializer
end

module GetHypervisorPropertyMappings = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_hypervisor_property_mappings_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_hypervisor_property_mappings_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"BackupOnPremises_v20210101GetHypervisorPropertyMappings" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_hypervisor_property_mappings_output_of_yojson
      ~error_deserializer
end

module GetVirtualMachine = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_virtual_machine_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_virtual_machine_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BackupOnPremises_v20210101GetVirtualMachine"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_virtual_machine_output_of_yojson
      ~error_deserializer
end

module ImportHypervisorConfiguration = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : import_hypervisor_configuration_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.import_hypervisor_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"BackupOnPremises_v20210101ImportHypervisorConfiguration" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.import_hypervisor_configuration_output_of_yojson
      ~error_deserializer
end

module ListGateways = struct
  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_gateways_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_gateways_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BackupOnPremises_v20210101ListGateways"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_gateways_output_of_yojson ~error_deserializer
end

module ListHypervisors = struct
  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_hypervisors_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_hypervisors_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BackupOnPremises_v20210101ListHypervisors"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_hypervisors_output_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BackupOnPremises_v20210101ListTagsForResource"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer
end

module ListVirtualMachines = struct
  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_virtual_machines_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_virtual_machines_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BackupOnPremises_v20210101ListVirtualMachines"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_virtual_machines_output_of_yojson
      ~error_deserializer
end

module PutBandwidthRateLimitSchedule = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_bandwidth_rate_limit_schedule_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.put_bandwidth_rate_limit_schedule_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"BackupOnPremises_v20210101PutBandwidthRateLimitSchedule" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.put_bandwidth_rate_limit_schedule_output_of_yojson
      ~error_deserializer
end

module PutHypervisorPropertyMappings = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_hypervisor_property_mappings_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.put_hypervisor_property_mappings_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"BackupOnPremises_v20210101PutHypervisorPropertyMappings" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.put_hypervisor_property_mappings_output_of_yojson
      ~error_deserializer
end

module PutMaintenanceStartTime = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_maintenance_start_time_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.put_maintenance_start_time_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"BackupOnPremises_v20210101PutMaintenanceStartTime" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.put_maintenance_start_time_output_of_yojson
      ~error_deserializer
end

module StartVirtualMachinesMetadataSync = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_virtual_machines_metadata_sync_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.start_virtual_machines_metadata_sync_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"BackupOnPremises_v20210101StartVirtualMachinesMetadataSync" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.start_virtual_machines_metadata_sync_output_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BackupOnPremises_v20210101TagResource" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.tag_resource_output_of_yojson ~error_deserializer
end

module TestHypervisorConfiguration = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : test_hypervisor_configuration_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.test_hypervisor_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"BackupOnPremises_v20210101TestHypervisorConfiguration" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.test_hypervisor_configuration_output_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BackupOnPremises_v20210101UntagResource"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.untag_resource_output_of_yojson ~error_deserializer
end

module UpdateGatewayInformation = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_gateway_information_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_gateway_information_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"BackupOnPremises_v20210101UpdateGatewayInformation" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_gateway_information_output_of_yojson
      ~error_deserializer
end

module UpdateGatewaySoftwareNow = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_gateway_software_now_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_gateway_software_now_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"BackupOnPremises_v20210101UpdateGatewaySoftwareNow" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_gateway_software_now_output_of_yojson
      ~error_deserializer
end

module UpdateHypervisor = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_hypervisor_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_hypervisor_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"BackupOnPremises_v20210101UpdateHypervisor"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_hypervisor_output_of_yojson ~error_deserializer
end
