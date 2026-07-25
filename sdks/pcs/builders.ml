open Types

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : arn) ~tag_keys:(tag_keys_ : tag_keys)
    () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : arn) ~tags:(tags_ : request_tag_map) ()
    =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_list_tags_for_resource_response ?tags:(tags_ : response_tag_map option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_accounting
    ?default_purge_time_in_days:
      (default_purge_time_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~mode:(mode_ : accounting_mode) () =
  ({ default_purge_time_in_days = default_purge_time_in_days_; mode = mode_ } : accounting)

let make_accounting_request
    ?default_purge_time_in_days:
      (default_purge_time_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~mode:(mode_ : accounting_mode) () =
  ({ default_purge_time_in_days = default_purge_time_in_days_; mode = mode_ } : accounting_request)

let make_cgroup_custom_setting
    ~parameter_name:(parameter_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~parameter_value:(parameter_value_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ parameter_name = parameter_name_; parameter_value = parameter_value_ } : cgroup_custom_setting)

let make_error_info ?code:(code_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ code = code_; message = message_ } : error_info)

let make_endpoint
    ?public_ip_address:(public_ip_address_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ipv6_address:(ipv6_address_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~type_:(type__ : endpoint_type)
    ~private_ip_address:(private_ip_address_ : Smaws_Lib.Smithy_api.Types.string_)
    ~port:(port_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     type_ = type__;
     private_ip_address = private_ip_address_;
     public_ip_address = public_ip_address_;
     ipv6_address = ipv6_address_;
     port = port_;
   }
    : endpoint)

let make_networking ?subnet_ids:(subnet_ids_ : subnet_id_list option)
    ?security_group_ids:(security_group_ids_ : security_group_id_list option)
    ?network_type:(network_type_ : network_type option) () =
  ({
     subnet_ids = subnet_ids_;
     security_group_ids = security_group_ids_;
     network_type = network_type_;
   }
    : networking)

let make_slurm_rest ~mode:(mode_ : slurm_rest_mode) () = ({ mode = mode_ } : slurm_rest)

let make_jwt_key ~secret_arn:(secret_arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~secret_version:(secret_version_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ secret_arn = secret_arn_; secret_version = secret_version_ } : jwt_key)

let make_jwt_auth ?jwt_key:(jwt_key_ : jwt_key option) () = ({ jwt_key = jwt_key_ } : jwt_auth)

let make_slurm_auth_key ~secret_arn:(secret_arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~secret_version:(secret_version_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ secret_arn = secret_arn_; secret_version = secret_version_ } : slurm_auth_key)

let make_slurmdbd_custom_setting
    ~parameter_name:(parameter_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~parameter_value:(parameter_value_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ parameter_name = parameter_name_; parameter_value = parameter_value_ }
    : slurmdbd_custom_setting)

let make_slurm_custom_setting ~parameter_name:(parameter_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~parameter_value:(parameter_value_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ parameter_name = parameter_name_; parameter_value = parameter_value_ } : slurm_custom_setting)

let make_cluster_slurm_configuration
    ?scale_down_idle_time_in_seconds:
      (scale_down_idle_time_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?slurm_custom_settings:(slurm_custom_settings_ : slurm_custom_settings option)
    ?slurmdbd_custom_settings:(slurmdbd_custom_settings_ : slurmdbd_custom_settings option)
    ?cgroup_custom_settings:(cgroup_custom_settings_ : cgroup_custom_settings option)
    ?auth_key:(auth_key_ : slurm_auth_key option) ?jwt_auth:(jwt_auth_ : jwt_auth option)
    ?accounting:(accounting_ : accounting option) ?slurm_rest:(slurm_rest_ : slurm_rest option) () =
  ({
     scale_down_idle_time_in_seconds = scale_down_idle_time_in_seconds_;
     slurm_custom_settings = slurm_custom_settings_;
     slurmdbd_custom_settings = slurmdbd_custom_settings_;
     cgroup_custom_settings = cgroup_custom_settings_;
     auth_key = auth_key_;
     jwt_auth = jwt_auth_;
     accounting = accounting_;
     slurm_rest = slurm_rest_;
   }
    : cluster_slurm_configuration)

let make_scheduler ~type_:(type__ : scheduler_type)
    ~version:(version_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ type_ = type__; version = version_ } : scheduler)

let make_cluster ?slurm_configuration:(slurm_configuration_ : cluster_slurm_configuration option)
    ?endpoints:(endpoints_ : endpoints option) ?error_info:(error_info_ : error_info_list option)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~id:(id_ : Smaws_Lib.Smithy_api.Types.string_) ~arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~status:(status_ : cluster_status)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~scheduler:(scheduler_ : scheduler) ~size:(size_ : size) ~networking:(networking_ : networking)
    () =
  ({
     name = name_;
     id = id_;
     arn = arn_;
     status = status_;
     created_at = created_at_;
     modified_at = modified_at_;
     scheduler = scheduler_;
     size = size_;
     slurm_configuration = slurm_configuration_;
     networking = networking_;
     endpoints = endpoints_;
     error_info = error_info_;
   }
    : cluster)

let make_cluster_summary ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~id:(id_ : Smaws_Lib.Smithy_api.Types.string_) ~arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~status:(status_ : cluster_status) () =
  ({
     name = name_;
     id = id_;
     arn = arn_;
     created_at = created_at_;
     modified_at = modified_at_;
     status = status_;
   }
    : cluster_summary)

let make_slurm_rest_request ~mode:(mode_ : slurm_rest_mode) () =
  ({ mode = mode_ } : slurm_rest_request)

let make_cluster_slurm_configuration_request
    ?scale_down_idle_time_in_seconds:
      (scale_down_idle_time_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?slurm_custom_settings:(slurm_custom_settings_ : slurm_custom_settings option)
    ?slurmdbd_custom_settings:(slurmdbd_custom_settings_ : slurmdbd_custom_settings option)
    ?cgroup_custom_settings:(cgroup_custom_settings_ : cgroup_custom_settings option)
    ?accounting:(accounting_ : accounting_request option)
    ?slurm_rest:(slurm_rest_ : slurm_rest_request option) () =
  ({
     scale_down_idle_time_in_seconds = scale_down_idle_time_in_seconds_;
     slurm_custom_settings = slurm_custom_settings_;
     slurmdbd_custom_settings = slurmdbd_custom_settings_;
     cgroup_custom_settings = cgroup_custom_settings_;
     accounting = accounting_;
     slurm_rest = slurm_rest_;
   }
    : cluster_slurm_configuration_request)

let make_compute_node_group_slurm_configuration
    ?scale_down_idle_time_in_seconds:
      (scale_down_idle_time_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?slurm_custom_settings:(slurm_custom_settings_ : slurm_custom_settings option) () =
  ({
     scale_down_idle_time_in_seconds = scale_down_idle_time_in_seconds_;
     slurm_custom_settings = slurm_custom_settings_;
   }
    : compute_node_group_slurm_configuration)

let make_spot_options ?allocation_strategy:(allocation_strategy_ : spot_allocation_strategy option)
    () =
  ({ allocation_strategy = allocation_strategy_ } : spot_options)

let make_instance_config ?instance_type:(instance_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    () =
  ({ instance_type = instance_type_ } : instance_config)

let make_scaling_configuration
    ~min_instance_count:(min_instance_count_ : Smaws_Lib.Smithy_api.Types.integer)
    ~max_instance_count:(max_instance_count_ : Smaws_Lib.Smithy_api.Types.integer) () =
  ({ min_instance_count = min_instance_count_; max_instance_count = max_instance_count_ }
    : scaling_configuration)

let make_custom_launch_template ~id:(id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~version:(version_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ id = id_; version = version_ } : custom_launch_template)

let make_compute_node_group ?ami_id:(ami_id_ : ami_id option)
    ?purchase_option:(purchase_option_ : purchase_option option)
    ?spot_options:(spot_options_ : spot_options option)
    ?slurm_configuration:(slurm_configuration_ : compute_node_group_slurm_configuration option)
    ?error_info:(error_info_ : error_info_list option) ~name:(name_ : compute_node_group_name)
    ~id:(id_ : Smaws_Lib.Smithy_api.Types.string_) ~arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~cluster_id:(cluster_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~status:(status_ : compute_node_group_status) ~subnet_ids:(subnet_ids_ : subnet_id_list)
    ~custom_launch_template:(custom_launch_template_ : custom_launch_template)
    ~iam_instance_profile_arn:(iam_instance_profile_arn_ : instance_profile_arn)
    ~scaling_configuration:(scaling_configuration_ : scaling_configuration)
    ~instance_configs:(instance_configs_ : instance_list) () =
  ({
     name = name_;
     id = id_;
     arn = arn_;
     cluster_id = cluster_id_;
     created_at = created_at_;
     modified_at = modified_at_;
     status = status_;
     ami_id = ami_id_;
     subnet_ids = subnet_ids_;
     purchase_option = purchase_option_;
     custom_launch_template = custom_launch_template_;
     iam_instance_profile_arn = iam_instance_profile_arn_;
     scaling_configuration = scaling_configuration_;
     instance_configs = instance_configs_;
     spot_options = spot_options_;
     slurm_configuration = slurm_configuration_;
     error_info = error_info_;
   }
    : compute_node_group)

let make_compute_node_group_configuration
    ?compute_node_group_id:(compute_node_group_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ compute_node_group_id = compute_node_group_id_ } : compute_node_group_configuration)

let make_compute_node_group_summary ~name:(name_ : compute_node_group_name)
    ~id:(id_ : Smaws_Lib.Smithy_api.Types.string_) ~arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~cluster_id:(cluster_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~status:(status_ : compute_node_group_status) () =
  ({
     name = name_;
     id = id_;
     arn = arn_;
     cluster_id = cluster_id_;
     created_at = created_at_;
     modified_at = modified_at_;
     status = status_;
   }
    : compute_node_group_summary)

let make_compute_node_group_slurm_configuration_request
    ?scale_down_idle_time_in_seconds:
      (scale_down_idle_time_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?slurm_custom_settings:(slurm_custom_settings_ : slurm_custom_settings option) () =
  ({
     scale_down_idle_time_in_seconds = scale_down_idle_time_in_seconds_;
     slurm_custom_settings = slurm_custom_settings_;
   }
    : compute_node_group_slurm_configuration_request)

let make_validation_exception_field ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ name = name_; message = message_ } : validation_exception_field)

let make_create_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : create_cluster_response)

let make_networking_request ?subnet_ids:(subnet_ids_ : subnet_id_list option)
    ?security_group_ids:(security_group_ids_ : security_group_id_list option)
    ?network_type:(network_type_ : network_type option) () =
  ({
     subnet_ids = subnet_ids_;
     security_group_ids = security_group_ids_;
     network_type = network_type_;
   }
    : networking_request)

let make_scheduler_request ~type_:(type__ : scheduler_type)
    ~version:(version_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ type_ = type__; version = version_ } : scheduler_request)

let make_create_cluster_request
    ?slurm_configuration:(slurm_configuration_ : cluster_slurm_configuration_request option)
    ?client_token:(client_token_ : sb_client_token option) ?tags:(tags_ : request_tag_map option)
    ~cluster_name:(cluster_name_ : cluster_name) ~scheduler:(scheduler_ : scheduler_request)
    ~size:(size_ : size) ~networking:(networking_ : networking_request) () =
  ({
     cluster_name = cluster_name_;
     scheduler = scheduler_;
     size = size_;
     networking = networking_;
     slurm_configuration = slurm_configuration_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_cluster_request)

let make_create_compute_node_group_response
    ?compute_node_group:(compute_node_group_ : compute_node_group option) () =
  ({ compute_node_group = compute_node_group_ } : create_compute_node_group_response)

let make_scaling_configuration_request
    ~min_instance_count:(min_instance_count_ : Smaws_Lib.Smithy_api.Types.integer)
    ~max_instance_count:(max_instance_count_ : Smaws_Lib.Smithy_api.Types.integer) () =
  ({ min_instance_count = min_instance_count_; max_instance_count = max_instance_count_ }
    : scaling_configuration_request)

let make_create_compute_node_group_request ?ami_id:(ami_id_ : ami_id option)
    ?purchase_option:(purchase_option_ : purchase_option option)
    ?spot_options:(spot_options_ : spot_options option)
    ?slurm_configuration:
      (slurm_configuration_ : compute_node_group_slurm_configuration_request option)
    ?client_token:(client_token_ : sb_client_token option) ?tags:(tags_ : request_tag_map option)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier)
    ~compute_node_group_name:(compute_node_group_name_ : compute_node_group_name)
    ~subnet_ids:(subnet_ids_ : string_list)
    ~custom_launch_template:(custom_launch_template_ : custom_launch_template)
    ~iam_instance_profile_arn:(iam_instance_profile_arn_ : instance_profile_arn)
    ~scaling_configuration:(scaling_configuration_ : scaling_configuration_request)
    ~instance_configs:(instance_configs_ : instance_list) () =
  ({
     cluster_identifier = cluster_identifier_;
     compute_node_group_name = compute_node_group_name_;
     ami_id = ami_id_;
     subnet_ids = subnet_ids_;
     purchase_option = purchase_option_;
     custom_launch_template = custom_launch_template_;
     iam_instance_profile_arn = iam_instance_profile_arn_;
     scaling_configuration = scaling_configuration_;
     instance_configs = instance_configs_;
     spot_options = spot_options_;
     slurm_configuration = slurm_configuration_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_compute_node_group_request)

let make_queue_slurm_configuration
    ?slurm_custom_settings:(slurm_custom_settings_ : slurm_custom_settings option) () =
  ({ slurm_custom_settings = slurm_custom_settings_ } : queue_slurm_configuration)

let make_queue ?slurm_configuration:(slurm_configuration_ : queue_slurm_configuration option)
    ?error_info:(error_info_ : error_info_list option) ~name:(name_ : queue_name)
    ~id:(id_ : Smaws_Lib.Smithy_api.Types.string_) ~arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~cluster_id:(cluster_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~status:(status_ : queue_status)
    ~compute_node_group_configurations:
      (compute_node_group_configurations_ : compute_node_group_configuration_list) () =
  ({
     name = name_;
     id = id_;
     arn = arn_;
     cluster_id = cluster_id_;
     created_at = created_at_;
     modified_at = modified_at_;
     status = status_;
     compute_node_group_configurations = compute_node_group_configurations_;
     slurm_configuration = slurm_configuration_;
     error_info = error_info_;
   }
    : queue)

let make_create_queue_response ?queue:(queue_ : queue option) () =
  ({ queue = queue_ } : create_queue_response)

let make_queue_slurm_configuration_request
    ?slurm_custom_settings:(slurm_custom_settings_ : slurm_custom_settings option) () =
  ({ slurm_custom_settings = slurm_custom_settings_ } : queue_slurm_configuration_request)

let make_create_queue_request
    ?compute_node_group_configurations:
      (compute_node_group_configurations_ : compute_node_group_configuration_list option)
    ?slurm_configuration:(slurm_configuration_ : queue_slurm_configuration_request option)
    ?client_token:(client_token_ : sb_client_token option) ?tags:(tags_ : request_tag_map option)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier)
    ~queue_name:(queue_name_ : queue_name) () =
  ({
     cluster_identifier = cluster_identifier_;
     queue_name = queue_name_;
     compute_node_group_configurations = compute_node_group_configurations_;
     slurm_configuration = slurm_configuration_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_queue_request)

let make_delete_cluster_response () = (() : unit)

let make_delete_cluster_request ?client_token:(client_token_ : sb_client_token option)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier) () =
  ({ cluster_identifier = cluster_identifier_; client_token = client_token_ }
    : delete_cluster_request)

let make_delete_compute_node_group_response () = (() : unit)

let make_delete_compute_node_group_request ?client_token:(client_token_ : sb_client_token option)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier)
    ~compute_node_group_identifier:(compute_node_group_identifier_ : compute_node_group_identifier)
    () =
  ({
     cluster_identifier = cluster_identifier_;
     compute_node_group_identifier = compute_node_group_identifier_;
     client_token = client_token_;
   }
    : delete_compute_node_group_request)

let make_delete_queue_response () = (() : unit)

let make_delete_queue_request ?client_token:(client_token_ : sb_client_token option)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier)
    ~queue_identifier:(queue_identifier_ : queue_identifier) () =
  ({
     cluster_identifier = cluster_identifier_;
     queue_identifier = queue_identifier_;
     client_token = client_token_;
   }
    : delete_queue_request)

let make_get_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : get_cluster_response)

let make_get_cluster_request ~cluster_identifier:(cluster_identifier_ : cluster_identifier) () =
  ({ cluster_identifier = cluster_identifier_ } : get_cluster_request)

let make_get_compute_node_group_response
    ?compute_node_group:(compute_node_group_ : compute_node_group option) () =
  ({ compute_node_group = compute_node_group_ } : get_compute_node_group_response)

let make_get_compute_node_group_request
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier)
    ~compute_node_group_identifier:(compute_node_group_identifier_ : compute_node_group_identifier)
    () =
  ({
     cluster_identifier = cluster_identifier_;
     compute_node_group_identifier = compute_node_group_identifier_;
   }
    : get_compute_node_group_request)

let make_get_queue_response ?queue:(queue_ : queue option) () =
  ({ queue = queue_ } : get_queue_response)

let make_get_queue_request ~cluster_identifier:(cluster_identifier_ : cluster_identifier)
    ~queue_identifier:(queue_identifier_ : queue_identifier) () =
  ({ cluster_identifier = cluster_identifier_; queue_identifier = queue_identifier_ }
    : get_queue_request)

let make_list_clusters_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~clusters:(clusters_ : cluster_list) () =
  ({ clusters = clusters_; next_token = next_token_ } : list_clusters_response)

let make_list_clusters_request ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_clusters_request)

let make_list_compute_node_groups_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~compute_node_groups:(compute_node_groups_ : compute_node_group_list) () =
  ({ compute_node_groups = compute_node_groups_; next_token = next_token_ }
    : list_compute_node_groups_response)

let make_list_compute_node_groups_request
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : max_results option)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier) () =
  ({
     cluster_identifier = cluster_identifier_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_compute_node_groups_request)

let make_queue_summary ~name:(name_ : queue_name) ~id:(id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~cluster_id:(cluster_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~status:(status_ : queue_status) () =
  ({
     name = name_;
     id = id_;
     arn = arn_;
     cluster_id = cluster_id_;
     created_at = created_at_;
     modified_at = modified_at_;
     status = status_;
   }
    : queue_summary)

let make_list_queues_response ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~queues:(queues_ : queue_list) () =
  ({ queues = queues_; next_token = next_token_ } : list_queues_response)

let make_list_queues_request ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : max_results option)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier) () =
  ({
     cluster_identifier = cluster_identifier_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_queues_request)

let make_register_compute_node_group_instance_response
    ~node_i_d:(node_i_d_ : Smaws_Lib.Smithy_api.Types.string_)
    ~shared_secret:(shared_secret_ : shared_secret) ~endpoints:(endpoints_ : endpoints) () =
  ({ node_i_d = node_i_d_; shared_secret = shared_secret_; endpoints = endpoints_ }
    : register_compute_node_group_instance_response)

let make_register_compute_node_group_instance_request
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier)
    ~bootstrap_id:(bootstrap_id_ : bootstrap_id) () =
  ({ cluster_identifier = cluster_identifier_; bootstrap_id = bootstrap_id_ }
    : register_compute_node_group_instance_request)

let make_update_accounting_request
    ?default_purge_time_in_days:
      (default_purge_time_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?mode:(mode_ : accounting_mode option) () =
  ({ default_purge_time_in_days = default_purge_time_in_days_; mode = mode_ }
    : update_accounting_request)

let make_update_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : update_cluster_response)

let make_update_scheduler_request ~version:(version_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ version = version_ } : update_scheduler_request)

let make_update_slurm_rest_request ?mode:(mode_ : slurm_rest_mode option) () =
  ({ mode = mode_ } : update_slurm_rest_request)

let make_update_cluster_slurm_configuration_request
    ?scale_down_idle_time_in_seconds:
      (scale_down_idle_time_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?slurm_custom_settings:(slurm_custom_settings_ : slurm_custom_settings option)
    ?slurmdbd_custom_settings:(slurmdbd_custom_settings_ : slurmdbd_custom_settings option)
    ?cgroup_custom_settings:(cgroup_custom_settings_ : cgroup_custom_settings option)
    ?accounting:(accounting_ : update_accounting_request option)
    ?slurm_rest:(slurm_rest_ : update_slurm_rest_request option) () =
  ({
     scale_down_idle_time_in_seconds = scale_down_idle_time_in_seconds_;
     slurm_custom_settings = slurm_custom_settings_;
     slurmdbd_custom_settings = slurmdbd_custom_settings_;
     cgroup_custom_settings = cgroup_custom_settings_;
     accounting = accounting_;
     slurm_rest = slurm_rest_;
   }
    : update_cluster_slurm_configuration_request)

let make_update_cluster_request ?client_token:(client_token_ : sb_client_token option)
    ?slurm_configuration:(slurm_configuration_ : update_cluster_slurm_configuration_request option)
    ?scheduler:(scheduler_ : update_scheduler_request option)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier) () =
  ({
     cluster_identifier = cluster_identifier_;
     client_token = client_token_;
     slurm_configuration = slurm_configuration_;
     scheduler = scheduler_;
   }
    : update_cluster_request)

let make_update_compute_node_group_response
    ?compute_node_group:(compute_node_group_ : compute_node_group option) () =
  ({ compute_node_group = compute_node_group_ } : update_compute_node_group_response)

let make_update_compute_node_group_slurm_configuration_request
    ?scale_down_idle_time_in_seconds:
      (scale_down_idle_time_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?slurm_custom_settings:(slurm_custom_settings_ : slurm_custom_settings option) () =
  ({
     scale_down_idle_time_in_seconds = scale_down_idle_time_in_seconds_;
     slurm_custom_settings = slurm_custom_settings_;
   }
    : update_compute_node_group_slurm_configuration_request)

let make_update_compute_node_group_request ?ami_id:(ami_id_ : ami_id option)
    ?subnet_ids:(subnet_ids_ : string_list option)
    ?custom_launch_template:(custom_launch_template_ : custom_launch_template option)
    ?purchase_option:(purchase_option_ : purchase_option option)
    ?spot_options:(spot_options_ : spot_options option)
    ?scaling_configuration:(scaling_configuration_ : scaling_configuration_request option)
    ?iam_instance_profile_arn:(iam_instance_profile_arn_ : instance_profile_arn option)
    ?slurm_configuration:
      (slurm_configuration_ : update_compute_node_group_slurm_configuration_request option)
    ?client_token:(client_token_ : sb_client_token option)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier)
    ~compute_node_group_identifier:(compute_node_group_identifier_ : compute_node_group_identifier)
    () =
  ({
     cluster_identifier = cluster_identifier_;
     compute_node_group_identifier = compute_node_group_identifier_;
     ami_id = ami_id_;
     subnet_ids = subnet_ids_;
     custom_launch_template = custom_launch_template_;
     purchase_option = purchase_option_;
     spot_options = spot_options_;
     scaling_configuration = scaling_configuration_;
     iam_instance_profile_arn = iam_instance_profile_arn_;
     slurm_configuration = slurm_configuration_;
     client_token = client_token_;
   }
    : update_compute_node_group_request)

let make_update_queue_response ?queue:(queue_ : queue option) () =
  ({ queue = queue_ } : update_queue_response)

let make_update_queue_slurm_configuration_request
    ?slurm_custom_settings:(slurm_custom_settings_ : slurm_custom_settings option) () =
  ({ slurm_custom_settings = slurm_custom_settings_ } : update_queue_slurm_configuration_request)

let make_update_queue_request
    ?compute_node_group_configurations:
      (compute_node_group_configurations_ : compute_node_group_configuration_list option)
    ?slurm_configuration:(slurm_configuration_ : update_queue_slurm_configuration_request option)
    ?client_token:(client_token_ : sb_client_token option)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier)
    ~queue_identifier:(queue_identifier_ : queue_identifier) () =
  ({
     cluster_identifier = cluster_identifier_;
     queue_identifier = queue_identifier_;
     compute_node_group_configurations = compute_node_group_configurations_;
     slurm_configuration = slurm_configuration_;
     client_token = client_token_;
   }
    : update_queue_request)
