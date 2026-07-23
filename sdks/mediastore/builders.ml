open Types

let make_container ?endpoint:(endpoint_ : endpoint option)
    ?creation_time:(creation_time_ : time_stamp option) ?ar_n:(ar_n_ : container_ar_n option)
    ?name:(name_ : container_name option) ?status:(status_ : container_status option)
    ?access_logging_enabled:(access_logging_enabled_ : container_access_logging_enabled option) () =
  ({
     endpoint = endpoint_;
     creation_time = creation_time_;
     ar_n = ar_n_;
     name = name_;
     status = status_;
     access_logging_enabled = access_logging_enabled_;
   }
    : container)

let make_cors_rule ?allowed_methods:(allowed_methods_ : allowed_methods option)
    ?max_age_seconds:(max_age_seconds_ : max_age_seconds option)
    ?expose_headers:(expose_headers_ : expose_headers option)
    ~allowed_origins:(allowed_origins_ : allowed_origins)
    ~allowed_headers:(allowed_headers_ : allowed_headers) () =
  ({
     allowed_origins = allowed_origins_;
     allowed_methods = allowed_methods_;
     allowed_headers = allowed_headers_;
     max_age_seconds = max_age_seconds_;
     expose_headers = expose_headers_;
   }
    : cors_rule)

let make_create_container_output ~container:(container_ : container) () =
  ({ container = container_ } : create_container_output)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ key = key_; value = value_ } : tag)

let make_create_container_input ?tags:(tags_ : tag_list option)
    ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_; tags = tags_ } : create_container_input)

let make_delete_container_output () = (() : unit)

let make_delete_container_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : delete_container_input)

let make_delete_container_policy_output () = (() : unit)

let make_delete_container_policy_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : delete_container_policy_input)

let make_delete_cors_policy_output () = (() : unit)

let make_delete_cors_policy_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : delete_cors_policy_input)

let make_delete_lifecycle_policy_output () = (() : unit)

let make_delete_lifecycle_policy_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : delete_lifecycle_policy_input)

let make_delete_metric_policy_output () = (() : unit)

let make_delete_metric_policy_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : delete_metric_policy_input)

let make_describe_container_output ?container:(container_ : container option) () =
  ({ container = container_ } : describe_container_output)

let make_describe_container_input ?container_name:(container_name_ : container_name option) () =
  ({ container_name = container_name_ } : describe_container_input)

let make_get_container_policy_output ~policy:(policy_ : container_policy) () =
  ({ policy = policy_ } : get_container_policy_output)

let make_get_container_policy_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : get_container_policy_input)

let make_get_cors_policy_output ~cors_policy:(cors_policy_ : cors_policy) () =
  ({ cors_policy = cors_policy_ } : get_cors_policy_output)

let make_get_cors_policy_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : get_cors_policy_input)

let make_get_lifecycle_policy_output ~lifecycle_policy:(lifecycle_policy_ : lifecycle_policy) () =
  ({ lifecycle_policy = lifecycle_policy_ } : get_lifecycle_policy_output)

let make_get_lifecycle_policy_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : get_lifecycle_policy_input)

let make_metric_policy_rule ~object_group:(object_group_ : object_group)
    ~object_group_name:(object_group_name_ : object_group_name) () =
  ({ object_group = object_group_; object_group_name = object_group_name_ } : metric_policy_rule)

let make_metric_policy ?metric_policy_rules:(metric_policy_rules_ : metric_policy_rules option)
    ~container_level_metrics:(container_level_metrics_ : container_level_metrics) () =
  ({
     container_level_metrics = container_level_metrics_;
     metric_policy_rules = metric_policy_rules_;
   }
    : metric_policy)

let make_get_metric_policy_output ~metric_policy:(metric_policy_ : metric_policy) () =
  ({ metric_policy = metric_policy_ } : get_metric_policy_output)

let make_get_metric_policy_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : get_metric_policy_input)

let make_list_containers_output ?next_token:(next_token_ : pagination_token option)
    ~containers:(containers_ : container_list) () =
  ({ containers = containers_; next_token = next_token_ } : list_containers_output)

let make_list_containers_input ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : container_list_limit option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_containers_input)

let make_list_tags_for_resource_output ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ~resource:(resource_ : container_ar_n) () =
  ({ resource = resource_ } : list_tags_for_resource_input)

let make_untag_resource_output () = (() : unit)

let make_untag_resource_input ~resource:(resource_ : container_ar_n)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource = resource_; tag_keys = tag_keys_ } : untag_resource_input)

let make_tag_resource_output () = (() : unit)

let make_tag_resource_input ~resource:(resource_ : container_ar_n) ~tags:(tags_ : tag_list) () =
  ({ resource = resource_; tags = tags_ } : tag_resource_input)

let make_stop_access_logging_output () = (() : unit)

let make_stop_access_logging_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : stop_access_logging_input)

let make_start_access_logging_output () = (() : unit)

let make_start_access_logging_input ~container_name:(container_name_ : container_name) () =
  ({ container_name = container_name_ } : start_access_logging_input)

let make_put_metric_policy_output () = (() : unit)

let make_put_metric_policy_input ~container_name:(container_name_ : container_name)
    ~metric_policy:(metric_policy_ : metric_policy) () =
  ({ container_name = container_name_; metric_policy = metric_policy_ } : put_metric_policy_input)

let make_put_lifecycle_policy_output () = (() : unit)

let make_put_lifecycle_policy_input ~container_name:(container_name_ : container_name)
    ~lifecycle_policy:(lifecycle_policy_ : lifecycle_policy) () =
  ({ container_name = container_name_; lifecycle_policy = lifecycle_policy_ }
    : put_lifecycle_policy_input)

let make_put_cors_policy_output () = (() : unit)

let make_put_cors_policy_input ~container_name:(container_name_ : container_name)
    ~cors_policy:(cors_policy_ : cors_policy) () =
  ({ container_name = container_name_; cors_policy = cors_policy_ } : put_cors_policy_input)

let make_put_container_policy_output () = (() : unit)

let make_put_container_policy_input ~container_name:(container_name_ : container_name)
    ~policy:(policy_ : container_policy) () =
  ({ container_name = container_name_; policy = policy_ } : put_container_policy_input)
