open Types

let make_access_control_attribute_value
    ~source:(source_ : access_control_attribute_value_source_list) () =
  ({ source = source_ } : access_control_attribute_value)

let make_access_control_attribute ~key:(key_ : access_control_attribute_key)
    ~value:(value_ : access_control_attribute_value) () =
  ({ key = key_; value = value_ } : access_control_attribute)

let make_account_assignment ?account_id:(account_id_ : account_id option)
    ?permission_set_arn:(permission_set_arn_ : permission_set_arn option)
    ?principal_type:(principal_type_ : principal_type option)
    ?principal_id:(principal_id_ : principal_id option) () =
  ({
     account_id = account_id_;
     permission_set_arn = permission_set_arn_;
     principal_type = principal_type_;
     principal_id = principal_id_;
   }
    : account_assignment)

let make_account_assignment_for_principal ?account_id:(account_id_ : account_id option)
    ?permission_set_arn:(permission_set_arn_ : permission_set_arn option)
    ?principal_id:(principal_id_ : principal_id option)
    ?principal_type:(principal_type_ : principal_type option) () =
  ({
     account_id = account_id_;
     permission_set_arn = permission_set_arn_;
     principal_id = principal_id_;
     principal_type = principal_type_;
   }
    : account_assignment_for_principal)

let make_account_assignment_operation_status ?status:(status_ : status_values option)
    ?request_id:(request_id_ : uu_id option) ?failure_reason:(failure_reason_ : reason option)
    ?target_id:(target_id_ : target_id option) ?target_type:(target_type_ : target_type option)
    ?permission_set_arn:(permission_set_arn_ : permission_set_arn option)
    ?principal_type:(principal_type_ : principal_type option)
    ?principal_id:(principal_id_ : principal_id option) ?created_date:(created_date_ : date option)
    () =
  ({
     status = status_;
     request_id = request_id_;
     failure_reason = failure_reason_;
     target_id = target_id_;
     target_type = target_type_;
     permission_set_arn = permission_set_arn_;
     principal_type = principal_type_;
     principal_id = principal_id_;
     created_date = created_date_;
   }
    : account_assignment_operation_status)

let make_account_assignment_operation_status_metadata ?status:(status_ : status_values option)
    ?request_id:(request_id_ : uu_id option) ?created_date:(created_date_ : date option) () =
  ({ status = status_; request_id = request_id_; created_date = created_date_ }
    : account_assignment_operation_status_metadata)

let make_add_region_response ?status:(status_ : region_status option) () =
  ({ status = status_ } : add_region_response)

let make_add_region_request ~instance_arn:(instance_arn_ : instance_arn)
    ~region_name:(region_name_ : region_name) () =
  ({ instance_arn = instance_arn_; region_name = region_name_ } : add_region_request)

let make_sign_in_options ?application_url:(application_url_ : application_url option)
    ~origin:(origin_ : sign_in_origin) () =
  ({ origin = origin_; application_url = application_url_ } : sign_in_options)

let make_portal_options ?sign_in_options:(sign_in_options_ : sign_in_options option)
    ?visibility:(visibility_ : application_visibility option) () =
  ({ sign_in_options = sign_in_options_; visibility = visibility_ } : portal_options)

let make_application ?application_arn:(application_arn_ : application_arn option)
    ?application_provider_arn:(application_provider_arn_ : application_provider_arn option)
    ?name:(name_ : application_name_type option)
    ?application_account:(application_account_ : account_id option)
    ?instance_arn:(instance_arn_ : instance_arn option)
    ?identity_store_arn:(identity_store_arn_ : identity_store_arn option)
    ?status:(status_ : application_status option)
    ?portal_options:(portal_options_ : portal_options option)
    ?description:(description_ : description option) ?created_date:(created_date_ : date option)
    ?created_from:(created_from_ : region_name option) () =
  ({
     application_arn = application_arn_;
     application_provider_arn = application_provider_arn_;
     name = name_;
     application_account = application_account_;
     instance_arn = instance_arn_;
     identity_store_arn = identity_store_arn_;
     status = status_;
     portal_options = portal_options_;
     description = description_;
     created_date = created_date_;
     created_from = created_from_;
   }
    : application)

let make_application_assignment ~application_arn:(application_arn_ : application_arn)
    ~principal_id:(principal_id_ : principal_id) ~principal_type:(principal_type_ : principal_type)
    () =
  ({
     application_arn = application_arn_;
     principal_id = principal_id_;
     principal_type = principal_type_;
   }
    : application_assignment)

let make_application_assignment_for_principal
    ?application_arn:(application_arn_ : application_arn option)
    ?principal_id:(principal_id_ : principal_id option)
    ?principal_type:(principal_type_ : principal_type option) () =
  ({
     application_arn = application_arn_;
     principal_id = principal_id_;
     principal_type = principal_type_;
   }
    : application_assignment_for_principal)

let make_resource_server_scope_details ?long_description:(long_description_ : description option)
    ?detailed_title:(detailed_title_ : description option) () =
  ({ long_description = long_description_; detailed_title = detailed_title_ }
    : resource_server_scope_details)

let make_resource_server_config ?scopes:(scopes_ : resource_server_scopes option) () =
  ({ scopes = scopes_ } : resource_server_config)

let make_display_data ?display_name:(display_name_ : name option)
    ?icon_url:(icon_url_ : icon_url option) ?description:(description_ : description option) () =
  ({ display_name = display_name_; icon_url = icon_url_; description = description_ }
    : display_data)

let make_application_provider
    ?federation_protocol:(federation_protocol_ : federation_protocol option)
    ?display_data:(display_data_ : display_data option)
    ?resource_server_config:(resource_server_config_ : resource_server_config option)
    ~application_provider_arn:(application_provider_arn_ : application_provider_arn) () =
  ({
     application_provider_arn = application_provider_arn_;
     federation_protocol = federation_protocol_;
     display_data = display_data_;
     resource_server_config = resource_server_config_;
   }
    : application_provider)

let make_attach_customer_managed_policy_reference_to_permission_set_response () = (() : unit)

let make_customer_managed_policy_reference ?path:(path_ : managed_policy_path option)
    ~name:(name_ : managed_policy_name) () =
  ({ name = name_; path = path_ } : customer_managed_policy_reference)

let make_attach_customer_managed_policy_reference_to_permission_set_request
    ~instance_arn:(instance_arn_ : instance_arn)
    ~permission_set_arn:(permission_set_arn_ : permission_set_arn)
    ~customer_managed_policy_reference:
      (customer_managed_policy_reference_ : customer_managed_policy_reference) () =
  ({
     instance_arn = instance_arn_;
     permission_set_arn = permission_set_arn_;
     customer_managed_policy_reference = customer_managed_policy_reference_;
   }
    : attach_customer_managed_policy_reference_to_permission_set_request)

let make_attach_managed_policy_to_permission_set_response () = (() : unit)

let make_attach_managed_policy_to_permission_set_request
    ~instance_arn:(instance_arn_ : instance_arn)
    ~permission_set_arn:(permission_set_arn_ : permission_set_arn)
    ~managed_policy_arn:(managed_policy_arn_ : managed_policy_arn) () =
  ({
     instance_arn = instance_arn_;
     permission_set_arn = permission_set_arn_;
     managed_policy_arn = managed_policy_arn_;
   }
    : attach_managed_policy_to_permission_set_request)

let make_attached_managed_policy ?name:(name_ : name option) ?arn:(arn_ : managed_policy_arn option)
    () =
  ({ name = name_; arn = arn_ } : attached_managed_policy)

let make_iam_authentication_method ~actor_policy:(actor_policy_ : actor_policy_document) () =
  ({ actor_policy = actor_policy_ } : iam_authentication_method)

let make_authentication_method_item
    ?authentication_method_type:(authentication_method_type_ : authentication_method_type option)
    ?authentication_method:(authentication_method_ : authentication_method option) () =
  ({
     authentication_method_type = authentication_method_type_;
     authentication_method = authentication_method_;
   }
    : authentication_method_item)

let make_authorization_code_grant ?redirect_uris:(redirect_uris_ : redirect_uris option) () =
  ({ redirect_uris = redirect_uris_ } : authorization_code_grant)

let make_authorized_token_issuer
    ?trusted_token_issuer_arn:(trusted_token_issuer_arn_ : trusted_token_issuer_arn option)
    ?authorized_audiences:(authorized_audiences_ : token_issuer_audiences option) () =
  ({
     trusted_token_issuer_arn = trusted_token_issuer_arn_;
     authorized_audiences = authorized_audiences_;
   }
    : authorized_token_issuer)

let make_create_account_assignment_response
    ?account_assignment_creation_status:
      (account_assignment_creation_status_ : account_assignment_operation_status option) () =
  ({ account_assignment_creation_status = account_assignment_creation_status_ }
    : create_account_assignment_response)

let make_create_account_assignment_request ~instance_arn:(instance_arn_ : instance_arn)
    ~target_id:(target_id_ : target_id) ~target_type:(target_type_ : target_type)
    ~permission_set_arn:(permission_set_arn_ : permission_set_arn)
    ~principal_type:(principal_type_ : principal_type) ~principal_id:(principal_id_ : principal_id)
    () =
  ({
     instance_arn = instance_arn_;
     target_id = target_id_;
     target_type = target_type_;
     permission_set_arn = permission_set_arn_;
     principal_type = principal_type_;
     principal_id = principal_id_;
   }
    : create_account_assignment_request)

let make_create_application_response ?application_arn:(application_arn_ : application_arn option)
    ?instance_arn:(instance_arn_ : instance_arn option)
    ?identity_store_arn:(identity_store_arn_ : identity_store_arn option) () =
  ({
     application_arn = application_arn_;
     instance_arn = instance_arn_;
     identity_store_arn = identity_store_arn_;
   }
    : create_application_response)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_create_application_request ?description:(description_ : description option)
    ?portal_options:(portal_options_ : portal_options option) ?tags:(tags_ : tag_list option)
    ?status:(status_ : application_status option)
    ?client_token:(client_token_ : client_token option) ~instance_arn:(instance_arn_ : instance_arn)
    ~application_provider_arn:(application_provider_arn_ : application_provider_arn)
    ~name:(name_ : application_name_type) () =
  ({
     instance_arn = instance_arn_;
     application_provider_arn = application_provider_arn_;
     name = name_;
     description = description_;
     portal_options = portal_options_;
     tags = tags_;
     status = status_;
     client_token = client_token_;
   }
    : create_application_request)

let make_create_application_assignment_response () = (() : unit)

let make_create_application_assignment_request ~application_arn:(application_arn_ : application_arn)
    ~principal_id:(principal_id_ : principal_id) ~principal_type:(principal_type_ : principal_type)
    () =
  ({
     application_arn = application_arn_;
     principal_id = principal_id_;
     principal_type = principal_type_;
   }
    : create_application_assignment_request)

let make_create_instance_response ?instance_arn:(instance_arn_ : instance_arn option) () =
  ({ instance_arn = instance_arn_ } : create_instance_response)

let make_create_instance_request ?name:(name_ : name_type option)
    ?client_token:(client_token_ : client_token option) ?tags:(tags_ : tag_list option) () =
  ({ name = name_; client_token = client_token_; tags = tags_ } : create_instance_request)

let make_create_instance_access_control_attribute_configuration_response () = (() : unit)

let make_instance_access_control_attribute_configuration
    ~access_control_attributes:(access_control_attributes_ : access_control_attribute_list) () =
  ({ access_control_attributes = access_control_attributes_ }
    : instance_access_control_attribute_configuration)

let make_create_instance_access_control_attribute_configuration_request
    ~instance_arn:(instance_arn_ : instance_arn)
    ~instance_access_control_attribute_configuration:
      (instance_access_control_attribute_configuration_ :
        instance_access_control_attribute_configuration) () =
  ({
     instance_arn = instance_arn_;
     instance_access_control_attribute_configuration =
       instance_access_control_attribute_configuration_;
   }
    : create_instance_access_control_attribute_configuration_request)

let make_permission_set ?name:(name_ : permission_set_name option)
    ?permission_set_arn:(permission_set_arn_ : permission_set_arn option)
    ?description:(description_ : permission_set_description option)
    ?created_date:(created_date_ : date option)
    ?session_duration:(session_duration_ : duration option)
    ?relay_state:(relay_state_ : relay_state option) () =
  ({
     name = name_;
     permission_set_arn = permission_set_arn_;
     description = description_;
     created_date = created_date_;
     session_duration = session_duration_;
     relay_state = relay_state_;
   }
    : permission_set)

let make_create_permission_set_response ?permission_set:(permission_set_ : permission_set option) ()
    =
  ({ permission_set = permission_set_ } : create_permission_set_response)

let make_create_permission_set_request
    ?description:(description_ : permission_set_description option)
    ?session_duration:(session_duration_ : duration option)
    ?relay_state:(relay_state_ : relay_state option) ?tags:(tags_ : tag_list option)
    ~name:(name_ : permission_set_name) ~instance_arn:(instance_arn_ : instance_arn) () =
  ({
     name = name_;
     description = description_;
     instance_arn = instance_arn_;
     session_duration = session_duration_;
     relay_state = relay_state_;
     tags = tags_;
   }
    : create_permission_set_request)

let make_create_trusted_token_issuer_response
    ?trusted_token_issuer_arn:(trusted_token_issuer_arn_ : trusted_token_issuer_arn option) () =
  ({ trusted_token_issuer_arn = trusted_token_issuer_arn_ } : create_trusted_token_issuer_response)

let make_oidc_jwt_configuration ~issuer_url:(issuer_url_ : trusted_token_issuer_url)
    ~claim_attribute_path:(claim_attribute_path_ : claim_attribute_path)
    ~identity_store_attribute_path:(identity_store_attribute_path_ : jmes_path)
    ~jwks_retrieval_option:(jwks_retrieval_option_ : jwks_retrieval_option) () =
  ({
     issuer_url = issuer_url_;
     claim_attribute_path = claim_attribute_path_;
     identity_store_attribute_path = identity_store_attribute_path_;
     jwks_retrieval_option = jwks_retrieval_option_;
   }
    : oidc_jwt_configuration)

let make_create_trusted_token_issuer_request ?client_token:(client_token_ : client_token option)
    ?tags:(tags_ : tag_list option) ~instance_arn:(instance_arn_ : instance_arn)
    ~name:(name_ : trusted_token_issuer_name)
    ~trusted_token_issuer_type:(trusted_token_issuer_type_ : trusted_token_issuer_type)
    ~trusted_token_issuer_configuration:
      (trusted_token_issuer_configuration_ : trusted_token_issuer_configuration) () =
  ({
     instance_arn = instance_arn_;
     name = name_;
     trusted_token_issuer_type = trusted_token_issuer_type_;
     trusted_token_issuer_configuration = trusted_token_issuer_configuration_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_trusted_token_issuer_request)

let make_delete_account_assignment_response
    ?account_assignment_deletion_status:
      (account_assignment_deletion_status_ : account_assignment_operation_status option) () =
  ({ account_assignment_deletion_status = account_assignment_deletion_status_ }
    : delete_account_assignment_response)

let make_delete_account_assignment_request ~instance_arn:(instance_arn_ : instance_arn)
    ~target_id:(target_id_ : target_id) ~target_type:(target_type_ : target_type)
    ~permission_set_arn:(permission_set_arn_ : permission_set_arn)
    ~principal_type:(principal_type_ : principal_type) ~principal_id:(principal_id_ : principal_id)
    () =
  ({
     instance_arn = instance_arn_;
     target_id = target_id_;
     target_type = target_type_;
     permission_set_arn = permission_set_arn_;
     principal_type = principal_type_;
     principal_id = principal_id_;
   }
    : delete_account_assignment_request)

let make_delete_application_response () = (() : unit)

let make_delete_application_request ~application_arn:(application_arn_ : application_arn) () =
  ({ application_arn = application_arn_ } : delete_application_request)

let make_delete_application_access_scope_request
    ~application_arn:(application_arn_ : application_arn) ~scope:(scope_ : scope) () =
  ({ application_arn = application_arn_; scope = scope_ } : delete_application_access_scope_request)

let make_delete_application_assignment_response () = (() : unit)

let make_delete_application_assignment_request ~application_arn:(application_arn_ : application_arn)
    ~principal_id:(principal_id_ : principal_id) ~principal_type:(principal_type_ : principal_type)
    () =
  ({
     application_arn = application_arn_;
     principal_id = principal_id_;
     principal_type = principal_type_;
   }
    : delete_application_assignment_request)

let make_delete_application_authentication_method_request
    ~application_arn:(application_arn_ : application_arn)
    ~authentication_method_type:(authentication_method_type_ : authentication_method_type) () =
  ({ application_arn = application_arn_; authentication_method_type = authentication_method_type_ }
    : delete_application_authentication_method_request)

let make_delete_application_grant_request ~application_arn:(application_arn_ : application_arn)
    ~grant_type:(grant_type_ : grant_type) () =
  ({ application_arn = application_arn_; grant_type = grant_type_ }
    : delete_application_grant_request)

let make_delete_inline_policy_from_permission_set_response () = (() : unit)

let make_delete_inline_policy_from_permission_set_request
    ~instance_arn:(instance_arn_ : instance_arn)
    ~permission_set_arn:(permission_set_arn_ : permission_set_arn) () =
  ({ instance_arn = instance_arn_; permission_set_arn = permission_set_arn_ }
    : delete_inline_policy_from_permission_set_request)

let make_delete_instance_response () = (() : unit)

let make_delete_instance_request ~instance_arn:(instance_arn_ : instance_arn) () =
  ({ instance_arn = instance_arn_ } : delete_instance_request)

let make_delete_instance_access_control_attribute_configuration_response () = (() : unit)

let make_delete_instance_access_control_attribute_configuration_request
    ~instance_arn:(instance_arn_ : instance_arn) () =
  ({ instance_arn = instance_arn_ }
    : delete_instance_access_control_attribute_configuration_request)

let make_delete_permission_set_response () = (() : unit)

let make_delete_permission_set_request ~instance_arn:(instance_arn_ : instance_arn)
    ~permission_set_arn:(permission_set_arn_ : permission_set_arn) () =
  ({ instance_arn = instance_arn_; permission_set_arn = permission_set_arn_ }
    : delete_permission_set_request)

let make_delete_permissions_boundary_from_permission_set_response () = (() : unit)

let make_delete_permissions_boundary_from_permission_set_request
    ~instance_arn:(instance_arn_ : instance_arn)
    ~permission_set_arn:(permission_set_arn_ : permission_set_arn) () =
  ({ instance_arn = instance_arn_; permission_set_arn = permission_set_arn_ }
    : delete_permissions_boundary_from_permission_set_request)

let make_delete_trusted_token_issuer_response () = (() : unit)

let make_delete_trusted_token_issuer_request
    ~trusted_token_issuer_arn:(trusted_token_issuer_arn_ : trusted_token_issuer_arn) () =
  ({ trusted_token_issuer_arn = trusted_token_issuer_arn_ } : delete_trusted_token_issuer_request)

let make_describe_account_assignment_creation_status_response
    ?account_assignment_creation_status:
      (account_assignment_creation_status_ : account_assignment_operation_status option) () =
  ({ account_assignment_creation_status = account_assignment_creation_status_ }
    : describe_account_assignment_creation_status_response)

let make_describe_account_assignment_creation_status_request
    ~instance_arn:(instance_arn_ : instance_arn)
    ~account_assignment_creation_request_id:(account_assignment_creation_request_id_ : uu_id) () =
  ({
     instance_arn = instance_arn_;
     account_assignment_creation_request_id = account_assignment_creation_request_id_;
   }
    : describe_account_assignment_creation_status_request)

let make_describe_account_assignment_deletion_status_response
    ?account_assignment_deletion_status:
      (account_assignment_deletion_status_ : account_assignment_operation_status option) () =
  ({ account_assignment_deletion_status = account_assignment_deletion_status_ }
    : describe_account_assignment_deletion_status_response)

let make_describe_account_assignment_deletion_status_request
    ~instance_arn:(instance_arn_ : instance_arn)
    ~account_assignment_deletion_request_id:(account_assignment_deletion_request_id_ : uu_id) () =
  ({
     instance_arn = instance_arn_;
     account_assignment_deletion_request_id = account_assignment_deletion_request_id_;
   }
    : describe_account_assignment_deletion_status_request)

let make_describe_application_response ?application_arn:(application_arn_ : application_arn option)
    ?application_provider_arn:(application_provider_arn_ : application_provider_arn option)
    ?name:(name_ : application_name_type option)
    ?application_account:(application_account_ : account_id option)
    ?instance_arn:(instance_arn_ : instance_arn option)
    ?identity_store_arn:(identity_store_arn_ : identity_store_arn option)
    ?status:(status_ : application_status option)
    ?portal_options:(portal_options_ : portal_options option)
    ?description:(description_ : description option) ?created_date:(created_date_ : date option)
    ?created_from:(created_from_ : region_name option) () =
  ({
     application_arn = application_arn_;
     application_provider_arn = application_provider_arn_;
     name = name_;
     application_account = application_account_;
     instance_arn = instance_arn_;
     identity_store_arn = identity_store_arn_;
     status = status_;
     portal_options = portal_options_;
     description = description_;
     created_date = created_date_;
     created_from = created_from_;
   }
    : describe_application_response)

let make_describe_application_request ~application_arn:(application_arn_ : application_arn) () =
  ({ application_arn = application_arn_ } : describe_application_request)

let make_describe_application_assignment_response
    ?principal_type:(principal_type_ : principal_type option)
    ?principal_id:(principal_id_ : principal_id option)
    ?application_arn:(application_arn_ : application_arn option) () =
  ({
     principal_type = principal_type_;
     principal_id = principal_id_;
     application_arn = application_arn_;
   }
    : describe_application_assignment_response)

let make_describe_application_assignment_request
    ~application_arn:(application_arn_ : application_arn)
    ~principal_id:(principal_id_ : principal_id) ~principal_type:(principal_type_ : principal_type)
    () =
  ({
     application_arn = application_arn_;
     principal_id = principal_id_;
     principal_type = principal_type_;
   }
    : describe_application_assignment_request)

let make_describe_application_provider_response
    ?federation_protocol:(federation_protocol_ : federation_protocol option)
    ?display_data:(display_data_ : display_data option)
    ?resource_server_config:(resource_server_config_ : resource_server_config option)
    ~application_provider_arn:(application_provider_arn_ : application_provider_arn) () =
  ({
     application_provider_arn = application_provider_arn_;
     federation_protocol = federation_protocol_;
     display_data = display_data_;
     resource_server_config = resource_server_config_;
   }
    : describe_application_provider_response)

let make_describe_application_provider_request
    ~application_provider_arn:(application_provider_arn_ : application_provider_arn) () =
  ({ application_provider_arn = application_provider_arn_ } : describe_application_provider_request)

let make_encryption_configuration_details ?key_type:(key_type_ : kms_key_type option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option)
    ?encryption_status:(encryption_status_ : kms_key_status option)
    ?encryption_status_reason:(encryption_status_reason_ : reason option) () =
  ({
     key_type = key_type_;
     kms_key_arn = kms_key_arn_;
     encryption_status = encryption_status_;
     encryption_status_reason = encryption_status_reason_;
   }
    : encryption_configuration_details)

let make_describe_instance_response ?instance_arn:(instance_arn_ : instance_arn option)
    ?identity_store_id:(identity_store_id_ : id option)
    ?owner_account_id:(owner_account_id_ : account_id option) ?name:(name_ : name_type option)
    ?created_date:(created_date_ : date option) ?status:(status_ : instance_status option)
    ?status_reason:(status_reason_ : reason option)
    ?encryption_configuration_details:
      (encryption_configuration_details_ : encryption_configuration_details option) () =
  ({
     instance_arn = instance_arn_;
     identity_store_id = identity_store_id_;
     owner_account_id = owner_account_id_;
     name = name_;
     created_date = created_date_;
     status = status_;
     status_reason = status_reason_;
     encryption_configuration_details = encryption_configuration_details_;
   }
    : describe_instance_response)

let make_describe_instance_request ~instance_arn:(instance_arn_ : instance_arn) () =
  ({ instance_arn = instance_arn_ } : describe_instance_request)

let make_describe_instance_access_control_attribute_configuration_response
    ?status:(status_ : instance_access_control_attribute_configuration_status option)
    ?status_reason:
      (status_reason_ : instance_access_control_attribute_configuration_status_reason option)
    ?instance_access_control_attribute_configuration:
      (instance_access_control_attribute_configuration_ :
         instance_access_control_attribute_configuration option) () =
  ({
     status = status_;
     status_reason = status_reason_;
     instance_access_control_attribute_configuration =
       instance_access_control_attribute_configuration_;
   }
    : describe_instance_access_control_attribute_configuration_response)

let make_describe_instance_access_control_attribute_configuration_request
    ~instance_arn:(instance_arn_ : instance_arn) () =
  ({ instance_arn = instance_arn_ }
    : describe_instance_access_control_attribute_configuration_request)

let make_describe_permission_set_response ?permission_set:(permission_set_ : permission_set option)
    () =
  ({ permission_set = permission_set_ } : describe_permission_set_response)

let make_describe_permission_set_request ~instance_arn:(instance_arn_ : instance_arn)
    ~permission_set_arn:(permission_set_arn_ : permission_set_arn) () =
  ({ instance_arn = instance_arn_; permission_set_arn = permission_set_arn_ }
    : describe_permission_set_request)

let make_permission_set_provisioning_status ?status:(status_ : status_values option)
    ?request_id:(request_id_ : uu_id option) ?account_id:(account_id_ : account_id option)
    ?permission_set_arn:(permission_set_arn_ : permission_set_arn option)
    ?failure_reason:(failure_reason_ : reason option) ?created_date:(created_date_ : date option) ()
    =
  ({
     status = status_;
     request_id = request_id_;
     account_id = account_id_;
     permission_set_arn = permission_set_arn_;
     failure_reason = failure_reason_;
     created_date = created_date_;
   }
    : permission_set_provisioning_status)

let make_describe_permission_set_provisioning_status_response
    ?permission_set_provisioning_status:
      (permission_set_provisioning_status_ : permission_set_provisioning_status option) () =
  ({ permission_set_provisioning_status = permission_set_provisioning_status_ }
    : describe_permission_set_provisioning_status_response)

let make_describe_permission_set_provisioning_status_request
    ~instance_arn:(instance_arn_ : instance_arn)
    ~provision_permission_set_request_id:(provision_permission_set_request_id_ : uu_id) () =
  ({
     instance_arn = instance_arn_;
     provision_permission_set_request_id = provision_permission_set_request_id_;
   }
    : describe_permission_set_provisioning_status_request)

let make_describe_region_response ?region_name:(region_name_ : region_name option)
    ?status:(status_ : region_status option) ?added_date:(added_date_ : date option)
    ?is_primary_region:(is_primary_region_ : is_primary_region option) () =
  ({
     region_name = region_name_;
     status = status_;
     added_date = added_date_;
     is_primary_region = is_primary_region_;
   }
    : describe_region_response)

let make_describe_region_request ~instance_arn:(instance_arn_ : instance_arn)
    ~region_name:(region_name_ : region_name) () =
  ({ instance_arn = instance_arn_; region_name = region_name_ } : describe_region_request)

let make_describe_trusted_token_issuer_response
    ?trusted_token_issuer_arn:(trusted_token_issuer_arn_ : trusted_token_issuer_arn option)
    ?name:(name_ : trusted_token_issuer_name option)
    ?trusted_token_issuer_type:(trusted_token_issuer_type_ : trusted_token_issuer_type option)
    ?trusted_token_issuer_configuration:
      (trusted_token_issuer_configuration_ : trusted_token_issuer_configuration option) () =
  ({
     trusted_token_issuer_arn = trusted_token_issuer_arn_;
     name = name_;
     trusted_token_issuer_type = trusted_token_issuer_type_;
     trusted_token_issuer_configuration = trusted_token_issuer_configuration_;
   }
    : describe_trusted_token_issuer_response)

let make_describe_trusted_token_issuer_request
    ~trusted_token_issuer_arn:(trusted_token_issuer_arn_ : trusted_token_issuer_arn) () =
  ({ trusted_token_issuer_arn = trusted_token_issuer_arn_ } : describe_trusted_token_issuer_request)

let make_detach_customer_managed_policy_reference_from_permission_set_response () = (() : unit)

let make_detach_customer_managed_policy_reference_from_permission_set_request
    ~instance_arn:(instance_arn_ : instance_arn)
    ~permission_set_arn:(permission_set_arn_ : permission_set_arn)
    ~customer_managed_policy_reference:
      (customer_managed_policy_reference_ : customer_managed_policy_reference) () =
  ({
     instance_arn = instance_arn_;
     permission_set_arn = permission_set_arn_;
     customer_managed_policy_reference = customer_managed_policy_reference_;
   }
    : detach_customer_managed_policy_reference_from_permission_set_request)

let make_detach_managed_policy_from_permission_set_response () = (() : unit)

let make_detach_managed_policy_from_permission_set_request
    ~instance_arn:(instance_arn_ : instance_arn)
    ~permission_set_arn:(permission_set_arn_ : permission_set_arn)
    ~managed_policy_arn:(managed_policy_arn_ : managed_policy_arn) () =
  ({
     instance_arn = instance_arn_;
     permission_set_arn = permission_set_arn_;
     managed_policy_arn = managed_policy_arn_;
   }
    : detach_managed_policy_from_permission_set_request)

let make_encryption_configuration ?kms_key_arn:(kms_key_arn_ : kms_key_arn option)
    ~key_type:(key_type_ : kms_key_type) () =
  ({ key_type = key_type_; kms_key_arn = kms_key_arn_ } : encryption_configuration)

let make_get_application_access_scope_response
    ?authorized_targets:(authorized_targets_ : scope_targets option) ~scope:(scope_ : scope) () =
  ({ scope = scope_; authorized_targets = authorized_targets_ }
    : get_application_access_scope_response)

let make_get_application_access_scope_request ~application_arn:(application_arn_ : application_arn)
    ~scope:(scope_ : scope) () =
  ({ application_arn = application_arn_; scope = scope_ } : get_application_access_scope_request)

let make_get_application_assignment_configuration_response
    ~assignment_required:(assignment_required_ : assignment_required) () =
  ({ assignment_required = assignment_required_ }
    : get_application_assignment_configuration_response)

let make_get_application_assignment_configuration_request
    ~application_arn:(application_arn_ : application_arn) () =
  ({ application_arn = application_arn_ } : get_application_assignment_configuration_request)

let make_get_application_authentication_method_response
    ?authentication_method:(authentication_method_ : authentication_method option) () =
  ({ authentication_method = authentication_method_ }
    : get_application_authentication_method_response)

let make_get_application_authentication_method_request
    ~application_arn:(application_arn_ : application_arn)
    ~authentication_method_type:(authentication_method_type_ : authentication_method_type) () =
  ({ application_arn = application_arn_; authentication_method_type = authentication_method_type_ }
    : get_application_authentication_method_request)

let make_token_exchange_grant () = (() : unit)
let make_refresh_token_grant () = (() : unit)

let make_jwt_bearer_grant
    ?authorized_token_issuers:(authorized_token_issuers_ : authorized_token_issuers option) () =
  ({ authorized_token_issuers = authorized_token_issuers_ } : jwt_bearer_grant)

let make_get_application_grant_response ~grant:(grant_ : grant) () =
  ({ grant = grant_ } : get_application_grant_response)

let make_get_application_grant_request ~application_arn:(application_arn_ : application_arn)
    ~grant_type:(grant_type_ : grant_type) () =
  ({ application_arn = application_arn_; grant_type = grant_type_ } : get_application_grant_request)

let make_get_application_session_configuration_response
    ?user_background_session_application_status:
      (user_background_session_application_status_ :
         user_background_session_application_status option) () =
  ({ user_background_session_application_status = user_background_session_application_status_ }
    : get_application_session_configuration_response)

let make_get_application_session_configuration_request
    ~application_arn:(application_arn_ : application_arn) () =
  ({ application_arn = application_arn_ } : get_application_session_configuration_request)

let make_get_inline_policy_for_permission_set_response
    ?inline_policy:(inline_policy_ : permission_set_policy_document option) () =
  ({ inline_policy = inline_policy_ } : get_inline_policy_for_permission_set_response)

let make_get_inline_policy_for_permission_set_request ~instance_arn:(instance_arn_ : instance_arn)
    ~permission_set_arn:(permission_set_arn_ : permission_set_arn) () =
  ({ instance_arn = instance_arn_; permission_set_arn = permission_set_arn_ }
    : get_inline_policy_for_permission_set_request)

let make_permissions_boundary
    ?customer_managed_policy_reference:
      (customer_managed_policy_reference_ : customer_managed_policy_reference option)
    ?managed_policy_arn:(managed_policy_arn_ : managed_policy_arn option) () =
  ({
     customer_managed_policy_reference = customer_managed_policy_reference_;
     managed_policy_arn = managed_policy_arn_;
   }
    : permissions_boundary)

let make_get_permissions_boundary_for_permission_set_response
    ?permissions_boundary:(permissions_boundary_ : permissions_boundary option) () =
  ({ permissions_boundary = permissions_boundary_ }
    : get_permissions_boundary_for_permission_set_response)

let make_get_permissions_boundary_for_permission_set_request
    ~instance_arn:(instance_arn_ : instance_arn)
    ~permission_set_arn:(permission_set_arn_ : permission_set_arn) () =
  ({ instance_arn = instance_arn_; permission_set_arn = permission_set_arn_ }
    : get_permissions_boundary_for_permission_set_request)

let make_grant_item ~grant_type:(grant_type_ : grant_type) ~grant:(grant_ : grant) () =
  ({ grant_type = grant_type_; grant = grant_ } : grant_item)

let make_region_metadata ?region_name:(region_name_ : region_name option)
    ?status:(status_ : region_status option) ?added_date:(added_date_ : date option)
    ?is_primary_region:(is_primary_region_ : is_primary_region option) () =
  ({
     region_name = region_name_;
     status = status_;
     added_date = added_date_;
     is_primary_region = is_primary_region_;
   }
    : region_metadata)

let make_instance_metadata ?instance_arn:(instance_arn_ : instance_arn option)
    ?identity_store_id:(identity_store_id_ : id option)
    ?owner_account_id:(owner_account_id_ : account_id option) ?name:(name_ : name_type option)
    ?created_date:(created_date_ : date option) ?status:(status_ : instance_status option)
    ?status_reason:(status_reason_ : reason option)
    ?primary_region:(primary_region_ : region_name option)
    ?regions:(regions_ : region_metadata_list option) () =
  ({
     instance_arn = instance_arn_;
     identity_store_id = identity_store_id_;
     owner_account_id = owner_account_id_;
     name = name_;
     created_date = created_date_;
     status = status_;
     status_reason = status_reason_;
     primary_region = primary_region_;
     regions = regions_;
   }
    : instance_metadata)

let make_list_account_assignment_creation_status_response
    ?account_assignments_creation_status:
      (account_assignments_creation_status_ : account_assignment_operation_status_list option)
    ?next_token:(next_token_ : token option) () =
  ({
     account_assignments_creation_status = account_assignments_creation_status_;
     next_token = next_token_;
   }
    : list_account_assignment_creation_status_response)

let make_operation_status_filter ?status:(status_ : status_values option) () =
  ({ status = status_ } : operation_status_filter)

let make_list_account_assignment_creation_status_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : token option)
    ?filter:(filter_ : operation_status_filter option) ~instance_arn:(instance_arn_ : instance_arn)
    () =
  ({
     instance_arn = instance_arn_;
     max_results = max_results_;
     next_token = next_token_;
     filter = filter_;
   }
    : list_account_assignment_creation_status_request)

let make_list_account_assignment_deletion_status_response
    ?account_assignments_deletion_status:
      (account_assignments_deletion_status_ : account_assignment_operation_status_list option)
    ?next_token:(next_token_ : token option) () =
  ({
     account_assignments_deletion_status = account_assignments_deletion_status_;
     next_token = next_token_;
   }
    : list_account_assignment_deletion_status_response)

let make_list_account_assignment_deletion_status_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : token option)
    ?filter:(filter_ : operation_status_filter option) ~instance_arn:(instance_arn_ : instance_arn)
    () =
  ({
     instance_arn = instance_arn_;
     max_results = max_results_;
     next_token = next_token_;
     filter = filter_;
   }
    : list_account_assignment_deletion_status_request)

let make_list_account_assignments_response
    ?account_assignments:(account_assignments_ : account_assignment_list option)
    ?next_token:(next_token_ : token option) () =
  ({ account_assignments = account_assignments_; next_token = next_token_ }
    : list_account_assignments_response)

let make_list_account_assignments_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : token option) ~instance_arn:(instance_arn_ : instance_arn)
    ~account_id:(account_id_ : target_id)
    ~permission_set_arn:(permission_set_arn_ : permission_set_arn) () =
  ({
     instance_arn = instance_arn_;
     account_id = account_id_;
     permission_set_arn = permission_set_arn_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_account_assignments_request)

let make_list_account_assignments_filter ?account_id:(account_id_ : account_id option) () =
  ({ account_id = account_id_ } : list_account_assignments_filter)

let make_list_account_assignments_for_principal_response
    ?account_assignments:(account_assignments_ : account_assignment_list_for_principal option)
    ?next_token:(next_token_ : token option) () =
  ({ account_assignments = account_assignments_; next_token = next_token_ }
    : list_account_assignments_for_principal_response)

let make_list_account_assignments_for_principal_request
    ?filter:(filter_ : list_account_assignments_filter option)
    ?next_token:(next_token_ : token option) ?max_results:(max_results_ : max_results option)
    ~instance_arn:(instance_arn_ : instance_arn) ~principal_id:(principal_id_ : principal_id)
    ~principal_type:(principal_type_ : principal_type) () =
  ({
     instance_arn = instance_arn_;
     principal_id = principal_id_;
     principal_type = principal_type_;
     filter = filter_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_account_assignments_for_principal_request)

let make_list_accounts_for_provisioned_permission_set_response
    ?account_ids:(account_ids_ : account_list option) ?next_token:(next_token_ : token option) () =
  ({ account_ids = account_ids_; next_token = next_token_ }
    : list_accounts_for_provisioned_permission_set_response)

let make_list_accounts_for_provisioned_permission_set_request
    ?provisioning_status:(provisioning_status_ : provisioning_status option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : token option)
    ~instance_arn:(instance_arn_ : instance_arn)
    ~permission_set_arn:(permission_set_arn_ : permission_set_arn) () =
  ({
     instance_arn = instance_arn_;
     permission_set_arn = permission_set_arn_;
     provisioning_status = provisioning_status_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_accounts_for_provisioned_permission_set_request)

let make_scope_details ?authorized_targets:(authorized_targets_ : scope_targets option)
    ~scope:(scope_ : scope) () =
  ({ scope = scope_; authorized_targets = authorized_targets_ } : scope_details)

let make_list_application_access_scopes_response ?next_token:(next_token_ : token option)
    ~scopes:(scopes_ : scopes) () =
  ({ scopes = scopes_; next_token = next_token_ } : list_application_access_scopes_response)

let make_list_application_access_scopes_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : token option) ~application_arn:(application_arn_ : application_arn)
    () =
  ({ application_arn = application_arn_; max_results = max_results_; next_token = next_token_ }
    : list_application_access_scopes_request)

let make_list_application_assignments_response
    ?application_assignments:(application_assignments_ : application_assignments_list option)
    ?next_token:(next_token_ : token option) () =
  ({ application_assignments = application_assignments_; next_token = next_token_ }
    : list_application_assignments_response)

let make_list_application_assignments_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : token option) ~application_arn:(application_arn_ : application_arn)
    () =
  ({ application_arn = application_arn_; max_results = max_results_; next_token = next_token_ }
    : list_application_assignments_request)

let make_list_application_assignments_filter
    ?application_arn:(application_arn_ : application_arn option) () =
  ({ application_arn = application_arn_ } : list_application_assignments_filter)

let make_list_application_assignments_for_principal_response
    ?application_assignments:
      (application_assignments_ : application_assignment_list_for_principal option)
    ?next_token:(next_token_ : token option) () =
  ({ application_assignments = application_assignments_; next_token = next_token_ }
    : list_application_assignments_for_principal_response)

let make_list_application_assignments_for_principal_request
    ?filter:(filter_ : list_application_assignments_filter option)
    ?next_token:(next_token_ : token option) ?max_results:(max_results_ : max_results option)
    ~instance_arn:(instance_arn_ : instance_arn) ~principal_id:(principal_id_ : principal_id)
    ~principal_type:(principal_type_ : principal_type) () =
  ({
     instance_arn = instance_arn_;
     principal_id = principal_id_;
     principal_type = principal_type_;
     filter = filter_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_application_assignments_for_principal_request)

let make_list_application_authentication_methods_response
    ?authentication_methods:(authentication_methods_ : authentication_methods option)
    ?next_token:(next_token_ : token option) () =
  ({ authentication_methods = authentication_methods_; next_token = next_token_ }
    : list_application_authentication_methods_response)

let make_list_application_authentication_methods_request ?next_token:(next_token_ : token option)
    ~application_arn:(application_arn_ : application_arn) () =
  ({ application_arn = application_arn_; next_token = next_token_ }
    : list_application_authentication_methods_request)

let make_list_application_grants_response ?next_token:(next_token_ : token option)
    ~grants:(grants_ : grants) () =
  ({ grants = grants_; next_token = next_token_ } : list_application_grants_response)

let make_list_application_grants_request ?next_token:(next_token_ : token option)
    ~application_arn:(application_arn_ : application_arn) () =
  ({ application_arn = application_arn_; next_token = next_token_ }
    : list_application_grants_request)

let make_list_application_providers_response
    ?application_providers:(application_providers_ : application_provider_list option)
    ?next_token:(next_token_ : token option) () =
  ({ application_providers = application_providers_; next_token = next_token_ }
    : list_application_providers_response)

let make_list_application_providers_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_application_providers_request)

let make_list_applications_response ?applications:(applications_ : application_list option)
    ?next_token:(next_token_ : token option) () =
  ({ applications = applications_; next_token = next_token_ } : list_applications_response)

let make_list_applications_filter ?application_account:(application_account_ : account_id option)
    ?application_provider:(application_provider_ : application_provider_arn option) () =
  ({ application_account = application_account_; application_provider = application_provider_ }
    : list_applications_filter)

let make_list_applications_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : token option) ?filter:(filter_ : list_applications_filter option)
    ~instance_arn:(instance_arn_ : instance_arn) () =
  ({
     instance_arn = instance_arn_;
     max_results = max_results_;
     next_token = next_token_;
     filter = filter_;
   }
    : list_applications_request)

let make_list_customer_managed_policy_references_in_permission_set_response
    ?customer_managed_policy_references:
      (customer_managed_policy_references_ : customer_managed_policy_reference_list option)
    ?next_token:(next_token_ : token option) () =
  ({
     customer_managed_policy_references = customer_managed_policy_references_;
     next_token = next_token_;
   }
    : list_customer_managed_policy_references_in_permission_set_response)

let make_list_customer_managed_policy_references_in_permission_set_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : token option)
    ~instance_arn:(instance_arn_ : instance_arn)
    ~permission_set_arn:(permission_set_arn_ : permission_set_arn) () =
  ({
     instance_arn = instance_arn_;
     permission_set_arn = permission_set_arn_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_customer_managed_policy_references_in_permission_set_request)

let make_list_instances_response ?instances:(instances_ : instance_list option)
    ?next_token:(next_token_ : token option) () =
  ({ instances = instances_; next_token = next_token_ } : list_instances_response)

let make_list_instances_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_instances_request)

let make_list_managed_policies_in_permission_set_response
    ?attached_managed_policies:(attached_managed_policies_ : attached_managed_policy_list option)
    ?next_token:(next_token_ : token option) () =
  ({ attached_managed_policies = attached_managed_policies_; next_token = next_token_ }
    : list_managed_policies_in_permission_set_response)

let make_list_managed_policies_in_permission_set_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : token option)
    ~instance_arn:(instance_arn_ : instance_arn)
    ~permission_set_arn:(permission_set_arn_ : permission_set_arn) () =
  ({
     instance_arn = instance_arn_;
     permission_set_arn = permission_set_arn_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_managed_policies_in_permission_set_request)

let make_permission_set_provisioning_status_metadata ?status:(status_ : status_values option)
    ?request_id:(request_id_ : uu_id option) ?created_date:(created_date_ : date option) () =
  ({ status = status_; request_id = request_id_; created_date = created_date_ }
    : permission_set_provisioning_status_metadata)

let make_list_permission_set_provisioning_status_response
    ?permission_sets_provisioning_status:
      (permission_sets_provisioning_status_ : permission_set_provisioning_status_list option)
    ?next_token:(next_token_ : token option) () =
  ({
     permission_sets_provisioning_status = permission_sets_provisioning_status_;
     next_token = next_token_;
   }
    : list_permission_set_provisioning_status_response)

let make_list_permission_set_provisioning_status_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : token option)
    ?filter:(filter_ : operation_status_filter option) ~instance_arn:(instance_arn_ : instance_arn)
    () =
  ({
     instance_arn = instance_arn_;
     max_results = max_results_;
     next_token = next_token_;
     filter = filter_;
   }
    : list_permission_set_provisioning_status_request)

let make_list_permission_sets_response
    ?permission_sets:(permission_sets_ : permission_set_list option)
    ?next_token:(next_token_ : token option) () =
  ({ permission_sets = permission_sets_; next_token = next_token_ } : list_permission_sets_response)

let make_list_permission_sets_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_results option) ~instance_arn:(instance_arn_ : instance_arn) ()
    =
  ({ instance_arn = instance_arn_; next_token = next_token_; max_results = max_results_ }
    : list_permission_sets_request)

let make_list_permission_sets_provisioned_to_account_response
    ?next_token:(next_token_ : token option)
    ?permission_sets:(permission_sets_ : permission_set_list option) () =
  ({ next_token = next_token_; permission_sets = permission_sets_ }
    : list_permission_sets_provisioned_to_account_response)

let make_list_permission_sets_provisioned_to_account_request
    ?provisioning_status:(provisioning_status_ : provisioning_status option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : token option)
    ~instance_arn:(instance_arn_ : instance_arn) ~account_id:(account_id_ : account_id) () =
  ({
     instance_arn = instance_arn_;
     account_id = account_id_;
     provisioning_status = provisioning_status_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_permission_sets_provisioned_to_account_request)

let make_list_regions_response ?regions:(regions_ : region_metadata_list option)
    ?next_token:(next_token_ : token option) () =
  ({ regions = regions_; next_token = next_token_ } : list_regions_response)

let make_list_regions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : token option) ~instance_arn:(instance_arn_ : instance_arn) () =
  ({ instance_arn = instance_arn_; max_results = max_results_; next_token = next_token_ }
    : list_regions_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option)
    ?next_token:(next_token_ : token option) () =
  ({ tags = tags_; next_token = next_token_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ?instance_arn:(instance_arn_ : instance_arn option)
    ?next_token:(next_token_ : token option) ~resource_arn:(resource_arn_ : taggable_resource_arn)
    () =
  ({ instance_arn = instance_arn_; resource_arn = resource_arn_; next_token = next_token_ }
    : list_tags_for_resource_request)

let make_trusted_token_issuer_metadata
    ?trusted_token_issuer_arn:(trusted_token_issuer_arn_ : trusted_token_issuer_arn option)
    ?name:(name_ : trusted_token_issuer_name option)
    ?trusted_token_issuer_type:(trusted_token_issuer_type_ : trusted_token_issuer_type option) () =
  ({
     trusted_token_issuer_arn = trusted_token_issuer_arn_;
     name = name_;
     trusted_token_issuer_type = trusted_token_issuer_type_;
   }
    : trusted_token_issuer_metadata)

let make_list_trusted_token_issuers_response
    ?trusted_token_issuers:(trusted_token_issuers_ : trusted_token_issuer_list option)
    ?next_token:(next_token_ : token option) () =
  ({ trusted_token_issuers = trusted_token_issuers_; next_token = next_token_ }
    : list_trusted_token_issuers_response)

let make_list_trusted_token_issuers_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : token option) ~instance_arn:(instance_arn_ : instance_arn) () =
  ({ instance_arn = instance_arn_; max_results = max_results_; next_token = next_token_ }
    : list_trusted_token_issuers_request)

let make_oidc_jwt_update_configuration
    ?claim_attribute_path:(claim_attribute_path_ : claim_attribute_path option)
    ?identity_store_attribute_path:(identity_store_attribute_path_ : jmes_path option)
    ?jwks_retrieval_option:(jwks_retrieval_option_ : jwks_retrieval_option option) () =
  ({
     claim_attribute_path = claim_attribute_path_;
     identity_store_attribute_path = identity_store_attribute_path_;
     jwks_retrieval_option = jwks_retrieval_option_;
   }
    : oidc_jwt_update_configuration)

let make_provision_permission_set_response
    ?permission_set_provisioning_status:
      (permission_set_provisioning_status_ : permission_set_provisioning_status option) () =
  ({ permission_set_provisioning_status = permission_set_provisioning_status_ }
    : provision_permission_set_response)

let make_provision_permission_set_request ?target_id:(target_id_ : target_id option)
    ~instance_arn:(instance_arn_ : instance_arn)
    ~permission_set_arn:(permission_set_arn_ : permission_set_arn)
    ~target_type:(target_type_ : provision_target_type) () =
  ({
     instance_arn = instance_arn_;
     permission_set_arn = permission_set_arn_;
     target_id = target_id_;
     target_type = target_type_;
   }
    : provision_permission_set_request)

let make_put_application_access_scope_request
    ?authorized_targets:(authorized_targets_ : scope_targets option) ~scope:(scope_ : scope)
    ~application_arn:(application_arn_ : application_arn) () =
  ({ scope = scope_; authorized_targets = authorized_targets_; application_arn = application_arn_ }
    : put_application_access_scope_request)

let make_put_application_assignment_configuration_response () = (() : unit)

let make_put_application_assignment_configuration_request
    ~application_arn:(application_arn_ : application_arn)
    ~assignment_required:(assignment_required_ : assignment_required) () =
  ({ application_arn = application_arn_; assignment_required = assignment_required_ }
    : put_application_assignment_configuration_request)

let make_put_application_authentication_method_request
    ~application_arn:(application_arn_ : application_arn)
    ~authentication_method_type:(authentication_method_type_ : authentication_method_type)
    ~authentication_method:(authentication_method_ : authentication_method) () =
  ({
     application_arn = application_arn_;
     authentication_method_type = authentication_method_type_;
     authentication_method = authentication_method_;
   }
    : put_application_authentication_method_request)

let make_put_application_grant_request ~application_arn:(application_arn_ : application_arn)
    ~grant_type:(grant_type_ : grant_type) ~grant:(grant_ : grant) () =
  ({ application_arn = application_arn_; grant_type = grant_type_; grant = grant_ }
    : put_application_grant_request)

let make_put_application_session_configuration_response () = (() : unit)

let make_put_application_session_configuration_request
    ?user_background_session_application_status:
      (user_background_session_application_status_ :
         user_background_session_application_status option)
    ~application_arn:(application_arn_ : application_arn) () =
  ({
     application_arn = application_arn_;
     user_background_session_application_status = user_background_session_application_status_;
   }
    : put_application_session_configuration_request)

let make_put_inline_policy_to_permission_set_response () = (() : unit)

let make_put_inline_policy_to_permission_set_request ~instance_arn:(instance_arn_ : instance_arn)
    ~permission_set_arn:(permission_set_arn_ : permission_set_arn)
    ~inline_policy:(inline_policy_ : permission_set_policy_document) () =
  ({
     instance_arn = instance_arn_;
     permission_set_arn = permission_set_arn_;
     inline_policy = inline_policy_;
   }
    : put_inline_policy_to_permission_set_request)

let make_put_permissions_boundary_to_permission_set_response () = (() : unit)

let make_put_permissions_boundary_to_permission_set_request
    ~instance_arn:(instance_arn_ : instance_arn)
    ~permission_set_arn:(permission_set_arn_ : permission_set_arn)
    ~permissions_boundary:(permissions_boundary_ : permissions_boundary) () =
  ({
     instance_arn = instance_arn_;
     permission_set_arn = permission_set_arn_;
     permissions_boundary = permissions_boundary_;
   }
    : put_permissions_boundary_to_permission_set_request)

let make_remove_region_response ?status:(status_ : region_status option) () =
  ({ status = status_ } : remove_region_response)

let make_remove_region_request ~instance_arn:(instance_arn_ : instance_arn)
    ~region_name:(region_name_ : region_name) () =
  ({ instance_arn = instance_arn_; region_name = region_name_ } : remove_region_request)

let make_update_trusted_token_issuer_response () = (() : unit)

let make_update_trusted_token_issuer_request ?name:(name_ : trusted_token_issuer_name option)
    ?trusted_token_issuer_configuration:
      (trusted_token_issuer_configuration_ : trusted_token_issuer_update_configuration option)
    ~trusted_token_issuer_arn:(trusted_token_issuer_arn_ : trusted_token_issuer_arn) () =
  ({
     trusted_token_issuer_arn = trusted_token_issuer_arn_;
     name = name_;
     trusted_token_issuer_configuration = trusted_token_issuer_configuration_;
   }
    : update_trusted_token_issuer_request)

let make_update_permission_set_response () = (() : unit)

let make_update_permission_set_request
    ?description:(description_ : permission_set_description option)
    ?session_duration:(session_duration_ : duration option)
    ?relay_state:(relay_state_ : relay_state option) ~instance_arn:(instance_arn_ : instance_arn)
    ~permission_set_arn:(permission_set_arn_ : permission_set_arn) () =
  ({
     instance_arn = instance_arn_;
     permission_set_arn = permission_set_arn_;
     description = description_;
     session_duration = session_duration_;
     relay_state = relay_state_;
   }
    : update_permission_set_request)

let make_update_instance_access_control_attribute_configuration_response () = (() : unit)

let make_update_instance_access_control_attribute_configuration_request
    ~instance_arn:(instance_arn_ : instance_arn)
    ~instance_access_control_attribute_configuration:
      (instance_access_control_attribute_configuration_ :
        instance_access_control_attribute_configuration) () =
  ({
     instance_arn = instance_arn_;
     instance_access_control_attribute_configuration =
       instance_access_control_attribute_configuration_;
   }
    : update_instance_access_control_attribute_configuration_request)

let make_update_instance_response () = (() : unit)

let make_update_instance_request ?name:(name_ : name_type option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ~instance_arn:(instance_arn_ : instance_arn) () =
  ({
     name = name_;
     instance_arn = instance_arn_;
     encryption_configuration = encryption_configuration_;
   }
    : update_instance_request)

let make_update_application_response () = (() : unit)

let make_update_application_portal_options
    ?sign_in_options:(sign_in_options_ : sign_in_options option) () =
  ({ sign_in_options = sign_in_options_ } : update_application_portal_options)

let make_update_application_request ?name:(name_ : application_name_type option)
    ?description:(description_ : description option) ?status:(status_ : application_status option)
    ?portal_options:(portal_options_ : update_application_portal_options option)
    ~application_arn:(application_arn_ : application_arn) () =
  ({
     application_arn = application_arn_;
     name = name_;
     description = description_;
     status = status_;
     portal_options = portal_options_;
   }
    : update_application_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ?instance_arn:(instance_arn_ : instance_arn option)
    ~resource_arn:(resource_arn_ : taggable_resource_arn) ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ instance_arn = instance_arn_; resource_arn = resource_arn_; tag_keys = tag_keys_ }
    : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ?instance_arn:(instance_arn_ : instance_arn option)
    ~resource_arn:(resource_arn_ : taggable_resource_arn) ~tags:(tags_ : tag_list) () =
  ({ instance_arn = instance_arn_; resource_arn = resource_arn_; tags = tags_ }
    : tag_resource_request)
