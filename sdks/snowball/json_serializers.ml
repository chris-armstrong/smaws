open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson

let invalid_resource_exception_to_yojson (x : invalid_resource_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
    ]

let update_long_term_pricing_result_to_yojson = unit_to_yojson
let java_boolean_to_yojson = bool_to_yojson
let job_id_to_yojson = string_to_yojson
let long_term_pricing_id_to_yojson = string_to_yojson

let update_long_term_pricing_request_to_yojson (x : update_long_term_pricing_request) =
  assoc_to_yojson
    [
      ("LongTermPricingId", Some (long_term_pricing_id_to_yojson x.long_term_pricing_id));
      ("ReplacementJob", option_to_yojson job_id_to_yojson x.replacement_job);
      ( "IsLongTermPricingAutoRenew",
        option_to_yojson java_boolean_to_yojson x.is_long_term_pricing_auto_renew );
    ]

let invalid_job_state_exception_to_yojson (x : invalid_job_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let update_job_shipment_state_result_to_yojson = unit_to_yojson

let shipment_state_to_yojson (x : shipment_state) =
  match x with RECEIVED -> `String "RECEIVED" | RETURNED -> `String "RETURNED"

let update_job_shipment_state_request_to_yojson (x : update_job_shipment_state_request) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("ShipmentState", Some (shipment_state_to_yojson x.shipment_state));
    ]

let kms_request_failed_exception_to_yojson (x : kms_request_failed_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_input_combination_exception_to_yojson (x : invalid_input_combination_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let ec2_request_failed_exception_to_yojson (x : ec2_request_failed_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let cluster_limit_exceeded_exception_to_yojson (x : cluster_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let update_job_result_to_yojson = unit_to_yojson
let device_pickup_id_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let email_to_yojson = string_to_yojson
let phone_number_to_yojson = string_to_yojson

let pickup_details_to_yojson (x : pickup_details) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("PhoneNumber", option_to_yojson phone_number_to_yojson x.phone_number);
      ("Email", option_to_yojson email_to_yojson x.email);
      ("IdentificationNumber", option_to_yojson string__to_yojson x.identification_number);
      ( "IdentificationExpirationDate",
        option_to_yojson timestamp_to_yojson x.identification_expiration_date );
      ("IdentificationIssuingOrg", option_to_yojson string__to_yojson x.identification_issuing_org);
      ("DevicePickupId", option_to_yojson device_pickup_id_to_yojson x.device_pickup_id);
    ]

let address_id_to_yojson = string_to_yojson

let snowball_capacity_to_yojson (x : snowball_capacity) =
  match x with
  | T50 -> `String "T50"
  | T80 -> `String "T80"
  | T100 -> `String "T100"
  | T42 -> `String "T42"
  | T98 -> `String "T98"
  | T8 -> `String "T8"
  | T14 -> `String "T14"
  | T32 -> `String "T32"
  | NO_PREFERENCE -> `String "NoPreference"
  | T240 -> `String "T240"
  | T13 -> `String "T13"

let shipping_option_to_yojson (x : shipping_option) =
  match x with
  | SECOND_DAY -> `String "SECOND_DAY"
  | NEXT_DAY -> `String "NEXT_DAY"
  | EXPRESS -> `String "EXPRESS"
  | STANDARD -> `String "STANDARD"

let node_fault_tolerance_to_yojson = int_to_yojson
let service_size_to_yojson = int_to_yojson
let storage_unit_to_yojson (x : storage_unit) = match x with TB -> `String "TB"
let s3_storage_limit_to_yojson = double_to_yojson

let s3_on_device_service_configuration_to_yojson (x : s3_on_device_service_configuration) =
  assoc_to_yojson
    [
      ("StorageLimit", option_to_yojson s3_storage_limit_to_yojson x.storage_limit);
      ("StorageUnit", option_to_yojson storage_unit_to_yojson x.storage_unit);
      ("ServiceSize", option_to_yojson service_size_to_yojson x.service_size);
      ("FaultTolerance", option_to_yojson node_fault_tolerance_to_yojson x.fault_tolerance);
    ]

let eks_on_device_service_configuration_to_yojson (x : eks_on_device_service_configuration) =
  assoc_to_yojson
    [
      ("KubernetesVersion", option_to_yojson string__to_yojson x.kubernetes_version);
      ("EKSAnywhereVersion", option_to_yojson string__to_yojson x.eks_anywhere_version);
    ]

let storage_limit_to_yojson = int_to_yojson

let tgw_on_device_service_configuration_to_yojson (x : tgw_on_device_service_configuration) =
  assoc_to_yojson
    [
      ("StorageLimit", option_to_yojson storage_limit_to_yojson x.storage_limit);
      ("StorageUnit", option_to_yojson storage_unit_to_yojson x.storage_unit);
    ]

let nfs_on_device_service_configuration_to_yojson (x : nfs_on_device_service_configuration) =
  assoc_to_yojson
    [
      ("StorageLimit", option_to_yojson storage_limit_to_yojson x.storage_limit);
      ("StorageUnit", option_to_yojson storage_unit_to_yojson x.storage_unit);
    ]

let on_device_service_configuration_to_yojson (x : on_device_service_configuration) =
  assoc_to_yojson
    [
      ( "NFSOnDeviceService",
        option_to_yojson nfs_on_device_service_configuration_to_yojson x.nfs_on_device_service );
      ( "TGWOnDeviceService",
        option_to_yojson tgw_on_device_service_configuration_to_yojson x.tgw_on_device_service );
      ( "EKSOnDeviceService",
        option_to_yojson eks_on_device_service_configuration_to_yojson x.eks_on_device_service );
      ( "S3OnDeviceService",
        option_to_yojson s3_on_device_service_configuration_to_yojson x.s3_on_device_service );
    ]

let ami_id_to_yojson = string_to_yojson

let ec2_ami_resource_to_yojson (x : ec2_ami_resource) =
  assoc_to_yojson
    [
      ("AmiId", Some (ami_id_to_yojson x.ami_id));
      ("SnowballAmiId", option_to_yojson string__to_yojson x.snowball_ami_id);
    ]

let ec2_ami_resource_list_to_yojson tree = list_to_yojson ec2_ami_resource_to_yojson tree
let resource_ar_n_to_yojson = string_to_yojson

let event_trigger_definition_to_yojson (x : event_trigger_definition) =
  assoc_to_yojson
    [ ("EventResourceARN", option_to_yojson resource_ar_n_to_yojson x.event_resource_ar_n) ]

let event_trigger_definition_list_to_yojson tree =
  list_to_yojson event_trigger_definition_to_yojson tree

let lambda_resource_to_yojson (x : lambda_resource) =
  assoc_to_yojson
    [
      ("LambdaArn", option_to_yojson resource_ar_n_to_yojson x.lambda_arn);
      ("EventTriggers", option_to_yojson event_trigger_definition_list_to_yojson x.event_triggers);
    ]

let lambda_resource_list_to_yojson tree = list_to_yojson lambda_resource_to_yojson tree

let transfer_option_to_yojson (x : transfer_option) =
  match x with
  | IMPORT -> `String "IMPORT"
  | EXPORT -> `String "EXPORT"
  | LOCAL_USE -> `String "LOCAL_USE"

let device_service_name_to_yojson (x : device_service_name) =
  match x with
  | NFS_ON_DEVICE_SERVICE -> `String "NFS_ON_DEVICE_SERVICE"
  | S3_ON_DEVICE_SERVICE -> `String "S3_ON_DEVICE_SERVICE"

let target_on_device_service_to_yojson (x : target_on_device_service) =
  assoc_to_yojson
    [
      ("ServiceName", option_to_yojson device_service_name_to_yojson x.service_name);
      ("TransferOption", option_to_yojson transfer_option_to_yojson x.transfer_option);
    ]

let target_on_device_service_list_to_yojson tree =
  list_to_yojson target_on_device_service_to_yojson tree

let key_range_to_yojson (x : key_range) =
  assoc_to_yojson
    [
      ("BeginMarker", option_to_yojson string__to_yojson x.begin_marker);
      ("EndMarker", option_to_yojson string__to_yojson x.end_marker);
    ]

let s3_resource_to_yojson (x : s3_resource) =
  assoc_to_yojson
    [
      ("BucketArn", option_to_yojson resource_ar_n_to_yojson x.bucket_arn);
      ("KeyRange", option_to_yojson key_range_to_yojson x.key_range);
      ( "TargetOnDeviceServices",
        option_to_yojson target_on_device_service_list_to_yojson x.target_on_device_services );
    ]

let s3_resource_list_to_yojson tree = list_to_yojson s3_resource_to_yojson tree

let job_resource_to_yojson (x : job_resource) =
  assoc_to_yojson
    [
      ("S3Resources", option_to_yojson s3_resource_list_to_yojson x.s3_resources);
      ("LambdaResources", option_to_yojson lambda_resource_list_to_yojson x.lambda_resources);
      ("Ec2AmiResources", option_to_yojson ec2_ami_resource_list_to_yojson x.ec2_ami_resources);
    ]

let sns_topic_ar_n_to_yojson = string_to_yojson
let boolean__to_yojson = bool_to_yojson

let job_state_to_yojson (x : job_state) =
  match x with
  | NEW -> `String "New"
  | PREPARING_APPLIANCE -> `String "PreparingAppliance"
  | PREPARING_SHIPMENT -> `String "PreparingShipment"
  | IN_TRANSIT_TO_CUSTOMER -> `String "InTransitToCustomer"
  | WITH_CUSTOMER -> `String "WithCustomer"
  | IN_TRANSIT_TO_AWS -> `String "InTransitToAWS"
  | WITH_AWS_SORTING_FACILITY -> `String "WithAWSSortingFacility"
  | WITH_AWS -> `String "WithAWS"
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETE -> `String "Complete"
  | CANCELLED -> `String "Cancelled"
  | LISTING -> `String "Listing"
  | PENDING -> `String "Pending"

let job_state_list_to_yojson tree = list_to_yojson job_state_to_yojson tree

let notification_to_yojson (x : notification) =
  assoc_to_yojson
    [
      ("SnsTopicARN", option_to_yojson sns_topic_ar_n_to_yojson x.sns_topic_ar_n);
      ("JobStatesToNotify", option_to_yojson job_state_list_to_yojson x.job_states_to_notify);
      ("NotifyAll", option_to_yojson boolean__to_yojson x.notify_all);
      ( "DevicePickupSnsTopicARN",
        option_to_yojson sns_topic_ar_n_to_yojson x.device_pickup_sns_topic_ar_n );
    ]

let role_ar_n_to_yojson = string_to_yojson

let update_job_request_to_yojson (x : update_job_request) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("Notification", option_to_yojson notification_to_yojson x.notification);
      ("Resources", option_to_yojson job_resource_to_yojson x.resources);
      ( "OnDeviceServiceConfiguration",
        option_to_yojson on_device_service_configuration_to_yojson x.on_device_service_configuration
      );
      ("AddressId", option_to_yojson address_id_to_yojson x.address_id);
      ("ShippingOption", option_to_yojson shipping_option_to_yojson x.shipping_option);
      ("Description", option_to_yojson string__to_yojson x.description);
      ( "SnowballCapacityPreference",
        option_to_yojson snowball_capacity_to_yojson x.snowball_capacity_preference );
      ("ForwardingAddressId", option_to_yojson address_id_to_yojson x.forwarding_address_id);
      ("PickupDetails", option_to_yojson pickup_details_to_yojson x.pickup_details);
    ]

let update_cluster_result_to_yojson = unit_to_yojson
let cluster_id_to_yojson = string_to_yojson

let update_cluster_request_to_yojson (x : update_cluster_request) =
  assoc_to_yojson
    [
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Resources", option_to_yojson job_resource_to_yojson x.resources);
      ( "OnDeviceServiceConfiguration",
        option_to_yojson on_device_service_configuration_to_yojson x.on_device_service_configuration
      );
      ("AddressId", option_to_yojson address_id_to_yojson x.address_id);
      ("ShippingOption", option_to_yojson shipping_option_to_yojson x.shipping_option);
      ("Notification", option_to_yojson notification_to_yojson x.notification);
      ("ForwardingAddressId", option_to_yojson address_id_to_yojson x.forwarding_address_id);
    ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let service_version_to_yojson (x : service_version) =
  assoc_to_yojson [ ("Version", option_to_yojson string__to_yojson x.version) ]

let service_name_to_yojson (x : service_name) =
  match x with KUBERNETES -> `String "KUBERNETES" | EKS_ANYWHERE -> `String "EKS_ANYWHERE"

let dependent_service_to_yojson (x : dependent_service) =
  assoc_to_yojson
    [
      ("ServiceName", option_to_yojson service_name_to_yojson x.service_name);
      ("ServiceVersion", option_to_yojson service_version_to_yojson x.service_version);
    ]

let dependent_service_list_to_yojson tree = list_to_yojson dependent_service_to_yojson tree
let service_version_list_to_yojson tree = list_to_yojson service_version_to_yojson tree

let list_service_versions_result_to_yojson (x : list_service_versions_result) =
  assoc_to_yojson
    [
      ("ServiceVersions", Some (service_version_list_to_yojson x.service_versions));
      ("ServiceName", Some (service_name_to_yojson x.service_name));
      ("DependentServices", option_to_yojson dependent_service_list_to_yojson x.dependent_services);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_limit_to_yojson = int_to_yojson

let list_service_versions_request_to_yojson (x : list_service_versions_request) =
  assoc_to_yojson
    [
      ("ServiceName", Some (service_name_to_yojson x.service_name));
      ("DependentServices", option_to_yojson dependent_service_list_to_yojson x.dependent_services);
      ("MaxResults", option_to_yojson list_limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let address_type_to_yojson (x : address_type) =
  match x with CUST_PICKUP -> `String "CUST_PICKUP" | AWS_SHIP -> `String "AWS_SHIP"

let address_to_yojson (x : address) =
  assoc_to_yojson
    [
      ("AddressId", option_to_yojson address_id_to_yojson x.address_id);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Company", option_to_yojson string__to_yojson x.company);
      ("Street1", option_to_yojson string__to_yojson x.street1);
      ("Street2", option_to_yojson string__to_yojson x.street2);
      ("Street3", option_to_yojson string__to_yojson x.street3);
      ("City", option_to_yojson string__to_yojson x.city);
      ("StateOrProvince", option_to_yojson string__to_yojson x.state_or_province);
      ("PrefectureOrDistrict", option_to_yojson string__to_yojson x.prefecture_or_district);
      ("Landmark", option_to_yojson string__to_yojson x.landmark);
      ("Country", option_to_yojson string__to_yojson x.country);
      ("PostalCode", option_to_yojson string__to_yojson x.postal_code);
      ("PhoneNumber", option_to_yojson string__to_yojson x.phone_number);
      ("IsRestricted", option_to_yojson boolean__to_yojson x.is_restricted);
      ("Type", option_to_yojson address_type_to_yojson x.type_);
    ]

let address_list_to_yojson tree = list_to_yojson address_to_yojson tree

let list_pickup_locations_result_to_yojson (x : list_pickup_locations_result) =
  assoc_to_yojson
    [
      ("Addresses", option_to_yojson address_list_to_yojson x.addresses);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_pickup_locations_request_to_yojson (x : list_pickup_locations_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson list_limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let long_term_pricing_associated_job_id_list_to_yojson tree = list_to_yojson job_id_to_yojson tree

let snowball_type_to_yojson (x : snowball_type) =
  match x with
  | STANDARD -> `String "STANDARD"
  | EDGE -> `String "EDGE"
  | EDGE_C -> `String "EDGE_C"
  | EDGE_CG -> `String "EDGE_CG"
  | EDGE_S -> `String "EDGE_S"
  | SNC1_HDD -> `String "SNC1_HDD"
  | SNC1_SSD -> `String "SNC1_SSD"
  | V3_5C -> `String "V3_5C"
  | V3_5S -> `String "V3_5S"
  | RACK_5U_C -> `String "RACK_5U_C"

let long_term_pricing_type_to_yojson (x : long_term_pricing_type) =
  match x with
  | ONE_YEAR -> `String "OneYear"
  | THREE_YEAR -> `String "ThreeYear"
  | ONE_MONTH -> `String "OneMonth"

let long_term_pricing_list_entry_to_yojson (x : long_term_pricing_list_entry) =
  assoc_to_yojson
    [
      ("LongTermPricingId", option_to_yojson long_term_pricing_id_to_yojson x.long_term_pricing_id);
      ("LongTermPricingEndDate", option_to_yojson timestamp_to_yojson x.long_term_pricing_end_date);
      ( "LongTermPricingStartDate",
        option_to_yojson timestamp_to_yojson x.long_term_pricing_start_date );
      ( "LongTermPricingType",
        option_to_yojson long_term_pricing_type_to_yojson x.long_term_pricing_type );
      ("CurrentActiveJob", option_to_yojson job_id_to_yojson x.current_active_job);
      ("ReplacementJob", option_to_yojson job_id_to_yojson x.replacement_job);
      ( "IsLongTermPricingAutoRenew",
        option_to_yojson java_boolean_to_yojson x.is_long_term_pricing_auto_renew );
      ("LongTermPricingStatus", option_to_yojson string__to_yojson x.long_term_pricing_status);
      ("SnowballType", option_to_yojson snowball_type_to_yojson x.snowball_type);
      ("JobIds", option_to_yojson long_term_pricing_associated_job_id_list_to_yojson x.job_ids);
    ]

let long_term_pricing_entry_list_to_yojson tree =
  list_to_yojson long_term_pricing_list_entry_to_yojson tree

let list_long_term_pricing_result_to_yojson (x : list_long_term_pricing_result) =
  assoc_to_yojson
    [
      ( "LongTermPricingEntries",
        option_to_yojson long_term_pricing_entry_list_to_yojson x.long_term_pricing_entries );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_long_term_pricing_request_to_yojson (x : list_long_term_pricing_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson list_limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let job_type_to_yojson (x : job_type) =
  match x with
  | IMPORT -> `String "IMPORT"
  | EXPORT -> `String "EXPORT"
  | LOCAL_USE -> `String "LOCAL_USE"

let job_list_entry_to_yojson (x : job_list_entry) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson string__to_yojson x.job_id);
      ("JobState", option_to_yojson job_state_to_yojson x.job_state);
      ("IsMaster", option_to_yojson boolean__to_yojson x.is_master);
      ("JobType", option_to_yojson job_type_to_yojson x.job_type);
      ("SnowballType", option_to_yojson snowball_type_to_yojson x.snowball_type);
      ("CreationDate", option_to_yojson timestamp_to_yojson x.creation_date);
      ("Description", option_to_yojson string__to_yojson x.description);
    ]

let job_list_entry_list_to_yojson tree = list_to_yojson job_list_entry_to_yojson tree

let list_jobs_result_to_yojson (x : list_jobs_result) =
  assoc_to_yojson
    [
      ("JobListEntries", option_to_yojson job_list_entry_list_to_yojson x.job_list_entries);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_jobs_request_to_yojson (x : list_jobs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson list_limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let compatible_image_to_yojson (x : compatible_image) =
  assoc_to_yojson
    [
      ("AmiId", option_to_yojson string__to_yojson x.ami_id);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let compatible_image_list_to_yojson tree = list_to_yojson compatible_image_to_yojson tree

let list_compatible_images_result_to_yojson (x : list_compatible_images_result) =
  assoc_to_yojson
    [
      ("CompatibleImages", option_to_yojson compatible_image_list_to_yojson x.compatible_images);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_compatible_images_request_to_yojson (x : list_compatible_images_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson list_limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let cluster_state_to_yojson (x : cluster_state) =
  match x with
  | AWAITING_QUORUM -> `String "AwaitingQuorum"
  | PENDING -> `String "Pending"
  | IN_USE -> `String "InUse"
  | COMPLETE -> `String "Complete"
  | CANCELLED -> `String "Cancelled"

let cluster_list_entry_to_yojson (x : cluster_list_entry) =
  assoc_to_yojson
    [
      ("ClusterId", option_to_yojson string__to_yojson x.cluster_id);
      ("ClusterState", option_to_yojson cluster_state_to_yojson x.cluster_state);
      ("CreationDate", option_to_yojson timestamp_to_yojson x.creation_date);
      ("Description", option_to_yojson string__to_yojson x.description);
    ]

let cluster_list_entry_list_to_yojson tree = list_to_yojson cluster_list_entry_to_yojson tree

let list_clusters_result_to_yojson (x : list_clusters_result) =
  assoc_to_yojson
    [
      ( "ClusterListEntries",
        option_to_yojson cluster_list_entry_list_to_yojson x.cluster_list_entries );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_clusters_request_to_yojson (x : list_clusters_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson list_limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_cluster_jobs_result_to_yojson (x : list_cluster_jobs_result) =
  assoc_to_yojson
    [
      ("JobListEntries", option_to_yojson job_list_entry_list_to_yojson x.job_list_entries);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_cluster_jobs_request_to_yojson (x : list_cluster_jobs_request) =
  assoc_to_yojson
    [
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("MaxResults", option_to_yojson list_limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let get_software_updates_result_to_yojson (x : get_software_updates_result) =
  assoc_to_yojson [ ("UpdatesURI", option_to_yojson string__to_yojson x.updates_ur_i) ]

let get_software_updates_request_to_yojson (x : get_software_updates_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let integer_to_yojson = int_to_yojson

let get_snowball_usage_result_to_yojson (x : get_snowball_usage_result) =
  assoc_to_yojson
    [
      ("SnowballLimit", option_to_yojson integer_to_yojson x.snowball_limit);
      ("SnowballsInUse", option_to_yojson integer_to_yojson x.snowballs_in_use);
    ]

let get_snowball_usage_request_to_yojson = unit_to_yojson

let get_job_unlock_code_result_to_yojson (x : get_job_unlock_code_result) =
  assoc_to_yojson [ ("UnlockCode", option_to_yojson string__to_yojson x.unlock_code) ]

let get_job_unlock_code_request_to_yojson (x : get_job_unlock_code_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let get_job_manifest_result_to_yojson (x : get_job_manifest_result) =
  assoc_to_yojson [ ("ManifestURI", option_to_yojson string__to_yojson x.manifest_ur_i) ]

let get_job_manifest_request_to_yojson (x : get_job_manifest_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("ConflictResource", option_to_yojson string__to_yojson x.conflict_resource);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let shipping_label_status_to_yojson (x : shipping_label_status) =
  match x with
  | IN_PROGRESS -> `String "InProgress"
  | TIMED_OUT -> `String "TimedOut"
  | SUCCEEDED -> `String "Succeeded"
  | FAILED -> `String "Failed"

let describe_return_shipping_label_result_to_yojson (x : describe_return_shipping_label_result) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson shipping_label_status_to_yojson x.status);
      ("ExpirationDate", option_to_yojson timestamp_to_yojson x.expiration_date);
      ("ReturnShippingLabelURI", option_to_yojson string__to_yojson x.return_shipping_label_ur_i);
    ]

let describe_return_shipping_label_request_to_yojson (x : describe_return_shipping_label_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let impact_level_to_yojson (x : impact_level) =
  match x with
  | IL2 -> `String "IL2"
  | IL4 -> `String "IL4"
  | IL5 -> `String "IL5"
  | IL6 -> `String "IL6"
  | IL99 -> `String "IL99"

let remote_management_to_yojson (x : remote_management) =
  match x with
  | INSTALLED_ONLY -> `String "INSTALLED_ONLY"
  | INSTALLED_AUTOSTART -> `String "INSTALLED_AUTOSTART"
  | NOT_INSTALLED -> `String "NOT_INSTALLED"

let wireless_connection_to_yojson (x : wireless_connection) =
  assoc_to_yojson [ ("IsWifiEnabled", option_to_yojson boolean__to_yojson x.is_wifi_enabled) ]

let snowcone_device_configuration_to_yojson (x : snowcone_device_configuration) =
  assoc_to_yojson
    [ ("WirelessConnection", option_to_yojson wireless_connection_to_yojson x.wireless_connection) ]

let device_configuration_to_yojson (x : device_configuration) =
  assoc_to_yojson
    [
      ( "SnowconeDeviceConfiguration",
        option_to_yojson snowcone_device_configuration_to_yojson x.snowcone_device_configuration );
    ]

let gsti_n_to_yojson = string_to_yojson

let ind_tax_documents_to_yojson (x : ind_tax_documents) =
  assoc_to_yojson [ ("GSTIN", option_to_yojson gsti_n_to_yojson x.gsti_n) ]

let tax_documents_to_yojson (x : tax_documents) =
  assoc_to_yojson [ ("IND", option_to_yojson ind_tax_documents_to_yojson x.in_d) ]

let job_logs_to_yojson (x : job_logs) =
  assoc_to_yojson
    [
      ("JobCompletionReportURI", option_to_yojson string__to_yojson x.job_completion_report_ur_i);
      ("JobSuccessLogURI", option_to_yojson string__to_yojson x.job_success_log_ur_i);
      ("JobFailureLogURI", option_to_yojson string__to_yojson x.job_failure_log_ur_i);
    ]

let long_to_yojson = long_to_yojson

let data_transfer_to_yojson (x : data_transfer) =
  assoc_to_yojson
    [
      ("BytesTransferred", option_to_yojson long_to_yojson x.bytes_transferred);
      ("ObjectsTransferred", option_to_yojson long_to_yojson x.objects_transferred);
      ("TotalBytes", option_to_yojson long_to_yojson x.total_bytes);
      ("TotalObjects", option_to_yojson long_to_yojson x.total_objects);
    ]

let shipment_to_yojson (x : shipment) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson string__to_yojson x.status);
      ("TrackingNumber", option_to_yojson string__to_yojson x.tracking_number);
    ]

let shipping_details_to_yojson (x : shipping_details) =
  assoc_to_yojson
    [
      ("ShippingOption", option_to_yojson shipping_option_to_yojson x.shipping_option);
      ("InboundShipment", option_to_yojson shipment_to_yojson x.inbound_shipment);
      ("OutboundShipment", option_to_yojson shipment_to_yojson x.outbound_shipment);
    ]

let kms_key_ar_n_to_yojson = string_to_yojson

let job_metadata_to_yojson (x : job_metadata) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson string__to_yojson x.job_id);
      ("JobState", option_to_yojson job_state_to_yojson x.job_state);
      ("JobType", option_to_yojson job_type_to_yojson x.job_type);
      ("SnowballType", option_to_yojson snowball_type_to_yojson x.snowball_type);
      ("CreationDate", option_to_yojson timestamp_to_yojson x.creation_date);
      ("Resources", option_to_yojson job_resource_to_yojson x.resources);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("KmsKeyARN", option_to_yojson kms_key_ar_n_to_yojson x.kms_key_ar_n);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("AddressId", option_to_yojson address_id_to_yojson x.address_id);
      ("ShippingDetails", option_to_yojson shipping_details_to_yojson x.shipping_details);
      ( "SnowballCapacityPreference",
        option_to_yojson snowball_capacity_to_yojson x.snowball_capacity_preference );
      ("Notification", option_to_yojson notification_to_yojson x.notification);
      ("DataTransferProgress", option_to_yojson data_transfer_to_yojson x.data_transfer_progress);
      ("JobLogInfo", option_to_yojson job_logs_to_yojson x.job_log_info);
      ("ClusterId", option_to_yojson string__to_yojson x.cluster_id);
      ("ForwardingAddressId", option_to_yojson address_id_to_yojson x.forwarding_address_id);
      ("TaxDocuments", option_to_yojson tax_documents_to_yojson x.tax_documents);
      ("DeviceConfiguration", option_to_yojson device_configuration_to_yojson x.device_configuration);
      ("RemoteManagement", option_to_yojson remote_management_to_yojson x.remote_management);
      ("LongTermPricingId", option_to_yojson long_term_pricing_id_to_yojson x.long_term_pricing_id);
      ( "OnDeviceServiceConfiguration",
        option_to_yojson on_device_service_configuration_to_yojson x.on_device_service_configuration
      );
      ("ImpactLevel", option_to_yojson impact_level_to_yojson x.impact_level);
      ("PickupDetails", option_to_yojson pickup_details_to_yojson x.pickup_details);
      ("SnowballId", option_to_yojson string__to_yojson x.snowball_id);
    ]

let job_metadata_list_to_yojson tree = list_to_yojson job_metadata_to_yojson tree

let describe_job_result_to_yojson (x : describe_job_result) =
  assoc_to_yojson
    [
      ("JobMetadata", option_to_yojson job_metadata_to_yojson x.job_metadata);
      ("SubJobMetadata", option_to_yojson job_metadata_list_to_yojson x.sub_job_metadata);
    ]

let describe_job_request_to_yojson (x : describe_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let cluster_metadata_to_yojson (x : cluster_metadata) =
  assoc_to_yojson
    [
      ("ClusterId", option_to_yojson string__to_yojson x.cluster_id);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("KmsKeyARN", option_to_yojson kms_key_ar_n_to_yojson x.kms_key_ar_n);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("ClusterState", option_to_yojson cluster_state_to_yojson x.cluster_state);
      ("JobType", option_to_yojson job_type_to_yojson x.job_type);
      ("SnowballType", option_to_yojson snowball_type_to_yojson x.snowball_type);
      ("CreationDate", option_to_yojson timestamp_to_yojson x.creation_date);
      ("Resources", option_to_yojson job_resource_to_yojson x.resources);
      ("AddressId", option_to_yojson address_id_to_yojson x.address_id);
      ("ShippingOption", option_to_yojson shipping_option_to_yojson x.shipping_option);
      ("Notification", option_to_yojson notification_to_yojson x.notification);
      ("ForwardingAddressId", option_to_yojson address_id_to_yojson x.forwarding_address_id);
      ("TaxDocuments", option_to_yojson tax_documents_to_yojson x.tax_documents);
      ( "OnDeviceServiceConfiguration",
        option_to_yojson on_device_service_configuration_to_yojson x.on_device_service_configuration
      );
    ]

let describe_cluster_result_to_yojson (x : describe_cluster_result) =
  assoc_to_yojson
    [ ("ClusterMetadata", option_to_yojson cluster_metadata_to_yojson x.cluster_metadata) ]

let describe_cluster_request_to_yojson (x : describe_cluster_request) =
  assoc_to_yojson [ ("ClusterId", Some (cluster_id_to_yojson x.cluster_id)) ]

let describe_addresses_result_to_yojson (x : describe_addresses_result) =
  assoc_to_yojson
    [
      ("Addresses", option_to_yojson address_list_to_yojson x.addresses);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_addresses_request_to_yojson (x : describe_addresses_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson list_limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_address_result_to_yojson (x : describe_address_result) =
  assoc_to_yojson [ ("Address", option_to_yojson address_to_yojson x.address) ]

let describe_address_request_to_yojson (x : describe_address_request) =
  assoc_to_yojson [ ("AddressId", Some (address_id_to_yojson x.address_id)) ]

let return_shipping_label_already_exists_exception_to_yojson
    (x : return_shipping_label_already_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let create_return_shipping_label_result_to_yojson (x : create_return_shipping_label_result) =
  assoc_to_yojson [ ("Status", option_to_yojson shipping_label_status_to_yojson x.status) ]

let create_return_shipping_label_request_to_yojson (x : create_return_shipping_label_request) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("ShippingOption", option_to_yojson shipping_option_to_yojson x.shipping_option);
    ]

let create_long_term_pricing_result_to_yojson (x : create_long_term_pricing_result) =
  assoc_to_yojson
    [
      ("LongTermPricingId", option_to_yojson long_term_pricing_id_to_yojson x.long_term_pricing_id);
    ]

let create_long_term_pricing_request_to_yojson (x : create_long_term_pricing_request) =
  assoc_to_yojson
    [
      ("LongTermPricingType", Some (long_term_pricing_type_to_yojson x.long_term_pricing_type));
      ( "IsLongTermPricingAutoRenew",
        option_to_yojson java_boolean_to_yojson x.is_long_term_pricing_auto_renew );
      ("SnowballType", Some (snowball_type_to_yojson x.snowball_type));
    ]

let create_job_result_to_yojson (x : create_job_result) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let create_job_request_to_yojson (x : create_job_request) =
  assoc_to_yojson
    [
      ("JobType", option_to_yojson job_type_to_yojson x.job_type);
      ("Resources", option_to_yojson job_resource_to_yojson x.resources);
      ( "OnDeviceServiceConfiguration",
        option_to_yojson on_device_service_configuration_to_yojson x.on_device_service_configuration
      );
      ("Description", option_to_yojson string__to_yojson x.description);
      ("AddressId", option_to_yojson address_id_to_yojson x.address_id);
      ("KmsKeyARN", option_to_yojson kms_key_ar_n_to_yojson x.kms_key_ar_n);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ( "SnowballCapacityPreference",
        option_to_yojson snowball_capacity_to_yojson x.snowball_capacity_preference );
      ("ShippingOption", option_to_yojson shipping_option_to_yojson x.shipping_option);
      ("Notification", option_to_yojson notification_to_yojson x.notification);
      ("ClusterId", option_to_yojson cluster_id_to_yojson x.cluster_id);
      ("SnowballType", option_to_yojson snowball_type_to_yojson x.snowball_type);
      ("ForwardingAddressId", option_to_yojson address_id_to_yojson x.forwarding_address_id);
      ("TaxDocuments", option_to_yojson tax_documents_to_yojson x.tax_documents);
      ("DeviceConfiguration", option_to_yojson device_configuration_to_yojson x.device_configuration);
      ("RemoteManagement", option_to_yojson remote_management_to_yojson x.remote_management);
      ("LongTermPricingId", option_to_yojson long_term_pricing_id_to_yojson x.long_term_pricing_id);
      ("ImpactLevel", option_to_yojson impact_level_to_yojson x.impact_level);
      ("PickupDetails", option_to_yojson pickup_details_to_yojson x.pickup_details);
    ]

let create_cluster_result_to_yojson (x : create_cluster_result) =
  assoc_to_yojson
    [
      ("ClusterId", option_to_yojson cluster_id_to_yojson x.cluster_id);
      ("JobListEntries", option_to_yojson job_list_entry_list_to_yojson x.job_list_entries);
    ]

let long_term_pricing_id_list_to_yojson tree = list_to_yojson long_term_pricing_id_to_yojson tree
let initial_cluster_size_to_yojson = int_to_yojson

let create_cluster_request_to_yojson (x : create_cluster_request) =
  assoc_to_yojson
    [
      ("JobType", Some (job_type_to_yojson x.job_type));
      ("Resources", option_to_yojson job_resource_to_yojson x.resources);
      ( "OnDeviceServiceConfiguration",
        option_to_yojson on_device_service_configuration_to_yojson x.on_device_service_configuration
      );
      ("Description", option_to_yojson string__to_yojson x.description);
      ("AddressId", Some (address_id_to_yojson x.address_id));
      ("KmsKeyARN", option_to_yojson kms_key_ar_n_to_yojson x.kms_key_ar_n);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("SnowballType", Some (snowball_type_to_yojson x.snowball_type));
      ("ShippingOption", Some (shipping_option_to_yojson x.shipping_option));
      ("Notification", option_to_yojson notification_to_yojson x.notification);
      ("ForwardingAddressId", option_to_yojson address_id_to_yojson x.forwarding_address_id);
      ("TaxDocuments", option_to_yojson tax_documents_to_yojson x.tax_documents);
      ("RemoteManagement", option_to_yojson remote_management_to_yojson x.remote_management);
      ("InitialClusterSize", option_to_yojson initial_cluster_size_to_yojson x.initial_cluster_size);
      ("ForceCreateJobs", option_to_yojson boolean__to_yojson x.force_create_jobs);
      ( "LongTermPricingIds",
        option_to_yojson long_term_pricing_id_list_to_yojson x.long_term_pricing_ids );
      ( "SnowballCapacityPreference",
        option_to_yojson snowball_capacity_to_yojson x.snowball_capacity_preference );
    ]

let unsupported_address_exception_to_yojson (x : unsupported_address_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_address_exception_to_yojson (x : invalid_address_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let create_address_result_to_yojson (x : create_address_result) =
  assoc_to_yojson [ ("AddressId", option_to_yojson string__to_yojson x.address_id) ]

let create_address_request_to_yojson (x : create_address_request) =
  assoc_to_yojson [ ("Address", Some (address_to_yojson x.address)) ]

let cancel_job_result_to_yojson = unit_to_yojson

let cancel_job_request_to_yojson (x : cancel_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let cancel_cluster_result_to_yojson = unit_to_yojson

let cancel_cluster_request_to_yojson (x : cancel_cluster_request) =
  assoc_to_yojson [ ("ClusterId", Some (cluster_id_to_yojson x.cluster_id)) ]
