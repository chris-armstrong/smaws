open Smaws_Lib.Json.DeserializeHelpers
open Types

let string__of_yojson = string_of_yojson

let invalid_resource_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     resource_type = option_of_yojson (value_for_key string__of_yojson "ResourceType") _list path;
   }
    : invalid_resource_exception)

let update_long_term_pricing_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let java_boolean_of_yojson = bool_of_yojson
let job_id_of_yojson = string_of_yojson
let long_term_pricing_id_of_yojson = string_of_yojson

let update_long_term_pricing_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     long_term_pricing_id =
       value_for_key long_term_pricing_id_of_yojson "LongTermPricingId" _list path;
     replacement_job = option_of_yojson (value_for_key job_id_of_yojson "ReplacementJob") _list path;
     is_long_term_pricing_auto_renew =
       option_of_yojson
         (value_for_key java_boolean_of_yojson "IsLongTermPricingAutoRenew")
         _list path;
   }
    : update_long_term_pricing_request)

let invalid_job_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_job_state_exception)

let update_job_shipment_state_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let shipment_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "RECEIVED" -> RECEIVED
    | `String "RETURNED" -> RETURNED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ShipmentState" value)
    | _ -> raise (deserialize_wrong_type_error path "ShipmentState")
     : shipment_state)
    : shipment_state)

let update_job_shipment_state_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
     shipment_state = value_for_key shipment_state_of_yojson "ShipmentState" _list path;
   }
    : update_job_shipment_state_request)

let kms_request_failed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : kms_request_failed_exception)

let invalid_input_combination_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_input_combination_exception)

let ec2_request_failed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : ec2_request_failed_exception)

let cluster_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : cluster_limit_exceeded_exception)

let update_job_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let device_pickup_id_of_yojson = string_of_yojson
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let email_of_yojson = string_of_yojson
let phone_number_of_yojson = string_of_yojson

let pickup_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     phone_number = option_of_yojson (value_for_key phone_number_of_yojson "PhoneNumber") _list path;
     email = option_of_yojson (value_for_key email_of_yojson "Email") _list path;
     identification_number =
       option_of_yojson (value_for_key string__of_yojson "IdentificationNumber") _list path;
     identification_expiration_date =
       option_of_yojson
         (value_for_key timestamp_of_yojson "IdentificationExpirationDate")
         _list path;
     identification_issuing_org =
       option_of_yojson (value_for_key string__of_yojson "IdentificationIssuingOrg") _list path;
     device_pickup_id =
       option_of_yojson (value_for_key device_pickup_id_of_yojson "DevicePickupId") _list path;
   }
    : pickup_details)

let address_id_of_yojson = string_of_yojson

let snowball_capacity_of_yojson (tree : t) path =
  ((match tree with
    | `String "T50" -> T50
    | `String "T80" -> T80
    | `String "T100" -> T100
    | `String "T42" -> T42
    | `String "T98" -> T98
    | `String "T8" -> T8
    | `String "T14" -> T14
    | `String "T32" -> T32
    | `String "NoPreference" -> NO_PREFERENCE
    | `String "T240" -> T240
    | `String "T13" -> T13
    | `String value -> raise (deserialize_unknown_enum_value_error path "SnowballCapacity" value)
    | _ -> raise (deserialize_wrong_type_error path "SnowballCapacity")
     : snowball_capacity)
    : snowball_capacity)

let shipping_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "SECOND_DAY" -> SECOND_DAY
    | `String "NEXT_DAY" -> NEXT_DAY
    | `String "EXPRESS" -> EXPRESS
    | `String "STANDARD" -> STANDARD
    | `String value -> raise (deserialize_unknown_enum_value_error path "ShippingOption" value)
    | _ -> raise (deserialize_wrong_type_error path "ShippingOption")
     : shipping_option)
    : shipping_option)

let node_fault_tolerance_of_yojson = int_of_yojson
let service_size_of_yojson = int_of_yojson

let storage_unit_of_yojson (tree : t) path =
  ((match tree with
    | `String "TB" -> TB
    | `String value -> raise (deserialize_unknown_enum_value_error path "StorageUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "StorageUnit")
     : storage_unit)
    : storage_unit)

let s3_storage_limit_of_yojson = double_of_yojson

let s3_on_device_service_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     storage_limit =
       option_of_yojson (value_for_key s3_storage_limit_of_yojson "StorageLimit") _list path;
     storage_unit = option_of_yojson (value_for_key storage_unit_of_yojson "StorageUnit") _list path;
     service_size = option_of_yojson (value_for_key service_size_of_yojson "ServiceSize") _list path;
     fault_tolerance =
       option_of_yojson (value_for_key node_fault_tolerance_of_yojson "FaultTolerance") _list path;
   }
    : s3_on_device_service_configuration)

let eks_on_device_service_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kubernetes_version =
       option_of_yojson (value_for_key string__of_yojson "KubernetesVersion") _list path;
     eks_anywhere_version =
       option_of_yojson (value_for_key string__of_yojson "EKSAnywhereVersion") _list path;
   }
    : eks_on_device_service_configuration)

let storage_limit_of_yojson = int_of_yojson

let tgw_on_device_service_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     storage_limit =
       option_of_yojson (value_for_key storage_limit_of_yojson "StorageLimit") _list path;
     storage_unit = option_of_yojson (value_for_key storage_unit_of_yojson "StorageUnit") _list path;
   }
    : tgw_on_device_service_configuration)

let nfs_on_device_service_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     storage_limit =
       option_of_yojson (value_for_key storage_limit_of_yojson "StorageLimit") _list path;
     storage_unit = option_of_yojson (value_for_key storage_unit_of_yojson "StorageUnit") _list path;
   }
    : nfs_on_device_service_configuration)

let on_device_service_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     nfs_on_device_service =
       option_of_yojson
         (value_for_key nfs_on_device_service_configuration_of_yojson "NFSOnDeviceService")
         _list path;
     tgw_on_device_service =
       option_of_yojson
         (value_for_key tgw_on_device_service_configuration_of_yojson "TGWOnDeviceService")
         _list path;
     eks_on_device_service =
       option_of_yojson
         (value_for_key eks_on_device_service_configuration_of_yojson "EKSOnDeviceService")
         _list path;
     s3_on_device_service =
       option_of_yojson
         (value_for_key s3_on_device_service_configuration_of_yojson "S3OnDeviceService")
         _list path;
   }
    : on_device_service_configuration)

let ami_id_of_yojson = string_of_yojson

let ec2_ami_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ami_id = value_for_key ami_id_of_yojson "AmiId" _list path;
     snowball_ami_id = option_of_yojson (value_for_key string__of_yojson "SnowballAmiId") _list path;
   }
    : ec2_ami_resource)

let ec2_ami_resource_list_of_yojson tree path = list_of_yojson ec2_ami_resource_of_yojson tree path
let resource_ar_n_of_yojson = string_of_yojson

let event_trigger_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_resource_ar_n =
       option_of_yojson (value_for_key resource_ar_n_of_yojson "EventResourceARN") _list path;
   }
    : event_trigger_definition)

let event_trigger_definition_list_of_yojson tree path =
  list_of_yojson event_trigger_definition_of_yojson tree path

let lambda_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lambda_arn = option_of_yojson (value_for_key resource_ar_n_of_yojson "LambdaArn") _list path;
     event_triggers =
       option_of_yojson
         (value_for_key event_trigger_definition_list_of_yojson "EventTriggers")
         _list path;
   }
    : lambda_resource)

let lambda_resource_list_of_yojson tree path = list_of_yojson lambda_resource_of_yojson tree path

let transfer_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "IMPORT" -> IMPORT
    | `String "EXPORT" -> EXPORT
    | `String "LOCAL_USE" -> LOCAL_USE
    | `String value -> raise (deserialize_unknown_enum_value_error path "TransferOption" value)
    | _ -> raise (deserialize_wrong_type_error path "TransferOption")
     : transfer_option)
    : transfer_option)

let device_service_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "NFS_ON_DEVICE_SERVICE" -> NFS_ON_DEVICE_SERVICE
    | `String "S3_ON_DEVICE_SERVICE" -> S3_ON_DEVICE_SERVICE
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeviceServiceName" value)
    | _ -> raise (deserialize_wrong_type_error path "DeviceServiceName")
     : device_service_name)
    : device_service_name)

let target_on_device_service_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_name =
       option_of_yojson (value_for_key device_service_name_of_yojson "ServiceName") _list path;
     transfer_option =
       option_of_yojson (value_for_key transfer_option_of_yojson "TransferOption") _list path;
   }
    : target_on_device_service)

let target_on_device_service_list_of_yojson tree path =
  list_of_yojson target_on_device_service_of_yojson tree path

let key_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     begin_marker = option_of_yojson (value_for_key string__of_yojson "BeginMarker") _list path;
     end_marker = option_of_yojson (value_for_key string__of_yojson "EndMarker") _list path;
   }
    : key_range)

let s3_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket_arn = option_of_yojson (value_for_key resource_ar_n_of_yojson "BucketArn") _list path;
     key_range = option_of_yojson (value_for_key key_range_of_yojson "KeyRange") _list path;
     target_on_device_services =
       option_of_yojson
         (value_for_key target_on_device_service_list_of_yojson "TargetOnDeviceServices")
         _list path;
   }
    : s3_resource)

let s3_resource_list_of_yojson tree path = list_of_yojson s3_resource_of_yojson tree path

let job_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_resources =
       option_of_yojson (value_for_key s3_resource_list_of_yojson "S3Resources") _list path;
     lambda_resources =
       option_of_yojson (value_for_key lambda_resource_list_of_yojson "LambdaResources") _list path;
     ec2_ami_resources =
       option_of_yojson (value_for_key ec2_ami_resource_list_of_yojson "Ec2AmiResources") _list path;
   }
    : job_resource)

let sns_topic_ar_n_of_yojson = string_of_yojson
let boolean__of_yojson = bool_of_yojson

let job_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "New" -> NEW
    | `String "PreparingAppliance" -> PREPARING_APPLIANCE
    | `String "PreparingShipment" -> PREPARING_SHIPMENT
    | `String "InTransitToCustomer" -> IN_TRANSIT_TO_CUSTOMER
    | `String "WithCustomer" -> WITH_CUSTOMER
    | `String "InTransitToAWS" -> IN_TRANSIT_TO_AWS
    | `String "WithAWSSortingFacility" -> WITH_AWS_SORTING_FACILITY
    | `String "WithAWS" -> WITH_AWS
    | `String "InProgress" -> IN_PROGRESS
    | `String "Complete" -> COMPLETE
    | `String "Cancelled" -> CANCELLED
    | `String "Listing" -> LISTING
    | `String "Pending" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "JobState" value)
    | _ -> raise (deserialize_wrong_type_error path "JobState")
     : job_state)
    : job_state)

let job_state_list_of_yojson tree path = list_of_yojson job_state_of_yojson tree path

let notification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sns_topic_ar_n =
       option_of_yojson (value_for_key sns_topic_ar_n_of_yojson "SnsTopicARN") _list path;
     job_states_to_notify =
       option_of_yojson (value_for_key job_state_list_of_yojson "JobStatesToNotify") _list path;
     notify_all = option_of_yojson (value_for_key boolean__of_yojson "NotifyAll") _list path;
     device_pickup_sns_topic_ar_n =
       option_of_yojson
         (value_for_key sns_topic_ar_n_of_yojson "DevicePickupSnsTopicARN")
         _list path;
   }
    : notification)

let role_ar_n_of_yojson = string_of_yojson

let update_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     notification =
       option_of_yojson (value_for_key notification_of_yojson "Notification") _list path;
     resources = option_of_yojson (value_for_key job_resource_of_yojson "Resources") _list path;
     on_device_service_configuration =
       option_of_yojson
         (value_for_key on_device_service_configuration_of_yojson "OnDeviceServiceConfiguration")
         _list path;
     address_id = option_of_yojson (value_for_key address_id_of_yojson "AddressId") _list path;
     shipping_option =
       option_of_yojson (value_for_key shipping_option_of_yojson "ShippingOption") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     snowball_capacity_preference =
       option_of_yojson
         (value_for_key snowball_capacity_of_yojson "SnowballCapacityPreference")
         _list path;
     forwarding_address_id =
       option_of_yojson (value_for_key address_id_of_yojson "ForwardingAddressId") _list path;
     pickup_details =
       option_of_yojson (value_for_key pickup_details_of_yojson "PickupDetails") _list path;
   }
    : update_job_request)

let update_cluster_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let cluster_id_of_yojson = string_of_yojson

let update_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     resources = option_of_yojson (value_for_key job_resource_of_yojson "Resources") _list path;
     on_device_service_configuration =
       option_of_yojson
         (value_for_key on_device_service_configuration_of_yojson "OnDeviceServiceConfiguration")
         _list path;
     address_id = option_of_yojson (value_for_key address_id_of_yojson "AddressId") _list path;
     shipping_option =
       option_of_yojson (value_for_key shipping_option_of_yojson "ShippingOption") _list path;
     notification =
       option_of_yojson (value_for_key notification_of_yojson "Notification") _list path;
     forwarding_address_id =
       option_of_yojson (value_for_key address_id_of_yojson "ForwardingAddressId") _list path;
   }
    : update_cluster_request)

let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_next_token_exception)

let service_version_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ version = option_of_yojson (value_for_key string__of_yojson "Version") _list path }
    : service_version)

let service_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "KUBERNETES" -> KUBERNETES
    | `String "EKS_ANYWHERE" -> EKS_ANYWHERE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ServiceName" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceName")
     : service_name)
    : service_name)

let dependent_service_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_name = option_of_yojson (value_for_key service_name_of_yojson "ServiceName") _list path;
     service_version =
       option_of_yojson (value_for_key service_version_of_yojson "ServiceVersion") _list path;
   }
    : dependent_service)

let dependent_service_list_of_yojson tree path =
  list_of_yojson dependent_service_of_yojson tree path

let service_version_list_of_yojson tree path = list_of_yojson service_version_of_yojson tree path

let list_service_versions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_versions = value_for_key service_version_list_of_yojson "ServiceVersions" _list path;
     service_name = value_for_key service_name_of_yojson "ServiceName" _list path;
     dependent_services =
       option_of_yojson
         (value_for_key dependent_service_list_of_yojson "DependentServices")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_service_versions_result)

let list_limit_of_yojson = int_of_yojson

let list_service_versions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_name = value_for_key service_name_of_yojson "ServiceName" _list path;
     dependent_services =
       option_of_yojson
         (value_for_key dependent_service_list_of_yojson "DependentServices")
         _list path;
     max_results = option_of_yojson (value_for_key list_limit_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_service_versions_request)

let address_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CUST_PICKUP" -> CUST_PICKUP
    | `String "AWS_SHIP" -> AWS_SHIP
    | `String value -> raise (deserialize_unknown_enum_value_error path "AddressType" value)
    | _ -> raise (deserialize_wrong_type_error path "AddressType")
     : address_type)
    : address_type)

let address_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     address_id = option_of_yojson (value_for_key address_id_of_yojson "AddressId") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     company = option_of_yojson (value_for_key string__of_yojson "Company") _list path;
     street1 = option_of_yojson (value_for_key string__of_yojson "Street1") _list path;
     street2 = option_of_yojson (value_for_key string__of_yojson "Street2") _list path;
     street3 = option_of_yojson (value_for_key string__of_yojson "Street3") _list path;
     city = option_of_yojson (value_for_key string__of_yojson "City") _list path;
     state_or_province =
       option_of_yojson (value_for_key string__of_yojson "StateOrProvince") _list path;
     prefecture_or_district =
       option_of_yojson (value_for_key string__of_yojson "PrefectureOrDistrict") _list path;
     landmark = option_of_yojson (value_for_key string__of_yojson "Landmark") _list path;
     country = option_of_yojson (value_for_key string__of_yojson "Country") _list path;
     postal_code = option_of_yojson (value_for_key string__of_yojson "PostalCode") _list path;
     phone_number = option_of_yojson (value_for_key string__of_yojson "PhoneNumber") _list path;
     is_restricted = option_of_yojson (value_for_key boolean__of_yojson "IsRestricted") _list path;
     type_ = option_of_yojson (value_for_key address_type_of_yojson "Type") _list path;
   }
    : address)

let address_list_of_yojson tree path = list_of_yojson address_of_yojson tree path

let list_pickup_locations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     addresses = option_of_yojson (value_for_key address_list_of_yojson "Addresses") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_pickup_locations_result)

let list_pickup_locations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key list_limit_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_pickup_locations_request)

let long_term_pricing_associated_job_id_list_of_yojson tree path =
  list_of_yojson job_id_of_yojson tree path

let snowball_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "STANDARD" -> STANDARD
    | `String "EDGE" -> EDGE
    | `String "EDGE_C" -> EDGE_C
    | `String "EDGE_CG" -> EDGE_CG
    | `String "EDGE_S" -> EDGE_S
    | `String "SNC1_HDD" -> SNC1_HDD
    | `String "SNC1_SSD" -> SNC1_SSD
    | `String "V3_5C" -> V3_5C
    | `String "V3_5S" -> V3_5S
    | `String "RACK_5U_C" -> RACK_5U_C
    | `String value -> raise (deserialize_unknown_enum_value_error path "SnowballType" value)
    | _ -> raise (deserialize_wrong_type_error path "SnowballType")
     : snowball_type)
    : snowball_type)

let long_term_pricing_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "OneYear" -> ONE_YEAR
    | `String "ThreeYear" -> THREE_YEAR
    | `String "OneMonth" -> ONE_MONTH
    | `String value -> raise (deserialize_unknown_enum_value_error path "LongTermPricingType" value)
    | _ -> raise (deserialize_wrong_type_error path "LongTermPricingType")
     : long_term_pricing_type)
    : long_term_pricing_type)

let long_term_pricing_list_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     long_term_pricing_id =
       option_of_yojson
         (value_for_key long_term_pricing_id_of_yojson "LongTermPricingId")
         _list path;
     long_term_pricing_end_date =
       option_of_yojson (value_for_key timestamp_of_yojson "LongTermPricingEndDate") _list path;
     long_term_pricing_start_date =
       option_of_yojson (value_for_key timestamp_of_yojson "LongTermPricingStartDate") _list path;
     long_term_pricing_type =
       option_of_yojson
         (value_for_key long_term_pricing_type_of_yojson "LongTermPricingType")
         _list path;
     current_active_job =
       option_of_yojson (value_for_key job_id_of_yojson "CurrentActiveJob") _list path;
     replacement_job = option_of_yojson (value_for_key job_id_of_yojson "ReplacementJob") _list path;
     is_long_term_pricing_auto_renew =
       option_of_yojson
         (value_for_key java_boolean_of_yojson "IsLongTermPricingAutoRenew")
         _list path;
     long_term_pricing_status =
       option_of_yojson (value_for_key string__of_yojson "LongTermPricingStatus") _list path;
     snowball_type =
       option_of_yojson (value_for_key snowball_type_of_yojson "SnowballType") _list path;
     job_ids =
       option_of_yojson
         (value_for_key long_term_pricing_associated_job_id_list_of_yojson "JobIds")
         _list path;
   }
    : long_term_pricing_list_entry)

let long_term_pricing_entry_list_of_yojson tree path =
  list_of_yojson long_term_pricing_list_entry_of_yojson tree path

let list_long_term_pricing_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     long_term_pricing_entries =
       option_of_yojson
         (value_for_key long_term_pricing_entry_list_of_yojson "LongTermPricingEntries")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_long_term_pricing_result)

let list_long_term_pricing_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key list_limit_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_long_term_pricing_request)

let job_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IMPORT" -> IMPORT
    | `String "EXPORT" -> EXPORT
    | `String "LOCAL_USE" -> LOCAL_USE
    | `String value -> raise (deserialize_unknown_enum_value_error path "JobType" value)
    | _ -> raise (deserialize_wrong_type_error path "JobType")
     : job_type)
    : job_type)

let job_list_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key string__of_yojson "JobId") _list path;
     job_state = option_of_yojson (value_for_key job_state_of_yojson "JobState") _list path;
     is_master = option_of_yojson (value_for_key boolean__of_yojson "IsMaster") _list path;
     job_type = option_of_yojson (value_for_key job_type_of_yojson "JobType") _list path;
     snowball_type =
       option_of_yojson (value_for_key snowball_type_of_yojson "SnowballType") _list path;
     creation_date = option_of_yojson (value_for_key timestamp_of_yojson "CreationDate") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
   }
    : job_list_entry)

let job_list_entry_list_of_yojson tree path = list_of_yojson job_list_entry_of_yojson tree path

let list_jobs_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_list_entries =
       option_of_yojson (value_for_key job_list_entry_list_of_yojson "JobListEntries") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_jobs_result)

let list_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key list_limit_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_jobs_request)

let compatible_image_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ami_id = option_of_yojson (value_for_key string__of_yojson "AmiId") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : compatible_image)

let compatible_image_list_of_yojson tree path = list_of_yojson compatible_image_of_yojson tree path

let list_compatible_images_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compatible_images =
       option_of_yojson
         (value_for_key compatible_image_list_of_yojson "CompatibleImages")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_compatible_images_result)

let list_compatible_images_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key list_limit_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_compatible_images_request)

let cluster_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "AwaitingQuorum" -> AWAITING_QUORUM
    | `String "Pending" -> PENDING
    | `String "InUse" -> IN_USE
    | `String "Complete" -> COMPLETE
    | `String "Cancelled" -> CANCELLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ClusterState" value)
    | _ -> raise (deserialize_wrong_type_error path "ClusterState")
     : cluster_state)
    : cluster_state)

let cluster_list_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_id = option_of_yojson (value_for_key string__of_yojson "ClusterId") _list path;
     cluster_state =
       option_of_yojson (value_for_key cluster_state_of_yojson "ClusterState") _list path;
     creation_date = option_of_yojson (value_for_key timestamp_of_yojson "CreationDate") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
   }
    : cluster_list_entry)

let cluster_list_entry_list_of_yojson tree path =
  list_of_yojson cluster_list_entry_of_yojson tree path

let list_clusters_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_list_entries =
       option_of_yojson
         (value_for_key cluster_list_entry_list_of_yojson "ClusterListEntries")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_clusters_result)

let list_clusters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key list_limit_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_clusters_request)

let list_cluster_jobs_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_list_entries =
       option_of_yojson (value_for_key job_list_entry_list_of_yojson "JobListEntries") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_cluster_jobs_result)

let list_cluster_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
     max_results = option_of_yojson (value_for_key list_limit_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_cluster_jobs_request)

let get_software_updates_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ updates_ur_i = option_of_yojson (value_for_key string__of_yojson "UpdatesURI") _list path }
    : get_software_updates_result)

let get_software_updates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path } : get_software_updates_request)

let integer_of_yojson = int_of_yojson

let get_snowball_usage_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snowball_limit = option_of_yojson (value_for_key integer_of_yojson "SnowballLimit") _list path;
     snowballs_in_use =
       option_of_yojson (value_for_key integer_of_yojson "SnowballsInUse") _list path;
   }
    : get_snowball_usage_result)

let get_snowball_usage_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let get_job_unlock_code_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ unlock_code = option_of_yojson (value_for_key string__of_yojson "UnlockCode") _list path }
    : get_job_unlock_code_result)

let get_job_unlock_code_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path } : get_job_unlock_code_request)

let get_job_manifest_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ manifest_ur_i = option_of_yojson (value_for_key string__of_yojson "ManifestURI") _list path }
    : get_job_manifest_result)

let get_job_manifest_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path } : get_job_manifest_request)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conflict_resource =
       option_of_yojson (value_for_key string__of_yojson "ConflictResource") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
   }
    : conflict_exception)

let shipping_label_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "InProgress" -> IN_PROGRESS
    | `String "TimedOut" -> TIMED_OUT
    | `String "Succeeded" -> SUCCEEDED
    | `String "Failed" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ShippingLabelStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ShippingLabelStatus")
     : shipping_label_status)
    : shipping_label_status)

let describe_return_shipping_label_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key shipping_label_status_of_yojson "Status") _list path;
     expiration_date =
       option_of_yojson (value_for_key timestamp_of_yojson "ExpirationDate") _list path;
     return_shipping_label_ur_i =
       option_of_yojson (value_for_key string__of_yojson "ReturnShippingLabelURI") _list path;
   }
    : describe_return_shipping_label_result)

let describe_return_shipping_label_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : describe_return_shipping_label_request)

let impact_level_of_yojson (tree : t) path =
  ((match tree with
    | `String "IL2" -> IL2
    | `String "IL4" -> IL4
    | `String "IL5" -> IL5
    | `String "IL6" -> IL6
    | `String "IL99" -> IL99
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImpactLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "ImpactLevel")
     : impact_level)
    : impact_level)

let remote_management_of_yojson (tree : t) path =
  ((match tree with
    | `String "INSTALLED_ONLY" -> INSTALLED_ONLY
    | `String "INSTALLED_AUTOSTART" -> INSTALLED_AUTOSTART
    | `String "NOT_INSTALLED" -> NOT_INSTALLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RemoteManagement" value)
    | _ -> raise (deserialize_wrong_type_error path "RemoteManagement")
     : remote_management)
    : remote_management)

let wireless_connection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_wifi_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "IsWifiEnabled") _list path;
   }
    : wireless_connection)

let snowcone_device_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     wireless_connection =
       option_of_yojson
         (value_for_key wireless_connection_of_yojson "WirelessConnection")
         _list path;
   }
    : snowcone_device_configuration)

let device_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snowcone_device_configuration =
       option_of_yojson
         (value_for_key snowcone_device_configuration_of_yojson "SnowconeDeviceConfiguration")
         _list path;
   }
    : device_configuration)

let gsti_n_of_yojson = string_of_yojson

let ind_tax_documents_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ gsti_n = option_of_yojson (value_for_key gsti_n_of_yojson "GSTIN") _list path }
    : ind_tax_documents)

let tax_documents_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ in_d = option_of_yojson (value_for_key ind_tax_documents_of_yojson "IND") _list path }
    : tax_documents)

let job_logs_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_completion_report_ur_i =
       option_of_yojson (value_for_key string__of_yojson "JobCompletionReportURI") _list path;
     job_success_log_ur_i =
       option_of_yojson (value_for_key string__of_yojson "JobSuccessLogURI") _list path;
     job_failure_log_ur_i =
       option_of_yojson (value_for_key string__of_yojson "JobFailureLogURI") _list path;
   }
    : job_logs)

let long_of_yojson = long_of_yojson

let data_transfer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bytes_transferred =
       option_of_yojson (value_for_key long_of_yojson "BytesTransferred") _list path;
     objects_transferred =
       option_of_yojson (value_for_key long_of_yojson "ObjectsTransferred") _list path;
     total_bytes = option_of_yojson (value_for_key long_of_yojson "TotalBytes") _list path;
     total_objects = option_of_yojson (value_for_key long_of_yojson "TotalObjects") _list path;
   }
    : data_transfer)

let shipment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     tracking_number =
       option_of_yojson (value_for_key string__of_yojson "TrackingNumber") _list path;
   }
    : shipment)

let shipping_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shipping_option =
       option_of_yojson (value_for_key shipping_option_of_yojson "ShippingOption") _list path;
     inbound_shipment =
       option_of_yojson (value_for_key shipment_of_yojson "InboundShipment") _list path;
     outbound_shipment =
       option_of_yojson (value_for_key shipment_of_yojson "OutboundShipment") _list path;
   }
    : shipping_details)

let kms_key_ar_n_of_yojson = string_of_yojson

let job_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key string__of_yojson "JobId") _list path;
     job_state = option_of_yojson (value_for_key job_state_of_yojson "JobState") _list path;
     job_type = option_of_yojson (value_for_key job_type_of_yojson "JobType") _list path;
     snowball_type =
       option_of_yojson (value_for_key snowball_type_of_yojson "SnowballType") _list path;
     creation_date = option_of_yojson (value_for_key timestamp_of_yojson "CreationDate") _list path;
     resources = option_of_yojson (value_for_key job_resource_of_yojson "Resources") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     kms_key_ar_n = option_of_yojson (value_for_key kms_key_ar_n_of_yojson "KmsKeyARN") _list path;
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     address_id = option_of_yojson (value_for_key address_id_of_yojson "AddressId") _list path;
     shipping_details =
       option_of_yojson (value_for_key shipping_details_of_yojson "ShippingDetails") _list path;
     snowball_capacity_preference =
       option_of_yojson
         (value_for_key snowball_capacity_of_yojson "SnowballCapacityPreference")
         _list path;
     notification =
       option_of_yojson (value_for_key notification_of_yojson "Notification") _list path;
     data_transfer_progress =
       option_of_yojson (value_for_key data_transfer_of_yojson "DataTransferProgress") _list path;
     job_log_info = option_of_yojson (value_for_key job_logs_of_yojson "JobLogInfo") _list path;
     cluster_id = option_of_yojson (value_for_key string__of_yojson "ClusterId") _list path;
     forwarding_address_id =
       option_of_yojson (value_for_key address_id_of_yojson "ForwardingAddressId") _list path;
     tax_documents =
       option_of_yojson (value_for_key tax_documents_of_yojson "TaxDocuments") _list path;
     device_configuration =
       option_of_yojson
         (value_for_key device_configuration_of_yojson "DeviceConfiguration")
         _list path;
     remote_management =
       option_of_yojson (value_for_key remote_management_of_yojson "RemoteManagement") _list path;
     long_term_pricing_id =
       option_of_yojson
         (value_for_key long_term_pricing_id_of_yojson "LongTermPricingId")
         _list path;
     on_device_service_configuration =
       option_of_yojson
         (value_for_key on_device_service_configuration_of_yojson "OnDeviceServiceConfiguration")
         _list path;
     impact_level = option_of_yojson (value_for_key impact_level_of_yojson "ImpactLevel") _list path;
     pickup_details =
       option_of_yojson (value_for_key pickup_details_of_yojson "PickupDetails") _list path;
     snowball_id = option_of_yojson (value_for_key string__of_yojson "SnowballId") _list path;
   }
    : job_metadata)

let job_metadata_list_of_yojson tree path = list_of_yojson job_metadata_of_yojson tree path

let describe_job_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_metadata = option_of_yojson (value_for_key job_metadata_of_yojson "JobMetadata") _list path;
     sub_job_metadata =
       option_of_yojson (value_for_key job_metadata_list_of_yojson "SubJobMetadata") _list path;
   }
    : describe_job_result)

let describe_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path } : describe_job_request)

let cluster_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_id = option_of_yojson (value_for_key string__of_yojson "ClusterId") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     kms_key_ar_n = option_of_yojson (value_for_key kms_key_ar_n_of_yojson "KmsKeyARN") _list path;
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     cluster_state =
       option_of_yojson (value_for_key cluster_state_of_yojson "ClusterState") _list path;
     job_type = option_of_yojson (value_for_key job_type_of_yojson "JobType") _list path;
     snowball_type =
       option_of_yojson (value_for_key snowball_type_of_yojson "SnowballType") _list path;
     creation_date = option_of_yojson (value_for_key timestamp_of_yojson "CreationDate") _list path;
     resources = option_of_yojson (value_for_key job_resource_of_yojson "Resources") _list path;
     address_id = option_of_yojson (value_for_key address_id_of_yojson "AddressId") _list path;
     shipping_option =
       option_of_yojson (value_for_key shipping_option_of_yojson "ShippingOption") _list path;
     notification =
       option_of_yojson (value_for_key notification_of_yojson "Notification") _list path;
     forwarding_address_id =
       option_of_yojson (value_for_key address_id_of_yojson "ForwardingAddressId") _list path;
     tax_documents =
       option_of_yojson (value_for_key tax_documents_of_yojson "TaxDocuments") _list path;
     on_device_service_configuration =
       option_of_yojson
         (value_for_key on_device_service_configuration_of_yojson "OnDeviceServiceConfiguration")
         _list path;
   }
    : cluster_metadata)

let describe_cluster_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_metadata =
       option_of_yojson (value_for_key cluster_metadata_of_yojson "ClusterMetadata") _list path;
   }
    : describe_cluster_result)

let describe_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path }
    : describe_cluster_request)

let describe_addresses_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     addresses = option_of_yojson (value_for_key address_list_of_yojson "Addresses") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_addresses_result)

let describe_addresses_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key list_limit_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_addresses_request)

let describe_address_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ address = option_of_yojson (value_for_key address_of_yojson "Address") _list path }
    : describe_address_result)

let describe_address_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ address_id = value_for_key address_id_of_yojson "AddressId" _list path }
    : describe_address_request)

let return_shipping_label_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : return_shipping_label_already_exists_exception)

let create_return_shipping_label_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = option_of_yojson (value_for_key shipping_label_status_of_yojson "Status") _list path }
    : create_return_shipping_label_result)

let create_return_shipping_label_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
     shipping_option =
       option_of_yojson (value_for_key shipping_option_of_yojson "ShippingOption") _list path;
   }
    : create_return_shipping_label_request)

let create_long_term_pricing_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     long_term_pricing_id =
       option_of_yojson
         (value_for_key long_term_pricing_id_of_yojson "LongTermPricingId")
         _list path;
   }
    : create_long_term_pricing_result)

let create_long_term_pricing_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     long_term_pricing_type =
       value_for_key long_term_pricing_type_of_yojson "LongTermPricingType" _list path;
     is_long_term_pricing_auto_renew =
       option_of_yojson
         (value_for_key java_boolean_of_yojson "IsLongTermPricingAutoRenew")
         _list path;
     snowball_type = value_for_key snowball_type_of_yojson "SnowballType" _list path;
   }
    : create_long_term_pricing_request)

let create_job_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : create_job_result)

let create_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_type = option_of_yojson (value_for_key job_type_of_yojson "JobType") _list path;
     resources = option_of_yojson (value_for_key job_resource_of_yojson "Resources") _list path;
     on_device_service_configuration =
       option_of_yojson
         (value_for_key on_device_service_configuration_of_yojson "OnDeviceServiceConfiguration")
         _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     address_id = option_of_yojson (value_for_key address_id_of_yojson "AddressId") _list path;
     kms_key_ar_n = option_of_yojson (value_for_key kms_key_ar_n_of_yojson "KmsKeyARN") _list path;
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     snowball_capacity_preference =
       option_of_yojson
         (value_for_key snowball_capacity_of_yojson "SnowballCapacityPreference")
         _list path;
     shipping_option =
       option_of_yojson (value_for_key shipping_option_of_yojson "ShippingOption") _list path;
     notification =
       option_of_yojson (value_for_key notification_of_yojson "Notification") _list path;
     cluster_id = option_of_yojson (value_for_key cluster_id_of_yojson "ClusterId") _list path;
     snowball_type =
       option_of_yojson (value_for_key snowball_type_of_yojson "SnowballType") _list path;
     forwarding_address_id =
       option_of_yojson (value_for_key address_id_of_yojson "ForwardingAddressId") _list path;
     tax_documents =
       option_of_yojson (value_for_key tax_documents_of_yojson "TaxDocuments") _list path;
     device_configuration =
       option_of_yojson
         (value_for_key device_configuration_of_yojson "DeviceConfiguration")
         _list path;
     remote_management =
       option_of_yojson (value_for_key remote_management_of_yojson "RemoteManagement") _list path;
     long_term_pricing_id =
       option_of_yojson
         (value_for_key long_term_pricing_id_of_yojson "LongTermPricingId")
         _list path;
     impact_level = option_of_yojson (value_for_key impact_level_of_yojson "ImpactLevel") _list path;
     pickup_details =
       option_of_yojson (value_for_key pickup_details_of_yojson "PickupDetails") _list path;
   }
    : create_job_request)

let create_cluster_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_id = option_of_yojson (value_for_key cluster_id_of_yojson "ClusterId") _list path;
     job_list_entries =
       option_of_yojson (value_for_key job_list_entry_list_of_yojson "JobListEntries") _list path;
   }
    : create_cluster_result)

let long_term_pricing_id_list_of_yojson tree path =
  list_of_yojson long_term_pricing_id_of_yojson tree path

let initial_cluster_size_of_yojson = int_of_yojson

let create_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_type = value_for_key job_type_of_yojson "JobType" _list path;
     resources = option_of_yojson (value_for_key job_resource_of_yojson "Resources") _list path;
     on_device_service_configuration =
       option_of_yojson
         (value_for_key on_device_service_configuration_of_yojson "OnDeviceServiceConfiguration")
         _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     address_id = value_for_key address_id_of_yojson "AddressId" _list path;
     kms_key_ar_n = option_of_yojson (value_for_key kms_key_ar_n_of_yojson "KmsKeyARN") _list path;
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     snowball_type = value_for_key snowball_type_of_yojson "SnowballType" _list path;
     shipping_option = value_for_key shipping_option_of_yojson "ShippingOption" _list path;
     notification =
       option_of_yojson (value_for_key notification_of_yojson "Notification") _list path;
     forwarding_address_id =
       option_of_yojson (value_for_key address_id_of_yojson "ForwardingAddressId") _list path;
     tax_documents =
       option_of_yojson (value_for_key tax_documents_of_yojson "TaxDocuments") _list path;
     remote_management =
       option_of_yojson (value_for_key remote_management_of_yojson "RemoteManagement") _list path;
     initial_cluster_size =
       option_of_yojson
         (value_for_key initial_cluster_size_of_yojson "InitialClusterSize")
         _list path;
     force_create_jobs =
       option_of_yojson (value_for_key boolean__of_yojson "ForceCreateJobs") _list path;
     long_term_pricing_ids =
       option_of_yojson
         (value_for_key long_term_pricing_id_list_of_yojson "LongTermPricingIds")
         _list path;
     snowball_capacity_preference =
       option_of_yojson
         (value_for_key snowball_capacity_of_yojson "SnowballCapacityPreference")
         _list path;
   }
    : create_cluster_request)

let unsupported_address_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : unsupported_address_exception)

let invalid_address_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_address_exception)

let create_address_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ address_id = option_of_yojson (value_for_key string__of_yojson "AddressId") _list path }
    : create_address_result)

let create_address_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ address = value_for_key address_of_yojson "Address" _list path } : create_address_request)

let cancel_job_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let cancel_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path } : cancel_job_request)

let cancel_cluster_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let cancel_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path }
    : cancel_cluster_request)
