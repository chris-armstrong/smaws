open Types

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_remove_tags_from_resource_response ~status:(status_ : string_) () =
  ({ status = status_ } : remove_tags_from_resource_response)

let make_remove_tags_from_resource_request ~tag_key_list:(tag_key_list_ : tag_key_list)
    ~resource_arn:(resource_arn_ : string_) () =
  ({ tag_key_list = tag_key_list_; resource_arn = resource_arn_ }
    : remove_tags_from_resource_request)

let make_modify_luna_client_response ?client_arn:(client_arn_ : client_arn option) () =
  ({ client_arn = client_arn_ } : modify_luna_client_response)

let make_modify_luna_client_request ~certificate:(certificate_ : certificate)
    ~client_arn:(client_arn_ : client_arn) () =
  ({ certificate = certificate_; client_arn = client_arn_ } : modify_luna_client_request)

let make_modify_hsm_response ?hsm_arn:(hsm_arn_ : hsm_arn option) () =
  ({ hsm_arn = hsm_arn_ } : modify_hsm_response)

let make_modify_hsm_request ?syslog_ip:(syslog_ip_ : ip_address option)
    ?external_id:(external_id_ : external_id option)
    ?iam_role_arn:(iam_role_arn_ : iam_role_arn option) ?eni_ip:(eni_ip_ : ip_address option)
    ?subnet_id:(subnet_id_ : subnet_id option) ~hsm_arn:(hsm_arn_ : hsm_arn) () =
  ({
     syslog_ip = syslog_ip_;
     external_id = external_id_;
     iam_role_arn = iam_role_arn_;
     eni_ip = eni_ip_;
     subnet_id = subnet_id_;
     hsm_arn = hsm_arn_;
   }
    : modify_hsm_request)

let make_modify_hapg_response ?hapg_arn:(hapg_arn_ : hapg_arn option) () =
  ({ hapg_arn = hapg_arn_ } : modify_hapg_response)

let make_modify_hapg_request
    ?partition_serial_list:(partition_serial_list_ : partition_serial_list option)
    ?label:(label_ : label option) ~hapg_arn:(hapg_arn_ : hapg_arn) () =
  ({ partition_serial_list = partition_serial_list_; label = label_; hapg_arn = hapg_arn_ }
    : modify_hapg_request)

let make_list_tags_for_resource_response ~tag_list:(tag_list_ : tag_list) () =
  ({ tag_list = tag_list_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : string_) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_luna_clients_response ?next_token:(next_token_ : pagination_token option)
    ~client_list:(client_list_ : client_list) () =
  ({ next_token = next_token_; client_list = client_list_ } : list_luna_clients_response)

let make_list_luna_clients_request ?next_token:(next_token_ : pagination_token option) () =
  ({ next_token = next_token_ } : list_luna_clients_request)

let make_list_hsms_response ?next_token:(next_token_ : pagination_token option)
    ?hsm_list:(hsm_list_ : hsm_list option) () =
  ({ next_token = next_token_; hsm_list = hsm_list_ } : list_hsms_response)

let make_list_hsms_request ?next_token:(next_token_ : pagination_token option) () =
  ({ next_token = next_token_ } : list_hsms_request)

let make_list_hapgs_response ?next_token:(next_token_ : pagination_token option)
    ~hapg_list:(hapg_list_ : hapg_list) () =
  ({ next_token = next_token_; hapg_list = hapg_list_ } : list_hapgs_response)

let make_list_hapgs_request ?next_token:(next_token_ : pagination_token option) () =
  ({ next_token = next_token_ } : list_hapgs_request)

let make_list_available_zones_response ?az_list:(az_list_ : az_list option) () =
  ({ az_list = az_list_ } : list_available_zones_response)

let make_list_available_zones_request () = (() : unit)

let make_get_config_response ?config_cred:(config_cred_ : string_ option)
    ?config_file:(config_file_ : string_ option) ?config_type:(config_type_ : string_ option) () =
  ({ config_cred = config_cred_; config_file = config_file_; config_type = config_type_ }
    : get_config_response)

let make_get_config_request ~hapg_list:(hapg_list_ : hapg_list)
    ~client_version:(client_version_ : client_version) ~client_arn:(client_arn_ : client_arn) () =
  ({ hapg_list = hapg_list_; client_version = client_version_; client_arn = client_arn_ }
    : get_config_request)

let make_describe_luna_client_response ?label:(label_ : label option)
    ?last_modified_timestamp:(last_modified_timestamp_ : timestamp option)
    ?certificate_fingerprint:(certificate_fingerprint_ : certificate_fingerprint option)
    ?certificate:(certificate_ : certificate option) ?client_arn:(client_arn_ : client_arn option)
    () =
  ({
     label = label_;
     last_modified_timestamp = last_modified_timestamp_;
     certificate_fingerprint = certificate_fingerprint_;
     certificate = certificate_;
     client_arn = client_arn_;
   }
    : describe_luna_client_response)

let make_describe_luna_client_request
    ?certificate_fingerprint:(certificate_fingerprint_ : certificate_fingerprint option)
    ?client_arn:(client_arn_ : client_arn option) () =
  ({ certificate_fingerprint = certificate_fingerprint_; client_arn = client_arn_ }
    : describe_luna_client_request)

let make_describe_hsm_response ?partitions:(partitions_ : partition_list option)
    ?server_cert_last_updated:(server_cert_last_updated_ : timestamp option)
    ?server_cert_uri:(server_cert_uri_ : string_ option)
    ?ssh_key_last_updated:(ssh_key_last_updated_ : timestamp option)
    ?ssh_public_key:(ssh_public_key_ : ssh_key option)
    ?software_version:(software_version_ : string_ option) ?hsm_type:(hsm_type_ : string_ option)
    ?vendor_name:(vendor_name_ : string_ option)
    ?serial_number:(serial_number_ : hsm_serial_number option)
    ?iam_role_arn:(iam_role_arn_ : iam_role_arn option) ?subnet_id:(subnet_id_ : subnet_id option)
    ?vpc_id:(vpc_id_ : vpc_id option)
    ?subscription_end_date:(subscription_end_date_ : timestamp option)
    ?subscription_start_date:(subscription_start_date_ : timestamp option)
    ?subscription_type:(subscription_type_ : subscription_type option)
    ?eni_ip:(eni_ip_ : ip_address option) ?eni_id:(eni_id_ : eni_id option)
    ?availability_zone:(availability_zone_ : a_z option)
    ?status_details:(status_details_ : string_ option) ?status:(status_ : hsm_status option)
    ?hsm_arn:(hsm_arn_ : hsm_arn option) () =
  ({
     partitions = partitions_;
     server_cert_last_updated = server_cert_last_updated_;
     server_cert_uri = server_cert_uri_;
     ssh_key_last_updated = ssh_key_last_updated_;
     ssh_public_key = ssh_public_key_;
     software_version = software_version_;
     hsm_type = hsm_type_;
     vendor_name = vendor_name_;
     serial_number = serial_number_;
     iam_role_arn = iam_role_arn_;
     subnet_id = subnet_id_;
     vpc_id = vpc_id_;
     subscription_end_date = subscription_end_date_;
     subscription_start_date = subscription_start_date_;
     subscription_type = subscription_type_;
     eni_ip = eni_ip_;
     eni_id = eni_id_;
     availability_zone = availability_zone_;
     status_details = status_details_;
     status = status_;
     hsm_arn = hsm_arn_;
   }
    : describe_hsm_response)

let make_describe_hsm_request ?hsm_serial_number:(hsm_serial_number_ : hsm_serial_number option)
    ?hsm_arn:(hsm_arn_ : hsm_arn option) () =
  ({ hsm_serial_number = hsm_serial_number_; hsm_arn = hsm_arn_ } : describe_hsm_request)

let make_describe_hapg_response ?state:(state_ : cloud_hsm_object_state option)
    ?partition_serial_list:(partition_serial_list_ : partition_serial_list option)
    ?last_modified_timestamp:(last_modified_timestamp_ : timestamp option)
    ?label:(label_ : label option)
    ?hsms_pending_registration:(hsms_pending_registration_ : hsm_list option)
    ?hsms_pending_deletion:(hsms_pending_deletion_ : hsm_list option)
    ?hsms_last_action_failed:(hsms_last_action_failed_ : hsm_list option)
    ?hapg_serial:(hapg_serial_ : string_ option) ?hapg_arn:(hapg_arn_ : hapg_arn option) () =
  ({
     state = state_;
     partition_serial_list = partition_serial_list_;
     last_modified_timestamp = last_modified_timestamp_;
     label = label_;
     hsms_pending_registration = hsms_pending_registration_;
     hsms_pending_deletion = hsms_pending_deletion_;
     hsms_last_action_failed = hsms_last_action_failed_;
     hapg_serial = hapg_serial_;
     hapg_arn = hapg_arn_;
   }
    : describe_hapg_response)

let make_describe_hapg_request ~hapg_arn:(hapg_arn_ : hapg_arn) () =
  ({ hapg_arn = hapg_arn_ } : describe_hapg_request)

let make_delete_luna_client_response ~status:(status_ : string_) () =
  ({ status = status_ } : delete_luna_client_response)

let make_delete_luna_client_request ~client_arn:(client_arn_ : client_arn) () =
  ({ client_arn = client_arn_ } : delete_luna_client_request)

let make_delete_hsm_response ~status:(status_ : string_) () =
  ({ status = status_ } : delete_hsm_response)

let make_delete_hsm_request ~hsm_arn:(hsm_arn_ : hsm_arn) () =
  ({ hsm_arn = hsm_arn_ } : delete_hsm_request)

let make_delete_hapg_response ~status:(status_ : string_) () =
  ({ status = status_ } : delete_hapg_response)

let make_delete_hapg_request ~hapg_arn:(hapg_arn_ : hapg_arn) () =
  ({ hapg_arn = hapg_arn_ } : delete_hapg_request)

let make_create_luna_client_response ?client_arn:(client_arn_ : client_arn option) () =
  ({ client_arn = client_arn_ } : create_luna_client_response)

let make_create_luna_client_request ?label:(label_ : client_label option)
    ~certificate:(certificate_ : certificate) () =
  ({ certificate = certificate_; label = label_ } : create_luna_client_request)

let make_create_hsm_response ?hsm_arn:(hsm_arn_ : hsm_arn option) () =
  ({ hsm_arn = hsm_arn_ } : create_hsm_response)

let make_create_hsm_request ?syslog_ip:(syslog_ip_ : ip_address option)
    ?client_token:(client_token_ : client_token option)
    ?external_id:(external_id_ : external_id option) ?eni_ip:(eni_ip_ : ip_address option)
    ~subscription_type:(subscription_type_ : subscription_type)
    ~iam_role_arn:(iam_role_arn_ : iam_role_arn) ~ssh_key:(ssh_key_ : ssh_key)
    ~subnet_id:(subnet_id_ : subnet_id) () =
  ({
     syslog_ip = syslog_ip_;
     client_token = client_token_;
     subscription_type = subscription_type_;
     external_id = external_id_;
     iam_role_arn = iam_role_arn_;
     eni_ip = eni_ip_;
     ssh_key = ssh_key_;
     subnet_id = subnet_id_;
   }
    : create_hsm_request)

let make_create_hapg_response ?hapg_arn:(hapg_arn_ : hapg_arn option) () =
  ({ hapg_arn = hapg_arn_ } : create_hapg_response)

let make_create_hapg_request ~label:(label_ : label) () = ({ label = label_ } : create_hapg_request)

let make_add_tags_to_resource_response ~status:(status_ : string_) () =
  ({ status = status_ } : add_tags_to_resource_response)

let make_add_tags_to_resource_request ~tag_list:(tag_list_ : tag_list)
    ~resource_arn:(resource_arn_ : string_) () =
  ({ tag_list = tag_list_; resource_arn = resource_arn_ } : add_tags_to_resource_request)
