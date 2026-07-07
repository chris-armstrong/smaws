open Types

let make_cognito_member_definition ~client_id:(client_id_ : client_id)
    ~user_group:(user_group_ : cognito_user_group) ~user_pool:(user_pool_ : cognito_user_pool) () =
  ({ client_id = client_id_; user_group = user_group_; user_pool = user_pool_ }
    : cognito_member_definition)

let make_oidc_member_definition ?groups:(groups_ : groups option) () =
  ({ groups = groups_ } : oidc_member_definition)

let make_member_definition
    ?oidc_member_definition:(oidc_member_definition_ : oidc_member_definition option)
    ?cognito_member_definition:(cognito_member_definition_ : cognito_member_definition option) () =
  ({
     oidc_member_definition = oidc_member_definition_;
     cognito_member_definition = cognito_member_definition_;
   }
    : member_definition)

let make_notification_configuration
    ?notification_topic_arn:(notification_topic_arn_ : notification_topic_arn option) () =
  ({ notification_topic_arn = notification_topic_arn_ } : notification_configuration)

let make_iam_policy_constraints ?vpc_source_ip:(vpc_source_ip_ : enabled_or_disabled option)
    ?source_ip:(source_ip_ : enabled_or_disabled option) () =
  ({ vpc_source_ip = vpc_source_ip_; source_ip = source_ip_ } : iam_policy_constraints)

let make_s3_presign
    ?iam_policy_constraints:(iam_policy_constraints_ : iam_policy_constraints option) () =
  ({ iam_policy_constraints = iam_policy_constraints_ } : s3_presign)

let make_worker_access_configuration ?s3_presign:(s3_presign_ : s3_presign option) () =
  ({ s3_presign = s3_presign_ } : worker_access_configuration)

let make_workteam
    ?worker_access_configuration:(worker_access_configuration_ : worker_access_configuration option)
    ?notification_configuration:(notification_configuration_ : notification_configuration option)
    ?last_updated_date:(last_updated_date_ : timestamp option)
    ?create_date:(create_date_ : timestamp option) ?sub_domain:(sub_domain_ : string_ option)
    ?product_listing_ids:(product_listing_ids_ : product_listings option)
    ?workforce_arn:(workforce_arn_ : workforce_arn option) ~description:(description_ : string200)
    ~workteam_arn:(workteam_arn_ : workteam_arn)
    ~member_definitions:(member_definitions_ : member_definitions)
    ~workteam_name:(workteam_name_ : workteam_name) () =
  ({
     worker_access_configuration = worker_access_configuration_;
     notification_configuration = notification_configuration_;
     last_updated_date = last_updated_date_;
     create_date = create_date_;
     sub_domain = sub_domain_;
     description = description_;
     product_listing_ids = product_listing_ids_;
     workforce_arn = workforce_arn_;
     workteam_arn = workteam_arn_;
     member_definitions = member_definitions_;
     workteam_name = workteam_name_;
   }
    : workteam)

let make_workspace_settings ?s3_kms_key_id:(s3_kms_key_id_ : kms_key_id option)
    ?s3_artifact_path:(s3_artifact_path_ : s3_uri option) () =
  ({ s3_kms_key_id = s3_kms_key_id_; s3_artifact_path = s3_artifact_path_ } : workspace_settings)

let make_source_ip_config ~cidrs:(cidrs_ : cidrs) () = ({ cidrs = cidrs_ } : source_ip_config)

let make_cognito_config ~client_id:(client_id_ : client_id)
    ~user_pool:(user_pool_ : cognito_user_pool) () =
  ({ client_id = client_id_; user_pool = user_pool_ } : cognito_config)

let make_oidc_config_for_response
    ?authentication_request_extra_params:
      (authentication_request_extra_params_ : authentication_request_extra_params option)
    ?scope:(scope_ : scope option) ?jwks_uri:(jwks_uri_ : oidc_endpoint option)
    ?logout_endpoint:(logout_endpoint_ : oidc_endpoint option)
    ?user_info_endpoint:(user_info_endpoint_ : oidc_endpoint option)
    ?token_endpoint:(token_endpoint_ : oidc_endpoint option)
    ?authorization_endpoint:(authorization_endpoint_ : oidc_endpoint option)
    ?issuer:(issuer_ : oidc_endpoint option) ?client_id:(client_id_ : client_id option) () =
  ({
     authentication_request_extra_params = authentication_request_extra_params_;
     scope = scope_;
     jwks_uri = jwks_uri_;
     logout_endpoint = logout_endpoint_;
     user_info_endpoint = user_info_endpoint_;
     token_endpoint = token_endpoint_;
     authorization_endpoint = authorization_endpoint_;
     issuer = issuer_;
     client_id = client_id_;
   }
    : oidc_config_for_response)

let make_workforce_vpc_config_response
    ?vpc_endpoint_id:(vpc_endpoint_id_ : workforce_vpc_endpoint_id option)
    ~subnets:(subnets_ : workforce_subnets)
    ~security_group_ids:(security_group_ids_ : workforce_security_group_ids)
    ~vpc_id:(vpc_id_ : workforce_vpc_id) () =
  ({
     vpc_endpoint_id = vpc_endpoint_id_;
     subnets = subnets_;
     security_group_ids = security_group_ids_;
     vpc_id = vpc_id_;
   }
    : workforce_vpc_config_response)

let make_workforce ?ip_address_type:(ip_address_type_ : workforce_ip_address_type option)
    ?failure_reason:(failure_reason_ : workforce_failure_reason option)
    ?status:(status_ : workforce_status option)
    ?workforce_vpc_config:(workforce_vpc_config_ : workforce_vpc_config_response option)
    ?create_date:(create_date_ : timestamp option)
    ?oidc_config:(oidc_config_ : oidc_config_for_response option)
    ?cognito_config:(cognito_config_ : cognito_config option)
    ?sub_domain:(sub_domain_ : string_ option)
    ?source_ip_config:(source_ip_config_ : source_ip_config option)
    ?last_updated_date:(last_updated_date_ : timestamp option)
    ~workforce_arn:(workforce_arn_ : workforce_arn)
    ~workforce_name:(workforce_name_ : workforce_name) () =
  ({
     ip_address_type = ip_address_type_;
     failure_reason = failure_reason_;
     status = status_;
     workforce_vpc_config = workforce_vpc_config_;
     create_date = create_date_;
     oidc_config = oidc_config_;
     cognito_config = cognito_config_;
     sub_domain = sub_domain_;
     source_ip_config = source_ip_config_;
     last_updated_date = last_updated_date_;
     workforce_arn = workforce_arn_;
     workforce_name = workforce_name_;
   }
    : workforce)

let make_workforce_vpc_config_request ?subnets:(subnets_ : workforce_subnets option)
    ?security_group_ids:(security_group_ids_ : workforce_security_group_ids option)
    ?vpc_id:(vpc_id_ : workforce_vpc_id option) () =
  ({ subnets = subnets_; security_group_ids = security_group_ids_; vpc_id = vpc_id_ }
    : workforce_vpc_config_request)

let make_warm_pool_status ?reused_by_job:(reused_by_job_ : training_job_name option)
    ?resource_retained_billable_time_in_seconds:
      (resource_retained_billable_time_in_seconds_ :
         resource_retained_billable_time_in_seconds option)
    ~status:(status_ : warm_pool_resource_status) () =
  ({
     reused_by_job = reused_by_job_;
     resource_retained_billable_time_in_seconds = resource_retained_billable_time_in_seconds_;
     status = status_;
   }
    : warm_pool_status)

let make_vpc_config ~subnets:(subnets_ : subnets)
    ~security_group_ids:(security_group_ids_ : vpc_security_group_ids) () =
  ({ subnets = subnets_; security_group_ids = security_group_ids_ } : vpc_config)

let make_visibility_conditions ?value:(value_ : visibility_conditions_value option)
    ?key:(key_ : visibility_conditions_key option) () =
  ({ value = value_; key = key_ } : visibility_conditions)

let make_vertex ?lineage_type:(lineage_type_ : lineage_type option)
    ?type_:(type__ : string40 option) ?arn:(arn_ : association_entity_arn option) () =
  ({ lineage_type = lineage_type_; type_ = type__; arn = arn_ } : vertex)

let make_vector_config ~dimension:(dimension_ : dimension) () =
  ({ dimension = dimension_ } : vector_config)

let make_variant_property ~variant_property_type:(variant_property_type_ : variant_property_type) ()
    =
  ({ variant_property_type = variant_property_type_ } : variant_property)

let make_sharing_settings ?s3_kms_key_id:(s3_kms_key_id_ : kms_key_id option)
    ?s3_output_path:(s3_output_path_ : s3_uri option)
    ?notebook_output_option:(notebook_output_option_ : notebook_output_option option) () =
  ({
     s3_kms_key_id = s3_kms_key_id_;
     s3_output_path = s3_output_path_;
     notebook_output_option = notebook_output_option_;
   }
    : sharing_settings)

let make_resource_spec
    ?training_plan_arn:(training_plan_arn_ : studio_resource_spec_training_plan_arn option)
    ?lifecycle_config_arn:(lifecycle_config_arn_ : studio_lifecycle_config_arn option)
    ?instance_type:(instance_type_ : app_instance_type option)
    ?sage_maker_image_version_alias:(sage_maker_image_version_alias_ : image_version_alias option)
    ?sage_maker_image_version_arn:(sage_maker_image_version_arn_ : image_version_arn option)
    ?sage_maker_image_arn:(sage_maker_image_arn_ : image_arn option) () =
  ({
     training_plan_arn = training_plan_arn_;
     lifecycle_config_arn = lifecycle_config_arn_;
     instance_type = instance_type_;
     sage_maker_image_version_alias = sage_maker_image_version_alias_;
     sage_maker_image_version_arn = sage_maker_image_version_arn_;
     sage_maker_image_arn = sage_maker_image_arn_;
   }
    : resource_spec)

let make_code_repository ~repository_url:(repository_url_ : repository_url) () =
  ({ repository_url = repository_url_ } : code_repository)

let make_jupyter_server_app_settings
    ?code_repositories:(code_repositories_ : code_repositories option)
    ?lifecycle_config_arns:(lifecycle_config_arns_ : lifecycle_config_arns option)
    ?default_resource_spec:(default_resource_spec_ : resource_spec option) () =
  ({
     code_repositories = code_repositories_;
     lifecycle_config_arns = lifecycle_config_arns_;
     default_resource_spec = default_resource_spec_;
   }
    : jupyter_server_app_settings)

let make_custom_image ?image_version_number:(image_version_number_ : image_version_number option)
    ~app_image_config_name:(app_image_config_name_ : app_image_config_name)
    ~image_name:(image_name_ : image_name) () =
  ({
     app_image_config_name = app_image_config_name_;
     image_version_number = image_version_number_;
     image_name = image_name_;
   }
    : custom_image)

let make_kernel_gateway_app_settings
    ?lifecycle_config_arns:(lifecycle_config_arns_ : lifecycle_config_arns option)
    ?custom_images:(custom_images_ : custom_images option)
    ?default_resource_spec:(default_resource_spec_ : resource_spec option) () =
  ({
     lifecycle_config_arns = lifecycle_config_arns_;
     custom_images = custom_images_;
     default_resource_spec = default_resource_spec_;
   }
    : kernel_gateway_app_settings)

let make_tensor_board_app_settings
    ?default_resource_spec:(default_resource_spec_ : resource_spec option) () =
  ({ default_resource_spec = default_resource_spec_ } : tensor_board_app_settings)

let make_r_studio_server_pro_app_settings
    ?user_group:(user_group_ : r_studio_server_pro_user_group option)
    ?access_status:(access_status_ : r_studio_server_pro_access_status option) () =
  ({ user_group = user_group_; access_status = access_status_ } : r_studio_server_pro_app_settings)

let make_r_session_app_settings ?custom_images:(custom_images_ : custom_images option)
    ?default_resource_spec:(default_resource_spec_ : resource_spec option) () =
  ({ custom_images = custom_images_; default_resource_spec = default_resource_spec_ }
    : r_session_app_settings)

let make_time_series_forecasting_settings
    ?amazon_forecast_role_arn:(amazon_forecast_role_arn_ : role_arn option)
    ?status:(status_ : feature_status option) () =
  ({ amazon_forecast_role_arn = amazon_forecast_role_arn_; status = status_ }
    : time_series_forecasting_settings)

let make_model_register_settings
    ?cross_account_model_register_role_arn:
      (cross_account_model_register_role_arn_ : role_arn option)
    ?status:(status_ : feature_status option) () =
  ({
     cross_account_model_register_role_arn = cross_account_model_register_role_arn_;
     status = status_;
   }
    : model_register_settings)

let make_identity_provider_o_auth_setting ?secret_arn:(secret_arn_ : secret_arn option)
    ?status:(status_ : feature_status option)
    ?data_source_name:(data_source_name_ : data_source_name option) () =
  ({ secret_arn = secret_arn_; status = status_; data_source_name = data_source_name_ }
    : identity_provider_o_auth_setting)

let make_direct_deploy_settings ?status:(status_ : feature_status option) () =
  ({ status = status_ } : direct_deploy_settings)

let make_kendra_settings ?status:(status_ : feature_status option) () =
  ({ status = status_ } : kendra_settings)

let make_generative_ai_settings
    ?amazon_bedrock_role_arn:(amazon_bedrock_role_arn_ : role_arn option) () =
  ({ amazon_bedrock_role_arn = amazon_bedrock_role_arn_ } : generative_ai_settings)

let make_emr_serverless_settings ?status:(status_ : feature_status option)
    ?execution_role_arn:(execution_role_arn_ : role_arn option) () =
  ({ status = status_; execution_role_arn = execution_role_arn_ } : emr_serverless_settings)

let make_canvas_app_settings
    ?emr_serverless_settings:(emr_serverless_settings_ : emr_serverless_settings option)
    ?generative_ai_settings:(generative_ai_settings_ : generative_ai_settings option)
    ?kendra_settings:(kendra_settings_ : kendra_settings option)
    ?direct_deploy_settings:(direct_deploy_settings_ : direct_deploy_settings option)
    ?identity_provider_o_auth_settings:
      (identity_provider_o_auth_settings_ : identity_provider_o_auth_settings option)
    ?workspace_settings:(workspace_settings_ : workspace_settings option)
    ?model_register_settings:(model_register_settings_ : model_register_settings option)
    ?time_series_forecasting_settings:
      (time_series_forecasting_settings_ : time_series_forecasting_settings option) () =
  ({
     emr_serverless_settings = emr_serverless_settings_;
     generative_ai_settings = generative_ai_settings_;
     kendra_settings = kendra_settings_;
     direct_deploy_settings = direct_deploy_settings_;
     identity_provider_o_auth_settings = identity_provider_o_auth_settings_;
     workspace_settings = workspace_settings_;
     model_register_settings = model_register_settings_;
     time_series_forecasting_settings = time_series_forecasting_settings_;
   }
    : canvas_app_settings)

let make_idle_settings
    ?max_idle_timeout_in_minutes:(max_idle_timeout_in_minutes_ : idle_timeout_in_minutes option)
    ?min_idle_timeout_in_minutes:(min_idle_timeout_in_minutes_ : idle_timeout_in_minutes option)
    ?idle_timeout_in_minutes:(idle_timeout_in_minutes_ : idle_timeout_in_minutes option)
    ?lifecycle_management:(lifecycle_management_ : lifecycle_management option) () =
  ({
     max_idle_timeout_in_minutes = max_idle_timeout_in_minutes_;
     min_idle_timeout_in_minutes = min_idle_timeout_in_minutes_;
     idle_timeout_in_minutes = idle_timeout_in_minutes_;
     lifecycle_management = lifecycle_management_;
   }
    : idle_settings)

let make_app_lifecycle_management ?idle_settings:(idle_settings_ : idle_settings option) () =
  ({ idle_settings = idle_settings_ } : app_lifecycle_management)

let make_code_editor_app_settings
    ?built_in_lifecycle_config_arn:
      (built_in_lifecycle_config_arn_ : studio_lifecycle_config_arn option)
    ?app_lifecycle_management:(app_lifecycle_management_ : app_lifecycle_management option)
    ?lifecycle_config_arns:(lifecycle_config_arns_ : lifecycle_config_arns option)
    ?custom_images:(custom_images_ : custom_images option)
    ?default_resource_spec:(default_resource_spec_ : resource_spec option) () =
  ({
     built_in_lifecycle_config_arn = built_in_lifecycle_config_arn_;
     app_lifecycle_management = app_lifecycle_management_;
     lifecycle_config_arns = lifecycle_config_arns_;
     custom_images = custom_images_;
     default_resource_spec = default_resource_spec_;
   }
    : code_editor_app_settings)

let make_emr_settings ?execution_role_arns:(execution_role_arns_ : execution_role_arns option)
    ?assumable_role_arns:(assumable_role_arns_ : assumable_role_arns option) () =
  ({ execution_role_arns = execution_role_arns_; assumable_role_arns = assumable_role_arns_ }
    : emr_settings)

let make_jupyter_lab_app_settings
    ?built_in_lifecycle_config_arn:
      (built_in_lifecycle_config_arn_ : studio_lifecycle_config_arn option)
    ?emr_settings:(emr_settings_ : emr_settings option)
    ?app_lifecycle_management:(app_lifecycle_management_ : app_lifecycle_management option)
    ?code_repositories:(code_repositories_ : code_repositories option)
    ?lifecycle_config_arns:(lifecycle_config_arns_ : lifecycle_config_arns option)
    ?custom_images:(custom_images_ : custom_images option)
    ?default_resource_spec:(default_resource_spec_ : resource_spec option) () =
  ({
     built_in_lifecycle_config_arn = built_in_lifecycle_config_arn_;
     emr_settings = emr_settings_;
     app_lifecycle_management = app_lifecycle_management_;
     code_repositories = code_repositories_;
     lifecycle_config_arns = lifecycle_config_arns_;
     custom_images = custom_images_;
     default_resource_spec = default_resource_spec_;
   }
    : jupyter_lab_app_settings)

let make_default_ebs_storage_settings
    ~maximum_ebs_volume_size_in_gb:(maximum_ebs_volume_size_in_gb_ : space_ebs_volume_size_in_gb)
    ~default_ebs_volume_size_in_gb:(default_ebs_volume_size_in_gb_ : space_ebs_volume_size_in_gb) ()
    =
  ({
     maximum_ebs_volume_size_in_gb = maximum_ebs_volume_size_in_gb_;
     default_ebs_volume_size_in_gb = default_ebs_volume_size_in_gb_;
   }
    : default_ebs_storage_settings)

let make_default_space_storage_settings
    ?default_ebs_storage_settings:
      (default_ebs_storage_settings_ : default_ebs_storage_settings option) () =
  ({ default_ebs_storage_settings = default_ebs_storage_settings_ }
    : default_space_storage_settings)

let make_custom_posix_user_config ~gid:(gid_ : gid) ~uid:(uid_ : uid) () =
  ({ gid = gid_; uid = uid_ } : custom_posix_user_config)

let make_efs_file_system_config ?file_system_path:(file_system_path_ : file_system_path option)
    ~file_system_id:(file_system_id_ : file_system_id) () =
  ({ file_system_path = file_system_path_; file_system_id = file_system_id_ }
    : efs_file_system_config)

let make_f_sx_lustre_file_system_config
    ?file_system_path:(file_system_path_ : file_system_path option)
    ~file_system_id:(file_system_id_ : file_system_id) () =
  ({ file_system_path = file_system_path_; file_system_id = file_system_id_ }
    : f_sx_lustre_file_system_config)

let make_s3_file_system_config ?mount_path:(mount_path_ : string1024 option)
    ~s3_uri:(s3_uri_ : s3_schema_uri) () =
  ({ s3_uri = s3_uri_; mount_path = mount_path_ } : s3_file_system_config)

let make_hidden_sage_maker_image ?version_aliases:(version_aliases_ : version_aliases_list option)
    ?sage_maker_image_name:(sage_maker_image_name_ : sage_maker_image_name option) () =
  ({ version_aliases = version_aliases_; sage_maker_image_name = sage_maker_image_name_ }
    : hidden_sage_maker_image)

let make_studio_web_portal_settings
    ?execution_role_session_name_mode:
      (execution_role_session_name_mode_ : execution_role_session_name_mode option)
    ?hidden_sage_maker_image_version_aliases:
      (hidden_sage_maker_image_version_aliases_ :
         hidden_sage_maker_image_version_aliases_list option)
    ?hidden_instance_types:(hidden_instance_types_ : hidden_instance_types_list option)
    ?hidden_app_types:(hidden_app_types_ : hidden_app_types_list option)
    ?hidden_ml_tools:(hidden_ml_tools_ : hidden_ml_tools_list option) () =
  ({
     execution_role_session_name_mode = execution_role_session_name_mode_;
     hidden_sage_maker_image_version_aliases = hidden_sage_maker_image_version_aliases_;
     hidden_instance_types = hidden_instance_types_;
     hidden_app_types = hidden_app_types_;
     hidden_ml_tools = hidden_ml_tools_;
   }
    : studio_web_portal_settings)

let make_user_settings ?auto_mount_home_ef_s:(auto_mount_home_ef_s_ : auto_mount_home_ef_s option)
    ?studio_web_portal_settings:(studio_web_portal_settings_ : studio_web_portal_settings option)
    ?custom_file_system_configs:(custom_file_system_configs_ : custom_file_system_configs option)
    ?custom_posix_user_config:(custom_posix_user_config_ : custom_posix_user_config option)
    ?studio_web_portal:(studio_web_portal_ : studio_web_portal option)
    ?default_landing_uri:(default_landing_uri_ : landing_uri option)
    ?space_storage_settings:(space_storage_settings_ : default_space_storage_settings option)
    ?jupyter_lab_app_settings:(jupyter_lab_app_settings_ : jupyter_lab_app_settings option)
    ?code_editor_app_settings:(code_editor_app_settings_ : code_editor_app_settings option)
    ?canvas_app_settings:(canvas_app_settings_ : canvas_app_settings option)
    ?r_session_app_settings:(r_session_app_settings_ : r_session_app_settings option)
    ?r_studio_server_pro_app_settings:
      (r_studio_server_pro_app_settings_ : r_studio_server_pro_app_settings option)
    ?tensor_board_app_settings:(tensor_board_app_settings_ : tensor_board_app_settings option)
    ?kernel_gateway_app_settings:(kernel_gateway_app_settings_ : kernel_gateway_app_settings option)
    ?jupyter_server_app_settings:(jupyter_server_app_settings_ : jupyter_server_app_settings option)
    ?sharing_settings:(sharing_settings_ : sharing_settings option)
    ?security_groups:(security_groups_ : security_group_ids option)
    ?execution_role:(execution_role_ : role_arn option) () =
  ({
     auto_mount_home_ef_s = auto_mount_home_ef_s_;
     studio_web_portal_settings = studio_web_portal_settings_;
     custom_file_system_configs = custom_file_system_configs_;
     custom_posix_user_config = custom_posix_user_config_;
     studio_web_portal = studio_web_portal_;
     default_landing_uri = default_landing_uri_;
     space_storage_settings = space_storage_settings_;
     jupyter_lab_app_settings = jupyter_lab_app_settings_;
     code_editor_app_settings = code_editor_app_settings_;
     canvas_app_settings = canvas_app_settings_;
     r_session_app_settings = r_session_app_settings_;
     r_studio_server_pro_app_settings = r_studio_server_pro_app_settings_;
     tensor_board_app_settings = tensor_board_app_settings_;
     kernel_gateway_app_settings = kernel_gateway_app_settings_;
     jupyter_server_app_settings = jupyter_server_app_settings_;
     sharing_settings = sharing_settings_;
     security_groups = security_groups_;
     execution_role = execution_role_;
   }
    : user_settings)

let make_user_profile_details ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?creation_time:(creation_time_ : creation_time option)
    ?status:(status_ : user_profile_status option)
    ?user_profile_name:(user_profile_name_ : user_profile_name option)
    ?domain_id:(domain_id_ : domain_id option) () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     status = status_;
     user_profile_name = user_profile_name_;
     domain_id = domain_id_;
   }
    : user_profile_details)

let make_iam_identity ?source_identity:(source_identity_ : string_ option)
    ?principal_id:(principal_id_ : string_ option) ?arn:(arn_ : string_ option) () =
  ({ source_identity = source_identity_; principal_id = principal_id_; arn = arn_ } : iam_identity)

let make_user_context ?iam_identity:(iam_identity_ : iam_identity option)
    ?domain_id:(domain_id_ : string_ option)
    ?user_profile_name:(user_profile_name_ : string_ option)
    ?user_profile_arn:(user_profile_arn_ : string_ option) () =
  ({
     iam_identity = iam_identity_;
     domain_id = domain_id_;
     user_profile_name = user_profile_name_;
     user_profile_arn = user_profile_arn_;
   }
    : user_context)

let make_update_workteam_response ~workteam:(workteam_ : workteam) () =
  ({ workteam = workteam_ } : update_workteam_response)

let make_update_workteam_request
    ?worker_access_configuration:(worker_access_configuration_ : worker_access_configuration option)
    ?notification_configuration:(notification_configuration_ : notification_configuration option)
    ?description:(description_ : string200 option)
    ?member_definitions:(member_definitions_ : member_definitions option)
    ~workteam_name:(workteam_name_ : workteam_name) () =
  ({
     worker_access_configuration = worker_access_configuration_;
     notification_configuration = notification_configuration_;
     description = description_;
     member_definitions = member_definitions_;
     workteam_name = workteam_name_;
   }
    : update_workteam_request)

let make_update_workforce_response ~workforce:(workforce_ : workforce) () =
  ({ workforce = workforce_ } : update_workforce_response)

let make_oidc_config
    ?authentication_request_extra_params:
      (authentication_request_extra_params_ : authentication_request_extra_params option)
    ?scope:(scope_ : scope option) ~jwks_uri:(jwks_uri_ : oidc_endpoint)
    ~logout_endpoint:(logout_endpoint_ : oidc_endpoint)
    ~user_info_endpoint:(user_info_endpoint_ : oidc_endpoint)
    ~token_endpoint:(token_endpoint_ : oidc_endpoint)
    ~authorization_endpoint:(authorization_endpoint_ : oidc_endpoint)
    ~issuer:(issuer_ : oidc_endpoint) ~client_secret:(client_secret_ : client_secret)
    ~client_id:(client_id_ : client_id) () =
  ({
     authentication_request_extra_params = authentication_request_extra_params_;
     scope = scope_;
     jwks_uri = jwks_uri_;
     logout_endpoint = logout_endpoint_;
     user_info_endpoint = user_info_endpoint_;
     token_endpoint = token_endpoint_;
     authorization_endpoint = authorization_endpoint_;
     issuer = issuer_;
     client_secret = client_secret_;
     client_id = client_id_;
   }
    : oidc_config)

let make_update_workforce_request
    ?ip_address_type:(ip_address_type_ : workforce_ip_address_type option)
    ?workforce_vpc_config:(workforce_vpc_config_ : workforce_vpc_config_request option)
    ?oidc_config:(oidc_config_ : oidc_config option)
    ?source_ip_config:(source_ip_config_ : source_ip_config option)
    ~workforce_name:(workforce_name_ : workforce_name) () =
  ({
     ip_address_type = ip_address_type_;
     workforce_vpc_config = workforce_vpc_config_;
     oidc_config = oidc_config_;
     source_ip_config = source_ip_config_;
     workforce_name = workforce_name_;
   }
    : update_workforce_request)

let make_update_user_profile_response
    ?user_profile_arn:(user_profile_arn_ : user_profile_arn option) () =
  ({ user_profile_arn = user_profile_arn_ } : update_user_profile_response)

let make_update_user_profile_request ?user_settings:(user_settings_ : user_settings option)
    ~user_profile_name:(user_profile_name_ : user_profile_name) ~domain_id:(domain_id_ : domain_id)
    () =
  ({
     user_settings = user_settings_;
     user_profile_name = user_profile_name_;
     domain_id = domain_id_;
   }
    : update_user_profile_request)

let make_update_trial_response ?trial_arn:(trial_arn_ : trial_arn option) () =
  ({ trial_arn = trial_arn_ } : update_trial_response)

let make_update_trial_request ?display_name:(display_name_ : experiment_entity_name option)
    ~trial_name:(trial_name_ : experiment_entity_name) () =
  ({ display_name = display_name_; trial_name = trial_name_ } : update_trial_request)

let make_update_trial_component_response
    ?trial_component_arn:(trial_component_arn_ : trial_component_arn option) () =
  ({ trial_component_arn = trial_component_arn_ } : update_trial_component_response)

let make_trial_component_status ?message:(message_ : trial_component_status_message option)
    ?primary_status:(primary_status_ : trial_component_primary_status option) () =
  ({ message = message_; primary_status = primary_status_ } : trial_component_status)

let make_trial_component_artifact ?media_type:(media_type_ : media_type option)
    ~value:(value_ : trial_component_artifact_value) () =
  ({ value = value_; media_type = media_type_ } : trial_component_artifact)

let make_update_trial_component_request
    ?output_artifacts_to_remove:(output_artifacts_to_remove_ : list_trial_component_key256 option)
    ?output_artifacts:(output_artifacts_ : trial_component_artifacts option)
    ?input_artifacts_to_remove:(input_artifacts_to_remove_ : list_trial_component_key256 option)
    ?input_artifacts:(input_artifacts_ : trial_component_artifacts option)
    ?parameters_to_remove:(parameters_to_remove_ : list_trial_component_key256 option)
    ?parameters:(parameters_ : trial_component_parameters option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?status:(status_ : trial_component_status option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ~trial_component_name:(trial_component_name_ : experiment_entity_name) () =
  ({
     output_artifacts_to_remove = output_artifacts_to_remove_;
     output_artifacts = output_artifacts_;
     input_artifacts_to_remove = input_artifacts_to_remove_;
     input_artifacts = input_artifacts_;
     parameters_to_remove = parameters_to_remove_;
     parameters = parameters_;
     end_time = end_time_;
     start_time = start_time_;
     status = status_;
     display_name = display_name_;
     trial_component_name = trial_component_name_;
   }
    : update_trial_component_request)

let make_update_training_job_response ~training_job_arn:(training_job_arn_ : training_job_arn) () =
  ({ training_job_arn = training_job_arn_ } : update_training_job_response)

let make_profiler_config_for_update ?disable_profiler:(disable_profiler_ : disable_profiler option)
    ?profiling_parameters:(profiling_parameters_ : profiling_parameters option)
    ?profiling_interval_in_milliseconds:
      (profiling_interval_in_milliseconds_ : profiling_interval_in_milliseconds option)
    ?s3_output_path:(s3_output_path_ : s3_uri option) () =
  ({
     disable_profiler = disable_profiler_;
     profiling_parameters = profiling_parameters_;
     profiling_interval_in_milliseconds = profiling_interval_in_milliseconds_;
     s3_output_path = s3_output_path_;
   }
    : profiler_config_for_update)

let make_profiler_rule_configuration ?rule_parameters:(rule_parameters_ : rule_parameters option)
    ?volume_size_in_g_b:(volume_size_in_g_b_ : optional_volume_size_in_g_b option)
    ?instance_type:(instance_type_ : processing_instance_type option)
    ?s3_output_path:(s3_output_path_ : s3_uri option)
    ?local_path:(local_path_ : directory_path option)
    ~rule_evaluator_image:(rule_evaluator_image_ : algorithm_image)
    ~rule_configuration_name:(rule_configuration_name_ : rule_configuration_name) () =
  ({
     rule_parameters = rule_parameters_;
     volume_size_in_g_b = volume_size_in_g_b_;
     instance_type = instance_type_;
     rule_evaluator_image = rule_evaluator_image_;
     s3_output_path = s3_output_path_;
     local_path = local_path_;
     rule_configuration_name = rule_configuration_name_;
   }
    : profiler_rule_configuration)

let make_resource_config_for_update
    ~keep_alive_period_in_seconds:(keep_alive_period_in_seconds_ : keep_alive_period_in_seconds) ()
    =
  ({ keep_alive_period_in_seconds = keep_alive_period_in_seconds_ } : resource_config_for_update)

let make_remote_debug_config_for_update
    ?enable_remote_debug:(enable_remote_debug_ : enable_remote_debug option) () =
  ({ enable_remote_debug = enable_remote_debug_ } : remote_debug_config_for_update)

let make_update_training_job_request
    ?remote_debug_config:(remote_debug_config_ : remote_debug_config_for_update option)
    ?resource_config:(resource_config_ : resource_config_for_update option)
    ?profiler_rule_configurations:
      (profiler_rule_configurations_ : profiler_rule_configurations option)
    ?profiler_config:(profiler_config_ : profiler_config_for_update option)
    ~training_job_name:(training_job_name_ : training_job_name) () =
  ({
     remote_debug_config = remote_debug_config_;
     resource_config = resource_config_;
     profiler_rule_configurations = profiler_rule_configurations_;
     profiler_config = profiler_config_;
     training_job_name = training_job_name_;
   }
    : update_training_job_request)

let make_cfn_stack_update_parameter ?value:(value_ : cfn_stack_parameter_value option)
    ~key:(key_ : cfn_stack_parameter_key) () =
  ({ value = value_; key = key_ } : cfn_stack_update_parameter)

let make_cfn_update_template_provider ?parameters:(parameters_ : cfn_stack_update_parameters option)
    ~template_ur_l:(template_ur_l_ : cfn_template_ur_l)
    ~template_name:(template_name_ : cfn_template_name) () =
  ({ parameters = parameters_; template_ur_l = template_ur_l_; template_name = template_name_ }
    : cfn_update_template_provider)

let make_update_template_provider
    ?cfn_template_provider:(cfn_template_provider_ : cfn_update_template_provider option) () =
  ({ cfn_template_provider = cfn_template_provider_ } : update_template_provider)

let make_update_space_response ?space_arn:(space_arn_ : space_arn option) () =
  ({ space_arn = space_arn_ } : update_space_response)

let make_space_idle_settings
    ?idle_timeout_in_minutes:(idle_timeout_in_minutes_ : idle_timeout_in_minutes option) () =
  ({ idle_timeout_in_minutes = idle_timeout_in_minutes_ } : space_idle_settings)

let make_space_app_lifecycle_management ?idle_settings:(idle_settings_ : space_idle_settings option)
    () =
  ({ idle_settings = idle_settings_ } : space_app_lifecycle_management)

let make_space_code_editor_app_settings
    ?app_lifecycle_management:(app_lifecycle_management_ : space_app_lifecycle_management option)
    ?default_resource_spec:(default_resource_spec_ : resource_spec option) () =
  ({
     app_lifecycle_management = app_lifecycle_management_;
     default_resource_spec = default_resource_spec_;
   }
    : space_code_editor_app_settings)

let make_space_jupyter_lab_app_settings
    ?app_lifecycle_management:(app_lifecycle_management_ : space_app_lifecycle_management option)
    ?code_repositories:(code_repositories_ : code_repositories option)
    ?default_resource_spec:(default_resource_spec_ : resource_spec option) () =
  ({
     app_lifecycle_management = app_lifecycle_management_;
     code_repositories = code_repositories_;
     default_resource_spec = default_resource_spec_;
   }
    : space_jupyter_lab_app_settings)

let make_ebs_storage_settings
    ~ebs_volume_size_in_gb:(ebs_volume_size_in_gb_ : space_ebs_volume_size_in_gb) () =
  ({ ebs_volume_size_in_gb = ebs_volume_size_in_gb_ } : ebs_storage_settings)

let make_space_storage_settings
    ?ebs_storage_settings:(ebs_storage_settings_ : ebs_storage_settings option) () =
  ({ ebs_storage_settings = ebs_storage_settings_ } : space_storage_settings)

let make_efs_file_system ~file_system_id:(file_system_id_ : file_system_id) () =
  ({ file_system_id = file_system_id_ } : efs_file_system)

let make_f_sx_lustre_file_system ~file_system_id:(file_system_id_ : file_system_id) () =
  ({ file_system_id = file_system_id_ } : f_sx_lustre_file_system)

let make_s3_file_system ~s3_uri:(s3_uri_ : s3_schema_uri) () =
  ({ s3_uri = s3_uri_ } : s3_file_system)

let make_space_settings ?remote_access:(remote_access_ : feature_status option)
    ?custom_file_systems:(custom_file_systems_ : custom_file_systems option)
    ?space_managed_resources:(space_managed_resources_ : feature_status option)
    ?space_storage_settings:(space_storage_settings_ : space_storage_settings option)
    ?app_type:(app_type_ : app_type option)
    ?jupyter_lab_app_settings:(jupyter_lab_app_settings_ : space_jupyter_lab_app_settings option)
    ?code_editor_app_settings:(code_editor_app_settings_ : space_code_editor_app_settings option)
    ?kernel_gateway_app_settings:(kernel_gateway_app_settings_ : kernel_gateway_app_settings option)
    ?jupyter_server_app_settings:(jupyter_server_app_settings_ : jupyter_server_app_settings option)
    () =
  ({
     remote_access = remote_access_;
     custom_file_systems = custom_file_systems_;
     space_managed_resources = space_managed_resources_;
     space_storage_settings = space_storage_settings_;
     app_type = app_type_;
     jupyter_lab_app_settings = jupyter_lab_app_settings_;
     code_editor_app_settings = code_editor_app_settings_;
     kernel_gateway_app_settings = kernel_gateway_app_settings_;
     jupyter_server_app_settings = jupyter_server_app_settings_;
   }
    : space_settings)

let make_update_space_request ?space_display_name:(space_display_name_ : non_empty_string64 option)
    ?space_settings:(space_settings_ : space_settings option) ~space_name:(space_name_ : space_name)
    ~domain_id:(domain_id_ : domain_id) () =
  ({
     space_display_name = space_display_name_;
     space_settings = space_settings_;
     space_name = space_name_;
     domain_id = domain_id_;
   }
    : update_space_request)

let make_update_project_output ~project_arn:(project_arn_ : project_arn) () =
  ({ project_arn = project_arn_ } : update_project_output)

let make_provisioning_parameter ?value:(value_ : provisioning_parameter_value option)
    ?key:(key_ : provisioning_parameter_key option) () =
  ({ value = value_; key = key_ } : provisioning_parameter)

let make_service_catalog_provisioning_update_details
    ?provisioning_parameters:(provisioning_parameters_ : provisioning_parameters option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : service_catalog_entity_id option) () =
  ({
     provisioning_parameters = provisioning_parameters_;
     provisioning_artifact_id = provisioning_artifact_id_;
   }
    : service_catalog_provisioning_update_details)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_update_project_input
    ?template_providers_to_update:
      (template_providers_to_update_ : update_template_provider_list option)
    ?tags:(tags_ : tag_list option)
    ?service_catalog_provisioning_update_details:
      (service_catalog_provisioning_update_details_ :
         service_catalog_provisioning_update_details option)
    ?project_description:(project_description_ : entity_description option)
    ~project_name:(project_name_ : project_entity_name) () =
  ({
     template_providers_to_update = template_providers_to_update_;
     tags = tags_;
     service_catalog_provisioning_update_details = service_catalog_provisioning_update_details_;
     project_description = project_description_;
     project_name = project_name_;
   }
    : update_project_input)

let make_update_pipeline_version_response
    ?pipeline_version_id:(pipeline_version_id_ : pipeline_version_id option)
    ?pipeline_arn:(pipeline_arn_ : pipeline_arn option) () =
  ({ pipeline_version_id = pipeline_version_id_; pipeline_arn = pipeline_arn_ }
    : update_pipeline_version_response)

let make_update_pipeline_version_request
    ?pipeline_version_description:
      (pipeline_version_description_ : pipeline_version_description option)
    ?pipeline_version_display_name:(pipeline_version_display_name_ : pipeline_version_name option)
    ~pipeline_version_id:(pipeline_version_id_ : pipeline_version_id)
    ~pipeline_arn:(pipeline_arn_ : pipeline_arn) () =
  ({
     pipeline_version_description = pipeline_version_description_;
     pipeline_version_display_name = pipeline_version_display_name_;
     pipeline_version_id = pipeline_version_id_;
     pipeline_arn = pipeline_arn_;
   }
    : update_pipeline_version_request)

let make_update_pipeline_response
    ?pipeline_version_id:(pipeline_version_id_ : pipeline_version_id option)
    ?pipeline_arn:(pipeline_arn_ : pipeline_arn option) () =
  ({ pipeline_version_id = pipeline_version_id_; pipeline_arn = pipeline_arn_ }
    : update_pipeline_response)

let make_pipeline_definition_s3_location ?version_id:(version_id_ : version_id option)
    ~object_key:(object_key_ : key) ~bucket:(bucket_ : bucket_name) () =
  ({ version_id = version_id_; object_key = object_key_; bucket = bucket_ }
    : pipeline_definition_s3_location)

let make_parallelism_configuration
    ~max_parallel_execution_steps:(max_parallel_execution_steps_ : max_parallel_execution_steps) ()
    =
  ({ max_parallel_execution_steps = max_parallel_execution_steps_ } : parallelism_configuration)

let make_update_pipeline_request
    ?parallelism_configuration:(parallelism_configuration_ : parallelism_configuration option)
    ?role_arn:(role_arn_ : role_arn option)
    ?pipeline_description:(pipeline_description_ : pipeline_description option)
    ?pipeline_definition_s3_location:
      (pipeline_definition_s3_location_ : pipeline_definition_s3_location option)
    ?pipeline_definition:(pipeline_definition_ : pipeline_definition option)
    ?pipeline_display_name:(pipeline_display_name_ : pipeline_name option)
    ~pipeline_name:(pipeline_name_ : pipeline_name) () =
  ({
     parallelism_configuration = parallelism_configuration_;
     role_arn = role_arn_;
     pipeline_description = pipeline_description_;
     pipeline_definition_s3_location = pipeline_definition_s3_location_;
     pipeline_definition = pipeline_definition_;
     pipeline_display_name = pipeline_display_name_;
     pipeline_name = pipeline_name_;
   }
    : update_pipeline_request)

let make_update_pipeline_execution_response
    ?pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn option) () =
  ({ pipeline_execution_arn = pipeline_execution_arn_ } : update_pipeline_execution_response)

let make_update_pipeline_execution_request
    ?parallelism_configuration:(parallelism_configuration_ : parallelism_configuration option)
    ?pipeline_execution_display_name:
      (pipeline_execution_display_name_ : pipeline_execution_name option)
    ?pipeline_execution_description:
      (pipeline_execution_description_ : pipeline_execution_description option)
    ~pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn) () =
  ({
     parallelism_configuration = parallelism_configuration_;
     pipeline_execution_display_name = pipeline_execution_display_name_;
     pipeline_execution_description = pipeline_execution_description_;
     pipeline_execution_arn = pipeline_execution_arn_;
   }
    : update_pipeline_execution_request)

let make_update_partner_app_response ?arn:(arn_ : partner_app_arn option) () =
  ({ arn = arn_ } : update_partner_app_response)

let make_partner_app_maintenance_config
    ?maintenance_window_start:(maintenance_window_start_ : weekly_schedule_time_format option) () =
  ({ maintenance_window_start = maintenance_window_start_ } : partner_app_maintenance_config)

let make_role_group_assignment ~group_patterns:(group_patterns_ : group_patterns_list)
    ~role_name:(role_name_ : non_empty_string256) () =
  ({ group_patterns = group_patterns_; role_name = role_name_ } : role_group_assignment)

let make_partner_app_config
    ?role_group_assignments:(role_group_assignments_ : role_group_assignments_list option)
    ?assigned_group_patterns:(assigned_group_patterns_ : assigned_group_patterns_list option)
    ?arguments:(arguments_ : partner_app_arguments option)
    ?admin_users:(admin_users_ : partner_app_admin_user_list option) () =
  ({
     role_group_assignments = role_group_assignments_;
     assigned_group_patterns = assigned_group_patterns_;
     arguments = arguments_;
     admin_users = admin_users_;
   }
    : partner_app_config)

let make_update_partner_app_request ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : client_token option)
    ?app_version:(app_version_ : major_minor_version option)
    ?enable_auto_minor_version_upgrade:(enable_auto_minor_version_upgrade_ : boolean_ option)
    ?enable_iam_session_based_identity:(enable_iam_session_based_identity_ : boolean_ option)
    ?application_config:(application_config_ : partner_app_config option)
    ?tier:(tier_ : non_empty_string64 option)
    ?maintenance_config:(maintenance_config_ : partner_app_maintenance_config option)
    ~arn:(arn_ : partner_app_arn) () =
  ({
     tags = tags_;
     client_token = client_token_;
     app_version = app_version_;
     enable_auto_minor_version_upgrade = enable_auto_minor_version_upgrade_;
     enable_iam_session_based_identity = enable_iam_session_based_identity_;
     application_config = application_config_;
     tier = tier_;
     maintenance_config = maintenance_config_;
     arn = arn_;
   }
    : update_partner_app_request)

let make_update_notebook_instance_output () = (() : unit)
let make_update_notebook_instance_lifecycle_config_output () = (() : unit)

let make_notebook_instance_lifecycle_hook
    ?content:(content_ : notebook_instance_lifecycle_config_content option) () =
  ({ content = content_ } : notebook_instance_lifecycle_hook)

let make_update_notebook_instance_lifecycle_config_input
    ?on_start:(on_start_ : notebook_instance_lifecycle_config_list option)
    ?on_create:(on_create_ : notebook_instance_lifecycle_config_list option)
    ~notebook_instance_lifecycle_config_name:
      (notebook_instance_lifecycle_config_name_ : notebook_instance_lifecycle_config_name) () =
  ({
     on_start = on_start_;
     on_create = on_create_;
     notebook_instance_lifecycle_config_name = notebook_instance_lifecycle_config_name_;
   }
    : update_notebook_instance_lifecycle_config_input)

let make_instance_metadata_service_configuration
    ~minimum_instance_metadata_service_version:
      (minimum_instance_metadata_service_version_ : minimum_instance_metadata_service_version) () =
  ({ minimum_instance_metadata_service_version = minimum_instance_metadata_service_version_ }
    : instance_metadata_service_configuration)

let make_update_notebook_instance_input
    ?instance_metadata_service_configuration:
      (instance_metadata_service_configuration_ : instance_metadata_service_configuration option)
    ?root_access:(root_access_ : root_access option)
    ?disassociate_additional_code_repositories:
      (disassociate_additional_code_repositories_ : disassociate_additional_code_repositories option)
    ?disassociate_default_code_repository:
      (disassociate_default_code_repository_ : disassociate_default_code_repository option)
    ?disassociate_accelerator_types:
      (disassociate_accelerator_types_ : disassociate_notebook_instance_accelerator_types option)
    ?accelerator_types:(accelerator_types_ : notebook_instance_accelerator_types option)
    ?additional_code_repositories:
      (additional_code_repositories_ : additional_code_repository_names_or_urls option)
    ?default_code_repository:(default_code_repository_ : code_repository_name_or_url option)
    ?volume_size_in_g_b:(volume_size_in_g_b_ : notebook_instance_volume_size_in_g_b option)
    ?disassociate_lifecycle_config:
      (disassociate_lifecycle_config_ : disassociate_notebook_instance_lifecycle_config option)
    ?lifecycle_config_name:(lifecycle_config_name_ : notebook_instance_lifecycle_config_name option)
    ?role_arn:(role_arn_ : role_arn option)
    ?platform_identifier:(platform_identifier_ : platform_identifier option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?instance_type:(instance_type_ : instance_type option)
    ~notebook_instance_name:(notebook_instance_name_ : notebook_instance_name) () =
  ({
     instance_metadata_service_configuration = instance_metadata_service_configuration_;
     root_access = root_access_;
     disassociate_additional_code_repositories = disassociate_additional_code_repositories_;
     disassociate_default_code_repository = disassociate_default_code_repository_;
     disassociate_accelerator_types = disassociate_accelerator_types_;
     accelerator_types = accelerator_types_;
     additional_code_repositories = additional_code_repositories_;
     default_code_repository = default_code_repository_;
     volume_size_in_g_b = volume_size_in_g_b_;
     disassociate_lifecycle_config = disassociate_lifecycle_config_;
     lifecycle_config_name = lifecycle_config_name_;
     role_arn = role_arn_;
     platform_identifier = platform_identifier_;
     ip_address_type = ip_address_type_;
     instance_type = instance_type_;
     notebook_instance_name = notebook_instance_name_;
   }
    : update_notebook_instance_input)

let make_update_monitoring_schedule_response
    ~monitoring_schedule_arn:(monitoring_schedule_arn_ : monitoring_schedule_arn) () =
  ({ monitoring_schedule_arn = monitoring_schedule_arn_ } : update_monitoring_schedule_response)

let make_schedule_config ?data_analysis_end_time:(data_analysis_end_time_ : string_ option)
    ?data_analysis_start_time:(data_analysis_start_time_ : string_ option)
    ~schedule_expression:(schedule_expression_ : schedule_expression) () =
  ({
     data_analysis_end_time = data_analysis_end_time_;
     data_analysis_start_time = data_analysis_start_time_;
     schedule_expression = schedule_expression_;
   }
    : schedule_config)

let make_monitoring_constraints_resource ?s3_uri:(s3_uri_ : s3_uri option) () =
  ({ s3_uri = s3_uri_ } : monitoring_constraints_resource)

let make_monitoring_statistics_resource ?s3_uri:(s3_uri_ : s3_uri option) () =
  ({ s3_uri = s3_uri_ } : monitoring_statistics_resource)

let make_monitoring_baseline_config
    ?statistics_resource:(statistics_resource_ : monitoring_statistics_resource option)
    ?constraints_resource:(constraints_resource_ : monitoring_constraints_resource option)
    ?baselining_job_name:(baselining_job_name_ : processing_job_name option) () =
  ({
     statistics_resource = statistics_resource_;
     constraints_resource = constraints_resource_;
     baselining_job_name = baselining_job_name_;
   }
    : monitoring_baseline_config)

let make_endpoint_input
    ?exclude_features_attribute:(exclude_features_attribute_ : exclude_features_attribute option)
    ?end_time_offset:(end_time_offset_ : monitoring_time_offset_string option)
    ?start_time_offset:(start_time_offset_ : monitoring_time_offset_string option)
    ?probability_threshold_attribute:
      (probability_threshold_attribute_ : probability_threshold_attribute option)
    ?probability_attribute:(probability_attribute_ : string_ option)
    ?inference_attribute:(inference_attribute_ : string_ option)
    ?features_attribute:(features_attribute_ : string_ option)
    ?s3_data_distribution_type:
      (s3_data_distribution_type_ : processing_s3_data_distribution_type option)
    ?s3_input_mode:(s3_input_mode_ : processing_s3_input_mode option)
    ~local_path:(local_path_ : processing_local_path)
    ~endpoint_name:(endpoint_name_ : endpoint_name) () =
  ({
     exclude_features_attribute = exclude_features_attribute_;
     end_time_offset = end_time_offset_;
     start_time_offset = start_time_offset_;
     probability_threshold_attribute = probability_threshold_attribute_;
     probability_attribute = probability_attribute_;
     inference_attribute = inference_attribute_;
     features_attribute = features_attribute_;
     s3_data_distribution_type = s3_data_distribution_type_;
     s3_input_mode = s3_input_mode_;
     local_path = local_path_;
     endpoint_name = endpoint_name_;
   }
    : endpoint_input)

let make_monitoring_csv_dataset_format ?header:(header_ : boolean_ option) () =
  ({ header = header_ } : monitoring_csv_dataset_format)

let make_monitoring_json_dataset_format ?line:(line_ : boolean_ option) () =
  ({ line = line_ } : monitoring_json_dataset_format)

let make_monitoring_parquet_dataset_format () = (() : unit)

let make_monitoring_dataset_format ?parquet:(parquet_ : monitoring_parquet_dataset_format option)
    ?json:(json_ : monitoring_json_dataset_format option)
    ?csv:(csv_ : monitoring_csv_dataset_format option) () =
  ({ parquet = parquet_; json = json_; csv = csv_ } : monitoring_dataset_format)

let make_batch_transform_input
    ?exclude_features_attribute:(exclude_features_attribute_ : exclude_features_attribute option)
    ?end_time_offset:(end_time_offset_ : monitoring_time_offset_string option)
    ?start_time_offset:(start_time_offset_ : monitoring_time_offset_string option)
    ?probability_threshold_attribute:
      (probability_threshold_attribute_ : probability_threshold_attribute option)
    ?probability_attribute:(probability_attribute_ : string_ option)
    ?inference_attribute:(inference_attribute_ : string_ option)
    ?features_attribute:(features_attribute_ : string_ option)
    ?s3_data_distribution_type:
      (s3_data_distribution_type_ : processing_s3_data_distribution_type option)
    ?s3_input_mode:(s3_input_mode_ : processing_s3_input_mode option)
    ~local_path:(local_path_ : processing_local_path)
    ~dataset_format:(dataset_format_ : monitoring_dataset_format)
    ~data_captured_destination_s3_uri:(data_captured_destination_s3_uri_ : destination_s3_uri) () =
  ({
     exclude_features_attribute = exclude_features_attribute_;
     end_time_offset = end_time_offset_;
     start_time_offset = start_time_offset_;
     probability_threshold_attribute = probability_threshold_attribute_;
     probability_attribute = probability_attribute_;
     inference_attribute = inference_attribute_;
     features_attribute = features_attribute_;
     s3_data_distribution_type = s3_data_distribution_type_;
     s3_input_mode = s3_input_mode_;
     local_path = local_path_;
     dataset_format = dataset_format_;
     data_captured_destination_s3_uri = data_captured_destination_s3_uri_;
   }
    : batch_transform_input)

let make_monitoring_input
    ?batch_transform_input:(batch_transform_input_ : batch_transform_input option)
    ?endpoint_input:(endpoint_input_ : endpoint_input option) () =
  ({ batch_transform_input = batch_transform_input_; endpoint_input = endpoint_input_ }
    : monitoring_input)

let make_monitoring_s3_output ?s3_upload_mode:(s3_upload_mode_ : processing_s3_upload_mode option)
    ~local_path:(local_path_ : processing_local_path) ~s3_uri:(s3_uri_ : monitoring_s3_uri) () =
  ({ s3_upload_mode = s3_upload_mode_; local_path = local_path_; s3_uri = s3_uri_ }
    : monitoring_s3_output)

let make_monitoring_output ~s3_output:(s3_output_ : monitoring_s3_output) () =
  ({ s3_output = s3_output_ } : monitoring_output)

let make_monitoring_output_config ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ~monitoring_outputs:(monitoring_outputs_ : monitoring_outputs) () =
  ({ kms_key_id = kms_key_id_; monitoring_outputs = monitoring_outputs_ }
    : monitoring_output_config)

let make_monitoring_cluster_config ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ~volume_size_in_g_b:(volume_size_in_g_b_ : processing_volume_size_in_g_b)
    ~instance_type:(instance_type_ : processing_instance_type)
    ~instance_count:(instance_count_ : processing_instance_count) () =
  ({
     volume_kms_key_id = volume_kms_key_id_;
     volume_size_in_g_b = volume_size_in_g_b_;
     instance_type = instance_type_;
     instance_count = instance_count_;
   }
    : monitoring_cluster_config)

let make_monitoring_resources ~cluster_config:(cluster_config_ : monitoring_cluster_config) () =
  ({ cluster_config = cluster_config_ } : monitoring_resources)

let make_monitoring_app_specification
    ?post_analytics_processor_source_uri:(post_analytics_processor_source_uri_ : s3_uri option)
    ?record_preprocessor_source_uri:(record_preprocessor_source_uri_ : s3_uri option)
    ?container_arguments:(container_arguments_ : monitoring_container_arguments option)
    ?container_entrypoint:(container_entrypoint_ : container_entrypoint option)
    ~image_uri:(image_uri_ : image_uri) () =
  ({
     post_analytics_processor_source_uri = post_analytics_processor_source_uri_;
     record_preprocessor_source_uri = record_preprocessor_source_uri_;
     container_arguments = container_arguments_;
     container_entrypoint = container_entrypoint_;
     image_uri = image_uri_;
   }
    : monitoring_app_specification)

let make_monitoring_stopping_condition
    ~max_runtime_in_seconds:(max_runtime_in_seconds_ : monitoring_max_runtime_in_seconds) () =
  ({ max_runtime_in_seconds = max_runtime_in_seconds_ } : monitoring_stopping_condition)

let make_network_config ?vpc_config:(vpc_config_ : vpc_config option)
    ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ?enable_inter_container_traffic_encryption:
      (enable_inter_container_traffic_encryption_ : boolean_ option) () =
  ({
     vpc_config = vpc_config_;
     enable_network_isolation = enable_network_isolation_;
     enable_inter_container_traffic_encryption = enable_inter_container_traffic_encryption_;
   }
    : network_config)

let make_monitoring_job_definition ?network_config:(network_config_ : network_config option)
    ?environment:(environment_ : monitoring_environment_map option)
    ?stopping_condition:(stopping_condition_ : monitoring_stopping_condition option)
    ?baseline_config:(baseline_config_ : monitoring_baseline_config option)
    ~role_arn:(role_arn_ : role_arn)
    ~monitoring_app_specification:(monitoring_app_specification_ : monitoring_app_specification)
    ~monitoring_resources:(monitoring_resources_ : monitoring_resources)
    ~monitoring_output_config:(monitoring_output_config_ : monitoring_output_config)
    ~monitoring_inputs:(monitoring_inputs_ : monitoring_inputs) () =
  ({
     role_arn = role_arn_;
     network_config = network_config_;
     environment = environment_;
     stopping_condition = stopping_condition_;
     monitoring_app_specification = monitoring_app_specification_;
     monitoring_resources = monitoring_resources_;
     monitoring_output_config = monitoring_output_config_;
     monitoring_inputs = monitoring_inputs_;
     baseline_config = baseline_config_;
   }
    : monitoring_job_definition)

let make_monitoring_schedule_config ?monitoring_type:(monitoring_type_ : monitoring_type option)
    ?monitoring_job_definition_name:
      (monitoring_job_definition_name_ : monitoring_job_definition_name option)
    ?monitoring_job_definition:(monitoring_job_definition_ : monitoring_job_definition option)
    ?schedule_config:(schedule_config_ : schedule_config option) () =
  ({
     monitoring_type = monitoring_type_;
     monitoring_job_definition_name = monitoring_job_definition_name_;
     monitoring_job_definition = monitoring_job_definition_;
     schedule_config = schedule_config_;
   }
    : monitoring_schedule_config)

let make_update_monitoring_schedule_request
    ~monitoring_schedule_config:(monitoring_schedule_config_ : monitoring_schedule_config)
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name) () =
  ({
     monitoring_schedule_config = monitoring_schedule_config_;
     monitoring_schedule_name = monitoring_schedule_name_;
   }
    : update_monitoring_schedule_request)

let make_update_monitoring_alert_response
    ?monitoring_alert_name:(monitoring_alert_name_ : monitoring_alert_name option)
    ~monitoring_schedule_arn:(monitoring_schedule_arn_ : monitoring_schedule_arn) () =
  ({
     monitoring_alert_name = monitoring_alert_name_;
     monitoring_schedule_arn = monitoring_schedule_arn_;
   }
    : update_monitoring_alert_response)

let make_update_monitoring_alert_request
    ~evaluation_period:(evaluation_period_ : monitoring_evaluation_period)
    ~datapoints_to_alert:(datapoints_to_alert_ : monitoring_datapoints_to_alert)
    ~monitoring_alert_name:(monitoring_alert_name_ : monitoring_alert_name)
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name) () =
  ({
     evaluation_period = evaluation_period_;
     datapoints_to_alert = datapoints_to_alert_;
     monitoring_alert_name = monitoring_alert_name_;
     monitoring_schedule_name = monitoring_schedule_name_;
   }
    : update_monitoring_alert_request)

let make_update_model_package_output ~model_package_arn:(model_package_arn_ : model_package_arn) ()
    =
  ({ model_package_arn = model_package_arn_ } : update_model_package_output)

let make_model_access_config ~accept_eula:(accept_eula_ : accept_eula) () =
  ({ accept_eula = accept_eula_ } : model_access_config)

let make_inference_hub_access_config ~hub_content_arn:(hub_content_arn_ : hub_content_arn) () =
  ({ hub_content_arn = hub_content_arn_ } : inference_hub_access_config)

let make_s3_model_data_source ?manifest_etag:(manifest_etag_ : string_ option)
    ?e_tag:(e_tag_ : string_ option) ?manifest_s3_uri:(manifest_s3_uri_ : s3_model_uri option)
    ?hub_access_config:(hub_access_config_ : inference_hub_access_config option)
    ?model_access_config:(model_access_config_ : model_access_config option)
    ~compression_type:(compression_type_ : model_compression_type)
    ~s3_data_type:(s3_data_type_ : s3_model_data_type) ~s3_uri:(s3_uri_ : s3_model_uri) () =
  ({
     manifest_etag = manifest_etag_;
     e_tag = e_tag_;
     manifest_s3_uri = manifest_s3_uri_;
     hub_access_config = hub_access_config_;
     model_access_config = model_access_config_;
     compression_type = compression_type_;
     s3_data_type = s3_data_type_;
     s3_uri = s3_uri_;
   }
    : s3_model_data_source)

let make_model_data_source ?s3_data_source:(s3_data_source_ : s3_model_data_source option) () =
  ({ s3_data_source = s3_data_source_ } : model_data_source)

let make_model_input ~data_input_config:(data_input_config_ : data_input_config) () =
  ({ data_input_config = data_input_config_ } : model_input)

let make_additional_model_data_source ~s3_data_source:(s3_data_source_ : s3_model_data_source)
    ~channel_name:(channel_name_ : additional_model_channel_name) () =
  ({ s3_data_source = s3_data_source_; channel_name = channel_name_ }
    : additional_model_data_source)

let make_additional_s3_data_source ?e_tag:(e_tag_ : string_ option)
    ?compression_type:(compression_type_ : compression_type option) ~s3_uri:(s3_uri_ : s3_uri)
    ~s3_data_type:(s3_data_type_ : additional_s3_data_source_data_type) () =
  ({
     e_tag = e_tag_;
     compression_type = compression_type_;
     s3_uri = s3_uri_;
     s3_data_type = s3_data_type_;
   }
    : additional_s3_data_source)

let make_base_model ?recipe_name:(recipe_name_ : recipe_name option)
    ?hub_content_version:(hub_content_version_ : hub_content_version option)
    ?hub_content_name:(hub_content_name_ : hub_content_name option) () =
  ({
     recipe_name = recipe_name_;
     hub_content_version = hub_content_version_;
     hub_content_name = hub_content_name_;
   }
    : base_model)

let make_model_package_container_definition ?base_model:(base_model_ : base_model option)
    ?is_checkpoint:(is_checkpoint_ : boolean_ option)
    ?model_data_e_tag:(model_data_e_tag_ : string_ option)
    ?additional_s3_data_source:(additional_s3_data_source_ : additional_s3_data_source option)
    ?additional_model_data_sources:
      (additional_model_data_sources_ : additional_model_data_sources option)
    ?nearest_model_name:(nearest_model_name_ : string_ option)
    ?framework_version:(framework_version_ : model_package_framework_version option)
    ?framework:(framework_ : string_ option) ?model_input:(model_input_ : model_input option)
    ?environment:(environment_ : environment_map option)
    ?product_id:(product_id_ : product_id option)
    ?model_data_source:(model_data_source_ : model_data_source option)
    ?model_data_url:(model_data_url_ : url option)
    ?image_digest:(image_digest_ : image_digest option) ?image:(image_ : container_image option)
    ?container_hostname:(container_hostname_ : container_hostname option) () =
  ({
     base_model = base_model_;
     is_checkpoint = is_checkpoint_;
     model_data_e_tag = model_data_e_tag_;
     additional_s3_data_source = additional_s3_data_source_;
     additional_model_data_sources = additional_model_data_sources_;
     nearest_model_name = nearest_model_name_;
     framework_version = framework_version_;
     framework = framework_;
     model_input = model_input_;
     environment = environment_;
     product_id = product_id_;
     model_data_source = model_data_source_;
     model_data_url = model_data_url_;
     image_digest = image_digest_;
     image = image_;
     container_hostname = container_hostname_;
   }
    : model_package_container_definition)

let make_additional_inference_specification_definition
    ?supported_response_mime_types:(supported_response_mime_types_ : response_mime_types option)
    ?supported_content_types:(supported_content_types_ : content_types option)
    ?supported_realtime_inference_instance_types:
      (supported_realtime_inference_instance_types_ : realtime_inference_instance_types option)
    ?supported_transform_instance_types:
      (supported_transform_instance_types_ : transform_instance_types option)
    ?description:(description_ : entity_description option)
    ~containers:(containers_ : model_package_container_definition_list) ~name:(name_ : entity_name)
    () =
  ({
     supported_response_mime_types = supported_response_mime_types_;
     supported_content_types = supported_content_types_;
     supported_realtime_inference_instance_types = supported_realtime_inference_instance_types_;
     supported_transform_instance_types = supported_transform_instance_types_;
     containers = containers_;
     description = description_;
     name = name_;
   }
    : additional_inference_specification_definition)

let make_inference_specification
    ?supported_response_mime_types:(supported_response_mime_types_ : response_mime_types option)
    ?supported_content_types:(supported_content_types_ : content_types option)
    ?supported_realtime_inference_instance_types:
      (supported_realtime_inference_instance_types_ : realtime_inference_instance_types option)
    ?supported_transform_instance_types:
      (supported_transform_instance_types_ : transform_instance_types option)
    ~containers:(containers_ : model_package_container_definition_list) () =
  ({
     supported_response_mime_types = supported_response_mime_types_;
     supported_content_types = supported_content_types_;
     supported_realtime_inference_instance_types = supported_realtime_inference_instance_types_;
     supported_transform_instance_types = supported_transform_instance_types_;
     containers = containers_;
   }
    : inference_specification)

let make_model_package_model_card ?model_card_status:(model_card_status_ : model_card_status option)
    ?model_card_content:(model_card_content_ : model_card_content option) () =
  ({ model_card_status = model_card_status_; model_card_content = model_card_content_ }
    : model_package_model_card)

let make_model_life_cycle ?stage_description:(stage_description_ : stage_description option)
    ~stage_status:(stage_status_ : entity_name) ~stage:(stage_ : entity_name) () =
  ({ stage_description = stage_description_; stage_status = stage_status_; stage = stage_ }
    : model_life_cycle)

let make_update_model_package_input ?client_token:(client_token_ : client_token option)
    ?model_life_cycle:(model_life_cycle_ : model_life_cycle option)
    ?model_card:(model_card_ : model_package_model_card option)
    ?source_uri:(source_uri_ : model_package_source_uri option)
    ?inference_specification:(inference_specification_ : inference_specification option)
    ?additional_inference_specifications_to_add:
      (additional_inference_specifications_to_add_ : additional_inference_specifications option)
    ?customer_metadata_properties_to_remove:
      (customer_metadata_properties_to_remove_ : customer_metadata_key_list option)
    ?customer_metadata_properties:(customer_metadata_properties_ : customer_metadata_map option)
    ?approval_description:(approval_description_ : approval_description option)
    ?model_package_registration_type:
      (model_package_registration_type_ : model_package_registration_type option)
    ?model_approval_status:(model_approval_status_ : model_approval_status option)
    ~model_package_arn:(model_package_arn_ : model_package_arn) () =
  ({
     client_token = client_token_;
     model_life_cycle = model_life_cycle_;
     model_card = model_card_;
     source_uri = source_uri_;
     inference_specification = inference_specification_;
     additional_inference_specifications_to_add = additional_inference_specifications_to_add_;
     customer_metadata_properties_to_remove = customer_metadata_properties_to_remove_;
     customer_metadata_properties = customer_metadata_properties_;
     approval_description = approval_description_;
     model_package_registration_type = model_package_registration_type_;
     model_approval_status = model_approval_status_;
     model_package_arn = model_package_arn_;
   }
    : update_model_package_input)

let make_update_model_card_response ~model_card_arn:(model_card_arn_ : model_card_arn) () =
  ({ model_card_arn = model_card_arn_ } : update_model_card_response)

let make_update_model_card_request
    ?model_card_status:(model_card_status_ : model_card_status option)
    ?content:(content_ : model_card_content option)
    ~model_card_name:(model_card_name_ : model_card_name_or_arn) () =
  ({
     model_card_status = model_card_status_;
     content = content_;
     model_card_name = model_card_name_;
   }
    : update_model_card_request)

let make_update_mlflow_tracking_server_response
    ?tracking_server_arn:(tracking_server_arn_ : tracking_server_arn option) () =
  ({ tracking_server_arn = tracking_server_arn_ } : update_mlflow_tracking_server_response)

let make_update_mlflow_tracking_server_request
    ?s3_bucket_owner_verification:(s3_bucket_owner_verification_ : boolean_ option)
    ?s3_bucket_owner_account_id:(s3_bucket_owner_account_id_ : account_id option)
    ?weekly_maintenance_window_start:
      (weekly_maintenance_window_start_ : weekly_maintenance_window_start option)
    ?automatic_model_registration:(automatic_model_registration_ : boolean_ option)
    ?tracking_server_size:(tracking_server_size_ : tracking_server_size option)
    ?artifact_store_uri:(artifact_store_uri_ : s3_uri option)
    ~tracking_server_name:(tracking_server_name_ : tracking_server_name) () =
  ({
     s3_bucket_owner_verification = s3_bucket_owner_verification_;
     s3_bucket_owner_account_id = s3_bucket_owner_account_id_;
     weekly_maintenance_window_start = weekly_maintenance_window_start_;
     automatic_model_registration = automatic_model_registration_;
     tracking_server_size = tracking_server_size_;
     artifact_store_uri = artifact_store_uri_;
     tracking_server_name = tracking_server_name_;
   }
    : update_mlflow_tracking_server_request)

let make_update_mlflow_app_response ?arn:(arn_ : mlflow_app_arn option) () =
  ({ arn = arn_ } : update_mlflow_app_response)

let make_update_mlflow_app_request
    ?account_default_status:(account_default_status_ : account_default_status option)
    ?default_domain_id_list:(default_domain_id_list_ : default_domain_id_list option)
    ?weekly_maintenance_window_start:
      (weekly_maintenance_window_start_ : weekly_maintenance_window_start option)
    ?model_registration_mode:(model_registration_mode_ : model_registration_mode option)
    ?artifact_store_uri:(artifact_store_uri_ : s3_uri option) ?name:(name_ : mlflow_app_name option)
    ~arn:(arn_ : mlflow_app_arn) () =
  ({
     account_default_status = account_default_status_;
     default_domain_id_list = default_domain_id_list_;
     weekly_maintenance_window_start = weekly_maintenance_window_start_;
     model_registration_mode = model_registration_mode_;
     artifact_store_uri = artifact_store_uri_;
     name = name_;
     arn = arn_;
   }
    : update_mlflow_app_request)

let make_update_inference_experiment_response
    ~inference_experiment_arn:(inference_experiment_arn_ : inference_experiment_arn) () =
  ({ inference_experiment_arn = inference_experiment_arn_ } : update_inference_experiment_response)

let make_inference_experiment_schedule ?end_time:(end_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option) () =
  ({ end_time = end_time_; start_time = start_time_ } : inference_experiment_schedule)

let make_real_time_inference_config ~instance_count:(instance_count_ : task_count)
    ~instance_type:(instance_type_ : production_variant_instance_type) () =
  ({ instance_count = instance_count_; instance_type = instance_type_ }
    : real_time_inference_config)

let make_model_infrastructure_config
    ~real_time_inference_config:(real_time_inference_config_ : real_time_inference_config)
    ~infrastructure_type:(infrastructure_type_ : model_infrastructure_type) () =
  ({
     real_time_inference_config = real_time_inference_config_;
     infrastructure_type = infrastructure_type_;
   }
    : model_infrastructure_config)

let make_model_variant_config
    ~infrastructure_config:(infrastructure_config_ : model_infrastructure_config)
    ~variant_name:(variant_name_ : model_variant_name) ~model_name:(model_name_ : model_name) () =
  ({
     infrastructure_config = infrastructure_config_;
     variant_name = variant_name_;
     model_name = model_name_;
   }
    : model_variant_config)

let make_capture_content_type_header
    ?json_content_types:(json_content_types_ : json_content_types option)
    ?csv_content_types:(csv_content_types_ : csv_content_types option) () =
  ({ json_content_types = json_content_types_; csv_content_types = csv_content_types_ }
    : capture_content_type_header)

let make_inference_experiment_data_storage_config
    ?content_type:(content_type_ : capture_content_type_header option)
    ?kms_key:(kms_key_ : kms_key_id option) ~destination:(destination_ : destination_s3_uri) () =
  ({ content_type = content_type_; kms_key = kms_key_; destination = destination_ }
    : inference_experiment_data_storage_config)

let make_shadow_model_variant_config ~sampling_percentage:(sampling_percentage_ : percentage)
    ~shadow_model_variant_name:(shadow_model_variant_name_ : model_variant_name) () =
  ({
     sampling_percentage = sampling_percentage_;
     shadow_model_variant_name = shadow_model_variant_name_;
   }
    : shadow_model_variant_config)

let make_shadow_mode_config
    ~shadow_model_variants:(shadow_model_variants_ : shadow_model_variant_config_list)
    ~source_model_variant_name:(source_model_variant_name_ : model_variant_name) () =
  ({
     shadow_model_variants = shadow_model_variants_;
     source_model_variant_name = source_model_variant_name_;
   }
    : shadow_mode_config)

let make_update_inference_experiment_request
    ?shadow_mode_config:(shadow_mode_config_ : shadow_mode_config option)
    ?data_storage_config:(data_storage_config_ : inference_experiment_data_storage_config option)
    ?model_variants:(model_variants_ : model_variant_config_list option)
    ?description:(description_ : inference_experiment_description option)
    ?schedule:(schedule_ : inference_experiment_schedule option)
    ~name:(name_ : inference_experiment_name) () =
  ({
     shadow_mode_config = shadow_mode_config_;
     data_storage_config = data_storage_config_;
     model_variants = model_variants_;
     description = description_;
     schedule = schedule_;
     name = name_;
   }
    : update_inference_experiment_request)

let make_update_inference_component_runtime_config_output
    ~inference_component_arn:(inference_component_arn_ : inference_component_arn) () =
  ({ inference_component_arn = inference_component_arn_ }
    : update_inference_component_runtime_config_output)

let make_inference_component_runtime_config
    ~copy_count:(copy_count_ : inference_component_copy_count) () =
  ({ copy_count = copy_count_ } : inference_component_runtime_config)

let make_update_inference_component_runtime_config_input
    ~desired_runtime_config:(desired_runtime_config_ : inference_component_runtime_config)
    ~inference_component_name:(inference_component_name_ : inference_component_name) () =
  ({
     desired_runtime_config = desired_runtime_config_;
     inference_component_name = inference_component_name_;
   }
    : update_inference_component_runtime_config_input)

let make_update_inference_component_output
    ~inference_component_arn:(inference_component_arn_ : inference_component_arn) () =
  ({ inference_component_arn = inference_component_arn_ } : update_inference_component_output)

let make_metrics_endpoint
    ?metric_publish_frequency_in_seconds:
      (metric_publish_frequency_in_seconds_ : metric_publish_frequency_in_seconds option)
    ~metrics_endpoint_path:(metrics_endpoint_path_ : metrics_endpoint_path) () =
  ({
     metric_publish_frequency_in_seconds = metric_publish_frequency_in_seconds_;
     metrics_endpoint_path = metrics_endpoint_path_;
   }
    : metrics_endpoint)

let make_container_metrics_config
    ?metrics_endpoints:(metrics_endpoints_ : metrics_endpoint_list option) () =
  ({ metrics_endpoints = metrics_endpoints_ } : container_metrics_config)

let make_inference_component_container_specification
    ?container_metrics_config:(container_metrics_config_ : container_metrics_config option)
    ?environment:(environment_ : environment_map option) ?artifact_url:(artifact_url_ : url option)
    ?image:(image_ : container_image option) () =
  ({
     container_metrics_config = container_metrics_config_;
     environment = environment_;
     artifact_url = artifact_url_;
     image = image_;
   }
    : inference_component_container_specification)

let make_inference_component_startup_parameters
    ?container_startup_health_check_timeout_in_seconds:
      (container_startup_health_check_timeout_in_seconds_ :
         production_variant_container_startup_health_check_timeout_in_seconds option)
    ?model_data_download_timeout_in_seconds:
      (model_data_download_timeout_in_seconds_ :
         production_variant_model_data_download_timeout_in_seconds option) () =
  ({
     container_startup_health_check_timeout_in_seconds =
       container_startup_health_check_timeout_in_seconds_;
     model_data_download_timeout_in_seconds = model_data_download_timeout_in_seconds_;
   }
    : inference_component_startup_parameters)

let make_inference_component_compute_resource_requirements
    ?max_memory_required_in_mb:(max_memory_required_in_mb_ : memory_in_mb option)
    ?number_of_accelerator_devices_required:
      (number_of_accelerator_devices_required_ : number_of_accelerator_devices option)
    ?number_of_cpu_cores_required:(number_of_cpu_cores_required_ : number_of_cpu_cores option)
    ~min_memory_required_in_mb:(min_memory_required_in_mb_ : memory_in_mb) () =
  ({
     max_memory_required_in_mb = max_memory_required_in_mb_;
     min_memory_required_in_mb = min_memory_required_in_mb_;
     number_of_accelerator_devices_required = number_of_accelerator_devices_required_;
     number_of_cpu_cores_required = number_of_cpu_cores_required_;
   }
    : inference_component_compute_resource_requirements)

let make_inference_component_data_cache_config ~enable_caching:(enable_caching_ : enable_caching) ()
    =
  ({ enable_caching = enable_caching_ } : inference_component_data_cache_config)

let make_inference_component_availability_zone_balance
    ?max_imbalance:(max_imbalance_ : availability_zone_balance_max_imbalance option)
    ~enforcement_mode:(enforcement_mode_ : availability_zone_balance_enforcement_mode) () =
  ({ max_imbalance = max_imbalance_; enforcement_mode = enforcement_mode_ }
    : inference_component_availability_zone_balance)

let make_inference_component_scheduling_config
    ?availability_zone_balance:
      (availability_zone_balance_ : inference_component_availability_zone_balance option)
    ~placement_strategy:(placement_strategy_ : inference_component_placement_strategy) () =
  ({
     availability_zone_balance = availability_zone_balance_;
     placement_strategy = placement_strategy_;
   }
    : inference_component_scheduling_config)

let make_inference_component_specification
    ?scheduling_config:(scheduling_config_ : inference_component_scheduling_config option)
    ?data_cache_config:(data_cache_config_ : inference_component_data_cache_config option)
    ?base_inference_component_name:
      (base_inference_component_name_ : inference_component_name option)
    ?compute_resource_requirements:
      (compute_resource_requirements_ : inference_component_compute_resource_requirements option)
    ?startup_parameters:(startup_parameters_ : inference_component_startup_parameters option)
    ?container:(container_ : inference_component_container_specification option)
    ?model_name:(model_name_ : model_name option)
    ?instance_type:(instance_type_ : production_variant_instance_type option) () =
  ({
     scheduling_config = scheduling_config_;
     data_cache_config = data_cache_config_;
     base_inference_component_name = base_inference_component_name_;
     compute_resource_requirements = compute_resource_requirements_;
     startup_parameters = startup_parameters_;
     container = container_;
     model_name = model_name_;
     instance_type = instance_type_;
   }
    : inference_component_specification)

let make_inference_component_capacity_size ~value:(value_ : capacity_size_value)
    ~type_:(type__ : inference_component_capacity_size_type) () =
  ({ value = value_; type_ = type__ } : inference_component_capacity_size)

let make_inference_component_rolling_update_policy
    ?rollback_maximum_batch_size:
      (rollback_maximum_batch_size_ : inference_component_capacity_size option)
    ?maximum_execution_timeout_in_seconds:
      (maximum_execution_timeout_in_seconds_ : maximum_execution_timeout_in_seconds option)
    ~wait_interval_in_seconds:(wait_interval_in_seconds_ : wait_interval_in_seconds)
    ~maximum_batch_size:(maximum_batch_size_ : inference_component_capacity_size) () =
  ({
     rollback_maximum_batch_size = rollback_maximum_batch_size_;
     maximum_execution_timeout_in_seconds = maximum_execution_timeout_in_seconds_;
     wait_interval_in_seconds = wait_interval_in_seconds_;
     maximum_batch_size = maximum_batch_size_;
   }
    : inference_component_rolling_update_policy)

let make_alarm ?alarm_name:(alarm_name_ : alarm_name option) () =
  ({ alarm_name = alarm_name_ } : alarm)

let make_auto_rollback_config ?alarms:(alarms_ : alarm_list option) () =
  ({ alarms = alarms_ } : auto_rollback_config)

let make_inference_component_deployment_config
    ?auto_rollback_configuration:(auto_rollback_configuration_ : auto_rollback_config option)
    ~rolling_update_policy:(rolling_update_policy_ : inference_component_rolling_update_policy) () =
  ({
     auto_rollback_configuration = auto_rollback_configuration_;
     rolling_update_policy = rolling_update_policy_;
   }
    : inference_component_deployment_config)

let make_update_inference_component_input
    ?deployment_config:(deployment_config_ : inference_component_deployment_config option)
    ?runtime_config:(runtime_config_ : inference_component_runtime_config option)
    ?specifications:(specifications_ : inference_component_specification_list option)
    ?specification:(specification_ : inference_component_specification option)
    ~inference_component_name:(inference_component_name_ : inference_component_name) () =
  ({
     deployment_config = deployment_config_;
     runtime_config = runtime_config_;
     specifications = specifications_;
     specification = specification_;
     inference_component_name = inference_component_name_;
   }
    : update_inference_component_input)

let make_update_image_version_response
    ?image_version_arn:(image_version_arn_ : image_version_arn option) () =
  ({ image_version_arn = image_version_arn_ } : update_image_version_response)

let make_update_image_version_request ?release_notes:(release_notes_ : release_notes option)
    ?horovod:(horovod_ : horovod option) ?processor:(processor_ : processor option)
    ?programming_lang:(programming_lang_ : programming_lang option)
    ?ml_framework:(ml_framework_ : ml_framework option) ?job_type:(job_type_ : job_type option)
    ?vendor_guidance:(vendor_guidance_ : vendor_guidance option)
    ?aliases_to_delete:(aliases_to_delete_ : sage_maker_image_version_aliases option)
    ?aliases_to_add:(aliases_to_add_ : sage_maker_image_version_aliases option)
    ?version:(version_ : image_version_number option)
    ?alias:(alias_ : sage_maker_image_version_alias option) ~image_name:(image_name_ : image_name)
    () =
  ({
     release_notes = release_notes_;
     horovod = horovod_;
     processor = processor_;
     programming_lang = programming_lang_;
     ml_framework = ml_framework_;
     job_type = job_type_;
     vendor_guidance = vendor_guidance_;
     aliases_to_delete = aliases_to_delete_;
     aliases_to_add = aliases_to_add_;
     version = version_;
     alias = alias_;
     image_name = image_name_;
   }
    : update_image_version_request)

let make_update_image_response ?image_arn:(image_arn_ : image_arn option) () =
  ({ image_arn = image_arn_ } : update_image_response)

let make_update_image_request ?role_arn:(role_arn_ : role_arn option)
    ?display_name:(display_name_ : image_display_name option)
    ?description:(description_ : image_description option)
    ?delete_properties:(delete_properties_ : image_delete_property_list option)
    ~image_name:(image_name_ : image_name) () =
  ({
     role_arn = role_arn_;
     image_name = image_name_;
     display_name = display_name_;
     description = description_;
     delete_properties = delete_properties_;
   }
    : update_image_request)

let make_update_hub_response ~hub_arn:(hub_arn_ : hub_arn) () =
  ({ hub_arn = hub_arn_ } : update_hub_response)

let make_update_hub_request
    ?hub_search_keywords:(hub_search_keywords_ : hub_search_keyword_list option)
    ?hub_display_name:(hub_display_name_ : hub_display_name option)
    ?hub_description:(hub_description_ : hub_description option)
    ~hub_name:(hub_name_ : hub_name_or_arn) () =
  ({
     hub_search_keywords = hub_search_keywords_;
     hub_display_name = hub_display_name_;
     hub_description = hub_description_;
     hub_name = hub_name_;
   }
    : update_hub_request)

let make_update_hub_content_response ~hub_content_arn:(hub_content_arn_ : hub_content_arn)
    ~hub_arn:(hub_arn_ : hub_arn) () =
  ({ hub_content_arn = hub_content_arn_; hub_arn = hub_arn_ } : update_hub_content_response)

let make_update_hub_content_request
    ?support_status:(support_status_ : hub_content_support_status option)
    ?hub_content_search_keywords:
      (hub_content_search_keywords_ : hub_content_search_keyword_list option)
    ?hub_content_markdown:(hub_content_markdown_ : hub_content_markdown option)
    ?hub_content_description:(hub_content_description_ : hub_content_description option)
    ?hub_content_display_name:(hub_content_display_name_ : hub_content_display_name option)
    ~hub_content_version:(hub_content_version_ : hub_content_version)
    ~hub_content_type:(hub_content_type_ : hub_content_type)
    ~hub_content_name:(hub_content_name_ : hub_content_name) ~hub_name:(hub_name_ : hub_name_or_arn)
    () =
  ({
     support_status = support_status_;
     hub_content_search_keywords = hub_content_search_keywords_;
     hub_content_markdown = hub_content_markdown_;
     hub_content_description = hub_content_description_;
     hub_content_display_name = hub_content_display_name_;
     hub_content_version = hub_content_version_;
     hub_content_type = hub_content_type_;
     hub_content_name = hub_content_name_;
     hub_name = hub_name_;
   }
    : update_hub_content_request)

let make_update_hub_content_reference_response ~hub_content_arn:(hub_content_arn_ : hub_content_arn)
    ~hub_arn:(hub_arn_ : hub_arn) () =
  ({ hub_content_arn = hub_content_arn_; hub_arn = hub_arn_ }
    : update_hub_content_reference_response)

let make_update_hub_content_reference_request
    ?min_version:(min_version_ : hub_content_version option)
    ~hub_content_type:(hub_content_type_ : hub_content_type)
    ~hub_content_name:(hub_content_name_ : hub_content_name) ~hub_name:(hub_name_ : hub_name_or_arn)
    () =
  ({
     min_version = min_version_;
     hub_content_type = hub_content_type_;
     hub_content_name = hub_content_name_;
     hub_name = hub_name_;
   }
    : update_hub_content_reference_request)

let make_feature_parameter ?value:(value_ : feature_parameter_value option)
    ?key:(key_ : feature_parameter_key option) () =
  ({ value = value_; key = key_ } : feature_parameter)

let make_update_feature_metadata_request
    ?parameter_removals:(parameter_removals_ : feature_parameter_removals option)
    ?parameter_additions:(parameter_additions_ : feature_parameter_additions option)
    ?description:(description_ : feature_description option)
    ~feature_name:(feature_name_ : feature_name)
    ~feature_group_name:(feature_group_name_ : feature_group_name_or_arn) () =
  ({
     parameter_removals = parameter_removals_;
     parameter_additions = parameter_additions_;
     description = description_;
     feature_name = feature_name_;
     feature_group_name = feature_group_name_;
   }
    : update_feature_metadata_request)

let make_update_feature_group_response ~feature_group_arn:(feature_group_arn_ : feature_group_arn)
    () =
  ({ feature_group_arn = feature_group_arn_ } : update_feature_group_response)

let make_feature_definition ?collection_config:(collection_config_ : collection_config option)
    ?collection_type:(collection_type_ : collection_type option)
    ~feature_type:(feature_type_ : feature_type) ~feature_name:(feature_name_ : feature_name) () =
  ({
     collection_config = collection_config_;
     collection_type = collection_type_;
     feature_type = feature_type_;
     feature_name = feature_name_;
   }
    : feature_definition)

let make_ttl_duration ?value:(value_ : ttl_duration_value option)
    ?unit_:(unit__ : ttl_duration_unit option) () =
  ({ value = value_; unit_ = unit__ } : ttl_duration)

let make_online_store_config_update ?ttl_duration:(ttl_duration_ : ttl_duration option) () =
  ({ ttl_duration = ttl_duration_ } : online_store_config_update)

let make_throughput_config_update
    ?provisioned_write_capacity_units:(provisioned_write_capacity_units_ : capacity_unit option)
    ?provisioned_read_capacity_units:(provisioned_read_capacity_units_ : capacity_unit option)
    ?throughput_mode:(throughput_mode_ : throughput_mode option) () =
  ({
     provisioned_write_capacity_units = provisioned_write_capacity_units_;
     provisioned_read_capacity_units = provisioned_read_capacity_units_;
     throughput_mode = throughput_mode_;
   }
    : throughput_config_update)

let make_update_feature_group_request
    ?throughput_config:(throughput_config_ : throughput_config_update option)
    ?online_store_config:(online_store_config_ : online_store_config_update option)
    ?feature_additions:(feature_additions_ : feature_additions option)
    ~feature_group_name:(feature_group_name_ : feature_group_name_or_arn) () =
  ({
     throughput_config = throughput_config_;
     online_store_config = online_store_config_;
     feature_additions = feature_additions_;
     feature_group_name = feature_group_name_;
   }
    : update_feature_group_request)

let make_update_experiment_response ?experiment_arn:(experiment_arn_ : experiment_arn option) () =
  ({ experiment_arn = experiment_arn_ } : update_experiment_response)

let make_update_experiment_request ?description:(description_ : experiment_description option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ~experiment_name:(experiment_name_ : experiment_entity_name) () =
  ({ description = description_; display_name = display_name_; experiment_name = experiment_name_ }
    : update_experiment_request)

let make_update_endpoint_weights_and_capacities_output ~endpoint_arn:(endpoint_arn_ : endpoint_arn)
    () =
  ({ endpoint_arn = endpoint_arn_ } : update_endpoint_weights_and_capacities_output)

let make_production_variant_serverless_update_config
    ?provisioned_concurrency:(provisioned_concurrency_ : serverless_provisioned_concurrency option)
    ?max_concurrency:(max_concurrency_ : serverless_max_concurrency option) () =
  ({ provisioned_concurrency = provisioned_concurrency_; max_concurrency = max_concurrency_ }
    : production_variant_serverless_update_config)

let make_desired_weight_and_capacity
    ?serverless_update_config:
      (serverless_update_config_ : production_variant_serverless_update_config option)
    ?desired_instance_count:(desired_instance_count_ : task_count option)
    ?desired_weight:(desired_weight_ : variant_weight option)
    ~variant_name:(variant_name_ : variant_name) () =
  ({
     serverless_update_config = serverless_update_config_;
     desired_instance_count = desired_instance_count_;
     desired_weight = desired_weight_;
     variant_name = variant_name_;
   }
    : desired_weight_and_capacity)

let make_update_endpoint_weights_and_capacities_input
    ~desired_weights_and_capacities:
      (desired_weights_and_capacities_ : desired_weight_and_capacity_list)
    ~endpoint_name:(endpoint_name_ : endpoint_name) () =
  ({
     desired_weights_and_capacities = desired_weights_and_capacities_;
     endpoint_name = endpoint_name_;
   }
    : update_endpoint_weights_and_capacities_input)

let make_update_endpoint_output ~endpoint_arn:(endpoint_arn_ : endpoint_arn) () =
  ({ endpoint_arn = endpoint_arn_ } : update_endpoint_output)

let make_capacity_size ~value:(value_ : capacity_size_value) ~type_:(type__ : capacity_size_type) ()
    =
  ({ value = value_; type_ = type__ } : capacity_size)

let make_traffic_routing_config ?linear_step_size:(linear_step_size_ : capacity_size option)
    ?canary_size:(canary_size_ : capacity_size option)
    ~wait_interval_in_seconds:(wait_interval_in_seconds_ : wait_interval_in_seconds)
    ~type_:(type__ : traffic_routing_config_type) () =
  ({
     linear_step_size = linear_step_size_;
     canary_size = canary_size_;
     wait_interval_in_seconds = wait_interval_in_seconds_;
     type_ = type__;
   }
    : traffic_routing_config)

let make_blue_green_update_policy
    ?maximum_execution_timeout_in_seconds:
      (maximum_execution_timeout_in_seconds_ : maximum_execution_timeout_in_seconds option)
    ?termination_wait_in_seconds:(termination_wait_in_seconds_ : termination_wait_in_seconds option)
    ~traffic_routing_configuration:(traffic_routing_configuration_ : traffic_routing_config) () =
  ({
     maximum_execution_timeout_in_seconds = maximum_execution_timeout_in_seconds_;
     termination_wait_in_seconds = termination_wait_in_seconds_;
     traffic_routing_configuration = traffic_routing_configuration_;
   }
    : blue_green_update_policy)

let make_rolling_update_policy
    ?rollback_maximum_batch_size:(rollback_maximum_batch_size_ : capacity_size option)
    ?maximum_execution_timeout_in_seconds:
      (maximum_execution_timeout_in_seconds_ : maximum_execution_timeout_in_seconds option)
    ~wait_interval_in_seconds:(wait_interval_in_seconds_ : wait_interval_in_seconds)
    ~maximum_batch_size:(maximum_batch_size_ : capacity_size) () =
  ({
     rollback_maximum_batch_size = rollback_maximum_batch_size_;
     maximum_execution_timeout_in_seconds = maximum_execution_timeout_in_seconds_;
     wait_interval_in_seconds = wait_interval_in_seconds_;
     maximum_batch_size = maximum_batch_size_;
   }
    : rolling_update_policy)

let make_deployment_config
    ?auto_rollback_configuration:(auto_rollback_configuration_ : auto_rollback_config option)
    ?rolling_update_policy:(rolling_update_policy_ : rolling_update_policy option)
    ?blue_green_update_policy:(blue_green_update_policy_ : blue_green_update_policy option) () =
  ({
     auto_rollback_configuration = auto_rollback_configuration_;
     rolling_update_policy = rolling_update_policy_;
     blue_green_update_policy = blue_green_update_policy_;
   }
    : deployment_config)

let make_update_endpoint_input
    ?retain_deployment_config:(retain_deployment_config_ : boolean_ option)
    ?deployment_config:(deployment_config_ : deployment_config option)
    ?exclude_retained_variant_properties:
      (exclude_retained_variant_properties_ : variant_property_list option)
    ?retain_all_variant_properties:(retain_all_variant_properties_ : boolean_ option)
    ~endpoint_config_name:(endpoint_config_name_ : endpoint_config_name)
    ~endpoint_name:(endpoint_name_ : endpoint_name) () =
  ({
     retain_deployment_config = retain_deployment_config_;
     deployment_config = deployment_config_;
     exclude_retained_variant_properties = exclude_retained_variant_properties_;
     retain_all_variant_properties = retain_all_variant_properties_;
     endpoint_config_name = endpoint_config_name_;
     endpoint_name = endpoint_name_;
   }
    : update_endpoint_input)

let make_update_domain_response ?domain_arn:(domain_arn_ : domain_arn option) () =
  ({ domain_arn = domain_arn_ } : update_domain_response)

let make_r_studio_server_pro_domain_settings_for_update
    ?r_studio_package_manager_url:(r_studio_package_manager_url_ : string_ option)
    ?r_studio_connect_url:(r_studio_connect_url_ : string_ option)
    ?default_resource_spec:(default_resource_spec_ : resource_spec option)
    ~domain_execution_role_arn:(domain_execution_role_arn_ : role_arn) () =
  ({
     r_studio_package_manager_url = r_studio_package_manager_url_;
     r_studio_connect_url = r_studio_connect_url_;
     default_resource_spec = default_resource_spec_;
     domain_execution_role_arn = domain_execution_role_arn_;
   }
    : r_studio_server_pro_domain_settings_for_update)

let make_trusted_identity_propagation_settings ~status:(status_ : feature_status) () =
  ({ status = status_ } : trusted_identity_propagation_settings)

let make_docker_settings ?rootless_docker:(rootless_docker_ : feature_status option)
    ?vpc_only_trusted_accounts:(vpc_only_trusted_accounts_ : vpc_only_trusted_accounts option)
    ?enable_docker_access:(enable_docker_access_ : feature_status option) () =
  ({
     rootless_docker = rootless_docker_;
     vpc_only_trusted_accounts = vpc_only_trusted_accounts_;
     enable_docker_access = enable_docker_access_;
   }
    : docker_settings)

let make_amazon_q_settings ?q_profile_arn:(q_profile_arn_ : q_profile_arn option)
    ?status:(status_ : feature_status option) () =
  ({ q_profile_arn = q_profile_arn_; status = status_ } : amazon_q_settings)

let make_unified_studio_settings
    ?single_sign_on_application_arn:
      (single_sign_on_application_arn_ : single_sign_on_application_arn option)
    ?project_s3_path:(project_s3_path_ : s3_uri option)
    ?environment_id:(environment_id_ : unified_studio_environment_id option)
    ?project_id:(project_id_ : unified_studio_project_id option)
    ?domain_id:(domain_id_ : unified_studio_domain_id option)
    ?domain_region:(domain_region_ : region_name option)
    ?domain_account_id:(domain_account_id_ : account_id option)
    ?studio_web_portal_access:(studio_web_portal_access_ : feature_status option) () =
  ({
     single_sign_on_application_arn = single_sign_on_application_arn_;
     project_s3_path = project_s3_path_;
     environment_id = environment_id_;
     project_id = project_id_;
     domain_id = domain_id_;
     domain_region = domain_region_;
     domain_account_id = domain_account_id_;
     studio_web_portal_access = studio_web_portal_access_;
   }
    : unified_studio_settings)

let make_domain_settings_for_update ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?unified_studio_settings:(unified_studio_settings_ : unified_studio_settings option)
    ?amazon_q_settings:(amazon_q_settings_ : amazon_q_settings option)
    ?docker_settings:(docker_settings_ : docker_settings option)
    ?trusted_identity_propagation_settings:
      (trusted_identity_propagation_settings_ : trusted_identity_propagation_settings option)
    ?security_group_ids:(security_group_ids_ : domain_security_group_ids option)
    ?execution_role_identity_config:
      (execution_role_identity_config_ : execution_role_identity_config option)
    ?r_studio_server_pro_domain_settings_for_update:
      (r_studio_server_pro_domain_settings_for_update_ :
         r_studio_server_pro_domain_settings_for_update option) () =
  ({
     ip_address_type = ip_address_type_;
     unified_studio_settings = unified_studio_settings_;
     amazon_q_settings = amazon_q_settings_;
     docker_settings = docker_settings_;
     trusted_identity_propagation_settings = trusted_identity_propagation_settings_;
     security_group_ids = security_group_ids_;
     execution_role_identity_config = execution_role_identity_config_;
     r_studio_server_pro_domain_settings_for_update =
       r_studio_server_pro_domain_settings_for_update_;
   }
    : domain_settings_for_update)

let make_default_space_settings
    ?custom_file_system_configs:(custom_file_system_configs_ : custom_file_system_configs option)
    ?custom_posix_user_config:(custom_posix_user_config_ : custom_posix_user_config option)
    ?space_storage_settings:(space_storage_settings_ : default_space_storage_settings option)
    ?jupyter_lab_app_settings:(jupyter_lab_app_settings_ : jupyter_lab_app_settings option)
    ?kernel_gateway_app_settings:(kernel_gateway_app_settings_ : kernel_gateway_app_settings option)
    ?jupyter_server_app_settings:(jupyter_server_app_settings_ : jupyter_server_app_settings option)
    ?security_groups:(security_groups_ : security_group_ids option)
    ?execution_role:(execution_role_ : role_arn option) () =
  ({
     custom_file_system_configs = custom_file_system_configs_;
     custom_posix_user_config = custom_posix_user_config_;
     space_storage_settings = space_storage_settings_;
     jupyter_lab_app_settings = jupyter_lab_app_settings_;
     kernel_gateway_app_settings = kernel_gateway_app_settings_;
     jupyter_server_app_settings = jupyter_server_app_settings_;
     security_groups = security_groups_;
     execution_role = execution_role_;
   }
    : default_space_settings)

let make_update_domain_request ?vpc_id:(vpc_id_ : vpc_id option)
    ?home_efs_file_system_creation:
      (home_efs_file_system_creation_ : home_efs_file_system_creation option)
    ?tag_propagation:(tag_propagation_ : tag_propagation option)
    ?app_network_access_type:(app_network_access_type_ : app_network_access_type option)
    ?subnet_ids:(subnet_ids_ : subnets option)
    ?default_space_settings:(default_space_settings_ : default_space_settings option)
    ?app_security_group_management:
      (app_security_group_management_ : app_security_group_management option)
    ?domain_settings_for_update:(domain_settings_for_update_ : domain_settings_for_update option)
    ?default_user_settings:(default_user_settings_ : user_settings option)
    ~domain_id:(domain_id_ : domain_id) () =
  ({
     vpc_id = vpc_id_;
     home_efs_file_system_creation = home_efs_file_system_creation_;
     tag_propagation = tag_propagation_;
     app_network_access_type = app_network_access_type_;
     subnet_ids = subnet_ids_;
     default_space_settings = default_space_settings_;
     app_security_group_management = app_security_group_management_;
     domain_settings_for_update = domain_settings_for_update_;
     default_user_settings = default_user_settings_;
     domain_id = domain_id_;
   }
    : update_domain_request)

let make_device ?iot_thing_name:(iot_thing_name_ : thing_name option)
    ?description:(description_ : device_description option)
    ~device_name:(device_name_ : device_name) () =
  ({ iot_thing_name = iot_thing_name_; description = description_; device_name = device_name_ }
    : device)

let make_update_devices_request ~devices:(devices_ : devices)
    ~device_fleet_name:(device_fleet_name_ : entity_name) () =
  ({ devices = devices_; device_fleet_name = device_fleet_name_ } : update_devices_request)

let make_edge_output_config ?preset_deployment_config:(preset_deployment_config_ : string_ option)
    ?preset_deployment_type:(preset_deployment_type_ : edge_preset_deployment_type option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ~s3_output_location:(s3_output_location_ : s3_uri)
    () =
  ({
     preset_deployment_config = preset_deployment_config_;
     preset_deployment_type = preset_deployment_type_;
     kms_key_id = kms_key_id_;
     s3_output_location = s3_output_location_;
   }
    : edge_output_config)

let make_update_device_fleet_request
    ?enable_iot_role_alias:(enable_iot_role_alias_ : enable_iot_role_alias option)
    ?description:(description_ : device_fleet_description option)
    ?role_arn:(role_arn_ : role_arn option) ~output_config:(output_config_ : edge_output_config)
    ~device_fleet_name:(device_fleet_name_ : entity_name) () =
  ({
     enable_iot_role_alias = enable_iot_role_alias_;
     output_config = output_config_;
     description = description_;
     role_arn = role_arn_;
     device_fleet_name = device_fleet_name_;
   }
    : update_device_fleet_request)

let make_update_context_response ?context_arn:(context_arn_ : context_arn option) () =
  ({ context_arn = context_arn_ } : update_context_response)

let make_update_context_request
    ?properties_to_remove:(properties_to_remove_ : list_lineage_entity_parameter_key option)
    ?properties:(properties_ : lineage_entity_parameters option)
    ?description:(description_ : experiment_description option)
    ~context_name:(context_name_ : context_name) () =
  ({
     properties_to_remove = properties_to_remove_;
     properties = properties_;
     description = description_;
     context_name = context_name_;
   }
    : update_context_request)

let make_update_compute_quota_response ~compute_quota_version:(compute_quota_version_ : integer)
    ~compute_quota_arn:(compute_quota_arn_ : compute_quota_arn) () =
  ({ compute_quota_version = compute_quota_version_; compute_quota_arn = compute_quota_arn_ }
    : update_compute_quota_response)

let make_accelerator_partition_config ~count:(count_ : integer) ~type_:(type__ : mig_profile_type)
    () =
  ({ count = count_; type_ = type__ } : accelerator_partition_config)

let make_compute_quota_resource_config
    ?accelerator_partition:(accelerator_partition_ : accelerator_partition_config option)
    ?memory_in_gi_b:(memory_in_gi_b_ : memory_in_gi_b_amount option)
    ?v_cpu:(v_cpu_ : v_cpu_amount option) ?accelerators:(accelerators_ : accelerators_amount option)
    ?count:(count_ : instance_count option) ~instance_type:(instance_type_ : cluster_instance_type)
    () =
  ({
     accelerator_partition = accelerator_partition_;
     memory_in_gi_b = memory_in_gi_b_;
     v_cpu = v_cpu_;
     accelerators = accelerators_;
     count = count_;
     instance_type = instance_type_;
   }
    : compute_quota_resource_config)

let make_resource_sharing_config
    ?absolute_borrow_limits:(absolute_borrow_limits_ : absolute_borrow_limit_resource_list option)
    ?borrow_limit:(borrow_limit_ : borrow_limit option)
    ~strategy:(strategy_ : resource_sharing_strategy) () =
  ({
     absolute_borrow_limits = absolute_borrow_limits_;
     borrow_limit = borrow_limit_;
     strategy = strategy_;
   }
    : resource_sharing_config)

let make_compute_quota_config ?preempt_team_tasks:(preempt_team_tasks_ : preempt_team_tasks option)
    ?resource_sharing_config:(resource_sharing_config_ : resource_sharing_config option)
    ?compute_quota_resources:(compute_quota_resources_ : compute_quota_resource_config_list option)
    () =
  ({
     preempt_team_tasks = preempt_team_tasks_;
     resource_sharing_config = resource_sharing_config_;
     compute_quota_resources = compute_quota_resources_;
   }
    : compute_quota_config)

let make_compute_quota_target ?fair_share_weight:(fair_share_weight_ : fair_share_weight option)
    ~team_name:(team_name_ : compute_quota_target_team_name) () =
  ({ fair_share_weight = fair_share_weight_; team_name = team_name_ } : compute_quota_target)

let make_update_compute_quota_request ?description:(description_ : entity_description option)
    ?activation_state:(activation_state_ : activation_state option)
    ?compute_quota_target:(compute_quota_target_ : compute_quota_target option)
    ?compute_quota_config:(compute_quota_config_ : compute_quota_config option)
    ~target_version:(target_version_ : integer)
    ~compute_quota_id:(compute_quota_id_ : compute_quota_id) () =
  ({
     description = description_;
     activation_state = activation_state_;
     compute_quota_target = compute_quota_target_;
     compute_quota_config = compute_quota_config_;
     target_version = target_version_;
     compute_quota_id = compute_quota_id_;
   }
    : update_compute_quota_request)

let make_update_code_repository_output
    ~code_repository_arn:(code_repository_arn_ : code_repository_arn) () =
  ({ code_repository_arn = code_repository_arn_ } : update_code_repository_output)

let make_git_config_for_update ?secret_arn:(secret_arn_ : secret_arn option) () =
  ({ secret_arn = secret_arn_ } : git_config_for_update)

let make_update_code_repository_input ?git_config:(git_config_ : git_config_for_update option)
    ~code_repository_name:(code_repository_name_ : entity_name) () =
  ({ git_config = git_config_; code_repository_name = code_repository_name_ }
    : update_code_repository_input)

let make_update_cluster_software_response ~cluster_arn:(cluster_arn_ : cluster_arn) () =
  ({ cluster_arn = cluster_arn_ } : update_cluster_software_response)

let make_update_cluster_software_instance_group_specification
    ?image_release_version:(image_release_version_ : image_release_version option)
    ~instance_group_name:(instance_group_name_ : cluster_instance_group_name) () =
  ({ image_release_version = image_release_version_; instance_group_name = instance_group_name_ }
    : update_cluster_software_instance_group_specification)

let make_capacity_size_config ~value:(value_ : node_unavailability_value)
    ~type_:(type__ : node_unavailability_type) () =
  ({ value = value_; type_ = type__ } : capacity_size_config)

let make_rolling_deployment_policy
    ?rollback_maximum_batch_size:(rollback_maximum_batch_size_ : capacity_size_config option)
    ~maximum_batch_size:(maximum_batch_size_ : capacity_size_config) () =
  ({
     rollback_maximum_batch_size = rollback_maximum_batch_size_;
     maximum_batch_size = maximum_batch_size_;
   }
    : rolling_deployment_policy)

let make_alarm_details ~alarm_name:(alarm_name_ : alarm_name) () =
  ({ alarm_name = alarm_name_ } : alarm_details)

let make_deployment_configuration
    ?auto_rollback_configuration:(auto_rollback_configuration_ : auto_rollback_alarms option)
    ?wait_interval_in_seconds:(wait_interval_in_seconds_ : wait_time_interval_in_seconds option)
    ?rolling_update_policy:(rolling_update_policy_ : rolling_deployment_policy option) () =
  ({
     auto_rollback_configuration = auto_rollback_configuration_;
     wait_interval_in_seconds = wait_interval_in_seconds_;
     rolling_update_policy = rolling_update_policy_;
   }
    : deployment_configuration)

let make_update_cluster_software_request ?image_id:(image_id_ : image_id option)
    ?deployment_config:(deployment_config_ : deployment_configuration option)
    ?instance_groups:(instance_groups_ : update_cluster_software_instance_groups option)
    ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({
     image_id = image_id_;
     deployment_config = deployment_config_;
     instance_groups = instance_groups_;
     cluster_name = cluster_name_;
   }
    : update_cluster_software_request)

let make_update_cluster_scheduler_config_response
    ~cluster_scheduler_config_version:(cluster_scheduler_config_version_ : integer)
    ~cluster_scheduler_config_arn:(cluster_scheduler_config_arn_ : cluster_scheduler_config_arn) ()
    =
  ({
     cluster_scheduler_config_version = cluster_scheduler_config_version_;
     cluster_scheduler_config_arn = cluster_scheduler_config_arn_;
   }
    : update_cluster_scheduler_config_response)

let make_priority_class ~weight:(weight_ : priority_weight)
    ~name:(name_ : cluster_scheduler_priority_class_name) () =
  ({ weight = weight_; name = name_ } : priority_class)

let make_scheduler_config
    ?idle_resource_sharing:(idle_resource_sharing_ : idle_resource_sharing option)
    ?fair_share:(fair_share_ : fair_share option)
    ?priority_classes:(priority_classes_ : priority_class_list option) () =
  ({
     idle_resource_sharing = idle_resource_sharing_;
     fair_share = fair_share_;
     priority_classes = priority_classes_;
   }
    : scheduler_config)

let make_update_cluster_scheduler_config_request
    ?description:(description_ : entity_description option)
    ?scheduler_config:(scheduler_config_ : scheduler_config option)
    ~target_version:(target_version_ : integer)
    ~cluster_scheduler_config_id:(cluster_scheduler_config_id_ : cluster_scheduler_config_id) () =
  ({
     description = description_;
     scheduler_config = scheduler_config_;
     target_version = target_version_;
     cluster_scheduler_config_id = cluster_scheduler_config_id_;
   }
    : update_cluster_scheduler_config_request)

let make_update_cluster_response ~cluster_arn:(cluster_arn_ : cluster_arn) () =
  ({ cluster_arn = cluster_arn_ } : update_cluster_response)

let make_cluster_instance_requirements ~instance_types:(instance_types_ : cluster_instance_types) ()
    =
  ({ instance_types = instance_types_ } : cluster_instance_requirements)

let make_cluster_life_cycle_config
    ?on_init_complete:(on_init_complete_ : cluster_life_cycle_config_file_name option)
    ?on_create:(on_create_ : cluster_life_cycle_config_file_name option)
    ?source_s3_uri:(source_s3_uri_ : s3_uri option) () =
  ({ on_init_complete = on_init_complete_; on_create = on_create_; source_s3_uri = source_s3_uri_ }
    : cluster_life_cycle_config)

let make_cluster_ebs_volume_config ?root_volume:(root_volume_ : boolean_ option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?volume_size_in_g_b:(volume_size_in_g_b_ : cluster_ebs_volume_size_in_g_b option) () =
  ({
     root_volume = root_volume_;
     volume_kms_key_id = volume_kms_key_id_;
     volume_size_in_g_b = volume_size_in_g_b_;
   }
    : cluster_ebs_volume_config)

let make_cluster_fsx_lustre_config ?mount_path:(mount_path_ : cluster_fsx_mount_path option)
    ~mount_name:(mount_name_ : cluster_mount_name) ~dns_name:(dns_name_ : cluster_dns_name) () =
  ({ mount_path = mount_path_; mount_name = mount_name_; dns_name = dns_name_ }
    : cluster_fsx_lustre_config)

let make_cluster_fsx_open_zfs_config ?mount_path:(mount_path_ : cluster_fsx_mount_path option)
    ~dns_name:(dns_name_ : cluster_dns_name) () =
  ({ mount_path = mount_path_; dns_name = dns_name_ } : cluster_fsx_open_zfs_config)

let make_scheduled_update_config
    ?deployment_config:(deployment_config_ : deployment_configuration option)
    ~schedule_expression:(schedule_expression_ : cron_schedule_expression) () =
  ({ deployment_config = deployment_config_; schedule_expression = schedule_expression_ }
    : scheduled_update_config)

let make_cluster_patch_schedule ?next_patch_date:(next_patch_date_ : timestamp option) () =
  ({ next_patch_date = next_patch_date_ } : cluster_patch_schedule)

let make_cluster_auto_patch_config
    ?deployment_config:(deployment_config_ : deployment_configuration option)
    ?patch_schedule:(patch_schedule_ : cluster_patch_schedule option)
    ~patching_strategy:(patching_strategy_ : cluster_patching_strategy) () =
  ({
     deployment_config = deployment_config_;
     patch_schedule = patch_schedule_;
     patching_strategy = patching_strategy_;
   }
    : cluster_auto_patch_config)

let make_cluster_kubernetes_taint ?value:(value_ : cluster_kubernetes_taint_value option)
    ~effect_:(effect__ : cluster_kubernetes_taint_effect) ~key:(key_ : cluster_kubernetes_taint_key)
    () =
  ({ effect_ = effect__; value = value_; key = key_ } : cluster_kubernetes_taint)

let make_cluster_kubernetes_config ?taints:(taints_ : cluster_kubernetes_taints option)
    ?labels:(labels_ : cluster_kubernetes_labels option) () =
  ({ taints = taints_; labels = labels_ } : cluster_kubernetes_config)

let make_cluster_slurm_config ?partition_names:(partition_names_ : cluster_partition_names option)
    ~node_type:(node_type_ : cluster_slurm_node_type) () =
  ({ partition_names = partition_names_; node_type = node_type_ } : cluster_slurm_config)

let make_cluster_spot_options () = (() : unit)
let make_cluster_on_demand_options () = (() : unit)

let make_cluster_capacity_requirements ?on_demand:(on_demand_ : cluster_on_demand_options option)
    ?spot:(spot_ : cluster_spot_options option) () =
  ({ on_demand = on_demand_; spot = spot_ } : cluster_capacity_requirements)

let make_cluster_network_interface ?interface_type:(interface_type_ : cluster_interface_type option)
    () =
  ({ interface_type = interface_type_ } : cluster_network_interface)

let make_cluster_instance_group_specification
    ?network_interface:(network_interface_ : cluster_network_interface option)
    ?capacity_requirements:(capacity_requirements_ : cluster_capacity_requirements option)
    ?slurm_config:(slurm_config_ : cluster_slurm_config option)
    ?kubernetes_config:(kubernetes_config_ : cluster_kubernetes_config option)
    ?image_release_version:(image_release_version_ : image_release_version option)
    ?auto_patch_config:(auto_patch_config_ : cluster_auto_patch_config option)
    ?image_id:(image_id_ : image_id option)
    ?scheduled_update_config:(scheduled_update_config_ : scheduled_update_config option)
    ?override_vpc_config:(override_vpc_config_ : vpc_config option)
    ?training_plan_arn:(training_plan_arn_ : training_plan_arn option)
    ?on_start_deep_health_checks:(on_start_deep_health_checks_ : on_start_deep_health_checks option)
    ?instance_storage_configs:(instance_storage_configs_ : cluster_instance_storage_configs option)
    ?threads_per_core:(threads_per_core_ : cluster_threads_per_core option)
    ?life_cycle_config:(life_cycle_config_ : cluster_life_cycle_config option)
    ?instance_requirements:(instance_requirements_ : cluster_instance_requirements option)
    ?instance_type:(instance_type_ : cluster_instance_type option)
    ?min_instance_count:(min_instance_count_ : cluster_instance_count option)
    ~execution_role:(execution_role_ : role_arn)
    ~instance_group_name:(instance_group_name_ : cluster_instance_group_name)
    ~instance_count:(instance_count_ : cluster_instance_count) () =
  ({
     network_interface = network_interface_;
     capacity_requirements = capacity_requirements_;
     slurm_config = slurm_config_;
     kubernetes_config = kubernetes_config_;
     image_release_version = image_release_version_;
     auto_patch_config = auto_patch_config_;
     image_id = image_id_;
     scheduled_update_config = scheduled_update_config_;
     override_vpc_config = override_vpc_config_;
     training_plan_arn = training_plan_arn_;
     on_start_deep_health_checks = on_start_deep_health_checks_;
     instance_storage_configs = instance_storage_configs_;
     threads_per_core = threads_per_core_;
     execution_role = execution_role_;
     life_cycle_config = life_cycle_config_;
     instance_requirements = instance_requirements_;
     instance_type = instance_type_;
     instance_group_name = instance_group_name_;
     min_instance_count = min_instance_count_;
     instance_count = instance_count_;
   }
    : cluster_instance_group_specification)

let make_f_sx_lustre_config
    ~per_unit_storage_throughput:
      (per_unit_storage_throughput_ : f_sx_lustre_per_unit_storage_throughput)
    ~size_in_gi_b:(size_in_gi_b_ : f_sx_lustre_size_in_gi_b) () =
  ({ per_unit_storage_throughput = per_unit_storage_throughput_; size_in_gi_b = size_in_gi_b_ }
    : f_sx_lustre_config)

let make_environment_config ?f_sx_lustre_config:(f_sx_lustre_config_ : f_sx_lustre_config option) ()
    =
  ({ f_sx_lustre_config = f_sx_lustre_config_ } : environment_config)

let make_cluster_restricted_instance_group_specification
    ?environment_config:(environment_config_ : environment_config option)
    ?scheduled_update_config:(scheduled_update_config_ : scheduled_update_config option)
    ?override_vpc_config:(override_vpc_config_ : vpc_config option)
    ?training_plan_arn:(training_plan_arn_ : training_plan_arn option)
    ?on_start_deep_health_checks:(on_start_deep_health_checks_ : on_start_deep_health_checks option)
    ?instance_storage_configs:(instance_storage_configs_ : cluster_instance_storage_configs option)
    ?threads_per_core:(threads_per_core_ : cluster_threads_per_core option)
    ~execution_role:(execution_role_ : role_arn)
    ~instance_type:(instance_type_ : cluster_instance_type)
    ~instance_group_name:(instance_group_name_ : cluster_instance_group_name)
    ~instance_count:(instance_count_ : cluster_instance_count) () =
  ({
     environment_config = environment_config_;
     scheduled_update_config = scheduled_update_config_;
     override_vpc_config = override_vpc_config_;
     training_plan_arn = training_plan_arn_;
     on_start_deep_health_checks = on_start_deep_health_checks_;
     instance_storage_configs = instance_storage_configs_;
     threads_per_core = threads_per_core_;
     execution_role = execution_role_;
     instance_type = instance_type_;
     instance_group_name = instance_group_name_;
     instance_count = instance_count_;
   }
    : cluster_restricted_instance_group_specification)

let make_cluster_shared_environment_config
    ~f_sx_lustre_config:(f_sx_lustre_config_ : f_sx_lustre_config)
    ~f_sx_lustre_deletion_policy:
      (f_sx_lustre_deletion_policy_ : cluster_f_sx_lustre_deletion_policy) () =
  ({
     f_sx_lustre_config = f_sx_lustre_config_;
     f_sx_lustre_deletion_policy = f_sx_lustre_deletion_policy_;
   }
    : cluster_shared_environment_config)

let make_cluster_restricted_instance_groups_config
    ~shared_environment_config:(shared_environment_config_ : cluster_shared_environment_config) () =
  ({ shared_environment_config = shared_environment_config_ }
    : cluster_restricted_instance_groups_config)

let make_cluster_tiered_storage_config
    ?instance_memory_allocation_percentage:
      (instance_memory_allocation_percentage_ : cluster_instance_memory_allocation_percentage option)
    ~mode:(mode_ : cluster_config_mode) () =
  ({ instance_memory_allocation_percentage = instance_memory_allocation_percentage_; mode = mode_ }
    : cluster_tiered_storage_config)

let make_cluster_auto_scaling_config
    ?auto_scaler_type:(auto_scaler_type_ : cluster_auto_scaler_type option)
    ~mode:(mode_ : cluster_auto_scaling_mode) () =
  ({ auto_scaler_type = auto_scaler_type_; mode = mode_ } : cluster_auto_scaling_config)

let make_cluster_orchestrator_eks_config ~cluster_arn:(cluster_arn_ : eks_cluster_arn) () =
  ({ cluster_arn = cluster_arn_ } : cluster_orchestrator_eks_config)

let make_cluster_orchestrator_slurm_config
    ?slurm_config_strategy:(slurm_config_strategy_ : cluster_slurm_config_strategy option) () =
  ({ slurm_config_strategy = slurm_config_strategy_ } : cluster_orchestrator_slurm_config)

let make_cluster_orchestrator ?slurm:(slurm_ : cluster_orchestrator_slurm_config option)
    ?eks:(eks_ : cluster_orchestrator_eks_config option) () =
  ({ slurm = slurm_; eks = eks_ } : cluster_orchestrator)

let make_update_cluster_request ?orchestrator:(orchestrator_ : cluster_orchestrator option)
    ?auto_scaling:(auto_scaling_ : cluster_auto_scaling_config option)
    ?cluster_role:(cluster_role_ : role_arn option)
    ?node_provisioning_mode:(node_provisioning_mode_ : cluster_node_provisioning_mode option)
    ?instance_groups_to_delete:
      (instance_groups_to_delete_ : cluster_instance_groups_to_delete option)
    ?node_recovery:(node_recovery_ : cluster_node_recovery option)
    ?tiered_storage_config:(tiered_storage_config_ : cluster_tiered_storage_config option)
    ?restricted_instance_groups_config:
      (restricted_instance_groups_config_ : cluster_restricted_instance_groups_config option)
    ?restricted_instance_groups:
      (restricted_instance_groups_ : cluster_restricted_instance_group_specifications option)
    ?instance_groups:(instance_groups_ : cluster_instance_group_specifications option)
    ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({
     orchestrator = orchestrator_;
     auto_scaling = auto_scaling_;
     cluster_role = cluster_role_;
     node_provisioning_mode = node_provisioning_mode_;
     instance_groups_to_delete = instance_groups_to_delete_;
     node_recovery = node_recovery_;
     tiered_storage_config = tiered_storage_config_;
     restricted_instance_groups_config = restricted_instance_groups_config_;
     restricted_instance_groups = restricted_instance_groups_;
     instance_groups = instance_groups_;
     cluster_name = cluster_name_;
   }
    : update_cluster_request)

let make_update_artifact_response ?artifact_arn:(artifact_arn_ : artifact_arn option) () =
  ({ artifact_arn = artifact_arn_ } : update_artifact_response)

let make_update_artifact_request
    ?properties_to_remove:(properties_to_remove_ : list_lineage_entity_parameter_key option)
    ?properties:(properties_ : artifact_properties option)
    ?artifact_name:(artifact_name_ : experiment_entity_name option)
    ~artifact_arn:(artifact_arn_ : artifact_arn) () =
  ({
     properties_to_remove = properties_to_remove_;
     properties = properties_;
     artifact_name = artifact_name_;
     artifact_arn = artifact_arn_;
   }
    : update_artifact_request)

let make_update_app_image_config_response
    ?app_image_config_arn:(app_image_config_arn_ : app_image_config_arn option) () =
  ({ app_image_config_arn = app_image_config_arn_ } : update_app_image_config_response)

let make_kernel_spec ?display_name:(display_name_ : kernel_display_name option)
    ~name:(name_ : kernel_name) () =
  ({ display_name = display_name_; name = name_ } : kernel_spec)

let make_file_system_config ?default_gid:(default_gid_ : default_gid option)
    ?default_uid:(default_uid_ : default_uid option) ?mount_path:(mount_path_ : mount_path option)
    () =
  ({ default_gid = default_gid_; default_uid = default_uid_; mount_path = mount_path_ }
    : file_system_config)

let make_kernel_gateway_image_config
    ?file_system_config:(file_system_config_ : file_system_config option)
    ~kernel_specs:(kernel_specs_ : kernel_specs) () =
  ({ file_system_config = file_system_config_; kernel_specs = kernel_specs_ }
    : kernel_gateway_image_config)

let make_container_config
    ?container_environment_variables:
      (container_environment_variables_ : custom_image_container_environment_variables option)
    ?container_entrypoint:(container_entrypoint_ : custom_image_container_entrypoint option)
    ?container_arguments:(container_arguments_ : custom_image_container_arguments option) () =
  ({
     container_environment_variables = container_environment_variables_;
     container_entrypoint = container_entrypoint_;
     container_arguments = container_arguments_;
   }
    : container_config)

let make_jupyter_lab_app_image_config
    ?container_config:(container_config_ : container_config option)
    ?file_system_config:(file_system_config_ : file_system_config option) () =
  ({ container_config = container_config_; file_system_config = file_system_config_ }
    : jupyter_lab_app_image_config)

let make_code_editor_app_image_config
    ?container_config:(container_config_ : container_config option)
    ?file_system_config:(file_system_config_ : file_system_config option) () =
  ({ container_config = container_config_; file_system_config = file_system_config_ }
    : code_editor_app_image_config)

let make_update_app_image_config_request
    ?code_editor_app_image_config:
      (code_editor_app_image_config_ : code_editor_app_image_config option)
    ?jupyter_lab_app_image_config:
      (jupyter_lab_app_image_config_ : jupyter_lab_app_image_config option)
    ?kernel_gateway_image_config:(kernel_gateway_image_config_ : kernel_gateway_image_config option)
    ~app_image_config_name:(app_image_config_name_ : app_image_config_name) () =
  ({
     code_editor_app_image_config = code_editor_app_image_config_;
     jupyter_lab_app_image_config = jupyter_lab_app_image_config_;
     kernel_gateway_image_config = kernel_gateway_image_config_;
     app_image_config_name = app_image_config_name_;
   }
    : update_app_image_config_request)

let make_update_action_response ?action_arn:(action_arn_ : action_arn option) () =
  ({ action_arn = action_arn_ } : update_action_response)

let make_update_action_request
    ?properties_to_remove:(properties_to_remove_ : list_lineage_entity_parameter_key option)
    ?properties:(properties_ : lineage_entity_parameters option)
    ?status:(status_ : action_status option)
    ?description:(description_ : experiment_description option)
    ~action_name:(action_name_ : experiment_entity_name) () =
  ({
     properties_to_remove = properties_to_remove_;
     properties = properties_;
     status = status_;
     description = description_;
     action_name = action_name_;
   }
    : update_action_request)

let make_ultra_server ?health_status:(health_status_ : ultra_server_health_status option)
    ?unhealthy_instance_count:(unhealthy_instance_count_ : unhealthy_instance_count option)
    ?available_spare_instance_count:
      (available_spare_instance_count_ : available_spare_instance_count option)
    ?in_use_instance_count:(in_use_instance_count_ : in_use_instance_count option)
    ?available_instance_count:(available_instance_count_ : available_instance_count option)
    ?configured_spare_instance_count:
      (configured_spare_instance_count_ : configured_spare_instance_count option)
    ~total_instance_count:(total_instance_count_ : total_instance_count)
    ~instance_type:(instance_type_ : reserved_capacity_instance_type)
    ~availability_zone:(availability_zone_ : availability_zone)
    ~ultra_server_type:(ultra_server_type_ : ultra_server_type)
    ~ultra_server_id:(ultra_server_id_ : non_empty_string256) () =
  ({
     health_status = health_status_;
     unhealthy_instance_count = unhealthy_instance_count_;
     available_spare_instance_count = available_spare_instance_count_;
     in_use_instance_count = in_use_instance_count_;
     available_instance_count = available_instance_count_;
     configured_spare_instance_count = configured_spare_instance_count_;
     total_instance_count = total_instance_count_;
     instance_type = instance_type_;
     availability_zone = availability_zone_;
     ultra_server_type = ultra_server_type_;
     ultra_server_id = ultra_server_id_;
   }
    : ultra_server)

let make_ultra_server_summary
    ?unhealthy_instance_count:(unhealthy_instance_count_ : unhealthy_instance_count option)
    ?available_spare_instance_count:
      (available_spare_instance_count_ : available_spare_instance_count option)
    ?ultra_server_count:(ultra_server_count_ : ultra_server_count option)
    ~instance_type:(instance_type_ : reserved_capacity_instance_type)
    ~ultra_server_type:(ultra_server_type_ : ultra_server_type) () =
  ({
     unhealthy_instance_count = unhealthy_instance_count_;
     available_spare_instance_count = available_spare_instance_count_;
     ultra_server_count = ultra_server_count_;
     instance_type = instance_type_;
     ultra_server_type = ultra_server_type_;
   }
    : ultra_server_summary)

let make_ultra_server_info ?type_:(type__ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?id:(id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ type_ = type__; id = id_ } : ultra_server_info)

let make_ui_template_info ?content_sha256:(content_sha256_ : template_content_sha256 option)
    ?url:(url_ : template_url option) () =
  ({ content_sha256 = content_sha256_; url = url_ } : ui_template_info)

let make_ui_template ~content:(content_ : template_content) () =
  ({ content = content_ } : ui_template)

let make_ui_config ?human_task_ui_arn:(human_task_ui_arn_ : human_task_ui_arn option)
    ?ui_template_s3_uri:(ui_template_s3_uri_ : s3_uri option) () =
  ({ human_task_ui_arn = human_task_ui_arn_; ui_template_s3_uri = ui_template_s3_uri_ } : ui_config)

let make_us_d
    ?tenth_fractions_of_a_cent:(tenth_fractions_of_a_cent_ : tenth_fractions_of_a_cent option)
    ?cents:(cents_ : cents option) ?dollars:(dollars_ : dollars option) () =
  ({ tenth_fractions_of_a_cent = tenth_fractions_of_a_cent_; cents = cents_; dollars = dollars_ }
    : us_d)

let make_tuning_job_step_meta_data ?arn:(arn_ : hyper_parameter_tuning_job_arn option) () =
  ({ arn = arn_ } : tuning_job_step_meta_data)

let make_best_objective_not_improving
    ?max_number_of_training_jobs_not_improving:
      (max_number_of_training_jobs_not_improving_ : max_number_of_training_jobs_not_improving option)
    () =
  ({ max_number_of_training_jobs_not_improving = max_number_of_training_jobs_not_improving_ }
    : best_objective_not_improving)

let make_convergence_detected
    ?complete_on_convergence:(complete_on_convergence_ : complete_on_convergence option) () =
  ({ complete_on_convergence = complete_on_convergence_ } : convergence_detected)

let make_tuning_job_completion_criteria
    ?convergence_detected:(convergence_detected_ : convergence_detected option)
    ?best_objective_not_improving:
      (best_objective_not_improving_ : best_objective_not_improving option)
    ?target_objective_metric_value:
      (target_objective_metric_value_ : target_objective_metric_value option) () =
  ({
     convergence_detected = convergence_detected_;
     best_objective_not_improving = best_objective_not_improving_;
     target_objective_metric_value = target_objective_metric_value_;
   }
    : tuning_job_completion_criteria)

let make_trial_source ?source_type:(source_type_ : source_type option)
    ~source_arn:(source_arn_ : trial_source_arn) () =
  ({ source_type = source_type_; source_arn = source_arn_ } : trial_source)

let make_trial_summary ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?trial_source:(trial_source_ : trial_source option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?trial_name:(trial_name_ : experiment_entity_name option)
    ?trial_arn:(trial_arn_ : trial_arn option) () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     trial_source = trial_source_;
     display_name = display_name_;
     trial_name = trial_name_;
     trial_arn = trial_arn_;
   }
    : trial_summary)

let make_trial_component_source ?source_type:(source_type_ : source_type option)
    ~source_arn:(source_arn_ : trial_component_source_arn) () =
  ({ source_type = source_type_; source_arn = source_arn_ } : trial_component_source)

let make_trial_component_summary ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?creation_time:(creation_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option) ?status:(status_ : trial_component_status option)
    ?trial_component_source:(trial_component_source_ : trial_component_source option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?trial_component_arn:(trial_component_arn_ : trial_component_arn option)
    ?trial_component_name:(trial_component_name_ : experiment_entity_name option) () =
  ({
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     created_by = created_by_;
     creation_time = creation_time_;
     end_time = end_time_;
     start_time = start_time_;
     status = status_;
     trial_component_source = trial_component_source_;
     display_name = display_name_;
     trial_component_arn = trial_component_arn_;
     trial_component_name = trial_component_name_;
   }
    : trial_component_summary)

let make_model_artifacts ~s3_model_artifacts:(s3_model_artifacts_ : s3_uri) () =
  ({ s3_model_artifacts = s3_model_artifacts_ } : model_artifacts)

let make_metric_definition ~regex:(regex_ : metric_regex) ~name:(name_ : metric_name) () =
  ({ regex = regex_; name = name_ } : metric_definition)

let make_training_repository_auth_config
    ~training_repository_credentials_provider_arn:
      (training_repository_credentials_provider_arn_ : training_repository_credentials_provider_arn)
    () =
  ({ training_repository_credentials_provider_arn = training_repository_credentials_provider_arn_ }
    : training_repository_auth_config)

let make_training_image_config
    ?training_repository_auth_config:
      (training_repository_auth_config_ : training_repository_auth_config option)
    ~training_repository_access_mode:
      (training_repository_access_mode_ : training_repository_access_mode) () =
  ({
     training_repository_auth_config = training_repository_auth_config_;
     training_repository_access_mode = training_repository_access_mode_;
   }
    : training_image_config)

let make_algorithm_specification
    ?training_image_config:(training_image_config_ : training_image_config option)
    ?container_arguments:(container_arguments_ : training_container_arguments option)
    ?container_entrypoint:(container_entrypoint_ : training_container_entrypoint option)
    ?enable_sage_maker_metrics_time_series:
      (enable_sage_maker_metrics_time_series_ : boolean_ option)
    ?metric_definitions:(metric_definitions_ : metric_definition_list option)
    ?algorithm_name:(algorithm_name_ : arn_or_name option)
    ?training_image:(training_image_ : algorithm_image option)
    ~training_input_mode:(training_input_mode_ : training_input_mode) () =
  ({
     training_image_config = training_image_config_;
     container_arguments = container_arguments_;
     container_entrypoint = container_entrypoint_;
     enable_sage_maker_metrics_time_series = enable_sage_maker_metrics_time_series_;
     metric_definitions = metric_definitions_;
     training_input_mode = training_input_mode_;
     algorithm_name = algorithm_name_;
     training_image = training_image_;
   }
    : algorithm_specification)

let make_hub_access_config ~hub_content_arn:(hub_content_arn_ : hub_content_arn) () =
  ({ hub_content_arn = hub_content_arn_ } : hub_access_config)

let make_s3_data_source ?hub_access_config:(hub_access_config_ : hub_access_config option)
    ?model_access_config:(model_access_config_ : model_access_config option)
    ?instance_group_names:(instance_group_names_ : instance_group_names option)
    ?attribute_names:(attribute_names_ : attribute_names option)
    ?s3_data_distribution_type:(s3_data_distribution_type_ : s3_data_distribution option)
    ~s3_uri:(s3_uri_ : s3_uri) ~s3_data_type:(s3_data_type_ : s3_data_type) () =
  ({
     hub_access_config = hub_access_config_;
     model_access_config = model_access_config_;
     instance_group_names = instance_group_names_;
     attribute_names = attribute_names_;
     s3_data_distribution_type = s3_data_distribution_type_;
     s3_uri = s3_uri_;
     s3_data_type = s3_data_type_;
   }
    : s3_data_source)

let make_file_system_data_source ~directory_path:(directory_path_ : directory_path)
    ~file_system_type:(file_system_type_ : file_system_type)
    ~file_system_access_mode:(file_system_access_mode_ : file_system_access_mode)
    ~file_system_id:(file_system_id_ : file_system_id) () =
  ({
     directory_path = directory_path_;
     file_system_type = file_system_type_;
     file_system_access_mode = file_system_access_mode_;
     file_system_id = file_system_id_;
   }
    : file_system_data_source)

let make_dataset_source ~dataset_arn:(dataset_arn_ : hub_data_set_arn) () =
  ({ dataset_arn = dataset_arn_ } : dataset_source)

let make_data_source ?dataset_source:(dataset_source_ : dataset_source option)
    ?file_system_data_source:(file_system_data_source_ : file_system_data_source option)
    ?s3_data_source:(s3_data_source_ : s3_data_source option) () =
  ({
     dataset_source = dataset_source_;
     file_system_data_source = file_system_data_source_;
     s3_data_source = s3_data_source_;
   }
    : data_source)

let make_shuffle_config ~seed:(seed_ : seed) () = ({ seed = seed_ } : shuffle_config)

let make_channel ?shuffle_config:(shuffle_config_ : shuffle_config option)
    ?input_mode:(input_mode_ : training_input_mode option)
    ?record_wrapper_type:(record_wrapper_type_ : record_wrapper option)
    ?compression_type:(compression_type_ : compression_type option)
    ?content_type:(content_type_ : content_type option) ~data_source:(data_source_ : data_source)
    ~channel_name:(channel_name_ : channel_name) () =
  ({
     shuffle_config = shuffle_config_;
     input_mode = input_mode_;
     record_wrapper_type = record_wrapper_type_;
     compression_type = compression_type_;
     content_type = content_type_;
     data_source = data_source_;
     channel_name = channel_name_;
   }
    : channel)

let make_output_data_config ?compression_type:(compression_type_ : output_compression_type option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ~s3_output_path:(s3_output_path_ : s3_uri) () =
  ({
     compression_type = compression_type_;
     s3_output_path = s3_output_path_;
     kms_key_id = kms_key_id_;
   }
    : output_data_config)

let make_instance_group ~instance_group_name:(instance_group_name_ : instance_group_name)
    ~instance_count:(instance_count_ : training_instance_count)
    ~instance_type:(instance_type_ : training_instance_type) () =
  ({
     instance_group_name = instance_group_name_;
     instance_count = instance_count_;
     instance_type = instance_type_;
   }
    : instance_group)

let make_placement_specification ?ultra_server_id:(ultra_server_id_ : string256 option)
    ~instance_count:(instance_count_ : training_instance_count) () =
  ({ instance_count = instance_count_; ultra_server_id = ultra_server_id_ }
    : placement_specification)

let make_instance_placement_config
    ?placement_specifications:(placement_specifications_ : placement_specifications option)
    ?enable_multiple_jobs:(enable_multiple_jobs_ : boolean_ option) () =
  ({
     placement_specifications = placement_specifications_;
     enable_multiple_jobs = enable_multiple_jobs_;
   }
    : instance_placement_config)

let make_resource_config
    ?instance_placement_config:(instance_placement_config_ : instance_placement_config option)
    ?training_plan_arn:(training_plan_arn_ : training_plan_arn option)
    ?instance_groups:(instance_groups_ : instance_groups option)
    ?keep_alive_period_in_seconds:
      (keep_alive_period_in_seconds_ : keep_alive_period_in_seconds option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?volume_size_in_g_b:(volume_size_in_g_b_ : optional_volume_size_in_g_b option)
    ?instance_count:(instance_count_ : training_instance_count option)
    ?instance_type:(instance_type_ : training_instance_type option) () =
  ({
     instance_placement_config = instance_placement_config_;
     training_plan_arn = training_plan_arn_;
     instance_groups = instance_groups_;
     keep_alive_period_in_seconds = keep_alive_period_in_seconds_;
     volume_kms_key_id = volume_kms_key_id_;
     volume_size_in_g_b = volume_size_in_g_b_;
     instance_count = instance_count_;
     instance_type = instance_type_;
   }
    : resource_config)

let make_stopping_condition
    ?max_pending_time_in_seconds:(max_pending_time_in_seconds_ : max_pending_time_in_seconds option)
    ?max_wait_time_in_seconds:(max_wait_time_in_seconds_ : max_wait_time_in_seconds option)
    ?max_runtime_in_seconds:(max_runtime_in_seconds_ : max_runtime_in_seconds option) () =
  ({
     max_pending_time_in_seconds = max_pending_time_in_seconds_;
     max_wait_time_in_seconds = max_wait_time_in_seconds_;
     max_runtime_in_seconds = max_runtime_in_seconds_;
   }
    : stopping_condition)

let make_secondary_status_transition ?status_message:(status_message_ : status_message option)
    ?end_time:(end_time_ : timestamp option) ~start_time:(start_time_ : timestamp)
    ~status:(status_ : secondary_status) () =
  ({
     status_message = status_message_;
     end_time = end_time_;
     start_time = start_time_;
     status = status_;
   }
    : secondary_status_transition)

let make_metric_data ?timestamp:(timestamp_ : timestamp option) ?value:(value_ : float_ option)
    ?metric_name:(metric_name_ : metric_name option) () =
  ({ timestamp = timestamp_; value = value_; metric_name = metric_name_ } : metric_data)

let make_checkpoint_config ?local_path:(local_path_ : directory_path option)
    ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ local_path = local_path_; s3_uri = s3_uri_ } : checkpoint_config)

let make_collection_configuration
    ?collection_parameters:(collection_parameters_ : collection_parameters option)
    ?collection_name:(collection_name_ : collection_name option) () =
  ({ collection_parameters = collection_parameters_; collection_name = collection_name_ }
    : collection_configuration)

let make_debug_hook_config
    ?collection_configurations:(collection_configurations_ : collection_configurations option)
    ?hook_parameters:(hook_parameters_ : hook_parameters option)
    ?local_path:(local_path_ : directory_path option) ~s3_output_path:(s3_output_path_ : s3_uri) ()
    =
  ({
     collection_configurations = collection_configurations_;
     hook_parameters = hook_parameters_;
     s3_output_path = s3_output_path_;
     local_path = local_path_;
   }
    : debug_hook_config)

let make_experiment_config ?run_name:(run_name_ : experiment_entity_name option)
    ?trial_component_display_name:(trial_component_display_name_ : experiment_entity_name option)
    ?trial_name:(trial_name_ : experiment_entity_name option)
    ?experiment_name:(experiment_name_ : experiment_entity_name option) () =
  ({
     run_name = run_name_;
     trial_component_display_name = trial_component_display_name_;
     trial_name = trial_name_;
     experiment_name = experiment_name_;
   }
    : experiment_config)

let make_debug_rule_configuration ?rule_parameters:(rule_parameters_ : rule_parameters option)
    ?volume_size_in_g_b:(volume_size_in_g_b_ : optional_volume_size_in_g_b option)
    ?instance_type:(instance_type_ : processing_instance_type option)
    ?s3_output_path:(s3_output_path_ : s3_uri option)
    ?local_path:(local_path_ : directory_path option)
    ~rule_evaluator_image:(rule_evaluator_image_ : algorithm_image)
    ~rule_configuration_name:(rule_configuration_name_ : rule_configuration_name) () =
  ({
     rule_parameters = rule_parameters_;
     volume_size_in_g_b = volume_size_in_g_b_;
     instance_type = instance_type_;
     rule_evaluator_image = rule_evaluator_image_;
     s3_output_path = s3_output_path_;
     local_path = local_path_;
     rule_configuration_name = rule_configuration_name_;
   }
    : debug_rule_configuration)

let make_tensor_board_output_config ?local_path:(local_path_ : directory_path option)
    ~s3_output_path:(s3_output_path_ : s3_uri) () =
  ({ s3_output_path = s3_output_path_; local_path = local_path_ } : tensor_board_output_config)

let make_debug_rule_evaluation_status ?last_modified_time:(last_modified_time_ : timestamp option)
    ?status_details:(status_details_ : status_details option)
    ?rule_evaluation_status:(rule_evaluation_status_ : rule_evaluation_status option)
    ?rule_evaluation_job_arn:(rule_evaluation_job_arn_ : processing_job_arn option)
    ?rule_configuration_name:(rule_configuration_name_ : rule_configuration_name option) () =
  ({
     last_modified_time = last_modified_time_;
     status_details = status_details_;
     rule_evaluation_status = rule_evaluation_status_;
     rule_evaluation_job_arn = rule_evaluation_job_arn_;
     rule_configuration_name = rule_configuration_name_;
   }
    : debug_rule_evaluation_status)

let make_model_package_config
    ?source_model_package_arn:(source_model_package_arn_ : model_package_arn option)
    ~model_package_group_arn:(model_package_group_arn_ : model_package_group_arn) () =
  ({
     source_model_package_arn = source_model_package_arn_;
     model_package_group_arn = model_package_group_arn_;
   }
    : model_package_config)

let make_profiler_config ?disable_profiler:(disable_profiler_ : disable_profiler option)
    ?profiling_parameters:(profiling_parameters_ : profiling_parameters option)
    ?profiling_interval_in_milliseconds:
      (profiling_interval_in_milliseconds_ : profiling_interval_in_milliseconds option)
    ?s3_output_path:(s3_output_path_ : s3_uri option) () =
  ({
     disable_profiler = disable_profiler_;
     profiling_parameters = profiling_parameters_;
     profiling_interval_in_milliseconds = profiling_interval_in_milliseconds_;
     s3_output_path = s3_output_path_;
   }
    : profiler_config)

let make_retry_strategy ~maximum_retry_attempts:(maximum_retry_attempts_ : maximum_retry_attempts)
    () =
  ({ maximum_retry_attempts = maximum_retry_attempts_ } : retry_strategy)

let make_training_job ?tags:(tags_ : tag_list option)
    ?retry_strategy:(retry_strategy_ : retry_strategy option)
    ?environment:(environment_ : training_environment_map option)
    ?profiler_config:(profiler_config_ : profiler_config option)
    ?model_package_config:(model_package_config_ : model_package_config option)
    ?output_model_package_arn:(output_model_package_arn_ : model_package_arn option)
    ?debug_rule_evaluation_statuses:
      (debug_rule_evaluation_statuses_ : debug_rule_evaluation_statuses option)
    ?tensor_board_output_config:(tensor_board_output_config_ : tensor_board_output_config option)
    ?debug_rule_configurations:(debug_rule_configurations_ : debug_rule_configurations option)
    ?experiment_config:(experiment_config_ : experiment_config option)
    ?debug_hook_config:(debug_hook_config_ : debug_hook_config option)
    ?billable_time_in_seconds:(billable_time_in_seconds_ : billable_time_in_seconds option)
    ?training_time_in_seconds:(training_time_in_seconds_ : training_time_in_seconds option)
    ?checkpoint_config:(checkpoint_config_ : checkpoint_config option)
    ?enable_managed_spot_training:(enable_managed_spot_training_ : boolean_ option)
    ?enable_inter_container_traffic_encryption:
      (enable_inter_container_traffic_encryption_ : boolean_ option)
    ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ?final_metric_data_list:(final_metric_data_list_ : final_metric_data_list option)
    ?secondary_status_transitions:
      (secondary_status_transitions_ : secondary_status_transitions option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?training_end_time:(training_end_time_ : timestamp option)
    ?training_start_time:(training_start_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?stopping_condition:(stopping_condition_ : stopping_condition option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?warm_pool_status:(warm_pool_status_ : warm_pool_status option)
    ?resource_config:(resource_config_ : resource_config option)
    ?output_data_config:(output_data_config_ : output_data_config option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?role_arn:(role_arn_ : role_arn option)
    ?algorithm_specification:(algorithm_specification_ : algorithm_specification option)
    ?hyper_parameters:(hyper_parameters_ : hyper_parameters option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?secondary_status:(secondary_status_ : secondary_status option)
    ?training_job_status:(training_job_status_ : training_job_status option)
    ?model_artifacts:(model_artifacts_ : model_artifacts option)
    ?auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn option)
    ?labeling_job_arn:(labeling_job_arn_ : labeling_job_arn option)
    ?tuning_job_arn:(tuning_job_arn_ : hyper_parameter_tuning_job_arn option)
    ?training_job_arn:(training_job_arn_ : training_job_arn option)
    ?training_job_name:(training_job_name_ : training_job_name option) () =
  ({
     tags = tags_;
     retry_strategy = retry_strategy_;
     environment = environment_;
     profiler_config = profiler_config_;
     model_package_config = model_package_config_;
     output_model_package_arn = output_model_package_arn_;
     debug_rule_evaluation_statuses = debug_rule_evaluation_statuses_;
     tensor_board_output_config = tensor_board_output_config_;
     debug_rule_configurations = debug_rule_configurations_;
     experiment_config = experiment_config_;
     debug_hook_config = debug_hook_config_;
     billable_time_in_seconds = billable_time_in_seconds_;
     training_time_in_seconds = training_time_in_seconds_;
     checkpoint_config = checkpoint_config_;
     enable_managed_spot_training = enable_managed_spot_training_;
     enable_inter_container_traffic_encryption = enable_inter_container_traffic_encryption_;
     enable_network_isolation = enable_network_isolation_;
     final_metric_data_list = final_metric_data_list_;
     secondary_status_transitions = secondary_status_transitions_;
     last_modified_time = last_modified_time_;
     training_end_time = training_end_time_;
     training_start_time = training_start_time_;
     creation_time = creation_time_;
     stopping_condition = stopping_condition_;
     vpc_config = vpc_config_;
     warm_pool_status = warm_pool_status_;
     resource_config = resource_config_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     role_arn = role_arn_;
     algorithm_specification = algorithm_specification_;
     hyper_parameters = hyper_parameters_;
     failure_reason = failure_reason_;
     secondary_status = secondary_status_;
     training_job_status = training_job_status_;
     model_artifacts = model_artifacts_;
     auto_ml_job_arn = auto_ml_job_arn_;
     labeling_job_arn = labeling_job_arn_;
     tuning_job_arn = tuning_job_arn_;
     training_job_arn = training_job_arn_;
     training_job_name = training_job_name_;
   }
    : training_job)

let make_processing_s3_input
    ?s3_compression_type:(s3_compression_type_ : processing_s3_compression_type option)
    ?s3_data_distribution_type:
      (s3_data_distribution_type_ : processing_s3_data_distribution_type option)
    ?s3_input_mode:(s3_input_mode_ : processing_s3_input_mode option)
    ?local_path:(local_path_ : processing_local_path option)
    ~s3_data_type:(s3_data_type_ : processing_s3_data_type) ~s3_uri:(s3_uri_ : s3_uri) () =
  ({
     s3_compression_type = s3_compression_type_;
     s3_data_distribution_type = s3_data_distribution_type_;
     s3_input_mode = s3_input_mode_;
     s3_data_type = s3_data_type_;
     local_path = local_path_;
     s3_uri = s3_uri_;
   }
    : processing_s3_input)

let make_athena_dataset_definition
    ?output_compression:(output_compression_ : athena_result_compression_type option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?work_group:(work_group_ : athena_work_group option)
    ~output_format:(output_format_ : athena_result_format) ~output_s3_uri:(output_s3_uri_ : s3_uri)
    ~query_string:(query_string_ : athena_query_string) ~database:(database_ : athena_database)
    ~catalog:(catalog_ : athena_catalog) () =
  ({
     output_compression = output_compression_;
     output_format = output_format_;
     kms_key_id = kms_key_id_;
     output_s3_uri = output_s3_uri_;
     work_group = work_group_;
     query_string = query_string_;
     database = database_;
     catalog = catalog_;
   }
    : athena_dataset_definition)

let make_redshift_dataset_definition
    ?output_compression:(output_compression_ : redshift_result_compression_type option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ~output_format:(output_format_ : redshift_result_format)
    ~output_s3_uri:(output_s3_uri_ : s3_uri) ~cluster_role_arn:(cluster_role_arn_ : role_arn)
    ~query_string:(query_string_ : redshift_query_string) ~db_user:(db_user_ : redshift_user_name)
    ~database:(database_ : redshift_database) ~cluster_id:(cluster_id_ : redshift_cluster_id) () =
  ({
     output_compression = output_compression_;
     output_format = output_format_;
     kms_key_id = kms_key_id_;
     output_s3_uri = output_s3_uri_;
     cluster_role_arn = cluster_role_arn_;
     query_string = query_string_;
     db_user = db_user_;
     database = database_;
     cluster_id = cluster_id_;
   }
    : redshift_dataset_definition)

let make_dataset_definition ?input_mode:(input_mode_ : input_mode option)
    ?data_distribution_type:(data_distribution_type_ : data_distribution_type option)
    ?local_path:(local_path_ : processing_local_path option)
    ?redshift_dataset_definition:(redshift_dataset_definition_ : redshift_dataset_definition option)
    ?athena_dataset_definition:(athena_dataset_definition_ : athena_dataset_definition option) () =
  ({
     input_mode = input_mode_;
     data_distribution_type = data_distribution_type_;
     local_path = local_path_;
     redshift_dataset_definition = redshift_dataset_definition_;
     athena_dataset_definition = athena_dataset_definition_;
   }
    : dataset_definition)

let make_processing_input ?dataset_definition:(dataset_definition_ : dataset_definition option)
    ?s3_input:(s3_input_ : processing_s3_input option)
    ?app_managed:(app_managed_ : app_managed option) ~input_name:(input_name_ : string_) () =
  ({
     dataset_definition = dataset_definition_;
     s3_input = s3_input_;
     app_managed = app_managed_;
     input_name = input_name_;
   }
    : processing_input)

let make_processing_s3_output ?local_path:(local_path_ : processing_local_path option)
    ~s3_upload_mode:(s3_upload_mode_ : processing_s3_upload_mode) ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ s3_upload_mode = s3_upload_mode_; local_path = local_path_; s3_uri = s3_uri_ }
    : processing_s3_output)

let make_processing_feature_store_output
    ~feature_group_name:(feature_group_name_ : feature_group_name) () =
  ({ feature_group_name = feature_group_name_ } : processing_feature_store_output)

let make_processing_output ?app_managed:(app_managed_ : app_managed option)
    ?feature_store_output:(feature_store_output_ : processing_feature_store_output option)
    ?s3_output:(s3_output_ : processing_s3_output option) ~output_name:(output_name_ : string_) () =
  ({
     app_managed = app_managed_;
     feature_store_output = feature_store_output_;
     s3_output = s3_output_;
     output_name = output_name_;
   }
    : processing_output)

let make_processing_output_config ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ~outputs:(outputs_ : processing_outputs) () =
  ({ kms_key_id = kms_key_id_; outputs = outputs_ } : processing_output_config)

let make_processing_cluster_config ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ~volume_size_in_g_b:(volume_size_in_g_b_ : processing_volume_size_in_g_b)
    ~instance_type:(instance_type_ : processing_instance_type)
    ~instance_count:(instance_count_ : processing_instance_count) () =
  ({
     volume_kms_key_id = volume_kms_key_id_;
     volume_size_in_g_b = volume_size_in_g_b_;
     instance_type = instance_type_;
     instance_count = instance_count_;
   }
    : processing_cluster_config)

let make_processing_resources ~cluster_config:(cluster_config_ : processing_cluster_config) () =
  ({ cluster_config = cluster_config_ } : processing_resources)

let make_processing_stopping_condition
    ~max_runtime_in_seconds:(max_runtime_in_seconds_ : processing_max_runtime_in_seconds) () =
  ({ max_runtime_in_seconds = max_runtime_in_seconds_ } : processing_stopping_condition)

let make_app_specification ?container_arguments:(container_arguments_ : container_arguments option)
    ?container_entrypoint:(container_entrypoint_ : container_entrypoint option)
    ~image_uri:(image_uri_ : image_uri) () =
  ({
     container_arguments = container_arguments_;
     container_entrypoint = container_entrypoint_;
     image_uri = image_uri_;
   }
    : app_specification)

let make_processing_job ?tags:(tags_ : tag_list option)
    ?training_job_arn:(training_job_arn_ : training_job_arn option)
    ?auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn option)
    ?monitoring_schedule_arn:(monitoring_schedule_arn_ : monitoring_schedule_arn option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?processing_start_time:(processing_start_time_ : timestamp option)
    ?processing_end_time:(processing_end_time_ : timestamp option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?exit_message:(exit_message_ : exit_message option)
    ?processing_job_status:(processing_job_status_ : processing_job_status option)
    ?processing_job_arn:(processing_job_arn_ : processing_job_arn option)
    ?experiment_config:(experiment_config_ : experiment_config option)
    ?role_arn:(role_arn_ : role_arn option)
    ?network_config:(network_config_ : network_config option)
    ?environment:(environment_ : processing_environment_map option)
    ?app_specification:(app_specification_ : app_specification option)
    ?stopping_condition:(stopping_condition_ : processing_stopping_condition option)
    ?processing_resources:(processing_resources_ : processing_resources option)
    ?processing_job_name:(processing_job_name_ : processing_job_name option)
    ?processing_output_config:(processing_output_config_ : processing_output_config option)
    ?processing_inputs:(processing_inputs_ : processing_inputs option) () =
  ({
     tags = tags_;
     training_job_arn = training_job_arn_;
     auto_ml_job_arn = auto_ml_job_arn_;
     monitoring_schedule_arn = monitoring_schedule_arn_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     processing_start_time = processing_start_time_;
     processing_end_time = processing_end_time_;
     failure_reason = failure_reason_;
     exit_message = exit_message_;
     processing_job_status = processing_job_status_;
     processing_job_arn = processing_job_arn_;
     experiment_config = experiment_config_;
     role_arn = role_arn_;
     network_config = network_config_;
     environment = environment_;
     app_specification = app_specification_;
     stopping_condition = stopping_condition_;
     processing_resources = processing_resources_;
     processing_job_name = processing_job_name_;
     processing_output_config = processing_output_config_;
     processing_inputs = processing_inputs_;
   }
    : processing_job)

let make_model_client_config
    ?invocations_max_retries:(invocations_max_retries_ : invocations_max_retries option)
    ?invocations_timeout_in_seconds:
      (invocations_timeout_in_seconds_ : invocations_timeout_in_seconds option) () =
  ({
     invocations_max_retries = invocations_max_retries_;
     invocations_timeout_in_seconds = invocations_timeout_in_seconds_;
   }
    : model_client_config)

let make_transform_s3_data_source ~s3_uri:(s3_uri_ : s3_uri)
    ~s3_data_type:(s3_data_type_ : s3_data_type) () =
  ({ s3_uri = s3_uri_; s3_data_type = s3_data_type_ } : transform_s3_data_source)

let make_transform_data_source ~s3_data_source:(s3_data_source_ : transform_s3_data_source) () =
  ({ s3_data_source = s3_data_source_ } : transform_data_source)

let make_transform_input ?split_type:(split_type_ : split_type option)
    ?compression_type:(compression_type_ : compression_type option)
    ?content_type:(content_type_ : content_type option)
    ~data_source:(data_source_ : transform_data_source) () =
  ({
     split_type = split_type_;
     compression_type = compression_type_;
     content_type = content_type_;
     data_source = data_source_;
   }
    : transform_input)

let make_transform_output ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?assemble_with:(assemble_with_ : assembly_type option) ?accept:(accept_ : accept option)
    ~s3_output_path:(s3_output_path_ : s3_uri) () =
  ({
     kms_key_id = kms_key_id_;
     assemble_with = assemble_with_;
     accept = accept_;
     s3_output_path = s3_output_path_;
   }
    : transform_output)

let make_batch_data_capture_config ?generate_inference_id:(generate_inference_id_ : boolean_ option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ~destination_s3_uri:(destination_s3_uri_ : s3_uri)
    () =
  ({
     generate_inference_id = generate_inference_id_;
     kms_key_id = kms_key_id_;
     destination_s3_uri = destination_s3_uri_;
   }
    : batch_data_capture_config)

let make_transform_resources
    ?transform_ami_version:(transform_ami_version_ : transform_ami_version option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ~instance_count:(instance_count_ : transform_instance_count)
    ~instance_type:(instance_type_ : transform_instance_type) () =
  ({
     transform_ami_version = transform_ami_version_;
     volume_kms_key_id = volume_kms_key_id_;
     instance_count = instance_count_;
     instance_type = instance_type_;
   }
    : transform_resources)

let make_data_processing ?join_source:(join_source_ : join_source option)
    ?output_filter:(output_filter_ : json_path option)
    ?input_filter:(input_filter_ : json_path option) () =
  ({ join_source = join_source_; output_filter = output_filter_; input_filter = input_filter_ }
    : data_processing)

let make_transform_job ?tags:(tags_ : tag_list option)
    ?experiment_config:(experiment_config_ : experiment_config option)
    ?data_processing:(data_processing_ : data_processing option)
    ?auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn option)
    ?labeling_job_arn:(labeling_job_arn_ : labeling_job_arn option)
    ?transform_end_time:(transform_end_time_ : timestamp option)
    ?transform_start_time:(transform_start_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?transform_resources:(transform_resources_ : transform_resources option)
    ?data_capture_config:(data_capture_config_ : batch_data_capture_config option)
    ?transform_output:(transform_output_ : transform_output option)
    ?transform_input:(transform_input_ : transform_input option)
    ?environment:(environment_ : transform_environment_map option)
    ?batch_strategy:(batch_strategy_ : batch_strategy option)
    ?max_payload_in_m_b:(max_payload_in_m_b_ : max_payload_in_m_b option)
    ?model_client_config:(model_client_config_ : model_client_config option)
    ?max_concurrent_transforms:(max_concurrent_transforms_ : max_concurrent_transforms option)
    ?model_name:(model_name_ : model_name option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?transform_job_status:(transform_job_status_ : transform_job_status option)
    ?transform_job_arn:(transform_job_arn_ : transform_job_arn option)
    ?transform_job_name:(transform_job_name_ : transform_job_name option) () =
  ({
     tags = tags_;
     experiment_config = experiment_config_;
     data_processing = data_processing_;
     auto_ml_job_arn = auto_ml_job_arn_;
     labeling_job_arn = labeling_job_arn_;
     transform_end_time = transform_end_time_;
     transform_start_time = transform_start_time_;
     creation_time = creation_time_;
     transform_resources = transform_resources_;
     data_capture_config = data_capture_config_;
     transform_output = transform_output_;
     transform_input = transform_input_;
     environment = environment_;
     batch_strategy = batch_strategy_;
     max_payload_in_m_b = max_payload_in_m_b_;
     model_client_config = model_client_config_;
     max_concurrent_transforms = max_concurrent_transforms_;
     model_name = model_name_;
     failure_reason = failure_reason_;
     transform_job_status = transform_job_status_;
     transform_job_arn = transform_job_arn_;
     transform_job_name = transform_job_name_;
   }
    : transform_job)

let make_trial_component_source_detail ?transform_job:(transform_job_ : transform_job option)
    ?processing_job:(processing_job_ : processing_job option)
    ?training_job:(training_job_ : training_job option)
    ?source_arn:(source_arn_ : trial_component_source_arn option) () =
  ({
     transform_job = transform_job_;
     processing_job = processing_job_;
     training_job = training_job_;
     source_arn = source_arn_;
   }
    : trial_component_source_detail)

let make_trial_component_simple_summary ?created_by:(created_by_ : user_context option)
    ?creation_time:(creation_time_ : timestamp option)
    ?trial_component_source:(trial_component_source_ : trial_component_source option)
    ?trial_component_arn:(trial_component_arn_ : trial_component_arn option)
    ?trial_component_name:(trial_component_name_ : experiment_entity_name option) () =
  ({
     created_by = created_by_;
     creation_time = creation_time_;
     trial_component_source = trial_component_source_;
     trial_component_arn = trial_component_arn_;
     trial_component_name = trial_component_name_;
   }
    : trial_component_simple_summary)

let make_trial_component_metric_summary ?std_dev:(std_dev_ : optional_double option)
    ?avg:(avg_ : optional_double option) ?count:(count_ : optional_integer option)
    ?last:(last_ : optional_double option) ?min:(min_ : optional_double option)
    ?max:(max_ : optional_double option) ?time_stamp:(time_stamp_ : timestamp option)
    ?source_arn:(source_arn_ : trial_component_source_arn option)
    ?metric_name:(metric_name_ : metric_name option) () =
  ({
     std_dev = std_dev_;
     avg = avg_;
     count = count_;
     last = last_;
     min = min_;
     max = max_;
     time_stamp = time_stamp_;
     source_arn = source_arn_;
     metric_name = metric_name_;
   }
    : trial_component_metric_summary)

let make_metadata_properties ?project_id:(project_id_ : metadata_property_value option)
    ?generated_by:(generated_by_ : metadata_property_value option)
    ?repository:(repository_ : metadata_property_value option)
    ?commit_id:(commit_id_ : metadata_property_value option) () =
  ({
     project_id = project_id_;
     generated_by = generated_by_;
     repository = repository_;
     commit_id = commit_id_;
   }
    : metadata_properties)

let make_parent ?experiment_name:(experiment_name_ : experiment_entity_name option)
    ?trial_name:(trial_name_ : experiment_entity_name option) () =
  ({ experiment_name = experiment_name_; trial_name = trial_name_ } : parent)

let make_trial_component ?run_name:(run_name_ : experiment_entity_name option)
    ?parents:(parents_ : parents option) ?tags:(tags_ : tag_list option)
    ?lineage_group_arn:(lineage_group_arn_ : lineage_group_arn option)
    ?source_detail:(source_detail_ : trial_component_source_detail option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?metrics:(metrics_ : trial_component_metric_summaries option)
    ?output_artifacts:(output_artifacts_ : trial_component_artifacts option)
    ?input_artifacts:(input_artifacts_ : trial_component_artifacts option)
    ?parameters:(parameters_ : trial_component_parameters option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?creation_time:(creation_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option) ?status:(status_ : trial_component_status option)
    ?source:(source_ : trial_component_source option)
    ?trial_component_arn:(trial_component_arn_ : trial_component_arn option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?trial_component_name:(trial_component_name_ : experiment_entity_name option) () =
  ({
     run_name = run_name_;
     parents = parents_;
     tags = tags_;
     lineage_group_arn = lineage_group_arn_;
     source_detail = source_detail_;
     metadata_properties = metadata_properties_;
     metrics = metrics_;
     output_artifacts = output_artifacts_;
     input_artifacts = input_artifacts_;
     parameters = parameters_;
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     created_by = created_by_;
     creation_time = creation_time_;
     end_time = end_time_;
     start_time = start_time_;
     status = status_;
     source = source_;
     trial_component_arn = trial_component_arn_;
     display_name = display_name_;
     trial_component_name = trial_component_name_;
   }
    : trial_component)

let make_trial
    ?trial_component_summaries:
      (trial_component_summaries_ : trial_component_simple_summaries option)
    ?tags:(tags_ : tag_list option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?creation_time:(creation_time_ : timestamp option) ?source:(source_ : trial_source option)
    ?experiment_name:(experiment_name_ : experiment_entity_name option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?trial_arn:(trial_arn_ : trial_arn option)
    ?trial_name:(trial_name_ : experiment_entity_name option) () =
  ({
     trial_component_summaries = trial_component_summaries_;
     tags = tags_;
     metadata_properties = metadata_properties_;
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     created_by = created_by_;
     creation_time = creation_time_;
     source = source_;
     experiment_name = experiment_name_;
     display_name = display_name_;
     trial_arn = trial_arn_;
     trial_name = trial_name_;
   }
    : trial)

let make_transform_job_summary ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?transform_end_time:(transform_end_time_ : timestamp option)
    ~transform_job_status:(transform_job_status_ : transform_job_status)
    ~creation_time:(creation_time_ : timestamp)
    ~transform_job_arn:(transform_job_arn_ : transform_job_arn)
    ~transform_job_name:(transform_job_name_ : transform_job_name) () =
  ({
     failure_reason = failure_reason_;
     transform_job_status = transform_job_status_;
     last_modified_time = last_modified_time_;
     transform_end_time = transform_end_time_;
     creation_time = creation_time_;
     transform_job_arn = transform_job_arn_;
     transform_job_name = transform_job_name_;
   }
    : transform_job_summary)

let make_transform_job_step_metadata ?arn:(arn_ : transform_job_arn option) () =
  ({ arn = arn_ } : transform_job_step_metadata)

let make_transform_job_definition ?environment:(environment_ : transform_environment_map option)
    ?batch_strategy:(batch_strategy_ : batch_strategy option)
    ?max_payload_in_m_b:(max_payload_in_m_b_ : max_payload_in_m_b option)
    ?max_concurrent_transforms:(max_concurrent_transforms_ : max_concurrent_transforms option)
    ~transform_resources:(transform_resources_ : transform_resources)
    ~transform_output:(transform_output_ : transform_output)
    ~transform_input:(transform_input_ : transform_input) () =
  ({
     transform_resources = transform_resources_;
     transform_output = transform_output_;
     transform_input = transform_input_;
     environment = environment_;
     batch_strategy = batch_strategy_;
     max_payload_in_m_b = max_payload_in_m_b_;
     max_concurrent_transforms = max_concurrent_transforms_;
   }
    : transform_job_definition)

let make_integer_parameter_range_specification ~max_value:(max_value_ : parameter_value)
    ~min_value:(min_value_ : parameter_value) () =
  ({ max_value = max_value_; min_value = min_value_ } : integer_parameter_range_specification)

let make_continuous_parameter_range_specification ~max_value:(max_value_ : parameter_value)
    ~min_value:(min_value_ : parameter_value) () =
  ({ max_value = max_value_; min_value = min_value_ } : continuous_parameter_range_specification)

let make_categorical_parameter_range_specification ~values:(values_ : parameter_values) () =
  ({ values = values_ } : categorical_parameter_range_specification)

let make_parameter_range
    ?categorical_parameter_range_specification:
      (categorical_parameter_range_specification_ : categorical_parameter_range_specification option)
    ?continuous_parameter_range_specification:
      (continuous_parameter_range_specification_ : continuous_parameter_range_specification option)
    ?integer_parameter_range_specification:
      (integer_parameter_range_specification_ : integer_parameter_range_specification option) () =
  ({
     categorical_parameter_range_specification = categorical_parameter_range_specification_;
     continuous_parameter_range_specification = continuous_parameter_range_specification_;
     integer_parameter_range_specification = integer_parameter_range_specification_;
   }
    : parameter_range)

let make_hyper_parameter_specification
    ?default_value:(default_value_ : hyper_parameter_value option)
    ?is_required:(is_required_ : boolean_ option) ?is_tunable:(is_tunable_ : boolean_ option)
    ?range:(range_ : parameter_range option) ?description:(description_ : entity_description option)
    ~type_:(type__ : parameter_type) ~name:(name_ : parameter_name) () =
  ({
     default_value = default_value_;
     is_required = is_required_;
     is_tunable = is_tunable_;
     range = range_;
     type_ = type__;
     description = description_;
     name = name_;
   }
    : hyper_parameter_specification)

let make_channel_specification
    ?supported_compression_types:(supported_compression_types_ : compression_types option)
    ?is_required:(is_required_ : boolean_ option)
    ?description:(description_ : entity_description option)
    ~supported_input_modes:(supported_input_modes_ : input_modes)
    ~supported_content_types:(supported_content_types_ : content_types) ~name:(name_ : channel_name)
    () =
  ({
     supported_input_modes = supported_input_modes_;
     supported_compression_types = supported_compression_types_;
     supported_content_types = supported_content_types_;
     is_required = is_required_;
     description = description_;
     name = name_;
   }
    : channel_specification)

let make_hyper_parameter_tuning_job_objective ~metric_name:(metric_name_ : metric_name)
    ~type_:(type__ : hyper_parameter_tuning_job_objective_type) () =
  ({ metric_name = metric_name_; type_ = type__ } : hyper_parameter_tuning_job_objective)

let make_training_specification
    ?additional_s3_data_source:(additional_s3_data_source_ : additional_s3_data_source option)
    ?supported_tuning_job_objective_metrics:
      (supported_tuning_job_objective_metrics_ : hyper_parameter_tuning_job_objectives option)
    ?metric_definitions:(metric_definitions_ : metric_definition_list option)
    ?supports_distributed_training:(supports_distributed_training_ : boolean_ option)
    ?supported_hyper_parameters:
      (supported_hyper_parameters_ : hyper_parameter_specifications option)
    ?training_image_digest:(training_image_digest_ : image_digest option)
    ~training_channels:(training_channels_ : channel_specifications)
    ~supported_training_instance_types:
      (supported_training_instance_types_ : training_instance_types)
    ~training_image:(training_image_ : container_image) () =
  ({
     additional_s3_data_source = additional_s3_data_source_;
     supported_tuning_job_objective_metrics = supported_tuning_job_objective_metrics_;
     training_channels = training_channels_;
     metric_definitions = metric_definitions_;
     supports_distributed_training = supports_distributed_training_;
     supported_training_instance_types = supported_training_instance_types_;
     supported_hyper_parameters = supported_hyper_parameters_;
     training_image_digest = training_image_digest_;
     training_image = training_image_;
   }
    : training_specification)

let make_training_progress_info ?max_epoch:(max_epoch_ : training_epoch_count option)
    ?current_epoch:(current_epoch_ : training_epoch_index option)
    ?current_step:(current_step_ : training_step_index option)
    ?total_step_count_per_epoch:(total_step_count_per_epoch_ : total_step_count_per_epoch option) ()
    =
  ({
     max_epoch = max_epoch_;
     current_epoch = current_epoch_;
     current_step = current_step_;
     total_step_count_per_epoch = total_step_count_per_epoch_;
   }
    : training_progress_info)

let make_reserved_capacity_summary ?end_time:(end_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option)
    ?duration_minutes:(duration_minutes_ : reserved_capacity_duration_minutes option)
    ?duration_hours:(duration_hours_ : reserved_capacity_duration_hours option)
    ?availability_zone_id:(availability_zone_id_ : availability_zone_id option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?ultra_server_count:(ultra_server_count_ : ultra_server_count option)
    ?ultra_server_type:(ultra_server_type_ : ultra_server_type option)
    ?reserved_capacity_type:(reserved_capacity_type_ : reserved_capacity_type option)
    ~status:(status_ : reserved_capacity_status)
    ~total_instance_count:(total_instance_count_ : total_instance_count)
    ~instance_type:(instance_type_ : reserved_capacity_instance_type)
    ~reserved_capacity_arn:(reserved_capacity_arn_ : reserved_capacity_arn) () =
  ({
     end_time = end_time_;
     start_time = start_time_;
     duration_minutes = duration_minutes_;
     duration_hours = duration_hours_;
     availability_zone_id = availability_zone_id_;
     availability_zone = availability_zone_;
     status = status_;
     total_instance_count = total_instance_count_;
     instance_type = instance_type_;
     ultra_server_count = ultra_server_count_;
     ultra_server_type = ultra_server_type_;
     reserved_capacity_type = reserved_capacity_type_;
     reserved_capacity_arn = reserved_capacity_arn_;
   }
    : reserved_capacity_summary)

let make_training_plan_summary
    ?reserved_capacity_summaries:(reserved_capacity_summaries_ : reserved_capacity_summaries option)
    ?target_resources:(target_resources_ : sage_maker_resource_names option)
    ?total_ultra_server_count:(total_ultra_server_count_ : ultra_server_count option)
    ?in_use_instance_count:(in_use_instance_count_ : in_use_instance_count option)
    ?available_instance_count:(available_instance_count_ : available_instance_count option)
    ?total_instance_count:(total_instance_count_ : total_instance_count option)
    ?currency_code:(currency_code_ : currency_code option)
    ?upfront_fee:(upfront_fee_ : string256 option) ?end_time:(end_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option)
    ?duration_minutes:(duration_minutes_ : training_plan_duration_minutes option)
    ?duration_hours:(duration_hours_ : training_plan_duration_hours option)
    ?status_message:(status_message_ : training_plan_status_message option)
    ~status:(status_ : training_plan_status)
    ~training_plan_name:(training_plan_name_ : training_plan_name)
    ~training_plan_arn:(training_plan_arn_ : training_plan_arn) () =
  ({
     reserved_capacity_summaries = reserved_capacity_summaries_;
     target_resources = target_resources_;
     total_ultra_server_count = total_ultra_server_count_;
     in_use_instance_count = in_use_instance_count_;
     available_instance_count = available_instance_count_;
     total_instance_count = total_instance_count_;
     currency_code = currency_code_;
     upfront_fee = upfront_fee_;
     end_time = end_time_;
     start_time = start_time_;
     duration_minutes = duration_minutes_;
     duration_hours = duration_hours_;
     status_message = status_message_;
     status = status_;
     training_plan_name = training_plan_name_;
     training_plan_arn = training_plan_arn_;
   }
    : training_plan_summary)

let make_reserved_capacity_offering ?extension_end_time:(extension_end_time_ : timestamp option)
    ?extension_start_time:(extension_start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?duration_minutes:(duration_minutes_ : reserved_capacity_duration_minutes option)
    ?duration_hours:(duration_hours_ : reserved_capacity_duration_hours option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?ultra_server_count:(ultra_server_count_ : ultra_server_count option)
    ?ultra_server_type:(ultra_server_type_ : ultra_server_type option)
    ?reserved_capacity_type:(reserved_capacity_type_ : reserved_capacity_type option)
    ~instance_count:(instance_count_ : reserved_capacity_instance_count)
    ~instance_type:(instance_type_ : reserved_capacity_instance_type) () =
  ({
     extension_end_time = extension_end_time_;
     extension_start_time = extension_start_time_;
     end_time = end_time_;
     start_time = start_time_;
     duration_minutes = duration_minutes_;
     duration_hours = duration_hours_;
     availability_zone = availability_zone_;
     instance_count = instance_count_;
     instance_type = instance_type_;
     ultra_server_count = ultra_server_count_;
     ultra_server_type = ultra_server_type_;
     reserved_capacity_type = reserved_capacity_type_;
   }
    : reserved_capacity_offering)

let make_training_plan_offering
    ?reserved_capacity_offerings:(reserved_capacity_offerings_ : reserved_capacity_offerings option)
    ?currency_code:(currency_code_ : currency_code option)
    ?upfront_fee:(upfront_fee_ : string256 option)
    ?duration_minutes:(duration_minutes_ : training_plan_duration_minutes option)
    ?duration_hours:(duration_hours_ : training_plan_duration_hours option)
    ?requested_end_time_before:(requested_end_time_before_ : timestamp option)
    ?requested_start_time_after:(requested_start_time_after_ : timestamp option)
    ~target_resources:(target_resources_ : sage_maker_resource_names)
    ~training_plan_offering_id:(training_plan_offering_id_ : training_plan_offering_id) () =
  ({
     reserved_capacity_offerings = reserved_capacity_offerings_;
     currency_code = currency_code_;
     upfront_fee = upfront_fee_;
     duration_minutes = duration_minutes_;
     duration_hours = duration_hours_;
     requested_end_time_before = requested_end_time_before_;
     requested_start_time_after = requested_start_time_after_;
     target_resources = target_resources_;
     training_plan_offering_id = training_plan_offering_id_;
   }
    : training_plan_offering)

let make_training_plan_filter ~value:(value_ : string64) ~name:(name_ : training_plan_filter_name)
    () =
  ({ value = value_; name = name_ } : training_plan_filter)

let make_training_plan_extension ?currency_code:(currency_code_ : currency_code option)
    ?upfront_fee:(upfront_fee_ : string256 option)
    ?duration_hours:(duration_hours_ : training_plan_extension_duration_hours option)
    ?availability_zone_id:(availability_zone_id_ : availability_zone_id option)
    ?availability_zone:(availability_zone_ : string256 option)
    ?payment_status:(payment_status_ : string256 option) ?status:(status_ : string256 option)
    ?end_date:(end_date_ : timestamp option) ?start_date:(start_date_ : timestamp option)
    ?extended_at:(extended_at_ : timestamp option)
    ~training_plan_extension_offering_id:
      (training_plan_extension_offering_id_ : training_plan_extension_offering_id) () =
  ({
     currency_code = currency_code_;
     upfront_fee = upfront_fee_;
     duration_hours = duration_hours_;
     availability_zone_id = availability_zone_id_;
     availability_zone = availability_zone_;
     payment_status = payment_status_;
     status = status_;
     end_date = end_date_;
     start_date = start_date_;
     extended_at = extended_at_;
     training_plan_extension_offering_id = training_plan_extension_offering_id_;
   }
    : training_plan_extension)

let make_training_plan_extension_offering ?currency_code:(currency_code_ : currency_code option)
    ?upfront_fee:(upfront_fee_ : string256 option)
    ?duration_hours:(duration_hours_ : training_plan_extension_duration_hours option)
    ?end_date:(end_date_ : timestamp option) ?start_date:(start_date_ : timestamp option)
    ?availability_zone:(availability_zone_ : string256 option)
    ~training_plan_extension_offering_id:
      (training_plan_extension_offering_id_ : training_plan_extension_offering_id) () =
  ({
     currency_code = currency_code_;
     upfront_fee = upfront_fee_;
     duration_hours = duration_hours_;
     end_date = end_date_;
     start_date = start_date_;
     availability_zone = availability_zone_;
     training_plan_extension_offering_id = training_plan_extension_offering_id_;
   }
    : training_plan_extension_offering)

let make_training_job_summary ?training_plan_arn:(training_plan_arn_ : training_plan_arn option)
    ?warm_pool_status:(warm_pool_status_ : warm_pool_status option)
    ?secondary_status:(secondary_status_ : secondary_status option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?training_end_time:(training_end_time_ : timestamp option)
    ~training_job_status:(training_job_status_ : training_job_status)
    ~creation_time:(creation_time_ : timestamp)
    ~training_job_arn:(training_job_arn_ : training_job_arn)
    ~training_job_name:(training_job_name_ : training_job_name) () =
  ({
     training_plan_arn = training_plan_arn_;
     warm_pool_status = warm_pool_status_;
     secondary_status = secondary_status_;
     training_job_status = training_job_status_;
     last_modified_time = last_modified_time_;
     training_end_time = training_end_time_;
     creation_time = creation_time_;
     training_job_arn = training_job_arn_;
     training_job_name = training_job_name_;
   }
    : training_job_summary)

let make_training_job_step_metadata ?arn:(arn_ : training_job_arn option) () =
  ({ arn = arn_ } : training_job_step_metadata)

let make_training_job_status_counters ?stopped:(stopped_ : training_job_status_counter option)
    ?non_retryable_error:(non_retryable_error_ : training_job_status_counter option)
    ?retryable_error:(retryable_error_ : training_job_status_counter option)
    ?in_progress:(in_progress_ : training_job_status_counter option)
    ?completed:(completed_ : training_job_status_counter option) () =
  ({
     stopped = stopped_;
     non_retryable_error = non_retryable_error_;
     retryable_error = retryable_error_;
     in_progress = in_progress_;
     completed = completed_;
   }
    : training_job_status_counters)

let make_training_job_definition ?hyper_parameters:(hyper_parameters_ : hyper_parameters option)
    ~stopping_condition:(stopping_condition_ : stopping_condition)
    ~resource_config:(resource_config_ : resource_config)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~input_data_config:(input_data_config_ : input_data_config)
    ~training_input_mode:(training_input_mode_ : training_input_mode) () =
  ({
     stopping_condition = stopping_condition_;
     resource_config = resource_config_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     hyper_parameters = hyper_parameters_;
     training_input_mode = training_input_mode_;
   }
    : training_job_definition)

let make_phase ?duration_in_seconds:(duration_in_seconds_ : traffic_duration_in_seconds option)
    ?spawn_rate:(spawn_rate_ : spawn_rate option)
    ?initial_number_of_users:(initial_number_of_users_ : initial_number_of_users option) () =
  ({
     duration_in_seconds = duration_in_seconds_;
     spawn_rate = spawn_rate_;
     initial_number_of_users = initial_number_of_users_;
   }
    : phase)

let make_stairs ?users_per_step:(users_per_step_ : users_per_step option)
    ?number_of_steps:(number_of_steps_ : number_of_steps option)
    ?duration_in_seconds:(duration_in_seconds_ : traffic_duration_in_seconds option) () =
  ({
     users_per_step = users_per_step_;
     number_of_steps = number_of_steps_;
     duration_in_seconds = duration_in_seconds_;
   }
    : stairs)

let make_traffic_pattern ?stairs:(stairs_ : stairs option) ?phases:(phases_ : phases option)
    ?traffic_type:(traffic_type_ : traffic_type option) () =
  ({ stairs = stairs_; phases = phases_; traffic_type = traffic_type_ } : traffic_pattern)

let make_tracking_server_summary ?mlflow_version:(mlflow_version_ : mlflow_version option)
    ?is_active:(is_active_ : is_tracking_server_active option)
    ?tracking_server_status:(tracking_server_status_ : tracking_server_status option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?tracking_server_name:(tracking_server_name_ : tracking_server_name option)
    ?tracking_server_arn:(tracking_server_arn_ : tracking_server_arn option) () =
  ({
     mlflow_version = mlflow_version_;
     is_active = is_active_;
     tracking_server_status = tracking_server_status_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     tracking_server_name = tracking_server_name_;
     tracking_server_arn = tracking_server_arn_;
   }
    : tracking_server_summary)

let make_total_hits ?relation:(relation_ : relation option) ?value:(value_ : long option) () =
  ({ relation = relation_; value = value_ } : total_hits)

let make_time_series_transformations
    ?aggregation:(aggregation_ : aggregation_transformations option)
    ?filling:(filling_ : filling_transformations option) () =
  ({ aggregation = aggregation_; filling = filling_ } : time_series_transformations)

let make_auto_ml_job_completion_criteria
    ?max_auto_ml_job_runtime_in_seconds:
      (max_auto_ml_job_runtime_in_seconds_ : max_auto_ml_job_runtime_in_seconds option)
    ?max_runtime_per_training_job_in_seconds:
      (max_runtime_per_training_job_in_seconds_ : max_runtime_per_training_job_in_seconds option)
    ?max_candidates:(max_candidates_ : max_candidates option) () =
  ({
     max_auto_ml_job_runtime_in_seconds = max_auto_ml_job_runtime_in_seconds_;
     max_runtime_per_training_job_in_seconds = max_runtime_per_training_job_in_seconds_;
     max_candidates = max_candidates_;
   }
    : auto_ml_job_completion_criteria)

let make_time_series_config
    ?grouping_attribute_names:(grouping_attribute_names_ : grouping_attribute_names option)
    ~item_identifier_attribute_name:
      (item_identifier_attribute_name_ : item_identifier_attribute_name)
    ~timestamp_attribute_name:(timestamp_attribute_name_ : timestamp_attribute_name)
    ~target_attribute_name:(target_attribute_name_ : target_attribute_name) () =
  ({
     grouping_attribute_names = grouping_attribute_names_;
     item_identifier_attribute_name = item_identifier_attribute_name_;
     timestamp_attribute_name = timestamp_attribute_name_;
     target_attribute_name = target_attribute_name_;
   }
    : time_series_config)

let make_holiday_config_attributes ?country_code:(country_code_ : country_code option) () =
  ({ country_code = country_code_ } : holiday_config_attributes)

let make_auto_ml_algorithm_config ~auto_ml_algorithms:(auto_ml_algorithms_ : auto_ml_algorithms) ()
    =
  ({ auto_ml_algorithms = auto_ml_algorithms_ } : auto_ml_algorithm_config)

let make_candidate_generation_config
    ?algorithms_config:(algorithms_config_ : auto_ml_algorithms_config option) () =
  ({ algorithms_config = algorithms_config_ } : candidate_generation_config)

let make_time_series_forecasting_job_config
    ?candidate_generation_config:(candidate_generation_config_ : candidate_generation_config option)
    ?holiday_config:(holiday_config_ : holiday_config option)
    ?transformations:(transformations_ : time_series_transformations option)
    ?forecast_quantiles:(forecast_quantiles_ : forecast_quantiles option)
    ?completion_criteria:(completion_criteria_ : auto_ml_job_completion_criteria option)
    ?feature_specification_s3_uri:(feature_specification_s3_uri_ : s3_uri option)
    ~time_series_config:(time_series_config_ : time_series_config)
    ~forecast_horizon:(forecast_horizon_ : forecast_horizon)
    ~forecast_frequency:(forecast_frequency_ : forecast_frequency) () =
  ({
     candidate_generation_config = candidate_generation_config_;
     holiday_config = holiday_config_;
     time_series_config = time_series_config_;
     transformations = transformations_;
     forecast_quantiles = forecast_quantiles_;
     forecast_horizon = forecast_horizon_;
     forecast_frequency = forecast_frequency_;
     completion_criteria = completion_criteria_;
     feature_specification_s3_uri = feature_specification_s3_uri_;
   }
    : time_series_forecasting_job_config)

let make_throughput_config_description
    ?provisioned_write_capacity_units:(provisioned_write_capacity_units_ : capacity_unit option)
    ?provisioned_read_capacity_units:(provisioned_read_capacity_units_ : capacity_unit option)
    ~throughput_mode:(throughput_mode_ : throughput_mode) () =
  ({
     provisioned_write_capacity_units = provisioned_write_capacity_units_;
     provisioned_read_capacity_units = provisioned_read_capacity_units_;
     throughput_mode = throughput_mode_;
   }
    : throughput_config_description)

let make_throughput_config
    ?provisioned_write_capacity_units:(provisioned_write_capacity_units_ : capacity_unit option)
    ?provisioned_read_capacity_units:(provisioned_read_capacity_units_ : capacity_unit option)
    ~throughput_mode:(throughput_mode_ : throughput_mode) () =
  ({
     provisioned_write_capacity_units = provisioned_write_capacity_units_;
     provisioned_read_capacity_units = provisioned_read_capacity_units_;
     throughput_mode = throughput_mode_;
   }
    : throughput_config)

let make_text_generation_resolved_attributes
    ?base_model_name:(base_model_name_ : base_model_name option) () =
  ({ base_model_name = base_model_name_ } : text_generation_resolved_attributes)

let make_text_generation_job_config
    ?model_access_config:(model_access_config_ : model_access_config option)
    ?text_generation_hyper_parameters:
      (text_generation_hyper_parameters_ : text_generation_hyper_parameters option)
    ?base_model_name:(base_model_name_ : base_model_name option)
    ?completion_criteria:(completion_criteria_ : auto_ml_job_completion_criteria option) () =
  ({
     model_access_config = model_access_config_;
     text_generation_hyper_parameters = text_generation_hyper_parameters_;
     base_model_name = base_model_name_;
     completion_criteria = completion_criteria_;
   }
    : text_generation_job_config)

let make_text_classification_job_config
    ?completion_criteria:(completion_criteria_ : auto_ml_job_completion_criteria option)
    ~target_label_column:(target_label_column_ : target_label_column)
    ~content_column:(content_column_ : content_column) () =
  ({
     target_label_column = target_label_column_;
     content_column = content_column_;
     completion_criteria = completion_criteria_;
   }
    : text_classification_job_config)

let make_cfn_stack_parameter ?value:(value_ : cfn_stack_parameter_value option)
    ~key:(key_ : cfn_stack_parameter_key) () =
  ({ value = value_; key = key_ } : cfn_stack_parameter)

let make_cfn_stack_detail ?id:(id_ : cfn_stack_id option) ?name:(name_ : cfn_stack_name option)
    ~status_message:(status_message_ : cfn_stack_status_message) () =
  ({ status_message = status_message_; id = id_; name = name_ } : cfn_stack_detail)

let make_cfn_template_provider_detail ?stack_detail:(stack_detail_ : cfn_stack_detail option)
    ?parameters:(parameters_ : cfn_stack_parameters option)
    ?role_ar_n:(role_ar_n_ : role_arn option) ~template_ur_l:(template_ur_l_ : cfn_template_ur_l)
    ~template_name:(template_name_ : cfn_template_name) () =
  ({
     stack_detail = stack_detail_;
     parameters = parameters_;
     role_ar_n = role_ar_n_;
     template_ur_l = template_ur_l_;
     template_name = template_name_;
   }
    : cfn_template_provider_detail)

let make_template_provider_detail
    ?cfn_template_provider_detail:
      (cfn_template_provider_detail_ : cfn_template_provider_detail option) () =
  ({ cfn_template_provider_detail = cfn_template_provider_detail_ } : template_provider_detail)

let make_predefined_metric_specification
    ?predefined_metric_type:(predefined_metric_type_ : string_ option) () =
  ({ predefined_metric_type = predefined_metric_type_ } : predefined_metric_specification)

let make_customized_metric_specification ?statistic:(statistic_ : statistic option)
    ?namespace:(namespace_ : string_ option) ?metric_name:(metric_name_ : string_ option) () =
  ({ statistic = statistic_; namespace = namespace_; metric_name = metric_name_ }
    : customized_metric_specification)

let make_target_tracking_scaling_policy_configuration ?target_value:(target_value_ : double option)
    ?metric_specification:(metric_specification_ : metric_specification option) () =
  ({ target_value = target_value_; metric_specification = metric_specification_ }
    : target_tracking_scaling_policy_configuration)

let make_target_platform ?accelerator:(accelerator_ : target_platform_accelerator option)
    ~arch:(arch_ : target_platform_arch) ~os:(os_ : target_platform_os) () =
  ({ accelerator = accelerator_; arch = arch_; os = os_ } : target_platform)

let make_tabular_resolved_attributes ?problem_type:(problem_type_ : problem_type option) () =
  ({ problem_type = problem_type_ } : tabular_resolved_attributes)

let make_tabular_job_config
    ?sample_weight_attribute_name:
      (sample_weight_attribute_name_ : sample_weight_attribute_name option)
    ?problem_type:(problem_type_ : problem_type option)
    ?generate_candidate_definitions_only:
      (generate_candidate_definitions_only_ : generate_candidate_definitions_only option)
    ?mode:(mode_ : auto_ml_mode option)
    ?feature_specification_s3_uri:(feature_specification_s3_uri_ : s3_uri option)
    ?completion_criteria:(completion_criteria_ : auto_ml_job_completion_criteria option)
    ?candidate_generation_config:(candidate_generation_config_ : candidate_generation_config option)
    ~target_attribute_name:(target_attribute_name_ : target_attribute_name) () =
  ({
     sample_weight_attribute_name = sample_weight_attribute_name_;
     target_attribute_name = target_attribute_name_;
     problem_type = problem_type_;
     generate_candidate_definitions_only = generate_candidate_definitions_only_;
     mode = mode_;
     feature_specification_s3_uri = feature_specification_s3_uri_;
     completion_criteria = completion_criteria_;
     candidate_generation_config = candidate_generation_config_;
   }
    : tabular_job_config)

let make_property_name_query ~property_name_hint:(property_name_hint_ : property_name_hint) () =
  ({ property_name_hint = property_name_hint_ } : property_name_query)

let make_suggestion_query ?property_name_query:(property_name_query_ : property_name_query option)
    () =
  ({ property_name_query = property_name_query_ } : suggestion_query)

let make_subscribed_workteam ?listing_id:(listing_id_ : string_ option)
    ?marketplace_description:(marketplace_description_ : string200 option)
    ?seller_name:(seller_name_ : string_ option)
    ?marketplace_title:(marketplace_title_ : string200 option)
    ~workteam_arn:(workteam_arn_ : workteam_arn) () =
  ({
     listing_id = listing_id_;
     marketplace_description = marketplace_description_;
     seller_name = seller_name_;
     marketplace_title = marketplace_title_;
     workteam_arn = workteam_arn_;
   }
    : subscribed_workteam)

let make_studio_lifecycle_config_details
    ?studio_lifecycle_config_app_type:
      (studio_lifecycle_config_app_type_ : studio_lifecycle_config_app_type option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?studio_lifecycle_config_name:
      (studio_lifecycle_config_name_ : studio_lifecycle_config_name option)
    ?studio_lifecycle_config_arn:(studio_lifecycle_config_arn_ : studio_lifecycle_config_arn option)
    () =
  ({
     studio_lifecycle_config_app_type = studio_lifecycle_config_app_type_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     studio_lifecycle_config_name = studio_lifecycle_config_name_;
     studio_lifecycle_config_arn = studio_lifecycle_config_arn_;
   }
    : studio_lifecycle_config_details)

let make_stop_transform_job_request ~transform_job_name:(transform_job_name_ : transform_job_name)
    () =
  ({ transform_job_name = transform_job_name_ } : stop_transform_job_request)

let make_stop_training_job_request ~training_job_name:(training_job_name_ : training_job_name) () =
  ({ training_job_name = training_job_name_ } : stop_training_job_request)

let make_stop_processing_job_request
    ~processing_job_name:(processing_job_name_ : processing_job_name) () =
  ({ processing_job_name = processing_job_name_ } : stop_processing_job_request)

let make_stop_pipeline_execution_response
    ?pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn option) () =
  ({ pipeline_execution_arn = pipeline_execution_arn_ } : stop_pipeline_execution_response)

let make_stop_pipeline_execution_request
    ~client_request_token:(client_request_token_ : idempotency_token)
    ~pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn) () =
  ({
     client_request_token = client_request_token_;
     pipeline_execution_arn = pipeline_execution_arn_;
   }
    : stop_pipeline_execution_request)

let make_stop_optimization_job_request ~optimization_job_name:(optimization_job_name_ : entity_name)
    () =
  ({ optimization_job_name = optimization_job_name_ } : stop_optimization_job_request)

let make_stop_notebook_instance_input
    ~notebook_instance_name:(notebook_instance_name_ : notebook_instance_name) () =
  ({ notebook_instance_name = notebook_instance_name_ } : stop_notebook_instance_input)

let make_stop_monitoring_schedule_request
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name) () =
  ({ monitoring_schedule_name = monitoring_schedule_name_ } : stop_monitoring_schedule_request)

let make_stop_mlflow_tracking_server_response
    ?tracking_server_arn:(tracking_server_arn_ : tracking_server_arn option) () =
  ({ tracking_server_arn = tracking_server_arn_ } : stop_mlflow_tracking_server_response)

let make_stop_mlflow_tracking_server_request
    ~tracking_server_name:(tracking_server_name_ : tracking_server_name) () =
  ({ tracking_server_name = tracking_server_name_ } : stop_mlflow_tracking_server_request)

let make_stop_labeling_job_request ~labeling_job_name:(labeling_job_name_ : labeling_job_name) () =
  ({ labeling_job_name = labeling_job_name_ } : stop_labeling_job_request)

let make_stop_job_response () = (() : unit)

let make_stop_job_request ~job_category:(job_category_ : job_category)
    ~job_name:(job_name_ : job_name) () =
  ({ job_category = job_category_; job_name = job_name_ } : stop_job_request)

let make_stop_inference_recommendations_job_request ~job_name:(job_name_ : recommendation_job_name)
    () =
  ({ job_name = job_name_ } : stop_inference_recommendations_job_request)

let make_stop_inference_experiment_response
    ~inference_experiment_arn:(inference_experiment_arn_ : inference_experiment_arn) () =
  ({ inference_experiment_arn = inference_experiment_arn_ } : stop_inference_experiment_response)

let make_stop_inference_experiment_request
    ?reason:(reason_ : inference_experiment_status_reason option)
    ?desired_state:(desired_state_ : inference_experiment_stop_desired_state option)
    ?desired_model_variants:(desired_model_variants_ : model_variant_config_list option)
    ~model_variant_actions:(model_variant_actions_ : model_variant_action_map)
    ~name:(name_ : inference_experiment_name) () =
  ({
     reason = reason_;
     desired_state = desired_state_;
     desired_model_variants = desired_model_variants_;
     model_variant_actions = model_variant_actions_;
     name = name_;
   }
    : stop_inference_experiment_request)

let make_stop_hyper_parameter_tuning_job_request
    ~hyper_parameter_tuning_job_name:
      (hyper_parameter_tuning_job_name_ : hyper_parameter_tuning_job_name) () =
  ({ hyper_parameter_tuning_job_name = hyper_parameter_tuning_job_name_ }
    : stop_hyper_parameter_tuning_job_request)

let make_stop_edge_packaging_job_request
    ~edge_packaging_job_name:(edge_packaging_job_name_ : entity_name) () =
  ({ edge_packaging_job_name = edge_packaging_job_name_ } : stop_edge_packaging_job_request)

let make_stop_edge_deployment_stage_request ~stage_name:(stage_name_ : entity_name)
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name) () =
  ({ stage_name = stage_name_; edge_deployment_plan_name = edge_deployment_plan_name_ }
    : stop_edge_deployment_stage_request)

let make_stop_compilation_job_request ~compilation_job_name:(compilation_job_name_ : entity_name) ()
    =
  ({ compilation_job_name = compilation_job_name_ } : stop_compilation_job_request)

let make_stop_auto_ml_job_request ~auto_ml_job_name:(auto_ml_job_name_ : auto_ml_job_name) () =
  ({ auto_ml_job_name = auto_ml_job_name_ } : stop_auto_ml_job_request)

let make_stop_ai_recommendation_job_response
    ~ai_recommendation_job_arn:(ai_recommendation_job_arn_ : ai_recommendation_job_arn) () =
  ({ ai_recommendation_job_arn = ai_recommendation_job_arn_ } : stop_ai_recommendation_job_response)

let make_stop_ai_recommendation_job_request
    ~ai_recommendation_job_name:(ai_recommendation_job_name_ : ai_entity_name) () =
  ({ ai_recommendation_job_name = ai_recommendation_job_name_ }
    : stop_ai_recommendation_job_request)

let make_stop_ai_benchmark_job_response
    ~ai_benchmark_job_arn:(ai_benchmark_job_arn_ : ai_benchmark_job_arn) () =
  ({ ai_benchmark_job_arn = ai_benchmark_job_arn_ } : stop_ai_benchmark_job_response)

let make_stop_ai_benchmark_job_request
    ~ai_benchmark_job_name:(ai_benchmark_job_name_ : ai_entity_name) () =
  ({ ai_benchmark_job_name = ai_benchmark_job_name_ } : stop_ai_benchmark_job_request)

let make_start_session_response ?token_value:(token_value_ : token_value option)
    ?stream_url:(stream_url_ : stream_url option) ?session_id:(session_id_ : session_id option) () =
  ({ token_value = token_value_; stream_url = stream_url_; session_id = session_id_ }
    : start_session_response)

let make_start_session_request ~resource_identifier:(resource_identifier_ : resource_identifier) ()
    =
  ({ resource_identifier = resource_identifier_ } : start_session_request)

let make_start_pipeline_execution_response
    ?pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn option) () =
  ({ pipeline_execution_arn = pipeline_execution_arn_ } : start_pipeline_execution_response)

let make_parameter ~value:(value_ : string1024) ~name:(name_ : pipeline_parameter_name) () =
  ({ value = value_; name = name_ } : parameter)

let make_selected_step ~step_name:(step_name_ : string256) () =
  ({ step_name = step_name_ } : selected_step)

let make_selective_execution_config
    ?source_pipeline_execution_arn:(source_pipeline_execution_arn_ : pipeline_execution_arn option)
    ~selected_steps:(selected_steps_ : selected_step_list) () =
  ({
     selected_steps = selected_steps_;
     source_pipeline_execution_arn = source_pipeline_execution_arn_;
   }
    : selective_execution_config)

let make_start_pipeline_execution_request
    ?mlflow_experiment_name:(mlflow_experiment_name_ : mlflow_experiment_entity_name option)
    ?pipeline_version_id:(pipeline_version_id_ : pipeline_version_id option)
    ?selective_execution_config:(selective_execution_config_ : selective_execution_config option)
    ?parallelism_configuration:(parallelism_configuration_ : parallelism_configuration option)
    ?pipeline_execution_description:
      (pipeline_execution_description_ : pipeline_execution_description option)
    ?pipeline_parameters:(pipeline_parameters_ : parameter_list option)
    ?pipeline_execution_display_name:
      (pipeline_execution_display_name_ : pipeline_execution_name option)
    ~client_request_token:(client_request_token_ : idempotency_token)
    ~pipeline_name:(pipeline_name_ : pipeline_name_or_arn) () =
  ({
     mlflow_experiment_name = mlflow_experiment_name_;
     pipeline_version_id = pipeline_version_id_;
     selective_execution_config = selective_execution_config_;
     parallelism_configuration = parallelism_configuration_;
     client_request_token = client_request_token_;
     pipeline_execution_description = pipeline_execution_description_;
     pipeline_parameters = pipeline_parameters_;
     pipeline_execution_display_name = pipeline_execution_display_name_;
     pipeline_name = pipeline_name_;
   }
    : start_pipeline_execution_request)

let make_start_notebook_instance_input
    ~notebook_instance_name:(notebook_instance_name_ : notebook_instance_name) () =
  ({ notebook_instance_name = notebook_instance_name_ } : start_notebook_instance_input)

let make_start_monitoring_schedule_request
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name) () =
  ({ monitoring_schedule_name = monitoring_schedule_name_ } : start_monitoring_schedule_request)

let make_start_mlflow_tracking_server_response
    ?tracking_server_arn:(tracking_server_arn_ : tracking_server_arn option) () =
  ({ tracking_server_arn = tracking_server_arn_ } : start_mlflow_tracking_server_response)

let make_start_mlflow_tracking_server_request
    ~tracking_server_name:(tracking_server_name_ : tracking_server_name) () =
  ({ tracking_server_name = tracking_server_name_ } : start_mlflow_tracking_server_request)

let make_start_inference_experiment_response
    ~inference_experiment_arn:(inference_experiment_arn_ : inference_experiment_arn) () =
  ({ inference_experiment_arn = inference_experiment_arn_ } : start_inference_experiment_response)

let make_start_inference_experiment_request ~name:(name_ : inference_experiment_name) () =
  ({ name = name_ } : start_inference_experiment_request)

let make_start_edge_deployment_stage_request ~stage_name:(stage_name_ : entity_name)
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name) () =
  ({ stage_name = stage_name_; edge_deployment_plan_name = edge_deployment_plan_name_ }
    : start_edge_deployment_stage_request)

let make_start_cluster_health_check_response ~cluster_arn:(cluster_arn_ : cluster_arn) () =
  ({ cluster_arn = cluster_arn_ } : start_cluster_health_check_response)

let make_instance_group_health_check_configuration
    ?instance_ids:(instance_ids_ : instance_ids option)
    ~deep_health_checks:(deep_health_checks_ : deep_health_checks)
    ~instance_group_name:(instance_group_name_ : cluster_instance_group_name) () =
  ({
     deep_health_checks = deep_health_checks_;
     instance_ids = instance_ids_;
     instance_group_name = instance_group_name_;
   }
    : instance_group_health_check_configuration)

let make_start_cluster_health_check_request
    ~deep_health_check_configurations:
      (deep_health_check_configurations_ : deep_health_check_configurations)
    ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({
     deep_health_check_configurations = deep_health_check_configurations_;
     cluster_name = cluster_name_;
   }
    : start_cluster_health_check_request)

let make_space_sharing_settings_summary ?sharing_type:(sharing_type_ : sharing_type option) () =
  ({ sharing_type = sharing_type_ } : space_sharing_settings_summary)

let make_space_sharing_settings ~sharing_type:(sharing_type_ : sharing_type) () =
  ({ sharing_type = sharing_type_ } : space_sharing_settings)

let make_space_settings_summary
    ?space_storage_settings:(space_storage_settings_ : space_storage_settings option)
    ?remote_access:(remote_access_ : feature_status option) ?app_type:(app_type_ : app_type option)
    () =
  ({
     space_storage_settings = space_storage_settings_;
     remote_access = remote_access_;
     app_type = app_type_;
   }
    : space_settings_summary)

let make_ownership_settings_summary
    ?owner_user_profile_name:(owner_user_profile_name_ : user_profile_name option) () =
  ({ owner_user_profile_name = owner_user_profile_name_ } : ownership_settings_summary)

let make_space_details ?space_display_name:(space_display_name_ : non_empty_string64 option)
    ?ownership_settings_summary:(ownership_settings_summary_ : ownership_settings_summary option)
    ?space_sharing_settings_summary:
      (space_sharing_settings_summary_ : space_sharing_settings_summary option)
    ?space_settings_summary:(space_settings_summary_ : space_settings_summary option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?creation_time:(creation_time_ : creation_time option) ?status:(status_ : space_status option)
    ?space_name:(space_name_ : space_name option) ?domain_id:(domain_id_ : domain_id option) () =
  ({
     space_display_name = space_display_name_;
     ownership_settings_summary = ownership_settings_summary_;
     space_sharing_settings_summary = space_sharing_settings_summary_;
     space_settings_summary = space_settings_summary_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     status = status_;
     space_name = space_name_;
     domain_id = domain_id_;
   }
    : space_details)

let make_source_algorithm ?model_data_e_tag:(model_data_e_tag_ : string_ option)
    ?model_data_source:(model_data_source_ : model_data_source option)
    ?model_data_url:(model_data_url_ : url option) ~algorithm_name:(algorithm_name_ : arn_or_name)
    () =
  ({
     algorithm_name = algorithm_name_;
     model_data_e_tag = model_data_e_tag_;
     model_data_source = model_data_source_;
     model_data_url = model_data_url_;
   }
    : source_algorithm)

let make_source_algorithm_specification
    ~source_algorithms:(source_algorithms_ : source_algorithm_list) () =
  ({ source_algorithms = source_algorithms_ } : source_algorithm_specification)

let make_session_chaining_config
    ?enable_session_tag_chaining:(enable_session_tag_chaining_ : enable_session_tag_chaining option)
    () =
  ({ enable_session_tag_chaining = enable_session_tag_chaining_ } : session_chaining_config)

let make_service_catalog_provisioning_details
    ?provisioning_parameters:(provisioning_parameters_ : provisioning_parameters option)
    ?path_id:(path_id_ : service_catalog_entity_id option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : service_catalog_entity_id option)
    ~product_id:(product_id_ : service_catalog_entity_id) () =
  ({
     provisioning_parameters = provisioning_parameters_;
     path_id = path_id_;
     provisioning_artifact_id = provisioning_artifact_id_;
     product_id = product_id_;
   }
    : service_catalog_provisioning_details)

let make_service_catalog_provisioned_product_details
    ?provisioned_product_status_message:
      (provisioned_product_status_message_ : provisioned_product_status_message option)
    ?provisioned_product_id:(provisioned_product_id_ : service_catalog_entity_id option) () =
  ({
     provisioned_product_status_message = provisioned_product_status_message_;
     provisioned_product_id = provisioned_product_id_;
   }
    : service_catalog_provisioned_product_details)

let make_serverless_job_config ?evaluator_arn:(evaluator_arn_ : evaluator_arn option)
    ?evaluation_type:(evaluation_type_ : evaluation_type option) ?peft:(peft_ : peft option)
    ?customization_technique:(customization_technique_ : customization_technique option)
    ?accept_eula:(accept_eula_ : accept_eula option) ~job_type:(job_type_ : serverless_job_type)
    ~base_model_arn:(base_model_arn_ : serverless_job_base_model_arn) () =
  ({
     evaluator_arn = evaluator_arn_;
     evaluation_type = evaluation_type_;
     peft = peft_;
     customization_technique = customization_technique_;
     job_type = job_type_;
     accept_eula = accept_eula_;
     base_model_arn = base_model_arn_;
   }
    : serverless_job_config)

let make_send_pipeline_execution_step_success_response
    ?pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn option) () =
  ({ pipeline_execution_arn = pipeline_execution_arn_ }
    : send_pipeline_execution_step_success_response)

let make_output_parameter ~value:(value_ : string1024) ~name:(name_ : string256) () =
  ({ value = value_; name = name_ } : output_parameter)

let make_send_pipeline_execution_step_success_request
    ?client_request_token:(client_request_token_ : idempotency_token option)
    ?output_parameters:(output_parameters_ : output_parameter_list option)
    ~callback_token:(callback_token_ : callback_token) () =
  ({
     client_request_token = client_request_token_;
     output_parameters = output_parameters_;
     callback_token = callback_token_;
   }
    : send_pipeline_execution_step_success_request)

let make_send_pipeline_execution_step_failure_response
    ?pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn option) () =
  ({ pipeline_execution_arn = pipeline_execution_arn_ }
    : send_pipeline_execution_step_failure_response)

let make_send_pipeline_execution_step_failure_request
    ?client_request_token:(client_request_token_ : idempotency_token option)
    ?failure_reason:(failure_reason_ : string256 option)
    ~callback_token:(callback_token_ : callback_token) () =
  ({
     client_request_token = client_request_token_;
     failure_reason = failure_reason_;
     callback_token = callback_token_;
   }
    : send_pipeline_execution_step_failure_request)

let make_search_training_plan_offerings_response
    ?training_plan_extension_offerings:
      (training_plan_extension_offerings_ : training_plan_extension_offerings option)
    ~training_plan_offerings:(training_plan_offerings_ : training_plan_offerings) () =
  ({
     training_plan_extension_offerings = training_plan_extension_offerings_;
     training_plan_offerings = training_plan_offerings_;
   }
    : search_training_plan_offerings_response)

let make_search_training_plan_offerings_request
    ?training_plan_arn:(training_plan_arn_ : string_ option)
    ?target_resources:(target_resources_ : sage_maker_resource_names option)
    ?duration_hours:(duration_hours_ : training_plan_duration_hours_input option)
    ?end_time_before:(end_time_before_ : timestamp option)
    ?start_time_after:(start_time_after_ : timestamp option)
    ?ultra_server_count:(ultra_server_count_ : ultra_server_count option)
    ?ultra_server_type:(ultra_server_type_ : ultra_server_type option)
    ?instance_count:(instance_count_ : reserved_capacity_instance_count option)
    ?instance_type:(instance_type_ : reserved_capacity_instance_type option) () =
  ({
     training_plan_arn = training_plan_arn_;
     target_resources = target_resources_;
     duration_hours = duration_hours_;
     end_time_before = end_time_before_;
     start_time_after = start_time_after_;
     ultra_server_count = ultra_server_count_;
     ultra_server_type = ultra_server_type_;
     instance_count = instance_count_;
     instance_type = instance_type_;
   }
    : search_training_plan_offerings_request)

let make_experiment_source ?source_type:(source_type_ : source_type option)
    ~source_arn:(source_arn_ : experiment_source_arn) () =
  ({ source_type = source_type_; source_arn = source_arn_ } : experiment_source)

let make_experiment ?tags:(tags_ : tag_list option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?creation_time:(creation_time_ : timestamp option)
    ?description:(description_ : experiment_description option)
    ?source:(source_ : experiment_source option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?experiment_arn:(experiment_arn_ : experiment_arn option)
    ?experiment_name:(experiment_name_ : experiment_entity_name option) () =
  ({
     tags = tags_;
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     created_by = created_by_;
     creation_time = creation_time_;
     description = description_;
     source = source_;
     display_name = display_name_;
     experiment_arn = experiment_arn_;
     experiment_name = experiment_name_;
   }
    : experiment)

let make_deployed_image ?resolution_time:(resolution_time_ : timestamp option)
    ?resolved_image:(resolved_image_ : container_image option)
    ?specified_image:(specified_image_ : container_image option) () =
  ({
     resolution_time = resolution_time_;
     resolved_image = resolved_image_;
     specified_image = specified_image_;
   }
    : deployed_image)

let make_instance_pool_summary ~current_instance_count:(current_instance_count_ : task_count)
    ~instance_type:(instance_type_ : production_variant_instance_type) () =
  ({ current_instance_count = current_instance_count_; instance_type = instance_type_ }
    : instance_pool_summary)

let make_production_variant_status ?start_time:(start_time_ : timestamp option)
    ?status_message:(status_message_ : variant_status_message option)
    ~status:(status_ : variant_status) () =
  ({ start_time = start_time_; status_message = status_message_; status = status_ }
    : production_variant_status)

let make_production_variant_serverless_config
    ?provisioned_concurrency:(provisioned_concurrency_ : serverless_provisioned_concurrency option)
    ~max_concurrency:(max_concurrency_ : serverless_max_concurrency)
    ~memory_size_in_m_b:(memory_size_in_m_b_ : serverless_memory_size_in_m_b) () =
  ({
     provisioned_concurrency = provisioned_concurrency_;
     max_concurrency = max_concurrency_;
     memory_size_in_m_b = memory_size_in_m_b_;
   }
    : production_variant_serverless_config)

let make_production_variant_managed_instance_scaling_scale_in_policy
    ?cooldown_in_minutes:
      (cooldown_in_minutes_ : managed_instance_scaling_cooldown_in_minutes option)
    ?maximum_step_size:(maximum_step_size_ : managed_instance_scaling_maximum_step_size option)
    ~strategy:(strategy_ : managed_instance_scaling_scale_in_strategy) () =
  ({
     cooldown_in_minutes = cooldown_in_minutes_;
     maximum_step_size = maximum_step_size_;
     strategy = strategy_;
   }
    : production_variant_managed_instance_scaling_scale_in_policy)

let make_production_variant_managed_instance_scaling
    ?scale_in_policy:
      (scale_in_policy_ : production_variant_managed_instance_scaling_scale_in_policy option)
    ?max_instance_count:(max_instance_count_ : managed_instance_scaling_max_instance_count option)
    ?min_instance_count:(min_instance_count_ : managed_instance_scaling_min_instance_count option)
    ?status:(status_ : managed_instance_scaling_status option) () =
  ({
     scale_in_policy = scale_in_policy_;
     max_instance_count = max_instance_count_;
     min_instance_count = min_instance_count_;
     status = status_;
   }
    : production_variant_managed_instance_scaling)

let make_production_variant_routing_config ~routing_strategy:(routing_strategy_ : routing_strategy)
    () =
  ({ routing_strategy = routing_strategy_ } : production_variant_routing_config)

let make_ec2_capacity_reservation
    ?used_by_current_endpoint:(used_by_current_endpoint_ : task_count option)
    ?available_instance_count:(available_instance_count_ : task_count option)
    ?total_instance_count:(total_instance_count_ : task_count option)
    ?ec2_capacity_reservation_id:(ec2_capacity_reservation_id_ : ec2_capacity_reservation_id option)
    () =
  ({
     used_by_current_endpoint = used_by_current_endpoint_;
     available_instance_count = available_instance_count_;
     total_instance_count = total_instance_count_;
     ec2_capacity_reservation_id = ec2_capacity_reservation_id_;
   }
    : ec2_capacity_reservation)

let make_production_variant_capacity_reservation_summary
    ?ec2_capacity_reservations:(ec2_capacity_reservations_ : ec2_capacity_reservations_list option)
    ?used_by_current_endpoint:(used_by_current_endpoint_ : task_count option)
    ?available_instance_count:(available_instance_count_ : task_count option)
    ?total_instance_count:(total_instance_count_ : task_count option)
    ?capacity_reservation_preference:
      (capacity_reservation_preference_ : capacity_reservation_preference option)
    ?ml_reservation_arn:(ml_reservation_arn_ : ml_reservation_arn option) () =
  ({
     ec2_capacity_reservations = ec2_capacity_reservations_;
     used_by_current_endpoint = used_by_current_endpoint_;
     available_instance_count = available_instance_count_;
     total_instance_count = total_instance_count_;
     capacity_reservation_preference = capacity_reservation_preference_;
     ml_reservation_arn = ml_reservation_arn_;
   }
    : production_variant_capacity_reservation_summary)

let make_production_variant_summary
    ?capacity_reservation_config:
      (capacity_reservation_config_ : production_variant_capacity_reservation_summary option)
    ?routing_config:(routing_config_ : production_variant_routing_config option)
    ?managed_instance_scaling:
      (managed_instance_scaling_ : production_variant_managed_instance_scaling option)
    ?desired_serverless_config:
      (desired_serverless_config_ : production_variant_serverless_config option)
    ?current_serverless_config:
      (current_serverless_config_ : production_variant_serverless_config option)
    ?variant_status:(variant_status_ : production_variant_status_list option)
    ?instance_pools:(instance_pools_ : instance_pool_summary_list option)
    ?desired_instance_count:(desired_instance_count_ : task_count option)
    ?current_instance_count:(current_instance_count_ : task_count option)
    ?desired_weight:(desired_weight_ : variant_weight option)
    ?current_weight:(current_weight_ : variant_weight option)
    ?deployed_images:(deployed_images_ : deployed_images option)
    ~variant_name:(variant_name_ : variant_name) () =
  ({
     capacity_reservation_config = capacity_reservation_config_;
     routing_config = routing_config_;
     managed_instance_scaling = managed_instance_scaling_;
     desired_serverless_config = desired_serverless_config_;
     current_serverless_config = current_serverless_config_;
     variant_status = variant_status_;
     instance_pools = instance_pools_;
     desired_instance_count = desired_instance_count_;
     current_instance_count = current_instance_count_;
     desired_weight = desired_weight_;
     current_weight = current_weight_;
     deployed_images = deployed_images_;
     variant_name = variant_name_;
   }
    : production_variant_summary)

let make_data_capture_config_summary ~kms_key_id:(kms_key_id_ : kms_key_id)
    ~destination_s3_uri:(destination_s3_uri_ : destination_s3_uri)
    ~current_sampling_percentage:(current_sampling_percentage_ : sampling_percentage)
    ~capture_status:(capture_status_ : capture_status)
    ~enable_capture:(enable_capture_ : enable_capture) () =
  ({
     kms_key_id = kms_key_id_;
     destination_s3_uri = destination_s3_uri_;
     current_sampling_percentage = current_sampling_percentage_;
     capture_status = capture_status_;
     enable_capture = enable_capture_;
   }
    : data_capture_config_summary)

let make_monitoring_execution_summary ?monitoring_type:(monitoring_type_ : monitoring_type option)
    ?monitoring_job_definition_name:
      (monitoring_job_definition_name_ : monitoring_job_definition_name option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ?processing_job_arn:(processing_job_arn_ : processing_job_arn option)
    ~monitoring_execution_status:(monitoring_execution_status_ : execution_status)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp) ~scheduled_time:(scheduled_time_ : timestamp)
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name) () =
  ({
     monitoring_type = monitoring_type_;
     monitoring_job_definition_name = monitoring_job_definition_name_;
     failure_reason = failure_reason_;
     endpoint_name = endpoint_name_;
     processing_job_arn = processing_job_arn_;
     monitoring_execution_status = monitoring_execution_status_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     scheduled_time = scheduled_time_;
     monitoring_schedule_name = monitoring_schedule_name_;
   }
    : monitoring_execution_summary)

let make_monitoring_schedule ?tags:(tags_ : tag_list option)
    ?last_monitoring_execution_summary:
      (last_monitoring_execution_summary_ : monitoring_execution_summary option)
    ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ?monitoring_schedule_config:(monitoring_schedule_config_ : monitoring_schedule_config option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?monitoring_type:(monitoring_type_ : monitoring_type option)
    ?monitoring_schedule_status:(monitoring_schedule_status_ : schedule_status option)
    ?monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name option)
    ?monitoring_schedule_arn:(monitoring_schedule_arn_ : monitoring_schedule_arn option) () =
  ({
     tags = tags_;
     last_monitoring_execution_summary = last_monitoring_execution_summary_;
     endpoint_name = endpoint_name_;
     monitoring_schedule_config = monitoring_schedule_config_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     failure_reason = failure_reason_;
     monitoring_type = monitoring_type_;
     monitoring_schedule_status = monitoring_schedule_status_;
     monitoring_schedule_name = monitoring_schedule_name_;
     monitoring_schedule_arn = monitoring_schedule_arn_;
   }
    : monitoring_schedule)

let make_endpoint
    ?shadow_production_variants:
      (shadow_production_variants_ : production_variant_summary_list option)
    ?tags:(tags_ : tag_list option)
    ?monitoring_schedules:(monitoring_schedules_ : monitoring_schedule_list option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?data_capture_config:(data_capture_config_ : data_capture_config_summary option)
    ?production_variants:(production_variants_ : production_variant_summary_list option)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp)
    ~endpoint_status:(endpoint_status_ : endpoint_status)
    ~endpoint_config_name:(endpoint_config_name_ : endpoint_config_name)
    ~endpoint_arn:(endpoint_arn_ : endpoint_arn) ~endpoint_name:(endpoint_name_ : endpoint_name) ()
    =
  ({
     shadow_production_variants = shadow_production_variants_;
     tags = tags_;
     monitoring_schedules = monitoring_schedules_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     failure_reason = failure_reason_;
     endpoint_status = endpoint_status_;
     data_capture_config = data_capture_config_;
     production_variants = production_variants_;
     endpoint_config_name = endpoint_config_name_;
     endpoint_arn = endpoint_arn_;
     endpoint_name = endpoint_name_;
   }
    : endpoint)

let make_model_package_validation_profile
    ~transform_job_definition:(transform_job_definition_ : transform_job_definition)
    ~profile_name:(profile_name_ : entity_name) () =
  ({ transform_job_definition = transform_job_definition_; profile_name = profile_name_ }
    : model_package_validation_profile)

let make_model_package_validation_specification
    ~validation_profiles:(validation_profiles_ : model_package_validation_profiles)
    ~validation_role:(validation_role_ : role_arn) () =
  ({ validation_profiles = validation_profiles_; validation_role = validation_role_ }
    : model_package_validation_specification)

let make_model_package_status_item ?failure_reason:(failure_reason_ : string_ option)
    ~status:(status_ : detailed_model_package_status) ~name:(name_ : entity_name) () =
  ({ failure_reason = failure_reason_; status = status_; name = name_ } : model_package_status_item)

let make_model_package_status_details
    ?image_scan_statuses:(image_scan_statuses_ : model_package_status_item_list option)
    ~validation_statuses:(validation_statuses_ : model_package_status_item_list) () =
  ({ image_scan_statuses = image_scan_statuses_; validation_statuses = validation_statuses_ }
    : model_package_status_details)

let make_metrics_source ?content_digest:(content_digest_ : content_digest option)
    ~s3_uri:(s3_uri_ : s3_uri) ~content_type:(content_type_ : content_type) () =
  ({ s3_uri = s3_uri_; content_digest = content_digest_; content_type = content_type_ }
    : metrics_source)

let make_model_quality ?constraints:(constraints_ : metrics_source option)
    ?statistics:(statistics_ : metrics_source option) () =
  ({ constraints = constraints_; statistics = statistics_ } : model_quality)

let make_model_data_quality ?constraints:(constraints_ : metrics_source option)
    ?statistics:(statistics_ : metrics_source option) () =
  ({ constraints = constraints_; statistics = statistics_ } : model_data_quality)

let make_bias ?post_training_report:(post_training_report_ : metrics_source option)
    ?pre_training_report:(pre_training_report_ : metrics_source option)
    ?report:(report_ : metrics_source option) () =
  ({
     post_training_report = post_training_report_;
     pre_training_report = pre_training_report_;
     report = report_;
   }
    : bias)

let make_explainability ?report:(report_ : metrics_source option) () =
  ({ report = report_ } : explainability)

let make_model_metrics ?explainability:(explainability_ : explainability option)
    ?bias:(bias_ : bias option)
    ?model_data_quality:(model_data_quality_ : model_data_quality option)
    ?model_quality:(model_quality_ : model_quality option) () =
  ({
     explainability = explainability_;
     bias = bias_;
     model_data_quality = model_data_quality_;
     model_quality = model_quality_;
   }
    : model_metrics)

let make_model_package_security_config ~kms_key_id:(kms_key_id_ : kms_key_id) () =
  ({ kms_key_id = kms_key_id_ } : model_package_security_config)

let make_file_source ?content_digest:(content_digest_ : content_digest option)
    ?content_type:(content_type_ : content_type option) ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ s3_uri = s3_uri_; content_digest = content_digest_; content_type = content_type_ }
    : file_source)

let make_drift_check_bias
    ?post_training_constraints:(post_training_constraints_ : metrics_source option)
    ?pre_training_constraints:(pre_training_constraints_ : metrics_source option)
    ?config_file:(config_file_ : file_source option) () =
  ({
     post_training_constraints = post_training_constraints_;
     pre_training_constraints = pre_training_constraints_;
     config_file = config_file_;
   }
    : drift_check_bias)

let make_drift_check_explainability ?config_file:(config_file_ : file_source option)
    ?constraints:(constraints_ : metrics_source option) () =
  ({ config_file = config_file_; constraints = constraints_ } : drift_check_explainability)

let make_drift_check_model_quality ?constraints:(constraints_ : metrics_source option)
    ?statistics:(statistics_ : metrics_source option) () =
  ({ constraints = constraints_; statistics = statistics_ } : drift_check_model_quality)

let make_drift_check_model_data_quality ?constraints:(constraints_ : metrics_source option)
    ?statistics:(statistics_ : metrics_source option) () =
  ({ constraints = constraints_; statistics = statistics_ } : drift_check_model_data_quality)

let make_drift_check_baselines
    ?model_data_quality:(model_data_quality_ : drift_check_model_data_quality option)
    ?model_quality:(model_quality_ : drift_check_model_quality option)
    ?explainability:(explainability_ : drift_check_explainability option)
    ?bias:(bias_ : drift_check_bias option) () =
  ({
     model_data_quality = model_data_quality_;
     model_quality = model_quality_;
     explainability = explainability_;
     bias = bias_;
   }
    : drift_check_baselines)

let make_model_package
    ?skip_model_validation:(skip_model_validation_ : skip_model_validation option)
    ?drift_check_baselines:(drift_check_baselines_ : drift_check_baselines option)
    ?customer_metadata_properties:(customer_metadata_properties_ : customer_metadata_map option)
    ?tags:(tags_ : tag_list option) ?model_life_cycle:(model_life_cycle_ : model_life_cycle option)
    ?model_card:(model_card_ : model_package_model_card option)
    ?security_config:(security_config_ : model_package_security_config option)
    ?source_uri:(source_uri_ : model_package_source_uri option)
    ?additional_inference_specifications:
      (additional_inference_specifications_ : additional_inference_specifications option)
    ?sample_payload_url:(sample_payload_url_ : string_ option) ?task:(task_ : string_ option)
    ?domain:(domain_ : string_ option)
    ?approval_description:(approval_description_ : approval_description option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?model_metrics:(model_metrics_ : model_metrics option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?created_by:(created_by_ : user_context option)
    ?model_approval_status:(model_approval_status_ : model_approval_status option)
    ?certify_for_marketplace:(certify_for_marketplace_ : certify_for_marketplace option)
    ?model_package_status_details:
      (model_package_status_details_ : model_package_status_details option)
    ?model_package_status:(model_package_status_ : model_package_status option)
    ?validation_specification:
      (validation_specification_ : model_package_validation_specification option)
    ?source_algorithm_specification:
      (source_algorithm_specification_ : source_algorithm_specification option)
    ?inference_specification:(inference_specification_ : inference_specification option)
    ?creation_time:(creation_time_ : creation_time option)
    ?model_package_description:(model_package_description_ : entity_description option)
    ?model_package_arn:(model_package_arn_ : model_package_arn option)
    ?model_package_registration_type:
      (model_package_registration_type_ : model_package_registration_type option)
    ?model_package_version:(model_package_version_ : model_package_version option)
    ?model_package_group_name:(model_package_group_name_ : entity_name option)
    ?model_package_name:(model_package_name_ : entity_name option) () =
  ({
     skip_model_validation = skip_model_validation_;
     drift_check_baselines = drift_check_baselines_;
     customer_metadata_properties = customer_metadata_properties_;
     tags = tags_;
     model_life_cycle = model_life_cycle_;
     model_card = model_card_;
     security_config = security_config_;
     source_uri = source_uri_;
     additional_inference_specifications = additional_inference_specifications_;
     sample_payload_url = sample_payload_url_;
     task = task_;
     domain = domain_;
     approval_description = approval_description_;
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     model_metrics = model_metrics_;
     metadata_properties = metadata_properties_;
     created_by = created_by_;
     model_approval_status = model_approval_status_;
     certify_for_marketplace = certify_for_marketplace_;
     model_package_status_details = model_package_status_details_;
     model_package_status = model_package_status_;
     validation_specification = validation_specification_;
     source_algorithm_specification = source_algorithm_specification_;
     inference_specification = inference_specification_;
     creation_time = creation_time_;
     model_package_description = model_package_description_;
     model_package_arn = model_package_arn_;
     model_package_registration_type = model_package_registration_type_;
     model_package_version = model_package_version_;
     model_package_group_name = model_package_group_name_;
     model_package_name = model_package_name_;
   }
    : model_package)

let make_model_package_group ?tags:(tags_ : tag_list option)
    ?model_package_group_status:(model_package_group_status_ : model_package_group_status option)
    ?created_by:(created_by_ : user_context option)
    ?creation_time:(creation_time_ : creation_time option)
    ?model_package_group_description:(model_package_group_description_ : entity_description option)
    ?model_package_group_arn:(model_package_group_arn_ : model_package_group_arn option)
    ?model_package_group_name:(model_package_group_name_ : entity_name option) () =
  ({
     tags = tags_;
     model_package_group_status = model_package_group_status_;
     created_by = created_by_;
     creation_time = creation_time_;
     model_package_group_description = model_package_group_description_;
     model_package_group_arn = model_package_group_arn_;
     model_package_group_name = model_package_group_name_;
   }
    : model_package_group)

let make_pipeline ?tags:(tags_ : tag_list option)
    ?parallelism_configuration:(parallelism_configuration_ : parallelism_configuration option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?created_by:(created_by_ : user_context option)
    ?last_run_time:(last_run_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?pipeline_status:(pipeline_status_ : pipeline_status option)
    ?role_arn:(role_arn_ : role_arn option)
    ?pipeline_description:(pipeline_description_ : pipeline_description option)
    ?pipeline_display_name:(pipeline_display_name_ : pipeline_name option)
    ?pipeline_name:(pipeline_name_ : pipeline_name option)
    ?pipeline_arn:(pipeline_arn_ : pipeline_arn option) () =
  ({
     tags = tags_;
     parallelism_configuration = parallelism_configuration_;
     last_modified_by = last_modified_by_;
     created_by = created_by_;
     last_run_time = last_run_time_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     pipeline_status = pipeline_status_;
     role_arn = role_arn_;
     pipeline_description = pipeline_description_;
     pipeline_display_name = pipeline_display_name_;
     pipeline_name = pipeline_name_;
     pipeline_arn = pipeline_arn_;
   }
    : pipeline)

let make_pipeline_experiment_config ?trial_name:(trial_name_ : experiment_entity_name option)
    ?experiment_name:(experiment_name_ : experiment_entity_name option) () =
  ({ trial_name = trial_name_; experiment_name = experiment_name_ } : pipeline_experiment_config)

let make_pipeline_execution
    ?pipeline_version_display_name:(pipeline_version_display_name_ : pipeline_version_name option)
    ?pipeline_version_id:(pipeline_version_id_ : pipeline_version_id option)
    ?pipeline_parameters:(pipeline_parameters_ : parameter_list option)
    ?selective_execution_config:(selective_execution_config_ : selective_execution_config option)
    ?parallelism_configuration:(parallelism_configuration_ : parallelism_configuration option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?failure_reason:(failure_reason_ : pipeline_execution_failure_reason option)
    ?pipeline_experiment_config:(pipeline_experiment_config_ : pipeline_experiment_config option)
    ?pipeline_execution_description:
      (pipeline_execution_description_ : pipeline_execution_description option)
    ?pipeline_execution_status:(pipeline_execution_status_ : pipeline_execution_status option)
    ?pipeline_execution_display_name:
      (pipeline_execution_display_name_ : pipeline_execution_name option)
    ?pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn option)
    ?pipeline_arn:(pipeline_arn_ : pipeline_arn option) () =
  ({
     pipeline_version_display_name = pipeline_version_display_name_;
     pipeline_version_id = pipeline_version_id_;
     pipeline_parameters = pipeline_parameters_;
     selective_execution_config = selective_execution_config_;
     parallelism_configuration = parallelism_configuration_;
     last_modified_by = last_modified_by_;
     created_by = created_by_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     failure_reason = failure_reason_;
     pipeline_experiment_config = pipeline_experiment_config_;
     pipeline_execution_description = pipeline_execution_description_;
     pipeline_execution_status = pipeline_execution_status_;
     pipeline_execution_display_name = pipeline_execution_display_name_;
     pipeline_execution_arn = pipeline_execution_arn_;
     pipeline_arn = pipeline_arn_;
   }
    : pipeline_execution)

let make_pipeline_version
    ?last_executed_pipeline_execution_status:
      (last_executed_pipeline_execution_status_ : pipeline_execution_status option)
    ?last_executed_pipeline_execution_display_name:
      (last_executed_pipeline_execution_display_name_ : pipeline_execution_name option)
    ?last_executed_pipeline_execution_arn:
      (last_executed_pipeline_execution_arn_ : pipeline_execution_arn option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?pipeline_version_description:
      (pipeline_version_description_ : pipeline_version_description option)
    ?pipeline_version_display_name:(pipeline_version_display_name_ : pipeline_version_name option)
    ?pipeline_version_id:(pipeline_version_id_ : pipeline_version_id option)
    ?pipeline_arn:(pipeline_arn_ : pipeline_arn option) () =
  ({
     last_executed_pipeline_execution_status = last_executed_pipeline_execution_status_;
     last_executed_pipeline_execution_display_name = last_executed_pipeline_execution_display_name_;
     last_executed_pipeline_execution_arn = last_executed_pipeline_execution_arn_;
     last_modified_by = last_modified_by_;
     created_by = created_by_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     pipeline_version_description = pipeline_version_description_;
     pipeline_version_display_name = pipeline_version_display_name_;
     pipeline_version_id = pipeline_version_id_;
     pipeline_arn = pipeline_arn_;
   }
    : pipeline_version)

let make_online_store_security_config ?kms_key_id:(kms_key_id_ : kms_key_id option) () =
  ({ kms_key_id = kms_key_id_ } : online_store_security_config)

let make_online_store_config ?storage_type:(storage_type_ : storage_type option)
    ?ttl_duration:(ttl_duration_ : ttl_duration option)
    ?enable_online_store:(enable_online_store_ : boolean_ option)
    ?security_config:(security_config_ : online_store_security_config option) () =
  ({
     storage_type = storage_type_;
     ttl_duration = ttl_duration_;
     enable_online_store = enable_online_store_;
     security_config = security_config_;
   }
    : online_store_config)

let make_s3_storage_config ?resolved_output_s3_uri:(resolved_output_s3_uri_ : s3_uri option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ resolved_output_s3_uri = resolved_output_s3_uri_; kms_key_id = kms_key_id_; s3_uri = s3_uri_ }
    : s3_storage_config)

let make_data_catalog_config ~database:(database_ : database) ~catalog:(catalog_ : catalog)
    ~table_name:(table_name_ : table_name) () =
  ({ database = database_; catalog = catalog_; table_name = table_name_ } : data_catalog_config)

let make_offline_store_config ?table_format:(table_format_ : table_format option)
    ?data_catalog_config:(data_catalog_config_ : data_catalog_config option)
    ?disable_glue_table_creation:(disable_glue_table_creation_ : boolean_ option)
    ~s3_storage_config:(s3_storage_config_ : s3_storage_config) () =
  ({
     table_format = table_format_;
     data_catalog_config = data_catalog_config_;
     disable_glue_table_creation = disable_glue_table_creation_;
     s3_storage_config = s3_storage_config_;
   }
    : offline_store_config)

let make_offline_store_status ?blocked_reason:(blocked_reason_ : blocked_reason option)
    ~status:(status_ : offline_store_status_value) () =
  ({ blocked_reason = blocked_reason_; status = status_ } : offline_store_status)

let make_last_update_status ?failure_reason:(failure_reason_ : failure_reason option)
    ~status:(status_ : last_update_status_value) () =
  ({ failure_reason = failure_reason_; status = status_ } : last_update_status)

let make_feature_group ?tags:(tags_ : tag_list option)
    ?description:(description_ : description option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_update_status:(last_update_status_ : last_update_status option)
    ?offline_store_status:(offline_store_status_ : offline_store_status option)
    ?feature_group_status:(feature_group_status_ : feature_group_status option)
    ?role_arn:(role_arn_ : role_arn option)
    ?offline_store_config:(offline_store_config_ : offline_store_config option)
    ?online_store_config:(online_store_config_ : online_store_config option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?creation_time:(creation_time_ : creation_time option)
    ?feature_definitions:(feature_definitions_ : feature_definitions option)
    ?event_time_feature_name:(event_time_feature_name_ : feature_name option)
    ?record_identifier_feature_name:(record_identifier_feature_name_ : feature_name option)
    ?feature_group_name:(feature_group_name_ : feature_group_name option)
    ?feature_group_arn:(feature_group_arn_ : feature_group_arn option) () =
  ({
     tags = tags_;
     description = description_;
     failure_reason = failure_reason_;
     last_update_status = last_update_status_;
     offline_store_status = offline_store_status_;
     feature_group_status = feature_group_status_;
     role_arn = role_arn_;
     offline_store_config = offline_store_config_;
     online_store_config = online_store_config_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     feature_definitions = feature_definitions_;
     event_time_feature_name = event_time_feature_name_;
     record_identifier_feature_name = record_identifier_feature_name_;
     feature_group_name = feature_group_name_;
     feature_group_arn = feature_group_arn_;
   }
    : feature_group)

let make_feature_metadata ?parameters:(parameters_ : feature_parameters option)
    ?description:(description_ : feature_description option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?creation_time:(creation_time_ : creation_time option)
    ?feature_type:(feature_type_ : feature_type option)
    ?feature_name:(feature_name_ : feature_name option)
    ?feature_group_name:(feature_group_name_ : feature_group_name option)
    ?feature_group_arn:(feature_group_arn_ : feature_group_arn option) () =
  ({
     parameters = parameters_;
     description = description_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     feature_type = feature_type_;
     feature_name = feature_name_;
     feature_group_name = feature_group_name_;
     feature_group_arn = feature_group_arn_;
   }
    : feature_metadata)

let make_project ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option) ?tags:(tags_ : tag_list option)
    ?template_provider_details:(template_provider_details_ : template_provider_detail_list option)
    ?creation_time:(creation_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?project_status:(project_status_ : project_status option)
    ?service_catalog_provisioned_product_details:
      (service_catalog_provisioned_product_details_ :
         service_catalog_provisioned_product_details option)
    ?service_catalog_provisioning_details:
      (service_catalog_provisioning_details_ : service_catalog_provisioning_details option)
    ?project_description:(project_description_ : entity_description option)
    ?project_id:(project_id_ : project_id option)
    ?project_name:(project_name_ : project_entity_name option)
    ?project_arn:(project_arn_ : project_arn option) () =
  ({
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     tags = tags_;
     template_provider_details = template_provider_details_;
     creation_time = creation_time_;
     created_by = created_by_;
     project_status = project_status_;
     service_catalog_provisioned_product_details = service_catalog_provisioned_product_details_;
     service_catalog_provisioning_details = service_catalog_provisioning_details_;
     project_description = project_description_;
     project_id = project_id_;
     project_name = project_name_;
     project_arn = project_arn_;
   }
    : project)

let make_hyperband_strategy_config
    ?max_resource:(max_resource_ : hyperband_strategy_max_resource option)
    ?min_resource:(min_resource_ : hyperband_strategy_min_resource option) () =
  ({ max_resource = max_resource_; min_resource = min_resource_ } : hyperband_strategy_config)

let make_hyper_parameter_tuning_job_strategy_config
    ?hyperband_strategy_config:(hyperband_strategy_config_ : hyperband_strategy_config option) () =
  ({ hyperband_strategy_config = hyperband_strategy_config_ }
    : hyper_parameter_tuning_job_strategy_config)

let make_resource_limits
    ?max_runtime_in_seconds:
      (max_runtime_in_seconds_ : hyper_parameter_tuning_max_runtime_in_seconds option)
    ?max_number_of_training_jobs:(max_number_of_training_jobs_ : max_number_of_training_jobs option)
    ~max_parallel_training_jobs:(max_parallel_training_jobs_ : max_parallel_training_jobs) () =
  ({
     max_runtime_in_seconds = max_runtime_in_seconds_;
     max_parallel_training_jobs = max_parallel_training_jobs_;
     max_number_of_training_jobs = max_number_of_training_jobs_;
   }
    : resource_limits)

let make_integer_parameter_range ?scaling_type:(scaling_type_ : hyper_parameter_scaling_type option)
    ~max_value:(max_value_ : parameter_value) ~min_value:(min_value_ : parameter_value)
    ~name:(name_ : parameter_key) () =
  ({ scaling_type = scaling_type_; max_value = max_value_; min_value = min_value_; name = name_ }
    : integer_parameter_range)

let make_continuous_parameter_range
    ?scaling_type:(scaling_type_ : hyper_parameter_scaling_type option)
    ~max_value:(max_value_ : parameter_value) ~min_value:(min_value_ : parameter_value)
    ~name:(name_ : parameter_key) () =
  ({ scaling_type = scaling_type_; max_value = max_value_; min_value = min_value_; name = name_ }
    : continuous_parameter_range)

let make_categorical_parameter_range ~values:(values_ : parameter_values)
    ~name:(name_ : parameter_key) () =
  ({ values = values_; name = name_ } : categorical_parameter_range)

let make_auto_parameter ~value_hint:(value_hint_ : parameter_value) ~name:(name_ : parameter_key) ()
    =
  ({ value_hint = value_hint_; name = name_ } : auto_parameter)

let make_parameter_ranges ?auto_parameters:(auto_parameters_ : auto_parameters option)
    ?categorical_parameter_ranges:
      (categorical_parameter_ranges_ : categorical_parameter_ranges option)
    ?continuous_parameter_ranges:(continuous_parameter_ranges_ : continuous_parameter_ranges option)
    ?integer_parameter_ranges:(integer_parameter_ranges_ : integer_parameter_ranges option) () =
  ({
     auto_parameters = auto_parameters_;
     categorical_parameter_ranges = categorical_parameter_ranges_;
     continuous_parameter_ranges = continuous_parameter_ranges_;
     integer_parameter_ranges = integer_parameter_ranges_;
   }
    : parameter_ranges)

let make_hyper_parameter_tuning_job_config ?random_seed:(random_seed_ : random_seed option)
    ?tuning_job_completion_criteria:
      (tuning_job_completion_criteria_ : tuning_job_completion_criteria option)
    ?training_job_early_stopping_type:
      (training_job_early_stopping_type_ : training_job_early_stopping_type option)
    ?parameter_ranges:(parameter_ranges_ : parameter_ranges option)
    ?hyper_parameter_tuning_job_objective:
      (hyper_parameter_tuning_job_objective_ : hyper_parameter_tuning_job_objective option)
    ?strategy_config:(strategy_config_ : hyper_parameter_tuning_job_strategy_config option)
    ~resource_limits:(resource_limits_ : resource_limits)
    ~strategy:(strategy_ : hyper_parameter_tuning_job_strategy_type) () =
  ({
     random_seed = random_seed_;
     tuning_job_completion_criteria = tuning_job_completion_criteria_;
     training_job_early_stopping_type = training_job_early_stopping_type_;
     parameter_ranges = parameter_ranges_;
     resource_limits = resource_limits_;
     hyper_parameter_tuning_job_objective = hyper_parameter_tuning_job_objective_;
     strategy_config = strategy_config_;
     strategy = strategy_;
   }
    : hyper_parameter_tuning_job_config)

let make_hyper_parameter_algorithm_specification
    ?metric_definitions:(metric_definitions_ : metric_definition_list option)
    ?algorithm_name:(algorithm_name_ : arn_or_name option)
    ?training_image:(training_image_ : algorithm_image option)
    ~training_input_mode:(training_input_mode_ : training_input_mode) () =
  ({
     metric_definitions = metric_definitions_;
     algorithm_name = algorithm_name_;
     training_input_mode = training_input_mode_;
     training_image = training_image_;
   }
    : hyper_parameter_algorithm_specification)

let make_hyper_parameter_tuning_instance_config
    ~volume_size_in_g_b:(volume_size_in_g_b_ : volume_size_in_g_b)
    ~instance_count:(instance_count_ : training_instance_count)
    ~instance_type:(instance_type_ : training_instance_type) () =
  ({
     volume_size_in_g_b = volume_size_in_g_b_;
     instance_count = instance_count_;
     instance_type = instance_type_;
   }
    : hyper_parameter_tuning_instance_config)

let make_hyper_parameter_tuning_resource_config
    ?instance_configs:(instance_configs_ : hyper_parameter_tuning_instance_configs option)
    ?allocation_strategy:(allocation_strategy_ : hyper_parameter_tuning_allocation_strategy option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?volume_size_in_g_b:(volume_size_in_g_b_ : optional_volume_size_in_g_b option)
    ?instance_count:(instance_count_ : training_instance_count option)
    ?instance_type:(instance_type_ : training_instance_type option) () =
  ({
     instance_configs = instance_configs_;
     allocation_strategy = allocation_strategy_;
     volume_kms_key_id = volume_kms_key_id_;
     volume_size_in_g_b = volume_size_in_g_b_;
     instance_count = instance_count_;
     instance_type = instance_type_;
   }
    : hyper_parameter_tuning_resource_config)

let make_hyper_parameter_training_job_definition
    ?environment:(environment_ : hyper_parameter_training_job_environment_map option)
    ?retry_strategy:(retry_strategy_ : retry_strategy option)
    ?checkpoint_config:(checkpoint_config_ : checkpoint_config option)
    ?enable_managed_spot_training:(enable_managed_spot_training_ : boolean_ option)
    ?enable_inter_container_traffic_encryption:
      (enable_inter_container_traffic_encryption_ : boolean_ option)
    ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ?hyper_parameter_tuning_resource_config:
      (hyper_parameter_tuning_resource_config_ : hyper_parameter_tuning_resource_config option)
    ?resource_config:(resource_config_ : resource_config option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?static_hyper_parameters:(static_hyper_parameters_ : hyper_parameters option)
    ?hyper_parameter_ranges:(hyper_parameter_ranges_ : parameter_ranges option)
    ?tuning_objective:(tuning_objective_ : hyper_parameter_tuning_job_objective option)
    ?definition_name:(definition_name_ : hyper_parameter_training_job_definition_name option)
    ~stopping_condition:(stopping_condition_ : stopping_condition)
    ~output_data_config:(output_data_config_ : output_data_config) ~role_arn:(role_arn_ : role_arn)
    ~algorithm_specification:(algorithm_specification_ : hyper_parameter_algorithm_specification) ()
    =
  ({
     environment = environment_;
     retry_strategy = retry_strategy_;
     checkpoint_config = checkpoint_config_;
     enable_managed_spot_training = enable_managed_spot_training_;
     enable_inter_container_traffic_encryption = enable_inter_container_traffic_encryption_;
     enable_network_isolation = enable_network_isolation_;
     stopping_condition = stopping_condition_;
     hyper_parameter_tuning_resource_config = hyper_parameter_tuning_resource_config_;
     resource_config = resource_config_;
     output_data_config = output_data_config_;
     vpc_config = vpc_config_;
     input_data_config = input_data_config_;
     role_arn = role_arn_;
     algorithm_specification = algorithm_specification_;
     static_hyper_parameters = static_hyper_parameters_;
     hyper_parameter_ranges = hyper_parameter_ranges_;
     tuning_objective = tuning_objective_;
     definition_name = definition_name_;
   }
    : hyper_parameter_training_job_definition)

let make_objective_status_counters ?failed:(failed_ : objective_status_counter option)
    ?pending:(pending_ : objective_status_counter option)
    ?succeeded:(succeeded_ : objective_status_counter option) () =
  ({ failed = failed_; pending = pending_; succeeded = succeeded_ } : objective_status_counters)

let make_final_hyper_parameter_tuning_job_objective_metric
    ?type_:(type__ : hyper_parameter_tuning_job_objective_type option)
    ~value:(value_ : metric_value) ~metric_name:(metric_name_ : metric_name) () =
  ({ value = value_; metric_name = metric_name_; type_ = type__ }
    : final_hyper_parameter_tuning_job_objective_metric)

let make_hyper_parameter_training_job_summary
    ?objective_status:(objective_status_ : objective_status option)
    ?final_hyper_parameter_tuning_job_objective_metric:
      (final_hyper_parameter_tuning_job_objective_metric_ :
         final_hyper_parameter_tuning_job_objective_metric option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?training_end_time:(training_end_time_ : timestamp option)
    ?training_start_time:(training_start_time_ : timestamp option)
    ?tuning_job_name:(tuning_job_name_ : hyper_parameter_tuning_job_name option)
    ?training_job_definition_name:
      (training_job_definition_name_ : hyper_parameter_training_job_definition_name option)
    ~tuned_hyper_parameters:(tuned_hyper_parameters_ : hyper_parameters)
    ~training_job_status:(training_job_status_ : training_job_status)
    ~creation_time:(creation_time_ : timestamp)
    ~training_job_arn:(training_job_arn_ : training_job_arn)
    ~training_job_name:(training_job_name_ : training_job_name) () =
  ({
     objective_status = objective_status_;
     final_hyper_parameter_tuning_job_objective_metric =
       final_hyper_parameter_tuning_job_objective_metric_;
     failure_reason = failure_reason_;
     tuned_hyper_parameters = tuned_hyper_parameters_;
     training_job_status = training_job_status_;
     training_end_time = training_end_time_;
     training_start_time = training_start_time_;
     creation_time = creation_time_;
     tuning_job_name = tuning_job_name_;
     training_job_arn = training_job_arn_;
     training_job_name = training_job_name_;
     training_job_definition_name = training_job_definition_name_;
   }
    : hyper_parameter_training_job_summary)

let make_parent_hyper_parameter_tuning_job
    ?hyper_parameter_tuning_job_name:
      (hyper_parameter_tuning_job_name_ : hyper_parameter_tuning_job_name option) () =
  ({ hyper_parameter_tuning_job_name = hyper_parameter_tuning_job_name_ }
    : parent_hyper_parameter_tuning_job)

let make_hyper_parameter_tuning_job_warm_start_config
    ~warm_start_type:(warm_start_type_ : hyper_parameter_tuning_job_warm_start_type)
    ~parent_hyper_parameter_tuning_jobs:
      (parent_hyper_parameter_tuning_jobs_ : parent_hyper_parameter_tuning_jobs) () =
  ({
     warm_start_type = warm_start_type_;
     parent_hyper_parameter_tuning_jobs = parent_hyper_parameter_tuning_jobs_;
   }
    : hyper_parameter_tuning_job_warm_start_config)

let make_hyper_parameter_tuning_job_completion_details
    ?convergence_detected_time:(convergence_detected_time_ : timestamp option)
    ?number_of_training_jobs_objective_not_improving:
      (number_of_training_jobs_objective_not_improving_ : integer option) () =
  ({
     convergence_detected_time = convergence_detected_time_;
     number_of_training_jobs_objective_not_improving =
       number_of_training_jobs_objective_not_improving_;
   }
    : hyper_parameter_tuning_job_completion_details)

let make_hyper_parameter_tuning_job_consumed_resources
    ?runtime_in_seconds:(runtime_in_seconds_ : integer option) () =
  ({ runtime_in_seconds = runtime_in_seconds_ } : hyper_parameter_tuning_job_consumed_resources)

let make_hyper_parameter_tuning_job_search_entity ?tags:(tags_ : tag_list option)
    ?consumed_resources:(consumed_resources_ : hyper_parameter_tuning_job_consumed_resources option)
    ?tuning_job_completion_details:
      (tuning_job_completion_details_ : hyper_parameter_tuning_job_completion_details option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?warm_start_config:(warm_start_config_ : hyper_parameter_tuning_job_warm_start_config option)
    ?overall_best_training_job:
      (overall_best_training_job_ : hyper_parameter_training_job_summary option)
    ?best_training_job:(best_training_job_ : hyper_parameter_training_job_summary option)
    ?objective_status_counters:(objective_status_counters_ : objective_status_counters option)
    ?training_job_status_counters:
      (training_job_status_counters_ : training_job_status_counters option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?hyper_parameter_tuning_end_time:(hyper_parameter_tuning_end_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?hyper_parameter_tuning_job_status:
      (hyper_parameter_tuning_job_status_ : hyper_parameter_tuning_job_status option)
    ?training_job_definitions:
      (training_job_definitions_ : hyper_parameter_training_job_definitions option)
    ?training_job_definition:
      (training_job_definition_ : hyper_parameter_training_job_definition option)
    ?hyper_parameter_tuning_job_config:
      (hyper_parameter_tuning_job_config_ : hyper_parameter_tuning_job_config option)
    ?hyper_parameter_tuning_job_arn:
      (hyper_parameter_tuning_job_arn_ : hyper_parameter_tuning_job_arn option)
    ?hyper_parameter_tuning_job_name:
      (hyper_parameter_tuning_job_name_ : hyper_parameter_tuning_job_name option) () =
  ({
     tags = tags_;
     consumed_resources = consumed_resources_;
     tuning_job_completion_details = tuning_job_completion_details_;
     failure_reason = failure_reason_;
     warm_start_config = warm_start_config_;
     overall_best_training_job = overall_best_training_job_;
     best_training_job = best_training_job_;
     objective_status_counters = objective_status_counters_;
     training_job_status_counters = training_job_status_counters_;
     last_modified_time = last_modified_time_;
     hyper_parameter_tuning_end_time = hyper_parameter_tuning_end_time_;
     creation_time = creation_time_;
     hyper_parameter_tuning_job_status = hyper_parameter_tuning_job_status_;
     training_job_definitions = training_job_definitions_;
     training_job_definition = training_job_definition_;
     hyper_parameter_tuning_job_config = hyper_parameter_tuning_job_config_;
     hyper_parameter_tuning_job_arn = hyper_parameter_tuning_job_arn_;
     hyper_parameter_tuning_job_name = hyper_parameter_tuning_job_name_;
   }
    : hyper_parameter_tuning_job_search_entity)

let make_model_card_security_config ?kms_key_id:(kms_key_id_ : kms_key_id option) () =
  ({ kms_key_id = kms_key_id_ } : model_card_security_config)

let make_model_card ?model_package_group_name:(model_package_group_name_ : string_ option)
    ?risk_rating:(risk_rating_ : string_ option) ?model_id:(model_id_ : string_ option)
    ?tags:(tags_ : tag_list option) ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?creation_time:(creation_time_ : timestamp option)
    ?security_config:(security_config_ : model_card_security_config option)
    ?model_card_status:(model_card_status_ : model_card_status option)
    ?content:(content_ : model_card_content option)
    ?model_card_version:(model_card_version_ : integer option)
    ?model_card_name:(model_card_name_ : entity_name option)
    ?model_card_arn:(model_card_arn_ : model_card_arn option) () =
  ({
     model_package_group_name = model_package_group_name_;
     risk_rating = risk_rating_;
     model_id = model_id_;
     tags = tags_;
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     created_by = created_by_;
     creation_time = creation_time_;
     security_config = security_config_;
     model_card_status = model_card_status_;
     content = content_;
     model_card_version = model_card_version_;
     model_card_name = model_card_name_;
     model_card_arn = model_card_arn_;
   }
    : model_card)

let make_repository_auth_config
    ~repository_credentials_provider_arn:
      (repository_credentials_provider_arn_ : repository_credentials_provider_arn) () =
  ({ repository_credentials_provider_arn = repository_credentials_provider_arn_ }
    : repository_auth_config)

let make_image_config
    ?repository_auth_config:(repository_auth_config_ : repository_auth_config option)
    ~repository_access_mode:(repository_access_mode_ : repository_access_mode) () =
  ({
     repository_auth_config = repository_auth_config_;
     repository_access_mode = repository_access_mode_;
   }
    : image_config)

let make_multi_model_config ?model_cache_setting:(model_cache_setting_ : model_cache_setting option)
    () =
  ({ model_cache_setting = model_cache_setting_ } : multi_model_config)

let make_container_definition
    ?container_metrics_config:(container_metrics_config_ : container_metrics_config option)
    ?multi_model_config:(multi_model_config_ : multi_model_config option)
    ?inference_specification_name:
      (inference_specification_name_ : inference_specification_name option)
    ?model_package_name:(model_package_name_ : versioned_arn_or_name option)
    ?environment:(environment_ : environment_map option)
    ?additional_model_data_sources:
      (additional_model_data_sources_ : additional_model_data_sources option)
    ?model_data_source:(model_data_source_ : model_data_source option)
    ?model_data_url:(model_data_url_ : url option) ?mode:(mode_ : container_mode option)
    ?image_config:(image_config_ : image_config option) ?image:(image_ : container_image option)
    ?container_hostname:(container_hostname_ : container_hostname option) () =
  ({
     container_metrics_config = container_metrics_config_;
     multi_model_config = multi_model_config_;
     inference_specification_name = inference_specification_name_;
     model_package_name = model_package_name_;
     environment = environment_;
     additional_model_data_sources = additional_model_data_sources_;
     model_data_source = model_data_source_;
     model_data_url = model_data_url_;
     mode = mode_;
     image_config = image_config_;
     image = image_;
     container_hostname = container_hostname_;
   }
    : container_definition)

let make_inference_execution_config ~mode:(mode_ : inference_execution_mode) () =
  ({ mode = mode_ } : inference_execution_config)

let make_real_time_inference_recommendation ?environment:(environment_ : environment_map option)
    ~instance_type:(instance_type_ : production_variant_instance_type)
    ~recommendation_id:(recommendation_id_ : string_) () =
  ({
     environment = environment_;
     instance_type = instance_type_;
     recommendation_id = recommendation_id_;
   }
    : real_time_inference_recommendation)

let make_deployment_recommendation
    ?real_time_inference_recommendations:
      (real_time_inference_recommendations_ : real_time_inference_recommendations option)
    ~recommendation_status:(recommendation_status_ : recommendation_status) () =
  ({
     real_time_inference_recommendations = real_time_inference_recommendations_;
     recommendation_status = recommendation_status_;
   }
    : deployment_recommendation)

let make_model
    ?deployment_recommendation:(deployment_recommendation_ : deployment_recommendation option)
    ?tags:(tags_ : tag_list option)
    ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ?model_arn:(model_arn_ : model_arn option) ?creation_time:(creation_time_ : timestamp option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?execution_role_arn:(execution_role_arn_ : role_arn option)
    ?inference_execution_config:(inference_execution_config_ : inference_execution_config option)
    ?containers:(containers_ : container_definition_list option)
    ?primary_container:(primary_container_ : container_definition option)
    ?model_name:(model_name_ : model_name option) () =
  ({
     deployment_recommendation = deployment_recommendation_;
     tags = tags_;
     enable_network_isolation = enable_network_isolation_;
     model_arn = model_arn_;
     creation_time = creation_time_;
     vpc_config = vpc_config_;
     execution_role_arn = execution_role_arn_;
     inference_execution_config = inference_execution_config_;
     containers = containers_;
     primary_container = primary_container_;
     model_name = model_name_;
   }
    : model)

let make_model_dashboard_endpoint ~endpoint_status:(endpoint_status_ : endpoint_status)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp) ~endpoint_arn:(endpoint_arn_ : endpoint_arn)
    ~endpoint_name:(endpoint_name_ : endpoint_name) () =
  ({
     endpoint_status = endpoint_status_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     endpoint_arn = endpoint_arn_;
     endpoint_name = endpoint_name_;
   }
    : model_dashboard_endpoint)

let make_model_dashboard_indicator_action ?enabled:(enabled_ : boolean_ option) () =
  ({ enabled = enabled_ } : model_dashboard_indicator_action)

let make_monitoring_alert_actions
    ?model_dashboard_indicator:
      (model_dashboard_indicator_ : model_dashboard_indicator_action option) () =
  ({ model_dashboard_indicator = model_dashboard_indicator_ } : monitoring_alert_actions)

let make_monitoring_alert_summary ~actions:(actions_ : monitoring_alert_actions)
    ~evaluation_period:(evaluation_period_ : monitoring_evaluation_period)
    ~datapoints_to_alert:(datapoints_to_alert_ : monitoring_datapoints_to_alert)
    ~alert_status:(alert_status_ : monitoring_alert_status)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp)
    ~monitoring_alert_name:(monitoring_alert_name_ : monitoring_alert_name) () =
  ({
     actions = actions_;
     evaluation_period = evaluation_period_;
     datapoints_to_alert = datapoints_to_alert_;
     alert_status = alert_status_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     monitoring_alert_name = monitoring_alert_name_;
   }
    : monitoring_alert_summary)

let make_model_dashboard_monitoring_schedule
    ?batch_transform_input:(batch_transform_input_ : batch_transform_input option)
    ?last_monitoring_execution_summary:
      (last_monitoring_execution_summary_ : monitoring_execution_summary option)
    ?monitoring_alert_summaries:(monitoring_alert_summaries_ : monitoring_alert_summary_list option)
    ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ?monitoring_schedule_config:(monitoring_schedule_config_ : monitoring_schedule_config option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?monitoring_type:(monitoring_type_ : monitoring_type option)
    ?monitoring_schedule_status:(monitoring_schedule_status_ : schedule_status option)
    ?monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name option)
    ?monitoring_schedule_arn:(monitoring_schedule_arn_ : monitoring_schedule_arn option) () =
  ({
     batch_transform_input = batch_transform_input_;
     last_monitoring_execution_summary = last_monitoring_execution_summary_;
     monitoring_alert_summaries = monitoring_alert_summaries_;
     endpoint_name = endpoint_name_;
     monitoring_schedule_config = monitoring_schedule_config_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     failure_reason = failure_reason_;
     monitoring_type = monitoring_type_;
     monitoring_schedule_status = monitoring_schedule_status_;
     monitoring_schedule_name = monitoring_schedule_name_;
     monitoring_schedule_arn = monitoring_schedule_arn_;
   }
    : model_dashboard_monitoring_schedule)

let make_model_dashboard_model_card ?risk_rating:(risk_rating_ : string_ option)
    ?model_id:(model_id_ : string_ option) ?tags:(tags_ : tag_list option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?creation_time:(creation_time_ : timestamp option)
    ?security_config:(security_config_ : model_card_security_config option)
    ?model_card_status:(model_card_status_ : model_card_status option)
    ?model_card_version:(model_card_version_ : integer option)
    ?model_card_name:(model_card_name_ : entity_name option)
    ?model_card_arn:(model_card_arn_ : model_card_arn option) () =
  ({
     risk_rating = risk_rating_;
     model_id = model_id_;
     tags = tags_;
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     created_by = created_by_;
     creation_time = creation_time_;
     security_config = security_config_;
     model_card_status = model_card_status_;
     model_card_version = model_card_version_;
     model_card_name = model_card_name_;
     model_card_arn = model_card_arn_;
   }
    : model_dashboard_model_card)

let make_model_dashboard_model ?model_card:(model_card_ : model_dashboard_model_card option)
    ?monitoring_schedules:(monitoring_schedules_ : model_dashboard_monitoring_schedules option)
    ?last_batch_transform_job:(last_batch_transform_job_ : transform_job option)
    ?endpoints:(endpoints_ : model_dashboard_endpoints option) ?model:(model_ : model option) () =
  ({
     model_card = model_card_;
     monitoring_schedules = monitoring_schedules_;
     last_batch_transform_job = last_batch_transform_job_;
     endpoints = endpoints_;
     model = model_;
   }
    : model_dashboard_model)

let make_job_secondary_status_transition ?status_message:(status_message_ : string_ option)
    ?end_time:(end_time_ : timestamp option) ~start_time:(start_time_ : timestamp)
    ~status:(status_ : job_secondary_status) () =
  ({
     status_message = status_message_;
     end_time = end_time_;
     start_time = start_time_;
     status = status_;
   }
    : job_secondary_status_transition)

let make_job ?tags:(tags_ : tag_list option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?secondary_status_transitions:
      (secondary_status_transitions_ : job_secondary_status_transitions option)
    ?secondary_status:(secondary_status_ : job_secondary_status option)
    ?job_status:(job_status_ : job_status option) ?end_time:(end_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?job_config_document:(job_config_document_ : job_config_document option)
    ?job_config_schema_version:(job_config_schema_version_ : job_schema_version option)
    ?job_category:(job_category_ : job_category option) ?role_arn:(role_arn_ : role_arn option)
    ?job_arn:(job_arn_ : job_arn option) ?job_name:(job_name_ : job_name option) () =
  ({
     tags = tags_;
     failure_reason = failure_reason_;
     secondary_status_transitions = secondary_status_transitions_;
     secondary_status = secondary_status_;
     job_status = job_status_;
     end_time = end_time_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     job_config_document = job_config_document_;
     job_config_schema_version = job_config_schema_version_;
     job_category = job_category_;
     role_arn = role_arn_;
     job_arn = job_arn_;
     job_name = job_name_;
   }
    : job)

let make_search_record ?job:(job_ : job option) ?model:(model_ : model_dashboard_model option)
    ?model_card:(model_card_ : model_card option)
    ?hyper_parameter_tuning_job:
      (hyper_parameter_tuning_job_ : hyper_parameter_tuning_job_search_entity option)
    ?project:(project_ : project option)
    ?feature_metadata:(feature_metadata_ : feature_metadata option)
    ?feature_group:(feature_group_ : feature_group option)
    ?pipeline_version:(pipeline_version_ : pipeline_version option)
    ?pipeline_execution:(pipeline_execution_ : pipeline_execution option)
    ?pipeline:(pipeline_ : pipeline option)
    ?model_package_group:(model_package_group_ : model_package_group option)
    ?model_package:(model_package_ : model_package option) ?endpoint:(endpoint_ : endpoint option)
    ?trial_component:(trial_component_ : trial_component option) ?trial:(trial_ : trial option)
    ?experiment:(experiment_ : experiment option)
    ?training_job:(training_job_ : training_job option) () =
  ({
     job = job_;
     model = model_;
     model_card = model_card_;
     hyper_parameter_tuning_job = hyper_parameter_tuning_job_;
     project = project_;
     feature_metadata = feature_metadata_;
     feature_group = feature_group_;
     pipeline_version = pipeline_version_;
     pipeline_execution = pipeline_execution_;
     pipeline = pipeline_;
     model_package_group = model_package_group_;
     model_package = model_package_;
     endpoint = endpoint_;
     trial_component = trial_component_;
     trial = trial_;
     experiment = experiment_;
     training_job = training_job_;
   }
    : search_record)

let make_search_response ?total_hits:(total_hits_ : total_hits option)
    ?next_token:(next_token_ : next_token option) ?results:(results_ : search_results_list option)
    () =
  ({ total_hits = total_hits_; next_token = next_token_; results = results_ } : search_response)

let make_filter ?value:(value_ : filter_value option) ?operator:(operator_ : operator option)
    ~name:(name_ : resource_property_name) () =
  ({ value = value_; operator = operator_; name = name_ } : filter)

let make_nested_filters ~filters:(filters_ : filter_list)
    ~nested_property_name:(nested_property_name_ : resource_property_name) () =
  ({ filters = filters_; nested_property_name = nested_property_name_ } : nested_filters)

let make_search_expression ?operator:(operator_ : boolean_operator option)
    ?sub_expressions:(sub_expressions_ : search_expression_list option)
    ?nested_filters:(nested_filters_ : nested_filters_list option)
    ?filters:(filters_ : filter_list option) () =
  ({
     operator = operator_;
     sub_expressions = sub_expressions_;
     nested_filters = nested_filters_;
     filters = filters_;
   }
    : search_expression)

let make_search_request
    ?visibility_conditions:(visibility_conditions_ : visibility_conditions_list option)
    ?cross_account_filter_option:(cross_account_filter_option_ : cross_account_filter_option option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?sort_order:(sort_order_ : search_sort_order option)
    ?sort_by:(sort_by_ : resource_property_name option)
    ?search_expression:(search_expression_ : search_expression option)
    ~resource:(resource_ : resource_type) () =
  ({
     visibility_conditions = visibility_conditions_;
     cross_account_filter_option = cross_account_filter_option_;
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     search_expression = search_expression_;
     resource = resource_;
   }
    : search_request)

let make_scaling_policy_objective
    ?max_invocations_per_minute:(max_invocations_per_minute_ : integer option)
    ?min_invocations_per_minute:(min_invocations_per_minute_ : integer option) () =
  ({
     max_invocations_per_minute = max_invocations_per_minute_;
     min_invocations_per_minute = min_invocations_per_minute_;
   }
    : scaling_policy_objective)

let make_scaling_policy_metric ?model_latency:(model_latency_ : integer option)
    ?invocations_per_instance:(invocations_per_instance_ : integer option) () =
  ({ model_latency = model_latency_; invocations_per_instance = invocations_per_instance_ }
    : scaling_policy_metric)

let make_retry_pipeline_execution_response
    ?pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn option) () =
  ({ pipeline_execution_arn = pipeline_execution_arn_ } : retry_pipeline_execution_response)

let make_retry_pipeline_execution_request
    ?parallelism_configuration:(parallelism_configuration_ : parallelism_configuration option)
    ~client_request_token:(client_request_token_ : idempotency_token)
    ~pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn) () =
  ({
     parallelism_configuration = parallelism_configuration_;
     client_request_token = client_request_token_;
     pipeline_execution_arn = pipeline_execution_arn_;
   }
    : retry_pipeline_execution_request)

let make_rendering_error ~message:(message_ : string_) ~code:(code_ : string_) () =
  ({ message = message_; code = code_ } : rendering_error)

let make_render_ui_template_response ~errors:(errors_ : rendering_error_list)
    ~rendered_content:(rendered_content_ : string_) () =
  ({ errors = errors_; rendered_content = rendered_content_ } : render_ui_template_response)

let make_renderable_task ~input:(input_ : task_input) () = ({ input = input_ } : renderable_task)

let make_render_ui_template_request
    ?human_task_ui_arn:(human_task_ui_arn_ : human_task_ui_arn option)
    ?ui_template:(ui_template_ : ui_template option) ~role_arn:(role_arn_ : role_arn)
    ~task:(task_ : renderable_task) () =
  ({
     human_task_ui_arn = human_task_ui_arn_;
     role_arn = role_arn_;
     task = task_;
     ui_template = ui_template_;
   }
    : render_ui_template_request)

let make_register_devices_request ?tags:(tags_ : tag_list option) ~devices:(devices_ : devices)
    ~device_fleet_name:(device_fleet_name_ : entity_name) () =
  ({ tags = tags_; devices = devices_; device_fleet_name = device_fleet_name_ }
    : register_devices_request)

let make_edge ?association_type:(association_type_ : association_edge_type option)
    ?destination_arn:(destination_arn_ : association_entity_arn option)
    ?source_arn:(source_arn_ : association_entity_arn option) () =
  ({
     association_type = association_type_;
     destination_arn = destination_arn_;
     source_arn = source_arn_;
   }
    : edge)

let make_query_lineage_response ?next_token:(next_token_ : string8192 option)
    ?edges:(edges_ : edges option) ?vertices:(vertices_ : vertices option) () =
  ({ next_token = next_token_; edges = edges_; vertices = vertices_ } : query_lineage_response)

let make_query_filters ?properties:(properties_ : query_properties option)
    ?modified_after:(modified_after_ : timestamp option)
    ?modified_before:(modified_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option)
    ?created_before:(created_before_ : timestamp option)
    ?lineage_types:(lineage_types_ : query_lineage_types option)
    ?types:(types_ : query_types option) () =
  ({
     properties = properties_;
     modified_after = modified_after_;
     modified_before = modified_before_;
     created_after = created_after_;
     created_before = created_before_;
     lineage_types = lineage_types_;
     types = types_;
   }
    : query_filters)

let make_query_lineage_request ?next_token:(next_token_ : string8192 option)
    ?max_results:(max_results_ : query_lineage_max_results option)
    ?max_depth:(max_depth_ : query_lineage_max_depth option)
    ?filters:(filters_ : query_filters option) ?include_edges:(include_edges_ : boolean_ option)
    ?direction:(direction_ : direction option)
    ?start_arns:(start_arns_ : query_lineage_start_arns option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     max_depth = max_depth_;
     filters = filters_;
     include_edges = include_edges_;
     direction = direction_;
     start_arns = start_arns_;
   }
    : query_lineage_request)

let make_put_model_package_group_policy_output
    ~model_package_group_arn:(model_package_group_arn_ : model_package_group_arn) () =
  ({ model_package_group_arn = model_package_group_arn_ } : put_model_package_group_policy_output)

let make_put_model_package_group_policy_input ~resource_policy:(resource_policy_ : policy_string)
    ~model_package_group_name:(model_package_group_name_ : entity_name) () =
  ({ resource_policy = resource_policy_; model_package_group_name = model_package_group_name_ }
    : put_model_package_group_policy_input)

let make_list_workteams_response ?next_token:(next_token_ : next_token option)
    ~workteams:(workteams_ : workteams) () =
  ({ next_token = next_token_; workteams = workteams_ } : list_workteams_response)

let make_list_workteams_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?name_contains:(name_contains_ : workteam_name option)
    ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : list_workteams_sort_by_options option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     name_contains = name_contains_;
     sort_order = sort_order_;
     sort_by = sort_by_;
   }
    : list_workteams_request)

let make_list_workforces_response ?next_token:(next_token_ : next_token option)
    ~workforces:(workforces_ : workforces) () =
  ({ next_token = next_token_; workforces = workforces_ } : list_workforces_response)

let make_list_workforces_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?name_contains:(name_contains_ : workforce_name option)
    ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : list_workforces_sort_by_options option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     name_contains = name_contains_;
     sort_order = sort_order_;
     sort_by = sort_by_;
   }
    : list_workforces_request)

let make_list_user_profiles_response ?next_token:(next_token_ : next_token option)
    ?user_profiles:(user_profiles_ : user_profile_list option) () =
  ({ next_token = next_token_; user_profiles = user_profiles_ } : list_user_profiles_response)

let make_list_user_profiles_request
    ?user_profile_name_contains:(user_profile_name_contains_ : user_profile_name option)
    ?domain_id_equals:(domain_id_equals_ : domain_id option)
    ?sort_by:(sort_by_ : user_profile_sort_key option) ?sort_order:(sort_order_ : sort_order option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     user_profile_name_contains = user_profile_name_contains_;
     domain_id_equals = domain_id_equals_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_user_profiles_request)

let make_list_ultra_servers_by_reserved_capacity_response
    ?next_token:(next_token_ : next_token option) ~ultra_servers:(ultra_servers_ : ultra_servers) ()
    =
  ({ ultra_servers = ultra_servers_; next_token = next_token_ }
    : list_ultra_servers_by_reserved_capacity_response)

let make_list_ultra_servers_by_reserved_capacity_request
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~reserved_capacity_arn:(reserved_capacity_arn_ : reserved_capacity_arn) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     reserved_capacity_arn = reserved_capacity_arn_;
   }
    : list_ultra_servers_by_reserved_capacity_request)

let make_list_trials_response ?next_token:(next_token_ : next_token option)
    ?trial_summaries:(trial_summaries_ : trial_summaries option) () =
  ({ next_token = next_token_; trial_summaries = trial_summaries_ } : list_trials_response)

let make_list_trials_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : sort_trials_by option) ?created_before:(created_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option)
    ?trial_component_name:(trial_component_name_ : experiment_entity_name option)
    ?experiment_name:(experiment_name_ : experiment_entity_name option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     created_before = created_before_;
     created_after = created_after_;
     trial_component_name = trial_component_name_;
     experiment_name = experiment_name_;
   }
    : list_trials_request)

let make_list_trial_components_response ?next_token:(next_token_ : next_token option)
    ?trial_component_summaries:(trial_component_summaries_ : trial_component_summaries option) () =
  ({ next_token = next_token_; trial_component_summaries = trial_component_summaries_ }
    : list_trial_components_response)

let make_list_trial_components_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : sort_trial_components_by option)
    ?created_before:(created_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option) ?source_arn:(source_arn_ : string256 option)
    ?trial_name:(trial_name_ : experiment_entity_name option)
    ?experiment_name:(experiment_name_ : experiment_entity_name option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     created_before = created_before_;
     created_after = created_after_;
     source_arn = source_arn_;
     trial_name = trial_name_;
     experiment_name = experiment_name_;
   }
    : list_trial_components_request)

let make_list_transform_jobs_response ?next_token:(next_token_ : next_token option)
    ~transform_job_summaries:(transform_job_summaries_ : transform_job_summaries) () =
  ({ next_token = next_token_; transform_job_summaries = transform_job_summaries_ }
    : list_transform_jobs_response)

let make_list_transform_jobs_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : sort_by option)
    ?status_equals:(status_equals_ : transform_job_status option)
    ?name_contains:(name_contains_ : name_contains option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     status_equals = status_equals_;
     name_contains = name_contains_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_transform_jobs_request)

let make_list_training_plans_response ?next_token:(next_token_ : next_token option)
    ~training_plan_summaries:(training_plan_summaries_ : training_plan_summaries) () =
  ({ training_plan_summaries = training_plan_summaries_; next_token = next_token_ }
    : list_training_plans_response)

let make_list_training_plans_request ?filters:(filters_ : training_plan_filters option)
    ?sort_order:(sort_order_ : training_plan_sort_order option)
    ?sort_by:(sort_by_ : training_plan_sort_by option)
    ?start_time_before:(start_time_before_ : timestamp option)
    ?start_time_after:(start_time_after_ : timestamp option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     filters = filters_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     start_time_before = start_time_before_;
     start_time_after = start_time_after_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_training_plans_request)

let make_list_training_jobs_for_hyper_parameter_tuning_job_response
    ?next_token:(next_token_ : next_token option)
    ~training_job_summaries:(training_job_summaries_ : hyper_parameter_training_job_summaries) () =
  ({ next_token = next_token_; training_job_summaries = training_job_summaries_ }
    : list_training_jobs_for_hyper_parameter_tuning_job_response)

let make_list_training_jobs_for_hyper_parameter_tuning_job_request
    ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : training_job_sort_by_options option)
    ?status_equals:(status_equals_ : training_job_status option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~hyper_parameter_tuning_job_name:
      (hyper_parameter_tuning_job_name_ : hyper_parameter_tuning_job_name) () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     status_equals = status_equals_;
     max_results = max_results_;
     next_token = next_token_;
     hyper_parameter_tuning_job_name = hyper_parameter_tuning_job_name_;
   }
    : list_training_jobs_for_hyper_parameter_tuning_job_request)

let make_list_training_jobs_response ?next_token:(next_token_ : next_token option)
    ~training_job_summaries:(training_job_summaries_ : training_job_summaries) () =
  ({ next_token = next_token_; training_job_summaries = training_job_summaries_ }
    : list_training_jobs_response)

let make_list_training_jobs_request
    ?training_plan_arn_equals:(training_plan_arn_equals_ : training_plan_arn option)
    ?warm_pool_status_equals:(warm_pool_status_equals_ : warm_pool_resource_status option)
    ?sort_order:(sort_order_ : sort_order option) ?sort_by:(sort_by_ : sort_by option)
    ?status_equals:(status_equals_ : training_job_status option)
    ?name_contains:(name_contains_ : name_contains option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     training_plan_arn_equals = training_plan_arn_equals_;
     warm_pool_status_equals = warm_pool_status_equals_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     status_equals = status_equals_;
     name_contains = name_contains_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_training_jobs_request)

let make_list_tags_output ?next_token:(next_token_ : next_token option)
    ?tags:(tags_ : tag_list option) () =
  ({ next_token = next_token_; tags = tags_ } : list_tags_output)

let make_list_tags_input ?max_results:(max_results_ : list_tags_max_results option)
    ?next_token:(next_token_ : next_token option) ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ max_results = max_results_; next_token = next_token_; resource_arn = resource_arn_ }
    : list_tags_input)

let make_list_subscribed_workteams_response ?next_token:(next_token_ : next_token option)
    ~subscribed_workteams:(subscribed_workteams_ : subscribed_workteams) () =
  ({ next_token = next_token_; subscribed_workteams = subscribed_workteams_ }
    : list_subscribed_workteams_response)

let make_list_subscribed_workteams_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?name_contains:(name_contains_ : workteam_name option) () =
  ({ max_results = max_results_; next_token = next_token_; name_contains = name_contains_ }
    : list_subscribed_workteams_request)

let make_list_studio_lifecycle_configs_response
    ?studio_lifecycle_configs:(studio_lifecycle_configs_ : studio_lifecycle_configs_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ studio_lifecycle_configs = studio_lifecycle_configs_; next_token = next_token_ }
    : list_studio_lifecycle_configs_response)

let make_list_studio_lifecycle_configs_request ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : studio_lifecycle_config_sort_key option)
    ?modified_time_after:(modified_time_after_ : timestamp option)
    ?modified_time_before:(modified_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?app_type_equals:(app_type_equals_ : studio_lifecycle_config_app_type option)
    ?name_contains:(name_contains_ : studio_lifecycle_config_name option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     modified_time_after = modified_time_after_;
     modified_time_before = modified_time_before_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     app_type_equals = app_type_equals_;
     name_contains = name_contains_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_studio_lifecycle_configs_request)

let make_device_deployment_summary
    ?deployment_start_time:(deployment_start_time_ : timestamp option)
    ?description:(description_ : device_description option)
    ?device_deployment_status_message:(device_deployment_status_message_ : string_ option)
    ?device_deployment_status:(device_deployment_status_ : device_deployment_status option)
    ?device_fleet_name:(device_fleet_name_ : entity_name option)
    ?deployed_stage_name:(deployed_stage_name_ : entity_name option)
    ~device_arn:(device_arn_ : device_arn) ~device_name:(device_name_ : device_name)
    ~stage_name:(stage_name_ : entity_name)
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name)
    ~edge_deployment_plan_arn:(edge_deployment_plan_arn_ : edge_deployment_plan_arn) () =
  ({
     deployment_start_time = deployment_start_time_;
     description = description_;
     device_deployment_status_message = device_deployment_status_message_;
     device_deployment_status = device_deployment_status_;
     device_arn = device_arn_;
     device_name = device_name_;
     device_fleet_name = device_fleet_name_;
     deployed_stage_name = deployed_stage_name_;
     stage_name = stage_name_;
     edge_deployment_plan_name = edge_deployment_plan_name_;
     edge_deployment_plan_arn = edge_deployment_plan_arn_;
   }
    : device_deployment_summary)

let make_list_stage_devices_response ?next_token:(next_token_ : next_token option)
    ~device_deployment_summaries:(device_deployment_summaries_ : device_deployment_summaries) () =
  ({ next_token = next_token_; device_deployment_summaries = device_deployment_summaries_ }
    : list_stage_devices_response)

let make_list_stage_devices_request
    ?exclude_devices_deployed_in_other_stage:
      (exclude_devices_deployed_in_other_stage_ : boolean_ option)
    ?max_results:(max_results_ : list_max_results option)
    ?next_token:(next_token_ : next_token option) ~stage_name:(stage_name_ : entity_name)
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name) () =
  ({
     stage_name = stage_name_;
     exclude_devices_deployed_in_other_stage = exclude_devices_deployed_in_other_stage_;
     edge_deployment_plan_name = edge_deployment_plan_name_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_stage_devices_request)

let make_list_spaces_response ?next_token:(next_token_ : next_token option)
    ?spaces:(spaces_ : space_list option) () =
  ({ next_token = next_token_; spaces = spaces_ } : list_spaces_response)

let make_list_spaces_request ?space_name_contains:(space_name_contains_ : space_name option)
    ?domain_id_equals:(domain_id_equals_ : domain_id option)
    ?sort_by:(sort_by_ : space_sort_key option) ?sort_order:(sort_order_ : sort_order option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     space_name_contains = space_name_contains_;
     domain_id_equals = domain_id_equals_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_spaces_request)

let make_resource_catalog ~creation_time:(creation_time_ : timestamp)
    ~description:(description_ : resource_catalog_description)
    ~resource_catalog_name:(resource_catalog_name_ : resource_catalog_name)
    ~resource_catalog_arn:(resource_catalog_arn_ : resource_catalog_arn) () =
  ({
     creation_time = creation_time_;
     description = description_;
     resource_catalog_name = resource_catalog_name_;
     resource_catalog_arn = resource_catalog_arn_;
   }
    : resource_catalog)

let make_list_resource_catalogs_response ?next_token:(next_token_ : next_token option)
    ?resource_catalogs:(resource_catalogs_ : resource_catalog_list option) () =
  ({ next_token = next_token_; resource_catalogs = resource_catalogs_ }
    : list_resource_catalogs_response)

let make_list_resource_catalogs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?sort_by:(sort_by_ : resource_catalog_sort_by option)
    ?sort_order:(sort_order_ : resource_catalog_sort_order option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?name_contains:(name_contains_ : resource_catalog_name option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     name_contains = name_contains_;
   }
    : list_resource_catalogs_request)

let make_project_summary ?project_description:(project_description_ : entity_description option)
    ~project_status:(project_status_ : project_status) ~creation_time:(creation_time_ : timestamp)
    ~project_id:(project_id_ : project_id) ~project_arn:(project_arn_ : project_arn)
    ~project_name:(project_name_ : project_entity_name) () =
  ({
     project_status = project_status_;
     creation_time = creation_time_;
     project_id = project_id_;
     project_arn = project_arn_;
     project_description = project_description_;
     project_name = project_name_;
   }
    : project_summary)

let make_list_projects_output ?next_token:(next_token_ : next_token option)
    ~project_summary_list:(project_summary_list_ : project_summary_list) () =
  ({ next_token = next_token_; project_summary_list = project_summary_list_ }
    : list_projects_output)

let make_list_projects_input ?sort_order:(sort_order_ : project_sort_order option)
    ?sort_by:(sort_by_ : project_sort_by option) ?next_token:(next_token_ : next_token option)
    ?name_contains:(name_contains_ : project_entity_name option)
    ?max_results:(max_results_ : max_results option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option) () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     next_token = next_token_;
     name_contains = name_contains_;
     max_results = max_results_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_projects_input)

let make_processing_job_summary ?exit_message:(exit_message_ : exit_message option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?processing_end_time:(processing_end_time_ : timestamp option)
    ~processing_job_status:(processing_job_status_ : processing_job_status)
    ~creation_time:(creation_time_ : timestamp)
    ~processing_job_arn:(processing_job_arn_ : processing_job_arn)
    ~processing_job_name:(processing_job_name_ : processing_job_name) () =
  ({
     exit_message = exit_message_;
     failure_reason = failure_reason_;
     processing_job_status = processing_job_status_;
     last_modified_time = last_modified_time_;
     processing_end_time = processing_end_time_;
     creation_time = creation_time_;
     processing_job_arn = processing_job_arn_;
     processing_job_name = processing_job_name_;
   }
    : processing_job_summary)

let make_list_processing_jobs_response ?next_token:(next_token_ : next_token option)
    ~processing_job_summaries:(processing_job_summaries_ : processing_job_summaries) () =
  ({ next_token = next_token_; processing_job_summaries = processing_job_summaries_ }
    : list_processing_jobs_response)

let make_list_processing_jobs_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : sort_by option)
    ?status_equals:(status_equals_ : processing_job_status option)
    ?name_contains:(name_contains_ : string_ option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     status_equals = status_equals_;
     name_contains = name_contains_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_processing_jobs_request)

let make_pipeline_version_summary
    ?last_execution_pipeline_execution_arn:
      (last_execution_pipeline_execution_arn_ : pipeline_execution_arn option)
    ?pipeline_version_display_name:(pipeline_version_display_name_ : pipeline_version_name option)
    ?pipeline_version_description:
      (pipeline_version_description_ : pipeline_version_description option)
    ?creation_time:(creation_time_ : timestamp option)
    ?pipeline_version_id:(pipeline_version_id_ : pipeline_version_id option)
    ?pipeline_arn:(pipeline_arn_ : pipeline_arn option) () =
  ({
     last_execution_pipeline_execution_arn = last_execution_pipeline_execution_arn_;
     pipeline_version_display_name = pipeline_version_display_name_;
     pipeline_version_description = pipeline_version_description_;
     creation_time = creation_time_;
     pipeline_version_id = pipeline_version_id_;
     pipeline_arn = pipeline_arn_;
   }
    : pipeline_version_summary)

let make_list_pipeline_versions_response ?next_token:(next_token_ : next_token option)
    ?pipeline_version_summaries:(pipeline_version_summaries_ : pipeline_version_summary_list option)
    () =
  ({ next_token = next_token_; pipeline_version_summaries = pipeline_version_summaries_ }
    : list_pipeline_versions_response)

let make_list_pipeline_versions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?sort_order:(sort_order_ : sort_order option)
    ?created_before:(created_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option)
    ~pipeline_name:(pipeline_name_ : pipeline_name_or_arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     created_before = created_before_;
     created_after = created_after_;
     pipeline_name = pipeline_name_;
   }
    : list_pipeline_versions_request)

let make_pipeline_summary ?last_execution_time:(last_execution_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?role_arn:(role_arn_ : role_arn option)
    ?pipeline_description:(pipeline_description_ : pipeline_description option)
    ?pipeline_display_name:(pipeline_display_name_ : pipeline_name option)
    ?pipeline_name:(pipeline_name_ : pipeline_name option)
    ?pipeline_arn:(pipeline_arn_ : pipeline_arn option) () =
  ({
     last_execution_time = last_execution_time_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     role_arn = role_arn_;
     pipeline_description = pipeline_description_;
     pipeline_display_name = pipeline_display_name_;
     pipeline_name = pipeline_name_;
     pipeline_arn = pipeline_arn_;
   }
    : pipeline_summary)

let make_list_pipelines_response ?next_token:(next_token_ : next_token option)
    ?pipeline_summaries:(pipeline_summaries_ : pipeline_summary_list option) () =
  ({ next_token = next_token_; pipeline_summaries = pipeline_summaries_ } : list_pipelines_response)

let make_list_pipelines_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : sort_pipelines_by option)
    ?created_before:(created_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option)
    ?pipeline_name_prefix:(pipeline_name_prefix_ : pipeline_name option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     created_before = created_before_;
     created_after = created_after_;
     pipeline_name_prefix = pipeline_name_prefix_;
   }
    : list_pipelines_request)

let make_list_pipeline_parameters_for_execution_response
    ?next_token:(next_token_ : next_token option)
    ?pipeline_parameters:(pipeline_parameters_ : parameter_list option) () =
  ({ next_token = next_token_; pipeline_parameters = pipeline_parameters_ }
    : list_pipeline_parameters_for_execution_response)

let make_list_pipeline_parameters_for_execution_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     pipeline_execution_arn = pipeline_execution_arn_;
   }
    : list_pipeline_parameters_for_execution_request)

let make_processing_job_step_metadata ?arn:(arn_ : processing_job_arn option) () =
  ({ arn = arn_ } : processing_job_step_metadata)

let make_model_step_metadata ?arn:(arn_ : string256 option) () =
  ({ arn = arn_ } : model_step_metadata)

let make_register_model_step_metadata ?arn:(arn_ : string256 option) () =
  ({ arn = arn_ } : register_model_step_metadata)

let make_condition_step_metadata ?outcome:(outcome_ : condition_outcome option) () =
  ({ outcome = outcome_ } : condition_step_metadata)

let make_callback_step_metadata
    ?output_parameters:(output_parameters_ : output_parameter_list option)
    ?sqs_queue_url:(sqs_queue_url_ : string256 option)
    ?callback_token:(callback_token_ : callback_token option) () =
  ({
     output_parameters = output_parameters_;
     sqs_queue_url = sqs_queue_url_;
     callback_token = callback_token_;
   }
    : callback_step_metadata)

let make_lambda_step_metadata ?output_parameters:(output_parameters_ : output_parameter_list option)
    ?arn:(arn_ : string256 option) () =
  ({ output_parameters = output_parameters_; arn = arn_ } : lambda_step_metadata)

let make_emr_step_metadata ?log_file_path:(log_file_path_ : string1024 option)
    ?step_name:(step_name_ : string256 option) ?step_id:(step_id_ : string256 option)
    ?cluster_id:(cluster_id_ : string256 option) () =
  ({
     log_file_path = log_file_path_;
     step_name = step_name_;
     step_id = step_id_;
     cluster_id = cluster_id_;
   }
    : emr_step_metadata)

let make_quality_check_step_metadata
    ?register_new_baseline:(register_new_baseline_ : boolean_ option)
    ?skip_check:(skip_check_ : boolean_ option) ?check_job_arn:(check_job_arn_ : string256 option)
    ?violation_report:(violation_report_ : string1024 option)
    ?model_package_group_name:(model_package_group_name_ : string256 option)
    ?calculated_baseline_constraints:(calculated_baseline_constraints_ : string1024 option)
    ?calculated_baseline_statistics:(calculated_baseline_statistics_ : string1024 option)
    ?baseline_used_for_drift_check_constraints:
      (baseline_used_for_drift_check_constraints_ : string1024 option)
    ?baseline_used_for_drift_check_statistics:
      (baseline_used_for_drift_check_statistics_ : string1024 option)
    ?check_type:(check_type_ : string256 option) () =
  ({
     register_new_baseline = register_new_baseline_;
     skip_check = skip_check_;
     check_job_arn = check_job_arn_;
     violation_report = violation_report_;
     model_package_group_name = model_package_group_name_;
     calculated_baseline_constraints = calculated_baseline_constraints_;
     calculated_baseline_statistics = calculated_baseline_statistics_;
     baseline_used_for_drift_check_constraints = baseline_used_for_drift_check_constraints_;
     baseline_used_for_drift_check_statistics = baseline_used_for_drift_check_statistics_;
     check_type = check_type_;
   }
    : quality_check_step_metadata)

let make_clarify_check_step_metadata
    ?register_new_baseline:(register_new_baseline_ : boolean_ option)
    ?skip_check:(skip_check_ : boolean_ option) ?check_job_arn:(check_job_arn_ : string256 option)
    ?violation_report:(violation_report_ : string1024 option)
    ?model_package_group_name:(model_package_group_name_ : string256 option)
    ?calculated_baseline_constraints:(calculated_baseline_constraints_ : string1024 option)
    ?baseline_used_for_drift_check_constraints:
      (baseline_used_for_drift_check_constraints_ : string1024 option)
    ?check_type:(check_type_ : string256 option) () =
  ({
     register_new_baseline = register_new_baseline_;
     skip_check = skip_check_;
     check_job_arn = check_job_arn_;
     violation_report = violation_report_;
     model_package_group_name = model_package_group_name_;
     calculated_baseline_constraints = calculated_baseline_constraints_;
     baseline_used_for_drift_check_constraints = baseline_used_for_drift_check_constraints_;
     check_type = check_type_;
   }
    : clarify_check_step_metadata)

let make_fail_step_metadata ?error_message:(error_message_ : string3072 option) () =
  ({ error_message = error_message_ } : fail_step_metadata)

let make_auto_ml_job_step_metadata ?arn:(arn_ : auto_ml_job_arn option) () =
  ({ arn = arn_ } : auto_ml_job_step_metadata)

let make_endpoint_step_metadata ?arn:(arn_ : endpoint_arn option) () =
  ({ arn = arn_ } : endpoint_step_metadata)

let make_endpoint_config_step_metadata ?arn:(arn_ : endpoint_config_arn option) () =
  ({ arn = arn_ } : endpoint_config_step_metadata)

let make_bedrock_custom_model_metadata ?arn:(arn_ : string1024 option) () =
  ({ arn = arn_ } : bedrock_custom_model_metadata)

let make_bedrock_custom_model_deployment_metadata ?arn:(arn_ : string1024 option) () =
  ({ arn = arn_ } : bedrock_custom_model_deployment_metadata)

let make_bedrock_provisioned_model_throughput_metadata ?arn:(arn_ : string1024 option) () =
  ({ arn = arn_ } : bedrock_provisioned_model_throughput_metadata)

let make_bedrock_model_import_metadata ?arn:(arn_ : string1024 option) () =
  ({ arn = arn_ } : bedrock_model_import_metadata)

let make_inference_component_metadata ?arn:(arn_ : string2048 option) () =
  ({ arn = arn_ } : inference_component_metadata)

let make_association_info ~destination_arn:(destination_arn_ : string2048)
    ~source_arn:(source_arn_ : string2048) () =
  ({ destination_arn = destination_arn_; source_arn = source_arn_ } : association_info)

let make_lineage_metadata ?associations:(associations_ : association_info_list option)
    ?context_arns:(context_arns_ : map_string2048 option)
    ?artifact_arns:(artifact_arns_ : map_string2048 option)
    ?action_arns:(action_arns_ : map_string2048 option) () =
  ({
     associations = associations_;
     context_arns = context_arns_;
     artifact_arns = artifact_arns_;
     action_arns = action_arns_;
   }
    : lineage_metadata)

let make_job_step_metadata ?arn:(arn_ : string1024 option) () = ({ arn = arn_ } : job_step_metadata)

let make_pipeline_execution_step_metadata ?job:(job_ : job_step_metadata option)
    ?lineage:(lineage_ : lineage_metadata option)
    ?inference_component:(inference_component_ : inference_component_metadata option)
    ?bedrock_model_import:(bedrock_model_import_ : bedrock_model_import_metadata option)
    ?bedrock_provisioned_model_throughput:
      (bedrock_provisioned_model_throughput_ : bedrock_provisioned_model_throughput_metadata option)
    ?bedrock_custom_model_deployment:
      (bedrock_custom_model_deployment_ : bedrock_custom_model_deployment_metadata option)
    ?bedrock_custom_model:(bedrock_custom_model_ : bedrock_custom_model_metadata option)
    ?endpoint_config:(endpoint_config_ : endpoint_config_step_metadata option)
    ?endpoint:(endpoint_ : endpoint_step_metadata option)
    ?auto_ml_job:(auto_ml_job_ : auto_ml_job_step_metadata option)
    ?fail:(fail_ : fail_step_metadata option)
    ?clarify_check:(clarify_check_ : clarify_check_step_metadata option)
    ?quality_check:(quality_check_ : quality_check_step_metadata option)
    ?em_r:(em_r_ : emr_step_metadata option) ?lambda:(lambda_ : lambda_step_metadata option)
    ?callback:(callback_ : callback_step_metadata option)
    ?condition:(condition_ : condition_step_metadata option)
    ?register_model:(register_model_ : register_model_step_metadata option)
    ?model:(model_ : model_step_metadata option)
    ?tuning_job:(tuning_job_ : tuning_job_step_meta_data option)
    ?transform_job:(transform_job_ : transform_job_step_metadata option)
    ?processing_job:(processing_job_ : processing_job_step_metadata option)
    ?training_job:(training_job_ : training_job_step_metadata option) () =
  ({
     job = job_;
     lineage = lineage_;
     inference_component = inference_component_;
     bedrock_model_import = bedrock_model_import_;
     bedrock_provisioned_model_throughput = bedrock_provisioned_model_throughput_;
     bedrock_custom_model_deployment = bedrock_custom_model_deployment_;
     bedrock_custom_model = bedrock_custom_model_;
     endpoint_config = endpoint_config_;
     endpoint = endpoint_;
     auto_ml_job = auto_ml_job_;
     fail = fail_;
     clarify_check = clarify_check_;
     quality_check = quality_check_;
     em_r = em_r_;
     lambda = lambda_;
     callback = callback_;
     condition = condition_;
     register_model = register_model_;
     model = model_;
     tuning_job = tuning_job_;
     transform_job = transform_job_;
     processing_job = processing_job_;
     training_job = training_job_;
   }
    : pipeline_execution_step_metadata)

let make_pipeline_execution_step
    ?selective_execution_result:(selective_execution_result_ : selective_execution_result option)
    ?attempt_count:(attempt_count_ : integer option)
    ?metadata:(metadata_ : pipeline_execution_step_metadata option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?cache_hit_result:(cache_hit_result_ : cache_hit_result option)
    ?step_status:(step_status_ : step_status option) ?end_time:(end_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option)
    ?step_description:(step_description_ : step_description option)
    ?step_display_name:(step_display_name_ : step_display_name option)
    ?step_name:(step_name_ : step_name option) () =
  ({
     selective_execution_result = selective_execution_result_;
     attempt_count = attempt_count_;
     metadata = metadata_;
     failure_reason = failure_reason_;
     cache_hit_result = cache_hit_result_;
     step_status = step_status_;
     end_time = end_time_;
     start_time = start_time_;
     step_description = step_description_;
     step_display_name = step_display_name_;
     step_name = step_name_;
   }
    : pipeline_execution_step)

let make_list_pipeline_execution_steps_response ?next_token:(next_token_ : next_token option)
    ?pipeline_execution_steps:(pipeline_execution_steps_ : pipeline_execution_step_list option) () =
  ({ next_token = next_token_; pipeline_execution_steps = pipeline_execution_steps_ }
    : list_pipeline_execution_steps_response)

let make_list_pipeline_execution_steps_request ?sort_order:(sort_order_ : sort_order option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn option) () =
  ({
     sort_order = sort_order_;
     max_results = max_results_;
     next_token = next_token_;
     pipeline_execution_arn = pipeline_execution_arn_;
   }
    : list_pipeline_execution_steps_request)

let make_pipeline_execution_summary
    ?pipeline_execution_failure_reason:(pipeline_execution_failure_reason_ : string3072 option)
    ?pipeline_execution_display_name:
      (pipeline_execution_display_name_ : pipeline_execution_name option)
    ?pipeline_execution_description:
      (pipeline_execution_description_ : pipeline_execution_description option)
    ?pipeline_execution_status:(pipeline_execution_status_ : pipeline_execution_status option)
    ?start_time:(start_time_ : timestamp option)
    ?pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn option) () =
  ({
     pipeline_execution_failure_reason = pipeline_execution_failure_reason_;
     pipeline_execution_display_name = pipeline_execution_display_name_;
     pipeline_execution_description = pipeline_execution_description_;
     pipeline_execution_status = pipeline_execution_status_;
     start_time = start_time_;
     pipeline_execution_arn = pipeline_execution_arn_;
   }
    : pipeline_execution_summary)

let make_list_pipeline_executions_response ?next_token:(next_token_ : next_token option)
    ?pipeline_execution_summaries:
      (pipeline_execution_summaries_ : pipeline_execution_summary_list option) () =
  ({ next_token = next_token_; pipeline_execution_summaries = pipeline_execution_summaries_ }
    : list_pipeline_executions_response)

let make_list_pipeline_executions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : sort_pipeline_executions_by option)
    ?created_before:(created_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option)
    ~pipeline_name:(pipeline_name_ : pipeline_name_or_arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     created_before = created_before_;
     created_after = created_after_;
     pipeline_name = pipeline_name_;
   }
    : list_pipeline_executions_request)

let make_partner_app_summary ?creation_time:(creation_time_ : timestamp option)
    ?status:(status_ : partner_app_status option) ?type_:(type__ : partner_app_type option)
    ?name:(name_ : partner_app_name option) ?arn:(arn_ : partner_app_arn option) () =
  ({ creation_time = creation_time_; status = status_; type_ = type__; name = name_; arn = arn_ }
    : partner_app_summary)

let make_list_partner_apps_response ?next_token:(next_token_ : next_token option)
    ?summaries:(summaries_ : partner_app_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ } : list_partner_apps_response)

let make_list_partner_apps_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_partner_apps_request)

let make_optimization_job_summary
    ?max_instance_count:(max_instance_count_ : optimization_job_max_instance_count option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?optimization_end_time:(optimization_end_time_ : timestamp option)
    ?optimization_start_time:(optimization_start_time_ : timestamp option)
    ~optimization_types:(optimization_types_ : optimization_types)
    ~deployment_instance_type:
      (deployment_instance_type_ : optimization_job_deployment_instance_type)
    ~optimization_job_status:(optimization_job_status_ : optimization_job_status)
    ~creation_time:(creation_time_ : creation_time)
    ~optimization_job_arn:(optimization_job_arn_ : optimization_job_arn)
    ~optimization_job_name:(optimization_job_name_ : entity_name) () =
  ({
     optimization_types = optimization_types_;
     max_instance_count = max_instance_count_;
     deployment_instance_type = deployment_instance_type_;
     last_modified_time = last_modified_time_;
     optimization_end_time = optimization_end_time_;
     optimization_start_time = optimization_start_time_;
     optimization_job_status = optimization_job_status_;
     creation_time = creation_time_;
     optimization_job_arn = optimization_job_arn_;
     optimization_job_name = optimization_job_name_;
   }
    : optimization_job_summary)

let make_list_optimization_jobs_response ?next_token:(next_token_ : next_token option)
    ~optimization_job_summaries:(optimization_job_summaries_ : optimization_job_summaries) () =
  ({ next_token = next_token_; optimization_job_summaries = optimization_job_summaries_ }
    : list_optimization_jobs_response)

let make_list_optimization_jobs_request ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : list_optimization_jobs_sort_by option)
    ?status_equals:(status_equals_ : optimization_job_status option)
    ?name_contains:(name_contains_ : name_contains option)
    ?optimization_contains:(optimization_contains_ : name_contains option)
    ?last_modified_time_before:(last_modified_time_before_ : last_modified_time option)
    ?last_modified_time_after:(last_modified_time_after_ : last_modified_time option)
    ?creation_time_before:(creation_time_before_ : creation_time option)
    ?creation_time_after:(creation_time_after_ : creation_time option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     status_equals = status_equals_;
     name_contains = name_contains_;
     optimization_contains = optimization_contains_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_optimization_jobs_request)

let make_notebook_instance_summary
    ?additional_code_repositories:
      (additional_code_repositories_ : additional_code_repository_names_or_urls option)
    ?default_code_repository:(default_code_repository_ : code_repository_name_or_url option)
    ?notebook_instance_lifecycle_config_name:
      (notebook_instance_lifecycle_config_name_ : notebook_instance_lifecycle_config_name option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?creation_time:(creation_time_ : creation_time option)
    ?instance_type:(instance_type_ : instance_type option)
    ?url:(url_ : notebook_instance_url option)
    ?notebook_instance_status:(notebook_instance_status_ : notebook_instance_status option)
    ~notebook_instance_arn:(notebook_instance_arn_ : notebook_instance_arn)
    ~notebook_instance_name:(notebook_instance_name_ : notebook_instance_name) () =
  ({
     additional_code_repositories = additional_code_repositories_;
     default_code_repository = default_code_repository_;
     notebook_instance_lifecycle_config_name = notebook_instance_lifecycle_config_name_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     instance_type = instance_type_;
     url = url_;
     notebook_instance_status = notebook_instance_status_;
     notebook_instance_arn = notebook_instance_arn_;
     notebook_instance_name = notebook_instance_name_;
   }
    : notebook_instance_summary)

let make_list_notebook_instances_output
    ?notebook_instances:(notebook_instances_ : notebook_instance_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ notebook_instances = notebook_instances_; next_token = next_token_ }
    : list_notebook_instances_output)

let make_list_notebook_instances_input
    ?additional_code_repository_equals:
      (additional_code_repository_equals_ : code_repository_name_or_url option)
    ?default_code_repository_contains:
      (default_code_repository_contains_ : code_repository_contains option)
    ?notebook_instance_lifecycle_config_name_contains:
      (notebook_instance_lifecycle_config_name_contains_ :
         notebook_instance_lifecycle_config_name option)
    ?status_equals:(status_equals_ : notebook_instance_status option)
    ?last_modified_time_after:(last_modified_time_after_ : last_modified_time option)
    ?last_modified_time_before:(last_modified_time_before_ : last_modified_time option)
    ?creation_time_after:(creation_time_after_ : creation_time option)
    ?creation_time_before:(creation_time_before_ : creation_time option)
    ?name_contains:(name_contains_ : notebook_instance_name_contains option)
    ?sort_order:(sort_order_ : notebook_instance_sort_order option)
    ?sort_by:(sort_by_ : notebook_instance_sort_key option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     additional_code_repository_equals = additional_code_repository_equals_;
     default_code_repository_contains = default_code_repository_contains_;
     notebook_instance_lifecycle_config_name_contains =
       notebook_instance_lifecycle_config_name_contains_;
     status_equals = status_equals_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     name_contains = name_contains_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_notebook_instances_input)

let make_notebook_instance_lifecycle_config_summary
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?creation_time:(creation_time_ : creation_time option)
    ~notebook_instance_lifecycle_config_arn:
      (notebook_instance_lifecycle_config_arn_ : notebook_instance_lifecycle_config_arn)
    ~notebook_instance_lifecycle_config_name:
      (notebook_instance_lifecycle_config_name_ : notebook_instance_lifecycle_config_name) () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     notebook_instance_lifecycle_config_arn = notebook_instance_lifecycle_config_arn_;
     notebook_instance_lifecycle_config_name = notebook_instance_lifecycle_config_name_;
   }
    : notebook_instance_lifecycle_config_summary)

let make_list_notebook_instance_lifecycle_configs_output
    ?notebook_instance_lifecycle_configs:
      (notebook_instance_lifecycle_configs_ : notebook_instance_lifecycle_config_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     notebook_instance_lifecycle_configs = notebook_instance_lifecycle_configs_;
     next_token = next_token_;
   }
    : list_notebook_instance_lifecycle_configs_output)

let make_list_notebook_instance_lifecycle_configs_input
    ?last_modified_time_after:(last_modified_time_after_ : last_modified_time option)
    ?last_modified_time_before:(last_modified_time_before_ : last_modified_time option)
    ?creation_time_after:(creation_time_after_ : creation_time option)
    ?creation_time_before:(creation_time_before_ : creation_time option)
    ?name_contains:(name_contains_ : notebook_instance_lifecycle_config_name_contains option)
    ?sort_order:(sort_order_ : notebook_instance_lifecycle_config_sort_order option)
    ?sort_by:(sort_by_ : notebook_instance_lifecycle_config_sort_key option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     name_contains = name_contains_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_notebook_instance_lifecycle_configs_input)

let make_monitoring_schedule_summary ?monitoring_type:(monitoring_type_ : monitoring_type option)
    ?monitoring_job_definition_name:
      (monitoring_job_definition_name_ : monitoring_job_definition_name option)
    ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ~monitoring_schedule_status:(monitoring_schedule_status_ : schedule_status)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp)
    ~monitoring_schedule_arn:(monitoring_schedule_arn_ : monitoring_schedule_arn)
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name) () =
  ({
     monitoring_type = monitoring_type_;
     monitoring_job_definition_name = monitoring_job_definition_name_;
     endpoint_name = endpoint_name_;
     monitoring_schedule_status = monitoring_schedule_status_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     monitoring_schedule_arn = monitoring_schedule_arn_;
     monitoring_schedule_name = monitoring_schedule_name_;
   }
    : monitoring_schedule_summary)

let make_list_monitoring_schedules_response ?next_token:(next_token_ : next_token option)
    ~monitoring_schedule_summaries:
      (monitoring_schedule_summaries_ : monitoring_schedule_summary_list) () =
  ({ next_token = next_token_; monitoring_schedule_summaries = monitoring_schedule_summaries_ }
    : list_monitoring_schedules_response)

let make_list_monitoring_schedules_request
    ?monitoring_type_equals:(monitoring_type_equals_ : monitoring_type option)
    ?monitoring_job_definition_name:
      (monitoring_job_definition_name_ : monitoring_job_definition_name option)
    ?status_equals:(status_equals_ : schedule_status option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?name_contains:(name_contains_ : name_contains option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : monitoring_schedule_sort_key option)
    ?endpoint_name:(endpoint_name_ : endpoint_name option) () =
  ({
     monitoring_type_equals = monitoring_type_equals_;
     monitoring_job_definition_name = monitoring_job_definition_name_;
     status_equals = status_equals_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     name_contains = name_contains_;
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     endpoint_name = endpoint_name_;
   }
    : list_monitoring_schedules_request)

let make_list_monitoring_executions_response ?next_token:(next_token_ : next_token option)
    ~monitoring_execution_summaries:
      (monitoring_execution_summaries_ : monitoring_execution_summary_list) () =
  ({ next_token = next_token_; monitoring_execution_summaries = monitoring_execution_summaries_ }
    : list_monitoring_executions_response)

let make_list_monitoring_executions_request
    ?monitoring_type_equals:(monitoring_type_equals_ : monitoring_type option)
    ?monitoring_job_definition_name:
      (monitoring_job_definition_name_ : monitoring_job_definition_name option)
    ?status_equals:(status_equals_ : execution_status option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?scheduled_time_after:(scheduled_time_after_ : timestamp option)
    ?scheduled_time_before:(scheduled_time_before_ : timestamp option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : monitoring_execution_sort_key option)
    ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ?monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name option) () =
  ({
     monitoring_type_equals = monitoring_type_equals_;
     monitoring_job_definition_name = monitoring_job_definition_name_;
     status_equals = status_equals_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     scheduled_time_after = scheduled_time_after_;
     scheduled_time_before = scheduled_time_before_;
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     endpoint_name = endpoint_name_;
     monitoring_schedule_name = monitoring_schedule_name_;
   }
    : list_monitoring_executions_request)

let make_list_monitoring_alerts_response ?next_token:(next_token_ : next_token option)
    ?monitoring_alert_summaries:(monitoring_alert_summaries_ : monitoring_alert_summary_list option)
    () =
  ({ next_token = next_token_; monitoring_alert_summaries = monitoring_alert_summaries_ }
    : list_monitoring_alerts_response)

let make_list_monitoring_alerts_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     monitoring_schedule_name = monitoring_schedule_name_;
   }
    : list_monitoring_alerts_request)

let make_monitoring_alert_history_summary ~alert_status:(alert_status_ : monitoring_alert_status)
    ~creation_time:(creation_time_ : timestamp)
    ~monitoring_alert_name:(monitoring_alert_name_ : monitoring_alert_name)
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name) () =
  ({
     alert_status = alert_status_;
     creation_time = creation_time_;
     monitoring_alert_name = monitoring_alert_name_;
     monitoring_schedule_name = monitoring_schedule_name_;
   }
    : monitoring_alert_history_summary)

let make_list_monitoring_alert_history_response ?next_token:(next_token_ : next_token option)
    ?monitoring_alert_history:(monitoring_alert_history_ : monitoring_alert_history_list option) ()
    =
  ({ next_token = next_token_; monitoring_alert_history = monitoring_alert_history_ }
    : list_monitoring_alert_history_response)

let make_list_monitoring_alert_history_request
    ?status_equals:(status_equals_ : monitoring_alert_status option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : monitoring_alert_history_sort_key option)
    ?monitoring_alert_name:(monitoring_alert_name_ : monitoring_alert_name option)
    ?monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name option) () =
  ({
     status_equals = status_equals_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     monitoring_alert_name = monitoring_alert_name_;
     monitoring_schedule_name = monitoring_schedule_name_;
   }
    : list_monitoring_alert_history_request)

let make_model_summary ~creation_time:(creation_time_ : timestamp)
    ~model_arn:(model_arn_ : model_arn) ~model_name:(model_name_ : model_name) () =
  ({ creation_time = creation_time_; model_arn = model_arn_; model_name = model_name_ }
    : model_summary)

let make_list_models_output ?next_token:(next_token_ : pagination_token option)
    ~models:(models_ : model_summary_list) () =
  ({ next_token = next_token_; models = models_ } : list_models_output)

let make_list_models_input ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?name_contains:(name_contains_ : model_name_contains option)
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) ?sort_order:(sort_order_ : order_key option)
    ?sort_by:(sort_by_ : model_sort_key option) () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     name_contains = name_contains_;
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
   }
    : list_models_input)

let make_monitoring_job_definition_summary ~endpoint_name:(endpoint_name_ : endpoint_name)
    ~creation_time:(creation_time_ : timestamp)
    ~monitoring_job_definition_arn:(monitoring_job_definition_arn_ : monitoring_job_definition_arn)
    ~monitoring_job_definition_name:
      (monitoring_job_definition_name_ : monitoring_job_definition_name) () =
  ({
     endpoint_name = endpoint_name_;
     creation_time = creation_time_;
     monitoring_job_definition_arn = monitoring_job_definition_arn_;
     monitoring_job_definition_name = monitoring_job_definition_name_;
   }
    : monitoring_job_definition_summary)

let make_list_model_quality_job_definitions_response ?next_token:(next_token_ : next_token option)
    ~job_definition_summaries:(job_definition_summaries_ : monitoring_job_definition_summary_list)
    () =
  ({ next_token = next_token_; job_definition_summaries = job_definition_summaries_ }
    : list_model_quality_job_definitions_response)

let make_list_model_quality_job_definitions_request
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?name_contains:(name_contains_ : name_contains option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : monitoring_job_definition_sort_key option)
    ?endpoint_name:(endpoint_name_ : endpoint_name option) () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     name_contains = name_contains_;
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     endpoint_name = endpoint_name_;
   }
    : list_model_quality_job_definitions_request)

let make_model_package_summary
    ?model_package_registration_type:
      (model_package_registration_type_ : model_package_registration_type option)
    ?model_life_cycle:(model_life_cycle_ : model_life_cycle option)
    ?model_approval_status:(model_approval_status_ : model_approval_status option)
    ?model_package_description:(model_package_description_ : entity_description option)
    ?model_package_version:(model_package_version_ : model_package_version option)
    ?model_package_group_name:(model_package_group_name_ : entity_name option)
    ?model_package_name:(model_package_name_ : entity_name option)
    ~model_package_status:(model_package_status_ : model_package_status)
    ~creation_time:(creation_time_ : creation_time)
    ~model_package_arn:(model_package_arn_ : model_package_arn) () =
  ({
     model_package_registration_type = model_package_registration_type_;
     model_life_cycle = model_life_cycle_;
     model_approval_status = model_approval_status_;
     model_package_status = model_package_status_;
     creation_time = creation_time_;
     model_package_description = model_package_description_;
     model_package_arn = model_package_arn_;
     model_package_version = model_package_version_;
     model_package_group_name = model_package_group_name_;
     model_package_name = model_package_name_;
   }
    : model_package_summary)

let make_list_model_packages_output ?next_token:(next_token_ : next_token option)
    ~model_package_summary_list:(model_package_summary_list_ : model_package_summary_list) () =
  ({ next_token = next_token_; model_package_summary_list = model_package_summary_list_ }
    : list_model_packages_output)

let make_list_model_packages_input ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : model_package_sort_by option) ?next_token:(next_token_ : next_token option)
    ?model_package_type:(model_package_type_ : model_package_type option)
    ?model_package_group_name:(model_package_group_name_ : arn_or_name option)
    ?model_approval_status:(model_approval_status_ : model_approval_status option)
    ?name_contains:(name_contains_ : name_contains option)
    ?max_results:(max_results_ : max_results option)
    ?creation_time_before:(creation_time_before_ : creation_time option)
    ?creation_time_after:(creation_time_after_ : creation_time option) () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     next_token = next_token_;
     model_package_type = model_package_type_;
     model_package_group_name = model_package_group_name_;
     model_approval_status = model_approval_status_;
     name_contains = name_contains_;
     max_results = max_results_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_model_packages_input)

let make_managed_configuration
    ?managed_storage_type:(managed_storage_type_ : managed_storage_type option) () =
  ({ managed_storage_type = managed_storage_type_ } : managed_configuration)

let make_model_package_group_summary
    ?managed_configuration:(managed_configuration_ : managed_configuration option)
    ?model_package_group_description:(model_package_group_description_ : entity_description option)
    ~model_package_group_status:(model_package_group_status_ : model_package_group_status)
    ~creation_time:(creation_time_ : creation_time)
    ~model_package_group_arn:(model_package_group_arn_ : model_package_group_arn)
    ~model_package_group_name:(model_package_group_name_ : entity_name) () =
  ({
     managed_configuration = managed_configuration_;
     model_package_group_status = model_package_group_status_;
     creation_time = creation_time_;
     model_package_group_description = model_package_group_description_;
     model_package_group_arn = model_package_group_arn_;
     model_package_group_name = model_package_group_name_;
   }
    : model_package_group_summary)

let make_list_model_package_groups_output ?next_token:(next_token_ : next_token option)
    ~model_package_group_summary_list:
      (model_package_group_summary_list_ : model_package_group_summary_list) () =
  ({
     next_token = next_token_;
     model_package_group_summary_list = model_package_group_summary_list_;
   }
    : list_model_package_groups_output)

let make_list_model_package_groups_input
    ?cross_account_filter_option:(cross_account_filter_option_ : cross_account_filter_option option)
    ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : model_package_group_sort_by option)
    ?next_token:(next_token_ : next_token option)
    ?name_contains:(name_contains_ : name_contains option)
    ?max_results:(max_results_ : max_results option)
    ?creation_time_before:(creation_time_before_ : creation_time option)
    ?creation_time_after:(creation_time_after_ : creation_time option) () =
  ({
     cross_account_filter_option = cross_account_filter_option_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     next_token = next_token_;
     name_contains = name_contains_;
     max_results = max_results_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_model_package_groups_input)

let make_model_metadata_summary ~framework_version:(framework_version_ : string_)
    ~model:(model_ : string_) ~task:(task_ : string_) ~framework:(framework_ : string_)
    ~domain:(domain_ : string_) () =
  ({
     framework_version = framework_version_;
     model = model_;
     task = task_;
     framework = framework_;
     domain = domain_;
   }
    : model_metadata_summary)

let make_list_model_metadata_response ?next_token:(next_token_ : next_token option)
    ~model_metadata_summaries:(model_metadata_summaries_ : model_metadata_summaries) () =
  ({ next_token = next_token_; model_metadata_summaries = model_metadata_summaries_ }
    : list_model_metadata_response)

let make_model_metadata_filter ~value:(value_ : string256)
    ~name:(name_ : model_metadata_filter_type) () =
  ({ value = value_; name = name_ } : model_metadata_filter)

let make_model_metadata_search_expression ?filters:(filters_ : model_metadata_filters option) () =
  ({ filters = filters_ } : model_metadata_search_expression)

let make_list_model_metadata_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?search_expression:(search_expression_ : model_metadata_search_expression option) () =
  ({ max_results = max_results_; next_token = next_token_; search_expression = search_expression_ }
    : list_model_metadata_request)

let make_list_model_explainability_job_definitions_response
    ?next_token:(next_token_ : next_token option)
    ~job_definition_summaries:(job_definition_summaries_ : monitoring_job_definition_summary_list)
    () =
  ({ next_token = next_token_; job_definition_summaries = job_definition_summaries_ }
    : list_model_explainability_job_definitions_response)

let make_list_model_explainability_job_definitions_request
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?name_contains:(name_contains_ : name_contains option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : monitoring_job_definition_sort_key option)
    ?endpoint_name:(endpoint_name_ : endpoint_name option) () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     name_contains = name_contains_;
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     endpoint_name = endpoint_name_;
   }
    : list_model_explainability_job_definitions_request)

let make_model_card_version_summary ?last_modified_time:(last_modified_time_ : timestamp option)
    ~creation_time:(creation_time_ : timestamp) ~model_card_version:(model_card_version_ : integer)
    ~model_card_status:(model_card_status_ : model_card_status)
    ~model_card_arn:(model_card_arn_ : model_card_arn)
    ~model_card_name:(model_card_name_ : entity_name) () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     model_card_version = model_card_version_;
     model_card_status = model_card_status_;
     model_card_arn = model_card_arn_;
     model_card_name = model_card_name_;
   }
    : model_card_version_summary)

let make_list_model_card_versions_response ?next_token:(next_token_ : next_token option)
    ~model_card_version_summary_list:
      (model_card_version_summary_list_ : model_card_version_summary_list) () =
  ({ next_token = next_token_; model_card_version_summary_list = model_card_version_summary_list_ }
    : list_model_card_versions_response)

let make_list_model_card_versions_request ?sort_order:(sort_order_ : model_card_sort_order option)
    ?sort_by:(sort_by_ : model_card_version_sort_by option)
    ?next_token:(next_token_ : next_token option)
    ?model_card_status:(model_card_status_ : model_card_status option)
    ?max_results:(max_results_ : max_results option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ~model_card_name:(model_card_name_ : model_card_name_or_arn) () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     next_token = next_token_;
     model_card_status = model_card_status_;
     model_card_name = model_card_name_;
     max_results = max_results_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_model_card_versions_request)

let make_model_card_summary ?last_modified_time:(last_modified_time_ : timestamp option)
    ~creation_time:(creation_time_ : timestamp)
    ~model_card_status:(model_card_status_ : model_card_status)
    ~model_card_arn:(model_card_arn_ : model_card_arn)
    ~model_card_name:(model_card_name_ : entity_name) () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     model_card_status = model_card_status_;
     model_card_arn = model_card_arn_;
     model_card_name = model_card_name_;
   }
    : model_card_summary)

let make_list_model_cards_response ?next_token:(next_token_ : next_token option)
    ~model_card_summaries:(model_card_summaries_ : model_card_summary_list) () =
  ({ next_token = next_token_; model_card_summaries = model_card_summaries_ }
    : list_model_cards_response)

let make_list_model_cards_request ?sort_order:(sort_order_ : model_card_sort_order option)
    ?sort_by:(sort_by_ : model_card_sort_by option) ?next_token:(next_token_ : next_token option)
    ?model_card_status:(model_card_status_ : model_card_status option)
    ?name_contains:(name_contains_ : entity_name option)
    ?max_results:(max_results_ : max_results option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option) () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     next_token = next_token_;
     model_card_status = model_card_status_;
     name_contains = name_contains_;
     max_results = max_results_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_model_cards_request)

let make_model_card_export_job_summary ~last_modified_at:(last_modified_at_ : timestamp)
    ~created_at:(created_at_ : timestamp) ~model_card_version:(model_card_version_ : integer)
    ~model_card_name:(model_card_name_ : entity_name)
    ~status:(status_ : model_card_export_job_status)
    ~model_card_export_job_arn:(model_card_export_job_arn_ : model_card_export_job_arn)
    ~model_card_export_job_name:(model_card_export_job_name_ : entity_name) () =
  ({
     last_modified_at = last_modified_at_;
     created_at = created_at_;
     model_card_version = model_card_version_;
     model_card_name = model_card_name_;
     status = status_;
     model_card_export_job_arn = model_card_export_job_arn_;
     model_card_export_job_name = model_card_export_job_name_;
   }
    : model_card_export_job_summary)

let make_list_model_card_export_jobs_response ?next_token:(next_token_ : next_token option)
    ~model_card_export_job_summaries:
      (model_card_export_job_summaries_ : model_card_export_job_summary_list) () =
  ({ next_token = next_token_; model_card_export_job_summaries = model_card_export_job_summaries_ }
    : list_model_card_export_jobs_response)

let make_list_model_card_export_jobs_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?sort_order:(sort_order_ : model_card_export_job_sort_order option)
    ?sort_by:(sort_by_ : model_card_export_job_sort_by option)
    ?status_equals:(status_equals_ : model_card_export_job_status option)
    ?model_card_export_job_name_contains:(model_card_export_job_name_contains_ : entity_name option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?model_card_version:(model_card_version_ : integer option)
    ~model_card_name:(model_card_name_ : entity_name) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     status_equals = status_equals_;
     model_card_export_job_name_contains = model_card_export_job_name_contains_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     model_card_version = model_card_version_;
     model_card_name = model_card_name_;
   }
    : list_model_card_export_jobs_request)

let make_list_model_bias_job_definitions_response ?next_token:(next_token_ : next_token option)
    ~job_definition_summaries:(job_definition_summaries_ : monitoring_job_definition_summary_list)
    () =
  ({ next_token = next_token_; job_definition_summaries = job_definition_summaries_ }
    : list_model_bias_job_definitions_response)

let make_list_model_bias_job_definitions_request
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?name_contains:(name_contains_ : name_contains option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : monitoring_job_definition_sort_key option)
    ?endpoint_name:(endpoint_name_ : endpoint_name option) () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     name_contains = name_contains_;
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     endpoint_name = endpoint_name_;
   }
    : list_model_bias_job_definitions_request)

let make_list_mlflow_tracking_servers_response ?next_token:(next_token_ : next_token option)
    ?tracking_server_summaries:(tracking_server_summaries_ : tracking_server_summary_list option) ()
    =
  ({ next_token = next_token_; tracking_server_summaries = tracking_server_summaries_ }
    : list_mlflow_tracking_servers_response)

let make_list_mlflow_tracking_servers_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : sort_tracking_server_by option)
    ?mlflow_version:(mlflow_version_ : mlflow_version option)
    ?tracking_server_status:(tracking_server_status_ : tracking_server_status option)
    ?created_before:(created_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     mlflow_version = mlflow_version_;
     tracking_server_status = tracking_server_status_;
     created_before = created_before_;
     created_after = created_after_;
   }
    : list_mlflow_tracking_servers_request)

let make_mlflow_app_summary ?mlflow_version:(mlflow_version_ : mlflow_version option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?status:(status_ : mlflow_app_status option)
    ?name:(name_ : mlflow_app_name option) ?arn:(arn_ : mlflow_app_arn option) () =
  ({
     mlflow_version = mlflow_version_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     status = status_;
     name = name_;
     arn = arn_;
   }
    : mlflow_app_summary)

let make_list_mlflow_apps_response ?next_token:(next_token_ : next_token option)
    ?summaries:(summaries_ : mlflow_app_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ } : list_mlflow_apps_response)

let make_list_mlflow_apps_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : sort_mlflow_app_by option)
    ?account_default_status:(account_default_status_ : account_default_status option)
    ?default_for_domain_id:(default_for_domain_id_ : string_ option)
    ?mlflow_version:(mlflow_version_ : mlflow_version option)
    ?status:(status_ : mlflow_app_status option)
    ?created_before:(created_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     account_default_status = account_default_status_;
     default_for_domain_id = default_for_domain_id_;
     mlflow_version = mlflow_version_;
     status = status_;
     created_before = created_before_;
     created_after = created_after_;
   }
    : list_mlflow_apps_request)

let make_lineage_group_summary ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?lineage_group_name:(lineage_group_name_ : experiment_entity_name option)
    ?lineage_group_arn:(lineage_group_arn_ : lineage_group_arn option) () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     display_name = display_name_;
     lineage_group_name = lineage_group_name_;
     lineage_group_arn = lineage_group_arn_;
   }
    : lineage_group_summary)

let make_list_lineage_groups_response ?next_token:(next_token_ : next_token option)
    ?lineage_group_summaries:(lineage_group_summaries_ : lineage_group_summaries option) () =
  ({ next_token = next_token_; lineage_group_summaries = lineage_group_summaries_ }
    : list_lineage_groups_response)

let make_list_lineage_groups_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : sort_lineage_groups_by option)
    ?created_before:(created_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     created_before = created_before_;
     created_after = created_after_;
   }
    : list_lineage_groups_request)

let make_label_counters_for_workteam ?total:(total_ : label_counter option)
    ?pending_human:(pending_human_ : label_counter option)
    ?human_labeled:(human_labeled_ : label_counter option) () =
  ({ total = total_; pending_human = pending_human_; human_labeled = human_labeled_ }
    : label_counters_for_workteam)

let make_labeling_job_for_workteam_summary
    ?number_of_human_workers_per_data_object:
      (number_of_human_workers_per_data_object_ : number_of_human_workers_per_data_object option)
    ?label_counters:(label_counters_ : label_counters_for_workteam option)
    ?labeling_job_name:(labeling_job_name_ : labeling_job_name option)
    ~creation_time:(creation_time_ : timestamp)
    ~work_requester_account_id:(work_requester_account_id_ : account_id)
    ~job_reference_code:(job_reference_code_ : job_reference_code) () =
  ({
     number_of_human_workers_per_data_object = number_of_human_workers_per_data_object_;
     label_counters = label_counters_;
     creation_time = creation_time_;
     work_requester_account_id = work_requester_account_id_;
     job_reference_code = job_reference_code_;
     labeling_job_name = labeling_job_name_;
   }
    : labeling_job_for_workteam_summary)

let make_list_labeling_jobs_for_workteam_response ?next_token:(next_token_ : next_token option)
    ~labeling_job_summary_list:(labeling_job_summary_list_ : labeling_job_for_workteam_summary_list)
    () =
  ({ next_token = next_token_; labeling_job_summary_list = labeling_job_summary_list_ }
    : list_labeling_jobs_for_workteam_response)

let make_list_labeling_jobs_for_workteam_request ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : list_labeling_jobs_for_workteam_sort_by_options option)
    ?job_reference_code_contains:(job_reference_code_contains_ : job_reference_code_contains option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~workteam_arn:(workteam_arn_ : workteam_arn) () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     job_reference_code_contains = job_reference_code_contains_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     next_token = next_token_;
     max_results = max_results_;
     workteam_arn = workteam_arn_;
   }
    : list_labeling_jobs_for_workteam_request)

let make_label_counters ?unlabeled:(unlabeled_ : label_counter option)
    ?failed_non_retryable_error:(failed_non_retryable_error_ : label_counter option)
    ?machine_labeled:(machine_labeled_ : label_counter option)
    ?human_labeled:(human_labeled_ : label_counter option)
    ?total_labeled:(total_labeled_ : label_counter option) () =
  ({
     unlabeled = unlabeled_;
     failed_non_retryable_error = failed_non_retryable_error_;
     machine_labeled = machine_labeled_;
     human_labeled = human_labeled_;
     total_labeled = total_labeled_;
   }
    : label_counters)

let make_labeling_job_output
    ?final_active_learning_model_arn:(final_active_learning_model_arn_ : model_arn option)
    ~output_dataset_s3_uri:(output_dataset_s3_uri_ : s3_uri) () =
  ({
     final_active_learning_model_arn = final_active_learning_model_arn_;
     output_dataset_s3_uri = output_dataset_s3_uri_;
   }
    : labeling_job_output)

let make_labeling_job_s3_data_source ~manifest_s3_uri:(manifest_s3_uri_ : s3_uri) () =
  ({ manifest_s3_uri = manifest_s3_uri_ } : labeling_job_s3_data_source)

let make_labeling_job_sns_data_source ~sns_topic_arn:(sns_topic_arn_ : sns_topic_arn) () =
  ({ sns_topic_arn = sns_topic_arn_ } : labeling_job_sns_data_source)

let make_labeling_job_data_source
    ?sns_data_source:(sns_data_source_ : labeling_job_sns_data_source option)
    ?s3_data_source:(s3_data_source_ : labeling_job_s3_data_source option) () =
  ({ sns_data_source = sns_data_source_; s3_data_source = s3_data_source_ }
    : labeling_job_data_source)

let make_labeling_job_data_attributes
    ?content_classifiers:(content_classifiers_ : content_classifiers option) () =
  ({ content_classifiers = content_classifiers_ } : labeling_job_data_attributes)

let make_labeling_job_input_config
    ?data_attributes:(data_attributes_ : labeling_job_data_attributes option)
    ~data_source:(data_source_ : labeling_job_data_source) () =
  ({ data_attributes = data_attributes_; data_source = data_source_ } : labeling_job_input_config)

let make_labeling_job_summary ?input_config:(input_config_ : labeling_job_input_config option)
    ?labeling_job_output:(labeling_job_output_ : labeling_job_output option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?annotation_consolidation_lambda_arn:
      (annotation_consolidation_lambda_arn_ : lambda_function_arn option)
    ?pre_human_task_lambda_arn:(pre_human_task_lambda_arn_ : lambda_function_arn option)
    ~workteam_arn:(workteam_arn_ : workteam_arn) ~label_counters:(label_counters_ : label_counters)
    ~labeling_job_status:(labeling_job_status_ : labeling_job_status)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp)
    ~labeling_job_arn:(labeling_job_arn_ : labeling_job_arn)
    ~labeling_job_name:(labeling_job_name_ : labeling_job_name) () =
  ({
     input_config = input_config_;
     labeling_job_output = labeling_job_output_;
     failure_reason = failure_reason_;
     annotation_consolidation_lambda_arn = annotation_consolidation_lambda_arn_;
     pre_human_task_lambda_arn = pre_human_task_lambda_arn_;
     workteam_arn = workteam_arn_;
     label_counters = label_counters_;
     labeling_job_status = labeling_job_status_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     labeling_job_arn = labeling_job_arn_;
     labeling_job_name = labeling_job_name_;
   }
    : labeling_job_summary)

let make_list_labeling_jobs_response ?next_token:(next_token_ : next_token option)
    ?labeling_job_summary_list:(labeling_job_summary_list_ : labeling_job_summary_list option) () =
  ({ next_token = next_token_; labeling_job_summary_list = labeling_job_summary_list_ }
    : list_labeling_jobs_response)

let make_list_labeling_jobs_request ?status_equals:(status_equals_ : labeling_job_status option)
    ?sort_order:(sort_order_ : sort_order option) ?sort_by:(sort_by_ : sort_by option)
    ?name_contains:(name_contains_ : name_contains option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option) () =
  ({
     status_equals = status_equals_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     name_contains = name_contains_;
     next_token = next_token_;
     max_results = max_results_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_labeling_jobs_request)

let make_job_config_schema_version_summary
    ~job_config_schema_version:(job_config_schema_version_ : job_schema_version) () =
  ({ job_config_schema_version = job_config_schema_version_ } : job_config_schema_version_summary)

let make_list_job_schema_versions_response ?next_token:(next_token_ : next_token option)
    ~job_config_schemas:(job_config_schemas_ : job_config_schemas) () =
  ({ job_config_schemas = job_config_schemas_; next_token = next_token_ }
    : list_job_schema_versions_response)

let make_list_job_schema_versions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~job_category:(job_category_ : job_category) () =
  ({ max_results = max_results_; next_token = next_token_; job_category = job_category_ }
    : list_job_schema_versions_request)

let make_job_summary ?end_time:(end_time_ : timestamp option)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp)
    ~job_secondary_status:(job_secondary_status_ : job_secondary_status)
    ~job_status:(job_status_ : job_status) ~job_category:(job_category_ : job_category)
    ~job_name:(job_name_ : job_name) ~job_arn:(job_arn_ : job_arn) () =
  ({
     end_time = end_time_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     job_secondary_status = job_secondary_status_;
     job_status = job_status_;
     job_category = job_category_;
     job_name = job_name_;
     job_arn = job_arn_;
   }
    : job_summary)

let make_list_jobs_response ?next_token:(next_token_ : next_token option)
    ~job_summaries:(job_summaries_ : job_summaries) () =
  ({ job_summaries = job_summaries_; next_token = next_token_ } : list_jobs_response)

let make_list_jobs_request ?status_equals:(status_equals_ : job_status option)
    ?sort_order:(sort_order_ : sort_order option) ?sort_by:(sort_by_ : sort_by option)
    ?name_contains:(name_contains_ : name_contains option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~job_category:(job_category_ : job_category) () =
  ({
     status_equals = status_equals_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     name_contains = name_contains_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     max_results = max_results_;
     next_token = next_token_;
     job_category = job_category_;
   }
    : list_jobs_request)

let make_recommendation_metrics ?model_setup_time:(model_setup_time_ : model_setup_time option)
    ?memory_utilization:(memory_utilization_ : utilization_metric option)
    ?cpu_utilization:(cpu_utilization_ : utilization_metric option)
    ?model_latency:(model_latency_ : integer option)
    ?max_invocations:(max_invocations_ : integer option)
    ?cost_per_inference:(cost_per_inference_ : float_ option)
    ?cost_per_hour:(cost_per_hour_ : float_ option) () =
  ({
     model_setup_time = model_setup_time_;
     memory_utilization = memory_utilization_;
     cpu_utilization = cpu_utilization_;
     model_latency = model_latency_;
     max_invocations = max_invocations_;
     cost_per_inference = cost_per_inference_;
     cost_per_hour = cost_per_hour_;
   }
    : recommendation_metrics)

let make_inference_metrics ~model_latency:(model_latency_ : integer)
    ~max_invocations:(max_invocations_ : integer) () =
  ({ model_latency = model_latency_; max_invocations = max_invocations_ } : inference_metrics)

let make_endpoint_output_configuration
    ?serverless_config:(serverless_config_ : production_variant_serverless_config option)
    ?initial_instance_count:(initial_instance_count_ : initial_instance_count option)
    ?instance_type:(instance_type_ : production_variant_instance_type option)
    ~variant_name:(variant_name_ : string_) ~endpoint_name:(endpoint_name_ : string_) () =
  ({
     serverless_config = serverless_config_;
     initial_instance_count = initial_instance_count_;
     instance_type = instance_type_;
     variant_name = variant_name_;
     endpoint_name = endpoint_name_;
   }
    : endpoint_output_configuration)

let make_environment_parameter ~value:(value_ : string_) ~value_type:(value_type_ : string_)
    ~key:(key_ : string_) () =
  ({ value = value_; value_type = value_type_; key = key_ } : environment_parameter)

let make_model_configuration
    ?compilation_job_name:(compilation_job_name_ : recommendation_job_compilation_job_name option)
    ?environment_parameters:(environment_parameters_ : environment_parameters option)
    ?inference_specification_name:
      (inference_specification_name_ : inference_specification_name option) () =
  ({
     compilation_job_name = compilation_job_name_;
     environment_parameters = environment_parameters_;
     inference_specification_name = inference_specification_name_;
   }
    : model_configuration)

let make_recommendation_job_inference_benchmark
    ?invocation_start_time:(invocation_start_time_ : invocation_start_time option)
    ?invocation_end_time:(invocation_end_time_ : invocation_end_time option)
    ?failure_reason:(failure_reason_ : recommendation_failure_reason option)
    ?endpoint_configuration:(endpoint_configuration_ : endpoint_output_configuration option)
    ?endpoint_metrics:(endpoint_metrics_ : inference_metrics option)
    ?metrics:(metrics_ : recommendation_metrics option)
    ~model_configuration:(model_configuration_ : model_configuration) () =
  ({
     invocation_start_time = invocation_start_time_;
     invocation_end_time = invocation_end_time_;
     failure_reason = failure_reason_;
     model_configuration = model_configuration_;
     endpoint_configuration = endpoint_configuration_;
     endpoint_metrics = endpoint_metrics_;
     metrics = metrics_;
   }
    : recommendation_job_inference_benchmark)

let make_inference_recommendations_job_step
    ?inference_benchmark:(inference_benchmark_ : recommendation_job_inference_benchmark option)
    ~status:(status_ : recommendation_job_status) ~job_name:(job_name_ : recommendation_job_name)
    ~step_type:(step_type_ : recommendation_step_type) () =
  ({
     inference_benchmark = inference_benchmark_;
     status = status_;
     job_name = job_name_;
     step_type = step_type_;
   }
    : inference_recommendations_job_step)

let make_list_inference_recommendations_job_steps_response
    ?next_token:(next_token_ : next_token option)
    ?steps:(steps_ : inference_recommendations_job_steps option) () =
  ({ next_token = next_token_; steps = steps_ } : list_inference_recommendations_job_steps_response)

let make_list_inference_recommendations_job_steps_request
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?step_type:(step_type_ : recommendation_step_type option)
    ?status:(status_ : recommendation_job_status option)
    ~job_name:(job_name_ : recommendation_job_name) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     step_type = step_type_;
     status = status_;
     job_name = job_name_;
   }
    : list_inference_recommendations_job_steps_request)

let make_inference_recommendations_job
    ?model_package_version_arn:(model_package_version_arn_ : model_package_arn option)
    ?sample_payload_url:(sample_payload_url_ : s3_uri option)
    ?model_name:(model_name_ : model_name option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?completion_time:(completion_time_ : timestamp option)
    ~last_modified_time:(last_modified_time_ : last_modified_time) ~role_arn:(role_arn_ : role_arn)
    ~creation_time:(creation_time_ : creation_time) ~status:(status_ : recommendation_job_status)
    ~job_arn:(job_arn_ : recommendation_job_arn) ~job_type:(job_type_ : recommendation_job_type)
    ~job_description:(job_description_ : recommendation_job_description)
    ~job_name:(job_name_ : recommendation_job_name) () =
  ({
     model_package_version_arn = model_package_version_arn_;
     sample_payload_url = sample_payload_url_;
     model_name = model_name_;
     failure_reason = failure_reason_;
     last_modified_time = last_modified_time_;
     role_arn = role_arn_;
     completion_time = completion_time_;
     creation_time = creation_time_;
     status = status_;
     job_arn = job_arn_;
     job_type = job_type_;
     job_description = job_description_;
     job_name = job_name_;
   }
    : inference_recommendations_job)

let make_list_inference_recommendations_jobs_response ?next_token:(next_token_ : next_token option)
    ~inference_recommendations_jobs:
      (inference_recommendations_jobs_ : inference_recommendations_jobs) () =
  ({ next_token = next_token_; inference_recommendations_jobs = inference_recommendations_jobs_ }
    : list_inference_recommendations_jobs_response)

let make_list_inference_recommendations_jobs_request
    ?model_package_version_arn_equals:(model_package_version_arn_equals_ : model_package_arn option)
    ?model_name_equals:(model_name_equals_ : model_name option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : list_inference_recommendations_jobs_sort_by option)
    ?status_equals:(status_equals_ : recommendation_job_status option)
    ?name_contains:(name_contains_ : name_contains option)
    ?last_modified_time_before:(last_modified_time_before_ : last_modified_time option)
    ?last_modified_time_after:(last_modified_time_after_ : last_modified_time option)
    ?creation_time_before:(creation_time_before_ : creation_time option)
    ?creation_time_after:(creation_time_after_ : creation_time option) () =
  ({
     model_package_version_arn_equals = model_package_version_arn_equals_;
     model_name_equals = model_name_equals_;
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     status_equals = status_equals_;
     name_contains = name_contains_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_inference_recommendations_jobs_request)

let make_inference_experiment_summary ?role_arn:(role_arn_ : role_arn option)
    ?completion_time:(completion_time_ : timestamp option)
    ?description:(description_ : inference_experiment_description option)
    ?status_reason:(status_reason_ : inference_experiment_status_reason option)
    ?schedule:(schedule_ : inference_experiment_schedule option)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp) ~status:(status_ : inference_experiment_status)
    ~type_:(type__ : inference_experiment_type) ~name:(name_ : inference_experiment_name) () =
  ({
     role_arn = role_arn_;
     last_modified_time = last_modified_time_;
     completion_time = completion_time_;
     creation_time = creation_time_;
     description = description_;
     status_reason = status_reason_;
     status = status_;
     schedule = schedule_;
     type_ = type__;
     name = name_;
   }
    : inference_experiment_summary)

let make_list_inference_experiments_response ?next_token:(next_token_ : next_token option)
    ?inference_experiments:(inference_experiments_ : inference_experiment_list option) () =
  ({ next_token = next_token_; inference_experiments = inference_experiments_ }
    : list_inference_experiments_response)

let make_list_inference_experiments_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : sort_inference_experiments_by option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?status_equals:(status_equals_ : inference_experiment_status option)
    ?type_:(type__ : inference_experiment_type option)
    ?name_contains:(name_contains_ : name_contains option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     status_equals = status_equals_;
     type_ = type__;
     name_contains = name_contains_;
   }
    : list_inference_experiments_request)

let make_inference_component_summary
    ?inference_component_status:(inference_component_status_ : inference_component_status option)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~variant_name:(variant_name_ : variant_name) ~endpoint_name:(endpoint_name_ : endpoint_name)
    ~endpoint_arn:(endpoint_arn_ : endpoint_arn)
    ~inference_component_name:(inference_component_name_ : inference_component_name)
    ~inference_component_arn:(inference_component_arn_ : inference_component_arn)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     last_modified_time = last_modified_time_;
     inference_component_status = inference_component_status_;
     variant_name = variant_name_;
     endpoint_name = endpoint_name_;
     endpoint_arn = endpoint_arn_;
     inference_component_name = inference_component_name_;
     inference_component_arn = inference_component_arn_;
     creation_time = creation_time_;
   }
    : inference_component_summary)

let make_list_inference_components_output ?next_token:(next_token_ : pagination_token option)
    ~inference_components:(inference_components_ : inference_component_summary_list) () =
  ({ next_token = next_token_; inference_components = inference_components_ }
    : list_inference_components_output)

let make_list_inference_components_input
    ?variant_name_equals:(variant_name_equals_ : variant_name option)
    ?endpoint_name_equals:(endpoint_name_equals_ : endpoint_name option)
    ?status_equals:(status_equals_ : inference_component_status option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?name_contains:(name_contains_ : inference_component_name_contains option)
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) ?sort_order:(sort_order_ : order_key option)
    ?sort_by:(sort_by_ : inference_component_sort_key option) () =
  ({
     variant_name_equals = variant_name_equals_;
     endpoint_name_equals = endpoint_name_equals_;
     status_equals = status_equals_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     name_contains = name_contains_;
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
   }
    : list_inference_components_input)

let make_image_version ?failure_reason:(failure_reason_ : failure_reason option)
    ~version:(version_ : image_version_number) ~last_modified_time:(last_modified_time_ : timestamp)
    ~image_version_status:(image_version_status_ : image_version_status)
    ~image_version_arn:(image_version_arn_ : image_version_arn) ~image_arn:(image_arn_ : image_arn)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     version = version_;
     last_modified_time = last_modified_time_;
     image_version_status = image_version_status_;
     image_version_arn = image_version_arn_;
     image_arn = image_arn_;
     failure_reason = failure_reason_;
     creation_time = creation_time_;
   }
    : image_version)

let make_list_image_versions_response ?next_token:(next_token_ : next_token option)
    ?image_versions:(image_versions_ : image_versions option) () =
  ({ next_token = next_token_; image_versions = image_versions_ } : list_image_versions_response)

let make_list_image_versions_request ?sort_order:(sort_order_ : image_version_sort_order option)
    ?sort_by:(sort_by_ : image_version_sort_by option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ~image_name:(image_name_ : image_name) () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     next_token = next_token_;
     max_results = max_results_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     image_name = image_name_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_image_versions_request)

let make_image ?failure_reason:(failure_reason_ : failure_reason option)
    ?display_name:(display_name_ : image_display_name option)
    ?description:(description_ : image_description option)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~image_status:(image_status_ : image_status) ~image_name:(image_name_ : image_name)
    ~image_arn:(image_arn_ : image_arn) ~creation_time:(creation_time_ : timestamp) () =
  ({
     last_modified_time = last_modified_time_;
     image_status = image_status_;
     image_name = image_name_;
     image_arn = image_arn_;
     failure_reason = failure_reason_;
     display_name = display_name_;
     description = description_;
     creation_time = creation_time_;
   }
    : image)

let make_list_images_response ?next_token:(next_token_ : next_token option)
    ?images:(images_ : images option) () =
  ({ next_token = next_token_; images = images_ } : list_images_response)

let make_list_images_request ?sort_order:(sort_order_ : image_sort_order option)
    ?sort_by:(sort_by_ : image_sort_by option) ?next_token:(next_token_ : next_token option)
    ?name_contains:(name_contains_ : image_name_contains option)
    ?max_results:(max_results_ : max_results option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option) () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     next_token = next_token_;
     name_contains = name_contains_;
     max_results = max_results_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_images_request)

let make_hyper_parameter_tuning_job_summary
    ?resource_limits:(resource_limits_ : resource_limits option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?hyper_parameter_tuning_end_time:(hyper_parameter_tuning_end_time_ : timestamp option)
    ~objective_status_counters:(objective_status_counters_ : objective_status_counters)
    ~training_job_status_counters:(training_job_status_counters_ : training_job_status_counters)
    ~creation_time:(creation_time_ : timestamp)
    ~strategy:(strategy_ : hyper_parameter_tuning_job_strategy_type)
    ~hyper_parameter_tuning_job_status:
      (hyper_parameter_tuning_job_status_ : hyper_parameter_tuning_job_status)
    ~hyper_parameter_tuning_job_arn:
      (hyper_parameter_tuning_job_arn_ : hyper_parameter_tuning_job_arn)
    ~hyper_parameter_tuning_job_name:
      (hyper_parameter_tuning_job_name_ : hyper_parameter_tuning_job_name) () =
  ({
     resource_limits = resource_limits_;
     objective_status_counters = objective_status_counters_;
     training_job_status_counters = training_job_status_counters_;
     last_modified_time = last_modified_time_;
     hyper_parameter_tuning_end_time = hyper_parameter_tuning_end_time_;
     creation_time = creation_time_;
     strategy = strategy_;
     hyper_parameter_tuning_job_status = hyper_parameter_tuning_job_status_;
     hyper_parameter_tuning_job_arn = hyper_parameter_tuning_job_arn_;
     hyper_parameter_tuning_job_name = hyper_parameter_tuning_job_name_;
   }
    : hyper_parameter_tuning_job_summary)

let make_list_hyper_parameter_tuning_jobs_response ?next_token:(next_token_ : next_token option)
    ~hyper_parameter_tuning_job_summaries:
      (hyper_parameter_tuning_job_summaries_ : hyper_parameter_tuning_job_summaries) () =
  ({
     next_token = next_token_;
     hyper_parameter_tuning_job_summaries = hyper_parameter_tuning_job_summaries_;
   }
    : list_hyper_parameter_tuning_jobs_response)

let make_list_hyper_parameter_tuning_jobs_request
    ?status_equals:(status_equals_ : hyper_parameter_tuning_job_status option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?name_contains:(name_contains_ : name_contains option)
    ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : hyper_parameter_tuning_job_sort_by_options option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     status_equals = status_equals_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     name_contains = name_contains_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_hyper_parameter_tuning_jobs_request)

let make_human_task_ui_summary ~creation_time:(creation_time_ : timestamp)
    ~human_task_ui_arn:(human_task_ui_arn_ : human_task_ui_arn)
    ~human_task_ui_name:(human_task_ui_name_ : human_task_ui_name) () =
  ({
     creation_time = creation_time_;
     human_task_ui_arn = human_task_ui_arn_;
     human_task_ui_name = human_task_ui_name_;
   }
    : human_task_ui_summary)

let make_list_human_task_uis_response ?next_token:(next_token_ : next_token option)
    ~human_task_ui_summaries:(human_task_ui_summaries_ : human_task_ui_summaries) () =
  ({ next_token = next_token_; human_task_ui_summaries = human_task_ui_summaries_ }
    : list_human_task_uis_response)

let make_list_human_task_uis_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?sort_order:(sort_order_ : sort_order option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_human_task_uis_request)

let make_hub_info ?hub_search_keywords:(hub_search_keywords_ : hub_search_keyword_list option)
    ?hub_description:(hub_description_ : hub_description option)
    ?hub_display_name:(hub_display_name_ : hub_display_name option)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp) ~hub_status:(hub_status_ : hub_status)
    ~hub_arn:(hub_arn_ : hub_arn) ~hub_name:(hub_name_ : hub_name) () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     hub_status = hub_status_;
     hub_search_keywords = hub_search_keywords_;
     hub_description = hub_description_;
     hub_display_name = hub_display_name_;
     hub_arn = hub_arn_;
     hub_name = hub_name_;
   }
    : hub_info)

let make_list_hubs_response ?next_token:(next_token_ : next_token option)
    ~hub_summaries:(hub_summaries_ : hub_info_list) () =
  ({ next_token = next_token_; hub_summaries = hub_summaries_ } : list_hubs_response)

let make_list_hubs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : hub_sort_by option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?name_contains:(name_contains_ : name_contains option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     name_contains = name_contains_;
   }
    : list_hubs_request)

let make_hub_content_info ?original_creation_time:(original_creation_time_ : timestamp option)
    ?hub_content_search_keywords:
      (hub_content_search_keywords_ : hub_content_search_keyword_list option)
    ?support_status:(support_status_ : hub_content_support_status option)
    ?hub_content_description:(hub_content_description_ : hub_content_description option)
    ?hub_content_display_name:(hub_content_display_name_ : hub_content_display_name option)
    ?sage_maker_public_hub_content_arn:
      (sage_maker_public_hub_content_arn_ : sage_maker_public_hub_content_arn option)
    ~creation_time:(creation_time_ : timestamp)
    ~hub_content_status:(hub_content_status_ : hub_content_status)
    ~document_schema_version:(document_schema_version_ : document_schema_version)
    ~hub_content_type:(hub_content_type_ : hub_content_type)
    ~hub_content_version:(hub_content_version_ : hub_content_version)
    ~hub_content_arn:(hub_content_arn_ : hub_content_arn)
    ~hub_content_name:(hub_content_name_ : hub_content_name) () =
  ({
     original_creation_time = original_creation_time_;
     creation_time = creation_time_;
     hub_content_status = hub_content_status_;
     hub_content_search_keywords = hub_content_search_keywords_;
     support_status = support_status_;
     hub_content_description = hub_content_description_;
     hub_content_display_name = hub_content_display_name_;
     document_schema_version = document_schema_version_;
     hub_content_type = hub_content_type_;
     hub_content_version = hub_content_version_;
     sage_maker_public_hub_content_arn = sage_maker_public_hub_content_arn_;
     hub_content_arn = hub_content_arn_;
     hub_content_name = hub_content_name_;
   }
    : hub_content_info)

let make_list_hub_content_versions_response ?next_token:(next_token_ : next_token option)
    ~hub_content_summaries:(hub_content_summaries_ : hub_content_info_list) () =
  ({ next_token = next_token_; hub_content_summaries = hub_content_summaries_ }
    : list_hub_content_versions_response)

let make_list_hub_content_versions_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : hub_content_sort_by option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?max_schema_version:(max_schema_version_ : document_schema_version option)
    ?min_version:(min_version_ : hub_content_version option)
    ~hub_content_name:(hub_content_name_ : hub_content_name)
    ~hub_content_type:(hub_content_type_ : hub_content_type) ~hub_name:(hub_name_ : hub_name_or_arn)
    () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     max_schema_version = max_schema_version_;
     min_version = min_version_;
     hub_content_name = hub_content_name_;
     hub_content_type = hub_content_type_;
     hub_name = hub_name_;
   }
    : list_hub_content_versions_request)

let make_list_hub_contents_response ?next_token:(next_token_ : next_token option)
    ~hub_content_summaries:(hub_content_summaries_ : hub_content_info_list) () =
  ({ next_token = next_token_; hub_content_summaries = hub_content_summaries_ }
    : list_hub_contents_response)

let make_list_hub_contents_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : hub_content_sort_by option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?max_schema_version:(max_schema_version_ : document_schema_version option)
    ?name_contains:(name_contains_ : name_contains option)
    ~hub_content_type:(hub_content_type_ : hub_content_type) ~hub_name:(hub_name_ : hub_name_or_arn)
    () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     max_schema_version = max_schema_version_;
     name_contains = name_contains_;
     hub_content_type = hub_content_type_;
     hub_name = hub_name_;
   }
    : list_hub_contents_request)

let make_flow_definition_summary ?failure_reason:(failure_reason_ : failure_reason option)
    ~creation_time:(creation_time_ : timestamp)
    ~flow_definition_status:(flow_definition_status_ : flow_definition_status)
    ~flow_definition_arn:(flow_definition_arn_ : flow_definition_arn)
    ~flow_definition_name:(flow_definition_name_ : flow_definition_name) () =
  ({
     failure_reason = failure_reason_;
     creation_time = creation_time_;
     flow_definition_status = flow_definition_status_;
     flow_definition_arn = flow_definition_arn_;
     flow_definition_name = flow_definition_name_;
   }
    : flow_definition_summary)

let make_list_flow_definitions_response ?next_token:(next_token_ : next_token option)
    ~flow_definition_summaries:(flow_definition_summaries_ : flow_definition_summaries) () =
  ({ next_token = next_token_; flow_definition_summaries = flow_definition_summaries_ }
    : list_flow_definitions_response)

let make_list_flow_definitions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?sort_order:(sort_order_ : sort_order option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_flow_definitions_request)

let make_feature_group_summary
    ?offline_store_status:(offline_store_status_ : offline_store_status option)
    ?feature_group_status:(feature_group_status_ : feature_group_status option)
    ~creation_time:(creation_time_ : timestamp)
    ~feature_group_arn:(feature_group_arn_ : feature_group_arn)
    ~feature_group_name:(feature_group_name_ : feature_group_name) () =
  ({
     offline_store_status = offline_store_status_;
     feature_group_status = feature_group_status_;
     creation_time = creation_time_;
     feature_group_arn = feature_group_arn_;
     feature_group_name = feature_group_name_;
   }
    : feature_group_summary)

let make_list_feature_groups_response ?next_token:(next_token_ : next_token option)
    ~feature_group_summaries:(feature_group_summaries_ : feature_group_summaries) () =
  ({ next_token = next_token_; feature_group_summaries = feature_group_summaries_ }
    : list_feature_groups_response)

let make_list_feature_groups_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : feature_group_max_results option)
    ?sort_by:(sort_by_ : feature_group_sort_by option)
    ?sort_order:(sort_order_ : feature_group_sort_order option)
    ?creation_time_before:(creation_time_before_ : creation_time option)
    ?creation_time_after:(creation_time_after_ : creation_time option)
    ?offline_store_status_equals:(offline_store_status_equals_ : offline_store_status_value option)
    ?feature_group_status_equals:(feature_group_status_equals_ : feature_group_status option)
    ?name_contains:(name_contains_ : feature_group_name_contains option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     offline_store_status_equals = offline_store_status_equals_;
     feature_group_status_equals = feature_group_status_equals_;
     name_contains = name_contains_;
   }
    : list_feature_groups_request)

let make_experiment_summary ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?experiment_source:(experiment_source_ : experiment_source option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?experiment_name:(experiment_name_ : experiment_entity_name option)
    ?experiment_arn:(experiment_arn_ : experiment_arn option) () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     experiment_source = experiment_source_;
     display_name = display_name_;
     experiment_name = experiment_name_;
     experiment_arn = experiment_arn_;
   }
    : experiment_summary)

let make_list_experiments_response ?next_token:(next_token_ : next_token option)
    ?experiment_summaries:(experiment_summaries_ : experiment_summaries option) () =
  ({ next_token = next_token_; experiment_summaries = experiment_summaries_ }
    : list_experiments_response)

let make_list_experiments_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : sort_experiments_by option)
    ?created_before:(created_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     created_before = created_before_;
     created_after = created_after_;
   }
    : list_experiments_request)

let make_endpoint_summary ~endpoint_status:(endpoint_status_ : endpoint_status)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp) ~endpoint_arn:(endpoint_arn_ : endpoint_arn)
    ~endpoint_name:(endpoint_name_ : endpoint_name) () =
  ({
     endpoint_status = endpoint_status_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     endpoint_arn = endpoint_arn_;
     endpoint_name = endpoint_name_;
   }
    : endpoint_summary)

let make_list_endpoints_output ?next_token:(next_token_ : pagination_token option)
    ~endpoints:(endpoints_ : endpoint_summary_list) () =
  ({ next_token = next_token_; endpoints = endpoints_ } : list_endpoints_output)

let make_list_endpoints_input ?status_equals:(status_equals_ : endpoint_status option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?name_contains:(name_contains_ : endpoint_name_contains option)
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) ?sort_order:(sort_order_ : order_key option)
    ?sort_by:(sort_by_ : endpoint_sort_key option) () =
  ({
     status_equals = status_equals_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     name_contains = name_contains_;
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
   }
    : list_endpoints_input)

let make_endpoint_config_summary ~creation_time:(creation_time_ : timestamp)
    ~endpoint_config_arn:(endpoint_config_arn_ : endpoint_config_arn)
    ~endpoint_config_name:(endpoint_config_name_ : endpoint_config_name) () =
  ({
     creation_time = creation_time_;
     endpoint_config_arn = endpoint_config_arn_;
     endpoint_config_name = endpoint_config_name_;
   }
    : endpoint_config_summary)

let make_list_endpoint_configs_output ?next_token:(next_token_ : pagination_token option)
    ~endpoint_configs:(endpoint_configs_ : endpoint_config_summary_list) () =
  ({ next_token = next_token_; endpoint_configs = endpoint_configs_ }
    : list_endpoint_configs_output)

let make_list_endpoint_configs_input ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?name_contains:(name_contains_ : endpoint_config_name_contains option)
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) ?sort_order:(sort_order_ : order_key option)
    ?sort_by:(sort_by_ : endpoint_config_sort_key option) () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     name_contains = name_contains_;
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
   }
    : list_endpoint_configs_input)

let make_edge_packaging_job_summary ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?model_version:(model_version_ : edge_version option)
    ?model_name:(model_name_ : entity_name option)
    ?compilation_job_name:(compilation_job_name_ : entity_name option)
    ~edge_packaging_job_status:(edge_packaging_job_status_ : edge_packaging_job_status)
    ~edge_packaging_job_name:(edge_packaging_job_name_ : entity_name)
    ~edge_packaging_job_arn:(edge_packaging_job_arn_ : edge_packaging_job_arn) () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     model_version = model_version_;
     model_name = model_name_;
     compilation_job_name = compilation_job_name_;
     edge_packaging_job_status = edge_packaging_job_status_;
     edge_packaging_job_name = edge_packaging_job_name_;
     edge_packaging_job_arn = edge_packaging_job_arn_;
   }
    : edge_packaging_job_summary)

let make_list_edge_packaging_jobs_response ?next_token:(next_token_ : next_token option)
    ~edge_packaging_job_summaries:(edge_packaging_job_summaries_ : edge_packaging_job_summaries) ()
    =
  ({ next_token = next_token_; edge_packaging_job_summaries = edge_packaging_job_summaries_ }
    : list_edge_packaging_jobs_response)

let make_list_edge_packaging_jobs_request ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : list_edge_packaging_jobs_sort_by option)
    ?status_equals:(status_equals_ : edge_packaging_job_status option)
    ?model_name_contains:(model_name_contains_ : name_contains option)
    ?name_contains:(name_contains_ : name_contains option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?max_results:(max_results_ : list_max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     status_equals = status_equals_;
     model_name_contains = model_name_contains_;
     name_contains = name_contains_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_edge_packaging_jobs_request)

let make_edge_deployment_plan_summary ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ~edge_deployment_failed:(edge_deployment_failed_ : integer)
    ~edge_deployment_pending:(edge_deployment_pending_ : integer)
    ~edge_deployment_success:(edge_deployment_success_ : integer)
    ~device_fleet_name:(device_fleet_name_ : entity_name)
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name)
    ~edge_deployment_plan_arn:(edge_deployment_plan_arn_ : edge_deployment_plan_arn) () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     edge_deployment_failed = edge_deployment_failed_;
     edge_deployment_pending = edge_deployment_pending_;
     edge_deployment_success = edge_deployment_success_;
     device_fleet_name = device_fleet_name_;
     edge_deployment_plan_name = edge_deployment_plan_name_;
     edge_deployment_plan_arn = edge_deployment_plan_arn_;
   }
    : edge_deployment_plan_summary)

let make_list_edge_deployment_plans_response ?next_token:(next_token_ : next_token option)
    ~edge_deployment_plan_summaries:
      (edge_deployment_plan_summaries_ : edge_deployment_plan_summaries) () =
  ({ next_token = next_token_; edge_deployment_plan_summaries = edge_deployment_plan_summaries_ }
    : list_edge_deployment_plans_response)

let make_list_edge_deployment_plans_request ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : list_edge_deployment_plans_sort_by option)
    ?device_fleet_name_contains:(device_fleet_name_contains_ : name_contains option)
    ?name_contains:(name_contains_ : name_contains option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?max_results:(max_results_ : list_max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     device_fleet_name_contains = device_fleet_name_contains_;
     name_contains = name_contains_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_edge_deployment_plans_request)

let make_domain_details ?url:(url_ : string1024 option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?creation_time:(creation_time_ : creation_time option) ?status:(status_ : domain_status option)
    ?domain_name:(domain_name_ : domain_name option) ?domain_id:(domain_id_ : domain_id option)
    ?domain_arn:(domain_arn_ : domain_arn option) () =
  ({
     url = url_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     status = status_;
     domain_name = domain_name_;
     domain_id = domain_id_;
     domain_arn = domain_arn_;
   }
    : domain_details)

let make_list_domains_response ?next_token:(next_token_ : next_token option)
    ?domains:(domains_ : domain_list option) () =
  ({ next_token = next_token_; domains = domains_ } : list_domains_response)

let make_list_domains_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_domains_request)

let make_edge_model_summary ~model_version:(model_version_ : edge_version)
    ~model_name:(model_name_ : entity_name) () =
  ({ model_version = model_version_; model_name = model_name_ } : edge_model_summary)

let make_device_summary ?agent_version:(agent_version_ : edge_version option)
    ?models:(models_ : edge_model_summaries option)
    ?latest_heartbeat:(latest_heartbeat_ : timestamp option)
    ?registration_time:(registration_time_ : timestamp option)
    ?iot_thing_name:(iot_thing_name_ : thing_name option)
    ?device_fleet_name:(device_fleet_name_ : entity_name option)
    ?description:(description_ : device_description option) ~device_arn:(device_arn_ : device_arn)
    ~device_name:(device_name_ : entity_name) () =
  ({
     agent_version = agent_version_;
     models = models_;
     latest_heartbeat = latest_heartbeat_;
     registration_time = registration_time_;
     iot_thing_name = iot_thing_name_;
     device_fleet_name = device_fleet_name_;
     description = description_;
     device_arn = device_arn_;
     device_name = device_name_;
   }
    : device_summary)

let make_list_devices_response ?next_token:(next_token_ : next_token option)
    ~device_summaries:(device_summaries_ : device_summaries) () =
  ({ next_token = next_token_; device_summaries = device_summaries_ } : list_devices_response)

let make_list_devices_request ?device_fleet_name:(device_fleet_name_ : entity_name option)
    ?model_name:(model_name_ : entity_name option)
    ?latest_heartbeat_after:(latest_heartbeat_after_ : timestamp option)
    ?max_results:(max_results_ : list_max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     device_fleet_name = device_fleet_name_;
     model_name = model_name_;
     latest_heartbeat_after = latest_heartbeat_after_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_devices_request)

let make_device_fleet_summary ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ~device_fleet_name:(device_fleet_name_ : entity_name)
    ~device_fleet_arn:(device_fleet_arn_ : device_fleet_arn) () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     device_fleet_name = device_fleet_name_;
     device_fleet_arn = device_fleet_arn_;
   }
    : device_fleet_summary)

let make_list_device_fleets_response ?next_token:(next_token_ : next_token option)
    ~device_fleet_summaries:(device_fleet_summaries_ : device_fleet_summaries) () =
  ({ next_token = next_token_; device_fleet_summaries = device_fleet_summaries_ }
    : list_device_fleets_response)

let make_list_device_fleets_request ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : list_device_fleets_sort_by option)
    ?name_contains:(name_contains_ : name_contains option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?max_results:(max_results_ : list_max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     name_contains = name_contains_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_device_fleets_request)

let make_list_data_quality_job_definitions_response ?next_token:(next_token_ : next_token option)
    ~job_definition_summaries:(job_definition_summaries_ : monitoring_job_definition_summary_list)
    () =
  ({ next_token = next_token_; job_definition_summaries = job_definition_summaries_ }
    : list_data_quality_job_definitions_response)

let make_list_data_quality_job_definitions_request
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?name_contains:(name_contains_ : name_contains option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : monitoring_job_definition_sort_key option)
    ?endpoint_name:(endpoint_name_ : endpoint_name option) () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     name_contains = name_contains_;
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     endpoint_name = endpoint_name_;
   }
    : list_data_quality_job_definitions_request)

let make_context_source ?source_id:(source_id_ : string256 option)
    ?source_type:(source_type_ : string256 option) ~source_uri:(source_uri_ : source_uri) () =
  ({ source_id = source_id_; source_type = source_type_; source_uri = source_uri_ }
    : context_source)

let make_context_summary ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?context_type:(context_type_ : string256 option) ?source:(source_ : context_source option)
    ?context_name:(context_name_ : context_name option)
    ?context_arn:(context_arn_ : context_arn option) () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     context_type = context_type_;
     source = source_;
     context_name = context_name_;
     context_arn = context_arn_;
   }
    : context_summary)

let make_list_contexts_response ?next_token:(next_token_ : next_token option)
    ?context_summaries:(context_summaries_ : context_summaries option) () =
  ({ next_token = next_token_; context_summaries = context_summaries_ } : list_contexts_response)

let make_list_contexts_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : sort_contexts_by option)
    ?created_before:(created_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option)
    ?context_type:(context_type_ : string256 option) ?source_uri:(source_uri_ : source_uri option)
    () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     created_before = created_before_;
     created_after = created_after_;
     context_type = context_type_;
     source_uri = source_uri_;
   }
    : list_contexts_request)

let make_compute_quota_summary ?last_modified_time:(last_modified_time_ : timestamp option)
    ?activation_state:(activation_state_ : activation_state option)
    ?compute_quota_config:(compute_quota_config_ : compute_quota_config option)
    ?cluster_arn:(cluster_arn_ : cluster_arn option)
    ?compute_quota_version:(compute_quota_version_ : integer option)
    ~creation_time:(creation_time_ : timestamp)
    ~compute_quota_target:(compute_quota_target_ : compute_quota_target)
    ~status:(status_ : scheduler_resource_status) ~name:(name_ : entity_name)
    ~compute_quota_id:(compute_quota_id_ : compute_quota_id)
    ~compute_quota_arn:(compute_quota_arn_ : compute_quota_arn) () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     activation_state = activation_state_;
     compute_quota_target = compute_quota_target_;
     compute_quota_config = compute_quota_config_;
     cluster_arn = cluster_arn_;
     status = status_;
     compute_quota_version = compute_quota_version_;
     name = name_;
     compute_quota_id = compute_quota_id_;
     compute_quota_arn = compute_quota_arn_;
   }
    : compute_quota_summary)

let make_list_compute_quotas_response ?next_token:(next_token_ : next_token option)
    ?compute_quota_summaries:(compute_quota_summaries_ : compute_quota_summary_list option) () =
  ({ next_token = next_token_; compute_quota_summaries = compute_quota_summaries_ }
    : list_compute_quotas_response)

let make_list_compute_quotas_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : sort_quota_by option) ?cluster_arn:(cluster_arn_ : cluster_arn option)
    ?status:(status_ : scheduler_resource_status option)
    ?name_contains:(name_contains_ : entity_name option)
    ?created_before:(created_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     cluster_arn = cluster_arn_;
     status = status_;
     name_contains = name_contains_;
     created_before = created_before_;
     created_after = created_after_;
   }
    : list_compute_quotas_request)

let make_compilation_job_summary
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?compilation_target_platform_accelerator:
      (compilation_target_platform_accelerator_ : target_platform_accelerator option)
    ?compilation_target_platform_arch:
      (compilation_target_platform_arch_ : target_platform_arch option)
    ?compilation_target_platform_os:(compilation_target_platform_os_ : target_platform_os option)
    ?compilation_target_device:(compilation_target_device_ : target_device option)
    ?compilation_end_time:(compilation_end_time_ : timestamp option)
    ?compilation_start_time:(compilation_start_time_ : timestamp option)
    ~compilation_job_status:(compilation_job_status_ : compilation_job_status)
    ~creation_time:(creation_time_ : creation_time)
    ~compilation_job_arn:(compilation_job_arn_ : compilation_job_arn)
    ~compilation_job_name:(compilation_job_name_ : entity_name) () =
  ({
     compilation_job_status = compilation_job_status_;
     last_modified_time = last_modified_time_;
     compilation_target_platform_accelerator = compilation_target_platform_accelerator_;
     compilation_target_platform_arch = compilation_target_platform_arch_;
     compilation_target_platform_os = compilation_target_platform_os_;
     compilation_target_device = compilation_target_device_;
     compilation_end_time = compilation_end_time_;
     compilation_start_time = compilation_start_time_;
     creation_time = creation_time_;
     compilation_job_arn = compilation_job_arn_;
     compilation_job_name = compilation_job_name_;
   }
    : compilation_job_summary)

let make_list_compilation_jobs_response ?next_token:(next_token_ : next_token option)
    ~compilation_job_summaries:(compilation_job_summaries_ : compilation_job_summaries) () =
  ({ next_token = next_token_; compilation_job_summaries = compilation_job_summaries_ }
    : list_compilation_jobs_response)

let make_list_compilation_jobs_request ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : list_compilation_jobs_sort_by option)
    ?status_equals:(status_equals_ : compilation_job_status option)
    ?name_contains:(name_contains_ : name_contains option)
    ?last_modified_time_before:(last_modified_time_before_ : last_modified_time option)
    ?last_modified_time_after:(last_modified_time_after_ : last_modified_time option)
    ?creation_time_before:(creation_time_before_ : creation_time option)
    ?creation_time_after:(creation_time_after_ : creation_time option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     status_equals = status_equals_;
     name_contains = name_contains_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_compilation_jobs_request)

let make_git_config ?secret_arn:(secret_arn_ : secret_arn option) ?branch:(branch_ : branch option)
    ~repository_url:(repository_url_ : git_config_url) () =
  ({ secret_arn = secret_arn_; branch = branch_; repository_url = repository_url_ } : git_config)

let make_code_repository_summary ?git_config:(git_config_ : git_config option)
    ~last_modified_time:(last_modified_time_ : last_modified_time)
    ~creation_time:(creation_time_ : creation_time)
    ~code_repository_arn:(code_repository_arn_ : code_repository_arn)
    ~code_repository_name:(code_repository_name_ : entity_name) () =
  ({
     git_config = git_config_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     code_repository_arn = code_repository_arn_;
     code_repository_name = code_repository_name_;
   }
    : code_repository_summary)

let make_list_code_repositories_output ?next_token:(next_token_ : next_token option)
    ~code_repository_summary_list:(code_repository_summary_list_ : code_repository_summary_list) ()
    =
  ({ next_token = next_token_; code_repository_summary_list = code_repository_summary_list_ }
    : list_code_repositories_output)

let make_list_code_repositories_input ?sort_order:(sort_order_ : code_repository_sort_order option)
    ?sort_by:(sort_by_ : code_repository_sort_by option)
    ?next_token:(next_token_ : next_token option)
    ?name_contains:(name_contains_ : code_repository_name_contains option)
    ?max_results:(max_results_ : max_results option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : creation_time option)
    ?creation_time_after:(creation_time_after_ : creation_time option) () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     next_token = next_token_;
     name_contains = name_contains_;
     max_results = max_results_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_code_repositories_input)

let make_cluster_scheduler_config_summary ?cluster_arn:(cluster_arn_ : cluster_arn option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?cluster_scheduler_config_version:(cluster_scheduler_config_version_ : integer option)
    ~status:(status_ : scheduler_resource_status) ~creation_time:(creation_time_ : timestamp)
    ~name:(name_ : entity_name)
    ~cluster_scheduler_config_id:(cluster_scheduler_config_id_ : cluster_scheduler_config_id)
    ~cluster_scheduler_config_arn:(cluster_scheduler_config_arn_ : cluster_scheduler_config_arn) ()
    =
  ({
     cluster_arn = cluster_arn_;
     status = status_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     name = name_;
     cluster_scheduler_config_version = cluster_scheduler_config_version_;
     cluster_scheduler_config_id = cluster_scheduler_config_id_;
     cluster_scheduler_config_arn = cluster_scheduler_config_arn_;
   }
    : cluster_scheduler_config_summary)

let make_list_cluster_scheduler_configs_response ?next_token:(next_token_ : next_token option)
    ?cluster_scheduler_config_summaries:
      (cluster_scheduler_config_summaries_ : cluster_scheduler_config_summary_list option) () =
  ({
     next_token = next_token_;
     cluster_scheduler_config_summaries = cluster_scheduler_config_summaries_;
   }
    : list_cluster_scheduler_configs_response)

let make_list_cluster_scheduler_configs_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : sort_cluster_scheduler_config_by option)
    ?status:(status_ : scheduler_resource_status option)
    ?cluster_arn:(cluster_arn_ : cluster_arn option)
    ?name_contains:(name_contains_ : entity_name option)
    ?created_before:(created_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     status = status_;
     cluster_arn = cluster_arn_;
     name_contains = name_contains_;
     created_before = created_before_;
     created_after = created_after_;
   }
    : list_cluster_scheduler_configs_request)

let make_cluster_summary
    ?image_version_status:(image_version_status_ : cluster_image_version_status option)
    ?training_plan_arns:(training_plan_arns_ : training_plan_arns option)
    ~cluster_status:(cluster_status_ : cluster_status) ~creation_time:(creation_time_ : timestamp)
    ~cluster_name:(cluster_name_ : cluster_name) ~cluster_arn:(cluster_arn_ : cluster_arn) () =
  ({
     image_version_status = image_version_status_;
     training_plan_arns = training_plan_arns_;
     cluster_status = cluster_status_;
     creation_time = creation_time_;
     cluster_name = cluster_name_;
     cluster_arn = cluster_arn_;
   }
    : cluster_summary)

let make_list_clusters_response ?next_token:(next_token_ : next_token option)
    ~cluster_summaries:(cluster_summaries_ : cluster_summaries) () =
  ({ cluster_summaries = cluster_summaries_; next_token = next_token_ } : list_clusters_response)

let make_list_clusters_request ?training_plan_arn:(training_plan_arn_ : training_plan_arn option)
    ?sort_order:(sort_order_ : sort_order option) ?sort_by:(sort_by_ : cluster_sort_by option)
    ?next_token:(next_token_ : next_token option)
    ?name_contains:(name_contains_ : name_contains option)
    ?max_results:(max_results_ : max_results option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option) () =
  ({
     training_plan_arn = training_plan_arn_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     next_token = next_token_;
     name_contains = name_contains_;
     max_results = max_results_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_clusters_request)

let make_cluster_instance_status_details
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~status:(status_ : cluster_instance_status) () =
  ({ message = message_; status = status_ } : cluster_instance_status_details)

let make_cluster_node_summary
    ?image_version_status:(image_version_status_ : cluster_image_version_status option)
    ?current_image_release_version:(current_image_release_version_ : image_release_version option)
    ?private_dns_hostname:(private_dns_hostname_ : cluster_private_dns_hostname option)
    ?ultra_server_info:(ultra_server_info_ : ultra_server_info option)
    ?last_software_update_time:(last_software_update_time_ : timestamp option)
    ?node_logical_id:(node_logical_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~instance_status:(instance_status_ : cluster_instance_status_details)
    ~launch_time:(launch_time_ : timestamp) ~instance_type:(instance_type_ : cluster_instance_type)
    ~instance_id:(instance_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~instance_group_name:(instance_group_name_ : cluster_instance_group_name) () =
  ({
     image_version_status = image_version_status_;
     current_image_release_version = current_image_release_version_;
     private_dns_hostname = private_dns_hostname_;
     ultra_server_info = ultra_server_info_;
     instance_status = instance_status_;
     last_software_update_time = last_software_update_time_;
     launch_time = launch_time_;
     instance_type = instance_type_;
     node_logical_id = node_logical_id_;
     instance_id = instance_id_;
     instance_group_name = instance_group_name_;
   }
    : cluster_node_summary)

let make_list_cluster_nodes_response ?next_token:(next_token_ : next_token option)
    ~cluster_node_summaries:(cluster_node_summaries_ : cluster_node_summaries) () =
  ({ cluster_node_summaries = cluster_node_summaries_; next_token = next_token_ }
    : list_cluster_nodes_response)

let make_list_cluster_nodes_request
    ?include_node_logical_ids:(include_node_logical_ids_ : include_node_logical_ids_boolean option)
    ?sort_order:(sort_order_ : sort_order option) ?sort_by:(sort_by_ : cluster_sort_by option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?instance_group_name_contains:
      (instance_group_name_contains_ : cluster_instance_group_name option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({
     include_node_logical_ids = include_node_logical_ids_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     next_token = next_token_;
     max_results = max_results_;
     instance_group_name_contains = instance_group_name_contains_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     cluster_name = cluster_name_;
   }
    : list_cluster_nodes_request)

let make_cluster_event_summary ?event_level:(event_level_ : cluster_event_level option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_id:(instance_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_group_name:(instance_group_name_ : cluster_instance_group_name option)
    ~event_time:(event_time_ : timestamp)
    ~resource_type:(resource_type_ : cluster_event_resource_type)
    ~cluster_name:(cluster_name_ : cluster_name) ~cluster_arn:(cluster_arn_ : cluster_arn)
    ~event_id:(event_id_ : event_id) () =
  ({
     event_level = event_level_;
     description = description_;
     event_time = event_time_;
     resource_type = resource_type_;
     instance_id = instance_id_;
     instance_group_name = instance_group_name_;
     cluster_name = cluster_name_;
     cluster_arn = cluster_arn_;
     event_id = event_id_;
   }
    : cluster_event_summary)

let make_list_cluster_events_response ?events:(events_ : cluster_event_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ events = events_; next_token = next_token_ } : list_cluster_events_response)

let make_list_cluster_events_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : cluster_event_max_results option)
    ?resource_type:(resource_type_ : cluster_event_resource_type option)
    ?sort_order:(sort_order_ : sort_order option) ?sort_by:(sort_by_ : event_sort_by option)
    ?event_time_before:(event_time_before_ : timestamp option)
    ?event_time_after:(event_time_after_ : timestamp option)
    ?node_id:(node_id_ : cluster_node_id option)
    ?instance_group_name:(instance_group_name_ : cluster_instance_group_name option)
    ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     resource_type = resource_type_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     event_time_before = event_time_before_;
     event_time_after = event_time_after_;
     node_id = node_id_;
     instance_group_name = instance_group_name_;
     cluster_name = cluster_name_;
   }
    : list_cluster_events_request)

let make_final_auto_ml_job_objective_metric
    ?standard_metric_name:(standard_metric_name_ : auto_ml_metric_enum option)
    ?type_:(type__ : auto_ml_job_objective_type option) ~value:(value_ : metric_value)
    ~metric_name:(metric_name_ : auto_ml_metric_enum) () =
  ({
     standard_metric_name = standard_metric_name_;
     value = value_;
     metric_name = metric_name_;
     type_ = type__;
   }
    : final_auto_ml_job_objective_metric)

let make_auto_ml_candidate_step ~candidate_step_name:(candidate_step_name_ : candidate_step_name)
    ~candidate_step_arn:(candidate_step_arn_ : candidate_step_arn)
    ~candidate_step_type:(candidate_step_type_ : candidate_step_type) () =
  ({
     candidate_step_name = candidate_step_name_;
     candidate_step_arn = candidate_step_arn_;
     candidate_step_type = candidate_step_type_;
   }
    : auto_ml_candidate_step)

let make_auto_ml_container_definition ?environment:(environment_ : environment_map option)
    ~model_data_url:(model_data_url_ : url) ~image:(image_ : container_image) () =
  ({ environment = environment_; model_data_url = model_data_url_; image = image_ }
    : auto_ml_container_definition)

let make_candidate_artifact_locations
    ?backtest_results:(backtest_results_ : backtest_results_location option)
    ?model_insights:(model_insights_ : model_insights_location option)
    ~explainability:(explainability_ : explainability_location) () =
  ({
     backtest_results = backtest_results_;
     model_insights = model_insights_;
     explainability = explainability_;
   }
    : candidate_artifact_locations)

let make_metric_datum ?set:(set_ : metric_set_source option) ?value:(value_ : float_ option)
    ?standard_metric_name:(standard_metric_name_ : auto_ml_metric_extended_enum option)
    ?metric_name:(metric_name_ : auto_ml_metric_enum option) () =
  ({
     set = set_;
     value = value_;
     standard_metric_name = standard_metric_name_;
     metric_name = metric_name_;
   }
    : metric_datum)

let make_candidate_properties ?candidate_metrics:(candidate_metrics_ : metric_data_list option)
    ?candidate_artifact_locations:
      (candidate_artifact_locations_ : candidate_artifact_locations option) () =
  ({
     candidate_metrics = candidate_metrics_;
     candidate_artifact_locations = candidate_artifact_locations_;
   }
    : candidate_properties)

let make_auto_ml_candidate
    ?inference_container_definitions:
      (inference_container_definitions_ : auto_ml_inference_container_definitions option)
    ?candidate_properties:(candidate_properties_ : candidate_properties option)
    ?failure_reason:(failure_reason_ : auto_ml_failure_reason option)
    ?end_time:(end_time_ : timestamp option)
    ?inference_containers:(inference_containers_ : auto_ml_container_definitions option)
    ?final_auto_ml_job_objective_metric:
      (final_auto_ml_job_objective_metric_ : final_auto_ml_job_objective_metric option)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp)
    ~candidate_status:(candidate_status_ : candidate_status)
    ~candidate_steps:(candidate_steps_ : candidate_steps)
    ~objective_status:(objective_status_ : objective_status)
    ~candidate_name:(candidate_name_ : candidate_name) () =
  ({
     inference_container_definitions = inference_container_definitions_;
     candidate_properties = candidate_properties_;
     failure_reason = failure_reason_;
     last_modified_time = last_modified_time_;
     end_time = end_time_;
     creation_time = creation_time_;
     inference_containers = inference_containers_;
     candidate_status = candidate_status_;
     candidate_steps = candidate_steps_;
     objective_status = objective_status_;
     final_auto_ml_job_objective_metric = final_auto_ml_job_objective_metric_;
     candidate_name = candidate_name_;
   }
    : auto_ml_candidate)

let make_list_candidates_for_auto_ml_job_response ?next_token:(next_token_ : next_token option)
    ~candidates:(candidates_ : auto_ml_candidates) () =
  ({ next_token = next_token_; candidates = candidates_ }
    : list_candidates_for_auto_ml_job_response)

let make_list_candidates_for_auto_ml_job_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : auto_ml_max_results_for_trials option)
    ?sort_by:(sort_by_ : candidate_sort_by option)
    ?sort_order:(sort_order_ : auto_ml_sort_order option)
    ?candidate_name_equals:(candidate_name_equals_ : candidate_name option)
    ?status_equals:(status_equals_ : candidate_status option)
    ~auto_ml_job_name:(auto_ml_job_name_ : auto_ml_job_name) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     candidate_name_equals = candidate_name_equals_;
     status_equals = status_equals_;
     auto_ml_job_name = auto_ml_job_name_;
   }
    : list_candidates_for_auto_ml_job_request)

let make_auto_ml_partial_failure_reason
    ?partial_failure_message:(partial_failure_message_ : auto_ml_failure_reason option) () =
  ({ partial_failure_message = partial_failure_message_ } : auto_ml_partial_failure_reason)

let make_auto_ml_job_summary
    ?partial_failure_reasons:(partial_failure_reasons_ : auto_ml_partial_failure_reasons option)
    ?failure_reason:(failure_reason_ : auto_ml_failure_reason option)
    ?end_time:(end_time_ : timestamp option) ~last_modified_time:(last_modified_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp)
    ~auto_ml_job_secondary_status:(auto_ml_job_secondary_status_ : auto_ml_job_secondary_status)
    ~auto_ml_job_status:(auto_ml_job_status_ : auto_ml_job_status)
    ~auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn)
    ~auto_ml_job_name:(auto_ml_job_name_ : auto_ml_job_name) () =
  ({
     partial_failure_reasons = partial_failure_reasons_;
     failure_reason = failure_reason_;
     last_modified_time = last_modified_time_;
     end_time = end_time_;
     creation_time = creation_time_;
     auto_ml_job_secondary_status = auto_ml_job_secondary_status_;
     auto_ml_job_status = auto_ml_job_status_;
     auto_ml_job_arn = auto_ml_job_arn_;
     auto_ml_job_name = auto_ml_job_name_;
   }
    : auto_ml_job_summary)

let make_list_auto_ml_jobs_response ?next_token:(next_token_ : next_token option)
    ~auto_ml_job_summaries:(auto_ml_job_summaries_ : auto_ml_job_summaries) () =
  ({ next_token = next_token_; auto_ml_job_summaries = auto_ml_job_summaries_ }
    : list_auto_ml_jobs_response)

let make_list_auto_ml_jobs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : auto_ml_max_results option)
    ?sort_by:(sort_by_ : auto_ml_sort_by option)
    ?sort_order:(sort_order_ : auto_ml_sort_order option)
    ?status_equals:(status_equals_ : auto_ml_job_status option)
    ?name_contains:(name_contains_ : auto_ml_name_contains option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     status_equals = status_equals_;
     name_contains = name_contains_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_auto_ml_jobs_request)

let make_association_summary ?created_by:(created_by_ : user_context option)
    ?creation_time:(creation_time_ : timestamp option)
    ?destination_name:(destination_name_ : experiment_entity_name option)
    ?source_name:(source_name_ : experiment_entity_name option)
    ?association_type:(association_type_ : association_edge_type option)
    ?destination_type:(destination_type_ : string256 option)
    ?source_type:(source_type_ : string256 option)
    ?destination_arn:(destination_arn_ : association_entity_arn option)
    ?source_arn:(source_arn_ : association_entity_arn option) () =
  ({
     created_by = created_by_;
     creation_time = creation_time_;
     destination_name = destination_name_;
     source_name = source_name_;
     association_type = association_type_;
     destination_type = destination_type_;
     source_type = source_type_;
     destination_arn = destination_arn_;
     source_arn = source_arn_;
   }
    : association_summary)

let make_list_associations_response ?next_token:(next_token_ : next_token option)
    ?association_summaries:(association_summaries_ : association_summaries option) () =
  ({ next_token = next_token_; association_summaries = association_summaries_ }
    : list_associations_response)

let make_list_associations_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : sort_associations_by option)
    ?created_before:(created_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option)
    ?association_type:(association_type_ : association_edge_type option)
    ?destination_type:(destination_type_ : string256 option)
    ?source_type:(source_type_ : string256 option)
    ?destination_arn:(destination_arn_ : association_entity_arn option)
    ?source_arn:(source_arn_ : association_entity_arn option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     created_before = created_before_;
     created_after = created_after_;
     association_type = association_type_;
     destination_type = destination_type_;
     source_type = source_type_;
     destination_arn = destination_arn_;
     source_arn = source_arn_;
   }
    : list_associations_request)

let make_artifact_source_type ~value:(value_ : string256)
    ~source_id_type:(source_id_type_ : artifact_source_id_type) () =
  ({ value = value_; source_id_type = source_id_type_ } : artifact_source_type)

let make_artifact_source ?source_types:(source_types_ : artifact_source_types option)
    ~source_uri:(source_uri_ : source_uri) () =
  ({ source_types = source_types_; source_uri = source_uri_ } : artifact_source)

let make_artifact_summary ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?artifact_type:(artifact_type_ : string256 option) ?source:(source_ : artifact_source option)
    ?artifact_name:(artifact_name_ : experiment_entity_name option)
    ?artifact_arn:(artifact_arn_ : artifact_arn option) () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     artifact_type = artifact_type_;
     source = source_;
     artifact_name = artifact_name_;
     artifact_arn = artifact_arn_;
   }
    : artifact_summary)

let make_list_artifacts_response ?next_token:(next_token_ : next_token option)
    ?artifact_summaries:(artifact_summaries_ : artifact_summaries option) () =
  ({ next_token = next_token_; artifact_summaries = artifact_summaries_ } : list_artifacts_response)

let make_list_artifacts_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : sort_artifacts_by option)
    ?created_before:(created_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option)
    ?artifact_type:(artifact_type_ : string256 option) ?source_uri:(source_uri_ : source_uri option)
    () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     created_before = created_before_;
     created_after = created_after_;
     artifact_type = artifact_type_;
     source_uri = source_uri_;
   }
    : list_artifacts_request)

let make_app_details ?resource_spec:(resource_spec_ : resource_spec option)
    ?creation_time:(creation_time_ : creation_time option) ?status:(status_ : app_status option)
    ?app_name:(app_name_ : app_name option) ?app_type:(app_type_ : app_type option)
    ?space_name:(space_name_ : space_name option)
    ?user_profile_name:(user_profile_name_ : user_profile_name option)
    ?domain_id:(domain_id_ : domain_id option) () =
  ({
     resource_spec = resource_spec_;
     creation_time = creation_time_;
     status = status_;
     app_name = app_name_;
     app_type = app_type_;
     space_name = space_name_;
     user_profile_name = user_profile_name_;
     domain_id = domain_id_;
   }
    : app_details)

let make_list_apps_response ?next_token:(next_token_ : next_token option)
    ?apps:(apps_ : app_list option) () =
  ({ next_token = next_token_; apps = apps_ } : list_apps_response)

let make_list_apps_request ?space_name_equals:(space_name_equals_ : space_name option)
    ?user_profile_name_equals:(user_profile_name_equals_ : user_profile_name option)
    ?domain_id_equals:(domain_id_equals_ : domain_id option)
    ?sort_by:(sort_by_ : app_sort_key option) ?sort_order:(sort_order_ : sort_order option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     space_name_equals = space_name_equals_;
     user_profile_name_equals = user_profile_name_equals_;
     domain_id_equals = domain_id_equals_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_apps_request)

let make_app_image_config_details
    ?code_editor_app_image_config:
      (code_editor_app_image_config_ : code_editor_app_image_config option)
    ?jupyter_lab_app_image_config:
      (jupyter_lab_app_image_config_ : jupyter_lab_app_image_config option)
    ?kernel_gateway_image_config:(kernel_gateway_image_config_ : kernel_gateway_image_config option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?app_image_config_name:(app_image_config_name_ : app_image_config_name option)
    ?app_image_config_arn:(app_image_config_arn_ : app_image_config_arn option) () =
  ({
     code_editor_app_image_config = code_editor_app_image_config_;
     jupyter_lab_app_image_config = jupyter_lab_app_image_config_;
     kernel_gateway_image_config = kernel_gateway_image_config_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     app_image_config_name = app_image_config_name_;
     app_image_config_arn = app_image_config_arn_;
   }
    : app_image_config_details)

let make_list_app_image_configs_response
    ?app_image_configs:(app_image_configs_ : app_image_config_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ app_image_configs = app_image_configs_; next_token = next_token_ }
    : list_app_image_configs_response)

let make_list_app_image_configs_request ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : app_image_config_sort_key option)
    ?modified_time_after:(modified_time_after_ : timestamp option)
    ?modified_time_before:(modified_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?name_contains:(name_contains_ : app_image_config_name option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     modified_time_after = modified_time_after_;
     modified_time_before = modified_time_before_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     name_contains = name_contains_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_app_image_configs_request)

let make_list_aliases_response ?next_token:(next_token_ : next_token option)
    ?sage_maker_image_version_aliases:
      (sage_maker_image_version_aliases_ : sage_maker_image_version_aliases option) () =
  ({
     next_token = next_token_;
     sage_maker_image_version_aliases = sage_maker_image_version_aliases_;
   }
    : list_aliases_response)

let make_list_aliases_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?version:(version_ : image_version_number option)
    ?alias:(alias_ : sage_maker_image_version_alias option) ~image_name:(image_name_ : image_name)
    () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     version = version_;
     alias = alias_;
     image_name = image_name_;
   }
    : list_aliases_request)

let make_algorithm_summary
    ?algorithm_description:(algorithm_description_ : entity_description option)
    ~algorithm_status:(algorithm_status_ : algorithm_status)
    ~creation_time:(creation_time_ : creation_time) ~algorithm_arn:(algorithm_arn_ : algorithm_arn)
    ~algorithm_name:(algorithm_name_ : entity_name) () =
  ({
     algorithm_status = algorithm_status_;
     creation_time = creation_time_;
     algorithm_description = algorithm_description_;
     algorithm_arn = algorithm_arn_;
     algorithm_name = algorithm_name_;
   }
    : algorithm_summary)

let make_list_algorithms_output ?next_token:(next_token_ : next_token option)
    ~algorithm_summary_list:(algorithm_summary_list_ : algorithm_summary_list) () =
  ({ next_token = next_token_; algorithm_summary_list = algorithm_summary_list_ }
    : list_algorithms_output)

let make_list_algorithms_input ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : algorithm_sort_by option) ?next_token:(next_token_ : next_token option)
    ?name_contains:(name_contains_ : name_contains option)
    ?max_results:(max_results_ : max_results option)
    ?creation_time_before:(creation_time_before_ : creation_time option)
    ?creation_time_after:(creation_time_after_ : creation_time option) () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     next_token = next_token_;
     name_contains = name_contains_;
     max_results = max_results_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_algorithms_input)

let make_ai_workload_config_summary ~creation_time:(creation_time_ : timestamp)
    ~ai_workload_config_arn:(ai_workload_config_arn_ : ai_workload_config_arn)
    ~ai_workload_config_name:(ai_workload_config_name_ : ai_entity_name) () =
  ({
     creation_time = creation_time_;
     ai_workload_config_arn = ai_workload_config_arn_;
     ai_workload_config_name = ai_workload_config_name_;
   }
    : ai_workload_config_summary)

let make_list_ai_workload_configs_response ?next_token:(next_token_ : next_token option)
    ~ai_workload_configs:(ai_workload_configs_ : ai_workload_config_summary_list) () =
  ({ next_token = next_token_; ai_workload_configs = ai_workload_configs_ }
    : list_ai_workload_configs_response)

let make_list_ai_workload_configs_request ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : list_ai_workload_configs_sort_by option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?name_contains:(name_contains_ : name_contains option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     name_contains = name_contains_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_ai_workload_configs_request)

let make_ai_recommendation_job_summary ?end_time:(end_time_ : timestamp option)
    ~creation_time:(creation_time_ : timestamp)
    ~ai_recommendation_job_status:(ai_recommendation_job_status_ : ai_recommendation_job_status)
    ~ai_recommendation_job_arn:(ai_recommendation_job_arn_ : ai_recommendation_job_arn)
    ~ai_recommendation_job_name:(ai_recommendation_job_name_ : ai_entity_name) () =
  ({
     end_time = end_time_;
     creation_time = creation_time_;
     ai_recommendation_job_status = ai_recommendation_job_status_;
     ai_recommendation_job_arn = ai_recommendation_job_arn_;
     ai_recommendation_job_name = ai_recommendation_job_name_;
   }
    : ai_recommendation_job_summary)

let make_list_ai_recommendation_jobs_response ?next_token:(next_token_ : next_token option)
    ~ai_recommendation_jobs:(ai_recommendation_jobs_ : ai_recommendation_job_summary_list) () =
  ({ next_token = next_token_; ai_recommendation_jobs = ai_recommendation_jobs_ }
    : list_ai_recommendation_jobs_response)

let make_list_ai_recommendation_jobs_request ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : list_ai_recommendation_jobs_sort_by option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?status_equals:(status_equals_ : ai_recommendation_job_status option)
    ?name_contains:(name_contains_ : name_contains option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     status_equals = status_equals_;
     name_contains = name_contains_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_ai_recommendation_jobs_request)

let make_ai_benchmark_job_summary
    ?ai_workload_config_name:(ai_workload_config_name_ : ai_entity_name option)
    ?end_time:(end_time_ : timestamp option) ~creation_time:(creation_time_ : timestamp)
    ~ai_benchmark_job_status:(ai_benchmark_job_status_ : ai_benchmark_job_status)
    ~ai_benchmark_job_arn:(ai_benchmark_job_arn_ : ai_benchmark_job_arn)
    ~ai_benchmark_job_name:(ai_benchmark_job_name_ : ai_entity_name) () =
  ({
     ai_workload_config_name = ai_workload_config_name_;
     end_time = end_time_;
     creation_time = creation_time_;
     ai_benchmark_job_status = ai_benchmark_job_status_;
     ai_benchmark_job_arn = ai_benchmark_job_arn_;
     ai_benchmark_job_name = ai_benchmark_job_name_;
   }
    : ai_benchmark_job_summary)

let make_list_ai_benchmark_jobs_response ?next_token:(next_token_ : next_token option)
    ~ai_benchmark_jobs:(ai_benchmark_jobs_ : ai_benchmark_job_summary_list) () =
  ({ next_token = next_token_; ai_benchmark_jobs = ai_benchmark_jobs_ }
    : list_ai_benchmark_jobs_response)

let make_list_ai_benchmark_jobs_request ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : list_ai_benchmark_jobs_sort_by option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?status_equals:(status_equals_ : ai_benchmark_job_status option)
    ?name_contains:(name_contains_ : name_contains option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     status_equals = status_equals_;
     name_contains = name_contains_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_ai_benchmark_jobs_request)

let make_action_source ?source_id:(source_id_ : string256 option)
    ?source_type:(source_type_ : string256 option) ~source_uri:(source_uri_ : source_uri) () =
  ({ source_id = source_id_; source_type = source_type_; source_uri = source_uri_ } : action_source)

let make_action_summary ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?status:(status_ : action_status option)
    ?action_type:(action_type_ : string64 option) ?source:(source_ : action_source option)
    ?action_name:(action_name_ : experiment_entity_name option)
    ?action_arn:(action_arn_ : action_arn option) () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     status = status_;
     action_type = action_type_;
     source = source_;
     action_name = action_name_;
     action_arn = action_arn_;
   }
    : action_summary)

let make_list_actions_response ?next_token:(next_token_ : next_token option)
    ?action_summaries:(action_summaries_ : action_summaries option) () =
  ({ next_token = next_token_; action_summaries = action_summaries_ } : list_actions_response)

let make_list_actions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : sort_actions_by option)
    ?created_before:(created_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option)
    ?action_type:(action_type_ : string256 option) ?source_uri:(source_uri_ : source_uri option) ()
    =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     created_before = created_before_;
     created_after = created_after_;
     action_type = action_type_;
     source_uri = source_uri_;
   }
    : list_actions_request)

let make_import_hub_content_response ~hub_content_arn:(hub_content_arn_ : hub_content_arn)
    ~hub_arn:(hub_arn_ : hub_arn) () =
  ({ hub_content_arn = hub_content_arn_; hub_arn = hub_arn_ } : import_hub_content_response)

let make_import_hub_content_request ?tags:(tags_ : tag_list option)
    ?hub_content_search_keywords:
      (hub_content_search_keywords_ : hub_content_search_keyword_list option)
    ?support_status:(support_status_ : hub_content_support_status option)
    ?hub_content_markdown:(hub_content_markdown_ : hub_content_markdown option)
    ?hub_content_description:(hub_content_description_ : hub_content_description option)
    ?hub_content_display_name:(hub_content_display_name_ : hub_content_display_name option)
    ?hub_content_version:(hub_content_version_ : hub_content_version option)
    ~hub_content_document:(hub_content_document_ : hub_content_document)
    ~hub_name:(hub_name_ : hub_name_or_arn)
    ~document_schema_version:(document_schema_version_ : document_schema_version)
    ~hub_content_type:(hub_content_type_ : hub_content_type)
    ~hub_content_name:(hub_content_name_ : hub_content_name) () =
  ({
     tags = tags_;
     hub_content_search_keywords = hub_content_search_keywords_;
     support_status = support_status_;
     hub_content_document = hub_content_document_;
     hub_content_markdown = hub_content_markdown_;
     hub_content_description = hub_content_description_;
     hub_content_display_name = hub_content_display_name_;
     hub_name = hub_name_;
     document_schema_version = document_schema_version_;
     hub_content_type = hub_content_type_;
     hub_content_version = hub_content_version_;
     hub_content_name = hub_content_name_;
   }
    : import_hub_content_request)

let make_property_name_suggestion ?property_name:(property_name_ : resource_property_name option) ()
    =
  ({ property_name = property_name_ } : property_name_suggestion)

let make_get_search_suggestions_response
    ?property_name_suggestions:(property_name_suggestions_ : property_name_suggestion_list option)
    () =
  ({ property_name_suggestions = property_name_suggestions_ } : get_search_suggestions_response)

let make_get_search_suggestions_request
    ?suggestion_query:(suggestion_query_ : suggestion_query option)
    ~resource:(resource_ : resource_type) () =
  ({ suggestion_query = suggestion_query_; resource = resource_ } : get_search_suggestions_request)

let make_dynamic_scaling_configuration
    ?scaling_policies:(scaling_policies_ : scaling_policies option)
    ?scale_out_cooldown:(scale_out_cooldown_ : integer option)
    ?scale_in_cooldown:(scale_in_cooldown_ : integer option)
    ?max_capacity:(max_capacity_ : integer option) ?min_capacity:(min_capacity_ : integer option) ()
    =
  ({
     scaling_policies = scaling_policies_;
     scale_out_cooldown = scale_out_cooldown_;
     scale_in_cooldown = scale_in_cooldown_;
     max_capacity = max_capacity_;
     min_capacity = min_capacity_;
   }
    : dynamic_scaling_configuration)

let make_get_scaling_configuration_recommendation_response
    ?dynamic_scaling_configuration:
      (dynamic_scaling_configuration_ : dynamic_scaling_configuration option)
    ?metric:(metric_ : scaling_policy_metric option)
    ?scaling_policy_objective:(scaling_policy_objective_ : scaling_policy_objective option)
    ?target_cpu_utilization_per_core:
      (target_cpu_utilization_per_core_ : utilization_percentage_per_core option)
    ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ?recommendation_id:(recommendation_id_ : string_ option)
    ?inference_recommendations_job_name:
      (inference_recommendations_job_name_ : recommendation_job_name option) () =
  ({
     dynamic_scaling_configuration = dynamic_scaling_configuration_;
     metric = metric_;
     scaling_policy_objective = scaling_policy_objective_;
     target_cpu_utilization_per_core = target_cpu_utilization_per_core_;
     endpoint_name = endpoint_name_;
     recommendation_id = recommendation_id_;
     inference_recommendations_job_name = inference_recommendations_job_name_;
   }
    : get_scaling_configuration_recommendation_response)

let make_get_scaling_configuration_recommendation_request
    ?scaling_policy_objective:(scaling_policy_objective_ : scaling_policy_objective option)
    ?target_cpu_utilization_per_core:
      (target_cpu_utilization_per_core_ : utilization_percentage_per_core option)
    ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ?recommendation_id:(recommendation_id_ : string_ option)
    ~inference_recommendations_job_name:
      (inference_recommendations_job_name_ : recommendation_job_name) () =
  ({
     scaling_policy_objective = scaling_policy_objective_;
     target_cpu_utilization_per_core = target_cpu_utilization_per_core_;
     endpoint_name = endpoint_name_;
     recommendation_id = recommendation_id_;
     inference_recommendations_job_name = inference_recommendations_job_name_;
   }
    : get_scaling_configuration_recommendation_request)

let make_get_sagemaker_servicecatalog_portfolio_status_output
    ?status:(status_ : sagemaker_servicecatalog_status option) () =
  ({ status = status_ } : get_sagemaker_servicecatalog_portfolio_status_output)

let make_get_sagemaker_servicecatalog_portfolio_status_input () = (() : unit)

let make_get_model_package_group_policy_output ~resource_policy:(resource_policy_ : policy_string)
    () =
  ({ resource_policy = resource_policy_ } : get_model_package_group_policy_output)

let make_get_model_package_group_policy_input
    ~model_package_group_name:(model_package_group_name_ : entity_name) () =
  ({ model_package_group_name = model_package_group_name_ } : get_model_package_group_policy_input)

let make_get_lineage_group_policy_response
    ?resource_policy:(resource_policy_ : resource_policy_string option)
    ?lineage_group_arn:(lineage_group_arn_ : lineage_group_arn option) () =
  ({ resource_policy = resource_policy_; lineage_group_arn = lineage_group_arn_ }
    : get_lineage_group_policy_response)

let make_get_lineage_group_policy_request
    ~lineage_group_name:(lineage_group_name_ : lineage_group_name_or_arn) () =
  ({ lineage_group_name = lineage_group_name_ } : get_lineage_group_policy_request)

let make_device_stats ~registered_device_count:(registered_device_count_ : long)
    ~connected_device_count:(connected_device_count_ : long) () =
  ({
     registered_device_count = registered_device_count_;
     connected_device_count = connected_device_count_;
   }
    : device_stats)

let make_agent_version ~agent_count:(agent_count_ : long) ~version:(version_ : edge_version) () =
  ({ agent_count = agent_count_; version = version_ } : agent_version)

let make_edge_model_stat ~sampling_device_count:(sampling_device_count_ : long)
    ~active_device_count:(active_device_count_ : long)
    ~connected_device_count:(connected_device_count_ : long)
    ~offline_device_count:(offline_device_count_ : long)
    ~model_version:(model_version_ : edge_version) ~model_name:(model_name_ : entity_name) () =
  ({
     sampling_device_count = sampling_device_count_;
     active_device_count = active_device_count_;
     connected_device_count = connected_device_count_;
     offline_device_count = offline_device_count_;
     model_version = model_version_;
     model_name = model_name_;
   }
    : edge_model_stat)

let make_get_device_fleet_report_response ?model_stats:(model_stats_ : edge_model_stats option)
    ?agent_versions:(agent_versions_ : agent_versions option)
    ?device_stats:(device_stats_ : device_stats option)
    ?report_generated:(report_generated_ : timestamp option)
    ?description:(description_ : device_fleet_description option)
    ?output_config:(output_config_ : edge_output_config option)
    ~device_fleet_name:(device_fleet_name_ : entity_name)
    ~device_fleet_arn:(device_fleet_arn_ : device_fleet_arn) () =
  ({
     model_stats = model_stats_;
     agent_versions = agent_versions_;
     device_stats = device_stats_;
     report_generated = report_generated_;
     description = description_;
     output_config = output_config_;
     device_fleet_name = device_fleet_name_;
     device_fleet_arn = device_fleet_arn_;
   }
    : get_device_fleet_report_response)

let make_get_device_fleet_report_request ~device_fleet_name:(device_fleet_name_ : entity_name) () =
  ({ device_fleet_name = device_fleet_name_ } : get_device_fleet_report_request)

let make_extend_training_plan_response
    ~training_plan_extensions:(training_plan_extensions_ : training_plan_extensions) () =
  ({ training_plan_extensions = training_plan_extensions_ } : extend_training_plan_response)

let make_extend_training_plan_request
    ~training_plan_extension_offering_id:
      (training_plan_extension_offering_id_ : training_plan_extension_offering_id) () =
  ({ training_plan_extension_offering_id = training_plan_extension_offering_id_ }
    : extend_training_plan_request)

let make_enable_sagemaker_servicecatalog_portfolio_output () = (() : unit)
let make_enable_sagemaker_servicecatalog_portfolio_input () = (() : unit)

let make_disassociate_trial_component_response ?trial_arn:(trial_arn_ : trial_arn option)
    ?trial_component_arn:(trial_component_arn_ : trial_component_arn option) () =
  ({ trial_arn = trial_arn_; trial_component_arn = trial_component_arn_ }
    : disassociate_trial_component_response)

let make_disassociate_trial_component_request ~trial_name:(trial_name_ : experiment_entity_name)
    ~trial_component_name:(trial_component_name_ : experiment_entity_name) () =
  ({ trial_name = trial_name_; trial_component_name = trial_component_name_ }
    : disassociate_trial_component_request)

let make_disable_sagemaker_servicecatalog_portfolio_output () = (() : unit)
let make_disable_sagemaker_servicecatalog_portfolio_input () = (() : unit)

let make_detach_cluster_node_volume_response ~device_name:(device_name_ : volume_device_name)
    ~status:(status_ : volume_attachment_status) ~attach_time:(attach_time_ : timestamp)
    ~volume_id:(volume_id_ : volume_id) ~node_id:(node_id_ : cluster_node_id)
    ~cluster_arn:(cluster_arn_ : cluster_arn) () =
  ({
     device_name = device_name_;
     status = status_;
     attach_time = attach_time_;
     volume_id = volume_id_;
     node_id = node_id_;
     cluster_arn = cluster_arn_;
   }
    : detach_cluster_node_volume_response)

let make_detach_cluster_node_volume_request ~volume_id:(volume_id_ : volume_id)
    ~node_id:(node_id_ : cluster_node_id) ~cluster_arn:(cluster_arn_ : cluster_arn) () =
  ({ volume_id = volume_id_; node_id = node_id_; cluster_arn = cluster_arn_ }
    : detach_cluster_node_volume_request)

let make_describe_workteam_response ~workteam:(workteam_ : workteam) () =
  ({ workteam = workteam_ } : describe_workteam_response)

let make_describe_workteam_request ~workteam_name:(workteam_name_ : workteam_name) () =
  ({ workteam_name = workteam_name_ } : describe_workteam_request)

let make_describe_workforce_response ~workforce:(workforce_ : workforce) () =
  ({ workforce = workforce_ } : describe_workforce_response)

let make_describe_workforce_request ~workforce_name:(workforce_name_ : workforce_name) () =
  ({ workforce_name = workforce_name_ } : describe_workforce_request)

let make_describe_user_profile_response ?user_settings:(user_settings_ : user_settings option)
    ?single_sign_on_user_value:(single_sign_on_user_value_ : string256 option)
    ?single_sign_on_user_identifier:
      (single_sign_on_user_identifier_ : single_sign_on_user_identifier option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?creation_time:(creation_time_ : creation_time option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?status:(status_ : user_profile_status option)
    ?home_efs_file_system_uid:(home_efs_file_system_uid_ : efs_uid option)
    ?user_profile_name:(user_profile_name_ : user_profile_name option)
    ?user_profile_arn:(user_profile_arn_ : user_profile_arn option)
    ?domain_id:(domain_id_ : domain_id option) () =
  ({
     user_settings = user_settings_;
     single_sign_on_user_value = single_sign_on_user_value_;
     single_sign_on_user_identifier = single_sign_on_user_identifier_;
     failure_reason = failure_reason_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     status = status_;
     home_efs_file_system_uid = home_efs_file_system_uid_;
     user_profile_name = user_profile_name_;
     user_profile_arn = user_profile_arn_;
     domain_id = domain_id_;
   }
    : describe_user_profile_response)

let make_describe_user_profile_request ~user_profile_name:(user_profile_name_ : user_profile_name)
    ~domain_id:(domain_id_ : domain_id) () =
  ({ user_profile_name = user_profile_name_; domain_id = domain_id_ }
    : describe_user_profile_request)

let make_describe_trial_component_response ?sources:(sources_ : trial_component_sources option)
    ?lineage_group_arn:(lineage_group_arn_ : lineage_group_arn option)
    ?metrics:(metrics_ : trial_component_metric_summaries option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?output_artifacts:(output_artifacts_ : trial_component_artifacts option)
    ?input_artifacts:(input_artifacts_ : trial_component_artifacts option)
    ?parameters:(parameters_ : trial_component_parameters option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?creation_time:(creation_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option) ?status:(status_ : trial_component_status option)
    ?source:(source_ : trial_component_source option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?trial_component_arn:(trial_component_arn_ : trial_component_arn option)
    ?trial_component_name:(trial_component_name_ : experiment_entity_name option) () =
  ({
     sources = sources_;
     lineage_group_arn = lineage_group_arn_;
     metrics = metrics_;
     metadata_properties = metadata_properties_;
     output_artifacts = output_artifacts_;
     input_artifacts = input_artifacts_;
     parameters = parameters_;
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     created_by = created_by_;
     creation_time = creation_time_;
     end_time = end_time_;
     start_time = start_time_;
     status = status_;
     source = source_;
     display_name = display_name_;
     trial_component_arn = trial_component_arn_;
     trial_component_name = trial_component_name_;
   }
    : describe_trial_component_response)

let make_describe_trial_component_request
    ~trial_component_name:(trial_component_name_ : experiment_entity_name_or_arn) () =
  ({ trial_component_name = trial_component_name_ } : describe_trial_component_request)

let make_describe_trial_response
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?creation_time:(creation_time_ : timestamp option) ?source:(source_ : trial_source option)
    ?experiment_name:(experiment_name_ : experiment_entity_name option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?trial_arn:(trial_arn_ : trial_arn option)
    ?trial_name:(trial_name_ : experiment_entity_name option) () =
  ({
     metadata_properties = metadata_properties_;
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     created_by = created_by_;
     creation_time = creation_time_;
     source = source_;
     experiment_name = experiment_name_;
     display_name = display_name_;
     trial_arn = trial_arn_;
     trial_name = trial_name_;
   }
    : describe_trial_response)

let make_describe_trial_request ~trial_name:(trial_name_ : experiment_entity_name) () =
  ({ trial_name = trial_name_ } : describe_trial_request)

let make_describe_transform_job_response
    ?experiment_config:(experiment_config_ : experiment_config option)
    ?data_processing:(data_processing_ : data_processing option)
    ?auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn option)
    ?labeling_job_arn:(labeling_job_arn_ : labeling_job_arn option)
    ?transform_end_time:(transform_end_time_ : timestamp option)
    ?transform_start_time:(transform_start_time_ : timestamp option)
    ?data_capture_config:(data_capture_config_ : batch_data_capture_config option)
    ?transform_output:(transform_output_ : transform_output option)
    ?environment:(environment_ : transform_environment_map option)
    ?batch_strategy:(batch_strategy_ : batch_strategy option)
    ?max_payload_in_m_b:(max_payload_in_m_b_ : max_payload_in_m_b option)
    ?model_client_config:(model_client_config_ : model_client_config option)
    ?max_concurrent_transforms:(max_concurrent_transforms_ : max_concurrent_transforms option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ~creation_time:(creation_time_ : timestamp)
    ~transform_resources:(transform_resources_ : transform_resources)
    ~transform_input:(transform_input_ : transform_input) ~model_name:(model_name_ : model_name)
    ~transform_job_status:(transform_job_status_ : transform_job_status)
    ~transform_job_arn:(transform_job_arn_ : transform_job_arn)
    ~transform_job_name:(transform_job_name_ : transform_job_name) () =
  ({
     experiment_config = experiment_config_;
     data_processing = data_processing_;
     auto_ml_job_arn = auto_ml_job_arn_;
     labeling_job_arn = labeling_job_arn_;
     transform_end_time = transform_end_time_;
     transform_start_time = transform_start_time_;
     creation_time = creation_time_;
     transform_resources = transform_resources_;
     data_capture_config = data_capture_config_;
     transform_output = transform_output_;
     transform_input = transform_input_;
     environment = environment_;
     batch_strategy = batch_strategy_;
     max_payload_in_m_b = max_payload_in_m_b_;
     model_client_config = model_client_config_;
     max_concurrent_transforms = max_concurrent_transforms_;
     model_name = model_name_;
     failure_reason = failure_reason_;
     transform_job_status = transform_job_status_;
     transform_job_arn = transform_job_arn_;
     transform_job_name = transform_job_name_;
   }
    : describe_transform_job_response)

let make_describe_transform_job_request
    ~transform_job_name:(transform_job_name_ : transform_job_name) () =
  ({ transform_job_name = transform_job_name_ } : describe_transform_job_request)

let make_describe_training_plan_extension_history_response
    ?next_token:(next_token_ : next_token option)
    ~training_plan_extensions:(training_plan_extensions_ : training_plan_extensions) () =
  ({ next_token = next_token_; training_plan_extensions = training_plan_extensions_ }
    : describe_training_plan_extension_history_response)

let make_describe_training_plan_extension_history_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~training_plan_arn:(training_plan_arn_ : training_plan_arn) () =
  ({ max_results = max_results_; next_token = next_token_; training_plan_arn = training_plan_arn_ }
    : describe_training_plan_extension_history_request)

let make_describe_training_plan_response
    ?reserved_capacity_summaries:(reserved_capacity_summaries_ : reserved_capacity_summaries option)
    ?target_resources:(target_resources_ : sage_maker_resource_names option)
    ?total_ultra_server_count:(total_ultra_server_count_ : ultra_server_count option)
    ?available_spare_instance_count:
      (available_spare_instance_count_ : available_spare_instance_count option)
    ?unhealthy_instance_count:(unhealthy_instance_count_ : unhealthy_instance_count option)
    ?in_use_instance_count:(in_use_instance_count_ : in_use_instance_count option)
    ?available_instance_count:(available_instance_count_ : available_instance_count option)
    ?total_instance_count:(total_instance_count_ : total_instance_count option)
    ?currency_code:(currency_code_ : currency_code option)
    ?upfront_fee:(upfront_fee_ : string256 option) ?end_time:(end_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option)
    ?duration_minutes:(duration_minutes_ : training_plan_duration_minutes option)
    ?duration_hours:(duration_hours_ : training_plan_duration_hours option)
    ?status_message:(status_message_ : training_plan_status_message option)
    ~status:(status_ : training_plan_status)
    ~training_plan_name:(training_plan_name_ : training_plan_name)
    ~training_plan_arn:(training_plan_arn_ : training_plan_arn) () =
  ({
     reserved_capacity_summaries = reserved_capacity_summaries_;
     target_resources = target_resources_;
     total_ultra_server_count = total_ultra_server_count_;
     available_spare_instance_count = available_spare_instance_count_;
     unhealthy_instance_count = unhealthy_instance_count_;
     in_use_instance_count = in_use_instance_count_;
     available_instance_count = available_instance_count_;
     total_instance_count = total_instance_count_;
     currency_code = currency_code_;
     upfront_fee = upfront_fee_;
     end_time = end_time_;
     start_time = start_time_;
     duration_minutes = duration_minutes_;
     duration_hours = duration_hours_;
     status_message = status_message_;
     status = status_;
     training_plan_name = training_plan_name_;
     training_plan_arn = training_plan_arn_;
   }
    : describe_training_plan_response)

let make_describe_training_plan_request
    ~training_plan_name:(training_plan_name_ : training_plan_name) () =
  ({ training_plan_name = training_plan_name_ } : describe_training_plan_request)

let make_profiler_rule_evaluation_status
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?status_details:(status_details_ : status_details option)
    ?rule_evaluation_status:(rule_evaluation_status_ : rule_evaluation_status option)
    ?rule_evaluation_job_arn:(rule_evaluation_job_arn_ : processing_job_arn option)
    ?rule_configuration_name:(rule_configuration_name_ : rule_configuration_name option) () =
  ({
     last_modified_time = last_modified_time_;
     status_details = status_details_;
     rule_evaluation_status = rule_evaluation_status_;
     rule_evaluation_job_arn = rule_evaluation_job_arn_;
     rule_configuration_name = rule_configuration_name_;
   }
    : profiler_rule_evaluation_status)

let make_remote_debug_config
    ?enable_remote_debug:(enable_remote_debug_ : enable_remote_debug option) () =
  ({ enable_remote_debug = enable_remote_debug_ } : remote_debug_config)

let make_infra_check_config ?enable_infra_check:(enable_infra_check_ : enable_infra_check option) ()
    =
  ({ enable_infra_check = enable_infra_check_ } : infra_check_config)

let make_mlflow_config ?mlflow_run_name:(mlflow_run_name_ : mlflow_run_name option)
    ?mlflow_experiment_name:(mlflow_experiment_name_ : mlflow_experiment_name option)
    ~mlflow_resource_arn:(mlflow_resource_arn_ : ml_flow_resource_arn) () =
  ({
     mlflow_run_name = mlflow_run_name_;
     mlflow_experiment_name = mlflow_experiment_name_;
     mlflow_resource_arn = mlflow_resource_arn_;
   }
    : mlflow_config)

let make_mlflow_details ?mlflow_run_id:(mlflow_run_id_ : mlflow_run_id option)
    ?mlflow_experiment_id:(mlflow_experiment_id_ : mlflow_experiment_id option) () =
  ({ mlflow_run_id = mlflow_run_id_; mlflow_experiment_id = mlflow_experiment_id_ }
    : mlflow_details)

let make_describe_training_job_response
    ?output_model_package_arn:(output_model_package_arn_ : model_package_arn option)
    ?progress_info:(progress_info_ : training_progress_info option)
    ?mlflow_details:(mlflow_details_ : mlflow_details option)
    ?model_package_config:(model_package_config_ : model_package_config option)
    ?mlflow_config:(mlflow_config_ : mlflow_config option)
    ?serverless_job_config:(serverless_job_config_ : serverless_job_config option)
    ?infra_check_config:(infra_check_config_ : infra_check_config option)
    ?remote_debug_config:(remote_debug_config_ : remote_debug_config option)
    ?retry_strategy:(retry_strategy_ : retry_strategy option)
    ?environment:(environment_ : training_environment_map option)
    ?profiling_status:(profiling_status_ : profiling_status option)
    ?profiler_rule_evaluation_statuses:
      (profiler_rule_evaluation_statuses_ : profiler_rule_evaluation_statuses option)
    ?profiler_rule_configurations:
      (profiler_rule_configurations_ : profiler_rule_configurations option)
    ?profiler_config:(profiler_config_ : profiler_config option)
    ?debug_rule_evaluation_statuses:
      (debug_rule_evaluation_statuses_ : debug_rule_evaluation_statuses option)
    ?tensor_board_output_config:(tensor_board_output_config_ : tensor_board_output_config option)
    ?debug_rule_configurations:(debug_rule_configurations_ : debug_rule_configurations option)
    ?experiment_config:(experiment_config_ : experiment_config option)
    ?debug_hook_config:(debug_hook_config_ : debug_hook_config option)
    ?billable_token_count:(billable_token_count_ : billable_token_count option)
    ?billable_time_in_seconds:(billable_time_in_seconds_ : billable_time_in_seconds option)
    ?training_time_in_seconds:(training_time_in_seconds_ : training_time_in_seconds option)
    ?checkpoint_config:(checkpoint_config_ : checkpoint_config option)
    ?enable_managed_spot_training:(enable_managed_spot_training_ : boolean_ option)
    ?enable_inter_container_traffic_encryption:
      (enable_inter_container_traffic_encryption_ : boolean_ option)
    ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ?final_metric_data_list:(final_metric_data_list_ : final_metric_data_list option)
    ?secondary_status_transitions:
      (secondary_status_transitions_ : secondary_status_transitions option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?training_end_time:(training_end_time_ : timestamp option)
    ?training_start_time:(training_start_time_ : timestamp option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?warm_pool_status:(warm_pool_status_ : warm_pool_status option)
    ?resource_config:(resource_config_ : resource_config option)
    ?output_data_config:(output_data_config_ : output_data_config option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?role_arn:(role_arn_ : role_arn option)
    ?algorithm_specification:(algorithm_specification_ : algorithm_specification option)
    ?hyper_parameters:(hyper_parameters_ : hyper_parameters option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn option)
    ?labeling_job_arn:(labeling_job_arn_ : labeling_job_arn option)
    ?tuning_job_arn:(tuning_job_arn_ : hyper_parameter_tuning_job_arn option)
    ~creation_time:(creation_time_ : timestamp)
    ~stopping_condition:(stopping_condition_ : stopping_condition)
    ~secondary_status:(secondary_status_ : secondary_status)
    ~training_job_status:(training_job_status_ : training_job_status)
    ~model_artifacts:(model_artifacts_ : model_artifacts)
    ~training_job_arn:(training_job_arn_ : training_job_arn)
    ~training_job_name:(training_job_name_ : training_job_name) () =
  ({
     output_model_package_arn = output_model_package_arn_;
     progress_info = progress_info_;
     mlflow_details = mlflow_details_;
     model_package_config = model_package_config_;
     mlflow_config = mlflow_config_;
     serverless_job_config = serverless_job_config_;
     infra_check_config = infra_check_config_;
     remote_debug_config = remote_debug_config_;
     retry_strategy = retry_strategy_;
     environment = environment_;
     profiling_status = profiling_status_;
     profiler_rule_evaluation_statuses = profiler_rule_evaluation_statuses_;
     profiler_rule_configurations = profiler_rule_configurations_;
     profiler_config = profiler_config_;
     debug_rule_evaluation_statuses = debug_rule_evaluation_statuses_;
     tensor_board_output_config = tensor_board_output_config_;
     debug_rule_configurations = debug_rule_configurations_;
     experiment_config = experiment_config_;
     debug_hook_config = debug_hook_config_;
     billable_token_count = billable_token_count_;
     billable_time_in_seconds = billable_time_in_seconds_;
     training_time_in_seconds = training_time_in_seconds_;
     checkpoint_config = checkpoint_config_;
     enable_managed_spot_training = enable_managed_spot_training_;
     enable_inter_container_traffic_encryption = enable_inter_container_traffic_encryption_;
     enable_network_isolation = enable_network_isolation_;
     final_metric_data_list = final_metric_data_list_;
     secondary_status_transitions = secondary_status_transitions_;
     last_modified_time = last_modified_time_;
     training_end_time = training_end_time_;
     training_start_time = training_start_time_;
     creation_time = creation_time_;
     stopping_condition = stopping_condition_;
     vpc_config = vpc_config_;
     warm_pool_status = warm_pool_status_;
     resource_config = resource_config_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     role_arn = role_arn_;
     algorithm_specification = algorithm_specification_;
     hyper_parameters = hyper_parameters_;
     failure_reason = failure_reason_;
     secondary_status = secondary_status_;
     training_job_status = training_job_status_;
     model_artifacts = model_artifacts_;
     auto_ml_job_arn = auto_ml_job_arn_;
     labeling_job_arn = labeling_job_arn_;
     tuning_job_arn = tuning_job_arn_;
     training_job_arn = training_job_arn_;
     training_job_name = training_job_name_;
   }
    : describe_training_job_response)

let make_describe_training_job_request ~training_job_name:(training_job_name_ : training_job_name)
    () =
  ({ training_job_name = training_job_name_ } : describe_training_job_request)

let make_describe_subscribed_workteam_response
    ~subscribed_workteam:(subscribed_workteam_ : subscribed_workteam) () =
  ({ subscribed_workteam = subscribed_workteam_ } : describe_subscribed_workteam_response)

let make_describe_subscribed_workteam_request ~workteam_arn:(workteam_arn_ : workteam_arn) () =
  ({ workteam_arn = workteam_arn_ } : describe_subscribed_workteam_request)

let make_describe_studio_lifecycle_config_response
    ?studio_lifecycle_config_app_type:
      (studio_lifecycle_config_app_type_ : studio_lifecycle_config_app_type option)
    ?studio_lifecycle_config_content:
      (studio_lifecycle_config_content_ : studio_lifecycle_config_content option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?studio_lifecycle_config_name:
      (studio_lifecycle_config_name_ : studio_lifecycle_config_name option)
    ?studio_lifecycle_config_arn:(studio_lifecycle_config_arn_ : studio_lifecycle_config_arn option)
    () =
  ({
     studio_lifecycle_config_app_type = studio_lifecycle_config_app_type_;
     studio_lifecycle_config_content = studio_lifecycle_config_content_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     studio_lifecycle_config_name = studio_lifecycle_config_name_;
     studio_lifecycle_config_arn = studio_lifecycle_config_arn_;
   }
    : describe_studio_lifecycle_config_response)

let make_describe_studio_lifecycle_config_request
    ~studio_lifecycle_config_name:(studio_lifecycle_config_name_ : studio_lifecycle_config_name) ()
    =
  ({ studio_lifecycle_config_name = studio_lifecycle_config_name_ }
    : describe_studio_lifecycle_config_request)

let make_ownership_settings ~owner_user_profile_name:(owner_user_profile_name_ : user_profile_name)
    () =
  ({ owner_user_profile_name = owner_user_profile_name_ } : ownership_settings)

let make_describe_space_response ?url:(url_ : string1024 option)
    ?space_display_name:(space_display_name_ : non_empty_string64 option)
    ?space_sharing_settings:(space_sharing_settings_ : space_sharing_settings option)
    ?ownership_settings:(ownership_settings_ : ownership_settings option)
    ?space_settings:(space_settings_ : space_settings option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?creation_time:(creation_time_ : creation_time option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?status:(status_ : space_status option)
    ?home_efs_file_system_uid:(home_efs_file_system_uid_ : efs_uid option)
    ?space_name:(space_name_ : space_name option) ?space_arn:(space_arn_ : space_arn option)
    ?domain_id:(domain_id_ : domain_id option) () =
  ({
     url = url_;
     space_display_name = space_display_name_;
     space_sharing_settings = space_sharing_settings_;
     ownership_settings = ownership_settings_;
     space_settings = space_settings_;
     failure_reason = failure_reason_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     status = status_;
     home_efs_file_system_uid = home_efs_file_system_uid_;
     space_name = space_name_;
     space_arn = space_arn_;
     domain_id = domain_id_;
   }
    : describe_space_response)

let make_describe_space_request ~space_name:(space_name_ : space_name)
    ~domain_id:(domain_id_ : domain_id) () =
  ({ space_name = space_name_; domain_id = domain_id_ } : describe_space_request)

let make_describe_reserved_capacity_response
    ?ultra_server_summary:(ultra_server_summary_ : ultra_server_summary option)
    ?in_use_instance_count:(in_use_instance_count_ : in_use_instance_count option)
    ?available_instance_count:(available_instance_count_ : available_instance_count option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?duration_minutes:(duration_minutes_ : reserved_capacity_duration_minutes option)
    ?duration_hours:(duration_hours_ : reserved_capacity_duration_hours option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?status:(status_ : reserved_capacity_status option)
    ?reserved_capacity_type:(reserved_capacity_type_ : reserved_capacity_type option)
    ~total_instance_count:(total_instance_count_ : total_instance_count)
    ~instance_type:(instance_type_ : reserved_capacity_instance_type)
    ~reserved_capacity_arn:(reserved_capacity_arn_ : reserved_capacity_arn) () =
  ({
     ultra_server_summary = ultra_server_summary_;
     in_use_instance_count = in_use_instance_count_;
     available_instance_count = available_instance_count_;
     total_instance_count = total_instance_count_;
     instance_type = instance_type_;
     end_time = end_time_;
     start_time = start_time_;
     duration_minutes = duration_minutes_;
     duration_hours = duration_hours_;
     availability_zone = availability_zone_;
     status = status_;
     reserved_capacity_type = reserved_capacity_type_;
     reserved_capacity_arn = reserved_capacity_arn_;
   }
    : describe_reserved_capacity_response)

let make_describe_reserved_capacity_request
    ~reserved_capacity_arn:(reserved_capacity_arn_ : reserved_capacity_arn) () =
  ({ reserved_capacity_arn = reserved_capacity_arn_ } : describe_reserved_capacity_request)

let make_describe_project_output ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?template_provider_details:(template_provider_details_ : template_provider_detail_list option)
    ?service_catalog_provisioned_product_details:
      (service_catalog_provisioned_product_details_ :
         service_catalog_provisioned_product_details option)
    ?service_catalog_provisioning_details:
      (service_catalog_provisioning_details_ : service_catalog_provisioning_details option)
    ?project_description:(project_description_ : entity_description option)
    ~creation_time:(creation_time_ : timestamp) ~project_status:(project_status_ : project_status)
    ~project_id:(project_id_ : project_id) ~project_name:(project_name_ : project_entity_name)
    ~project_arn:(project_arn_ : project_arn) () =
  ({
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     created_by = created_by_;
     template_provider_details = template_provider_details_;
     project_status = project_status_;
     service_catalog_provisioned_product_details = service_catalog_provisioned_product_details_;
     service_catalog_provisioning_details = service_catalog_provisioning_details_;
     project_description = project_description_;
     project_id = project_id_;
     project_name = project_name_;
     project_arn = project_arn_;
   }
    : describe_project_output)

let make_describe_project_input ~project_name:(project_name_ : project_entity_name) () =
  ({ project_name = project_name_ } : describe_project_input)

let make_describe_processing_job_response
    ?training_job_arn:(training_job_arn_ : training_job_arn option)
    ?auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn option)
    ?monitoring_schedule_arn:(monitoring_schedule_arn_ : monitoring_schedule_arn option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?processing_start_time:(processing_start_time_ : timestamp option)
    ?processing_end_time:(processing_end_time_ : timestamp option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?exit_message:(exit_message_ : exit_message option)
    ?experiment_config:(experiment_config_ : experiment_config option)
    ?role_arn:(role_arn_ : role_arn option)
    ?network_config:(network_config_ : network_config option)
    ?environment:(environment_ : processing_environment_map option)
    ?stopping_condition:(stopping_condition_ : processing_stopping_condition option)
    ?processing_output_config:(processing_output_config_ : processing_output_config option)
    ?processing_inputs:(processing_inputs_ : processing_inputs option)
    ~creation_time:(creation_time_ : timestamp)
    ~processing_job_status:(processing_job_status_ : processing_job_status)
    ~processing_job_arn:(processing_job_arn_ : processing_job_arn)
    ~app_specification:(app_specification_ : app_specification)
    ~processing_resources:(processing_resources_ : processing_resources)
    ~processing_job_name:(processing_job_name_ : processing_job_name) () =
  ({
     training_job_arn = training_job_arn_;
     auto_ml_job_arn = auto_ml_job_arn_;
     monitoring_schedule_arn = monitoring_schedule_arn_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     processing_start_time = processing_start_time_;
     processing_end_time = processing_end_time_;
     failure_reason = failure_reason_;
     exit_message = exit_message_;
     processing_job_status = processing_job_status_;
     processing_job_arn = processing_job_arn_;
     experiment_config = experiment_config_;
     role_arn = role_arn_;
     network_config = network_config_;
     environment = environment_;
     app_specification = app_specification_;
     stopping_condition = stopping_condition_;
     processing_resources = processing_resources_;
     processing_job_name = processing_job_name_;
     processing_output_config = processing_output_config_;
     processing_inputs = processing_inputs_;
   }
    : describe_processing_job_response)

let make_describe_processing_job_request
    ~processing_job_name:(processing_job_name_ : processing_job_name) () =
  ({ processing_job_name = processing_job_name_ } : describe_processing_job_request)

let make_m_lflow_configuration
    ?mlflow_experiment_name:(mlflow_experiment_name_ : mlflow_experiment_entity_name option)
    ?mlflow_resource_arn:(mlflow_resource_arn_ : m_lflow_arn option) () =
  ({ mlflow_experiment_name = mlflow_experiment_name_; mlflow_resource_arn = mlflow_resource_arn_ }
    : m_lflow_configuration)

let make_describe_pipeline_execution_response
    ?m_lflow_config:(m_lflow_config_ : m_lflow_configuration option)
    ?pipeline_version_id:(pipeline_version_id_ : pipeline_version_id option)
    ?selective_execution_config:(selective_execution_config_ : selective_execution_config option)
    ?parallelism_configuration:(parallelism_configuration_ : parallelism_configuration option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?failure_reason:(failure_reason_ : pipeline_execution_failure_reason option)
    ?pipeline_experiment_config:(pipeline_experiment_config_ : pipeline_experiment_config option)
    ?pipeline_execution_description:
      (pipeline_execution_description_ : pipeline_execution_description option)
    ?pipeline_execution_status:(pipeline_execution_status_ : pipeline_execution_status option)
    ?pipeline_execution_display_name:
      (pipeline_execution_display_name_ : pipeline_execution_name option)
    ?pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn option)
    ?pipeline_arn:(pipeline_arn_ : pipeline_arn option) () =
  ({
     m_lflow_config = m_lflow_config_;
     pipeline_version_id = pipeline_version_id_;
     selective_execution_config = selective_execution_config_;
     parallelism_configuration = parallelism_configuration_;
     last_modified_by = last_modified_by_;
     created_by = created_by_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     failure_reason = failure_reason_;
     pipeline_experiment_config = pipeline_experiment_config_;
     pipeline_execution_description = pipeline_execution_description_;
     pipeline_execution_status = pipeline_execution_status_;
     pipeline_execution_display_name = pipeline_execution_display_name_;
     pipeline_execution_arn = pipeline_execution_arn_;
     pipeline_arn = pipeline_arn_;
   }
    : describe_pipeline_execution_response)

let make_describe_pipeline_execution_request
    ~pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn) () =
  ({ pipeline_execution_arn = pipeline_execution_arn_ } : describe_pipeline_execution_request)

let make_describe_pipeline_definition_for_execution_response
    ?creation_time:(creation_time_ : timestamp option)
    ?pipeline_definition:(pipeline_definition_ : pipeline_definition option) () =
  ({ creation_time = creation_time_; pipeline_definition = pipeline_definition_ }
    : describe_pipeline_definition_for_execution_response)

let make_describe_pipeline_definition_for_execution_request
    ~pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn) () =
  ({ pipeline_execution_arn = pipeline_execution_arn_ }
    : describe_pipeline_definition_for_execution_request)

let make_describe_pipeline_response
    ?pipeline_version_description:
      (pipeline_version_description_ : pipeline_version_description option)
    ?pipeline_version_display_name:(pipeline_version_display_name_ : pipeline_version_name option)
    ?parallelism_configuration:(parallelism_configuration_ : parallelism_configuration option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?created_by:(created_by_ : user_context option)
    ?last_run_time:(last_run_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?pipeline_status:(pipeline_status_ : pipeline_status option)
    ?role_arn:(role_arn_ : role_arn option)
    ?pipeline_description:(pipeline_description_ : pipeline_description option)
    ?pipeline_definition:(pipeline_definition_ : pipeline_definition option)
    ?pipeline_display_name:(pipeline_display_name_ : pipeline_name option)
    ?pipeline_name:(pipeline_name_ : pipeline_name option)
    ?pipeline_arn:(pipeline_arn_ : pipeline_arn option) () =
  ({
     pipeline_version_description = pipeline_version_description_;
     pipeline_version_display_name = pipeline_version_display_name_;
     parallelism_configuration = parallelism_configuration_;
     last_modified_by = last_modified_by_;
     created_by = created_by_;
     last_run_time = last_run_time_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     pipeline_status = pipeline_status_;
     role_arn = role_arn_;
     pipeline_description = pipeline_description_;
     pipeline_definition = pipeline_definition_;
     pipeline_display_name = pipeline_display_name_;
     pipeline_name = pipeline_name_;
     pipeline_arn = pipeline_arn_;
   }
    : describe_pipeline_response)

let make_describe_pipeline_request
    ?pipeline_version_id:(pipeline_version_id_ : pipeline_version_id option)
    ~pipeline_name:(pipeline_name_ : pipeline_name_or_arn) () =
  ({ pipeline_version_id = pipeline_version_id_; pipeline_name = pipeline_name_ }
    : describe_pipeline_request)

let make_error_info ?reason:(reason_ : non_empty_string256 option)
    ?code:(code_ : non_empty_string64 option) () =
  ({ reason = reason_; code = code_ } : error_info)

let make_available_upgrade ?release_notes:(release_notes_ : release_notes_list option)
    ?version:(version_ : major_minor_version option) () =
  ({ release_notes = release_notes_; version = version_ } : available_upgrade)

let make_describe_partner_app_response
    ?available_upgrade:(available_upgrade_ : available_upgrade option)
    ?current_version_eol_date:(current_version_eol_date_ : timestamp option)
    ?enable_auto_minor_version_upgrade:(enable_auto_minor_version_upgrade_ : boolean_ option)
    ?error:(error_ : error_info option)
    ?enable_iam_session_based_identity:(enable_iam_session_based_identity_ : boolean_ option)
    ?auth_type:(auth_type_ : partner_app_auth_type option)
    ?application_config:(application_config_ : partner_app_config option)
    ?version:(version_ : non_empty_string64 option) ?tier:(tier_ : non_empty_string64 option)
    ?maintenance_config:(maintenance_config_ : partner_app_maintenance_config option)
    ?base_url:(base_url_ : string2048 option) ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?execution_role_arn:(execution_role_arn_ : role_arn option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?status:(status_ : partner_app_status option)
    ?type_:(type__ : partner_app_type option) ?name:(name_ : partner_app_name option)
    ?arn:(arn_ : partner_app_arn option) () =
  ({
     available_upgrade = available_upgrade_;
     current_version_eol_date = current_version_eol_date_;
     enable_auto_minor_version_upgrade = enable_auto_minor_version_upgrade_;
     error = error_;
     enable_iam_session_based_identity = enable_iam_session_based_identity_;
     auth_type = auth_type_;
     application_config = application_config_;
     version = version_;
     tier = tier_;
     maintenance_config = maintenance_config_;
     base_url = base_url_;
     kms_key_id = kms_key_id_;
     execution_role_arn = execution_role_arn_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     status = status_;
     type_ = type__;
     name = name_;
     arn = arn_;
   }
    : describe_partner_app_response)

let make_describe_partner_app_request
    ?include_available_upgrade:(include_available_upgrade_ : boolean_ option)
    ~arn:(arn_ : partner_app_arn) () =
  ({ include_available_upgrade = include_available_upgrade_; arn = arn_ }
    : describe_partner_app_request)

let make_optimization_model_access_config
    ~accept_eula:(accept_eula_ : optimization_model_accept_eula) () =
  ({ accept_eula = accept_eula_ } : optimization_model_access_config)

let make_optimization_job_model_source_s3
    ?model_access_config:(model_access_config_ : optimization_model_access_config option)
    ?s3_uri:(s3_uri_ : s3_uri option) () =
  ({ model_access_config = model_access_config_; s3_uri = s3_uri_ }
    : optimization_job_model_source_s3)

let make_optimization_sage_maker_model ?model_name:(model_name_ : model_name option) () =
  ({ model_name = model_name_ } : optimization_sage_maker_model)

let make_optimization_job_model_source
    ?sage_maker_model:(sage_maker_model_ : optimization_sage_maker_model option)
    ?s3:(s3_ : optimization_job_model_source_s3 option) () =
  ({ sage_maker_model = sage_maker_model_; s3 = s3_ } : optimization_job_model_source)

let make_model_quantization_config
    ?override_environment:(override_environment_ : optimization_job_environment_variables option)
    ?image:(image_ : optimization_container_image option) () =
  ({ override_environment = override_environment_; image = image_ } : model_quantization_config)

let make_model_compilation_config
    ?override_environment:(override_environment_ : optimization_job_environment_variables option)
    ?image:(image_ : optimization_container_image option) () =
  ({ override_environment = override_environment_; image = image_ } : model_compilation_config)

let make_model_sharding_config
    ?override_environment:(override_environment_ : optimization_job_environment_variables option)
    ?image:(image_ : optimization_container_image option) () =
  ({ override_environment = override_environment_; image = image_ } : model_sharding_config)

let make_model_speculative_decoding_training_data_source
    ~s3_data_type:(s3_data_type_ : model_speculative_decoding_s3_data_type)
    ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ s3_data_type = s3_data_type_; s3_uri = s3_uri_ }
    : model_speculative_decoding_training_data_source)

let make_model_speculative_decoding_config
    ?training_data_source:
      (training_data_source_ : model_speculative_decoding_training_data_source option)
    ~technique:(technique_ : model_speculative_decoding_technique) () =
  ({ training_data_source = training_data_source_; technique = technique_ }
    : model_speculative_decoding_config)

let make_optimization_job_output_config
    ?sage_maker_model:(sage_maker_model_ : optimization_sage_maker_model option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ~s3_output_location:(s3_output_location_ : s3_uri)
    () =
  ({
     sage_maker_model = sage_maker_model_;
     s3_output_location = s3_output_location_;
     kms_key_id = kms_key_id_;
   }
    : optimization_job_output_config)

let make_optimization_output
    ?recommended_inference_image:
      (recommended_inference_image_ : optimization_container_image option) () =
  ({ recommended_inference_image = recommended_inference_image_ } : optimization_output)

let make_optimization_vpc_config ~subnets:(subnets_ : optimization_vpc_subnets)
    ~security_group_ids:(security_group_ids_ : optimization_vpc_security_group_ids) () =
  ({ subnets = subnets_; security_group_ids = security_group_ids_ } : optimization_vpc_config)

let make_describe_optimization_job_response
    ?vpc_config:(vpc_config_ : optimization_vpc_config option)
    ?optimization_output:(optimization_output_ : optimization_output option)
    ?max_instance_count:(max_instance_count_ : optimization_job_max_instance_count option)
    ?optimization_environment:
      (optimization_environment_ : optimization_job_environment_variables option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?optimization_end_time:(optimization_end_time_ : timestamp option)
    ?optimization_start_time:(optimization_start_time_ : timestamp option)
    ~stopping_condition:(stopping_condition_ : stopping_condition) ~role_arn:(role_arn_ : role_arn)
    ~output_config:(output_config_ : optimization_job_output_config)
    ~optimization_configs:(optimization_configs_ : optimization_configs)
    ~deployment_instance_type:
      (deployment_instance_type_ : optimization_job_deployment_instance_type)
    ~model_source:(model_source_ : optimization_job_model_source)
    ~optimization_job_name:(optimization_job_name_ : entity_name)
    ~last_modified_time:(last_modified_time_ : last_modified_time)
    ~creation_time:(creation_time_ : creation_time)
    ~optimization_job_status:(optimization_job_status_ : optimization_job_status)
    ~optimization_job_arn:(optimization_job_arn_ : optimization_job_arn) () =
  ({
     vpc_config = vpc_config_;
     stopping_condition = stopping_condition_;
     role_arn = role_arn_;
     optimization_output = optimization_output_;
     output_config = output_config_;
     optimization_configs = optimization_configs_;
     max_instance_count = max_instance_count_;
     deployment_instance_type = deployment_instance_type_;
     optimization_environment = optimization_environment_;
     model_source = model_source_;
     optimization_job_name = optimization_job_name_;
     failure_reason = failure_reason_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     optimization_end_time = optimization_end_time_;
     optimization_start_time = optimization_start_time_;
     optimization_job_status = optimization_job_status_;
     optimization_job_arn = optimization_job_arn_;
   }
    : describe_optimization_job_response)

let make_describe_optimization_job_request
    ~optimization_job_name:(optimization_job_name_ : entity_name) () =
  ({ optimization_job_name = optimization_job_name_ } : describe_optimization_job_request)

let make_describe_notebook_instance_lifecycle_config_output
    ?creation_time:(creation_time_ : creation_time option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?on_start:(on_start_ : notebook_instance_lifecycle_config_list option)
    ?on_create:(on_create_ : notebook_instance_lifecycle_config_list option)
    ?notebook_instance_lifecycle_config_name:
      (notebook_instance_lifecycle_config_name_ : notebook_instance_lifecycle_config_name option)
    ?notebook_instance_lifecycle_config_arn:
      (notebook_instance_lifecycle_config_arn_ : notebook_instance_lifecycle_config_arn option) () =
  ({
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     on_start = on_start_;
     on_create = on_create_;
     notebook_instance_lifecycle_config_name = notebook_instance_lifecycle_config_name_;
     notebook_instance_lifecycle_config_arn = notebook_instance_lifecycle_config_arn_;
   }
    : describe_notebook_instance_lifecycle_config_output)

let make_describe_notebook_instance_lifecycle_config_input
    ~notebook_instance_lifecycle_config_name:
      (notebook_instance_lifecycle_config_name_ : notebook_instance_lifecycle_config_name) () =
  ({ notebook_instance_lifecycle_config_name = notebook_instance_lifecycle_config_name_ }
    : describe_notebook_instance_lifecycle_config_input)

let make_describe_notebook_instance_output
    ?instance_metadata_service_configuration:
      (instance_metadata_service_configuration_ : instance_metadata_service_configuration option)
    ?platform_identifier:(platform_identifier_ : platform_identifier option)
    ?root_access:(root_access_ : root_access option)
    ?additional_code_repositories:
      (additional_code_repositories_ : additional_code_repository_names_or_urls option)
    ?default_code_repository:(default_code_repository_ : code_repository_name_or_url option)
    ?accelerator_types:(accelerator_types_ : notebook_instance_accelerator_types option)
    ?volume_size_in_g_b:(volume_size_in_g_b_ : notebook_instance_volume_size_in_g_b option)
    ?direct_internet_access:(direct_internet_access_ : direct_internet_access option)
    ?notebook_instance_lifecycle_config_name:
      (notebook_instance_lifecycle_config_name_ : notebook_instance_lifecycle_config_name option)
    ?creation_time:(creation_time_ : creation_time option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?network_interface_id:(network_interface_id_ : network_interface_id option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ?role_arn:(role_arn_ : role_arn option)
    ?security_groups:(security_groups_ : security_group_ids option)
    ?subnet_id:(subnet_id_ : subnet_id option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?instance_type:(instance_type_ : instance_type option)
    ?url:(url_ : notebook_instance_url option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?notebook_instance_status:(notebook_instance_status_ : notebook_instance_status option)
    ?notebook_instance_name:(notebook_instance_name_ : notebook_instance_name option)
    ?notebook_instance_arn:(notebook_instance_arn_ : notebook_instance_arn option) () =
  ({
     instance_metadata_service_configuration = instance_metadata_service_configuration_;
     platform_identifier = platform_identifier_;
     root_access = root_access_;
     additional_code_repositories = additional_code_repositories_;
     default_code_repository = default_code_repository_;
     accelerator_types = accelerator_types_;
     volume_size_in_g_b = volume_size_in_g_b_;
     direct_internet_access = direct_internet_access_;
     notebook_instance_lifecycle_config_name = notebook_instance_lifecycle_config_name_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     network_interface_id = network_interface_id_;
     kms_key_id = kms_key_id_;
     role_arn = role_arn_;
     security_groups = security_groups_;
     subnet_id = subnet_id_;
     ip_address_type = ip_address_type_;
     instance_type = instance_type_;
     url = url_;
     failure_reason = failure_reason_;
     notebook_instance_status = notebook_instance_status_;
     notebook_instance_name = notebook_instance_name_;
     notebook_instance_arn = notebook_instance_arn_;
   }
    : describe_notebook_instance_output)

let make_describe_notebook_instance_input
    ~notebook_instance_name:(notebook_instance_name_ : notebook_instance_name) () =
  ({ notebook_instance_name = notebook_instance_name_ } : describe_notebook_instance_input)

let make_describe_monitoring_schedule_response
    ?last_monitoring_execution_summary:
      (last_monitoring_execution_summary_ : monitoring_execution_summary option)
    ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?monitoring_type:(monitoring_type_ : monitoring_type option)
    ~monitoring_schedule_config:(monitoring_schedule_config_ : monitoring_schedule_config)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp)
    ~monitoring_schedule_status:(monitoring_schedule_status_ : schedule_status)
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name)
    ~monitoring_schedule_arn:(monitoring_schedule_arn_ : monitoring_schedule_arn) () =
  ({
     last_monitoring_execution_summary = last_monitoring_execution_summary_;
     endpoint_name = endpoint_name_;
     monitoring_schedule_config = monitoring_schedule_config_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     failure_reason = failure_reason_;
     monitoring_type = monitoring_type_;
     monitoring_schedule_status = monitoring_schedule_status_;
     monitoring_schedule_name = monitoring_schedule_name_;
     monitoring_schedule_arn = monitoring_schedule_arn_;
   }
    : describe_monitoring_schedule_response)

let make_describe_monitoring_schedule_request
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name) () =
  ({ monitoring_schedule_name = monitoring_schedule_name_ } : describe_monitoring_schedule_request)

let make_model_quality_baseline_config
    ?constraints_resource:(constraints_resource_ : monitoring_constraints_resource option)
    ?baselining_job_name:(baselining_job_name_ : processing_job_name option) () =
  ({ constraints_resource = constraints_resource_; baselining_job_name = baselining_job_name_ }
    : model_quality_baseline_config)

let make_model_quality_app_specification
    ?environment:(environment_ : monitoring_environment_map option)
    ?problem_type:(problem_type_ : monitoring_problem_type option)
    ?post_analytics_processor_source_uri:(post_analytics_processor_source_uri_ : s3_uri option)
    ?record_preprocessor_source_uri:(record_preprocessor_source_uri_ : s3_uri option)
    ?container_arguments:(container_arguments_ : monitoring_container_arguments option)
    ?container_entrypoint:(container_entrypoint_ : container_entrypoint option)
    ~image_uri:(image_uri_ : image_uri) () =
  ({
     environment = environment_;
     problem_type = problem_type_;
     post_analytics_processor_source_uri = post_analytics_processor_source_uri_;
     record_preprocessor_source_uri = record_preprocessor_source_uri_;
     container_arguments = container_arguments_;
     container_entrypoint = container_entrypoint_;
     image_uri = image_uri_;
   }
    : model_quality_app_specification)

let make_monitoring_ground_truth_s3_input ?s3_uri:(s3_uri_ : monitoring_s3_uri option) () =
  ({ s3_uri = s3_uri_ } : monitoring_ground_truth_s3_input)

let make_model_quality_job_input
    ?batch_transform_input:(batch_transform_input_ : batch_transform_input option)
    ?endpoint_input:(endpoint_input_ : endpoint_input option)
    ~ground_truth_s3_input:(ground_truth_s3_input_ : monitoring_ground_truth_s3_input) () =
  ({
     ground_truth_s3_input = ground_truth_s3_input_;
     batch_transform_input = batch_transform_input_;
     endpoint_input = endpoint_input_;
   }
    : model_quality_job_input)

let make_monitoring_network_config ?vpc_config:(vpc_config_ : vpc_config option)
    ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ?enable_inter_container_traffic_encryption:
      (enable_inter_container_traffic_encryption_ : boolean_ option) () =
  ({
     vpc_config = vpc_config_;
     enable_network_isolation = enable_network_isolation_;
     enable_inter_container_traffic_encryption = enable_inter_container_traffic_encryption_;
   }
    : monitoring_network_config)

let make_describe_model_quality_job_definition_response
    ?stopping_condition:(stopping_condition_ : monitoring_stopping_condition option)
    ?network_config:(network_config_ : monitoring_network_config option)
    ?model_quality_baseline_config:
      (model_quality_baseline_config_ : model_quality_baseline_config option)
    ~role_arn:(role_arn_ : role_arn) ~job_resources:(job_resources_ : monitoring_resources)
    ~model_quality_job_output_config:(model_quality_job_output_config_ : monitoring_output_config)
    ~model_quality_job_input:(model_quality_job_input_ : model_quality_job_input)
    ~model_quality_app_specification:
      (model_quality_app_specification_ : model_quality_app_specification)
    ~creation_time:(creation_time_ : timestamp)
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name)
    ~job_definition_arn:(job_definition_arn_ : monitoring_job_definition_arn) () =
  ({
     stopping_condition = stopping_condition_;
     role_arn = role_arn_;
     network_config = network_config_;
     job_resources = job_resources_;
     model_quality_job_output_config = model_quality_job_output_config_;
     model_quality_job_input = model_quality_job_input_;
     model_quality_app_specification = model_quality_app_specification_;
     model_quality_baseline_config = model_quality_baseline_config_;
     creation_time = creation_time_;
     job_definition_name = job_definition_name_;
     job_definition_arn = job_definition_arn_;
   }
    : describe_model_quality_job_definition_response)

let make_describe_model_quality_job_definition_request
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name) () =
  ({ job_definition_name = job_definition_name_ } : describe_model_quality_job_definition_request)

let make_describe_model_package_group_output
    ?managed_configuration:(managed_configuration_ : managed_configuration option)
    ?model_package_group_description:(model_package_group_description_ : entity_description option)
    ~model_package_group_status:(model_package_group_status_ : model_package_group_status)
    ~created_by:(created_by_ : user_context) ~creation_time:(creation_time_ : creation_time)
    ~model_package_group_arn:(model_package_group_arn_ : model_package_group_arn)
    ~model_package_group_name:(model_package_group_name_ : entity_name) () =
  ({
     managed_configuration = managed_configuration_;
     model_package_group_status = model_package_group_status_;
     created_by = created_by_;
     creation_time = creation_time_;
     model_package_group_description = model_package_group_description_;
     model_package_group_arn = model_package_group_arn_;
     model_package_group_name = model_package_group_name_;
   }
    : describe_model_package_group_output)

let make_describe_model_package_group_input
    ~model_package_group_name:(model_package_group_name_ : arn_or_name) () =
  ({ model_package_group_name = model_package_group_name_ } : describe_model_package_group_input)

let make_describe_model_package_output
    ?managed_storage_type:(managed_storage_type_ : managed_storage_type option)
    ?model_life_cycle:(model_life_cycle_ : model_life_cycle option)
    ?model_card:(model_card_ : model_package_model_card option)
    ?security_config:(security_config_ : model_package_security_config option)
    ?source_uri:(source_uri_ : model_package_source_uri option)
    ?skip_model_validation:(skip_model_validation_ : skip_model_validation option)
    ?additional_inference_specifications:
      (additional_inference_specifications_ : additional_inference_specifications option)
    ?drift_check_baselines:(drift_check_baselines_ : drift_check_baselines option)
    ?customer_metadata_properties:(customer_metadata_properties_ : customer_metadata_map option)
    ?sample_payload_url:(sample_payload_url_ : string_ option) ?task:(task_ : string_ option)
    ?domain:(domain_ : string_ option)
    ?approval_description:(approval_description_ : approval_description option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?model_metrics:(model_metrics_ : model_metrics option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?created_by:(created_by_ : user_context option)
    ?model_approval_status:(model_approval_status_ : model_approval_status option)
    ?certify_for_marketplace:(certify_for_marketplace_ : certify_for_marketplace option)
    ?validation_specification:
      (validation_specification_ : model_package_validation_specification option)
    ?source_algorithm_specification:
      (source_algorithm_specification_ : source_algorithm_specification option)
    ?inference_specification:(inference_specification_ : inference_specification option)
    ?model_package_description:(model_package_description_ : entity_description option)
    ?model_package_registration_type:
      (model_package_registration_type_ : model_package_registration_type option)
    ?model_package_version:(model_package_version_ : model_package_version option)
    ?model_package_group_name:(model_package_group_name_ : entity_name option)
    ~model_package_status_details:(model_package_status_details_ : model_package_status_details)
    ~model_package_status:(model_package_status_ : model_package_status)
    ~creation_time:(creation_time_ : creation_time)
    ~model_package_arn:(model_package_arn_ : model_package_arn)
    ~model_package_name:(model_package_name_ : entity_name) () =
  ({
     managed_storage_type = managed_storage_type_;
     model_life_cycle = model_life_cycle_;
     model_card = model_card_;
     security_config = security_config_;
     source_uri = source_uri_;
     skip_model_validation = skip_model_validation_;
     additional_inference_specifications = additional_inference_specifications_;
     drift_check_baselines = drift_check_baselines_;
     customer_metadata_properties = customer_metadata_properties_;
     sample_payload_url = sample_payload_url_;
     task = task_;
     domain = domain_;
     approval_description = approval_description_;
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     model_metrics = model_metrics_;
     metadata_properties = metadata_properties_;
     created_by = created_by_;
     model_approval_status = model_approval_status_;
     certify_for_marketplace = certify_for_marketplace_;
     model_package_status_details = model_package_status_details_;
     model_package_status = model_package_status_;
     validation_specification = validation_specification_;
     source_algorithm_specification = source_algorithm_specification_;
     inference_specification = inference_specification_;
     creation_time = creation_time_;
     model_package_description = model_package_description_;
     model_package_arn = model_package_arn_;
     model_package_registration_type = model_package_registration_type_;
     model_package_version = model_package_version_;
     model_package_group_name = model_package_group_name_;
     model_package_name = model_package_name_;
   }
    : describe_model_package_output)

let make_describe_model_package_input ?included_data:(included_data_ : included_data option)
    ~model_package_name:(model_package_name_ : versioned_arn_or_name) () =
  ({ included_data = included_data_; model_package_name = model_package_name_ }
    : describe_model_package_input)

let make_model_explainability_baseline_config
    ?constraints_resource:(constraints_resource_ : monitoring_constraints_resource option)
    ?baselining_job_name:(baselining_job_name_ : processing_job_name option) () =
  ({ constraints_resource = constraints_resource_; baselining_job_name = baselining_job_name_ }
    : model_explainability_baseline_config)

let make_model_explainability_app_specification
    ?environment:(environment_ : monitoring_environment_map option)
    ~config_uri:(config_uri_ : s3_uri) ~image_uri:(image_uri_ : image_uri) () =
  ({ environment = environment_; config_uri = config_uri_; image_uri = image_uri_ }
    : model_explainability_app_specification)

let make_model_explainability_job_input
    ?batch_transform_input:(batch_transform_input_ : batch_transform_input option)
    ?endpoint_input:(endpoint_input_ : endpoint_input option) () =
  ({ batch_transform_input = batch_transform_input_; endpoint_input = endpoint_input_ }
    : model_explainability_job_input)

let make_describe_model_explainability_job_definition_response
    ?stopping_condition:(stopping_condition_ : monitoring_stopping_condition option)
    ?network_config:(network_config_ : monitoring_network_config option)
    ?model_explainability_baseline_config:
      (model_explainability_baseline_config_ : model_explainability_baseline_config option)
    ~role_arn:(role_arn_ : role_arn) ~job_resources:(job_resources_ : monitoring_resources)
    ~model_explainability_job_output_config:
      (model_explainability_job_output_config_ : monitoring_output_config)
    ~model_explainability_job_input:
      (model_explainability_job_input_ : model_explainability_job_input)
    ~model_explainability_app_specification:
      (model_explainability_app_specification_ : model_explainability_app_specification)
    ~creation_time:(creation_time_ : timestamp)
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name)
    ~job_definition_arn:(job_definition_arn_ : monitoring_job_definition_arn) () =
  ({
     stopping_condition = stopping_condition_;
     role_arn = role_arn_;
     network_config = network_config_;
     job_resources = job_resources_;
     model_explainability_job_output_config = model_explainability_job_output_config_;
     model_explainability_job_input = model_explainability_job_input_;
     model_explainability_app_specification = model_explainability_app_specification_;
     model_explainability_baseline_config = model_explainability_baseline_config_;
     creation_time = creation_time_;
     job_definition_name = job_definition_name_;
     job_definition_arn = job_definition_arn_;
   }
    : describe_model_explainability_job_definition_response)

let make_describe_model_explainability_job_definition_request
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name) () =
  ({ job_definition_name = job_definition_name_ }
    : describe_model_explainability_job_definition_request)

let make_model_card_export_output_config ~s3_output_path:(s3_output_path_ : s3_uri) () =
  ({ s3_output_path = s3_output_path_ } : model_card_export_output_config)

let make_model_card_export_artifacts ~s3_export_artifacts:(s3_export_artifacts_ : s3_uri) () =
  ({ s3_export_artifacts = s3_export_artifacts_ } : model_card_export_artifacts)

let make_describe_model_card_export_job_response
    ?export_artifacts:(export_artifacts_ : model_card_export_artifacts option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ~last_modified_at:(last_modified_at_ : timestamp) ~created_at:(created_at_ : timestamp)
    ~output_config:(output_config_ : model_card_export_output_config)
    ~model_card_version:(model_card_version_ : integer)
    ~model_card_name:(model_card_name_ : entity_name)
    ~status:(status_ : model_card_export_job_status)
    ~model_card_export_job_arn:(model_card_export_job_arn_ : model_card_export_job_arn)
    ~model_card_export_job_name:(model_card_export_job_name_ : entity_name) () =
  ({
     export_artifacts = export_artifacts_;
     failure_reason = failure_reason_;
     last_modified_at = last_modified_at_;
     created_at = created_at_;
     output_config = output_config_;
     model_card_version = model_card_version_;
     model_card_name = model_card_name_;
     status = status_;
     model_card_export_job_arn = model_card_export_job_arn_;
     model_card_export_job_name = model_card_export_job_name_;
   }
    : describe_model_card_export_job_response)

let make_describe_model_card_export_job_request
    ~model_card_export_job_arn:(model_card_export_job_arn_ : model_card_export_job_arn) () =
  ({ model_card_export_job_arn = model_card_export_job_arn_ }
    : describe_model_card_export_job_request)

let make_describe_model_card_response
    ?model_card_processing_status:
      (model_card_processing_status_ : model_card_processing_status option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?security_config:(security_config_ : model_card_security_config option)
    ~created_by:(created_by_ : user_context) ~creation_time:(creation_time_ : timestamp)
    ~model_card_status:(model_card_status_ : model_card_status)
    ~content:(content_ : model_card_content) ~model_card_version:(model_card_version_ : integer)
    ~model_card_name:(model_card_name_ : entity_name)
    ~model_card_arn:(model_card_arn_ : model_card_arn) () =
  ({
     model_card_processing_status = model_card_processing_status_;
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     created_by = created_by_;
     creation_time = creation_time_;
     security_config = security_config_;
     model_card_status = model_card_status_;
     content = content_;
     model_card_version = model_card_version_;
     model_card_name = model_card_name_;
     model_card_arn = model_card_arn_;
   }
    : describe_model_card_response)

let make_describe_model_card_request ?included_data:(included_data_ : included_data option)
    ?model_card_version:(model_card_version_ : integer option)
    ~model_card_name:(model_card_name_ : model_card_name_or_arn) () =
  ({
     included_data = included_data_;
     model_card_version = model_card_version_;
     model_card_name = model_card_name_;
   }
    : describe_model_card_request)

let make_model_bias_baseline_config
    ?constraints_resource:(constraints_resource_ : monitoring_constraints_resource option)
    ?baselining_job_name:(baselining_job_name_ : processing_job_name option) () =
  ({ constraints_resource = constraints_resource_; baselining_job_name = baselining_job_name_ }
    : model_bias_baseline_config)

let make_model_bias_app_specification
    ?environment:(environment_ : monitoring_environment_map option)
    ~config_uri:(config_uri_ : s3_uri) ~image_uri:(image_uri_ : image_uri) () =
  ({ environment = environment_; config_uri = config_uri_; image_uri = image_uri_ }
    : model_bias_app_specification)

let make_model_bias_job_input
    ?batch_transform_input:(batch_transform_input_ : batch_transform_input option)
    ?endpoint_input:(endpoint_input_ : endpoint_input option)
    ~ground_truth_s3_input:(ground_truth_s3_input_ : monitoring_ground_truth_s3_input) () =
  ({
     ground_truth_s3_input = ground_truth_s3_input_;
     batch_transform_input = batch_transform_input_;
     endpoint_input = endpoint_input_;
   }
    : model_bias_job_input)

let make_describe_model_bias_job_definition_response
    ?stopping_condition:(stopping_condition_ : monitoring_stopping_condition option)
    ?network_config:(network_config_ : monitoring_network_config option)
    ?model_bias_baseline_config:(model_bias_baseline_config_ : model_bias_baseline_config option)
    ~role_arn:(role_arn_ : role_arn) ~job_resources:(job_resources_ : monitoring_resources)
    ~model_bias_job_output_config:(model_bias_job_output_config_ : monitoring_output_config)
    ~model_bias_job_input:(model_bias_job_input_ : model_bias_job_input)
    ~model_bias_app_specification:(model_bias_app_specification_ : model_bias_app_specification)
    ~creation_time:(creation_time_ : timestamp)
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name)
    ~job_definition_arn:(job_definition_arn_ : monitoring_job_definition_arn) () =
  ({
     stopping_condition = stopping_condition_;
     role_arn = role_arn_;
     network_config = network_config_;
     job_resources = job_resources_;
     model_bias_job_output_config = model_bias_job_output_config_;
     model_bias_job_input = model_bias_job_input_;
     model_bias_app_specification = model_bias_app_specification_;
     model_bias_baseline_config = model_bias_baseline_config_;
     creation_time = creation_time_;
     job_definition_name = job_definition_name_;
     job_definition_arn = job_definition_arn_;
   }
    : describe_model_bias_job_definition_response)

let make_describe_model_bias_job_definition_request
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name) () =
  ({ job_definition_name = job_definition_name_ } : describe_model_bias_job_definition_request)

let make_describe_model_output
    ?deployment_recommendation:(deployment_recommendation_ : deployment_recommendation option)
    ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?execution_role_arn:(execution_role_arn_ : role_arn option)
    ?inference_execution_config:(inference_execution_config_ : inference_execution_config option)
    ?containers:(containers_ : container_definition_list option)
    ?primary_container:(primary_container_ : container_definition option)
    ~model_arn:(model_arn_ : model_arn) ~creation_time:(creation_time_ : timestamp)
    ~model_name:(model_name_ : model_name) () =
  ({
     deployment_recommendation = deployment_recommendation_;
     enable_network_isolation = enable_network_isolation_;
     model_arn = model_arn_;
     creation_time = creation_time_;
     vpc_config = vpc_config_;
     execution_role_arn = execution_role_arn_;
     inference_execution_config = inference_execution_config_;
     containers = containers_;
     primary_container = primary_container_;
     model_name = model_name_;
   }
    : describe_model_output)

let make_describe_model_input ~model_name:(model_name_ : model_name) () =
  ({ model_name = model_name_ } : describe_model_input)

let make_describe_mlflow_tracking_server_response
    ?s3_bucket_owner_verification:(s3_bucket_owner_verification_ : boolean_ option)
    ?s3_bucket_owner_account_id:(s3_bucket_owner_account_id_ : account_id option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?creation_time:(creation_time_ : timestamp option)
    ?automatic_model_registration:(automatic_model_registration_ : boolean_ option)
    ?weekly_maintenance_window_start:
      (weekly_maintenance_window_start_ : weekly_maintenance_window_start option)
    ?tracking_server_url:(tracking_server_url_ : tracking_server_url option)
    ?is_active:(is_active_ : is_tracking_server_active option)
    ?tracking_server_maintenance_status:
      (tracking_server_maintenance_status_ : tracking_server_maintenance_status option)
    ?tracking_server_status:(tracking_server_status_ : tracking_server_status option)
    ?role_arn:(role_arn_ : role_arn option)
    ?mlflow_version:(mlflow_version_ : mlflow_version option)
    ?tracking_server_size:(tracking_server_size_ : tracking_server_size option)
    ?artifact_store_uri:(artifact_store_uri_ : s3_uri option)
    ?tracking_server_name:(tracking_server_name_ : tracking_server_name option)
    ?tracking_server_arn:(tracking_server_arn_ : tracking_server_arn option) () =
  ({
     s3_bucket_owner_verification = s3_bucket_owner_verification_;
     s3_bucket_owner_account_id = s3_bucket_owner_account_id_;
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     created_by = created_by_;
     creation_time = creation_time_;
     automatic_model_registration = automatic_model_registration_;
     weekly_maintenance_window_start = weekly_maintenance_window_start_;
     tracking_server_url = tracking_server_url_;
     is_active = is_active_;
     tracking_server_maintenance_status = tracking_server_maintenance_status_;
     tracking_server_status = tracking_server_status_;
     role_arn = role_arn_;
     mlflow_version = mlflow_version_;
     tracking_server_size = tracking_server_size_;
     artifact_store_uri = artifact_store_uri_;
     tracking_server_name = tracking_server_name_;
     tracking_server_arn = tracking_server_arn_;
   }
    : describe_mlflow_tracking_server_response)

let make_describe_mlflow_tracking_server_request
    ~tracking_server_name:(tracking_server_name_ : tracking_server_name) () =
  ({ tracking_server_name = tracking_server_name_ } : describe_mlflow_tracking_server_request)

let make_describe_mlflow_app_response
    ?maintenance_status:(maintenance_status_ : maintenance_status option)
    ?weekly_maintenance_window_start:
      (weekly_maintenance_window_start_ : weekly_maintenance_window_start option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?creation_time:(creation_time_ : timestamp option)
    ?default_domain_id_list:(default_domain_id_list_ : default_domain_id_list option)
    ?account_default_status:(account_default_status_ : account_default_status option)
    ?model_registration_mode:(model_registration_mode_ : model_registration_mode option)
    ?status:(status_ : mlflow_app_status option) ?role_arn:(role_arn_ : role_arn option)
    ?mlflow_version:(mlflow_version_ : mlflow_version option)
    ?artifact_store_uri:(artifact_store_uri_ : s3_uri option) ?name:(name_ : mlflow_app_name option)
    ?arn:(arn_ : mlflow_app_arn option) () =
  ({
     maintenance_status = maintenance_status_;
     weekly_maintenance_window_start = weekly_maintenance_window_start_;
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     created_by = created_by_;
     creation_time = creation_time_;
     default_domain_id_list = default_domain_id_list_;
     account_default_status = account_default_status_;
     model_registration_mode = model_registration_mode_;
     status = status_;
     role_arn = role_arn_;
     mlflow_version = mlflow_version_;
     artifact_store_uri = artifact_store_uri_;
     name = name_;
     arn = arn_;
   }
    : describe_mlflow_app_response)

let make_describe_mlflow_app_request ~arn:(arn_ : mlflow_app_arn) () =
  ({ arn = arn_ } : describe_mlflow_app_request)

let make_describe_lineage_group_response ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?creation_time:(creation_time_ : timestamp option)
    ?description:(description_ : experiment_description option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?lineage_group_arn:(lineage_group_arn_ : lineage_group_arn option)
    ?lineage_group_name:(lineage_group_name_ : experiment_entity_name option) () =
  ({
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     created_by = created_by_;
     creation_time = creation_time_;
     description = description_;
     display_name = display_name_;
     lineage_group_arn = lineage_group_arn_;
     lineage_group_name = lineage_group_name_;
   }
    : describe_lineage_group_response)

let make_describe_lineage_group_request
    ~lineage_group_name:(lineage_group_name_ : experiment_entity_name) () =
  ({ lineage_group_name = lineage_group_name_ } : describe_lineage_group_request)

let make_labeling_job_output_config ?sns_topic_arn:(sns_topic_arn_ : sns_topic_arn option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ~s3_output_path:(s3_output_path_ : s3_uri) () =
  ({ sns_topic_arn = sns_topic_arn_; kms_key_id = kms_key_id_; s3_output_path = s3_output_path_ }
    : labeling_job_output_config)

let make_labeling_job_stopping_conditions
    ?max_percentage_of_input_dataset_labeled:
      (max_percentage_of_input_dataset_labeled_ : max_percentage_of_input_dataset_labeled option)
    ?max_human_labeled_object_count:
      (max_human_labeled_object_count_ : max_human_labeled_object_count option) () =
  ({
     max_percentage_of_input_dataset_labeled = max_percentage_of_input_dataset_labeled_;
     max_human_labeled_object_count = max_human_labeled_object_count_;
   }
    : labeling_job_stopping_conditions)

let make_labeling_job_resource_config ?vpc_config:(vpc_config_ : vpc_config option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option) () =
  ({ vpc_config = vpc_config_; volume_kms_key_id = volume_kms_key_id_ }
    : labeling_job_resource_config)

let make_labeling_job_algorithms_config
    ?labeling_job_resource_config:
      (labeling_job_resource_config_ : labeling_job_resource_config option)
    ?initial_active_learning_model_arn:(initial_active_learning_model_arn_ : model_arn option)
    ~labeling_job_algorithm_specification_arn:
      (labeling_job_algorithm_specification_arn_ : labeling_job_algorithm_specification_arn) () =
  ({
     labeling_job_resource_config = labeling_job_resource_config_;
     initial_active_learning_model_arn = initial_active_learning_model_arn_;
     labeling_job_algorithm_specification_arn = labeling_job_algorithm_specification_arn_;
   }
    : labeling_job_algorithms_config)

let make_annotation_consolidation_config
    ~annotation_consolidation_lambda_arn:
      (annotation_consolidation_lambda_arn_ : lambda_function_arn) () =
  ({ annotation_consolidation_lambda_arn = annotation_consolidation_lambda_arn_ }
    : annotation_consolidation_config)

let make_public_workforce_task_price ?amount_in_usd:(amount_in_usd_ : us_d option) () =
  ({ amount_in_usd = amount_in_usd_ } : public_workforce_task_price)

let make_human_task_config
    ?public_workforce_task_price:(public_workforce_task_price_ : public_workforce_task_price option)
    ?annotation_consolidation_config:
      (annotation_consolidation_config_ : annotation_consolidation_config option)
    ?max_concurrent_task_count:(max_concurrent_task_count_ : max_concurrent_task_count option)
    ?task_availability_lifetime_in_seconds:
      (task_availability_lifetime_in_seconds_ : task_availability_lifetime_in_seconds option)
    ?task_keywords:(task_keywords_ : task_keywords option)
    ?pre_human_task_lambda_arn:(pre_human_task_lambda_arn_ : lambda_function_arn option)
    ~task_time_limit_in_seconds:(task_time_limit_in_seconds_ : task_time_limit_in_seconds)
    ~number_of_human_workers_per_data_object:
      (number_of_human_workers_per_data_object_ : number_of_human_workers_per_data_object)
    ~task_description:(task_description_ : task_description) ~task_title:(task_title_ : task_title)
    ~ui_config:(ui_config_ : ui_config) ~workteam_arn:(workteam_arn_ : workteam_arn) () =
  ({
     public_workforce_task_price = public_workforce_task_price_;
     annotation_consolidation_config = annotation_consolidation_config_;
     max_concurrent_task_count = max_concurrent_task_count_;
     task_availability_lifetime_in_seconds = task_availability_lifetime_in_seconds_;
     task_time_limit_in_seconds = task_time_limit_in_seconds_;
     number_of_human_workers_per_data_object = number_of_human_workers_per_data_object_;
     task_description = task_description_;
     task_title = task_title_;
     task_keywords = task_keywords_;
     pre_human_task_lambda_arn = pre_human_task_lambda_arn_;
     ui_config = ui_config_;
     workteam_arn = workteam_arn_;
   }
    : human_task_config)

let make_describe_labeling_job_response
    ?labeling_job_output:(labeling_job_output_ : labeling_job_output option)
    ?tags:(tags_ : tag_list option)
    ?labeling_job_algorithms_config:
      (labeling_job_algorithms_config_ : labeling_job_algorithms_config option)
    ?stopping_conditions:(stopping_conditions_ : labeling_job_stopping_conditions option)
    ?label_category_config_s3_uri:(label_category_config_s3_uri_ : s3_uri option)
    ?label_attribute_name:(label_attribute_name_ : label_attribute_name option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ~human_task_config:(human_task_config_ : human_task_config) ~role_arn:(role_arn_ : role_arn)
    ~output_config:(output_config_ : labeling_job_output_config)
    ~input_config:(input_config_ : labeling_job_input_config)
    ~labeling_job_arn:(labeling_job_arn_ : labeling_job_arn)
    ~labeling_job_name:(labeling_job_name_ : labeling_job_name)
    ~job_reference_code:(job_reference_code_ : job_reference_code)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp) ~label_counters:(label_counters_ : label_counters)
    ~labeling_job_status:(labeling_job_status_ : labeling_job_status) () =
  ({
     labeling_job_output = labeling_job_output_;
     tags = tags_;
     human_task_config = human_task_config_;
     labeling_job_algorithms_config = labeling_job_algorithms_config_;
     stopping_conditions = stopping_conditions_;
     label_category_config_s3_uri = label_category_config_s3_uri_;
     role_arn = role_arn_;
     output_config = output_config_;
     input_config = input_config_;
     label_attribute_name = label_attribute_name_;
     labeling_job_arn = labeling_job_arn_;
     labeling_job_name = labeling_job_name_;
     job_reference_code = job_reference_code_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     failure_reason = failure_reason_;
     label_counters = label_counters_;
     labeling_job_status = labeling_job_status_;
   }
    : describe_labeling_job_response)

let make_describe_labeling_job_request ~labeling_job_name:(labeling_job_name_ : labeling_job_name)
    () =
  ({ labeling_job_name = labeling_job_name_ } : describe_labeling_job_request)

let make_describe_job_schema_version_response
    ~job_config_schema:(job_config_schema_ : job_config_document)
    ~job_config_schema_version:(job_config_schema_version_ : job_schema_version)
    ~job_category:(job_category_ : job_category) () =
  ({
     job_config_schema = job_config_schema_;
     job_config_schema_version = job_config_schema_version_;
     job_category = job_category_;
   }
    : describe_job_schema_version_response)

let make_describe_job_schema_version_request
    ?job_config_schema_version:(job_config_schema_version_ : job_schema_version option)
    ~job_category:(job_category_ : job_category) () =
  ({ job_config_schema_version = job_config_schema_version_; job_category = job_category_ }
    : describe_job_schema_version_request)

let make_describe_job_response ?tags:(tags_ : tag_list option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?end_time:(end_time_ : timestamp option)
    ?job_config_document:(job_config_document_ : job_config_document option)
    ~secondary_status_transitions:(secondary_status_transitions_ : job_secondary_status_transitions)
    ~secondary_status:(secondary_status_ : job_secondary_status)
    ~job_status:(job_status_ : job_status) ~last_modified_time:(last_modified_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp)
    ~job_config_schema_version:(job_config_schema_version_ : job_schema_version)
    ~job_category:(job_category_ : job_category) ~role_arn:(role_arn_ : role_arn)
    ~job_arn:(job_arn_ : job_arn) ~job_name:(job_name_ : job_name) () =
  ({
     tags = tags_;
     failure_reason = failure_reason_;
     secondary_status_transitions = secondary_status_transitions_;
     secondary_status = secondary_status_;
     job_status = job_status_;
     end_time = end_time_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     job_config_document = job_config_document_;
     job_config_schema_version = job_config_schema_version_;
     job_category = job_category_;
     role_arn = role_arn_;
     job_arn = job_arn_;
     job_name = job_name_;
   }
    : describe_job_response)

let make_describe_job_request ~job_category:(job_category_ : job_category)
    ~job_name:(job_name_ : job_name) () =
  ({ job_category = job_category_; job_name = job_name_ } : describe_job_request)

let make_recommendation_job_resource_limit
    ?max_parallel_of_tests:(max_parallel_of_tests_ : max_parallel_of_tests option)
    ?max_number_of_tests:(max_number_of_tests_ : max_number_of_tests option) () =
  ({ max_parallel_of_tests = max_parallel_of_tests_; max_number_of_tests = max_number_of_tests_ }
    : recommendation_job_resource_limit)

let make_categorical_parameter ~value:(value_ : categorical_parameter_range_values)
    ~name:(name_ : string64) () =
  ({ value = value_; name = name_ } : categorical_parameter)

let make_environment_parameter_ranges
    ?categorical_parameter_ranges:(categorical_parameter_ranges_ : categorical_parameters option) ()
    =
  ({ categorical_parameter_ranges = categorical_parameter_ranges_ } : environment_parameter_ranges)

let make_endpoint_input_configuration
    ?environment_parameter_ranges:
      (environment_parameter_ranges_ : environment_parameter_ranges option)
    ?inference_specification_name:
      (inference_specification_name_ : inference_specification_name option)
    ?serverless_config:(serverless_config_ : production_variant_serverless_config option)
    ?instance_type:(instance_type_ : production_variant_instance_type option) () =
  ({
     environment_parameter_ranges = environment_parameter_ranges_;
     inference_specification_name = inference_specification_name_;
     serverless_config = serverless_config_;
     instance_type = instance_type_;
   }
    : endpoint_input_configuration)

let make_recommendation_job_payload_config
    ?supported_content_types:
      (supported_content_types_ : recommendation_job_supported_content_types option)
    ?sample_payload_url:(sample_payload_url_ : s3_uri option) () =
  ({ supported_content_types = supported_content_types_; sample_payload_url = sample_payload_url_ }
    : recommendation_job_payload_config)

let make_recommendation_job_container_config
    ?supported_response_mime_types:
      (supported_response_mime_types_ : recommendation_job_supported_response_mime_types option)
    ?data_input_config:(data_input_config_ : recommendation_job_data_input_config option)
    ?supported_endpoint_type:
      (supported_endpoint_type_ : recommendation_job_supported_endpoint_type option)
    ?supported_instance_types:
      (supported_instance_types_ : recommendation_job_supported_instance_types option)
    ?nearest_model_name:(nearest_model_name_ : string_ option)
    ?payload_config:(payload_config_ : recommendation_job_payload_config option)
    ?framework_version:(framework_version_ : recommendation_job_framework_version option)
    ?framework:(framework_ : string_ option) ?task:(task_ : string_ option)
    ?domain:(domain_ : string_ option) () =
  ({
     supported_response_mime_types = supported_response_mime_types_;
     data_input_config = data_input_config_;
     supported_endpoint_type = supported_endpoint_type_;
     supported_instance_types = supported_instance_types_;
     nearest_model_name = nearest_model_name_;
     payload_config = payload_config_;
     framework_version = framework_version_;
     framework = framework_;
     task = task_;
     domain = domain_;
   }
    : recommendation_job_container_config)

let make_endpoint_info ?endpoint_name:(endpoint_name_ : endpoint_name option) () =
  ({ endpoint_name = endpoint_name_ } : endpoint_info)

let make_recommendation_job_vpc_config ~subnets:(subnets_ : recommendation_job_vpc_subnets)
    ~security_group_ids:(security_group_ids_ : recommendation_job_vpc_security_group_ids) () =
  ({ subnets = subnets_; security_group_ids = security_group_ids_ } : recommendation_job_vpc_config)

let make_recommendation_job_input_config
    ?vpc_config:(vpc_config_ : recommendation_job_vpc_config option)
    ?endpoints:(endpoints_ : endpoints option)
    ?container_config:(container_config_ : recommendation_job_container_config option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?endpoint_configurations:(endpoint_configurations_ : endpoint_input_configurations option)
    ?resource_limit:(resource_limit_ : recommendation_job_resource_limit option)
    ?traffic_pattern:(traffic_pattern_ : traffic_pattern option)
    ?job_duration_in_seconds:(job_duration_in_seconds_ : job_duration_in_seconds option)
    ?model_name:(model_name_ : model_name option)
    ?model_package_version_arn:(model_package_version_arn_ : model_package_arn option) () =
  ({
     vpc_config = vpc_config_;
     endpoints = endpoints_;
     container_config = container_config_;
     volume_kms_key_id = volume_kms_key_id_;
     endpoint_configurations = endpoint_configurations_;
     resource_limit = resource_limit_;
     traffic_pattern = traffic_pattern_;
     job_duration_in_seconds = job_duration_in_seconds_;
     model_name = model_name_;
     model_package_version_arn = model_package_version_arn_;
   }
    : recommendation_job_input_config)

let make_model_latency_threshold ?value_in_milliseconds:(value_in_milliseconds_ : integer option)
    ?percentile:(percentile_ : string64 option) () =
  ({ value_in_milliseconds = value_in_milliseconds_; percentile = percentile_ }
    : model_latency_threshold)

let make_recommendation_job_stopping_conditions
    ?flat_invocations:(flat_invocations_ : flat_invocations option)
    ?model_latency_thresholds:(model_latency_thresholds_ : model_latency_thresholds option)
    ?max_invocations:(max_invocations_ : integer option) () =
  ({
     flat_invocations = flat_invocations_;
     model_latency_thresholds = model_latency_thresholds_;
     max_invocations = max_invocations_;
   }
    : recommendation_job_stopping_conditions)

let make_inference_recommendation
    ?invocation_start_time:(invocation_start_time_ : invocation_start_time option)
    ?invocation_end_time:(invocation_end_time_ : invocation_end_time option)
    ?metrics:(metrics_ : recommendation_metrics option)
    ?recommendation_id:(recommendation_id_ : string_ option)
    ~model_configuration:(model_configuration_ : model_configuration)
    ~endpoint_configuration:(endpoint_configuration_ : endpoint_output_configuration) () =
  ({
     invocation_start_time = invocation_start_time_;
     invocation_end_time = invocation_end_time_;
     model_configuration = model_configuration_;
     endpoint_configuration = endpoint_configuration_;
     metrics = metrics_;
     recommendation_id = recommendation_id_;
   }
    : inference_recommendation)

let make_endpoint_performance ~endpoint_info:(endpoint_info_ : endpoint_info)
    ~metrics:(metrics_ : inference_metrics) () =
  ({ endpoint_info = endpoint_info_; metrics = metrics_ } : endpoint_performance)

let make_describe_inference_recommendations_job_response
    ?endpoint_performances:(endpoint_performances_ : endpoint_performances option)
    ?inference_recommendations:(inference_recommendations_ : inference_recommendations option)
    ?stopping_conditions:(stopping_conditions_ : recommendation_job_stopping_conditions option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?completion_time:(completion_time_ : timestamp option)
    ?job_description:(job_description_ : recommendation_job_description option)
    ~input_config:(input_config_ : recommendation_job_input_config)
    ~last_modified_time:(last_modified_time_ : last_modified_time)
    ~creation_time:(creation_time_ : creation_time) ~status:(status_ : recommendation_job_status)
    ~role_arn:(role_arn_ : role_arn) ~job_arn:(job_arn_ : recommendation_job_arn)
    ~job_type:(job_type_ : recommendation_job_type) ~job_name:(job_name_ : recommendation_job_name)
    () =
  ({
     endpoint_performances = endpoint_performances_;
     inference_recommendations = inference_recommendations_;
     stopping_conditions = stopping_conditions_;
     input_config = input_config_;
     failure_reason = failure_reason_;
     last_modified_time = last_modified_time_;
     completion_time = completion_time_;
     creation_time = creation_time_;
     status = status_;
     role_arn = role_arn_;
     job_arn = job_arn_;
     job_type = job_type_;
     job_description = job_description_;
     job_name = job_name_;
   }
    : describe_inference_recommendations_job_response)

let make_describe_inference_recommendations_job_request
    ~job_name:(job_name_ : recommendation_job_name) () =
  ({ job_name = job_name_ } : describe_inference_recommendations_job_request)

let make_endpoint_metadata ?failure_reason:(failure_reason_ : failure_reason option)
    ?endpoint_status:(endpoint_status_ : endpoint_status option)
    ?endpoint_config_name:(endpoint_config_name_ : endpoint_config_name option)
    ~endpoint_name:(endpoint_name_ : endpoint_name) () =
  ({
     failure_reason = failure_reason_;
     endpoint_status = endpoint_status_;
     endpoint_config_name = endpoint_config_name_;
     endpoint_name = endpoint_name_;
   }
    : endpoint_metadata)

let make_model_variant_config_summary ~status:(status_ : model_variant_status)
    ~infrastructure_config:(infrastructure_config_ : model_infrastructure_config)
    ~variant_name:(variant_name_ : model_variant_name) ~model_name:(model_name_ : model_name) () =
  ({
     status = status_;
     infrastructure_config = infrastructure_config_;
     variant_name = variant_name_;
     model_name = model_name_;
   }
    : model_variant_config_summary)

let make_describe_inference_experiment_response ?kms_key:(kms_key_ : kms_key_id option)
    ?shadow_mode_config:(shadow_mode_config_ : shadow_mode_config option)
    ?data_storage_config:(data_storage_config_ : inference_experiment_data_storage_config option)
    ?role_arn:(role_arn_ : role_arn option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?completion_time:(completion_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?description:(description_ : inference_experiment_description option)
    ?status_reason:(status_reason_ : inference_experiment_status_reason option)
    ?schedule:(schedule_ : inference_experiment_schedule option)
    ~model_variants:(model_variants_ : model_variant_config_summary_list)
    ~endpoint_metadata:(endpoint_metadata_ : endpoint_metadata)
    ~status:(status_ : inference_experiment_status) ~type_:(type__ : inference_experiment_type)
    ~name:(name_ : inference_experiment_name) ~arn:(arn_ : inference_experiment_arn) () =
  ({
     kms_key = kms_key_;
     shadow_mode_config = shadow_mode_config_;
     data_storage_config = data_storage_config_;
     model_variants = model_variants_;
     endpoint_metadata = endpoint_metadata_;
     role_arn = role_arn_;
     last_modified_time = last_modified_time_;
     completion_time = completion_time_;
     creation_time = creation_time_;
     description = description_;
     status_reason = status_reason_;
     status = status_;
     schedule = schedule_;
     type_ = type__;
     name = name_;
     arn = arn_;
   }
    : describe_inference_experiment_response)

let make_describe_inference_experiment_request ~name:(name_ : inference_experiment_name) () =
  ({ name = name_ } : describe_inference_experiment_request)

let make_inference_component_container_specification_summary
    ?container_metrics_config:(container_metrics_config_ : container_metrics_config option)
    ?environment:(environment_ : environment_map option) ?artifact_url:(artifact_url_ : url option)
    ?deployed_image:(deployed_image_ : deployed_image option) () =
  ({
     container_metrics_config = container_metrics_config_;
     environment = environment_;
     artifact_url = artifact_url_;
     deployed_image = deployed_image_;
   }
    : inference_component_container_specification_summary)

let make_inference_component_data_cache_config_summary
    ~enable_caching:(enable_caching_ : enable_caching) () =
  ({ enable_caching = enable_caching_ } : inference_component_data_cache_config_summary)

let make_inference_component_specification_summary
    ?scheduling_config:(scheduling_config_ : inference_component_scheduling_config option)
    ?data_cache_config:(data_cache_config_ : inference_component_data_cache_config_summary option)
    ?base_inference_component_name:
      (base_inference_component_name_ : inference_component_name option)
    ?compute_resource_requirements:
      (compute_resource_requirements_ : inference_component_compute_resource_requirements option)
    ?startup_parameters:(startup_parameters_ : inference_component_startup_parameters option)
    ?container:(container_ : inference_component_container_specification_summary option)
    ?model_name:(model_name_ : model_name option)
    ?instance_type:(instance_type_ : production_variant_instance_type option) () =
  ({
     scheduling_config = scheduling_config_;
     data_cache_config = data_cache_config_;
     base_inference_component_name = base_inference_component_name_;
     compute_resource_requirements = compute_resource_requirements_;
     startup_parameters = startup_parameters_;
     container = container_;
     model_name = model_name_;
     instance_type = instance_type_;
   }
    : inference_component_specification_summary)

let make_inference_component_placement_status
    ~current_copy_count:(current_copy_count_ : inference_component_copy_count)
    ~instance_type:(instance_type_ : production_variant_instance_type) () =
  ({ current_copy_count = current_copy_count_; instance_type = instance_type_ }
    : inference_component_placement_status)

let make_inference_component_runtime_config_summary
    ?placement_status:(placement_status_ : inference_component_placement_status_list option)
    ?current_copy_count:(current_copy_count_ : inference_component_copy_count option)
    ?desired_copy_count:(desired_copy_count_ : inference_component_copy_count option) () =
  ({
     placement_status = placement_status_;
     current_copy_count = current_copy_count_;
     desired_copy_count = desired_copy_count_;
   }
    : inference_component_runtime_config_summary)

let make_describe_inference_component_output
    ?last_deployment_config:(last_deployment_config_ : inference_component_deployment_config option)
    ?inference_component_status:(inference_component_status_ : inference_component_status option)
    ?runtime_config:(runtime_config_ : inference_component_runtime_config_summary option)
    ?specifications:(specifications_ : inference_component_specification_summary_list option)
    ?specification:(specification_ : inference_component_specification_summary option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?variant_name:(variant_name_ : variant_name option)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp) ~endpoint_arn:(endpoint_arn_ : endpoint_arn)
    ~endpoint_name:(endpoint_name_ : endpoint_name)
    ~inference_component_arn:(inference_component_arn_ : inference_component_arn)
    ~inference_component_name:(inference_component_name_ : inference_component_name) () =
  ({
     last_deployment_config = last_deployment_config_;
     inference_component_status = inference_component_status_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     runtime_config = runtime_config_;
     specifications = specifications_;
     specification = specification_;
     failure_reason = failure_reason_;
     variant_name = variant_name_;
     endpoint_arn = endpoint_arn_;
     endpoint_name = endpoint_name_;
     inference_component_arn = inference_component_arn_;
     inference_component_name = inference_component_name_;
   }
    : describe_inference_component_output)

let make_describe_inference_component_input
    ~inference_component_name:(inference_component_name_ : inference_component_name) () =
  ({ inference_component_name = inference_component_name_ } : describe_inference_component_input)

let make_describe_image_version_response ?release_notes:(release_notes_ : release_notes option)
    ?horovod:(horovod_ : horovod option) ?processor:(processor_ : processor option)
    ?programming_lang:(programming_lang_ : programming_lang option)
    ?ml_framework:(ml_framework_ : ml_framework option) ?job_type:(job_type_ : job_type option)
    ?vendor_guidance:(vendor_guidance_ : vendor_guidance option)
    ?version:(version_ : image_version_number option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?image_version_status:(image_version_status_ : image_version_status option)
    ?image_version_arn:(image_version_arn_ : image_version_arn option)
    ?image_arn:(image_arn_ : image_arn option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?creation_time:(creation_time_ : timestamp option)
    ?container_image:(container_image_ : image_container_image option)
    ?base_image:(base_image_ : image_base_image option) () =
  ({
     release_notes = release_notes_;
     horovod = horovod_;
     processor = processor_;
     programming_lang = programming_lang_;
     ml_framework = ml_framework_;
     job_type = job_type_;
     vendor_guidance = vendor_guidance_;
     version = version_;
     last_modified_time = last_modified_time_;
     image_version_status = image_version_status_;
     image_version_arn = image_version_arn_;
     image_arn = image_arn_;
     failure_reason = failure_reason_;
     creation_time = creation_time_;
     container_image = container_image_;
     base_image = base_image_;
   }
    : describe_image_version_response)

let make_describe_image_version_request ?alias:(alias_ : sage_maker_image_version_alias option)
    ?version:(version_ : image_version_number option) ~image_name:(image_name_ : image_name) () =
  ({ alias = alias_; version = version_; image_name = image_name_ }
    : describe_image_version_request)

let make_describe_image_response ?role_arn:(role_arn_ : role_arn option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?image_status:(image_status_ : image_status option)
    ?image_name:(image_name_ : image_name option) ?image_arn:(image_arn_ : image_arn option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?display_name:(display_name_ : image_display_name option)
    ?description:(description_ : image_description option)
    ?creation_time:(creation_time_ : timestamp option) () =
  ({
     role_arn = role_arn_;
     last_modified_time = last_modified_time_;
     image_status = image_status_;
     image_name = image_name_;
     image_arn = image_arn_;
     failure_reason = failure_reason_;
     display_name = display_name_;
     description = description_;
     creation_time = creation_time_;
   }
    : describe_image_response)

let make_describe_image_request ~image_name:(image_name_ : image_name) () =
  ({ image_name = image_name_ } : describe_image_request)

let make_autotune ~mode:(mode_ : autotune_mode) () = ({ mode = mode_ } : autotune)

let make_describe_hyper_parameter_tuning_job_response
    ?consumed_resources:(consumed_resources_ : hyper_parameter_tuning_job_consumed_resources option)
    ?tuning_job_completion_details:
      (tuning_job_completion_details_ : hyper_parameter_tuning_job_completion_details option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?autotune:(autotune_ : autotune option)
    ?warm_start_config:(warm_start_config_ : hyper_parameter_tuning_job_warm_start_config option)
    ?overall_best_training_job:
      (overall_best_training_job_ : hyper_parameter_training_job_summary option)
    ?best_training_job:(best_training_job_ : hyper_parameter_training_job_summary option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?hyper_parameter_tuning_end_time:(hyper_parameter_tuning_end_time_ : timestamp option)
    ?training_job_definitions:
      (training_job_definitions_ : hyper_parameter_training_job_definitions option)
    ?training_job_definition:
      (training_job_definition_ : hyper_parameter_training_job_definition option)
    ~objective_status_counters:(objective_status_counters_ : objective_status_counters)
    ~training_job_status_counters:(training_job_status_counters_ : training_job_status_counters)
    ~creation_time:(creation_time_ : timestamp)
    ~hyper_parameter_tuning_job_status:
      (hyper_parameter_tuning_job_status_ : hyper_parameter_tuning_job_status)
    ~hyper_parameter_tuning_job_config:
      (hyper_parameter_tuning_job_config_ : hyper_parameter_tuning_job_config)
    ~hyper_parameter_tuning_job_arn:
      (hyper_parameter_tuning_job_arn_ : hyper_parameter_tuning_job_arn)
    ~hyper_parameter_tuning_job_name:
      (hyper_parameter_tuning_job_name_ : hyper_parameter_tuning_job_name) () =
  ({
     consumed_resources = consumed_resources_;
     tuning_job_completion_details = tuning_job_completion_details_;
     failure_reason = failure_reason_;
     autotune = autotune_;
     warm_start_config = warm_start_config_;
     overall_best_training_job = overall_best_training_job_;
     best_training_job = best_training_job_;
     objective_status_counters = objective_status_counters_;
     training_job_status_counters = training_job_status_counters_;
     last_modified_time = last_modified_time_;
     hyper_parameter_tuning_end_time = hyper_parameter_tuning_end_time_;
     creation_time = creation_time_;
     hyper_parameter_tuning_job_status = hyper_parameter_tuning_job_status_;
     training_job_definitions = training_job_definitions_;
     training_job_definition = training_job_definition_;
     hyper_parameter_tuning_job_config = hyper_parameter_tuning_job_config_;
     hyper_parameter_tuning_job_arn = hyper_parameter_tuning_job_arn_;
     hyper_parameter_tuning_job_name = hyper_parameter_tuning_job_name_;
   }
    : describe_hyper_parameter_tuning_job_response)

let make_describe_hyper_parameter_tuning_job_request
    ~hyper_parameter_tuning_job_name:
      (hyper_parameter_tuning_job_name_ : hyper_parameter_tuning_job_name) () =
  ({ hyper_parameter_tuning_job_name = hyper_parameter_tuning_job_name_ }
    : describe_hyper_parameter_tuning_job_request)

let make_describe_human_task_ui_response
    ?human_task_ui_status:(human_task_ui_status_ : human_task_ui_status option)
    ~ui_template:(ui_template_ : ui_template_info) ~creation_time:(creation_time_ : timestamp)
    ~human_task_ui_name:(human_task_ui_name_ : human_task_ui_name)
    ~human_task_ui_arn:(human_task_ui_arn_ : human_task_ui_arn) () =
  ({
     ui_template = ui_template_;
     creation_time = creation_time_;
     human_task_ui_status = human_task_ui_status_;
     human_task_ui_name = human_task_ui_name_;
     human_task_ui_arn = human_task_ui_arn_;
   }
    : describe_human_task_ui_response)

let make_describe_human_task_ui_request
    ~human_task_ui_name:(human_task_ui_name_ : human_task_ui_name) () =
  ({ human_task_ui_name = human_task_ui_name_ } : describe_human_task_ui_request)

let make_hub_content_dependency
    ?dependency_copy_path:(dependency_copy_path_ : dependency_copy_path option)
    ?dependency_origin_path:(dependency_origin_path_ : dependency_origin_path option) () =
  ({
     dependency_copy_path = dependency_copy_path_;
     dependency_origin_path = dependency_origin_path_;
   }
    : hub_content_dependency)

let make_describe_hub_content_response ?last_modified_time:(last_modified_time_ : timestamp option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?hub_content_dependencies:(hub_content_dependencies_ : hub_content_dependency_list option)
    ?hub_content_search_keywords:
      (hub_content_search_keywords_ : hub_content_search_keyword_list option)
    ?support_status:(support_status_ : hub_content_support_status option)
    ?reference_min_version:(reference_min_version_ : reference_min_version option)
    ?sage_maker_public_hub_content_arn:
      (sage_maker_public_hub_content_arn_ : sage_maker_public_hub_content_arn option)
    ?hub_content_markdown:(hub_content_markdown_ : hub_content_markdown option)
    ?hub_content_description:(hub_content_description_ : hub_content_description option)
    ?hub_content_display_name:(hub_content_display_name_ : hub_content_display_name option)
    ~creation_time:(creation_time_ : timestamp)
    ~hub_content_status:(hub_content_status_ : hub_content_status)
    ~hub_content_document:(hub_content_document_ : hub_content_document)
    ~hub_arn:(hub_arn_ : hub_arn) ~hub_name:(hub_name_ : hub_name)
    ~document_schema_version:(document_schema_version_ : document_schema_version)
    ~hub_content_type:(hub_content_type_ : hub_content_type)
    ~hub_content_version:(hub_content_version_ : hub_content_version)
    ~hub_content_arn:(hub_content_arn_ : hub_content_arn)
    ~hub_content_name:(hub_content_name_ : hub_content_name) () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     failure_reason = failure_reason_;
     hub_content_status = hub_content_status_;
     hub_content_dependencies = hub_content_dependencies_;
     hub_content_search_keywords = hub_content_search_keywords_;
     support_status = support_status_;
     reference_min_version = reference_min_version_;
     sage_maker_public_hub_content_arn = sage_maker_public_hub_content_arn_;
     hub_content_document = hub_content_document_;
     hub_content_markdown = hub_content_markdown_;
     hub_content_description = hub_content_description_;
     hub_content_display_name = hub_content_display_name_;
     hub_arn = hub_arn_;
     hub_name = hub_name_;
     document_schema_version = document_schema_version_;
     hub_content_type = hub_content_type_;
     hub_content_version = hub_content_version_;
     hub_content_arn = hub_content_arn_;
     hub_content_name = hub_content_name_;
   }
    : describe_hub_content_response)

let make_describe_hub_content_request
    ?hub_content_version:(hub_content_version_ : hub_content_version option)
    ~hub_content_name:(hub_content_name_ : hub_content_name)
    ~hub_content_type:(hub_content_type_ : hub_content_type) ~hub_name:(hub_name_ : hub_name_or_arn)
    () =
  ({
     hub_content_version = hub_content_version_;
     hub_content_name = hub_content_name_;
     hub_content_type = hub_content_type_;
     hub_name = hub_name_;
   }
    : describe_hub_content_request)

let make_hub_s3_storage_config ?s3_output_path:(s3_output_path_ : s3_output_path option) () =
  ({ s3_output_path = s3_output_path_ } : hub_s3_storage_config)

let make_describe_hub_response ?failure_reason:(failure_reason_ : failure_reason option)
    ?s3_storage_config:(s3_storage_config_ : hub_s3_storage_config option)
    ?hub_search_keywords:(hub_search_keywords_ : hub_search_keyword_list option)
    ?hub_description:(hub_description_ : hub_description option)
    ?hub_display_name:(hub_display_name_ : hub_display_name option)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp) ~hub_status:(hub_status_ : hub_status)
    ~hub_arn:(hub_arn_ : hub_arn) ~hub_name:(hub_name_ : hub_name) () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     failure_reason = failure_reason_;
     hub_status = hub_status_;
     s3_storage_config = s3_storage_config_;
     hub_search_keywords = hub_search_keywords_;
     hub_description = hub_description_;
     hub_display_name = hub_display_name_;
     hub_arn = hub_arn_;
     hub_name = hub_name_;
   }
    : describe_hub_response)

let make_describe_hub_request ~hub_name:(hub_name_ : hub_name_or_arn) () =
  ({ hub_name = hub_name_ } : describe_hub_request)

let make_human_loop_request_source
    ~aws_managed_human_loop_request_source:
      (aws_managed_human_loop_request_source_ : aws_managed_human_loop_request_source) () =
  ({ aws_managed_human_loop_request_source = aws_managed_human_loop_request_source_ }
    : human_loop_request_source)

let make_human_loop_activation_conditions_config
    ~human_loop_activation_conditions:
      (human_loop_activation_conditions_ : human_loop_activation_conditions) () =
  ({ human_loop_activation_conditions = human_loop_activation_conditions_ }
    : human_loop_activation_conditions_config)

let make_human_loop_activation_config
    ~human_loop_activation_conditions_config:
      (human_loop_activation_conditions_config_ : human_loop_activation_conditions_config) () =
  ({ human_loop_activation_conditions_config = human_loop_activation_conditions_config_ }
    : human_loop_activation_config)

let make_human_loop_config
    ?public_workforce_task_price:(public_workforce_task_price_ : public_workforce_task_price option)
    ?task_keywords:(task_keywords_ : flow_definition_task_keywords option)
    ?task_time_limit_in_seconds:
      (task_time_limit_in_seconds_ : flow_definition_task_time_limit_in_seconds option)
    ?task_availability_lifetime_in_seconds:
      (task_availability_lifetime_in_seconds_ :
         flow_definition_task_availability_lifetime_in_seconds option)
    ~task_count:(task_count_ : flow_definition_task_count)
    ~task_description:(task_description_ : flow_definition_task_description)
    ~task_title:(task_title_ : flow_definition_task_title)
    ~human_task_ui_arn:(human_task_ui_arn_ : human_task_ui_arn)
    ~workteam_arn:(workteam_arn_ : workteam_arn) () =
  ({
     public_workforce_task_price = public_workforce_task_price_;
     task_keywords = task_keywords_;
     task_time_limit_in_seconds = task_time_limit_in_seconds_;
     task_availability_lifetime_in_seconds = task_availability_lifetime_in_seconds_;
     task_count = task_count_;
     task_description = task_description_;
     task_title = task_title_;
     human_task_ui_arn = human_task_ui_arn_;
     workteam_arn = workteam_arn_;
   }
    : human_loop_config)

let make_flow_definition_output_config ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ~s3_output_path:(s3_output_path_ : s3_uri) () =
  ({ kms_key_id = kms_key_id_; s3_output_path = s3_output_path_ } : flow_definition_output_config)

let make_describe_flow_definition_response ?failure_reason:(failure_reason_ : failure_reason option)
    ?human_loop_config:(human_loop_config_ : human_loop_config option)
    ?human_loop_activation_config:
      (human_loop_activation_config_ : human_loop_activation_config option)
    ?human_loop_request_source:(human_loop_request_source_ : human_loop_request_source option)
    ~role_arn:(role_arn_ : role_arn) ~output_config:(output_config_ : flow_definition_output_config)
    ~creation_time:(creation_time_ : timestamp)
    ~flow_definition_status:(flow_definition_status_ : flow_definition_status)
    ~flow_definition_name:(flow_definition_name_ : flow_definition_name)
    ~flow_definition_arn:(flow_definition_arn_ : flow_definition_arn) () =
  ({
     failure_reason = failure_reason_;
     role_arn = role_arn_;
     output_config = output_config_;
     human_loop_config = human_loop_config_;
     human_loop_activation_config = human_loop_activation_config_;
     human_loop_request_source = human_loop_request_source_;
     creation_time = creation_time_;
     flow_definition_status = flow_definition_status_;
     flow_definition_name = flow_definition_name_;
     flow_definition_arn = flow_definition_arn_;
   }
    : describe_flow_definition_response)

let make_describe_flow_definition_request
    ~flow_definition_name:(flow_definition_name_ : flow_definition_name) () =
  ({ flow_definition_name = flow_definition_name_ } : describe_flow_definition_request)

let make_describe_feature_metadata_response ?parameters:(parameters_ : feature_parameters option)
    ?description:(description_ : feature_description option)
    ~last_modified_time:(last_modified_time_ : last_modified_time)
    ~creation_time:(creation_time_ : creation_time) ~feature_type:(feature_type_ : feature_type)
    ~feature_name:(feature_name_ : feature_name)
    ~feature_group_name:(feature_group_name_ : feature_group_name)
    ~feature_group_arn:(feature_group_arn_ : feature_group_arn) () =
  ({
     parameters = parameters_;
     description = description_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     feature_type = feature_type_;
     feature_name = feature_name_;
     feature_group_name = feature_group_name_;
     feature_group_arn = feature_group_arn_;
   }
    : describe_feature_metadata_response)

let make_describe_feature_metadata_request ~feature_name:(feature_name_ : feature_name)
    ~feature_group_name:(feature_group_name_ : feature_group_name_or_arn) () =
  ({ feature_name = feature_name_; feature_group_name = feature_group_name_ }
    : describe_feature_metadata_request)

let make_describe_feature_group_response
    ?online_store_total_size_bytes:
      (online_store_total_size_bytes_ : online_store_total_size_bytes option)
    ?description:(description_ : description option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_update_status:(last_update_status_ : last_update_status option)
    ?offline_store_status:(offline_store_status_ : offline_store_status option)
    ?feature_group_status:(feature_group_status_ : feature_group_status option)
    ?role_arn:(role_arn_ : role_arn option)
    ?throughput_config:(throughput_config_ : throughput_config_description option)
    ?offline_store_config:(offline_store_config_ : offline_store_config option)
    ?online_store_config:(online_store_config_ : online_store_config option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ~next_token:(next_token_ : next_token) ~creation_time:(creation_time_ : creation_time)
    ~feature_definitions:(feature_definitions_ : feature_definitions)
    ~event_time_feature_name:(event_time_feature_name_ : feature_name)
    ~record_identifier_feature_name:(record_identifier_feature_name_ : feature_name)
    ~feature_group_name:(feature_group_name_ : feature_group_name)
    ~feature_group_arn:(feature_group_arn_ : feature_group_arn) () =
  ({
     online_store_total_size_bytes = online_store_total_size_bytes_;
     next_token = next_token_;
     description = description_;
     failure_reason = failure_reason_;
     last_update_status = last_update_status_;
     offline_store_status = offline_store_status_;
     feature_group_status = feature_group_status_;
     role_arn = role_arn_;
     throughput_config = throughput_config_;
     offline_store_config = offline_store_config_;
     online_store_config = online_store_config_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     feature_definitions = feature_definitions_;
     event_time_feature_name = event_time_feature_name_;
     record_identifier_feature_name = record_identifier_feature_name_;
     feature_group_name = feature_group_name_;
     feature_group_arn = feature_group_arn_;
   }
    : describe_feature_group_response)

let make_describe_feature_group_request ?next_token:(next_token_ : next_token option)
    ~feature_group_name:(feature_group_name_ : feature_group_name_or_arn) () =
  ({ next_token = next_token_; feature_group_name = feature_group_name_ }
    : describe_feature_group_request)

let make_describe_experiment_response ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?creation_time:(creation_time_ : timestamp option)
    ?description:(description_ : experiment_description option)
    ?source:(source_ : experiment_source option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?experiment_arn:(experiment_arn_ : experiment_arn option)
    ?experiment_name:(experiment_name_ : experiment_entity_name option) () =
  ({
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     created_by = created_by_;
     creation_time = creation_time_;
     description = description_;
     source = source_;
     display_name = display_name_;
     experiment_arn = experiment_arn_;
     experiment_name = experiment_name_;
   }
    : describe_experiment_response)

let make_describe_experiment_request ~experiment_name:(experiment_name_ : experiment_entity_name) ()
    =
  ({ experiment_name = experiment_name_ } : describe_experiment_request)

let make_instance_pool ?model_name_override:(model_name_override_ : model_name option)
    ~priority:(priority_ : instance_pool_priority)
    ~instance_type:(instance_type_ : production_variant_instance_type) () =
  ({
     priority = priority_;
     model_name_override = model_name_override_;
     instance_type = instance_type_;
   }
    : instance_pool)

let make_production_variant_core_dump_config ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ~destination_s3_uri:(destination_s3_uri_ : destination_s3_uri) () =
  ({ kms_key_id = kms_key_id_; destination_s3_uri = destination_s3_uri_ }
    : production_variant_core_dump_config)

let make_production_variant_capacity_reservation_config
    ?ml_reservation_arn:(ml_reservation_arn_ : ml_reservation_arn option)
    ?capacity_reservation_preference:
      (capacity_reservation_preference_ : capacity_reservation_preference option) () =
  ({
     ml_reservation_arn = ml_reservation_arn_;
     capacity_reservation_preference = capacity_reservation_preference_;
   }
    : production_variant_capacity_reservation_config)

let make_production_variant
    ?capacity_reservation_config:
      (capacity_reservation_config_ : production_variant_capacity_reservation_config option)
    ?inference_ami_version:
      (inference_ami_version_ : production_variant_inference_ami_version option)
    ?routing_config:(routing_config_ : production_variant_routing_config option)
    ?managed_instance_scaling:
      (managed_instance_scaling_ : production_variant_managed_instance_scaling option)
    ?enable_ssm_access:(enable_ssm_access_ : production_variant_ssm_access option)
    ?container_startup_health_check_timeout_in_seconds:
      (container_startup_health_check_timeout_in_seconds_ :
         production_variant_container_startup_health_check_timeout_in_seconds option)
    ?model_data_download_timeout_in_seconds:
      (model_data_download_timeout_in_seconds_ :
         production_variant_model_data_download_timeout_in_seconds option)
    ?volume_size_in_g_b:(volume_size_in_g_b_ : production_variant_volume_size_in_g_b option)
    ?serverless_config:(serverless_config_ : production_variant_serverless_config option)
    ?core_dump_config:(core_dump_config_ : production_variant_core_dump_config option)
    ?accelerator_type:(accelerator_type_ : production_variant_accelerator_type option)
    ?initial_variant_weight:(initial_variant_weight_ : variant_weight option)
    ?variant_instance_provision_timeout_in_seconds:
      (variant_instance_provision_timeout_in_seconds_ :
         variant_instance_provision_timeout_in_seconds option)
    ?instance_pools:(instance_pools_ : instance_pool_list option)
    ?instance_type:(instance_type_ : production_variant_instance_type option)
    ?initial_instance_count:(initial_instance_count_ : initial_task_count option)
    ?model_name:(model_name_ : model_name option) ~variant_name:(variant_name_ : variant_name) () =
  ({
     capacity_reservation_config = capacity_reservation_config_;
     inference_ami_version = inference_ami_version_;
     routing_config = routing_config_;
     managed_instance_scaling = managed_instance_scaling_;
     enable_ssm_access = enable_ssm_access_;
     container_startup_health_check_timeout_in_seconds =
       container_startup_health_check_timeout_in_seconds_;
     model_data_download_timeout_in_seconds = model_data_download_timeout_in_seconds_;
     volume_size_in_g_b = volume_size_in_g_b_;
     serverless_config = serverless_config_;
     core_dump_config = core_dump_config_;
     accelerator_type = accelerator_type_;
     initial_variant_weight = initial_variant_weight_;
     variant_instance_provision_timeout_in_seconds = variant_instance_provision_timeout_in_seconds_;
     instance_pools = instance_pools_;
     instance_type = instance_type_;
     initial_instance_count = initial_instance_count_;
     model_name = model_name_;
     variant_name = variant_name_;
   }
    : production_variant)

let make_capture_option ~capture_mode:(capture_mode_ : capture_mode) () =
  ({ capture_mode = capture_mode_ } : capture_option)

let make_data_capture_config
    ?capture_content_type_header:(capture_content_type_header_ : capture_content_type_header option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?enable_capture:(enable_capture_ : enable_capture option)
    ~capture_options:(capture_options_ : capture_option_list)
    ~destination_s3_uri:(destination_s3_uri_ : destination_s3_uri)
    ~initial_sampling_percentage:(initial_sampling_percentage_ : sampling_percentage) () =
  ({
     capture_content_type_header = capture_content_type_header_;
     capture_options = capture_options_;
     kms_key_id = kms_key_id_;
     destination_s3_uri = destination_s3_uri_;
     initial_sampling_percentage = initial_sampling_percentage_;
     enable_capture = enable_capture_;
   }
    : data_capture_config)

let make_async_inference_client_config
    ?max_concurrent_invocations_per_instance:
      (max_concurrent_invocations_per_instance_ : max_concurrent_invocations_per_instance option) ()
    =
  ({ max_concurrent_invocations_per_instance = max_concurrent_invocations_per_instance_ }
    : async_inference_client_config)

let make_async_inference_notification_config
    ?include_inference_response_in:
      (include_inference_response_in_ : async_notification_topic_type_list option)
    ?error_topic:(error_topic_ : sns_topic_arn option)
    ?success_topic:(success_topic_ : sns_topic_arn option) () =
  ({
     include_inference_response_in = include_inference_response_in_;
     error_topic = error_topic_;
     success_topic = success_topic_;
   }
    : async_inference_notification_config)

let make_async_inference_output_config
    ?s3_failure_path:(s3_failure_path_ : destination_s3_uri option)
    ?notification_config:(notification_config_ : async_inference_notification_config option)
    ?s3_output_path:(s3_output_path_ : destination_s3_uri option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) () =
  ({
     s3_failure_path = s3_failure_path_;
     notification_config = notification_config_;
     s3_output_path = s3_output_path_;
     kms_key_id = kms_key_id_;
   }
    : async_inference_output_config)

let make_async_inference_config
    ?client_config:(client_config_ : async_inference_client_config option)
    ~output_config:(output_config_ : async_inference_output_config) () =
  ({ output_config = output_config_; client_config = client_config_ } : async_inference_config)

let make_clarify_inference_config ?feature_types:(feature_types_ : clarify_feature_types option)
    ?feature_headers:(feature_headers_ : clarify_feature_headers option)
    ?label_headers:(label_headers_ : clarify_label_headers option)
    ?label_attribute:(label_attribute_ : clarify_label_attribute option)
    ?probability_attribute:(probability_attribute_ : clarify_probability_attribute option)
    ?label_index:(label_index_ : clarify_label_index option)
    ?probability_index:(probability_index_ : clarify_probability_index option)
    ?max_payload_in_m_b:(max_payload_in_m_b_ : clarify_max_payload_in_m_b option)
    ?max_record_count:(max_record_count_ : clarify_max_record_count option)
    ?content_template:(content_template_ : clarify_content_template option)
    ?features_attribute:(features_attribute_ : clarify_features_attribute option) () =
  ({
     feature_types = feature_types_;
     feature_headers = feature_headers_;
     label_headers = label_headers_;
     label_attribute = label_attribute_;
     probability_attribute = probability_attribute_;
     label_index = label_index_;
     probability_index = probability_index_;
     max_payload_in_m_b = max_payload_in_m_b_;
     max_record_count = max_record_count_;
     content_template = content_template_;
     features_attribute = features_attribute_;
   }
    : clarify_inference_config)

let make_clarify_shap_baseline_config ?shap_baseline_uri:(shap_baseline_uri_ : url option)
    ?shap_baseline:(shap_baseline_ : clarify_shap_baseline option)
    ?mime_type:(mime_type_ : clarify_mime_type option) () =
  ({
     shap_baseline_uri = shap_baseline_uri_;
     shap_baseline = shap_baseline_;
     mime_type = mime_type_;
   }
    : clarify_shap_baseline_config)

let make_clarify_text_config ~granularity:(granularity_ : clarify_text_granularity)
    ~language:(language_ : clarify_text_language) () =
  ({ granularity = granularity_; language = language_ } : clarify_text_config)

let make_clarify_shap_config ?text_config:(text_config_ : clarify_text_config option)
    ?seed:(seed_ : clarify_shap_seed option) ?use_logit:(use_logit_ : clarify_shap_use_logit option)
    ?number_of_samples:(number_of_samples_ : clarify_shap_number_of_samples option)
    ~shap_baseline_config:(shap_baseline_config_ : clarify_shap_baseline_config) () =
  ({
     text_config = text_config_;
     seed = seed_;
     use_logit = use_logit_;
     number_of_samples = number_of_samples_;
     shap_baseline_config = shap_baseline_config_;
   }
    : clarify_shap_config)

let make_clarify_explainer_config
    ?inference_config:(inference_config_ : clarify_inference_config option)
    ?enable_explanations:(enable_explanations_ : clarify_enable_explanations option)
    ~shap_config:(shap_config_ : clarify_shap_config) () =
  ({
     shap_config = shap_config_;
     inference_config = inference_config_;
     enable_explanations = enable_explanations_;
   }
    : clarify_explainer_config)

let make_explainer_config
    ?clarify_explainer_config:(clarify_explainer_config_ : clarify_explainer_config option) () =
  ({ clarify_explainer_config = clarify_explainer_config_ } : explainer_config)

let make_metrics_config
    ?metric_publish_frequency_in_seconds:
      (metric_publish_frequency_in_seconds_ : metric_publish_frequency_in_seconds option)
    ?enable_detailed_observability:
      (enable_detailed_observability_ : enable_detailed_observability option)
    ?enable_enhanced_metrics:(enable_enhanced_metrics_ : enable_enhanced_metrics option) () =
  ({
     metric_publish_frequency_in_seconds = metric_publish_frequency_in_seconds_;
     enable_detailed_observability = enable_detailed_observability_;
     enable_enhanced_metrics = enable_enhanced_metrics_;
   }
    : metrics_config)

let make_describe_endpoint_config_output ?metrics_config:(metrics_config_ : metrics_config option)
    ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?execution_role_arn:(execution_role_arn_ : role_arn option)
    ?shadow_production_variants:(shadow_production_variants_ : production_variant_list option)
    ?explainer_config:(explainer_config_ : explainer_config option)
    ?async_inference_config:(async_inference_config_ : async_inference_config option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?data_capture_config:(data_capture_config_ : data_capture_config option)
    ~creation_time:(creation_time_ : timestamp)
    ~production_variants:(production_variants_ : production_variant_list)
    ~endpoint_config_arn:(endpoint_config_arn_ : endpoint_config_arn)
    ~endpoint_config_name:(endpoint_config_name_ : endpoint_config_name) () =
  ({
     metrics_config = metrics_config_;
     enable_network_isolation = enable_network_isolation_;
     vpc_config = vpc_config_;
     execution_role_arn = execution_role_arn_;
     shadow_production_variants = shadow_production_variants_;
     explainer_config = explainer_config_;
     async_inference_config = async_inference_config_;
     creation_time = creation_time_;
     kms_key_id = kms_key_id_;
     data_capture_config = data_capture_config_;
     production_variants = production_variants_;
     endpoint_config_arn = endpoint_config_arn_;
     endpoint_config_name = endpoint_config_name_;
   }
    : describe_endpoint_config_output)

let make_describe_endpoint_config_input
    ~endpoint_config_name:(endpoint_config_name_ : endpoint_config_name) () =
  ({ endpoint_config_name = endpoint_config_name_ } : describe_endpoint_config_input)

let make_pending_production_variant_summary
    ?routing_config:(routing_config_ : production_variant_routing_config option)
    ?managed_instance_scaling:
      (managed_instance_scaling_ : production_variant_managed_instance_scaling option)
    ?desired_serverless_config:
      (desired_serverless_config_ : production_variant_serverless_config option)
    ?current_serverless_config:
      (current_serverless_config_ : production_variant_serverless_config option)
    ?variant_status:(variant_status_ : production_variant_status_list option)
    ?accelerator_type:(accelerator_type_ : production_variant_accelerator_type option)
    ?instance_pools:(instance_pools_ : instance_pool_summary_list option)
    ?instance_type:(instance_type_ : production_variant_instance_type option)
    ?desired_instance_count:(desired_instance_count_ : task_count option)
    ?current_instance_count:(current_instance_count_ : task_count option)
    ?desired_weight:(desired_weight_ : variant_weight option)
    ?current_weight:(current_weight_ : variant_weight option)
    ?deployed_images:(deployed_images_ : deployed_images option)
    ~variant_name:(variant_name_ : variant_name) () =
  ({
     routing_config = routing_config_;
     managed_instance_scaling = managed_instance_scaling_;
     desired_serverless_config = desired_serverless_config_;
     current_serverless_config = current_serverless_config_;
     variant_status = variant_status_;
     accelerator_type = accelerator_type_;
     instance_pools = instance_pools_;
     instance_type = instance_type_;
     desired_instance_count = desired_instance_count_;
     current_instance_count = current_instance_count_;
     desired_weight = desired_weight_;
     current_weight = current_weight_;
     deployed_images = deployed_images_;
     variant_name = variant_name_;
   }
    : pending_production_variant_summary)

let make_pending_deployment_summary
    ?shadow_production_variants:
      (shadow_production_variants_ : pending_production_variant_summary_list option)
    ?start_time:(start_time_ : timestamp option)
    ?production_variants:(production_variants_ : pending_production_variant_summary_list option)
    ~endpoint_config_name:(endpoint_config_name_ : endpoint_config_name) () =
  ({
     shadow_production_variants = shadow_production_variants_;
     start_time = start_time_;
     production_variants = production_variants_;
     endpoint_config_name = endpoint_config_name_;
   }
    : pending_deployment_summary)

let make_describe_endpoint_output ?metrics_config:(metrics_config_ : metrics_config option)
    ?shadow_production_variants:
      (shadow_production_variants_ : production_variant_summary_list option)
    ?explainer_config:(explainer_config_ : explainer_config option)
    ?pending_deployment_summary:(pending_deployment_summary_ : pending_deployment_summary option)
    ?async_inference_config:(async_inference_config_ : async_inference_config option)
    ?last_deployment_config:(last_deployment_config_ : deployment_config option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?data_capture_config:(data_capture_config_ : data_capture_config_summary option)
    ?production_variants:(production_variants_ : production_variant_summary_list option)
    ?endpoint_config_name:(endpoint_config_name_ : endpoint_config_name option)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp)
    ~endpoint_status:(endpoint_status_ : endpoint_status)
    ~endpoint_arn:(endpoint_arn_ : endpoint_arn) ~endpoint_name:(endpoint_name_ : endpoint_name) ()
    =
  ({
     metrics_config = metrics_config_;
     shadow_production_variants = shadow_production_variants_;
     explainer_config = explainer_config_;
     pending_deployment_summary = pending_deployment_summary_;
     async_inference_config = async_inference_config_;
     last_deployment_config = last_deployment_config_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     failure_reason = failure_reason_;
     endpoint_status = endpoint_status_;
     data_capture_config = data_capture_config_;
     production_variants = production_variants_;
     endpoint_config_name = endpoint_config_name_;
     endpoint_arn = endpoint_arn_;
     endpoint_name = endpoint_name_;
   }
    : describe_endpoint_output)

let make_describe_endpoint_input ~endpoint_name:(endpoint_name_ : endpoint_name) () =
  ({ endpoint_name = endpoint_name_ } : describe_endpoint_input)

let make_edge_preset_deployment_output ?status_message:(status_message_ : string_ option)
    ?status:(status_ : edge_preset_deployment_status option)
    ?artifact:(artifact_ : edge_preset_deployment_artifact option)
    ~type_:(type__ : edge_preset_deployment_type) () =
  ({ status_message = status_message_; status = status_; artifact = artifact_; type_ = type__ }
    : edge_preset_deployment_output)

let make_describe_edge_packaging_job_response
    ?preset_deployment_output:(preset_deployment_output_ : edge_preset_deployment_output option)
    ?model_signature:(model_signature_ : string_ option)
    ?model_artifact:(model_artifact_ : s3_uri option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?edge_packaging_job_status_message:(edge_packaging_job_status_message_ : string_ option)
    ?resource_key:(resource_key_ : kms_key_id option)
    ?output_config:(output_config_ : edge_output_config option)
    ?role_arn:(role_arn_ : role_arn option) ?model_version:(model_version_ : edge_version option)
    ?model_name:(model_name_ : entity_name option)
    ?compilation_job_name:(compilation_job_name_ : entity_name option)
    ~edge_packaging_job_status:(edge_packaging_job_status_ : edge_packaging_job_status)
    ~edge_packaging_job_name:(edge_packaging_job_name_ : entity_name)
    ~edge_packaging_job_arn:(edge_packaging_job_arn_ : edge_packaging_job_arn) () =
  ({
     preset_deployment_output = preset_deployment_output_;
     model_signature = model_signature_;
     model_artifact = model_artifact_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     edge_packaging_job_status_message = edge_packaging_job_status_message_;
     edge_packaging_job_status = edge_packaging_job_status_;
     resource_key = resource_key_;
     output_config = output_config_;
     role_arn = role_arn_;
     model_version = model_version_;
     model_name = model_name_;
     compilation_job_name = compilation_job_name_;
     edge_packaging_job_name = edge_packaging_job_name_;
     edge_packaging_job_arn = edge_packaging_job_arn_;
   }
    : describe_edge_packaging_job_response)

let make_describe_edge_packaging_job_request
    ~edge_packaging_job_name:(edge_packaging_job_name_ : entity_name) () =
  ({ edge_packaging_job_name = edge_packaging_job_name_ } : describe_edge_packaging_job_request)

let make_edge_deployment_model_config
    ~edge_packaging_job_name:(edge_packaging_job_name_ : entity_name)
    ~model_handle:(model_handle_ : entity_name) () =
  ({ edge_packaging_job_name = edge_packaging_job_name_; model_handle = model_handle_ }
    : edge_deployment_model_config)

let make_device_selection_config ?device_name_contains:(device_name_contains_ : device_name option)
    ?device_names:(device_names_ : device_names option)
    ?percentage:(percentage_ : percentage option)
    ~device_subset_type:(device_subset_type_ : device_subset_type) () =
  ({
     device_name_contains = device_name_contains_;
     device_names = device_names_;
     percentage = percentage_;
     device_subset_type = device_subset_type_;
   }
    : device_selection_config)

let make_edge_deployment_config
    ~failure_handling_policy:(failure_handling_policy_ : failure_handling_policy) () =
  ({ failure_handling_policy = failure_handling_policy_ } : edge_deployment_config)

let make_edge_deployment_status
    ?edge_deployment_stage_start_time:(edge_deployment_stage_start_time_ : timestamp option)
    ?edge_deployment_status_message:(edge_deployment_status_message_ : string_ option)
    ~edge_deployment_failed_in_stage:(edge_deployment_failed_in_stage_ : integer)
    ~edge_deployment_pending_in_stage:(edge_deployment_pending_in_stage_ : integer)
    ~edge_deployment_success_in_stage:(edge_deployment_success_in_stage_ : integer)
    ~stage_status:(stage_status_ : stage_status) () =
  ({
     edge_deployment_stage_start_time = edge_deployment_stage_start_time_;
     edge_deployment_status_message = edge_deployment_status_message_;
     edge_deployment_failed_in_stage = edge_deployment_failed_in_stage_;
     edge_deployment_pending_in_stage = edge_deployment_pending_in_stage_;
     edge_deployment_success_in_stage = edge_deployment_success_in_stage_;
     stage_status = stage_status_;
   }
    : edge_deployment_status)

let make_deployment_stage_status_summary
    ~deployment_status:(deployment_status_ : edge_deployment_status)
    ~deployment_config:(deployment_config_ : edge_deployment_config)
    ~device_selection_config:(device_selection_config_ : device_selection_config)
    ~stage_name:(stage_name_ : entity_name) () =
  ({
     deployment_status = deployment_status_;
     deployment_config = deployment_config_;
     device_selection_config = device_selection_config_;
     stage_name = stage_name_;
   }
    : deployment_stage_status_summary)

let make_describe_edge_deployment_plan_response
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?next_token:(next_token_ : next_token option)
    ?edge_deployment_failed:(edge_deployment_failed_ : integer option)
    ?edge_deployment_pending:(edge_deployment_pending_ : integer option)
    ?edge_deployment_success:(edge_deployment_success_ : integer option)
    ~stages:(stages_ : deployment_stage_status_summaries)
    ~device_fleet_name:(device_fleet_name_ : entity_name)
    ~model_configs:(model_configs_ : edge_deployment_model_configs)
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name)
    ~edge_deployment_plan_arn:(edge_deployment_plan_arn_ : edge_deployment_plan_arn) () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     next_token = next_token_;
     stages = stages_;
     edge_deployment_failed = edge_deployment_failed_;
     edge_deployment_pending = edge_deployment_pending_;
     edge_deployment_success = edge_deployment_success_;
     device_fleet_name = device_fleet_name_;
     model_configs = model_configs_;
     edge_deployment_plan_name = edge_deployment_plan_name_;
     edge_deployment_plan_arn = edge_deployment_plan_arn_;
   }
    : describe_edge_deployment_plan_response)

let make_describe_edge_deployment_plan_request
    ?max_results:(max_results_ : deployment_stage_max_results option)
    ?next_token:(next_token_ : next_token option)
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     edge_deployment_plan_name = edge_deployment_plan_name_;
   }
    : describe_edge_deployment_plan_request)

let make_r_studio_server_pro_domain_settings
    ?default_resource_spec:(default_resource_spec_ : resource_spec option)
    ?r_studio_package_manager_url:(r_studio_package_manager_url_ : string_ option)
    ?r_studio_connect_url:(r_studio_connect_url_ : string_ option)
    ~domain_execution_role_arn:(domain_execution_role_arn_ : role_arn) () =
  ({
     default_resource_spec = default_resource_spec_;
     r_studio_package_manager_url = r_studio_package_manager_url_;
     r_studio_connect_url = r_studio_connect_url_;
     domain_execution_role_arn = domain_execution_role_arn_;
   }
    : r_studio_server_pro_domain_settings)

let make_domain_settings ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?unified_studio_settings:(unified_studio_settings_ : unified_studio_settings option)
    ?amazon_q_settings:(amazon_q_settings_ : amazon_q_settings option)
    ?docker_settings:(docker_settings_ : docker_settings option)
    ?trusted_identity_propagation_settings:
      (trusted_identity_propagation_settings_ : trusted_identity_propagation_settings option)
    ?execution_role_identity_config:
      (execution_role_identity_config_ : execution_role_identity_config option)
    ?r_studio_server_pro_domain_settings:
      (r_studio_server_pro_domain_settings_ : r_studio_server_pro_domain_settings option)
    ?security_group_ids:(security_group_ids_ : domain_security_group_ids option) () =
  ({
     ip_address_type = ip_address_type_;
     unified_studio_settings = unified_studio_settings_;
     amazon_q_settings = amazon_q_settings_;
     docker_settings = docker_settings_;
     trusted_identity_propagation_settings = trusted_identity_propagation_settings_;
     execution_role_identity_config = execution_role_identity_config_;
     r_studio_server_pro_domain_settings = r_studio_server_pro_domain_settings_;
     security_group_ids = security_group_ids_;
   }
    : domain_settings)

let make_describe_domain_response
    ?default_space_settings:(default_space_settings_ : default_space_settings option)
    ?tag_propagation:(tag_propagation_ : tag_propagation option)
    ?home_efs_file_system_creation:
      (home_efs_file_system_creation_ : home_efs_file_system_creation option)
    ?app_security_group_management:
      (app_security_group_management_ : app_security_group_management option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ?vpc_id:(vpc_id_ : vpc_id option)
    ?url:(url_ : string1024 option) ?subnet_ids:(subnet_ids_ : subnets option)
    ?home_efs_file_system_kms_key_id:(home_efs_file_system_kms_key_id_ : kms_key_id option)
    ?app_network_access_type:(app_network_access_type_ : app_network_access_type option)
    ?domain_settings:(domain_settings_ : domain_settings option)
    ?default_user_settings:(default_user_settings_ : user_settings option)
    ?auth_mode:(auth_mode_ : auth_mode option)
    ?security_group_id_for_domain_boundary:
      (security_group_id_for_domain_boundary_ : security_group_id option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?creation_time:(creation_time_ : creation_time option) ?status:(status_ : domain_status option)
    ?single_sign_on_application_arn:
      (single_sign_on_application_arn_ : single_sign_on_application_arn option)
    ?single_sign_on_managed_application_instance_id:
      (single_sign_on_managed_application_instance_id_ : string256 option)
    ?home_efs_file_system_id:(home_efs_file_system_id_ : resource_id option)
    ?domain_name:(domain_name_ : domain_name option) ?domain_id:(domain_id_ : domain_id option)
    ?domain_arn:(domain_arn_ : domain_arn option) () =
  ({
     default_space_settings = default_space_settings_;
     tag_propagation = tag_propagation_;
     home_efs_file_system_creation = home_efs_file_system_creation_;
     app_security_group_management = app_security_group_management_;
     kms_key_id = kms_key_id_;
     vpc_id = vpc_id_;
     url = url_;
     subnet_ids = subnet_ids_;
     home_efs_file_system_kms_key_id = home_efs_file_system_kms_key_id_;
     app_network_access_type = app_network_access_type_;
     domain_settings = domain_settings_;
     default_user_settings = default_user_settings_;
     auth_mode = auth_mode_;
     security_group_id_for_domain_boundary = security_group_id_for_domain_boundary_;
     failure_reason = failure_reason_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     status = status_;
     single_sign_on_application_arn = single_sign_on_application_arn_;
     single_sign_on_managed_application_instance_id =
       single_sign_on_managed_application_instance_id_;
     home_efs_file_system_id = home_efs_file_system_id_;
     domain_name = domain_name_;
     domain_id = domain_id_;
     domain_arn = domain_arn_;
   }
    : describe_domain_response)

let make_describe_domain_request ~domain_id:(domain_id_ : domain_id) () =
  ({ domain_id = domain_id_ } : describe_domain_request)

let make_describe_device_fleet_response ?iot_role_alias:(iot_role_alias_ : iot_role_alias option)
    ?role_arn:(role_arn_ : role_arn option)
    ?description:(description_ : device_fleet_description option)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp) ~output_config:(output_config_ : edge_output_config)
    ~device_fleet_arn:(device_fleet_arn_ : device_fleet_arn)
    ~device_fleet_name:(device_fleet_name_ : entity_name) () =
  ({
     iot_role_alias = iot_role_alias_;
     role_arn = role_arn_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     description = description_;
     output_config = output_config_;
     device_fleet_arn = device_fleet_arn_;
     device_fleet_name = device_fleet_name_;
   }
    : describe_device_fleet_response)

let make_describe_device_fleet_request ~device_fleet_name:(device_fleet_name_ : entity_name) () =
  ({ device_fleet_name = device_fleet_name_ } : describe_device_fleet_request)

let make_edge_model ?latest_inference:(latest_inference_ : timestamp option)
    ?latest_sample_time:(latest_sample_time_ : timestamp option)
    ~model_version:(model_version_ : edge_version) ~model_name:(model_name_ : entity_name) () =
  ({
     latest_inference = latest_inference_;
     latest_sample_time = latest_sample_time_;
     model_version = model_version_;
     model_name = model_name_;
   }
    : edge_model)

let make_describe_device_response ?agent_version:(agent_version_ : edge_version option)
    ?next_token:(next_token_ : next_token option) ?max_models:(max_models_ : integer option)
    ?models:(models_ : edge_models option) ?latest_heartbeat:(latest_heartbeat_ : timestamp option)
    ?iot_thing_name:(iot_thing_name_ : thing_name option)
    ?description:(description_ : device_description option)
    ?device_arn:(device_arn_ : device_arn option)
    ~registration_time:(registration_time_ : timestamp)
    ~device_fleet_name:(device_fleet_name_ : entity_name) ~device_name:(device_name_ : entity_name)
    () =
  ({
     agent_version = agent_version_;
     next_token = next_token_;
     max_models = max_models_;
     models = models_;
     latest_heartbeat = latest_heartbeat_;
     registration_time = registration_time_;
     iot_thing_name = iot_thing_name_;
     device_fleet_name = device_fleet_name_;
     description = description_;
     device_name = device_name_;
     device_arn = device_arn_;
   }
    : describe_device_response)

let make_describe_device_request ?next_token:(next_token_ : next_token option)
    ~device_fleet_name:(device_fleet_name_ : entity_name) ~device_name:(device_name_ : entity_name)
    () =
  ({ device_fleet_name = device_fleet_name_; device_name = device_name_; next_token = next_token_ }
    : describe_device_request)

let make_data_quality_baseline_config
    ?statistics_resource:(statistics_resource_ : monitoring_statistics_resource option)
    ?constraints_resource:(constraints_resource_ : monitoring_constraints_resource option)
    ?baselining_job_name:(baselining_job_name_ : processing_job_name option) () =
  ({
     statistics_resource = statistics_resource_;
     constraints_resource = constraints_resource_;
     baselining_job_name = baselining_job_name_;
   }
    : data_quality_baseline_config)

let make_data_quality_app_specification
    ?environment:(environment_ : monitoring_environment_map option)
    ?post_analytics_processor_source_uri:(post_analytics_processor_source_uri_ : s3_uri option)
    ?record_preprocessor_source_uri:(record_preprocessor_source_uri_ : s3_uri option)
    ?container_arguments:(container_arguments_ : monitoring_container_arguments option)
    ?container_entrypoint:(container_entrypoint_ : container_entrypoint option)
    ~image_uri:(image_uri_ : image_uri) () =
  ({
     environment = environment_;
     post_analytics_processor_source_uri = post_analytics_processor_source_uri_;
     record_preprocessor_source_uri = record_preprocessor_source_uri_;
     container_arguments = container_arguments_;
     container_entrypoint = container_entrypoint_;
     image_uri = image_uri_;
   }
    : data_quality_app_specification)

let make_data_quality_job_input
    ?batch_transform_input:(batch_transform_input_ : batch_transform_input option)
    ?endpoint_input:(endpoint_input_ : endpoint_input option) () =
  ({ batch_transform_input = batch_transform_input_; endpoint_input = endpoint_input_ }
    : data_quality_job_input)

let make_describe_data_quality_job_definition_response
    ?stopping_condition:(stopping_condition_ : monitoring_stopping_condition option)
    ?network_config:(network_config_ : monitoring_network_config option)
    ?data_quality_baseline_config:
      (data_quality_baseline_config_ : data_quality_baseline_config option)
    ~role_arn:(role_arn_ : role_arn) ~job_resources:(job_resources_ : monitoring_resources)
    ~data_quality_job_output_config:(data_quality_job_output_config_ : monitoring_output_config)
    ~data_quality_job_input:(data_quality_job_input_ : data_quality_job_input)
    ~data_quality_app_specification:
      (data_quality_app_specification_ : data_quality_app_specification)
    ~creation_time:(creation_time_ : timestamp)
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name)
    ~job_definition_arn:(job_definition_arn_ : monitoring_job_definition_arn) () =
  ({
     stopping_condition = stopping_condition_;
     role_arn = role_arn_;
     network_config = network_config_;
     job_resources = job_resources_;
     data_quality_job_output_config = data_quality_job_output_config_;
     data_quality_job_input = data_quality_job_input_;
     data_quality_app_specification = data_quality_app_specification_;
     data_quality_baseline_config = data_quality_baseline_config_;
     creation_time = creation_time_;
     job_definition_name = job_definition_name_;
     job_definition_arn = job_definition_arn_;
   }
    : describe_data_quality_job_definition_response)

let make_describe_data_quality_job_definition_request
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name) () =
  ({ job_definition_name = job_definition_name_ } : describe_data_quality_job_definition_request)

let make_describe_context_response
    ?lineage_group_arn:(lineage_group_arn_ : lineage_group_arn option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?creation_time:(creation_time_ : timestamp option)
    ?properties:(properties_ : lineage_entity_parameters option)
    ?description:(description_ : experiment_description option)
    ?context_type:(context_type_ : string256 option) ?source:(source_ : context_source option)
    ?context_arn:(context_arn_ : context_arn option)
    ?context_name:(context_name_ : context_name option) () =
  ({
     lineage_group_arn = lineage_group_arn_;
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     created_by = created_by_;
     creation_time = creation_time_;
     properties = properties_;
     description = description_;
     context_type = context_type_;
     source = source_;
     context_arn = context_arn_;
     context_name = context_name_;
   }
    : describe_context_response)

let make_describe_context_request ~context_name:(context_name_ : context_name_or_arn) () =
  ({ context_name = context_name_ } : describe_context_request)

let make_describe_compute_quota_response ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?activation_state:(activation_state_ : activation_state option)
    ?compute_quota_config:(compute_quota_config_ : compute_quota_config option)
    ?cluster_arn:(cluster_arn_ : cluster_arn option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?description:(description_ : entity_description option)
    ~creation_time:(creation_time_ : timestamp)
    ~compute_quota_target:(compute_quota_target_ : compute_quota_target)
    ~status:(status_ : scheduler_resource_status)
    ~compute_quota_version:(compute_quota_version_ : integer) ~name:(name_ : entity_name)
    ~compute_quota_id:(compute_quota_id_ : compute_quota_id)
    ~compute_quota_arn:(compute_quota_arn_ : compute_quota_arn) () =
  ({
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     created_by = created_by_;
     creation_time = creation_time_;
     activation_state = activation_state_;
     compute_quota_target = compute_quota_target_;
     compute_quota_config = compute_quota_config_;
     cluster_arn = cluster_arn_;
     failure_reason = failure_reason_;
     status = status_;
     compute_quota_version = compute_quota_version_;
     description = description_;
     name = name_;
     compute_quota_id = compute_quota_id_;
     compute_quota_arn = compute_quota_arn_;
   }
    : describe_compute_quota_response)

let make_describe_compute_quota_request
    ?compute_quota_version:(compute_quota_version_ : integer option)
    ~compute_quota_id:(compute_quota_id_ : compute_quota_id) () =
  ({ compute_quota_version = compute_quota_version_; compute_quota_id = compute_quota_id_ }
    : describe_compute_quota_request)

let make_model_digests ?artifact_digest:(artifact_digest_ : artifact_digest option) () =
  ({ artifact_digest = artifact_digest_ } : model_digests)

let make_input_config ?framework_version:(framework_version_ : framework_version option)
    ?data_input_config:(data_input_config_ : data_input_config option)
    ~framework:(framework_ : framework) ~s3_uri:(s3_uri_ : s3_uri) () =
  ({
     framework_version = framework_version_;
     framework = framework_;
     data_input_config = data_input_config_;
     s3_uri = s3_uri_;
   }
    : input_config)

let make_output_config ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?compiler_options:(compiler_options_ : compiler_options option)
    ?target_platform:(target_platform_ : target_platform option)
    ?target_device:(target_device_ : target_device option)
    ~s3_output_location:(s3_output_location_ : s3_uri) () =
  ({
     kms_key_id = kms_key_id_;
     compiler_options = compiler_options_;
     target_platform = target_platform_;
     target_device = target_device_;
     s3_output_location = s3_output_location_;
   }
    : output_config)

let make_neo_vpc_config ~subnets:(subnets_ : neo_vpc_subnets)
    ~security_group_ids:(security_group_ids_ : neo_vpc_security_group_ids) () =
  ({ subnets = subnets_; security_group_ids = security_group_ids_ } : neo_vpc_config)

let make_derived_information
    ?derived_data_input_config:(derived_data_input_config_ : data_input_config option) () =
  ({ derived_data_input_config = derived_data_input_config_ } : derived_information)

let make_describe_compilation_job_response
    ?derived_information:(derived_information_ : derived_information option)
    ?vpc_config:(vpc_config_ : neo_vpc_config option)
    ?model_digests:(model_digests_ : model_digests option)
    ?model_package_version_arn:(model_package_version_arn_ : model_package_arn option)
    ?inference_image:(inference_image_ : inference_image option)
    ?compilation_end_time:(compilation_end_time_ : timestamp option)
    ?compilation_start_time:(compilation_start_time_ : timestamp option)
    ~output_config:(output_config_ : output_config) ~input_config:(input_config_ : input_config)
    ~role_arn:(role_arn_ : role_arn) ~model_artifacts:(model_artifacts_ : model_artifacts)
    ~failure_reason:(failure_reason_ : failure_reason)
    ~last_modified_time:(last_modified_time_ : last_modified_time)
    ~creation_time:(creation_time_ : creation_time)
    ~stopping_condition:(stopping_condition_ : stopping_condition)
    ~compilation_job_status:(compilation_job_status_ : compilation_job_status)
    ~compilation_job_arn:(compilation_job_arn_ : compilation_job_arn)
    ~compilation_job_name:(compilation_job_name_ : entity_name) () =
  ({
     derived_information = derived_information_;
     vpc_config = vpc_config_;
     output_config = output_config_;
     input_config = input_config_;
     role_arn = role_arn_;
     model_digests = model_digests_;
     model_artifacts = model_artifacts_;
     failure_reason = failure_reason_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     model_package_version_arn = model_package_version_arn_;
     inference_image = inference_image_;
     stopping_condition = stopping_condition_;
     compilation_end_time = compilation_end_time_;
     compilation_start_time = compilation_start_time_;
     compilation_job_status = compilation_job_status_;
     compilation_job_arn = compilation_job_arn_;
     compilation_job_name = compilation_job_name_;
   }
    : describe_compilation_job_response)

let make_describe_compilation_job_request
    ~compilation_job_name:(compilation_job_name_ : entity_name) () =
  ({ compilation_job_name = compilation_job_name_ } : describe_compilation_job_request)

let make_describe_code_repository_output ?git_config:(git_config_ : git_config option)
    ~last_modified_time:(last_modified_time_ : last_modified_time)
    ~creation_time:(creation_time_ : creation_time)
    ~code_repository_arn:(code_repository_arn_ : code_repository_arn)
    ~code_repository_name:(code_repository_name_ : entity_name) () =
  ({
     git_config = git_config_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     code_repository_arn = code_repository_arn_;
     code_repository_name = code_repository_name_;
   }
    : describe_code_repository_output)

let make_describe_code_repository_input ~code_repository_name:(code_repository_name_ : entity_name)
    () =
  ({ code_repository_name = code_repository_name_ } : describe_code_repository_input)

let make_describe_cluster_scheduler_config_response
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?description:(description_ : entity_description option)
    ?scheduler_config:(scheduler_config_ : scheduler_config option)
    ?cluster_arn:(cluster_arn_ : cluster_arn option)
    ?status_details:(status_details_ : status_details_map option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ~creation_time:(creation_time_ : timestamp) ~status:(status_ : scheduler_resource_status)
    ~cluster_scheduler_config_version:(cluster_scheduler_config_version_ : integer)
    ~name:(name_ : entity_name)
    ~cluster_scheduler_config_id:(cluster_scheduler_config_id_ : cluster_scheduler_config_id)
    ~cluster_scheduler_config_arn:(cluster_scheduler_config_arn_ : cluster_scheduler_config_arn) ()
    =
  ({
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     created_by = created_by_;
     creation_time = creation_time_;
     description = description_;
     scheduler_config = scheduler_config_;
     cluster_arn = cluster_arn_;
     status_details = status_details_;
     failure_reason = failure_reason_;
     status = status_;
     cluster_scheduler_config_version = cluster_scheduler_config_version_;
     name = name_;
     cluster_scheduler_config_id = cluster_scheduler_config_id_;
     cluster_scheduler_config_arn = cluster_scheduler_config_arn_;
   }
    : describe_cluster_scheduler_config_response)

let make_describe_cluster_scheduler_config_request
    ?cluster_scheduler_config_version:(cluster_scheduler_config_version_ : integer option)
    ~cluster_scheduler_config_id:(cluster_scheduler_config_id_ : cluster_scheduler_config_id) () =
  ({
     cluster_scheduler_config_version = cluster_scheduler_config_version_;
     cluster_scheduler_config_id = cluster_scheduler_config_id_;
   }
    : describe_cluster_scheduler_config_request)

let make_cluster_instance_placement
    ?availability_zone_id:(availability_zone_id_ : cluster_availability_zone_id option)
    ?availability_zone:(availability_zone_ : cluster_availability_zone option) () =
  ({ availability_zone_id = availability_zone_id_; availability_zone = availability_zone_ }
    : cluster_instance_placement)

let make_cluster_kubernetes_config_node_details
    ?desired_taints:(desired_taints_ : cluster_kubernetes_taints option)
    ?current_taints:(current_taints_ : cluster_kubernetes_taints option)
    ?desired_labels:(desired_labels_ : cluster_kubernetes_labels option)
    ?current_labels:(current_labels_ : cluster_kubernetes_labels option) () =
  ({
     desired_taints = desired_taints_;
     current_taints = current_taints_;
     desired_labels = desired_labels_;
     current_labels = current_labels_;
   }
    : cluster_kubernetes_config_node_details)

let make_cluster_network_interface_details
    ?interface_type:(interface_type_ : cluster_interface_type option) () =
  ({ interface_type = interface_type_ } : cluster_network_interface_details)

let make_cluster_node_details
    ?network_interface:(network_interface_ : cluster_network_interface_details option)
    ?capacity_type:(capacity_type_ : cluster_capacity_type option)
    ?kubernetes_config:(kubernetes_config_ : cluster_kubernetes_config_node_details option)
    ?ultra_server_info:(ultra_server_info_ : ultra_server_info option)
    ?image_version_status:(image_version_status_ : cluster_image_version_status option)
    ?desired_image_release_version:(desired_image_release_version_ : image_release_version option)
    ?current_image_release_version:(current_image_release_version_ : image_release_version option)
    ?desired_image_id:(desired_image_id_ : image_id option)
    ?current_image_id:(current_image_id_ : image_id option)
    ?placement:(placement_ : cluster_instance_placement option)
    ?private_dns_hostname:(private_dns_hostname_ : cluster_private_dns_hostname option)
    ?private_primary_ipv6:(private_primary_ipv6_ : cluster_private_primary_ipv6 option)
    ?private_primary_ip:(private_primary_ip_ : cluster_private_primary_ip option)
    ?instance_storage_configs:(instance_storage_configs_ : cluster_instance_storage_configs option)
    ?threads_per_core:(threads_per_core_ : cluster_threads_per_core option)
    ?override_vpc_config:(override_vpc_config_ : vpc_config option)
    ?life_cycle_config:(life_cycle_config_ : cluster_life_cycle_config option)
    ?last_software_update_time:(last_software_update_time_ : timestamp option)
    ?launch_time:(launch_time_ : timestamp option)
    ?instance_type:(instance_type_ : cluster_instance_type option)
    ?instance_status:(instance_status_ : cluster_instance_status_details option)
    ?node_logical_id:(node_logical_id_ : cluster_node_logical_id option)
    ?instance_id:(instance_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_group_name:(instance_group_name_ : cluster_instance_group_name option) () =
  ({
     network_interface = network_interface_;
     capacity_type = capacity_type_;
     kubernetes_config = kubernetes_config_;
     ultra_server_info = ultra_server_info_;
     image_version_status = image_version_status_;
     desired_image_release_version = desired_image_release_version_;
     current_image_release_version = current_image_release_version_;
     desired_image_id = desired_image_id_;
     current_image_id = current_image_id_;
     placement = placement_;
     private_dns_hostname = private_dns_hostname_;
     private_primary_ipv6 = private_primary_ipv6_;
     private_primary_ip = private_primary_ip_;
     instance_storage_configs = instance_storage_configs_;
     threads_per_core = threads_per_core_;
     override_vpc_config = override_vpc_config_;
     life_cycle_config = life_cycle_config_;
     last_software_update_time = last_software_update_time_;
     launch_time = launch_time_;
     instance_type = instance_type_;
     instance_status = instance_status_;
     node_logical_id = node_logical_id_;
     instance_id = instance_id_;
     instance_group_name = instance_group_name_;
   }
    : cluster_node_details)

let make_describe_cluster_node_response ~node_details:(node_details_ : cluster_node_details) () =
  ({ node_details = node_details_ } : describe_cluster_node_response)

let make_describe_cluster_node_request
    ?node_logical_id:(node_logical_id_ : cluster_node_logical_id option)
    ?node_id:(node_id_ : cluster_node_id option) ~cluster_name:(cluster_name_ : cluster_name_or_arn)
    () =
  ({ node_logical_id = node_logical_id_; node_id = node_id_; cluster_name = cluster_name_ }
    : describe_cluster_node_request)

let make_cluster_metadata
    ?slr_access_entry:(slr_access_entry_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?eks_role_access_entries:(eks_role_access_entries_ : eks_role_access_entries option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     slr_access_entry = slr_access_entry_;
     eks_role_access_entries = eks_role_access_entries_;
     failure_message = failure_message_;
   }
    : cluster_metadata)

let make_capacity_reservation ?type_:(type__ : capacity_reservation_type option)
    ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ type_ = type__; arn = arn_ } : capacity_reservation)

let make_instance_group_metadata
    ?ami_override:(ami_override_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?subnet_id:(subnet_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?capacity_reservation:(capacity_reservation_ : capacity_reservation option)
    ?availability_zone_id:(availability_zone_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     ami_override = ami_override_;
     security_group_ids = security_group_ids_;
     subnet_id = subnet_id_;
     capacity_reservation = capacity_reservation_;
     availability_zone_id = availability_zone_id_;
     failure_message = failure_message_;
   }
    : instance_group_metadata)

let make_instance_group_scaling_metadata
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?min_count:(min_count_ : instance_count option)
    ?target_count:(target_count_ : target_count option)
    ?instance_count:(instance_count_ : instance_count option) () =
  ({
     failure_message = failure_message_;
     min_count = min_count_;
     target_count = target_count_;
     instance_count = instance_count_;
   }
    : instance_group_scaling_metadata)

let make_additional_enis ?efa_enis:(efa_enis_ : efa_enis option) () =
  ({ efa_enis = efa_enis_ } : additional_enis)

let make_instance_requirements_eni_configuration
    ?additional_enis:(additional_enis_ : additional_enis option)
    ?customer_eni:(customer_eni_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ additional_enis = additional_enis_; customer_eni = customer_eni_ }
    : instance_requirements_eni_configuration)

let make_instance_metadata ?node_logical_id:(node_logical_id_ : cluster_node_logical_id option)
    ?lcs_execution_state:(lcs_execution_state_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?capacity_reservation:(capacity_reservation_ : capacity_reservation option)
    ?instance_requirements_eni_configurations:
      (instance_requirements_eni_configurations_ : instance_requirements_eni_configurations option)
    ?additional_enis:(additional_enis_ : additional_enis option)
    ?customer_eni:(customer_eni_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     node_logical_id = node_logical_id_;
     lcs_execution_state = lcs_execution_state_;
     failure_message = failure_message_;
     capacity_reservation = capacity_reservation_;
     instance_requirements_eni_configurations = instance_requirements_eni_configurations_;
     additional_enis = additional_enis_;
     customer_eni = customer_eni_;
   }
    : instance_metadata)

let make_event_details ?event_metadata:(event_metadata_ : event_metadata option) () =
  ({ event_metadata = event_metadata_ } : event_details)

let make_cluster_event_detail ?event_level:(event_level_ : cluster_event_level option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?event_details:(event_details_ : event_details option)
    ?instance_id:(instance_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_group_name:(instance_group_name_ : cluster_instance_group_name option)
    ~event_time:(event_time_ : timestamp)
    ~resource_type:(resource_type_ : cluster_event_resource_type)
    ~cluster_name:(cluster_name_ : cluster_name) ~cluster_arn:(cluster_arn_ : cluster_arn)
    ~event_id:(event_id_ : event_id) () =
  ({
     event_level = event_level_;
     description = description_;
     event_details = event_details_;
     event_time = event_time_;
     resource_type = resource_type_;
     instance_id = instance_id_;
     instance_group_name = instance_group_name_;
     cluster_name = cluster_name_;
     cluster_arn = cluster_arn_;
     event_id = event_id_;
   }
    : cluster_event_detail)

let make_describe_cluster_event_response
    ?event_details:(event_details_ : cluster_event_detail option) () =
  ({ event_details = event_details_ } : describe_cluster_event_response)

let make_describe_cluster_event_request ~cluster_name:(cluster_name_ : cluster_name_or_arn)
    ~event_id:(event_id_ : event_id) () =
  ({ cluster_name = cluster_name_; event_id = event_id_ } : describe_cluster_event_request)

let make_cluster_instance_requirement_details
    ?desired_instance_types:(desired_instance_types_ : cluster_instance_types option)
    ?current_instance_types:(current_instance_types_ : cluster_instance_types option) () =
  ({
     desired_instance_types = desired_instance_types_;
     current_instance_types = current_instance_types_;
   }
    : cluster_instance_requirement_details)

let make_cluster_instance_type_detail
    ?threads_per_core:(threads_per_core_ : cluster_threads_per_core option)
    ?current_count:(current_count_ : cluster_non_negative_instance_count option)
    ?instance_type:(instance_type_ : cluster_instance_type option) () =
  ({
     threads_per_core = threads_per_core_;
     current_count = current_count_;
     instance_type = instance_type_;
   }
    : cluster_instance_type_detail)

let make_cluster_patch_schedule_details ?next_patch_date:(next_patch_date_ : timestamp option) () =
  ({ next_patch_date = next_patch_date_ } : cluster_patch_schedule_details)

let make_cluster_auto_patch_config_details
    ?deployment_config:(deployment_config_ : deployment_configuration option)
    ?desired_patch_schedule:(desired_patch_schedule_ : cluster_patch_schedule_details option)
    ?current_patch_schedule:(current_patch_schedule_ : cluster_patch_schedule_details option)
    ?patching_strategy:(patching_strategy_ : cluster_patching_strategy option) () =
  ({
     deployment_config = deployment_config_;
     desired_patch_schedule = desired_patch_schedule_;
     current_patch_schedule = current_patch_schedule_;
     patching_strategy = patching_strategy_;
   }
    : cluster_auto_patch_config_details)

let make_cluster_kubernetes_config_details
    ?desired_taints:(desired_taints_ : cluster_kubernetes_taints option)
    ?current_taints:(current_taints_ : cluster_kubernetes_taints option)
    ?desired_labels:(desired_labels_ : cluster_kubernetes_labels option)
    ?current_labels:(current_labels_ : cluster_kubernetes_labels option) () =
  ({
     desired_taints = desired_taints_;
     current_taints = current_taints_;
     desired_labels = desired_labels_;
     current_labels = current_labels_;
   }
    : cluster_kubernetes_config_details)

let make_cluster_slurm_config_details
    ?partition_names:(partition_names_ : cluster_partition_names option)
    ~node_type:(node_type_ : cluster_slurm_node_type) () =
  ({ partition_names = partition_names_; node_type = node_type_ } : cluster_slurm_config_details)

let make_cluster_instance_group_details
    ?network_interface:(network_interface_ : cluster_network_interface_details option)
    ?slurm_config:(slurm_config_ : cluster_slurm_config_details option)
    ?active_software_update_config:
      (active_software_update_config_ : deployment_configuration option)
    ?software_update_status:(software_update_status_ : software_update_status option)
    ?target_state_count:(target_state_count_ : cluster_instance_count option)
    ?capacity_requirements:(capacity_requirements_ : cluster_capacity_requirements option)
    ?kubernetes_config:(kubernetes_config_ : cluster_kubernetes_config_details option)
    ?active_operations:(active_operations_ : active_operations option)
    ?image_version_status:(image_version_status_ : cluster_image_version_status option)
    ?desired_image_release_version:(desired_image_release_version_ : image_release_version option)
    ?current_image_release_version:(current_image_release_version_ : image_release_version option)
    ?desired_image_id:(desired_image_id_ : image_id option)
    ?current_image_id:(current_image_id_ : image_id option)
    ?auto_patch_config:(auto_patch_config_ : cluster_auto_patch_config_details option)
    ?scheduled_update_config:(scheduled_update_config_ : scheduled_update_config option)
    ?override_vpc_config:(override_vpc_config_ : vpc_config option)
    ?training_plan_status:(training_plan_status_ : instance_group_training_plan_status option)
    ?training_plan_arn:(training_plan_arn_ : training_plan_arn option)
    ?status:(status_ : instance_group_status option)
    ?on_start_deep_health_checks:(on_start_deep_health_checks_ : on_start_deep_health_checks option)
    ?instance_storage_configs:(instance_storage_configs_ : cluster_instance_storage_configs option)
    ?threads_per_core:(threads_per_core_ : cluster_threads_per_core option)
    ?execution_role:(execution_role_ : role_arn option)
    ?life_cycle_config:(life_cycle_config_ : cluster_life_cycle_config option)
    ?instance_type_details:(instance_type_details_ : cluster_instance_type_details option)
    ?instance_requirements:(instance_requirements_ : cluster_instance_requirement_details option)
    ?instance_type:(instance_type_ : cluster_instance_type option)
    ?instance_group_name:(instance_group_name_ : cluster_instance_group_name option)
    ?min_count:(min_count_ : cluster_instance_count option)
    ?target_count:(target_count_ : cluster_instance_count option)
    ?current_count:(current_count_ : cluster_non_negative_instance_count option) () =
  ({
     network_interface = network_interface_;
     slurm_config = slurm_config_;
     active_software_update_config = active_software_update_config_;
     software_update_status = software_update_status_;
     target_state_count = target_state_count_;
     capacity_requirements = capacity_requirements_;
     kubernetes_config = kubernetes_config_;
     active_operations = active_operations_;
     image_version_status = image_version_status_;
     desired_image_release_version = desired_image_release_version_;
     current_image_release_version = current_image_release_version_;
     desired_image_id = desired_image_id_;
     current_image_id = current_image_id_;
     auto_patch_config = auto_patch_config_;
     scheduled_update_config = scheduled_update_config_;
     override_vpc_config = override_vpc_config_;
     training_plan_status = training_plan_status_;
     training_plan_arn = training_plan_arn_;
     status = status_;
     on_start_deep_health_checks = on_start_deep_health_checks_;
     instance_storage_configs = instance_storage_configs_;
     threads_per_core = threads_per_core_;
     execution_role = execution_role_;
     life_cycle_config = life_cycle_config_;
     instance_type_details = instance_type_details_;
     instance_requirements = instance_requirements_;
     instance_type = instance_type_;
     instance_group_name = instance_group_name_;
     min_count = min_count_;
     target_count = target_count_;
     current_count = current_count_;
   }
    : cluster_instance_group_details)

let make_environment_config_details ?s3_output_path:(s3_output_path_ : s3_uri option)
    ?f_sx_lustre_config:(f_sx_lustre_config_ : f_sx_lustre_config option) () =
  ({ s3_output_path = s3_output_path_; f_sx_lustre_config = f_sx_lustre_config_ }
    : environment_config_details)

let make_cluster_restricted_instance_group_details
    ?environment_config:(environment_config_ : environment_config_details option)
    ?scheduled_update_config:(scheduled_update_config_ : scheduled_update_config option)
    ?override_vpc_config:(override_vpc_config_ : vpc_config option)
    ?training_plan_status:(training_plan_status_ : instance_group_training_plan_status option)
    ?training_plan_arn:(training_plan_arn_ : training_plan_arn option)
    ?status:(status_ : instance_group_status option)
    ?on_start_deep_health_checks:(on_start_deep_health_checks_ : on_start_deep_health_checks option)
    ?instance_storage_configs:(instance_storage_configs_ : cluster_instance_storage_configs option)
    ?threads_per_core:(threads_per_core_ : cluster_threads_per_core option)
    ?execution_role:(execution_role_ : role_arn option)
    ?instance_type:(instance_type_ : cluster_instance_type option)
    ?instance_group_name:(instance_group_name_ : cluster_instance_group_name option)
    ?target_count:(target_count_ : cluster_instance_count option)
    ?current_count:(current_count_ : cluster_non_negative_instance_count option) () =
  ({
     environment_config = environment_config_;
     scheduled_update_config = scheduled_update_config_;
     override_vpc_config = override_vpc_config_;
     training_plan_status = training_plan_status_;
     training_plan_arn = training_plan_arn_;
     status = status_;
     on_start_deep_health_checks = on_start_deep_health_checks_;
     instance_storage_configs = instance_storage_configs_;
     threads_per_core = threads_per_core_;
     execution_role = execution_role_;
     instance_type = instance_type_;
     instance_group_name = instance_group_name_;
     target_count = target_count_;
     current_count = current_count_;
   }
    : cluster_restricted_instance_group_details)

let make_cluster_shared_environment_config_details
    ?desired_f_sx_lustre_deletion_policy:
      (desired_f_sx_lustre_deletion_policy_ : cluster_f_sx_lustre_deletion_policy option)
    ?current_f_sx_lustre_deletion_policy:
      (current_f_sx_lustre_deletion_policy_ : cluster_f_sx_lustre_deletion_policy option)
    ?desired_f_sx_lustre_config:(desired_f_sx_lustre_config_ : f_sx_lustre_config option)
    ?current_f_sx_lustre_config:(current_f_sx_lustre_config_ : f_sx_lustre_config option) () =
  ({
     desired_f_sx_lustre_deletion_policy = desired_f_sx_lustre_deletion_policy_;
     current_f_sx_lustre_deletion_policy = current_f_sx_lustre_deletion_policy_;
     desired_f_sx_lustre_config = desired_f_sx_lustre_config_;
     current_f_sx_lustre_config = current_f_sx_lustre_config_;
   }
    : cluster_shared_environment_config_details)

let make_cluster_restricted_instance_groups_config_output
    ~shared_environment_config:
      (shared_environment_config_ : cluster_shared_environment_config_details) () =
  ({ shared_environment_config = shared_environment_config_ }
    : cluster_restricted_instance_groups_config_output)

let make_cluster_auto_scaling_config_output
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?auto_scaler_type:(auto_scaler_type_ : cluster_auto_scaler_type option)
    ~status:(status_ : cluster_auto_scaling_status) ~mode:(mode_ : cluster_auto_scaling_mode) () =
  ({
     failure_message = failure_message_;
     status = status_;
     auto_scaler_type = auto_scaler_type_;
     mode = mode_;
   }
    : cluster_auto_scaling_config_output)

let make_describe_cluster_response
    ?auto_scaling:(auto_scaling_ : cluster_auto_scaling_config_output option)
    ?cluster_role:(cluster_role_ : role_arn option)
    ?node_provisioning_mode:(node_provisioning_mode_ : cluster_node_provisioning_mode option)
    ?node_recovery:(node_recovery_ : cluster_node_recovery option)
    ?tiered_storage_config:(tiered_storage_config_ : cluster_tiered_storage_config option)
    ?orchestrator:(orchestrator_ : cluster_orchestrator option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?restricted_instance_groups_config:
      (restricted_instance_groups_config_ : cluster_restricted_instance_groups_config_output option)
    ?restricted_instance_groups:
      (restricted_instance_groups_ : cluster_restricted_instance_group_details_list option)
    ?failure_message:(failure_message_ : string_ option)
    ?creation_time:(creation_time_ : timestamp option)
    ?cluster_name:(cluster_name_ : cluster_name option)
    ~instance_groups:(instance_groups_ : cluster_instance_group_details_list)
    ~cluster_status:(cluster_status_ : cluster_status) ~cluster_arn:(cluster_arn_ : cluster_arn) ()
    =
  ({
     auto_scaling = auto_scaling_;
     cluster_role = cluster_role_;
     node_provisioning_mode = node_provisioning_mode_;
     node_recovery = node_recovery_;
     tiered_storage_config = tiered_storage_config_;
     orchestrator = orchestrator_;
     vpc_config = vpc_config_;
     restricted_instance_groups_config = restricted_instance_groups_config_;
     restricted_instance_groups = restricted_instance_groups_;
     instance_groups = instance_groups_;
     failure_message = failure_message_;
     creation_time = creation_time_;
     cluster_status = cluster_status_;
     cluster_name = cluster_name_;
     cluster_arn = cluster_arn_;
   }
    : describe_cluster_response)

let make_describe_cluster_request ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({ cluster_name = cluster_name_ } : describe_cluster_request)

let make_auto_mls3_data_source ~s3_uri:(s3_uri_ : s3_uri)
    ~s3_data_type:(s3_data_type_ : auto_mls3_data_type) () =
  ({ s3_uri = s3_uri_; s3_data_type = s3_data_type_ } : auto_mls3_data_source)

let make_auto_ml_data_source ~s3_data_source:(s3_data_source_ : auto_mls3_data_source) () =
  ({ s3_data_source = s3_data_source_ } : auto_ml_data_source)

let make_auto_ml_job_channel ?data_source:(data_source_ : auto_ml_data_source option)
    ?compression_type:(compression_type_ : compression_type option)
    ?content_type:(content_type_ : content_type option)
    ?channel_type:(channel_type_ : auto_ml_channel_type option) () =
  ({
     data_source = data_source_;
     compression_type = compression_type_;
     content_type = content_type_;
     channel_type = channel_type_;
   }
    : auto_ml_job_channel)

let make_auto_ml_output_data_config ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ~s3_output_path:(s3_output_path_ : s3_uri) () =
  ({ s3_output_path = s3_output_path_; kms_key_id = kms_key_id_ } : auto_ml_output_data_config)

let make_auto_ml_job_objective ~metric_name:(metric_name_ : auto_ml_metric_enum) () =
  ({ metric_name = metric_name_ } : auto_ml_job_objective)

let make_image_classification_job_config
    ?completion_criteria:(completion_criteria_ : auto_ml_job_completion_criteria option) () =
  ({ completion_criteria = completion_criteria_ } : image_classification_job_config)

let make_auto_ml_job_artifacts
    ?data_exploration_notebook_location:
      (data_exploration_notebook_location_ : data_exploration_notebook_location option)
    ?candidate_definition_notebook_location:
      (candidate_definition_notebook_location_ : candidate_definition_notebook_location option) () =
  ({
     data_exploration_notebook_location = data_exploration_notebook_location_;
     candidate_definition_notebook_location = candidate_definition_notebook_location_;
   }
    : auto_ml_job_artifacts)

let make_auto_ml_resolved_attributes
    ?auto_ml_problem_type_resolved_attributes:
      (auto_ml_problem_type_resolved_attributes_ : auto_ml_problem_type_resolved_attributes option)
    ?completion_criteria:(completion_criteria_ : auto_ml_job_completion_criteria option)
    ?auto_ml_job_objective:(auto_ml_job_objective_ : auto_ml_job_objective option) () =
  ({
     auto_ml_problem_type_resolved_attributes = auto_ml_problem_type_resolved_attributes_;
     completion_criteria = completion_criteria_;
     auto_ml_job_objective = auto_ml_job_objective_;
   }
    : auto_ml_resolved_attributes)

let make_model_deploy_config ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ?auto_generate_endpoint_name:(auto_generate_endpoint_name_ : auto_generate_endpoint_name option)
    () =
  ({ endpoint_name = endpoint_name_; auto_generate_endpoint_name = auto_generate_endpoint_name_ }
    : model_deploy_config)

let make_auto_ml_data_split_config
    ?validation_fraction:(validation_fraction_ : validation_fraction option) () =
  ({ validation_fraction = validation_fraction_ } : auto_ml_data_split_config)

let make_auto_ml_security_config ?vpc_config:(vpc_config_ : vpc_config option)
    ?enable_inter_container_traffic_encryption:
      (enable_inter_container_traffic_encryption_ : boolean_ option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option) () =
  ({
     vpc_config = vpc_config_;
     enable_inter_container_traffic_encryption = enable_inter_container_traffic_encryption_;
     volume_kms_key_id = volume_kms_key_id_;
   }
    : auto_ml_security_config)

let make_emr_serverless_compute_config ~execution_role_ar_n:(execution_role_ar_n_ : role_arn) () =
  ({ execution_role_ar_n = execution_role_ar_n_ } : emr_serverless_compute_config)

let make_auto_ml_compute_config
    ?emr_serverless_compute_config:
      (emr_serverless_compute_config_ : emr_serverless_compute_config option) () =
  ({ emr_serverless_compute_config = emr_serverless_compute_config_ } : auto_ml_compute_config)

let make_describe_auto_ml_job_v2_response
    ?auto_ml_compute_config:(auto_ml_compute_config_ : auto_ml_compute_config option)
    ?security_config:(security_config_ : auto_ml_security_config option)
    ?data_split_config:(data_split_config_ : auto_ml_data_split_config option)
    ?model_deploy_result:(model_deploy_result_ : model_deploy_result option)
    ?model_deploy_config:(model_deploy_config_ : model_deploy_config option)
    ?resolved_attributes:(resolved_attributes_ : auto_ml_resolved_attributes option)
    ?auto_ml_job_artifacts:(auto_ml_job_artifacts_ : auto_ml_job_artifacts option)
    ?best_candidate:(best_candidate_ : auto_ml_candidate option)
    ?partial_failure_reasons:(partial_failure_reasons_ : auto_ml_partial_failure_reasons option)
    ?failure_reason:(failure_reason_ : auto_ml_failure_reason option)
    ?end_time:(end_time_ : timestamp option)
    ?auto_ml_problem_type_config_name:
      (auto_ml_problem_type_config_name_ : auto_ml_problem_type_config_name option)
    ?auto_ml_problem_type_config:(auto_ml_problem_type_config_ : auto_ml_problem_type_config option)
    ?auto_ml_job_objective:(auto_ml_job_objective_ : auto_ml_job_objective option)
    ~auto_ml_job_secondary_status:(auto_ml_job_secondary_status_ : auto_ml_job_secondary_status)
    ~auto_ml_job_status:(auto_ml_job_status_ : auto_ml_job_status)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp) ~role_arn:(role_arn_ : role_arn)
    ~output_data_config:(output_data_config_ : auto_ml_output_data_config)
    ~auto_ml_job_input_data_config:(auto_ml_job_input_data_config_ : auto_ml_job_input_data_config)
    ~auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn)
    ~auto_ml_job_name:(auto_ml_job_name_ : auto_ml_job_name) () =
  ({
     auto_ml_compute_config = auto_ml_compute_config_;
     security_config = security_config_;
     data_split_config = data_split_config_;
     model_deploy_result = model_deploy_result_;
     model_deploy_config = model_deploy_config_;
     resolved_attributes = resolved_attributes_;
     auto_ml_job_artifacts = auto_ml_job_artifacts_;
     auto_ml_job_secondary_status = auto_ml_job_secondary_status_;
     auto_ml_job_status = auto_ml_job_status_;
     best_candidate = best_candidate_;
     partial_failure_reasons = partial_failure_reasons_;
     failure_reason = failure_reason_;
     last_modified_time = last_modified_time_;
     end_time = end_time_;
     creation_time = creation_time_;
     auto_ml_problem_type_config_name = auto_ml_problem_type_config_name_;
     auto_ml_problem_type_config = auto_ml_problem_type_config_;
     auto_ml_job_objective = auto_ml_job_objective_;
     role_arn = role_arn_;
     output_data_config = output_data_config_;
     auto_ml_job_input_data_config = auto_ml_job_input_data_config_;
     auto_ml_job_arn = auto_ml_job_arn_;
     auto_ml_job_name = auto_ml_job_name_;
   }
    : describe_auto_ml_job_v2_response)

let make_describe_auto_ml_job_v2_request ~auto_ml_job_name:(auto_ml_job_name_ : auto_ml_job_name) ()
    =
  ({ auto_ml_job_name = auto_ml_job_name_ } : describe_auto_ml_job_v2_request)

let make_auto_ml_channel
    ?sample_weight_attribute_name:
      (sample_weight_attribute_name_ : sample_weight_attribute_name option)
    ?channel_type:(channel_type_ : auto_ml_channel_type option)
    ?content_type:(content_type_ : content_type option)
    ?compression_type:(compression_type_ : compression_type option)
    ?data_source:(data_source_ : auto_ml_data_source option)
    ~target_attribute_name:(target_attribute_name_ : target_attribute_name) () =
  ({
     sample_weight_attribute_name = sample_weight_attribute_name_;
     channel_type = channel_type_;
     content_type = content_type_;
     target_attribute_name = target_attribute_name_;
     compression_type = compression_type_;
     data_source = data_source_;
   }
    : auto_ml_channel)

let make_auto_ml_candidate_generation_config
    ?algorithms_config:(algorithms_config_ : auto_ml_algorithms_config option)
    ?feature_specification_s3_uri:(feature_specification_s3_uri_ : s3_uri option) () =
  ({
     algorithms_config = algorithms_config_;
     feature_specification_s3_uri = feature_specification_s3_uri_;
   }
    : auto_ml_candidate_generation_config)

let make_auto_ml_job_config ?mode:(mode_ : auto_ml_mode option)
    ?data_split_config:(data_split_config_ : auto_ml_data_split_config option)
    ?candidate_generation_config:
      (candidate_generation_config_ : auto_ml_candidate_generation_config option)
    ?security_config:(security_config_ : auto_ml_security_config option)
    ?completion_criteria:(completion_criteria_ : auto_ml_job_completion_criteria option) () =
  ({
     mode = mode_;
     data_split_config = data_split_config_;
     candidate_generation_config = candidate_generation_config_;
     security_config = security_config_;
     completion_criteria = completion_criteria_;
   }
    : auto_ml_job_config)

let make_resolved_attributes
    ?completion_criteria:(completion_criteria_ : auto_ml_job_completion_criteria option)
    ?problem_type:(problem_type_ : problem_type option)
    ?auto_ml_job_objective:(auto_ml_job_objective_ : auto_ml_job_objective option) () =
  ({
     completion_criteria = completion_criteria_;
     problem_type = problem_type_;
     auto_ml_job_objective = auto_ml_job_objective_;
   }
    : resolved_attributes)

let make_describe_auto_ml_job_response
    ?model_deploy_result:(model_deploy_result_ : model_deploy_result option)
    ?model_deploy_config:(model_deploy_config_ : model_deploy_config option)
    ?resolved_attributes:(resolved_attributes_ : resolved_attributes option)
    ?auto_ml_job_artifacts:(auto_ml_job_artifacts_ : auto_ml_job_artifacts option)
    ?generate_candidate_definitions_only:
      (generate_candidate_definitions_only_ : generate_candidate_definitions_only option)
    ?best_candidate:(best_candidate_ : auto_ml_candidate option)
    ?partial_failure_reasons:(partial_failure_reasons_ : auto_ml_partial_failure_reasons option)
    ?failure_reason:(failure_reason_ : auto_ml_failure_reason option)
    ?end_time:(end_time_ : timestamp option)
    ?auto_ml_job_config:(auto_ml_job_config_ : auto_ml_job_config option)
    ?problem_type:(problem_type_ : problem_type option)
    ?auto_ml_job_objective:(auto_ml_job_objective_ : auto_ml_job_objective option)
    ~auto_ml_job_secondary_status:(auto_ml_job_secondary_status_ : auto_ml_job_secondary_status)
    ~auto_ml_job_status:(auto_ml_job_status_ : auto_ml_job_status)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp) ~role_arn:(role_arn_ : role_arn)
    ~output_data_config:(output_data_config_ : auto_ml_output_data_config)
    ~input_data_config:(input_data_config_ : auto_ml_input_data_config)
    ~auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn)
    ~auto_ml_job_name:(auto_ml_job_name_ : auto_ml_job_name) () =
  ({
     model_deploy_result = model_deploy_result_;
     model_deploy_config = model_deploy_config_;
     resolved_attributes = resolved_attributes_;
     auto_ml_job_artifacts = auto_ml_job_artifacts_;
     generate_candidate_definitions_only = generate_candidate_definitions_only_;
     auto_ml_job_secondary_status = auto_ml_job_secondary_status_;
     auto_ml_job_status = auto_ml_job_status_;
     best_candidate = best_candidate_;
     partial_failure_reasons = partial_failure_reasons_;
     failure_reason = failure_reason_;
     last_modified_time = last_modified_time_;
     end_time = end_time_;
     creation_time = creation_time_;
     auto_ml_job_config = auto_ml_job_config_;
     problem_type = problem_type_;
     auto_ml_job_objective = auto_ml_job_objective_;
     role_arn = role_arn_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     auto_ml_job_arn = auto_ml_job_arn_;
     auto_ml_job_name = auto_ml_job_name_;
   }
    : describe_auto_ml_job_response)

let make_describe_auto_ml_job_request ~auto_ml_job_name:(auto_ml_job_name_ : auto_ml_job_name) () =
  ({ auto_ml_job_name = auto_ml_job_name_ } : describe_auto_ml_job_request)

let make_describe_artifact_response
    ?lineage_group_arn:(lineage_group_arn_ : lineage_group_arn option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?creation_time:(creation_time_ : timestamp option)
    ?properties:(properties_ : lineage_entity_parameters option)
    ?artifact_type:(artifact_type_ : string256 option) ?source:(source_ : artifact_source option)
    ?artifact_arn:(artifact_arn_ : artifact_arn option)
    ?artifact_name:(artifact_name_ : experiment_entity_name_or_arn option) () =
  ({
     lineage_group_arn = lineage_group_arn_;
     metadata_properties = metadata_properties_;
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     created_by = created_by_;
     creation_time = creation_time_;
     properties = properties_;
     artifact_type = artifact_type_;
     source = source_;
     artifact_arn = artifact_arn_;
     artifact_name = artifact_name_;
   }
    : describe_artifact_response)

let make_describe_artifact_request ~artifact_arn:(artifact_arn_ : artifact_arn) () =
  ({ artifact_arn = artifact_arn_ } : describe_artifact_request)

let make_describe_app_image_config_response
    ?code_editor_app_image_config:
      (code_editor_app_image_config_ : code_editor_app_image_config option)
    ?jupyter_lab_app_image_config:
      (jupyter_lab_app_image_config_ : jupyter_lab_app_image_config option)
    ?kernel_gateway_image_config:(kernel_gateway_image_config_ : kernel_gateway_image_config option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?app_image_config_name:(app_image_config_name_ : app_image_config_name option)
    ?app_image_config_arn:(app_image_config_arn_ : app_image_config_arn option) () =
  ({
     code_editor_app_image_config = code_editor_app_image_config_;
     jupyter_lab_app_image_config = jupyter_lab_app_image_config_;
     kernel_gateway_image_config = kernel_gateway_image_config_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     app_image_config_name = app_image_config_name_;
     app_image_config_arn = app_image_config_arn_;
   }
    : describe_app_image_config_response)

let make_describe_app_image_config_request
    ~app_image_config_name:(app_image_config_name_ : app_image_config_name) () =
  ({ app_image_config_name = app_image_config_name_ } : describe_app_image_config_request)

let make_describe_app_response
    ?built_in_lifecycle_config_arn:
      (built_in_lifecycle_config_arn_ : studio_lifecycle_config_arn option)
    ?resource_spec:(resource_spec_ : resource_spec option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_user_activity_timestamp:(last_user_activity_timestamp_ : timestamp option)
    ?last_health_check_timestamp:(last_health_check_timestamp_ : timestamp option)
    ?recovery_mode:(recovery_mode_ : boolean_ option)
    ?effective_trusted_identity_propagation_status:
      (effective_trusted_identity_propagation_status_ : feature_status option)
    ?status:(status_ : app_status option) ?space_name:(space_name_ : space_name option)
    ?user_profile_name:(user_profile_name_ : user_profile_name option)
    ?domain_id:(domain_id_ : domain_id option) ?app_name:(app_name_ : app_name option)
    ?app_type:(app_type_ : app_type option) ?app_arn:(app_arn_ : app_arn option) () =
  ({
     built_in_lifecycle_config_arn = built_in_lifecycle_config_arn_;
     resource_spec = resource_spec_;
     failure_reason = failure_reason_;
     creation_time = creation_time_;
     last_user_activity_timestamp = last_user_activity_timestamp_;
     last_health_check_timestamp = last_health_check_timestamp_;
     recovery_mode = recovery_mode_;
     effective_trusted_identity_propagation_status = effective_trusted_identity_propagation_status_;
     status = status_;
     space_name = space_name_;
     user_profile_name = user_profile_name_;
     domain_id = domain_id_;
     app_name = app_name_;
     app_type = app_type_;
     app_arn = app_arn_;
   }
    : describe_app_response)

let make_describe_app_request ?space_name:(space_name_ : space_name option)
    ?user_profile_name:(user_profile_name_ : user_profile_name option)
    ~app_name:(app_name_ : app_name) ~app_type:(app_type_ : app_type)
    ~domain_id:(domain_id_ : domain_id) () =
  ({
     app_name = app_name_;
     app_type = app_type_;
     space_name = space_name_;
     user_profile_name = user_profile_name_;
     domain_id = domain_id_;
   }
    : describe_app_request)

let make_algorithm_validation_profile
    ?transform_job_definition:(transform_job_definition_ : transform_job_definition option)
    ~training_job_definition:(training_job_definition_ : training_job_definition)
    ~profile_name:(profile_name_ : entity_name) () =
  ({
     transform_job_definition = transform_job_definition_;
     training_job_definition = training_job_definition_;
     profile_name = profile_name_;
   }
    : algorithm_validation_profile)

let make_algorithm_validation_specification
    ~validation_profiles:(validation_profiles_ : algorithm_validation_profiles)
    ~validation_role:(validation_role_ : role_arn) () =
  ({ validation_profiles = validation_profiles_; validation_role = validation_role_ }
    : algorithm_validation_specification)

let make_algorithm_status_item ?failure_reason:(failure_reason_ : string_ option)
    ~status:(status_ : detailed_algorithm_status) ~name:(name_ : entity_name) () =
  ({ failure_reason = failure_reason_; status = status_; name = name_ } : algorithm_status_item)

let make_algorithm_status_details
    ?image_scan_statuses:(image_scan_statuses_ : algorithm_status_item_list option)
    ?validation_statuses:(validation_statuses_ : algorithm_status_item_list option) () =
  ({ image_scan_statuses = image_scan_statuses_; validation_statuses = validation_statuses_ }
    : algorithm_status_details)

let make_describe_algorithm_output
    ?certify_for_marketplace:(certify_for_marketplace_ : certify_for_marketplace option)
    ?product_id:(product_id_ : product_id option)
    ?validation_specification:
      (validation_specification_ : algorithm_validation_specification option)
    ?inference_specification:(inference_specification_ : inference_specification option)
    ?algorithm_description:(algorithm_description_ : entity_description option)
    ~algorithm_status_details:(algorithm_status_details_ : algorithm_status_details)
    ~algorithm_status:(algorithm_status_ : algorithm_status)
    ~training_specification:(training_specification_ : training_specification)
    ~creation_time:(creation_time_ : creation_time) ~algorithm_arn:(algorithm_arn_ : algorithm_arn)
    ~algorithm_name:(algorithm_name_ : entity_name) () =
  ({
     certify_for_marketplace = certify_for_marketplace_;
     product_id = product_id_;
     algorithm_status_details = algorithm_status_details_;
     algorithm_status = algorithm_status_;
     validation_specification = validation_specification_;
     inference_specification = inference_specification_;
     training_specification = training_specification_;
     creation_time = creation_time_;
     algorithm_description = algorithm_description_;
     algorithm_arn = algorithm_arn_;
     algorithm_name = algorithm_name_;
   }
    : describe_algorithm_output)

let make_describe_algorithm_input ~algorithm_name:(algorithm_name_ : arn_or_name) () =
  ({ algorithm_name = algorithm_name_ } : describe_algorithm_input)

let make_ai_workload_s3_data_source ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ s3_uri = s3_uri_ } : ai_workload_s3_data_source)

let make_ai_workload_data_source
    ?s3_data_source:(s3_data_source_ : ai_workload_s3_data_source option) () =
  ({ s3_data_source = s3_data_source_ } : ai_workload_data_source)

let make_ai_workload_input_data_config ~data_source:(data_source_ : ai_workload_data_source)
    ~channel_name:(channel_name_ : ai_channel_name) () =
  ({ data_source = data_source_; channel_name = channel_name_ } : ai_workload_input_data_config)

let make_ai_workload_configs ~workload_spec:(workload_spec_ : workload_spec) () =
  ({ workload_spec = workload_spec_ } : ai_workload_configs)

let make_describe_ai_workload_config_response ?tags:(tags_ : tag_list option)
    ?ai_workload_configs:(ai_workload_configs_ : ai_workload_configs option)
    ?dataset_config:(dataset_config_ : ai_dataset_config option)
    ~creation_time:(creation_time_ : timestamp)
    ~ai_workload_config_arn:(ai_workload_config_arn_ : ai_workload_config_arn)
    ~ai_workload_config_name:(ai_workload_config_name_ : ai_entity_name) () =
  ({
     creation_time = creation_time_;
     tags = tags_;
     ai_workload_configs = ai_workload_configs_;
     dataset_config = dataset_config_;
     ai_workload_config_arn = ai_workload_config_arn_;
     ai_workload_config_name = ai_workload_config_name_;
   }
    : describe_ai_workload_config_response)

let make_describe_ai_workload_config_request
    ~ai_workload_config_name:(ai_workload_config_name_ : ai_entity_name) () =
  ({ ai_workload_config_name = ai_workload_config_name_ } : describe_ai_workload_config_request)

let make_ai_model_source_s3 ?s3_uri:(s3_uri_ : s3_uri option) () =
  ({ s3_uri = s3_uri_ } : ai_model_source_s3)

let make_ai_mlflow_config ?mlflow_run_name:(mlflow_run_name_ : ai_mlflow_run_name option)
    ?mlflow_experiment_name:(mlflow_experiment_name_ : ai_mlflow_experiment_name option)
    ~mlflow_resource_arn:(mlflow_resource_arn_ : ai_mlflow_resource_arn) () =
  ({
     mlflow_run_name = mlflow_run_name_;
     mlflow_experiment_name = mlflow_experiment_name_;
     mlflow_resource_arn = mlflow_resource_arn_;
   }
    : ai_mlflow_config)

let make_ai_recommendation_inference_specification
    ?framework:(framework_ : ai_recommendation_inference_framework option) () =
  ({ framework = framework_ } : ai_recommendation_inference_specification)

let make_ai_recommendation_constraint ~metric:(metric_ : ai_recommendation_metric) () =
  ({ metric = metric_ } : ai_recommendation_constraint)

let make_ai_recommendation_performance_target
    ~constraints:(constraints_ : ai_recommendation_constraint_list) () =
  ({ constraints = constraints_ } : ai_recommendation_performance_target)

let make_ai_recommendation_optimization_detail
    ?optimization_config:(optimization_config_ : ai_recommendation_optimization_config_map option)
    ~optimization_type:(optimization_type_ : ai_recommendation_optimization_type) () =
  ({ optimization_config = optimization_config_; optimization_type = optimization_type_ }
    : ai_recommendation_optimization_detail)

let make_ai_recommendation_instance_detail
    ?copy_count_per_instance:
      (copy_count_per_instance_ : ai_recommendation_copy_count_per_instance option)
    ?instance_count:(instance_count_ : ai_recommendation_instance_count option)
    ?instance_type:(instance_type_ : ai_recommendation_instance_type option) () =
  ({
     copy_count_per_instance = copy_count_per_instance_;
     instance_count = instance_count_;
     instance_type = instance_type_;
   }
    : ai_recommendation_instance_detail)

let make_ai_recommendation_model_details
    ?instance_details:(instance_details_ : ai_recommendation_instance_detail_list option)
    ?inference_specification_name:
      (inference_specification_name_ : ai_inference_specification_name option)
    ?model_package_arn:(model_package_arn_ : model_package_arn option) () =
  ({
     instance_details = instance_details_;
     inference_specification_name = inference_specification_name_;
     model_package_arn = model_package_arn_;
   }
    : ai_recommendation_model_details)

let make_ai_recommendation_deployment_s3_channel ?uri:(uri_ : s3_uri option)
    ?channel_name:(channel_name_ : ai_channel_name option) () =
  ({ uri = uri_; channel_name = channel_name_ } : ai_recommendation_deployment_s3_channel)

let make_ai_recommendation_deployment_configuration
    ?environment_variables:(environment_variables_ : environment_map option)
    ?copy_count_per_instance:
      (copy_count_per_instance_ : ai_recommendation_copy_count_per_instance option)
    ?instance_count:(instance_count_ : ai_recommendation_instance_count option)
    ?instance_type:(instance_type_ : ai_recommendation_instance_type option)
    ?image_uri:(image_uri_ : string_ option)
    ?s3:(s3_ : ai_recommendation_deployment_s3_channel_list option) () =
  ({
     environment_variables = environment_variables_;
     copy_count_per_instance = copy_count_per_instance_;
     instance_count = instance_count_;
     instance_type = instance_type_;
     image_uri = image_uri_;
     s3 = s3_;
   }
    : ai_recommendation_deployment_configuration)

let make_ai_recommendation_performance_metric ?unit_:(unit__ : string_ option)
    ?stat:(stat_ : string_ option) ~value:(value_ : string_) ~metric:(metric_ : string_) () =
  ({ unit_ = unit__; value = value_; stat = stat_; metric = metric_ }
    : ai_recommendation_performance_metric)

let make_ai_recommendation
    ?expected_performance:(expected_performance_ : expected_performance_list option)
    ?ai_benchmark_job_arn:(ai_benchmark_job_arn_ : ai_benchmark_job_arn option)
    ?deployment_configuration:
      (deployment_configuration_ : ai_recommendation_deployment_configuration option)
    ?model_details:(model_details_ : ai_recommendation_model_details option)
    ?optimization_details:
      (optimization_details_ : ai_recommendation_optimization_detail_list option)
    ?recommendation_description:(recommendation_description_ : string_ option) () =
  ({
     expected_performance = expected_performance_;
     ai_benchmark_job_arn = ai_benchmark_job_arn_;
     deployment_configuration = deployment_configuration_;
     model_details = model_details_;
     optimization_details = optimization_details_;
     recommendation_description = recommendation_description_;
   }
    : ai_recommendation)

let make_ai_capacity_reservation_config
    ?ml_reservation_arns:(ml_reservation_arns_ : ai_ml_reservation_arn_list option)
    ?capacity_reservation_preference:
      (capacity_reservation_preference_ : ai_capacity_reservation_preference option) () =
  ({
     ml_reservation_arns = ml_reservation_arns_;
     capacity_reservation_preference = capacity_reservation_preference_;
   }
    : ai_capacity_reservation_config)

let make_ai_recommendation_compute_spec
    ?capacity_reservation_config:
      (capacity_reservation_config_ : ai_capacity_reservation_config option)
    ?instance_types:(instance_types_ : ai_recommendation_instance_type_list option) () =
  ({ capacity_reservation_config = capacity_reservation_config_; instance_types = instance_types_ }
    : ai_recommendation_compute_spec)

let make_describe_ai_recommendation_job_response ?tags:(tags_ : tag_list option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?compute_spec:(compute_spec_ : ai_recommendation_compute_spec option)
    ?recommendations:(recommendations_ : ai_recommendation_list option)
    ?performance_target:(performance_target_ : ai_recommendation_performance_target option)
    ?optimize_model:(optimize_model_ : ai_recommendation_allow_optimization option)
    ?inference_specification:
      (inference_specification_ : ai_recommendation_inference_specification option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ~creation_time:(creation_time_ : timestamp) ~role_arn:(role_arn_ : role_arn)
    ~ai_workload_config_identifier:(ai_workload_config_identifier_ : ai_resource_identifier)
    ~output_config:(output_config_ : ai_recommendation_output_result)
    ~model_source:(model_source_ : ai_model_source)
    ~ai_recommendation_job_status:(ai_recommendation_job_status_ : ai_recommendation_job_status)
    ~ai_recommendation_job_arn:(ai_recommendation_job_arn_ : ai_recommendation_job_arn)
    ~ai_recommendation_job_name:(ai_recommendation_job_name_ : ai_entity_name) () =
  ({
     tags = tags_;
     end_time = end_time_;
     start_time = start_time_;
     creation_time = creation_time_;
     compute_spec = compute_spec_;
     role_arn = role_arn_;
     recommendations = recommendations_;
     performance_target = performance_target_;
     optimize_model = optimize_model_;
     ai_workload_config_identifier = ai_workload_config_identifier_;
     inference_specification = inference_specification_;
     output_config = output_config_;
     model_source = model_source_;
     failure_reason = failure_reason_;
     ai_recommendation_job_status = ai_recommendation_job_status_;
     ai_recommendation_job_arn = ai_recommendation_job_arn_;
     ai_recommendation_job_name = ai_recommendation_job_name_;
   }
    : describe_ai_recommendation_job_response)

let make_describe_ai_recommendation_job_request
    ~ai_recommendation_job_name:(ai_recommendation_job_name_ : ai_entity_name) () =
  ({ ai_recommendation_job_name = ai_recommendation_job_name_ }
    : describe_ai_recommendation_job_request)

let make_ai_benchmark_inference_component ~identifier:(identifier_ : ai_resource_identifier) () =
  ({ identifier = identifier_ } : ai_benchmark_inference_component)

let make_ai_benchmark_endpoint
    ?inference_components:(inference_components_ : ai_benchmark_inference_component_list option)
    ?target_container_hostname:(target_container_hostname_ : string_ option)
    ~identifier:(identifier_ : ai_resource_identifier) () =
  ({
     inference_components = inference_components_;
     target_container_hostname = target_container_hostname_;
     identifier = identifier_;
   }
    : ai_benchmark_endpoint)

let make_ai_cloud_watch_logs ?log_stream_name:(log_stream_name_ : string_ option)
    ?log_group_arn:(log_group_arn_ : string_ option) () =
  ({ log_stream_name = log_stream_name_; log_group_arn = log_group_arn_ } : ai_cloud_watch_logs)

let make_ai_benchmark_network_config ?vpc_config:(vpc_config_ : vpc_config option) () =
  ({ vpc_config = vpc_config_ } : ai_benchmark_network_config)

let make_describe_ai_benchmark_job_response ?tags:(tags_ : tag_list option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?network_config:(network_config_ : ai_benchmark_network_config option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ~creation_time:(creation_time_ : timestamp) ~role_arn:(role_arn_ : role_arn)
    ~ai_workload_config_identifier:(ai_workload_config_identifier_ : ai_resource_identifier)
    ~output_config:(output_config_ : ai_benchmark_output_result)
    ~benchmark_target:(benchmark_target_ : ai_benchmark_target)
    ~ai_benchmark_job_status:(ai_benchmark_job_status_ : ai_benchmark_job_status)
    ~ai_benchmark_job_arn:(ai_benchmark_job_arn_ : ai_benchmark_job_arn)
    ~ai_benchmark_job_name:(ai_benchmark_job_name_ : ai_entity_name) () =
  ({
     tags = tags_;
     end_time = end_time_;
     start_time = start_time_;
     creation_time = creation_time_;
     network_config = network_config_;
     role_arn = role_arn_;
     ai_workload_config_identifier = ai_workload_config_identifier_;
     output_config = output_config_;
     benchmark_target = benchmark_target_;
     failure_reason = failure_reason_;
     ai_benchmark_job_status = ai_benchmark_job_status_;
     ai_benchmark_job_arn = ai_benchmark_job_arn_;
     ai_benchmark_job_name = ai_benchmark_job_name_;
   }
    : describe_ai_benchmark_job_response)

let make_describe_ai_benchmark_job_request
    ~ai_benchmark_job_name:(ai_benchmark_job_name_ : ai_entity_name) () =
  ({ ai_benchmark_job_name = ai_benchmark_job_name_ } : describe_ai_benchmark_job_request)

let make_describe_action_response ?lineage_group_arn:(lineage_group_arn_ : lineage_group_arn option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?creation_time:(creation_time_ : timestamp option)
    ?properties:(properties_ : lineage_entity_parameters option)
    ?status:(status_ : action_status option)
    ?description:(description_ : experiment_description option)
    ?action_type:(action_type_ : string256 option) ?source:(source_ : action_source option)
    ?action_arn:(action_arn_ : action_arn option)
    ?action_name:(action_name_ : experiment_entity_name_or_arn option) () =
  ({
     lineage_group_arn = lineage_group_arn_;
     metadata_properties = metadata_properties_;
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     created_by = created_by_;
     creation_time = creation_time_;
     properties = properties_;
     status = status_;
     description = description_;
     action_type = action_type_;
     source = source_;
     action_arn = action_arn_;
     action_name = action_name_;
   }
    : describe_action_response)

let make_describe_action_request ~action_name:(action_name_ : experiment_entity_name_or_arn) () =
  ({ action_name = action_name_ } : describe_action_request)

let make_deregister_devices_request ~device_names:(device_names_ : device_names)
    ~device_fleet_name:(device_fleet_name_ : entity_name) () =
  ({ device_names = device_names_; device_fleet_name = device_fleet_name_ }
    : deregister_devices_request)

let make_delete_workteam_response ~success:(success_ : success) () =
  ({ success = success_ } : delete_workteam_response)

let make_delete_workteam_request ~workteam_name:(workteam_name_ : workteam_name) () =
  ({ workteam_name = workteam_name_ } : delete_workteam_request)

let make_delete_workforce_response () = (() : unit)

let make_delete_workforce_request ~workforce_name:(workforce_name_ : workforce_name) () =
  ({ workforce_name = workforce_name_ } : delete_workforce_request)

let make_delete_user_profile_request ~user_profile_name:(user_profile_name_ : user_profile_name)
    ~domain_id:(domain_id_ : domain_id) () =
  ({ user_profile_name = user_profile_name_; domain_id = domain_id_ } : delete_user_profile_request)

let make_delete_trial_component_response
    ?trial_component_arn:(trial_component_arn_ : trial_component_arn option) () =
  ({ trial_component_arn = trial_component_arn_ } : delete_trial_component_response)

let make_delete_trial_component_request
    ~trial_component_name:(trial_component_name_ : experiment_entity_name) () =
  ({ trial_component_name = trial_component_name_ } : delete_trial_component_request)

let make_delete_trial_response ?trial_arn:(trial_arn_ : trial_arn option) () =
  ({ trial_arn = trial_arn_ } : delete_trial_response)

let make_delete_trial_request ~trial_name:(trial_name_ : experiment_entity_name) () =
  ({ trial_name = trial_name_ } : delete_trial_request)

let make_delete_training_job_request ~training_job_name:(training_job_name_ : training_job_name) ()
    =
  ({ training_job_name = training_job_name_ } : delete_training_job_request)

let make_delete_tags_output () = (() : unit)

let make_delete_tags_input ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : delete_tags_input)

let make_delete_studio_lifecycle_config_request
    ~studio_lifecycle_config_name:(studio_lifecycle_config_name_ : studio_lifecycle_config_name) ()
    =
  ({ studio_lifecycle_config_name = studio_lifecycle_config_name_ }
    : delete_studio_lifecycle_config_request)

let make_delete_space_request ~space_name:(space_name_ : space_name)
    ~domain_id:(domain_id_ : domain_id) () =
  ({ space_name = space_name_; domain_id = domain_id_ } : delete_space_request)

let make_delete_project_input ~project_name:(project_name_ : project_entity_name) () =
  ({ project_name = project_name_ } : delete_project_input)

let make_delete_processing_job_request
    ~processing_job_name:(processing_job_name_ : processing_job_name) () =
  ({ processing_job_name = processing_job_name_ } : delete_processing_job_request)

let make_delete_pipeline_response ?pipeline_arn:(pipeline_arn_ : pipeline_arn option) () =
  ({ pipeline_arn = pipeline_arn_ } : delete_pipeline_response)

let make_delete_pipeline_request ~client_request_token:(client_request_token_ : idempotency_token)
    ~pipeline_name:(pipeline_name_ : pipeline_name) () =
  ({ client_request_token = client_request_token_; pipeline_name = pipeline_name_ }
    : delete_pipeline_request)

let make_delete_partner_app_response ?arn:(arn_ : partner_app_arn option) () =
  ({ arn = arn_ } : delete_partner_app_response)

let make_delete_partner_app_request ?client_token:(client_token_ : client_token option)
    ~arn:(arn_ : partner_app_arn) () =
  ({ client_token = client_token_; arn = arn_ } : delete_partner_app_request)

let make_delete_optimization_job_request
    ~optimization_job_name:(optimization_job_name_ : entity_name) () =
  ({ optimization_job_name = optimization_job_name_ } : delete_optimization_job_request)

let make_delete_notebook_instance_lifecycle_config_input
    ~notebook_instance_lifecycle_config_name:
      (notebook_instance_lifecycle_config_name_ : notebook_instance_lifecycle_config_name) () =
  ({ notebook_instance_lifecycle_config_name = notebook_instance_lifecycle_config_name_ }
    : delete_notebook_instance_lifecycle_config_input)

let make_delete_notebook_instance_input
    ~notebook_instance_name:(notebook_instance_name_ : notebook_instance_name) () =
  ({ notebook_instance_name = notebook_instance_name_ } : delete_notebook_instance_input)

let make_delete_monitoring_schedule_request
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name) () =
  ({ monitoring_schedule_name = monitoring_schedule_name_ } : delete_monitoring_schedule_request)

let make_delete_model_quality_job_definition_request
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name) () =
  ({ job_definition_name = job_definition_name_ } : delete_model_quality_job_definition_request)

let make_delete_model_package_group_policy_input
    ~model_package_group_name:(model_package_group_name_ : entity_name) () =
  ({ model_package_group_name = model_package_group_name_ }
    : delete_model_package_group_policy_input)

let make_delete_model_package_group_input
    ~model_package_group_name:(model_package_group_name_ : arn_or_name) () =
  ({ model_package_group_name = model_package_group_name_ } : delete_model_package_group_input)

let make_delete_model_package_input
    ~model_package_name:(model_package_name_ : versioned_arn_or_name) () =
  ({ model_package_name = model_package_name_ } : delete_model_package_input)

let make_delete_model_explainability_job_definition_request
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name) () =
  ({ job_definition_name = job_definition_name_ }
    : delete_model_explainability_job_definition_request)

let make_delete_model_card_request ~model_card_name:(model_card_name_ : entity_name) () =
  ({ model_card_name = model_card_name_ } : delete_model_card_request)

let make_delete_model_bias_job_definition_request
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name) () =
  ({ job_definition_name = job_definition_name_ } : delete_model_bias_job_definition_request)

let make_delete_model_input ~model_name:(model_name_ : model_name) () =
  ({ model_name = model_name_ } : delete_model_input)

let make_delete_mlflow_tracking_server_response
    ?tracking_server_arn:(tracking_server_arn_ : tracking_server_arn option) () =
  ({ tracking_server_arn = tracking_server_arn_ } : delete_mlflow_tracking_server_response)

let make_delete_mlflow_tracking_server_request
    ~tracking_server_name:(tracking_server_name_ : tracking_server_name) () =
  ({ tracking_server_name = tracking_server_name_ } : delete_mlflow_tracking_server_request)

let make_delete_mlflow_app_response ?arn:(arn_ : mlflow_app_arn option) () =
  ({ arn = arn_ } : delete_mlflow_app_response)

let make_delete_mlflow_app_request ~arn:(arn_ : mlflow_app_arn) () =
  ({ arn = arn_ } : delete_mlflow_app_request)

let make_delete_job_response () = (() : unit)

let make_delete_job_request ~job_category:(job_category_ : job_category)
    ~job_name:(job_name_ : job_name) () =
  ({ job_category = job_category_; job_name = job_name_ } : delete_job_request)

let make_delete_inference_experiment_response
    ~inference_experiment_arn:(inference_experiment_arn_ : inference_experiment_arn) () =
  ({ inference_experiment_arn = inference_experiment_arn_ } : delete_inference_experiment_response)

let make_delete_inference_experiment_request ~name:(name_ : inference_experiment_name) () =
  ({ name = name_ } : delete_inference_experiment_request)

let make_delete_inference_component_input
    ~inference_component_name:(inference_component_name_ : inference_component_name) () =
  ({ inference_component_name = inference_component_name_ } : delete_inference_component_input)

let make_delete_image_version_response () = (() : unit)

let make_delete_image_version_request ?alias:(alias_ : sage_maker_image_version_alias option)
    ?version:(version_ : image_version_number option) ~image_name:(image_name_ : image_name) () =
  ({ alias = alias_; version = version_; image_name = image_name_ } : delete_image_version_request)

let make_delete_image_response () = (() : unit)

let make_delete_image_request ~image_name:(image_name_ : image_name) () =
  ({ image_name = image_name_ } : delete_image_request)

let make_delete_hyper_parameter_tuning_job_request
    ~hyper_parameter_tuning_job_name:
      (hyper_parameter_tuning_job_name_ : hyper_parameter_tuning_job_name) () =
  ({ hyper_parameter_tuning_job_name = hyper_parameter_tuning_job_name_ }
    : delete_hyper_parameter_tuning_job_request)

let make_delete_human_task_ui_response () = (() : unit)

let make_delete_human_task_ui_request ~human_task_ui_name:(human_task_ui_name_ : human_task_ui_name)
    () =
  ({ human_task_ui_name = human_task_ui_name_ } : delete_human_task_ui_request)

let make_delete_hub_content_reference_request
    ~hub_content_name:(hub_content_name_ : hub_content_name)
    ~hub_content_type:(hub_content_type_ : hub_content_type) ~hub_name:(hub_name_ : hub_name_or_arn)
    () =
  ({
     hub_content_name = hub_content_name_;
     hub_content_type = hub_content_type_;
     hub_name = hub_name_;
   }
    : delete_hub_content_reference_request)

let make_delete_hub_content_request
    ~hub_content_version:(hub_content_version_ : hub_content_version)
    ~hub_content_name:(hub_content_name_ : hub_content_name)
    ~hub_content_type:(hub_content_type_ : hub_content_type) ~hub_name:(hub_name_ : hub_name_or_arn)
    () =
  ({
     hub_content_version = hub_content_version_;
     hub_content_name = hub_content_name_;
     hub_content_type = hub_content_type_;
     hub_name = hub_name_;
   }
    : delete_hub_content_request)

let make_delete_hub_request ~hub_name:(hub_name_ : hub_name_or_arn) () =
  ({ hub_name = hub_name_ } : delete_hub_request)

let make_delete_flow_definition_response () = (() : unit)

let make_delete_flow_definition_request
    ~flow_definition_name:(flow_definition_name_ : flow_definition_name) () =
  ({ flow_definition_name = flow_definition_name_ } : delete_flow_definition_request)

let make_delete_feature_group_request ~feature_group_name:(feature_group_name_ : feature_group_name)
    () =
  ({ feature_group_name = feature_group_name_ } : delete_feature_group_request)

let make_delete_experiment_response ?experiment_arn:(experiment_arn_ : experiment_arn option) () =
  ({ experiment_arn = experiment_arn_ } : delete_experiment_response)

let make_delete_experiment_request ~experiment_name:(experiment_name_ : experiment_entity_name) () =
  ({ experiment_name = experiment_name_ } : delete_experiment_request)

let make_delete_endpoint_config_input
    ~endpoint_config_name:(endpoint_config_name_ : endpoint_config_name) () =
  ({ endpoint_config_name = endpoint_config_name_ } : delete_endpoint_config_input)

let make_delete_endpoint_input ~endpoint_name:(endpoint_name_ : endpoint_name) () =
  ({ endpoint_name = endpoint_name_ } : delete_endpoint_input)

let make_delete_edge_deployment_stage_request ~stage_name:(stage_name_ : entity_name)
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name) () =
  ({ stage_name = stage_name_; edge_deployment_plan_name = edge_deployment_plan_name_ }
    : delete_edge_deployment_stage_request)

let make_delete_edge_deployment_plan_request
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name) () =
  ({ edge_deployment_plan_name = edge_deployment_plan_name_ } : delete_edge_deployment_plan_request)

let make_retention_policy ?home_efs_file_system:(home_efs_file_system_ : retention_type option) () =
  ({ home_efs_file_system = home_efs_file_system_ } : retention_policy)

let make_delete_domain_request ?retention_policy:(retention_policy_ : retention_policy option)
    ~domain_id:(domain_id_ : domain_id) () =
  ({ retention_policy = retention_policy_; domain_id = domain_id_ } : delete_domain_request)

let make_delete_device_fleet_request ~device_fleet_name:(device_fleet_name_ : entity_name) () =
  ({ device_fleet_name = device_fleet_name_ } : delete_device_fleet_request)

let make_delete_data_quality_job_definition_request
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name) () =
  ({ job_definition_name = job_definition_name_ } : delete_data_quality_job_definition_request)

let make_delete_context_response ?context_arn:(context_arn_ : context_arn option) () =
  ({ context_arn = context_arn_ } : delete_context_response)

let make_delete_context_request ~context_name:(context_name_ : context_name) () =
  ({ context_name = context_name_ } : delete_context_request)

let make_delete_compute_quota_request ~compute_quota_id:(compute_quota_id_ : compute_quota_id) () =
  ({ compute_quota_id = compute_quota_id_ } : delete_compute_quota_request)

let make_delete_compilation_job_request ~compilation_job_name:(compilation_job_name_ : entity_name)
    () =
  ({ compilation_job_name = compilation_job_name_ } : delete_compilation_job_request)

let make_delete_code_repository_input ~code_repository_name:(code_repository_name_ : entity_name) ()
    =
  ({ code_repository_name = code_repository_name_ } : delete_code_repository_input)

let make_delete_cluster_scheduler_config_request
    ~cluster_scheduler_config_id:(cluster_scheduler_config_id_ : cluster_scheduler_config_id) () =
  ({ cluster_scheduler_config_id = cluster_scheduler_config_id_ }
    : delete_cluster_scheduler_config_request)

let make_delete_cluster_response ~cluster_arn:(cluster_arn_ : cluster_arn) () =
  ({ cluster_arn = cluster_arn_ } : delete_cluster_response)

let make_delete_cluster_request ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({ cluster_name = cluster_name_ } : delete_cluster_request)

let make_delete_association_response
    ?destination_arn:(destination_arn_ : association_entity_arn option)
    ?source_arn:(source_arn_ : association_entity_arn option) () =
  ({ destination_arn = destination_arn_; source_arn = source_arn_ } : delete_association_response)

let make_delete_association_request ~destination_arn:(destination_arn_ : association_entity_arn)
    ~source_arn:(source_arn_ : association_entity_arn) () =
  ({ destination_arn = destination_arn_; source_arn = source_arn_ } : delete_association_request)

let make_delete_artifact_response ?artifact_arn:(artifact_arn_ : artifact_arn option) () =
  ({ artifact_arn = artifact_arn_ } : delete_artifact_response)

let make_delete_artifact_request ?source:(source_ : artifact_source option)
    ?artifact_arn:(artifact_arn_ : artifact_arn option) () =
  ({ source = source_; artifact_arn = artifact_arn_ } : delete_artifact_request)

let make_delete_app_image_config_request
    ~app_image_config_name:(app_image_config_name_ : app_image_config_name) () =
  ({ app_image_config_name = app_image_config_name_ } : delete_app_image_config_request)

let make_delete_app_request ?space_name:(space_name_ : space_name option)
    ?user_profile_name:(user_profile_name_ : user_profile_name option)
    ~app_name:(app_name_ : app_name) ~app_type:(app_type_ : app_type)
    ~domain_id:(domain_id_ : domain_id) () =
  ({
     app_name = app_name_;
     app_type = app_type_;
     space_name = space_name_;
     user_profile_name = user_profile_name_;
     domain_id = domain_id_;
   }
    : delete_app_request)

let make_delete_algorithm_input ~algorithm_name:(algorithm_name_ : entity_name) () =
  ({ algorithm_name = algorithm_name_ } : delete_algorithm_input)

let make_delete_ai_workload_config_response
    ?ai_workload_config_arn:(ai_workload_config_arn_ : ai_workload_config_arn option) () =
  ({ ai_workload_config_arn = ai_workload_config_arn_ } : delete_ai_workload_config_response)

let make_delete_ai_workload_config_request
    ~ai_workload_config_name:(ai_workload_config_name_ : ai_entity_name) () =
  ({ ai_workload_config_name = ai_workload_config_name_ } : delete_ai_workload_config_request)

let make_delete_ai_recommendation_job_response
    ?ai_recommendation_job_arn:(ai_recommendation_job_arn_ : ai_recommendation_job_arn option) () =
  ({ ai_recommendation_job_arn = ai_recommendation_job_arn_ }
    : delete_ai_recommendation_job_response)

let make_delete_ai_recommendation_job_request
    ~ai_recommendation_job_name:(ai_recommendation_job_name_ : ai_entity_name) () =
  ({ ai_recommendation_job_name = ai_recommendation_job_name_ }
    : delete_ai_recommendation_job_request)

let make_delete_ai_benchmark_job_response
    ?ai_benchmark_job_arn:(ai_benchmark_job_arn_ : ai_benchmark_job_arn option) () =
  ({ ai_benchmark_job_arn = ai_benchmark_job_arn_ } : delete_ai_benchmark_job_response)

let make_delete_ai_benchmark_job_request
    ~ai_benchmark_job_name:(ai_benchmark_job_name_ : ai_entity_name) () =
  ({ ai_benchmark_job_name = ai_benchmark_job_name_ } : delete_ai_benchmark_job_request)

let make_delete_action_response ?action_arn:(action_arn_ : action_arn option) () =
  ({ action_arn = action_arn_ } : delete_action_response)

let make_delete_action_request ~action_name:(action_name_ : experiment_entity_name) () =
  ({ action_name = action_name_ } : delete_action_request)

let make_create_workteam_response ?workteam_arn:(workteam_arn_ : workteam_arn option) () =
  ({ workteam_arn = workteam_arn_ } : create_workteam_response)

let make_create_workteam_request ?tags:(tags_ : tag_list option)
    ?worker_access_configuration:(worker_access_configuration_ : worker_access_configuration option)
    ?notification_configuration:(notification_configuration_ : notification_configuration option)
    ?workforce_name:(workforce_name_ : workforce_name option)
    ~description:(description_ : string200)
    ~member_definitions:(member_definitions_ : member_definitions)
    ~workteam_name:(workteam_name_ : workteam_name) () =
  ({
     tags = tags_;
     worker_access_configuration = worker_access_configuration_;
     notification_configuration = notification_configuration_;
     description = description_;
     member_definitions = member_definitions_;
     workforce_name = workforce_name_;
     workteam_name = workteam_name_;
   }
    : create_workteam_request)

let make_create_workforce_response ~workforce_arn:(workforce_arn_ : workforce_arn) () =
  ({ workforce_arn = workforce_arn_ } : create_workforce_response)

let make_create_workforce_request
    ?ip_address_type:(ip_address_type_ : workforce_ip_address_type option)
    ?workforce_vpc_config:(workforce_vpc_config_ : workforce_vpc_config_request option)
    ?tags:(tags_ : tag_list option) ?source_ip_config:(source_ip_config_ : source_ip_config option)
    ?oidc_config:(oidc_config_ : oidc_config option)
    ?cognito_config:(cognito_config_ : cognito_config option)
    ~workforce_name:(workforce_name_ : workforce_name) () =
  ({
     ip_address_type = ip_address_type_;
     workforce_vpc_config = workforce_vpc_config_;
     tags = tags_;
     workforce_name = workforce_name_;
     source_ip_config = source_ip_config_;
     oidc_config = oidc_config_;
     cognito_config = cognito_config_;
   }
    : create_workforce_request)

let make_create_user_profile_response
    ?user_profile_arn:(user_profile_arn_ : user_profile_arn option) () =
  ({ user_profile_arn = user_profile_arn_ } : create_user_profile_response)

let make_create_user_profile_request ?user_settings:(user_settings_ : user_settings option)
    ?tags:(tags_ : tag_list option)
    ?single_sign_on_user_value:(single_sign_on_user_value_ : string256 option)
    ?single_sign_on_user_identifier:
      (single_sign_on_user_identifier_ : single_sign_on_user_identifier option)
    ~user_profile_name:(user_profile_name_ : user_profile_name) ~domain_id:(domain_id_ : domain_id)
    () =
  ({
     user_settings = user_settings_;
     tags = tags_;
     single_sign_on_user_value = single_sign_on_user_value_;
     single_sign_on_user_identifier = single_sign_on_user_identifier_;
     user_profile_name = user_profile_name_;
     domain_id = domain_id_;
   }
    : create_user_profile_request)

let make_create_trial_component_response
    ?trial_component_arn:(trial_component_arn_ : trial_component_arn option) () =
  ({ trial_component_arn = trial_component_arn_ } : create_trial_component_response)

let make_create_trial_component_request ?tags:(tags_ : tag_list option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?output_artifacts:(output_artifacts_ : trial_component_artifacts option)
    ?input_artifacts:(input_artifacts_ : trial_component_artifacts option)
    ?parameters:(parameters_ : trial_component_parameters option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?status:(status_ : trial_component_status option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ~trial_component_name:(trial_component_name_ : experiment_entity_name) () =
  ({
     tags = tags_;
     metadata_properties = metadata_properties_;
     output_artifacts = output_artifacts_;
     input_artifacts = input_artifacts_;
     parameters = parameters_;
     end_time = end_time_;
     start_time = start_time_;
     status = status_;
     display_name = display_name_;
     trial_component_name = trial_component_name_;
   }
    : create_trial_component_request)

let make_create_trial_response ?trial_arn:(trial_arn_ : trial_arn option) () =
  ({ trial_arn = trial_arn_ } : create_trial_response)

let make_create_trial_request ?tags:(tags_ : tag_list option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ~experiment_name:(experiment_name_ : experiment_entity_name)
    ~trial_name:(trial_name_ : experiment_entity_name) () =
  ({
     tags = tags_;
     metadata_properties = metadata_properties_;
     experiment_name = experiment_name_;
     display_name = display_name_;
     trial_name = trial_name_;
   }
    : create_trial_request)

let make_create_transform_job_response ~transform_job_arn:(transform_job_arn_ : transform_job_arn)
    () =
  ({ transform_job_arn = transform_job_arn_ } : create_transform_job_response)

let make_create_transform_job_request
    ?experiment_config:(experiment_config_ : experiment_config option)
    ?tags:(tags_ : tag_list option) ?data_processing:(data_processing_ : data_processing option)
    ?data_capture_config:(data_capture_config_ : batch_data_capture_config option)
    ?environment:(environment_ : transform_environment_map option)
    ?batch_strategy:(batch_strategy_ : batch_strategy option)
    ?max_payload_in_m_b:(max_payload_in_m_b_ : max_payload_in_m_b option)
    ?model_client_config:(model_client_config_ : model_client_config option)
    ?max_concurrent_transforms:(max_concurrent_transforms_ : max_concurrent_transforms option)
    ~transform_resources:(transform_resources_ : transform_resources)
    ~transform_output:(transform_output_ : transform_output)
    ~transform_input:(transform_input_ : transform_input) ~model_name:(model_name_ : model_name)
    ~transform_job_name:(transform_job_name_ : transform_job_name) () =
  ({
     experiment_config = experiment_config_;
     tags = tags_;
     data_processing = data_processing_;
     transform_resources = transform_resources_;
     data_capture_config = data_capture_config_;
     transform_output = transform_output_;
     transform_input = transform_input_;
     environment = environment_;
     batch_strategy = batch_strategy_;
     max_payload_in_m_b = max_payload_in_m_b_;
     model_client_config = model_client_config_;
     max_concurrent_transforms = max_concurrent_transforms_;
     model_name = model_name_;
     transform_job_name = transform_job_name_;
   }
    : create_transform_job_request)

let make_create_training_plan_response ~training_plan_arn:(training_plan_arn_ : training_plan_arn)
    () =
  ({ training_plan_arn = training_plan_arn_ } : create_training_plan_response)

let make_create_training_plan_request ?tags:(tags_ : tag_list option)
    ?spare_instance_count_per_ultra_server:
      (spare_instance_count_per_ultra_server_ : spare_instance_count_per_ultra_server option)
    ~training_plan_offering_id:(training_plan_offering_id_ : training_plan_offering_id)
    ~training_plan_name:(training_plan_name_ : training_plan_name) () =
  ({
     tags = tags_;
     spare_instance_count_per_ultra_server = spare_instance_count_per_ultra_server_;
     training_plan_offering_id = training_plan_offering_id_;
     training_plan_name = training_plan_name_;
   }
    : create_training_plan_request)

let make_create_training_job_response ~training_job_arn:(training_job_arn_ : training_job_arn) () =
  ({ training_job_arn = training_job_arn_ } : create_training_job_response)

let make_create_training_job_request
    ?model_package_config:(model_package_config_ : model_package_config option)
    ?mlflow_config:(mlflow_config_ : mlflow_config option)
    ?serverless_job_config:(serverless_job_config_ : serverless_job_config option)
    ?session_chaining_config:(session_chaining_config_ : session_chaining_config option)
    ?infra_check_config:(infra_check_config_ : infra_check_config option)
    ?remote_debug_config:(remote_debug_config_ : remote_debug_config option)
    ?retry_strategy:(retry_strategy_ : retry_strategy option)
    ?environment:(environment_ : training_environment_map option)
    ?profiler_rule_configurations:
      (profiler_rule_configurations_ : profiler_rule_configurations option)
    ?profiler_config:(profiler_config_ : profiler_config option)
    ?experiment_config:(experiment_config_ : experiment_config option)
    ?tensor_board_output_config:(tensor_board_output_config_ : tensor_board_output_config option)
    ?debug_rule_configurations:(debug_rule_configurations_ : debug_rule_configurations option)
    ?debug_hook_config:(debug_hook_config_ : debug_hook_config option)
    ?checkpoint_config:(checkpoint_config_ : checkpoint_config option)
    ?enable_managed_spot_training:(enable_managed_spot_training_ : boolean_ option)
    ?enable_inter_container_traffic_encryption:
      (enable_inter_container_traffic_encryption_ : boolean_ option)
    ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ?tags:(tags_ : tag_list option)
    ?stopping_condition:(stopping_condition_ : stopping_condition option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?resource_config:(resource_config_ : resource_config option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?algorithm_specification:(algorithm_specification_ : algorithm_specification option)
    ?hyper_parameters:(hyper_parameters_ : hyper_parameters option)
    ~output_data_config:(output_data_config_ : output_data_config) ~role_arn:(role_arn_ : role_arn)
    ~training_job_name:(training_job_name_ : training_job_name) () =
  ({
     model_package_config = model_package_config_;
     mlflow_config = mlflow_config_;
     serverless_job_config = serverless_job_config_;
     session_chaining_config = session_chaining_config_;
     infra_check_config = infra_check_config_;
     remote_debug_config = remote_debug_config_;
     retry_strategy = retry_strategy_;
     environment = environment_;
     profiler_rule_configurations = profiler_rule_configurations_;
     profiler_config = profiler_config_;
     experiment_config = experiment_config_;
     tensor_board_output_config = tensor_board_output_config_;
     debug_rule_configurations = debug_rule_configurations_;
     debug_hook_config = debug_hook_config_;
     checkpoint_config = checkpoint_config_;
     enable_managed_spot_training = enable_managed_spot_training_;
     enable_inter_container_traffic_encryption = enable_inter_container_traffic_encryption_;
     enable_network_isolation = enable_network_isolation_;
     tags = tags_;
     stopping_condition = stopping_condition_;
     vpc_config = vpc_config_;
     resource_config = resource_config_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     role_arn = role_arn_;
     algorithm_specification = algorithm_specification_;
     hyper_parameters = hyper_parameters_;
     training_job_name = training_job_name_;
   }
    : create_training_job_request)

let make_create_studio_lifecycle_config_response
    ?studio_lifecycle_config_arn:(studio_lifecycle_config_arn_ : studio_lifecycle_config_arn option)
    () =
  ({ studio_lifecycle_config_arn = studio_lifecycle_config_arn_ }
    : create_studio_lifecycle_config_response)

let make_create_studio_lifecycle_config_request ?tags:(tags_ : tag_list option)
    ~studio_lifecycle_config_app_type:
      (studio_lifecycle_config_app_type_ : studio_lifecycle_config_app_type)
    ~studio_lifecycle_config_content:
      (studio_lifecycle_config_content_ : studio_lifecycle_config_content)
    ~studio_lifecycle_config_name:(studio_lifecycle_config_name_ : studio_lifecycle_config_name) ()
    =
  ({
     tags = tags_;
     studio_lifecycle_config_app_type = studio_lifecycle_config_app_type_;
     studio_lifecycle_config_content = studio_lifecycle_config_content_;
     studio_lifecycle_config_name = studio_lifecycle_config_name_;
   }
    : create_studio_lifecycle_config_request)

let make_create_space_response ?space_arn:(space_arn_ : space_arn option) () =
  ({ space_arn = space_arn_ } : create_space_response)

let make_create_space_request ?space_display_name:(space_display_name_ : non_empty_string64 option)
    ?space_sharing_settings:(space_sharing_settings_ : space_sharing_settings option)
    ?ownership_settings:(ownership_settings_ : ownership_settings option)
    ?space_settings:(space_settings_ : space_settings option) ?tags:(tags_ : tag_list option)
    ~space_name:(space_name_ : space_name) ~domain_id:(domain_id_ : domain_id) () =
  ({
     space_display_name = space_display_name_;
     space_sharing_settings = space_sharing_settings_;
     ownership_settings = ownership_settings_;
     space_settings = space_settings_;
     tags = tags_;
     space_name = space_name_;
     domain_id = domain_id_;
   }
    : create_space_request)

let make_create_project_output ~project_id:(project_id_ : project_id)
    ~project_arn:(project_arn_ : project_arn) () =
  ({ project_id = project_id_; project_arn = project_arn_ } : create_project_output)

let make_cfn_stack_create_parameter ?value:(value_ : cfn_stack_parameter_value option)
    ~key:(key_ : cfn_stack_parameter_key) () =
  ({ value = value_; key = key_ } : cfn_stack_create_parameter)

let make_cfn_create_template_provider ?parameters:(parameters_ : cfn_stack_create_parameters option)
    ?role_ar_n:(role_ar_n_ : role_arn option) ~template_ur_l:(template_ur_l_ : cfn_template_ur_l)
    ~template_name:(template_name_ : cfn_template_name) () =
  ({
     parameters = parameters_;
     role_ar_n = role_ar_n_;
     template_ur_l = template_ur_l_;
     template_name = template_name_;
   }
    : cfn_create_template_provider)

let make_create_template_provider
    ?cfn_template_provider:(cfn_template_provider_ : cfn_create_template_provider option) () =
  ({ cfn_template_provider = cfn_template_provider_ } : create_template_provider)

let make_create_project_input
    ?template_providers:(template_providers_ : create_template_provider_list option)
    ?tags:(tags_ : tag_list option)
    ?service_catalog_provisioning_details:
      (service_catalog_provisioning_details_ : service_catalog_provisioning_details option)
    ?project_description:(project_description_ : entity_description option)
    ~project_name:(project_name_ : project_entity_name) () =
  ({
     template_providers = template_providers_;
     tags = tags_;
     service_catalog_provisioning_details = service_catalog_provisioning_details_;
     project_description = project_description_;
     project_name = project_name_;
   }
    : create_project_input)

let make_create_processing_job_response
    ~processing_job_arn:(processing_job_arn_ : processing_job_arn) () =
  ({ processing_job_arn = processing_job_arn_ } : create_processing_job_response)

let make_create_processing_job_request
    ?experiment_config:(experiment_config_ : experiment_config option)
    ?tags:(tags_ : tag_list option) ?network_config:(network_config_ : network_config option)
    ?environment:(environment_ : processing_environment_map option)
    ?stopping_condition:(stopping_condition_ : processing_stopping_condition option)
    ?processing_output_config:(processing_output_config_ : processing_output_config option)
    ?processing_inputs:(processing_inputs_ : processing_inputs option)
    ~role_arn:(role_arn_ : role_arn) ~app_specification:(app_specification_ : app_specification)
    ~processing_resources:(processing_resources_ : processing_resources)
    ~processing_job_name:(processing_job_name_ : processing_job_name) () =
  ({
     experiment_config = experiment_config_;
     tags = tags_;
     role_arn = role_arn_;
     network_config = network_config_;
     environment = environment_;
     app_specification = app_specification_;
     stopping_condition = stopping_condition_;
     processing_resources = processing_resources_;
     processing_job_name = processing_job_name_;
     processing_output_config = processing_output_config_;
     processing_inputs = processing_inputs_;
   }
    : create_processing_job_request)

let make_create_presigned_notebook_instance_url_output
    ?authorized_url:(authorized_url_ : notebook_instance_url option) () =
  ({ authorized_url = authorized_url_ } : create_presigned_notebook_instance_url_output)

let make_create_presigned_notebook_instance_url_input
    ?session_expiration_duration_in_seconds:
      (session_expiration_duration_in_seconds_ : session_expiration_duration_in_seconds option)
    ~notebook_instance_name:(notebook_instance_name_ : notebook_instance_name) () =
  ({
     session_expiration_duration_in_seconds = session_expiration_duration_in_seconds_;
     notebook_instance_name = notebook_instance_name_;
   }
    : create_presigned_notebook_instance_url_input)

let make_create_presigned_mlflow_tracking_server_url_response
    ?authorized_url:(authorized_url_ : tracking_server_url option) () =
  ({ authorized_url = authorized_url_ } : create_presigned_mlflow_tracking_server_url_response)

let make_create_presigned_mlflow_tracking_server_url_request
    ?session_expiration_duration_in_seconds:
      (session_expiration_duration_in_seconds_ : session_expiration_duration_in_seconds option)
    ?expires_in_seconds:(expires_in_seconds_ : expires_in_seconds option)
    ~tracking_server_name:(tracking_server_name_ : tracking_server_name) () =
  ({
     session_expiration_duration_in_seconds = session_expiration_duration_in_seconds_;
     expires_in_seconds = expires_in_seconds_;
     tracking_server_name = tracking_server_name_;
   }
    : create_presigned_mlflow_tracking_server_url_request)

let make_create_presigned_mlflow_app_url_response
    ?authorized_url:(authorized_url_ : mlflow_app_url option) () =
  ({ authorized_url = authorized_url_ } : create_presigned_mlflow_app_url_response)

let make_create_presigned_mlflow_app_url_request
    ?session_expiration_duration_in_seconds:
      (session_expiration_duration_in_seconds_ : session_expiration_duration_in_seconds option)
    ?expires_in_seconds:(expires_in_seconds_ : expires_in_seconds option)
    ~arn:(arn_ : mlflow_app_arn) () =
  ({
     session_expiration_duration_in_seconds = session_expiration_duration_in_seconds_;
     expires_in_seconds = expires_in_seconds_;
     arn = arn_;
   }
    : create_presigned_mlflow_app_url_request)

let make_create_presigned_domain_url_response
    ?authorized_url:(authorized_url_ : presigned_domain_url option) () =
  ({ authorized_url = authorized_url_ } : create_presigned_domain_url_response)

let make_create_presigned_domain_url_request ?landing_uri:(landing_uri_ : landing_uri option)
    ?space_name:(space_name_ : space_name option)
    ?expires_in_seconds:(expires_in_seconds_ : expires_in_seconds option)
    ?session_expiration_duration_in_seconds:
      (session_expiration_duration_in_seconds_ : session_expiration_duration_in_seconds option)
    ~user_profile_name:(user_profile_name_ : user_profile_name) ~domain_id:(domain_id_ : domain_id)
    () =
  ({
     landing_uri = landing_uri_;
     space_name = space_name_;
     expires_in_seconds = expires_in_seconds_;
     session_expiration_duration_in_seconds = session_expiration_duration_in_seconds_;
     user_profile_name = user_profile_name_;
     domain_id = domain_id_;
   }
    : create_presigned_domain_url_request)

let make_create_pipeline_response ?pipeline_arn:(pipeline_arn_ : pipeline_arn option) () =
  ({ pipeline_arn = pipeline_arn_ } : create_pipeline_response)

let make_create_pipeline_request
    ?parallelism_configuration:(parallelism_configuration_ : parallelism_configuration option)
    ?tags:(tags_ : tag_list option)
    ?pipeline_description:(pipeline_description_ : pipeline_description option)
    ?pipeline_definition_s3_location:
      (pipeline_definition_s3_location_ : pipeline_definition_s3_location option)
    ?pipeline_definition:(pipeline_definition_ : pipeline_definition option)
    ?pipeline_display_name:(pipeline_display_name_ : pipeline_name option)
    ~role_arn:(role_arn_ : role_arn)
    ~client_request_token:(client_request_token_ : idempotency_token)
    ~pipeline_name:(pipeline_name_ : pipeline_name) () =
  ({
     parallelism_configuration = parallelism_configuration_;
     tags = tags_;
     role_arn = role_arn_;
     client_request_token = client_request_token_;
     pipeline_description = pipeline_description_;
     pipeline_definition_s3_location = pipeline_definition_s3_location_;
     pipeline_definition = pipeline_definition_;
     pipeline_display_name = pipeline_display_name_;
     pipeline_name = pipeline_name_;
   }
    : create_pipeline_request)

let make_create_partner_app_presigned_url_response ?url:(url_ : string2048 option) () =
  ({ url = url_ } : create_partner_app_presigned_url_response)

let make_create_partner_app_presigned_url_request
    ?session_expiration_duration_in_seconds:
      (session_expiration_duration_in_seconds_ : session_expiration_duration_in_seconds option)
    ?expires_in_seconds:(expires_in_seconds_ : expires_in_seconds option)
    ~arn:(arn_ : partner_app_arn) () =
  ({
     session_expiration_duration_in_seconds = session_expiration_duration_in_seconds_;
     expires_in_seconds = expires_in_seconds_;
     arn = arn_;
   }
    : create_partner_app_presigned_url_request)

let make_create_partner_app_response ?arn:(arn_ : partner_app_arn option) () =
  ({ arn = arn_ } : create_partner_app_response)

let make_create_partner_app_request ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : client_token option)
    ?enable_auto_minor_version_upgrade:(enable_auto_minor_version_upgrade_ : boolean_ option)
    ?enable_iam_session_based_identity:(enable_iam_session_based_identity_ : boolean_ option)
    ?application_config:(application_config_ : partner_app_config option)
    ?maintenance_config:(maintenance_config_ : partner_app_maintenance_config option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ~auth_type:(auth_type_ : partner_app_auth_type)
    ~tier:(tier_ : non_empty_string64) ~execution_role_arn:(execution_role_arn_ : role_arn)
    ~type_:(type__ : partner_app_type) ~name:(name_ : partner_app_name) () =
  ({
     tags = tags_;
     client_token = client_token_;
     enable_auto_minor_version_upgrade = enable_auto_minor_version_upgrade_;
     enable_iam_session_based_identity = enable_iam_session_based_identity_;
     auth_type = auth_type_;
     application_config = application_config_;
     tier = tier_;
     maintenance_config = maintenance_config_;
     kms_key_id = kms_key_id_;
     execution_role_arn = execution_role_arn_;
     type_ = type__;
     name = name_;
   }
    : create_partner_app_request)

let make_create_optimization_job_response
    ~optimization_job_arn:(optimization_job_arn_ : optimization_job_arn) () =
  ({ optimization_job_arn = optimization_job_arn_ } : create_optimization_job_response)

let make_create_optimization_job_request ?vpc_config:(vpc_config_ : optimization_vpc_config option)
    ?tags:(tags_ : tag_list option)
    ?optimization_environment:
      (optimization_environment_ : optimization_job_environment_variables option)
    ?max_instance_count:(max_instance_count_ : optimization_job_max_instance_count option)
    ~stopping_condition:(stopping_condition_ : stopping_condition)
    ~output_config:(output_config_ : optimization_job_output_config)
    ~optimization_configs:(optimization_configs_ : optimization_configs)
    ~deployment_instance_type:
      (deployment_instance_type_ : optimization_job_deployment_instance_type)
    ~model_source:(model_source_ : optimization_job_model_source) ~role_arn:(role_arn_ : role_arn)
    ~optimization_job_name:(optimization_job_name_ : entity_name) () =
  ({
     vpc_config = vpc_config_;
     tags = tags_;
     stopping_condition = stopping_condition_;
     output_config = output_config_;
     optimization_configs = optimization_configs_;
     optimization_environment = optimization_environment_;
     max_instance_count = max_instance_count_;
     deployment_instance_type = deployment_instance_type_;
     model_source = model_source_;
     role_arn = role_arn_;
     optimization_job_name = optimization_job_name_;
   }
    : create_optimization_job_request)

let make_create_notebook_instance_lifecycle_config_output
    ?notebook_instance_lifecycle_config_arn:
      (notebook_instance_lifecycle_config_arn_ : notebook_instance_lifecycle_config_arn option) () =
  ({ notebook_instance_lifecycle_config_arn = notebook_instance_lifecycle_config_arn_ }
    : create_notebook_instance_lifecycle_config_output)

let make_create_notebook_instance_lifecycle_config_input ?tags:(tags_ : tag_list option)
    ?on_start:(on_start_ : notebook_instance_lifecycle_config_list option)
    ?on_create:(on_create_ : notebook_instance_lifecycle_config_list option)
    ~notebook_instance_lifecycle_config_name:
      (notebook_instance_lifecycle_config_name_ : notebook_instance_lifecycle_config_name) () =
  ({
     tags = tags_;
     on_start = on_start_;
     on_create = on_create_;
     notebook_instance_lifecycle_config_name = notebook_instance_lifecycle_config_name_;
   }
    : create_notebook_instance_lifecycle_config_input)

let make_create_notebook_instance_output
    ?notebook_instance_arn:(notebook_instance_arn_ : notebook_instance_arn option) () =
  ({ notebook_instance_arn = notebook_instance_arn_ } : create_notebook_instance_output)

let make_create_notebook_instance_input
    ?instance_metadata_service_configuration:
      (instance_metadata_service_configuration_ : instance_metadata_service_configuration option)
    ?platform_identifier:(platform_identifier_ : platform_identifier option)
    ?root_access:(root_access_ : root_access option)
    ?additional_code_repositories:
      (additional_code_repositories_ : additional_code_repository_names_or_urls option)
    ?default_code_repository:(default_code_repository_ : code_repository_name_or_url option)
    ?accelerator_types:(accelerator_types_ : notebook_instance_accelerator_types option)
    ?volume_size_in_g_b:(volume_size_in_g_b_ : notebook_instance_volume_size_in_g_b option)
    ?direct_internet_access:(direct_internet_access_ : direct_internet_access option)
    ?lifecycle_config_name:(lifecycle_config_name_ : notebook_instance_lifecycle_config_name option)
    ?tags:(tags_ : tag_list option) ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?subnet_id:(subnet_id_ : subnet_id option) ~role_arn:(role_arn_ : role_arn)
    ~instance_type:(instance_type_ : instance_type)
    ~notebook_instance_name:(notebook_instance_name_ : notebook_instance_name) () =
  ({
     instance_metadata_service_configuration = instance_metadata_service_configuration_;
     platform_identifier = platform_identifier_;
     root_access = root_access_;
     additional_code_repositories = additional_code_repositories_;
     default_code_repository = default_code_repository_;
     accelerator_types = accelerator_types_;
     volume_size_in_g_b = volume_size_in_g_b_;
     direct_internet_access = direct_internet_access_;
     lifecycle_config_name = lifecycle_config_name_;
     tags = tags_;
     kms_key_id = kms_key_id_;
     role_arn = role_arn_;
     ip_address_type = ip_address_type_;
     security_group_ids = security_group_ids_;
     subnet_id = subnet_id_;
     instance_type = instance_type_;
     notebook_instance_name = notebook_instance_name_;
   }
    : create_notebook_instance_input)

let make_create_monitoring_schedule_response
    ~monitoring_schedule_arn:(monitoring_schedule_arn_ : monitoring_schedule_arn) () =
  ({ monitoring_schedule_arn = monitoring_schedule_arn_ } : create_monitoring_schedule_response)

let make_create_monitoring_schedule_request ?tags:(tags_ : tag_list option)
    ~monitoring_schedule_config:(monitoring_schedule_config_ : monitoring_schedule_config)
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name) () =
  ({
     tags = tags_;
     monitoring_schedule_config = monitoring_schedule_config_;
     monitoring_schedule_name = monitoring_schedule_name_;
   }
    : create_monitoring_schedule_request)

let make_create_model_quality_job_definition_response
    ~job_definition_arn:(job_definition_arn_ : monitoring_job_definition_arn) () =
  ({ job_definition_arn = job_definition_arn_ } : create_model_quality_job_definition_response)

let make_create_model_quality_job_definition_request ?tags:(tags_ : tag_list option)
    ?stopping_condition:(stopping_condition_ : monitoring_stopping_condition option)
    ?network_config:(network_config_ : monitoring_network_config option)
    ?model_quality_baseline_config:
      (model_quality_baseline_config_ : model_quality_baseline_config option)
    ~role_arn:(role_arn_ : role_arn) ~job_resources:(job_resources_ : monitoring_resources)
    ~model_quality_job_output_config:(model_quality_job_output_config_ : monitoring_output_config)
    ~model_quality_job_input:(model_quality_job_input_ : model_quality_job_input)
    ~model_quality_app_specification:
      (model_quality_app_specification_ : model_quality_app_specification)
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name) () =
  ({
     tags = tags_;
     stopping_condition = stopping_condition_;
     role_arn = role_arn_;
     network_config = network_config_;
     job_resources = job_resources_;
     model_quality_job_output_config = model_quality_job_output_config_;
     model_quality_job_input = model_quality_job_input_;
     model_quality_app_specification = model_quality_app_specification_;
     model_quality_baseline_config = model_quality_baseline_config_;
     job_definition_name = job_definition_name_;
   }
    : create_model_quality_job_definition_request)

let make_create_model_package_group_output
    ~model_package_group_arn:(model_package_group_arn_ : model_package_group_arn) () =
  ({ model_package_group_arn = model_package_group_arn_ } : create_model_package_group_output)

let make_create_model_package_group_input
    ?managed_configuration:(managed_configuration_ : managed_configuration option)
    ?tags:(tags_ : tag_list option)
    ?model_package_group_description:(model_package_group_description_ : entity_description option)
    ~model_package_group_name:(model_package_group_name_ : entity_name) () =
  ({
     managed_configuration = managed_configuration_;
     tags = tags_;
     model_package_group_description = model_package_group_description_;
     model_package_group_name = model_package_group_name_;
   }
    : create_model_package_group_input)

let make_create_model_package_output ~model_package_arn:(model_package_arn_ : model_package_arn) ()
    =
  ({ model_package_arn = model_package_arn_ } : create_model_package_output)

let make_create_model_package_input
    ?managed_storage_type:(managed_storage_type_ : managed_storage_type option)
    ?model_life_cycle:(model_life_cycle_ : model_life_cycle option)
    ?model_card:(model_card_ : model_package_model_card option)
    ?security_config:(security_config_ : model_package_security_config option)
    ?source_uri:(source_uri_ : model_package_source_uri option)
    ?skip_model_validation:(skip_model_validation_ : skip_model_validation option)
    ?additional_inference_specifications:
      (additional_inference_specifications_ : additional_inference_specifications option)
    ?drift_check_baselines:(drift_check_baselines_ : drift_check_baselines option)
    ?customer_metadata_properties:(customer_metadata_properties_ : customer_metadata_map option)
    ?sample_payload_url:(sample_payload_url_ : s3_uri option) ?task:(task_ : string_ option)
    ?domain:(domain_ : string_ option) ?client_token:(client_token_ : client_token option)
    ?model_metrics:(model_metrics_ : model_metrics option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?model_approval_status:(model_approval_status_ : model_approval_status option)
    ?tags:(tags_ : tag_list option)
    ?certify_for_marketplace:(certify_for_marketplace_ : certify_for_marketplace option)
    ?source_algorithm_specification:
      (source_algorithm_specification_ : source_algorithm_specification option)
    ?validation_specification:
      (validation_specification_ : model_package_validation_specification option)
    ?inference_specification:(inference_specification_ : inference_specification option)
    ?model_package_registration_type:
      (model_package_registration_type_ : model_package_registration_type option)
    ?model_package_description:(model_package_description_ : entity_description option)
    ?model_package_group_name:(model_package_group_name_ : arn_or_name option)
    ?model_package_name:(model_package_name_ : entity_name option) () =
  ({
     managed_storage_type = managed_storage_type_;
     model_life_cycle = model_life_cycle_;
     model_card = model_card_;
     security_config = security_config_;
     source_uri = source_uri_;
     skip_model_validation = skip_model_validation_;
     additional_inference_specifications = additional_inference_specifications_;
     drift_check_baselines = drift_check_baselines_;
     customer_metadata_properties = customer_metadata_properties_;
     sample_payload_url = sample_payload_url_;
     task = task_;
     domain = domain_;
     client_token = client_token_;
     model_metrics = model_metrics_;
     metadata_properties = metadata_properties_;
     model_approval_status = model_approval_status_;
     tags = tags_;
     certify_for_marketplace = certify_for_marketplace_;
     source_algorithm_specification = source_algorithm_specification_;
     validation_specification = validation_specification_;
     inference_specification = inference_specification_;
     model_package_registration_type = model_package_registration_type_;
     model_package_description = model_package_description_;
     model_package_group_name = model_package_group_name_;
     model_package_name = model_package_name_;
   }
    : create_model_package_input)

let make_create_model_explainability_job_definition_response
    ~job_definition_arn:(job_definition_arn_ : monitoring_job_definition_arn) () =
  ({ job_definition_arn = job_definition_arn_ }
    : create_model_explainability_job_definition_response)

let make_create_model_explainability_job_definition_request ?tags:(tags_ : tag_list option)
    ?stopping_condition:(stopping_condition_ : monitoring_stopping_condition option)
    ?network_config:(network_config_ : monitoring_network_config option)
    ?model_explainability_baseline_config:
      (model_explainability_baseline_config_ : model_explainability_baseline_config option)
    ~role_arn:(role_arn_ : role_arn) ~job_resources:(job_resources_ : monitoring_resources)
    ~model_explainability_job_output_config:
      (model_explainability_job_output_config_ : monitoring_output_config)
    ~model_explainability_job_input:
      (model_explainability_job_input_ : model_explainability_job_input)
    ~model_explainability_app_specification:
      (model_explainability_app_specification_ : model_explainability_app_specification)
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name) () =
  ({
     tags = tags_;
     stopping_condition = stopping_condition_;
     role_arn = role_arn_;
     network_config = network_config_;
     job_resources = job_resources_;
     model_explainability_job_output_config = model_explainability_job_output_config_;
     model_explainability_job_input = model_explainability_job_input_;
     model_explainability_app_specification = model_explainability_app_specification_;
     model_explainability_baseline_config = model_explainability_baseline_config_;
     job_definition_name = job_definition_name_;
   }
    : create_model_explainability_job_definition_request)

let make_create_model_card_export_job_response
    ~model_card_export_job_arn:(model_card_export_job_arn_ : model_card_export_job_arn) () =
  ({ model_card_export_job_arn = model_card_export_job_arn_ }
    : create_model_card_export_job_response)

let make_create_model_card_export_job_request
    ?model_card_version:(model_card_version_ : integer option)
    ~output_config:(output_config_ : model_card_export_output_config)
    ~model_card_export_job_name:(model_card_export_job_name_ : entity_name)
    ~model_card_name:(model_card_name_ : model_card_name_or_arn) () =
  ({
     output_config = output_config_;
     model_card_export_job_name = model_card_export_job_name_;
     model_card_version = model_card_version_;
     model_card_name = model_card_name_;
   }
    : create_model_card_export_job_request)

let make_create_model_card_response ~model_card_arn:(model_card_arn_ : model_card_arn) () =
  ({ model_card_arn = model_card_arn_ } : create_model_card_response)

let make_create_model_card_request ?tags:(tags_ : tag_list option)
    ?security_config:(security_config_ : model_card_security_config option)
    ~model_card_status:(model_card_status_ : model_card_status)
    ~content:(content_ : model_card_content) ~model_card_name:(model_card_name_ : entity_name) () =
  ({
     tags = tags_;
     model_card_status = model_card_status_;
     content = content_;
     security_config = security_config_;
     model_card_name = model_card_name_;
   }
    : create_model_card_request)

let make_create_model_bias_job_definition_response
    ~job_definition_arn:(job_definition_arn_ : monitoring_job_definition_arn) () =
  ({ job_definition_arn = job_definition_arn_ } : create_model_bias_job_definition_response)

let make_create_model_bias_job_definition_request ?tags:(tags_ : tag_list option)
    ?stopping_condition:(stopping_condition_ : monitoring_stopping_condition option)
    ?network_config:(network_config_ : monitoring_network_config option)
    ?model_bias_baseline_config:(model_bias_baseline_config_ : model_bias_baseline_config option)
    ~role_arn:(role_arn_ : role_arn) ~job_resources:(job_resources_ : monitoring_resources)
    ~model_bias_job_output_config:(model_bias_job_output_config_ : monitoring_output_config)
    ~model_bias_job_input:(model_bias_job_input_ : model_bias_job_input)
    ~model_bias_app_specification:(model_bias_app_specification_ : model_bias_app_specification)
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name) () =
  ({
     tags = tags_;
     stopping_condition = stopping_condition_;
     role_arn = role_arn_;
     network_config = network_config_;
     job_resources = job_resources_;
     model_bias_job_output_config = model_bias_job_output_config_;
     model_bias_job_input = model_bias_job_input_;
     model_bias_app_specification = model_bias_app_specification_;
     model_bias_baseline_config = model_bias_baseline_config_;
     job_definition_name = job_definition_name_;
   }
    : create_model_bias_job_definition_request)

let make_create_model_output ~model_arn:(model_arn_ : model_arn) () =
  ({ model_arn = model_arn_ } : create_model_output)

let make_create_model_input ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ?vpc_config:(vpc_config_ : vpc_config option) ?tags:(tags_ : tag_list option)
    ?execution_role_arn:(execution_role_arn_ : role_arn option)
    ?inference_execution_config:(inference_execution_config_ : inference_execution_config option)
    ?containers:(containers_ : container_definition_list option)
    ?primary_container:(primary_container_ : container_definition option)
    ~model_name:(model_name_ : model_name) () =
  ({
     enable_network_isolation = enable_network_isolation_;
     vpc_config = vpc_config_;
     tags = tags_;
     execution_role_arn = execution_role_arn_;
     inference_execution_config = inference_execution_config_;
     containers = containers_;
     primary_container = primary_container_;
     model_name = model_name_;
   }
    : create_model_input)

let make_create_mlflow_tracking_server_response
    ?tracking_server_arn:(tracking_server_arn_ : tracking_server_arn option) () =
  ({ tracking_server_arn = tracking_server_arn_ } : create_mlflow_tracking_server_response)

let make_create_mlflow_tracking_server_request
    ?s3_bucket_owner_verification:(s3_bucket_owner_verification_ : boolean_ option)
    ?s3_bucket_owner_account_id:(s3_bucket_owner_account_id_ : account_id option)
    ?tags:(tags_ : tag_list option)
    ?weekly_maintenance_window_start:
      (weekly_maintenance_window_start_ : weekly_maintenance_window_start option)
    ?automatic_model_registration:(automatic_model_registration_ : boolean_ option)
    ?mlflow_version:(mlflow_version_ : mlflow_version option)
    ?tracking_server_size:(tracking_server_size_ : tracking_server_size option)
    ~role_arn:(role_arn_ : role_arn) ~artifact_store_uri:(artifact_store_uri_ : s3_uri)
    ~tracking_server_name:(tracking_server_name_ : tracking_server_name) () =
  ({
     s3_bucket_owner_verification = s3_bucket_owner_verification_;
     s3_bucket_owner_account_id = s3_bucket_owner_account_id_;
     tags = tags_;
     weekly_maintenance_window_start = weekly_maintenance_window_start_;
     automatic_model_registration = automatic_model_registration_;
     role_arn = role_arn_;
     mlflow_version = mlflow_version_;
     tracking_server_size = tracking_server_size_;
     artifact_store_uri = artifact_store_uri_;
     tracking_server_name = tracking_server_name_;
   }
    : create_mlflow_tracking_server_request)

let make_create_mlflow_app_response ?arn:(arn_ : mlflow_app_arn option) () =
  ({ arn = arn_ } : create_mlflow_app_response)

let make_create_mlflow_app_request ?tags:(tags_ : tag_list option)
    ?default_domain_id_list:(default_domain_id_list_ : default_domain_id_list option)
    ?account_default_status:(account_default_status_ : account_default_status option)
    ?weekly_maintenance_window_start:
      (weekly_maintenance_window_start_ : weekly_maintenance_window_start option)
    ?model_registration_mode:(model_registration_mode_ : model_registration_mode option)
    ~role_arn:(role_arn_ : role_arn) ~artifact_store_uri:(artifact_store_uri_ : s3_uri)
    ~name:(name_ : mlflow_app_name) () =
  ({
     tags = tags_;
     default_domain_id_list = default_domain_id_list_;
     account_default_status = account_default_status_;
     weekly_maintenance_window_start = weekly_maintenance_window_start_;
     model_registration_mode = model_registration_mode_;
     role_arn = role_arn_;
     artifact_store_uri = artifact_store_uri_;
     name = name_;
   }
    : create_mlflow_app_request)

let make_create_labeling_job_response ~labeling_job_arn:(labeling_job_arn_ : labeling_job_arn) () =
  ({ labeling_job_arn = labeling_job_arn_ } : create_labeling_job_response)

let make_create_labeling_job_request ?tags:(tags_ : tag_list option)
    ?labeling_job_algorithms_config:
      (labeling_job_algorithms_config_ : labeling_job_algorithms_config option)
    ?stopping_conditions:(stopping_conditions_ : labeling_job_stopping_conditions option)
    ?label_category_config_s3_uri:(label_category_config_s3_uri_ : s3_uri option)
    ~human_task_config:(human_task_config_ : human_task_config) ~role_arn:(role_arn_ : role_arn)
    ~output_config:(output_config_ : labeling_job_output_config)
    ~input_config:(input_config_ : labeling_job_input_config)
    ~label_attribute_name:(label_attribute_name_ : label_attribute_name)
    ~labeling_job_name:(labeling_job_name_ : labeling_job_name) () =
  ({
     tags = tags_;
     human_task_config = human_task_config_;
     labeling_job_algorithms_config = labeling_job_algorithms_config_;
     stopping_conditions = stopping_conditions_;
     label_category_config_s3_uri = label_category_config_s3_uri_;
     role_arn = role_arn_;
     output_config = output_config_;
     input_config = input_config_;
     label_attribute_name = label_attribute_name_;
     labeling_job_name = labeling_job_name_;
   }
    : create_labeling_job_request)

let make_create_job_response ~job_arn:(job_arn_ : job_arn) () =
  ({ job_arn = job_arn_ } : create_job_response)

let make_create_job_request ?tags:(tags_ : tag_list option)
    ~job_config_document:(job_config_document_ : job_config_document)
    ~job_config_schema_version:(job_config_schema_version_ : job_schema_version)
    ~job_category:(job_category_ : job_category) ~role_arn:(role_arn_ : role_arn)
    ~job_name:(job_name_ : job_name) () =
  ({
     tags = tags_;
     job_config_document = job_config_document_;
     job_config_schema_version = job_config_schema_version_;
     job_category = job_category_;
     role_arn = role_arn_;
     job_name = job_name_;
   }
    : create_job_request)

let make_create_inference_recommendations_job_response ~job_arn:(job_arn_ : recommendation_job_arn)
    () =
  ({ job_arn = job_arn_ } : create_inference_recommendations_job_response)

let make_recommendation_job_compiled_output_config ?s3_output_uri:(s3_output_uri_ : s3_uri option)
    () =
  ({ s3_output_uri = s3_output_uri_ } : recommendation_job_compiled_output_config)

let make_recommendation_job_output_config
    ?compiled_output_config:
      (compiled_output_config_ : recommendation_job_compiled_output_config option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) () =
  ({ compiled_output_config = compiled_output_config_; kms_key_id = kms_key_id_ }
    : recommendation_job_output_config)

let make_create_inference_recommendations_job_request ?tags:(tags_ : tag_list option)
    ?output_config:(output_config_ : recommendation_job_output_config option)
    ?stopping_conditions:(stopping_conditions_ : recommendation_job_stopping_conditions option)
    ?job_description:(job_description_ : recommendation_job_description option)
    ~input_config:(input_config_ : recommendation_job_input_config) ~role_arn:(role_arn_ : role_arn)
    ~job_type:(job_type_ : recommendation_job_type) ~job_name:(job_name_ : recommendation_job_name)
    () =
  ({
     tags = tags_;
     output_config = output_config_;
     stopping_conditions = stopping_conditions_;
     job_description = job_description_;
     input_config = input_config_;
     role_arn = role_arn_;
     job_type = job_type_;
     job_name = job_name_;
   }
    : create_inference_recommendations_job_request)

let make_create_inference_experiment_response
    ~inference_experiment_arn:(inference_experiment_arn_ : inference_experiment_arn) () =
  ({ inference_experiment_arn = inference_experiment_arn_ } : create_inference_experiment_response)

let make_create_inference_experiment_request ?tags:(tags_ : tag_list option)
    ?kms_key:(kms_key_ : kms_key_id option)
    ?data_storage_config:(data_storage_config_ : inference_experiment_data_storage_config option)
    ?description:(description_ : inference_experiment_description option)
    ?schedule:(schedule_ : inference_experiment_schedule option)
    ~shadow_mode_config:(shadow_mode_config_ : shadow_mode_config)
    ~model_variants:(model_variants_ : model_variant_config_list)
    ~endpoint_name:(endpoint_name_ : endpoint_name) ~role_arn:(role_arn_ : role_arn)
    ~type_:(type__ : inference_experiment_type) ~name:(name_ : inference_experiment_name) () =
  ({
     tags = tags_;
     kms_key = kms_key_;
     shadow_mode_config = shadow_mode_config_;
     data_storage_config = data_storage_config_;
     model_variants = model_variants_;
     endpoint_name = endpoint_name_;
     role_arn = role_arn_;
     description = description_;
     schedule = schedule_;
     type_ = type__;
     name = name_;
   }
    : create_inference_experiment_request)

let make_create_inference_component_output
    ~inference_component_arn:(inference_component_arn_ : inference_component_arn) () =
  ({ inference_component_arn = inference_component_arn_ } : create_inference_component_output)

let make_create_inference_component_input ?tags:(tags_ : tag_list option)
    ?runtime_config:(runtime_config_ : inference_component_runtime_config option)
    ?specifications:(specifications_ : inference_component_specification_list option)
    ?specification:(specification_ : inference_component_specification option)
    ?variant_name:(variant_name_ : variant_name option)
    ~endpoint_name:(endpoint_name_ : endpoint_name)
    ~inference_component_name:(inference_component_name_ : inference_component_name) () =
  ({
     tags = tags_;
     runtime_config = runtime_config_;
     specifications = specifications_;
     specification = specification_;
     variant_name = variant_name_;
     endpoint_name = endpoint_name_;
     inference_component_name = inference_component_name_;
   }
    : create_inference_component_input)

let make_create_image_version_response
    ?image_version_arn:(image_version_arn_ : image_version_arn option) () =
  ({ image_version_arn = image_version_arn_ } : create_image_version_response)

let make_create_image_version_request ?release_notes:(release_notes_ : release_notes option)
    ?horovod:(horovod_ : horovod option) ?processor:(processor_ : processor option)
    ?programming_lang:(programming_lang_ : programming_lang option)
    ?ml_framework:(ml_framework_ : ml_framework option) ?job_type:(job_type_ : job_type option)
    ?vendor_guidance:(vendor_guidance_ : vendor_guidance option)
    ?aliases:(aliases_ : sage_maker_image_version_aliases option)
    ~image_name:(image_name_ : image_name) ~client_token:(client_token_ : client_token)
    ~base_image:(base_image_ : image_base_image) () =
  ({
     release_notes = release_notes_;
     horovod = horovod_;
     processor = processor_;
     programming_lang = programming_lang_;
     ml_framework = ml_framework_;
     job_type = job_type_;
     vendor_guidance = vendor_guidance_;
     aliases = aliases_;
     image_name = image_name_;
     client_token = client_token_;
     base_image = base_image_;
   }
    : create_image_version_request)

let make_create_image_response ?image_arn:(image_arn_ : image_arn option) () =
  ({ image_arn = image_arn_ } : create_image_response)

let make_create_image_request ?tags:(tags_ : tag_list option)
    ?display_name:(display_name_ : image_display_name option)
    ?description:(description_ : image_description option) ~role_arn:(role_arn_ : role_arn)
    ~image_name:(image_name_ : image_name) () =
  ({
     tags = tags_;
     role_arn = role_arn_;
     image_name = image_name_;
     display_name = display_name_;
     description = description_;
   }
    : create_image_request)

let make_create_hyper_parameter_tuning_job_response
    ~hyper_parameter_tuning_job_arn:
      (hyper_parameter_tuning_job_arn_ : hyper_parameter_tuning_job_arn) () =
  ({ hyper_parameter_tuning_job_arn = hyper_parameter_tuning_job_arn_ }
    : create_hyper_parameter_tuning_job_response)

let make_create_hyper_parameter_tuning_job_request ?autotune:(autotune_ : autotune option)
    ?tags:(tags_ : tag_list option)
    ?warm_start_config:(warm_start_config_ : hyper_parameter_tuning_job_warm_start_config option)
    ?training_job_definitions:
      (training_job_definitions_ : hyper_parameter_training_job_definitions option)
    ?training_job_definition:
      (training_job_definition_ : hyper_parameter_training_job_definition option)
    ~hyper_parameter_tuning_job_config:
      (hyper_parameter_tuning_job_config_ : hyper_parameter_tuning_job_config)
    ~hyper_parameter_tuning_job_name:
      (hyper_parameter_tuning_job_name_ : hyper_parameter_tuning_job_name) () =
  ({
     autotune = autotune_;
     tags = tags_;
     warm_start_config = warm_start_config_;
     training_job_definitions = training_job_definitions_;
     training_job_definition = training_job_definition_;
     hyper_parameter_tuning_job_config = hyper_parameter_tuning_job_config_;
     hyper_parameter_tuning_job_name = hyper_parameter_tuning_job_name_;
   }
    : create_hyper_parameter_tuning_job_request)

let make_create_human_task_ui_response ~human_task_ui_arn:(human_task_ui_arn_ : human_task_ui_arn)
    () =
  ({ human_task_ui_arn = human_task_ui_arn_ } : create_human_task_ui_response)

let make_create_human_task_ui_request ?tags:(tags_ : tag_list option)
    ~ui_template:(ui_template_ : ui_template)
    ~human_task_ui_name:(human_task_ui_name_ : human_task_ui_name) () =
  ({ tags = tags_; ui_template = ui_template_; human_task_ui_name = human_task_ui_name_ }
    : create_human_task_ui_request)

let make_create_hub_content_reference_response ~hub_content_arn:(hub_content_arn_ : hub_content_arn)
    ~hub_arn:(hub_arn_ : hub_arn) () =
  ({ hub_content_arn = hub_content_arn_; hub_arn = hub_arn_ }
    : create_hub_content_reference_response)

let make_create_hub_content_reference_request ?tags:(tags_ : tag_list option)
    ?min_version:(min_version_ : hub_content_version option)
    ?hub_content_name:(hub_content_name_ : hub_content_name option)
    ~sage_maker_public_hub_content_arn:
      (sage_maker_public_hub_content_arn_ : sage_maker_public_hub_content_arn)
    ~hub_name:(hub_name_ : hub_name_or_arn) () =
  ({
     tags = tags_;
     min_version = min_version_;
     hub_content_name = hub_content_name_;
     sage_maker_public_hub_content_arn = sage_maker_public_hub_content_arn_;
     hub_name = hub_name_;
   }
    : create_hub_content_reference_request)

let make_authorized_url ?local_path:(local_path_ : local_path option)
    ?url:(url_ : long_s3_uri option) () =
  ({ local_path = local_path_; url = url_ } : authorized_url)

let make_create_hub_content_presigned_urls_response ?next_token:(next_token_ : next_token option)
    ~authorized_url_configs:(authorized_url_configs_ : authorized_url_configs) () =
  ({ next_token = next_token_; authorized_url_configs = authorized_url_configs_ }
    : create_hub_content_presigned_urls_response)

let make_presigned_url_access_config ?expected_s3_url:(expected_s3_url_ : s3_model_uri option)
    ?accept_eula:(accept_eula_ : boolean_ option) () =
  ({ expected_s3_url = expected_s3_url_; accept_eula = accept_eula_ } : presigned_url_access_config)

let make_create_hub_content_presigned_urls_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?access_config:(access_config_ : presigned_url_access_config option)
    ?hub_content_version:(hub_content_version_ : hub_content_version option)
    ~hub_content_name:(hub_content_name_ : hub_content_name)
    ~hub_content_type:(hub_content_type_ : hub_content_type) ~hub_name:(hub_name_ : hub_name_or_arn)
    () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     access_config = access_config_;
     hub_content_version = hub_content_version_;
     hub_content_name = hub_content_name_;
     hub_content_type = hub_content_type_;
     hub_name = hub_name_;
   }
    : create_hub_content_presigned_urls_request)

let make_create_hub_response ~hub_arn:(hub_arn_ : hub_arn) () =
  ({ hub_arn = hub_arn_ } : create_hub_response)

let make_create_hub_request ?tags:(tags_ : tag_list option)
    ?s3_storage_config:(s3_storage_config_ : hub_s3_storage_config option)
    ?hub_search_keywords:(hub_search_keywords_ : hub_search_keyword_list option)
    ?hub_display_name:(hub_display_name_ : hub_display_name option)
    ~hub_description:(hub_description_ : hub_description) ~hub_name:(hub_name_ : hub_name) () =
  ({
     tags = tags_;
     s3_storage_config = s3_storage_config_;
     hub_search_keywords = hub_search_keywords_;
     hub_display_name = hub_display_name_;
     hub_description = hub_description_;
     hub_name = hub_name_;
   }
    : create_hub_request)

let make_create_flow_definition_response
    ~flow_definition_arn:(flow_definition_arn_ : flow_definition_arn) () =
  ({ flow_definition_arn = flow_definition_arn_ } : create_flow_definition_response)

let make_create_flow_definition_request ?tags:(tags_ : tag_list option)
    ?human_loop_config:(human_loop_config_ : human_loop_config option)
    ?human_loop_activation_config:
      (human_loop_activation_config_ : human_loop_activation_config option)
    ?human_loop_request_source:(human_loop_request_source_ : human_loop_request_source option)
    ~role_arn:(role_arn_ : role_arn) ~output_config:(output_config_ : flow_definition_output_config)
    ~flow_definition_name:(flow_definition_name_ : flow_definition_name) () =
  ({
     tags = tags_;
     role_arn = role_arn_;
     output_config = output_config_;
     human_loop_config = human_loop_config_;
     human_loop_activation_config = human_loop_activation_config_;
     human_loop_request_source = human_loop_request_source_;
     flow_definition_name = flow_definition_name_;
   }
    : create_flow_definition_request)

let make_create_feature_group_response ~feature_group_arn:(feature_group_arn_ : feature_group_arn)
    () =
  ({ feature_group_arn = feature_group_arn_ } : create_feature_group_response)

let make_create_feature_group_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : description option) ?role_arn:(role_arn_ : role_arn option)
    ?throughput_config:(throughput_config_ : throughput_config option)
    ?offline_store_config:(offline_store_config_ : offline_store_config option)
    ?online_store_config:(online_store_config_ : online_store_config option)
    ~feature_definitions:(feature_definitions_ : feature_definitions)
    ~event_time_feature_name:(event_time_feature_name_ : feature_name)
    ~record_identifier_feature_name:(record_identifier_feature_name_ : feature_name)
    ~feature_group_name:(feature_group_name_ : feature_group_name) () =
  ({
     tags = tags_;
     description = description_;
     role_arn = role_arn_;
     throughput_config = throughput_config_;
     offline_store_config = offline_store_config_;
     online_store_config = online_store_config_;
     feature_definitions = feature_definitions_;
     event_time_feature_name = event_time_feature_name_;
     record_identifier_feature_name = record_identifier_feature_name_;
     feature_group_name = feature_group_name_;
   }
    : create_feature_group_request)

let make_create_experiment_response ?experiment_arn:(experiment_arn_ : experiment_arn option) () =
  ({ experiment_arn = experiment_arn_ } : create_experiment_response)

let make_create_experiment_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : experiment_description option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ~experiment_name:(experiment_name_ : experiment_entity_name) () =
  ({
     tags = tags_;
     description = description_;
     display_name = display_name_;
     experiment_name = experiment_name_;
   }
    : create_experiment_request)

let make_create_endpoint_config_output
    ~endpoint_config_arn:(endpoint_config_arn_ : endpoint_config_arn) () =
  ({ endpoint_config_arn = endpoint_config_arn_ } : create_endpoint_config_output)

let make_create_endpoint_config_input ?metrics_config:(metrics_config_ : metrics_config option)
    ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?execution_role_arn:(execution_role_arn_ : role_arn option)
    ?shadow_production_variants:(shadow_production_variants_ : production_variant_list option)
    ?explainer_config:(explainer_config_ : explainer_config option)
    ?async_inference_config:(async_inference_config_ : async_inference_config option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ?tags:(tags_ : tag_list option)
    ?data_capture_config:(data_capture_config_ : data_capture_config option)
    ~production_variants:(production_variants_ : production_variant_list)
    ~endpoint_config_name:(endpoint_config_name_ : endpoint_config_name) () =
  ({
     metrics_config = metrics_config_;
     enable_network_isolation = enable_network_isolation_;
     vpc_config = vpc_config_;
     execution_role_arn = execution_role_arn_;
     shadow_production_variants = shadow_production_variants_;
     explainer_config = explainer_config_;
     async_inference_config = async_inference_config_;
     kms_key_id = kms_key_id_;
     tags = tags_;
     data_capture_config = data_capture_config_;
     production_variants = production_variants_;
     endpoint_config_name = endpoint_config_name_;
   }
    : create_endpoint_config_input)

let make_create_endpoint_output ~endpoint_arn:(endpoint_arn_ : endpoint_arn) () =
  ({ endpoint_arn = endpoint_arn_ } : create_endpoint_output)

let make_create_endpoint_input ?tags:(tags_ : tag_list option)
    ?deployment_config:(deployment_config_ : deployment_config option)
    ~endpoint_config_name:(endpoint_config_name_ : endpoint_config_name)
    ~endpoint_name:(endpoint_name_ : endpoint_name) () =
  ({
     tags = tags_;
     deployment_config = deployment_config_;
     endpoint_config_name = endpoint_config_name_;
     endpoint_name = endpoint_name_;
   }
    : create_endpoint_input)

let make_create_edge_packaging_job_request ?tags:(tags_ : tag_list option)
    ?resource_key:(resource_key_ : kms_key_id option)
    ~output_config:(output_config_ : edge_output_config) ~role_arn:(role_arn_ : role_arn)
    ~model_version:(model_version_ : edge_version) ~model_name:(model_name_ : entity_name)
    ~compilation_job_name:(compilation_job_name_ : entity_name)
    ~edge_packaging_job_name:(edge_packaging_job_name_ : entity_name) () =
  ({
     tags = tags_;
     resource_key = resource_key_;
     output_config = output_config_;
     role_arn = role_arn_;
     model_version = model_version_;
     model_name = model_name_;
     compilation_job_name = compilation_job_name_;
     edge_packaging_job_name = edge_packaging_job_name_;
   }
    : create_edge_packaging_job_request)

let make_deployment_stage ?deployment_config:(deployment_config_ : edge_deployment_config option)
    ~device_selection_config:(device_selection_config_ : device_selection_config)
    ~stage_name:(stage_name_ : entity_name) () =
  ({
     deployment_config = deployment_config_;
     device_selection_config = device_selection_config_;
     stage_name = stage_name_;
   }
    : deployment_stage)

let make_create_edge_deployment_stage_request ~stages:(stages_ : deployment_stages)
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name) () =
  ({ stages = stages_; edge_deployment_plan_name = edge_deployment_plan_name_ }
    : create_edge_deployment_stage_request)

let make_create_edge_deployment_plan_response
    ~edge_deployment_plan_arn:(edge_deployment_plan_arn_ : edge_deployment_plan_arn) () =
  ({ edge_deployment_plan_arn = edge_deployment_plan_arn_ } : create_edge_deployment_plan_response)

let make_create_edge_deployment_plan_request ?tags:(tags_ : tag_list option)
    ?stages:(stages_ : deployment_stages option)
    ~device_fleet_name:(device_fleet_name_ : entity_name)
    ~model_configs:(model_configs_ : edge_deployment_model_configs)
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name) () =
  ({
     tags = tags_;
     stages = stages_;
     device_fleet_name = device_fleet_name_;
     model_configs = model_configs_;
     edge_deployment_plan_name = edge_deployment_plan_name_;
   }
    : create_edge_deployment_plan_request)

let make_create_domain_response ?url:(url_ : string1024 option)
    ?domain_id:(domain_id_ : domain_id option) ?domain_arn:(domain_arn_ : domain_arn option) () =
  ({ url = url_; domain_id = domain_id_; domain_arn = domain_arn_ } : create_domain_response)

let make_create_domain_request
    ?default_space_settings:(default_space_settings_ : default_space_settings option)
    ?tag_propagation:(tag_propagation_ : tag_propagation option)
    ?home_efs_file_system_creation:
      (home_efs_file_system_creation_ : home_efs_file_system_creation option)
    ?app_security_group_management:
      (app_security_group_management_ : app_security_group_management option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?home_efs_file_system_kms_key_id:(home_efs_file_system_kms_key_id_ : kms_key_id option)
    ?app_network_access_type:(app_network_access_type_ : app_network_access_type option)
    ?tags:(tags_ : tag_list option) ?vpc_id:(vpc_id_ : vpc_id option)
    ?subnet_ids:(subnet_ids_ : subnets option)
    ?domain_settings:(domain_settings_ : domain_settings option)
    ~default_user_settings:(default_user_settings_ : user_settings)
    ~auth_mode:(auth_mode_ : auth_mode) ~domain_name:(domain_name_ : domain_name) () =
  ({
     default_space_settings = default_space_settings_;
     tag_propagation = tag_propagation_;
     home_efs_file_system_creation = home_efs_file_system_creation_;
     app_security_group_management = app_security_group_management_;
     kms_key_id = kms_key_id_;
     home_efs_file_system_kms_key_id = home_efs_file_system_kms_key_id_;
     app_network_access_type = app_network_access_type_;
     tags = tags_;
     vpc_id = vpc_id_;
     subnet_ids = subnet_ids_;
     domain_settings = domain_settings_;
     default_user_settings = default_user_settings_;
     auth_mode = auth_mode_;
     domain_name = domain_name_;
   }
    : create_domain_request)

let make_create_device_fleet_request
    ?enable_iot_role_alias:(enable_iot_role_alias_ : enable_iot_role_alias option)
    ?tags:(tags_ : tag_list option) ?description:(description_ : device_fleet_description option)
    ?role_arn:(role_arn_ : role_arn option) ~output_config:(output_config_ : edge_output_config)
    ~device_fleet_name:(device_fleet_name_ : entity_name) () =
  ({
     enable_iot_role_alias = enable_iot_role_alias_;
     tags = tags_;
     output_config = output_config_;
     description = description_;
     role_arn = role_arn_;
     device_fleet_name = device_fleet_name_;
   }
    : create_device_fleet_request)

let make_create_data_quality_job_definition_response
    ~job_definition_arn:(job_definition_arn_ : monitoring_job_definition_arn) () =
  ({ job_definition_arn = job_definition_arn_ } : create_data_quality_job_definition_response)

let make_create_data_quality_job_definition_request ?tags:(tags_ : tag_list option)
    ?stopping_condition:(stopping_condition_ : monitoring_stopping_condition option)
    ?network_config:(network_config_ : monitoring_network_config option)
    ?data_quality_baseline_config:
      (data_quality_baseline_config_ : data_quality_baseline_config option)
    ~role_arn:(role_arn_ : role_arn) ~job_resources:(job_resources_ : monitoring_resources)
    ~data_quality_job_output_config:(data_quality_job_output_config_ : monitoring_output_config)
    ~data_quality_job_input:(data_quality_job_input_ : data_quality_job_input)
    ~data_quality_app_specification:
      (data_quality_app_specification_ : data_quality_app_specification)
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name) () =
  ({
     tags = tags_;
     stopping_condition = stopping_condition_;
     role_arn = role_arn_;
     network_config = network_config_;
     job_resources = job_resources_;
     data_quality_job_output_config = data_quality_job_output_config_;
     data_quality_job_input = data_quality_job_input_;
     data_quality_app_specification = data_quality_app_specification_;
     data_quality_baseline_config = data_quality_baseline_config_;
     job_definition_name = job_definition_name_;
   }
    : create_data_quality_job_definition_request)

let make_create_context_response ?context_arn:(context_arn_ : context_arn option) () =
  ({ context_arn = context_arn_ } : create_context_response)

let make_create_context_request ?tags:(tags_ : tag_list option)
    ?properties:(properties_ : lineage_entity_parameters option)
    ?description:(description_ : experiment_description option)
    ~context_type:(context_type_ : string256) ~source:(source_ : context_source)
    ~context_name:(context_name_ : context_name) () =
  ({
     tags = tags_;
     properties = properties_;
     description = description_;
     context_type = context_type_;
     source = source_;
     context_name = context_name_;
   }
    : create_context_request)

let make_create_compute_quota_response ~compute_quota_id:(compute_quota_id_ : compute_quota_id)
    ~compute_quota_arn:(compute_quota_arn_ : compute_quota_arn) () =
  ({ compute_quota_id = compute_quota_id_; compute_quota_arn = compute_quota_arn_ }
    : create_compute_quota_response)

let make_create_compute_quota_request ?tags:(tags_ : tag_list option)
    ?activation_state:(activation_state_ : activation_state option)
    ?description:(description_ : entity_description option)
    ~compute_quota_target:(compute_quota_target_ : compute_quota_target)
    ~compute_quota_config:(compute_quota_config_ : compute_quota_config)
    ~cluster_arn:(cluster_arn_ : cluster_arn) ~name:(name_ : entity_name) () =
  ({
     tags = tags_;
     activation_state = activation_state_;
     compute_quota_target = compute_quota_target_;
     compute_quota_config = compute_quota_config_;
     cluster_arn = cluster_arn_;
     description = description_;
     name = name_;
   }
    : create_compute_quota_request)

let make_create_compilation_job_response
    ~compilation_job_arn:(compilation_job_arn_ : compilation_job_arn) () =
  ({ compilation_job_arn = compilation_job_arn_ } : create_compilation_job_response)

let make_create_compilation_job_request ?tags:(tags_ : tag_list option)
    ?vpc_config:(vpc_config_ : neo_vpc_config option)
    ?input_config:(input_config_ : input_config option)
    ?model_package_version_arn:(model_package_version_arn_ : model_package_arn option)
    ~stopping_condition:(stopping_condition_ : stopping_condition)
    ~output_config:(output_config_ : output_config) ~role_arn:(role_arn_ : role_arn)
    ~compilation_job_name:(compilation_job_name_ : entity_name) () =
  ({
     tags = tags_;
     stopping_condition = stopping_condition_;
     vpc_config = vpc_config_;
     output_config = output_config_;
     input_config = input_config_;
     model_package_version_arn = model_package_version_arn_;
     role_arn = role_arn_;
     compilation_job_name = compilation_job_name_;
   }
    : create_compilation_job_request)

let make_create_code_repository_output
    ~code_repository_arn:(code_repository_arn_ : code_repository_arn) () =
  ({ code_repository_arn = code_repository_arn_ } : create_code_repository_output)

let make_create_code_repository_input ?tags:(tags_ : tag_list option)
    ~git_config:(git_config_ : git_config)
    ~code_repository_name:(code_repository_name_ : entity_name) () =
  ({ tags = tags_; git_config = git_config_; code_repository_name = code_repository_name_ }
    : create_code_repository_input)

let make_create_cluster_scheduler_config_response
    ~cluster_scheduler_config_id:(cluster_scheduler_config_id_ : cluster_scheduler_config_id)
    ~cluster_scheduler_config_arn:(cluster_scheduler_config_arn_ : cluster_scheduler_config_arn) ()
    =
  ({
     cluster_scheduler_config_id = cluster_scheduler_config_id_;
     cluster_scheduler_config_arn = cluster_scheduler_config_arn_;
   }
    : create_cluster_scheduler_config_response)

let make_create_cluster_scheduler_config_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : entity_description option)
    ~scheduler_config:(scheduler_config_ : scheduler_config)
    ~cluster_arn:(cluster_arn_ : cluster_arn) ~name:(name_ : entity_name) () =
  ({
     tags = tags_;
     description = description_;
     scheduler_config = scheduler_config_;
     cluster_arn = cluster_arn_;
     name = name_;
   }
    : create_cluster_scheduler_config_request)

let make_create_cluster_response ~cluster_arn:(cluster_arn_ : cluster_arn) () =
  ({ cluster_arn = cluster_arn_ } : create_cluster_response)

let make_create_cluster_request ?auto_scaling:(auto_scaling_ : cluster_auto_scaling_config option)
    ?cluster_role:(cluster_role_ : role_arn option)
    ?node_provisioning_mode:(node_provisioning_mode_ : cluster_node_provisioning_mode option)
    ?tiered_storage_config:(tiered_storage_config_ : cluster_tiered_storage_config option)
    ?node_recovery:(node_recovery_ : cluster_node_recovery option)
    ?orchestrator:(orchestrator_ : cluster_orchestrator option) ?tags:(tags_ : tag_list option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?restricted_instance_groups_config:
      (restricted_instance_groups_config_ : cluster_restricted_instance_groups_config option)
    ?restricted_instance_groups:
      (restricted_instance_groups_ : cluster_restricted_instance_group_specifications option)
    ?instance_groups:(instance_groups_ : cluster_instance_group_specifications option)
    ~cluster_name:(cluster_name_ : cluster_name) () =
  ({
     auto_scaling = auto_scaling_;
     cluster_role = cluster_role_;
     node_provisioning_mode = node_provisioning_mode_;
     tiered_storage_config = tiered_storage_config_;
     node_recovery = node_recovery_;
     orchestrator = orchestrator_;
     tags = tags_;
     vpc_config = vpc_config_;
     restricted_instance_groups_config = restricted_instance_groups_config_;
     restricted_instance_groups = restricted_instance_groups_;
     instance_groups = instance_groups_;
     cluster_name = cluster_name_;
   }
    : create_cluster_request)

let make_create_auto_ml_job_v2_response ~auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn) () =
  ({ auto_ml_job_arn = auto_ml_job_arn_ } : create_auto_ml_job_v2_response)

let make_create_auto_ml_job_v2_request
    ?auto_ml_compute_config:(auto_ml_compute_config_ : auto_ml_compute_config option)
    ?data_split_config:(data_split_config_ : auto_ml_data_split_config option)
    ?model_deploy_config:(model_deploy_config_ : model_deploy_config option)
    ?auto_ml_job_objective:(auto_ml_job_objective_ : auto_ml_job_objective option)
    ?security_config:(security_config_ : auto_ml_security_config option)
    ?tags:(tags_ : tag_list option) ~role_arn:(role_arn_ : role_arn)
    ~auto_ml_problem_type_config:(auto_ml_problem_type_config_ : auto_ml_problem_type_config)
    ~output_data_config:(output_data_config_ : auto_ml_output_data_config)
    ~auto_ml_job_input_data_config:(auto_ml_job_input_data_config_ : auto_ml_job_input_data_config)
    ~auto_ml_job_name:(auto_ml_job_name_ : auto_ml_job_name) () =
  ({
     auto_ml_compute_config = auto_ml_compute_config_;
     data_split_config = data_split_config_;
     model_deploy_config = model_deploy_config_;
     auto_ml_job_objective = auto_ml_job_objective_;
     security_config = security_config_;
     tags = tags_;
     role_arn = role_arn_;
     auto_ml_problem_type_config = auto_ml_problem_type_config_;
     output_data_config = output_data_config_;
     auto_ml_job_input_data_config = auto_ml_job_input_data_config_;
     auto_ml_job_name = auto_ml_job_name_;
   }
    : create_auto_ml_job_v2_request)

let make_create_auto_ml_job_response ~auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn) () =
  ({ auto_ml_job_arn = auto_ml_job_arn_ } : create_auto_ml_job_response)

let make_create_auto_ml_job_request
    ?model_deploy_config:(model_deploy_config_ : model_deploy_config option)
    ?tags:(tags_ : tag_list option)
    ?generate_candidate_definitions_only:
      (generate_candidate_definitions_only_ : generate_candidate_definitions_only option)
    ?auto_ml_job_config:(auto_ml_job_config_ : auto_ml_job_config option)
    ?auto_ml_job_objective:(auto_ml_job_objective_ : auto_ml_job_objective option)
    ?problem_type:(problem_type_ : problem_type option) ~role_arn:(role_arn_ : role_arn)
    ~output_data_config:(output_data_config_ : auto_ml_output_data_config)
    ~input_data_config:(input_data_config_ : auto_ml_input_data_config)
    ~auto_ml_job_name:(auto_ml_job_name_ : auto_ml_job_name) () =
  ({
     model_deploy_config = model_deploy_config_;
     tags = tags_;
     generate_candidate_definitions_only = generate_candidate_definitions_only_;
     role_arn = role_arn_;
     auto_ml_job_config = auto_ml_job_config_;
     auto_ml_job_objective = auto_ml_job_objective_;
     problem_type = problem_type_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     auto_ml_job_name = auto_ml_job_name_;
   }
    : create_auto_ml_job_request)

let make_create_artifact_response ?artifact_arn:(artifact_arn_ : artifact_arn option) () =
  ({ artifact_arn = artifact_arn_ } : create_artifact_response)

let make_create_artifact_request ?tags:(tags_ : tag_list option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?properties:(properties_ : artifact_properties option)
    ?artifact_name:(artifact_name_ : experiment_entity_name option)
    ~artifact_type:(artifact_type_ : string256) ~source:(source_ : artifact_source) () =
  ({
     tags = tags_;
     metadata_properties = metadata_properties_;
     properties = properties_;
     artifact_type = artifact_type_;
     source = source_;
     artifact_name = artifact_name_;
   }
    : create_artifact_request)

let make_create_app_image_config_response
    ?app_image_config_arn:(app_image_config_arn_ : app_image_config_arn option) () =
  ({ app_image_config_arn = app_image_config_arn_ } : create_app_image_config_response)

let make_create_app_image_config_request
    ?code_editor_app_image_config:
      (code_editor_app_image_config_ : code_editor_app_image_config option)
    ?jupyter_lab_app_image_config:
      (jupyter_lab_app_image_config_ : jupyter_lab_app_image_config option)
    ?kernel_gateway_image_config:(kernel_gateway_image_config_ : kernel_gateway_image_config option)
    ?tags:(tags_ : tag_list option)
    ~app_image_config_name:(app_image_config_name_ : app_image_config_name) () =
  ({
     code_editor_app_image_config = code_editor_app_image_config_;
     jupyter_lab_app_image_config = jupyter_lab_app_image_config_;
     kernel_gateway_image_config = kernel_gateway_image_config_;
     tags = tags_;
     app_image_config_name = app_image_config_name_;
   }
    : create_app_image_config_request)

let make_create_app_response ?app_arn:(app_arn_ : app_arn option) () =
  ({ app_arn = app_arn_ } : create_app_response)

let make_create_app_request ?recovery_mode:(recovery_mode_ : boolean_ option)
    ?resource_spec:(resource_spec_ : resource_spec option) ?tags:(tags_ : tag_list option)
    ?space_name:(space_name_ : space_name option)
    ?user_profile_name:(user_profile_name_ : user_profile_name option)
    ~app_name:(app_name_ : app_name) ~app_type:(app_type_ : app_type)
    ~domain_id:(domain_id_ : domain_id) () =
  ({
     recovery_mode = recovery_mode_;
     resource_spec = resource_spec_;
     tags = tags_;
     app_name = app_name_;
     app_type = app_type_;
     space_name = space_name_;
     user_profile_name = user_profile_name_;
     domain_id = domain_id_;
   }
    : create_app_request)

let make_create_algorithm_output ~algorithm_arn:(algorithm_arn_ : algorithm_arn) () =
  ({ algorithm_arn = algorithm_arn_ } : create_algorithm_output)

let make_create_algorithm_input ?tags:(tags_ : tag_list option)
    ?certify_for_marketplace:(certify_for_marketplace_ : certify_for_marketplace option)
    ?validation_specification:
      (validation_specification_ : algorithm_validation_specification option)
    ?inference_specification:(inference_specification_ : inference_specification option)
    ?algorithm_description:(algorithm_description_ : entity_description option)
    ~training_specification:(training_specification_ : training_specification)
    ~algorithm_name:(algorithm_name_ : entity_name) () =
  ({
     tags = tags_;
     certify_for_marketplace = certify_for_marketplace_;
     validation_specification = validation_specification_;
     inference_specification = inference_specification_;
     training_specification = training_specification_;
     algorithm_description = algorithm_description_;
     algorithm_name = algorithm_name_;
   }
    : create_algorithm_input)

let make_create_ai_workload_config_response
    ~ai_workload_config_arn:(ai_workload_config_arn_ : ai_workload_config_arn) () =
  ({ ai_workload_config_arn = ai_workload_config_arn_ } : create_ai_workload_config_response)

let make_create_ai_workload_config_request ?tags:(tags_ : tag_list option)
    ?ai_workload_configs:(ai_workload_configs_ : ai_workload_configs option)
    ?dataset_config:(dataset_config_ : ai_dataset_config option)
    ~ai_workload_config_name:(ai_workload_config_name_ : ai_entity_name) () =
  ({
     tags = tags_;
     ai_workload_configs = ai_workload_configs_;
     dataset_config = dataset_config_;
     ai_workload_config_name = ai_workload_config_name_;
   }
    : create_ai_workload_config_request)

let make_create_ai_recommendation_job_response
    ~ai_recommendation_job_arn:(ai_recommendation_job_arn_ : ai_recommendation_job_arn) () =
  ({ ai_recommendation_job_arn = ai_recommendation_job_arn_ }
    : create_ai_recommendation_job_response)

let make_ai_recommendation_output_config ?mlflow_config:(mlflow_config_ : ai_mlflow_config option)
    ?model_package_group_identifier:
      (model_package_group_identifier_ : ai_resource_identifier option)
    ?s3_output_location:(s3_output_location_ : s3_uri option) () =
  ({
     mlflow_config = mlflow_config_;
     model_package_group_identifier = model_package_group_identifier_;
     s3_output_location = s3_output_location_;
   }
    : ai_recommendation_output_config)

let make_create_ai_recommendation_job_request ?tags:(tags_ : tag_list option)
    ?compute_spec:(compute_spec_ : ai_recommendation_compute_spec option)
    ?optimize_model:(optimize_model_ : ai_recommendation_allow_optimization option)
    ?inference_specification:
      (inference_specification_ : ai_recommendation_inference_specification option)
    ~role_arn:(role_arn_ : role_arn)
    ~performance_target:(performance_target_ : ai_recommendation_performance_target)
    ~ai_workload_config_identifier:(ai_workload_config_identifier_ : ai_resource_identifier)
    ~output_config:(output_config_ : ai_recommendation_output_config)
    ~model_source:(model_source_ : ai_model_source)
    ~ai_recommendation_job_name:(ai_recommendation_job_name_ : ai_entity_name) () =
  ({
     tags = tags_;
     compute_spec = compute_spec_;
     optimize_model = optimize_model_;
     inference_specification = inference_specification_;
     role_arn = role_arn_;
     performance_target = performance_target_;
     ai_workload_config_identifier = ai_workload_config_identifier_;
     output_config = output_config_;
     model_source = model_source_;
     ai_recommendation_job_name = ai_recommendation_job_name_;
   }
    : create_ai_recommendation_job_request)

let make_create_ai_benchmark_job_response
    ~ai_benchmark_job_arn:(ai_benchmark_job_arn_ : ai_benchmark_job_arn) () =
  ({ ai_benchmark_job_arn = ai_benchmark_job_arn_ } : create_ai_benchmark_job_response)

let make_ai_benchmark_output_config ?mlflow_config:(mlflow_config_ : ai_mlflow_config option)
    ~s3_output_location:(s3_output_location_ : s3_uri) () =
  ({ mlflow_config = mlflow_config_; s3_output_location = s3_output_location_ }
    : ai_benchmark_output_config)

let make_create_ai_benchmark_job_request ?tags:(tags_ : tag_list option)
    ?network_config:(network_config_ : ai_benchmark_network_config option)
    ~role_arn:(role_arn_ : role_arn)
    ~ai_workload_config_identifier:(ai_workload_config_identifier_ : ai_resource_identifier)
    ~output_config:(output_config_ : ai_benchmark_output_config)
    ~benchmark_target:(benchmark_target_ : ai_benchmark_target)
    ~ai_benchmark_job_name:(ai_benchmark_job_name_ : ai_entity_name) () =
  ({
     tags = tags_;
     network_config = network_config_;
     role_arn = role_arn_;
     ai_workload_config_identifier = ai_workload_config_identifier_;
     output_config = output_config_;
     benchmark_target = benchmark_target_;
     ai_benchmark_job_name = ai_benchmark_job_name_;
   }
    : create_ai_benchmark_job_request)

let make_create_action_response ?action_arn:(action_arn_ : action_arn option) () =
  ({ action_arn = action_arn_ } : create_action_response)

let make_create_action_request ?tags:(tags_ : tag_list option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?properties:(properties_ : lineage_entity_parameters option)
    ?status:(status_ : action_status option)
    ?description:(description_ : experiment_description option)
    ~action_type:(action_type_ : string256) ~source:(source_ : action_source)
    ~action_name:(action_name_ : experiment_entity_name) () =
  ({
     tags = tags_;
     metadata_properties = metadata_properties_;
     properties = properties_;
     status = status_;
     description = description_;
     action_type = action_type_;
     source = source_;
     action_name = action_name_;
   }
    : create_action_request)

let make_batch_replace_cluster_nodes_error ~message:(message_ : string_)
    ~error_code:(error_code_ : batch_replace_cluster_nodes_error_code)
    ~node_id:(node_id_ : cluster_node_id) () =
  ({ message = message_; error_code = error_code_; node_id = node_id_ }
    : batch_replace_cluster_nodes_error)

let make_batch_replace_cluster_node_logical_ids_error ~message:(message_ : string_)
    ~error_code:(error_code_ : batch_replace_cluster_nodes_error_code)
    ~node_logical_id:(node_logical_id_ : cluster_node_logical_id) () =
  ({ message = message_; error_code = error_code_; node_logical_id = node_logical_id_ }
    : batch_replace_cluster_node_logical_ids_error)

let make_batch_replace_cluster_nodes_response
    ?successful_node_logical_ids:
      (successful_node_logical_ids_ : cluster_node_logical_id_list option)
    ?failed_node_logical_ids:
      (failed_node_logical_ids_ : batch_replace_cluster_node_logical_ids_errors option)
    ?failed:(failed_ : batch_replace_cluster_nodes_errors option)
    ?successful:(successful_ : cluster_node_ids option) () =
  ({
     successful_node_logical_ids = successful_node_logical_ids_;
     failed_node_logical_ids = failed_node_logical_ids_;
     failed = failed_;
     successful = successful_;
   }
    : batch_replace_cluster_nodes_response)

let make_batch_replace_cluster_nodes_request
    ?node_logical_ids:(node_logical_ids_ : cluster_node_logical_id_list option)
    ?node_ids:(node_ids_ : cluster_node_ids option)
    ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({ node_logical_ids = node_logical_ids_; node_ids = node_ids_; cluster_name = cluster_name_ }
    : batch_replace_cluster_nodes_request)

let make_batch_reboot_cluster_nodes_error ~message:(message_ : string_)
    ~error_code:(error_code_ : batch_reboot_cluster_nodes_error_code)
    ~node_id:(node_id_ : cluster_node_id) () =
  ({ message = message_; error_code = error_code_; node_id = node_id_ }
    : batch_reboot_cluster_nodes_error)

let make_batch_reboot_cluster_node_logical_ids_error ~message:(message_ : string_)
    ~error_code:(error_code_ : batch_reboot_cluster_nodes_error_code)
    ~node_logical_id:(node_logical_id_ : cluster_node_logical_id) () =
  ({ message = message_; error_code = error_code_; node_logical_id = node_logical_id_ }
    : batch_reboot_cluster_node_logical_ids_error)

let make_batch_reboot_cluster_nodes_response
    ?successful_node_logical_ids:
      (successful_node_logical_ids_ : cluster_node_logical_id_list option)
    ?failed_node_logical_ids:
      (failed_node_logical_ids_ : batch_reboot_cluster_node_logical_ids_errors option)
    ?failed:(failed_ : batch_reboot_cluster_nodes_errors option)
    ?successful:(successful_ : cluster_node_ids option) () =
  ({
     successful_node_logical_ids = successful_node_logical_ids_;
     failed_node_logical_ids = failed_node_logical_ids_;
     failed = failed_;
     successful = successful_;
   }
    : batch_reboot_cluster_nodes_response)

let make_batch_reboot_cluster_nodes_request
    ?node_logical_ids:(node_logical_ids_ : cluster_node_logical_id_list option)
    ?node_ids:(node_ids_ : cluster_node_ids option)
    ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({ node_logical_ids = node_logical_ids_; node_ids = node_ids_; cluster_name = cluster_name_ }
    : batch_reboot_cluster_nodes_request)

let make_batch_describe_model_package_summary
    ?model_package_registration_type:
      (model_package_registration_type_ : model_package_registration_type option)
    ?model_approval_status:(model_approval_status_ : model_approval_status option)
    ?model_package_description:(model_package_description_ : entity_description option)
    ?model_package_version:(model_package_version_ : model_package_version option)
    ~model_package_status:(model_package_status_ : model_package_status)
    ~inference_specification:(inference_specification_ : inference_specification)
    ~creation_time:(creation_time_ : creation_time)
    ~model_package_arn:(model_package_arn_ : model_package_arn)
    ~model_package_group_name:(model_package_group_name_ : entity_name) () =
  ({
     model_package_registration_type = model_package_registration_type_;
     model_approval_status = model_approval_status_;
     model_package_status = model_package_status_;
     inference_specification = inference_specification_;
     creation_time = creation_time_;
     model_package_description = model_package_description_;
     model_package_arn = model_package_arn_;
     model_package_version = model_package_version_;
     model_package_group_name = model_package_group_name_;
   }
    : batch_describe_model_package_summary)

let make_batch_describe_model_package_error ~error_response:(error_response_ : string_)
    ~error_code:(error_code_ : string_) () =
  ({ error_response = error_response_; error_code = error_code_ }
    : batch_describe_model_package_error)

let make_batch_describe_model_package_output
    ?batch_describe_model_package_error_map:
      (batch_describe_model_package_error_map_ : batch_describe_model_package_error_map option)
    ?model_package_summaries:(model_package_summaries_ : model_package_summaries option) () =
  ({
     batch_describe_model_package_error_map = batch_describe_model_package_error_map_;
     model_package_summaries = model_package_summaries_;
   }
    : batch_describe_model_package_output)

let make_batch_describe_model_package_input
    ~model_package_arn_list:(model_package_arn_list_ : model_package_arn_list) () =
  ({ model_package_arn_list = model_package_arn_list_ } : batch_describe_model_package_input)

let make_batch_delete_cluster_nodes_error ~node_id:(node_id_ : cluster_node_id)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~code:(code_ : batch_delete_cluster_nodes_error_code) () =
  ({ node_id = node_id_; message = message_; code = code_ } : batch_delete_cluster_nodes_error)

let make_batch_delete_cluster_node_logical_ids_error
    ~node_logical_id:(node_logical_id_ : cluster_node_logical_id) ~message:(message_ : string_)
    ~code:(code_ : batch_delete_cluster_nodes_error_code) () =
  ({ node_logical_id = node_logical_id_; message = message_; code = code_ }
    : batch_delete_cluster_node_logical_ids_error)

let make_batch_delete_cluster_nodes_response
    ?successful_node_logical_ids:
      (successful_node_logical_ids_ : cluster_node_logical_id_list option)
    ?failed_node_logical_ids:
      (failed_node_logical_ids_ : batch_delete_cluster_node_logical_ids_error_list option)
    ?successful:(successful_ : cluster_node_ids option)
    ?failed:(failed_ : batch_delete_cluster_nodes_error_list option) () =
  ({
     successful_node_logical_ids = successful_node_logical_ids_;
     failed_node_logical_ids = failed_node_logical_ids_;
     successful = successful_;
     failed = failed_;
   }
    : batch_delete_cluster_nodes_response)

let make_batch_delete_cluster_nodes_request
    ?node_logical_ids:(node_logical_ids_ : cluster_node_logical_id_list option)
    ?node_ids:(node_ids_ : cluster_node_ids option)
    ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({ node_logical_ids = node_logical_ids_; node_ids = node_ids_; cluster_name = cluster_name_ }
    : batch_delete_cluster_nodes_request)

let make_batch_add_cluster_nodes_error ?message:(message_ : string_ option)
    ?instance_types:(instance_types_ : cluster_instance_types option)
    ?availability_zones:(availability_zones_ : cluster_availability_zones option)
    ~failed_count:(failed_count_ : batch_add_failure_count)
    ~error_code:(error_code_ : batch_add_cluster_nodes_error_code)
    ~instance_group_name:(instance_group_name_ : instance_group_name) () =
  ({
     message = message_;
     instance_types = instance_types_;
     availability_zones = availability_zones_;
     failed_count = failed_count_;
     error_code = error_code_;
     instance_group_name = instance_group_name_;
   }
    : batch_add_cluster_nodes_error)

let make_batch_add_cluster_nodes_response ~failed:(failed_ : batch_add_cluster_nodes_error_list)
    ~successful:(successful_ : node_addition_result_list) () =
  ({ failed = failed_; successful = successful_ } : batch_add_cluster_nodes_response)

let make_add_cluster_node_specification
    ?instance_types:(instance_types_ : cluster_instance_types option)
    ?availability_zones:(availability_zones_ : cluster_availability_zones option)
    ~increment_target_count_by:(increment_target_count_by_ : batch_add_increment_count)
    ~instance_group_name:(instance_group_name_ : cluster_instance_group_name) () =
  ({
     instance_types = instance_types_;
     availability_zones = availability_zones_;
     increment_target_count_by = increment_target_count_by_;
     instance_group_name = instance_group_name_;
   }
    : add_cluster_node_specification)

let make_batch_add_cluster_nodes_request ?client_token:(client_token_ : string_ option)
    ~nodes_to_add:(nodes_to_add_ : add_cluster_node_specification_list)
    ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({ nodes_to_add = nodes_to_add_; client_token = client_token_; cluster_name = cluster_name_ }
    : batch_add_cluster_nodes_request)

let make_attach_cluster_node_volume_response ~device_name:(device_name_ : volume_device_name)
    ~status:(status_ : volume_attachment_status) ~attach_time:(attach_time_ : timestamp)
    ~volume_id:(volume_id_ : volume_id) ~node_id:(node_id_ : cluster_node_id)
    ~cluster_arn:(cluster_arn_ : cluster_arn) () =
  ({
     device_name = device_name_;
     status = status_;
     attach_time = attach_time_;
     volume_id = volume_id_;
     node_id = node_id_;
     cluster_arn = cluster_arn_;
   }
    : attach_cluster_node_volume_response)

let make_attach_cluster_node_volume_request ~volume_id:(volume_id_ : volume_id)
    ~node_id:(node_id_ : cluster_node_id) ~cluster_arn:(cluster_arn_ : cluster_arn) () =
  ({ volume_id = volume_id_; node_id = node_id_; cluster_arn = cluster_arn_ }
    : attach_cluster_node_volume_request)

let make_associate_trial_component_response ?trial_arn:(trial_arn_ : trial_arn option)
    ?trial_component_arn:(trial_component_arn_ : trial_component_arn option) () =
  ({ trial_arn = trial_arn_; trial_component_arn = trial_component_arn_ }
    : associate_trial_component_response)

let make_associate_trial_component_request ~trial_name:(trial_name_ : experiment_entity_name)
    ~trial_component_name:(trial_component_name_ : experiment_entity_name) () =
  ({ trial_name = trial_name_; trial_component_name = trial_component_name_ }
    : associate_trial_component_request)

let make_add_tags_output ?tags:(tags_ : tag_list option) () = ({ tags = tags_ } : add_tags_output)

let make_add_tags_input ~tags:(tags_ : tag_list) ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : add_tags_input)

let make_add_association_response
    ?destination_arn:(destination_arn_ : association_entity_arn option)
    ?source_arn:(source_arn_ : association_entity_arn option) () =
  ({ destination_arn = destination_arn_; source_arn = source_arn_ } : add_association_response)

let make_add_association_request
    ?association_type:(association_type_ : association_edge_type option)
    ~destination_arn:(destination_arn_ : association_entity_arn)
    ~source_arn:(source_arn_ : association_entity_arn) () =
  ({
     association_type = association_type_;
     destination_arn = destination_arn_;
     source_arn = source_arn_;
   }
    : add_association_request)
