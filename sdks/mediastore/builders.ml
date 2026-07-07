open Types

let make_untag_resource_output () = (() : unit)

let make_untag_resource_input ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource:(resource_ : container_ar_n) () =
  ({ tag_keys = tag_keys_; resource = resource_ } : untag_resource_input)

let make_tag_resource_output () = (() : unit)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_input ~tags:(tags_ : tag_list) ~resource:(resource_ : container_ar_n) () =
  ({ tags = tags_; resource = resource_ } : tag_resource_input)

let make_stop_access_logging_output () = (() : unit)

let make_stop_access_logging_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : stop_access_logging_input)

let make_start_access_logging_output () = (() : unit)

let make_start_access_logging_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : start_access_logging_input)

let make_put_metric_policy_output () = (() : unit)

let make_metric_policy_rule ~object_group_name:(object_group_name_ : object_group_name)
    ~object_group:(object_group_ : object_group) () =
  ({ object_group_name = object_group_name_; object_group = object_group_ } : metric_policy_rule)

let make_metric_policy ?metric_policy_rules:(metric_policy_rules_ : metric_policy_rules option)
    ~container_level_metrics:(container_level_metrics_ : container_level_metrics) () =
  ({
     metric_policy_rules = metric_policy_rules_;
     container_level_metrics = container_level_metrics_;
   }
    : metric_policy)

let make_put_metric_policy_input ~metric_policy:(metric_policy_ : metric_policy)
    ~container_name:(container_name_ : container_name) () =
  ({ metric_policy = metric_policy_; container_name = container_name_ } : put_metric_policy_input)

let make_put_lifecycle_policy_output () = (() : unit)

let make_put_lifecycle_policy_input ~lifecycle_policy:(lifecycle_policy_ : lifecycle_policy)
    ~container_name:(container_name_ : container_name) () =
  ({ lifecycle_policy = lifecycle_policy_; container_name = container_name_ }
    : put_lifecycle_policy_input)

let make_put_cors_policy_output () = (() : unit)

let make_cors_rule ?expose_headers:(expose_headers_ : expose_headers option)
    ?max_age_seconds:(max_age_seconds_ : max_age_seconds option)
    ?allowed_methods:(allowed_methods_ : allowed_methods option)
    ~allowed_headers:(allowed_headers_ : allowed_headers)
    ~allowed_origins:(allowed_origins_ : allowed_origins) () =
  ({
     expose_headers = expose_headers_;
     max_age_seconds = max_age_seconds_;
     allowed_headers = allowed_headers_;
     allowed_methods = allowed_methods_;
     allowed_origins = allowed_origins_;
   }
    : cors_rule)

let make_put_cors_policy_input ~cors_policy:(cors_policy_ : cors_policy)
    ~container_name:(container_name_ : container_name) () =
  ({ cors_policy = cors_policy_; container_name = container_name_ } : put_cors_policy_input)

let make_put_container_policy_output () = (() : unit)

let make_put_container_policy_input ~policy:(policy_ : container_policy)
    ~container_name:(container_name_ : container_name) () =
  ({ policy = policy_; container_name = container_name_ } : put_container_policy_input)

let make_list_tags_for_resource_output ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ~resource:(resource_ : container_ar_n) () =
  ({ resource = resource_ } : list_tags_for_resource_input)

let make_container
    ?access_logging_enabled:(access_logging_enabled_ : container_access_logging_enabled option)
    ?status:(status_ : container_status option) ?name:(name_ : container_name option)
    ?ar_n:(ar_n_ : container_ar_n option) ?creation_time:(creation_time_ : time_stamp option)
    ?endpoint:(endpoint_ : endpoint option) () =
  ({
     access_logging_enabled = access_logging_enabled_;
     status = status_;
     name = name_;
     ar_n = ar_n_;
     creation_time = creation_time_;
     endpoint = endpoint_;
   }
    : container)

let make_list_containers_output ?next_token:(next_token_ : pagination_token option)
    ~containers:(containers_ : container_list) () =
  ({ next_token = next_token_; containers = containers_ } : list_containers_output)

let make_list_containers_input ?max_results:(max_results_ : container_list_limit option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_containers_input)

let make_get_metric_policy_output ~metric_policy:(metric_policy_ : metric_policy) () =
  ({ metric_policy = metric_policy_ } : get_metric_policy_output)

let make_get_metric_policy_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : get_metric_policy_input)

let make_get_lifecycle_policy_output ~lifecycle_policy:(lifecycle_policy_ : lifecycle_policy) () =
  ({ lifecycle_policy = lifecycle_policy_ } : get_lifecycle_policy_output)

let make_get_lifecycle_policy_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : get_lifecycle_policy_input)

let make_get_cors_policy_output ~cors_policy:(cors_policy_ : cors_policy) () =
  ({ cors_policy = cors_policy_ } : get_cors_policy_output)

let make_get_cors_policy_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : get_cors_policy_input)

let make_get_container_policy_output ~policy:(policy_ : container_policy) () =
  ({ policy = policy_ } : get_container_policy_output)

let make_get_container_policy_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : get_container_policy_input)

let make_describe_container_output ?container:(container_ : container option) () =
  ({ container = container_ } : describe_container_output)

let make_describe_container_input ?container_name:(container_name_ : container_name option) () =
  ({ container_name = container_name_ } : describe_container_input)

let make_delete_metric_policy_output () = (() : unit)

let make_delete_metric_policy_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : delete_metric_policy_input)

let make_delete_lifecycle_policy_output () = (() : unit)

let make_delete_lifecycle_policy_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : delete_lifecycle_policy_input)

let make_delete_cors_policy_output () = (() : unit)

let make_delete_cors_policy_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : delete_cors_policy_input)

let make_delete_container_policy_output () = (() : unit)

let make_delete_container_policy_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : delete_container_policy_input)

let make_delete_container_output () = (() : unit)

let make_delete_container_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : delete_container_input)

let make_create_container_output ~container:(container_ : container) () =
  ({ container = container_ } : create_container_output)

let make_create_container_input ?tags:(tags_ : tag_list option)
    ~container_name:(container_name_ : container_name) () =
  ({ tags = tags_; container_name = container_name_ } : create_container_input)
