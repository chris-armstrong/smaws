open Types

let make_environment_member ?last_access:(last_access_ : timestamp option)
    ~permissions:(permissions_ : permissions) ~user_id:(user_id_ : string_)
    ~user_arn:(user_arn_ : user_arn) ~environment_id:(environment_id_ : environment_id) () =
  ({
     permissions = permissions_;
     user_id = user_id_;
     user_arn = user_arn_;
     environment_id = environment_id_;
     last_access = last_access_;
   }
    : environment_member)

let make_update_environment_membership_request ~environment_id:(environment_id_ : environment_id)
    ~user_arn:(user_arn_ : user_arn) ~permissions:(permissions_ : member_permissions) () =
  ({ environment_id = environment_id_; user_arn = user_arn_; permissions = permissions_ }
    : update_environment_membership_request)

let make_update_environment_request ?name:(name_ : environment_name option)
    ?description:(description_ : environment_description option)
    ?managed_credentials_action:(managed_credentials_action_ : managed_credentials_action option)
    ~environment_id:(environment_id_ : environment_id) () =
  ({
     environment_id = environment_id_;
     name = name_;
     description = description_;
     managed_credentials_action = managed_credentials_action_;
   }
    : update_environment_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : environment_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : environment_arn)
    ~tags:(tags_ : tag_list) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : environment_arn) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_list_environments_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_environments_request)

let make_describe_environment_status_request ~environment_id:(environment_id_ : environment_id) () =
  ({ environment_id = environment_id_ } : describe_environment_status_request)

let make_environment_lifecycle ?status:(status_ : environment_lifecycle_status option)
    ?reason:(reason_ : string_ option) ?failure_resource:(failure_resource_ : string_ option) () =
  ({ status = status_; reason = reason_; failure_resource = failure_resource_ }
    : environment_lifecycle)

let make_environment ?id:(id_ : environment_id option) ?name:(name_ : environment_name option)
    ?description:(description_ : environment_description option)
    ?connection_type:(connection_type_ : connection_type option)
    ?lifecycle:(lifecycle_ : environment_lifecycle option)
    ?managed_credentials_status:(managed_credentials_status_ : managed_credentials_status option)
    ~type_:(type__ : environment_type) ~arn:(arn_ : string_) ~owner_arn:(owner_arn_ : string_) () =
  ({
     id = id_;
     name = name_;
     description = description_;
     type_ = type__;
     connection_type = connection_type_;
     arn = arn_;
     owner_arn = owner_arn_;
     lifecycle = lifecycle_;
     managed_credentials_status = managed_credentials_status_;
   }
    : environment)

let make_describe_environments_request
    ~environment_ids:(environment_ids_ : bounded_environment_id_list) () =
  ({ environment_ids = environment_ids_ } : describe_environments_request)

let make_describe_environment_memberships_request ?user_arn:(user_arn_ : user_arn option)
    ?environment_id:(environment_id_ : environment_id option)
    ?permissions:(permissions_ : permissions_list option) ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : max_results option) () =
  ({
     user_arn = user_arn_;
     environment_id = environment_id_;
     permissions = permissions_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_environment_memberships_request)

let make_delete_environment_membership_request ~environment_id:(environment_id_ : environment_id)
    ~user_arn:(user_arn_ : user_arn) () =
  ({ environment_id = environment_id_; user_arn = user_arn_ }
    : delete_environment_membership_request)

let make_delete_environment_request ~environment_id:(environment_id_ : environment_id) () =
  ({ environment_id = environment_id_ } : delete_environment_request)

let make_create_environment_membership_request ~environment_id:(environment_id_ : environment_id)
    ~user_arn:(user_arn_ : user_arn) ~permissions:(permissions_ : member_permissions) () =
  ({ environment_id = environment_id_; user_arn = user_arn_; permissions = permissions_ }
    : create_environment_membership_request)

let make_create_environment_ec2_request ?description:(description_ : environment_description option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?subnet_id:(subnet_id_ : subnet_id option)
    ?automatic_stop_time_minutes:(automatic_stop_time_minutes_ : automatic_stop_time_minutes option)
    ?owner_arn:(owner_arn_ : user_arn option) ?tags:(tags_ : tag_list option)
    ?connection_type:(connection_type_ : connection_type option)
    ?dry_run:(dry_run_ : nullable_boolean option) ~name:(name_ : environment_name)
    ~instance_type:(instance_type_ : instance_type) ~image_id:(image_id_ : image_id) () =
  ({
     name = name_;
     description = description_;
     client_request_token = client_request_token_;
     instance_type = instance_type_;
     subnet_id = subnet_id_;
     image_id = image_id_;
     automatic_stop_time_minutes = automatic_stop_time_minutes_;
     owner_arn = owner_arn_;
     tags = tags_;
     connection_type = connection_type_;
     dry_run = dry_run_;
   }
    : create_environment_ec2_request)
