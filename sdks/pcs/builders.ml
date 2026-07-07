open Types

let make_validation_exception_field ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ message = message_; name = name_ } : validation_exception_field)

let make_update_slurm_rest_request ?mode:(mode_ : slurm_rest_mode option) () =
  ({ mode = mode_ } : update_slurm_rest_request)

let make_update_scheduler_request ~version:(version_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ version = version_ } : update_scheduler_request)

let make_slurm_custom_setting
    ~parameter_value:(parameter_value_ : Smaws_Lib.Smithy_api.Types.string_)
    ~parameter_name:(parameter_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ parameter_value = parameter_value_; parameter_name = parameter_name_ } : slurm_custom_setting)

let make_update_queue_slurm_configuration_request
    ?slurm_custom_settings:(slurm_custom_settings_ : slurm_custom_settings option) () =
  ({ slurm_custom_settings = slurm_custom_settings_ } : update_queue_slurm_configuration_request)

let make_compute_node_group_configuration
    ?compute_node_group_id:(compute_node_group_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ compute_node_group_id = compute_node_group_id_ } : compute_node_group_configuration)

let make_queue_slurm_configuration
    ?slurm_custom_settings:(slurm_custom_settings_ : slurm_custom_settings option) () =
  ({ slurm_custom_settings = slurm_custom_settings_ } : queue_slurm_configuration)

let make_error_info ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?code:(code_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ message = message_; code = code_ } : error_info)

let make_queue ?error_info:(error_info_ : error_info_list option)
    ?slurm_configuration:(slurm_configuration_ : queue_slurm_configuration option)
    ~compute_node_group_configurations:
      (compute_node_group_configurations_ : compute_node_group_configuration_list)
    ~status:(status_ : queue_status)
    ~modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~cluster_id:(cluster_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_) ~id:(id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~name:(name_ : queue_name) () =
  ({
     error_info = error_info_;
     slurm_configuration = slurm_configuration_;
     compute_node_group_configurations = compute_node_group_configurations_;
     status = status_;
     modified_at = modified_at_;
     created_at = created_at_;
     cluster_id = cluster_id_;
     arn = arn_;
     id = id_;
     name = name_;
   }
    : queue)

let make_update_queue_response ?queue:(queue_ : queue option) () =
  ({ queue = queue_ } : update_queue_response)

let make_update_queue_request ?client_token:(client_token_ : sb_client_token option)
    ?slurm_configuration:(slurm_configuration_ : update_queue_slurm_configuration_request option)
    ?compute_node_group_configurations:
      (compute_node_group_configurations_ : compute_node_group_configuration_list option)
    ~queue_identifier:(queue_identifier_ : queue_identifier)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier) () =
  ({
     client_token = client_token_;
     slurm_configuration = slurm_configuration_;
     compute_node_group_configurations = compute_node_group_configurations_;
     queue_identifier = queue_identifier_;
     cluster_identifier = cluster_identifier_;
   }
    : update_queue_request)

let make_update_compute_node_group_slurm_configuration_request
    ?slurm_custom_settings:(slurm_custom_settings_ : slurm_custom_settings option)
    ?scale_down_idle_time_in_seconds:
      (scale_down_idle_time_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     slurm_custom_settings = slurm_custom_settings_;
     scale_down_idle_time_in_seconds = scale_down_idle_time_in_seconds_;
   }
    : update_compute_node_group_slurm_configuration_request)

let make_custom_launch_template ~version:(version_ : Smaws_Lib.Smithy_api.Types.string_)
    ~id:(id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ version = version_; id = id_ } : custom_launch_template)

let make_scaling_configuration
    ~max_instance_count:(max_instance_count_ : Smaws_Lib.Smithy_api.Types.integer)
    ~min_instance_count:(min_instance_count_ : Smaws_Lib.Smithy_api.Types.integer) () =
  ({ max_instance_count = max_instance_count_; min_instance_count = min_instance_count_ }
    : scaling_configuration)

let make_instance_config ?instance_type:(instance_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    () =
  ({ instance_type = instance_type_ } : instance_config)

let make_spot_options ?allocation_strategy:(allocation_strategy_ : spot_allocation_strategy option)
    () =
  ({ allocation_strategy = allocation_strategy_ } : spot_options)

let make_compute_node_group_slurm_configuration
    ?slurm_custom_settings:(slurm_custom_settings_ : slurm_custom_settings option)
    ?scale_down_idle_time_in_seconds:
      (scale_down_idle_time_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     slurm_custom_settings = slurm_custom_settings_;
     scale_down_idle_time_in_seconds = scale_down_idle_time_in_seconds_;
   }
    : compute_node_group_slurm_configuration)

let make_compute_node_group ?error_info:(error_info_ : error_info_list option)
    ?slurm_configuration:(slurm_configuration_ : compute_node_group_slurm_configuration option)
    ?spot_options:(spot_options_ : spot_options option)
    ?purchase_option:(purchase_option_ : purchase_option option) ?ami_id:(ami_id_ : ami_id option)
    ~instance_configs:(instance_configs_ : instance_list)
    ~scaling_configuration:(scaling_configuration_ : scaling_configuration)
    ~iam_instance_profile_arn:(iam_instance_profile_arn_ : instance_profile_arn)
    ~custom_launch_template:(custom_launch_template_ : custom_launch_template)
    ~subnet_ids:(subnet_ids_ : subnet_id_list) ~status:(status_ : compute_node_group_status)
    ~modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~cluster_id:(cluster_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_) ~id:(id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~name:(name_ : compute_node_group_name) () =
  ({
     error_info = error_info_;
     slurm_configuration = slurm_configuration_;
     spot_options = spot_options_;
     instance_configs = instance_configs_;
     scaling_configuration = scaling_configuration_;
     iam_instance_profile_arn = iam_instance_profile_arn_;
     custom_launch_template = custom_launch_template_;
     purchase_option = purchase_option_;
     subnet_ids = subnet_ids_;
     ami_id = ami_id_;
     status = status_;
     modified_at = modified_at_;
     created_at = created_at_;
     cluster_id = cluster_id_;
     arn = arn_;
     id = id_;
     name = name_;
   }
    : compute_node_group)

let make_update_compute_node_group_response
    ?compute_node_group:(compute_node_group_ : compute_node_group option) () =
  ({ compute_node_group = compute_node_group_ } : update_compute_node_group_response)

let make_scaling_configuration_request
    ~max_instance_count:(max_instance_count_ : Smaws_Lib.Smithy_api.Types.integer)
    ~min_instance_count:(min_instance_count_ : Smaws_Lib.Smithy_api.Types.integer) () =
  ({ max_instance_count = max_instance_count_; min_instance_count = min_instance_count_ }
    : scaling_configuration_request)

let make_update_compute_node_group_request ?client_token:(client_token_ : sb_client_token option)
    ?slurm_configuration:
      (slurm_configuration_ : update_compute_node_group_slurm_configuration_request option)
    ?iam_instance_profile_arn:(iam_instance_profile_arn_ : instance_profile_arn option)
    ?scaling_configuration:(scaling_configuration_ : scaling_configuration_request option)
    ?spot_options:(spot_options_ : spot_options option)
    ?purchase_option:(purchase_option_ : purchase_option option)
    ?custom_launch_template:(custom_launch_template_ : custom_launch_template option)
    ?subnet_ids:(subnet_ids_ : string_list option) ?ami_id:(ami_id_ : ami_id option)
    ~compute_node_group_identifier:(compute_node_group_identifier_ : compute_node_group_identifier)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier) () =
  ({
     client_token = client_token_;
     slurm_configuration = slurm_configuration_;
     iam_instance_profile_arn = iam_instance_profile_arn_;
     scaling_configuration = scaling_configuration_;
     spot_options = spot_options_;
     purchase_option = purchase_option_;
     custom_launch_template = custom_launch_template_;
     subnet_ids = subnet_ids_;
     ami_id = ami_id_;
     compute_node_group_identifier = compute_node_group_identifier_;
     cluster_identifier = cluster_identifier_;
   }
    : update_compute_node_group_request)

let make_slurmdbd_custom_setting
    ~parameter_value:(parameter_value_ : Smaws_Lib.Smithy_api.Types.string_)
    ~parameter_name:(parameter_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ parameter_value = parameter_value_; parameter_name = parameter_name_ }
    : slurmdbd_custom_setting)

let make_cgroup_custom_setting
    ~parameter_value:(parameter_value_ : Smaws_Lib.Smithy_api.Types.string_)
    ~parameter_name:(parameter_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ parameter_value = parameter_value_; parameter_name = parameter_name_ } : cgroup_custom_setting)

let make_update_accounting_request ?mode:(mode_ : accounting_mode option)
    ?default_purge_time_in_days:
      (default_purge_time_in_days_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ mode = mode_; default_purge_time_in_days = default_purge_time_in_days_ }
    : update_accounting_request)

let make_update_cluster_slurm_configuration_request
    ?slurm_rest:(slurm_rest_ : update_slurm_rest_request option)
    ?accounting:(accounting_ : update_accounting_request option)
    ?cgroup_custom_settings:(cgroup_custom_settings_ : cgroup_custom_settings option)
    ?slurmdbd_custom_settings:(slurmdbd_custom_settings_ : slurmdbd_custom_settings option)
    ?slurm_custom_settings:(slurm_custom_settings_ : slurm_custom_settings option)
    ?scale_down_idle_time_in_seconds:
      (scale_down_idle_time_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     slurm_rest = slurm_rest_;
     accounting = accounting_;
     cgroup_custom_settings = cgroup_custom_settings_;
     slurmdbd_custom_settings = slurmdbd_custom_settings_;
     slurm_custom_settings = slurm_custom_settings_;
     scale_down_idle_time_in_seconds = scale_down_idle_time_in_seconds_;
   }
    : update_cluster_slurm_configuration_request)

let make_scheduler ~version:(version_ : Smaws_Lib.Smithy_api.Types.string_)
    ~type_:(type__ : scheduler_type) () =
  ({ version = version_; type_ = type__ } : scheduler)

let make_slurm_auth_key ~secret_version:(secret_version_ : Smaws_Lib.Smithy_api.Types.string_)
    ~secret_arn:(secret_arn_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ secret_version = secret_version_; secret_arn = secret_arn_ } : slurm_auth_key)

let make_jwt_key ~secret_version:(secret_version_ : Smaws_Lib.Smithy_api.Types.string_)
    ~secret_arn:(secret_arn_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ secret_version = secret_version_; secret_arn = secret_arn_ } : jwt_key)

let make_jwt_auth ?jwt_key:(jwt_key_ : jwt_key option) () = ({ jwt_key = jwt_key_ } : jwt_auth)

let make_accounting
    ?default_purge_time_in_days:
      (default_purge_time_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~mode:(mode_ : accounting_mode) () =
  ({ mode = mode_; default_purge_time_in_days = default_purge_time_in_days_ } : accounting)

let make_slurm_rest ~mode:(mode_ : slurm_rest_mode) () = ({ mode = mode_ } : slurm_rest)

let make_cluster_slurm_configuration ?slurm_rest:(slurm_rest_ : slurm_rest option)
    ?accounting:(accounting_ : accounting option) ?jwt_auth:(jwt_auth_ : jwt_auth option)
    ?auth_key:(auth_key_ : slurm_auth_key option)
    ?cgroup_custom_settings:(cgroup_custom_settings_ : cgroup_custom_settings option)
    ?slurmdbd_custom_settings:(slurmdbd_custom_settings_ : slurmdbd_custom_settings option)
    ?slurm_custom_settings:(slurm_custom_settings_ : slurm_custom_settings option)
    ?scale_down_idle_time_in_seconds:
      (scale_down_idle_time_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     slurm_rest = slurm_rest_;
     accounting = accounting_;
     jwt_auth = jwt_auth_;
     auth_key = auth_key_;
     cgroup_custom_settings = cgroup_custom_settings_;
     slurmdbd_custom_settings = slurmdbd_custom_settings_;
     slurm_custom_settings = slurm_custom_settings_;
     scale_down_idle_time_in_seconds = scale_down_idle_time_in_seconds_;
   }
    : cluster_slurm_configuration)

let make_networking ?network_type:(network_type_ : network_type option)
    ?security_group_ids:(security_group_ids_ : security_group_id_list option)
    ?subnet_ids:(subnet_ids_ : subnet_id_list option) () =
  ({
     network_type = network_type_;
     security_group_ids = security_group_ids_;
     subnet_ids = subnet_ids_;
   }
    : networking)

let make_endpoint ?ipv6_address:(ipv6_address_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?public_ip_address:(public_ip_address_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~port:(port_ : Smaws_Lib.Smithy_api.Types.string_)
    ~private_ip_address:(private_ip_address_ : Smaws_Lib.Smithy_api.Types.string_)
    ~type_:(type__ : endpoint_type) () =
  ({
     port = port_;
     ipv6_address = ipv6_address_;
     public_ip_address = public_ip_address_;
     private_ip_address = private_ip_address_;
     type_ = type__;
   }
    : endpoint)

let make_cluster ?error_info:(error_info_ : error_info_list option)
    ?endpoints:(endpoints_ : endpoints option)
    ?slurm_configuration:(slurm_configuration_ : cluster_slurm_configuration option)
    ~networking:(networking_ : networking) ~size:(size_ : size) ~scheduler:(scheduler_ : scheduler)
    ~modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~status:(status_ : cluster_status) ~arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~id:(id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     error_info = error_info_;
     endpoints = endpoints_;
     networking = networking_;
     slurm_configuration = slurm_configuration_;
     size = size_;
     scheduler = scheduler_;
     modified_at = modified_at_;
     created_at = created_at_;
     status = status_;
     arn = arn_;
     id = id_;
     name = name_;
   }
    : cluster)

let make_update_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : update_cluster_response)

let make_update_cluster_request ?scheduler:(scheduler_ : update_scheduler_request option)
    ?slurm_configuration:(slurm_configuration_ : update_cluster_slurm_configuration_request option)
    ?client_token:(client_token_ : sb_client_token option)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier) () =
  ({
     scheduler = scheduler_;
     slurm_configuration = slurm_configuration_;
     client_token = client_token_;
     cluster_identifier = cluster_identifier_;
   }
    : update_cluster_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_keys) ~resource_arn:(resource_arn_ : arn)
    () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : request_tag_map) ~resource_arn:(resource_arn_ : arn) ()
    =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_slurm_rest_request ~mode:(mode_ : slurm_rest_mode) () =
  ({ mode = mode_ } : slurm_rest_request)

let make_scheduler_request ~version:(version_ : Smaws_Lib.Smithy_api.Types.string_)
    ~type_:(type__ : scheduler_type) () =
  ({ version = version_; type_ = type__ } : scheduler_request)

let make_register_compute_node_group_instance_response ~endpoints:(endpoints_ : endpoints)
    ~shared_secret:(shared_secret_ : shared_secret)
    ~node_i_d:(node_i_d_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ endpoints = endpoints_; shared_secret = shared_secret_; node_i_d = node_i_d_ }
    : register_compute_node_group_instance_response)

let make_register_compute_node_group_instance_request ~bootstrap_id:(bootstrap_id_ : bootstrap_id)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier) () =
  ({ bootstrap_id = bootstrap_id_; cluster_identifier = cluster_identifier_ }
    : register_compute_node_group_instance_request)

let make_queue_summary ~status:(status_ : queue_status)
    ~modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~cluster_id:(cluster_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_) ~id:(id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~name:(name_ : queue_name) () =
  ({
     status = status_;
     modified_at = modified_at_;
     created_at = created_at_;
     cluster_id = cluster_id_;
     arn = arn_;
     id = id_;
     name = name_;
   }
    : queue_summary)

let make_queue_slurm_configuration_request
    ?slurm_custom_settings:(slurm_custom_settings_ : slurm_custom_settings option) () =
  ({ slurm_custom_settings = slurm_custom_settings_ } : queue_slurm_configuration_request)

let make_networking_request ?network_type:(network_type_ : network_type option)
    ?security_group_ids:(security_group_ids_ : security_group_id_list option)
    ?subnet_ids:(subnet_ids_ : subnet_id_list option) () =
  ({
     network_type = network_type_;
     security_group_ids = security_group_ids_;
     subnet_ids = subnet_ids_;
   }
    : networking_request)

let make_list_tags_for_resource_response ?tags:(tags_ : response_tag_map option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_queues_response ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~queues:(queues_ : queue_list) () =
  ({ next_token = next_token_; queues = queues_ } : list_queues_response)

let make_list_queues_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     cluster_identifier = cluster_identifier_;
   }
    : list_queues_request)

let make_compute_node_group_summary ~status:(status_ : compute_node_group_status)
    ~modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~cluster_id:(cluster_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_) ~id:(id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~name:(name_ : compute_node_group_name) () =
  ({
     status = status_;
     modified_at = modified_at_;
     created_at = created_at_;
     cluster_id = cluster_id_;
     arn = arn_;
     id = id_;
     name = name_;
   }
    : compute_node_group_summary)

let make_list_compute_node_groups_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~compute_node_groups:(compute_node_groups_ : compute_node_group_list) () =
  ({ next_token = next_token_; compute_node_groups = compute_node_groups_ }
    : list_compute_node_groups_response)

let make_list_compute_node_groups_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     cluster_identifier = cluster_identifier_;
   }
    : list_compute_node_groups_request)

let make_cluster_summary ~status:(status_ : cluster_status)
    ~modified_at:(modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_) ~id:(id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     status = status_;
     modified_at = modified_at_;
     created_at = created_at_;
     arn = arn_;
     id = id_;
     name = name_;
   }
    : cluster_summary)

let make_list_clusters_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~clusters:(clusters_ : cluster_list) () =
  ({ next_token = next_token_; clusters = clusters_ } : list_clusters_response)

let make_list_clusters_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_clusters_request)

let make_get_queue_response ?queue:(queue_ : queue option) () =
  ({ queue = queue_ } : get_queue_response)

let make_get_queue_request ~queue_identifier:(queue_identifier_ : queue_identifier)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier) () =
  ({ queue_identifier = queue_identifier_; cluster_identifier = cluster_identifier_ }
    : get_queue_request)

let make_get_compute_node_group_response
    ?compute_node_group:(compute_node_group_ : compute_node_group option) () =
  ({ compute_node_group = compute_node_group_ } : get_compute_node_group_response)

let make_get_compute_node_group_request
    ~compute_node_group_identifier:(compute_node_group_identifier_ : compute_node_group_identifier)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier) () =
  ({
     compute_node_group_identifier = compute_node_group_identifier_;
     cluster_identifier = cluster_identifier_;
   }
    : get_compute_node_group_request)

let make_get_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : get_cluster_response)

let make_get_cluster_request ~cluster_identifier:(cluster_identifier_ : cluster_identifier) () =
  ({ cluster_identifier = cluster_identifier_ } : get_cluster_request)

let make_delete_queue_response () = (() : unit)

let make_delete_queue_request ?client_token:(client_token_ : sb_client_token option)
    ~queue_identifier:(queue_identifier_ : queue_identifier)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier) () =
  ({
     client_token = client_token_;
     queue_identifier = queue_identifier_;
     cluster_identifier = cluster_identifier_;
   }
    : delete_queue_request)

let make_delete_compute_node_group_response () = (() : unit)

let make_delete_compute_node_group_request ?client_token:(client_token_ : sb_client_token option)
    ~compute_node_group_identifier:(compute_node_group_identifier_ : compute_node_group_identifier)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier) () =
  ({
     client_token = client_token_;
     compute_node_group_identifier = compute_node_group_identifier_;
     cluster_identifier = cluster_identifier_;
   }
    : delete_compute_node_group_request)

let make_delete_cluster_response () = (() : unit)

let make_delete_cluster_request ?client_token:(client_token_ : sb_client_token option)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier) () =
  ({ client_token = client_token_; cluster_identifier = cluster_identifier_ }
    : delete_cluster_request)

let make_create_queue_response ?queue:(queue_ : queue option) () =
  ({ queue = queue_ } : create_queue_response)

let make_create_queue_request ?tags:(tags_ : request_tag_map option)
    ?client_token:(client_token_ : sb_client_token option)
    ?slurm_configuration:(slurm_configuration_ : queue_slurm_configuration_request option)
    ?compute_node_group_configurations:
      (compute_node_group_configurations_ : compute_node_group_configuration_list option)
    ~queue_name:(queue_name_ : queue_name)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier) () =
  ({
     tags = tags_;
     client_token = client_token_;
     slurm_configuration = slurm_configuration_;
     compute_node_group_configurations = compute_node_group_configurations_;
     queue_name = queue_name_;
     cluster_identifier = cluster_identifier_;
   }
    : create_queue_request)

let make_create_compute_node_group_response
    ?compute_node_group:(compute_node_group_ : compute_node_group option) () =
  ({ compute_node_group = compute_node_group_ } : create_compute_node_group_response)

let make_compute_node_group_slurm_configuration_request
    ?slurm_custom_settings:(slurm_custom_settings_ : slurm_custom_settings option)
    ?scale_down_idle_time_in_seconds:
      (scale_down_idle_time_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     slurm_custom_settings = slurm_custom_settings_;
     scale_down_idle_time_in_seconds = scale_down_idle_time_in_seconds_;
   }
    : compute_node_group_slurm_configuration_request)

let make_create_compute_node_group_request ?tags:(tags_ : request_tag_map option)
    ?client_token:(client_token_ : sb_client_token option)
    ?slurm_configuration:
      (slurm_configuration_ : compute_node_group_slurm_configuration_request option)
    ?spot_options:(spot_options_ : spot_options option)
    ?purchase_option:(purchase_option_ : purchase_option option) ?ami_id:(ami_id_ : ami_id option)
    ~instance_configs:(instance_configs_ : instance_list)
    ~scaling_configuration:(scaling_configuration_ : scaling_configuration_request)
    ~iam_instance_profile_arn:(iam_instance_profile_arn_ : instance_profile_arn)
    ~custom_launch_template:(custom_launch_template_ : custom_launch_template)
    ~subnet_ids:(subnet_ids_ : string_list)
    ~compute_node_group_name:(compute_node_group_name_ : compute_node_group_name)
    ~cluster_identifier:(cluster_identifier_ : cluster_identifier) () =
  ({
     tags = tags_;
     client_token = client_token_;
     slurm_configuration = slurm_configuration_;
     spot_options = spot_options_;
     instance_configs = instance_configs_;
     scaling_configuration = scaling_configuration_;
     iam_instance_profile_arn = iam_instance_profile_arn_;
     custom_launch_template = custom_launch_template_;
     purchase_option = purchase_option_;
     subnet_ids = subnet_ids_;
     ami_id = ami_id_;
     compute_node_group_name = compute_node_group_name_;
     cluster_identifier = cluster_identifier_;
   }
    : create_compute_node_group_request)

let make_create_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : create_cluster_response)

let make_accounting_request
    ?default_purge_time_in_days:
      (default_purge_time_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~mode:(mode_ : accounting_mode) () =
  ({ mode = mode_; default_purge_time_in_days = default_purge_time_in_days_ } : accounting_request)

let make_cluster_slurm_configuration_request ?slurm_rest:(slurm_rest_ : slurm_rest_request option)
    ?accounting:(accounting_ : accounting_request option)
    ?cgroup_custom_settings:(cgroup_custom_settings_ : cgroup_custom_settings option)
    ?slurmdbd_custom_settings:(slurmdbd_custom_settings_ : slurmdbd_custom_settings option)
    ?slurm_custom_settings:(slurm_custom_settings_ : slurm_custom_settings option)
    ?scale_down_idle_time_in_seconds:
      (scale_down_idle_time_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     slurm_rest = slurm_rest_;
     accounting = accounting_;
     cgroup_custom_settings = cgroup_custom_settings_;
     slurmdbd_custom_settings = slurmdbd_custom_settings_;
     slurm_custom_settings = slurm_custom_settings_;
     scale_down_idle_time_in_seconds = scale_down_idle_time_in_seconds_;
   }
    : cluster_slurm_configuration_request)

let make_create_cluster_request ?tags:(tags_ : request_tag_map option)
    ?client_token:(client_token_ : sb_client_token option)
    ?slurm_configuration:(slurm_configuration_ : cluster_slurm_configuration_request option)
    ~networking:(networking_ : networking_request) ~size:(size_ : size)
    ~scheduler:(scheduler_ : scheduler_request) ~cluster_name:(cluster_name_ : cluster_name) () =
  ({
     tags = tags_;
     client_token = client_token_;
     slurm_configuration = slurm_configuration_;
     networking = networking_;
     size = size_;
     scheduler = scheduler_;
     cluster_name = cluster_name_;
   }
    : create_cluster_request)
