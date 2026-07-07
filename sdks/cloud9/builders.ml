open Types

let make_update_environment_request
    ?managed_credentials_action:(managed_credentials_action_ : managed_credentials_action option)
    ?description:(description_ : environment_description option)
    ?name:(name_ : environment_name option) ~environment_id:(environment_id_ : environment_id) () =
  ({
     managed_credentials_action = managed_credentials_action_;
     description = description_;
     name = name_;
     environment_id = environment_id_;
   }
    : update_environment_request)

let make_environment_member ?last_access:(last_access_ : timestamp option)
    ~environment_id:(environment_id_ : environment_id) ~user_arn:(user_arn_ : user_arn)
    ~user_id:(user_id_ : string_) ~permissions:(permissions_ : permissions) () =
  ({
     last_access = last_access_;
     environment_id = environment_id_;
     user_arn = user_arn_;
     user_id = user_id_;
     permissions = permissions_;
   }
    : environment_member)

let make_update_environment_membership_request ~permissions:(permissions_ : member_permissions)
    ~user_arn:(user_arn_ : user_arn) ~environment_id:(environment_id_ : environment_id) () =
  ({ permissions = permissions_; user_arn = user_arn_; environment_id = environment_id_ }
    : update_environment_membership_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_ar_n:(resource_ar_n_ : environment_arn) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_ar_n:(resource_ar_n_ : environment_arn) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : environment_arn) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_list_environments_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : string_ option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_environments_request)

let make_environment_lifecycle ?failure_resource:(failure_resource_ : string_ option)
    ?reason:(reason_ : string_ option) ?status:(status_ : environment_lifecycle_status option) () =
  ({ failure_resource = failure_resource_; reason = reason_; status = status_ }
    : environment_lifecycle)

let make_environment
    ?managed_credentials_status:(managed_credentials_status_ : managed_credentials_status option)
    ?lifecycle:(lifecycle_ : environment_lifecycle option)
    ?connection_type:(connection_type_ : connection_type option)
    ?description:(description_ : environment_description option)
    ?name:(name_ : environment_name option) ?id:(id_ : environment_id option)
    ~owner_arn:(owner_arn_ : string_) ~arn:(arn_ : string_) ~type_:(type__ : environment_type) () =
  ({
     managed_credentials_status = managed_credentials_status_;
     lifecycle = lifecycle_;
     owner_arn = owner_arn_;
     arn = arn_;
     connection_type = connection_type_;
     type_ = type__;
     description = description_;
     name = name_;
     id = id_;
   }
    : environment)

let make_describe_environments_request
    ~environment_ids:(environment_ids_ : bounded_environment_id_list) () =
  ({ environment_ids = environment_ids_ } : describe_environments_request)

let make_describe_environment_status_request ~environment_id:(environment_id_ : environment_id) () =
  ({ environment_id = environment_id_ } : describe_environment_status_request)

let make_describe_environment_memberships_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : string_ option) ?permissions:(permissions_ : permissions_list option)
    ?environment_id:(environment_id_ : environment_id option)
    ?user_arn:(user_arn_ : user_arn option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     permissions = permissions_;
     environment_id = environment_id_;
     user_arn = user_arn_;
   }
    : describe_environment_memberships_request)

let make_delete_environment_request ~environment_id:(environment_id_ : environment_id) () =
  ({ environment_id = environment_id_ } : delete_environment_request)

let make_delete_environment_membership_request ~user_arn:(user_arn_ : user_arn)
    ~environment_id:(environment_id_ : environment_id) () =
  ({ user_arn = user_arn_; environment_id = environment_id_ }
    : delete_environment_membership_request)

let make_create_environment_membership_request ~permissions:(permissions_ : member_permissions)
    ~user_arn:(user_arn_ : user_arn) ~environment_id:(environment_id_ : environment_id) () =
  ({ permissions = permissions_; user_arn = user_arn_; environment_id = environment_id_ }
    : create_environment_membership_request)

let make_create_environment_ec2_request ?dry_run:(dry_run_ : nullable_boolean option)
    ?connection_type:(connection_type_ : connection_type option) ?tags:(tags_ : tag_list option)
    ?owner_arn:(owner_arn_ : user_arn option)
    ?automatic_stop_time_minutes:(automatic_stop_time_minutes_ : automatic_stop_time_minutes option)
    ?subnet_id:(subnet_id_ : subnet_id option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?description:(description_ : environment_description option) ~image_id:(image_id_ : image_id)
    ~instance_type:(instance_type_ : instance_type) ~name:(name_ : environment_name) () =
  ({
     dry_run = dry_run_;
     connection_type = connection_type_;
     tags = tags_;
     owner_arn = owner_arn_;
     automatic_stop_time_minutes = automatic_stop_time_minutes_;
     image_id = image_id_;
     subnet_id = subnet_id_;
     instance_type = instance_type_;
     client_request_token = client_request_token_;
     description = description_;
     name = name_;
   }
    : create_environment_ec2_request)
