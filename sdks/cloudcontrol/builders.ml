open Types

let make_progress_event ?retry_after:(retry_after_ : timestamp option)
    ?error_code:(error_code_ : handler_error_code option)
    ?status_message:(status_message_ : status_message option)
    ?resource_model:(resource_model_ : properties option)
    ?event_time:(event_time_ : timestamp option)
    ?operation_status:(operation_status_ : operation_status option)
    ?operation:(operation_ : operation option)
    ?hooks_request_token:(hooks_request_token_ : request_token option)
    ?request_token:(request_token_ : request_token option)
    ?identifier:(identifier_ : identifier option) ?type_name:(type_name_ : type_name option) () =
  ({
     retry_after = retry_after_;
     error_code = error_code_;
     status_message = status_message_;
     resource_model = resource_model_;
     event_time = event_time_;
     operation_status = operation_status_;
     operation = operation_;
     hooks_request_token = hooks_request_token_;
     request_token = request_token_;
     identifier = identifier_;
     type_name = type_name_;
   }
    : progress_event)

let make_update_resource_output ?progress_event:(progress_event_ : progress_event option) () =
  ({ progress_event = progress_event_ } : update_resource_output)

let make_update_resource_input ?client_token:(client_token_ : client_token option)
    ?role_arn:(role_arn_ : role_arn option)
    ?type_version_id:(type_version_id_ : type_version_id option)
    ~patch_document:(patch_document_ : patch_document) ~identifier:(identifier_ : identifier)
    ~type_name:(type_name_ : type_name) () =
  ({
     patch_document = patch_document_;
     identifier = identifier_;
     client_token = client_token_;
     role_arn = role_arn_;
     type_version_id = type_version_id_;
     type_name = type_name_;
   }
    : update_resource_input)

let make_resource_request_status_filter
    ?operation_statuses:(operation_statuses_ : operation_statuses option)
    ?operations:(operations_ : operations option) () =
  ({ operation_statuses = operation_statuses_; operations = operations_ }
    : resource_request_status_filter)

let make_resource_description ?properties:(properties_ : properties option)
    ?identifier:(identifier_ : identifier option) () =
  ({ properties = properties_; identifier = identifier_ } : resource_description)

let make_list_resources_output ?next_token:(next_token_ : handler_next_token option)
    ?resource_descriptions:(resource_descriptions_ : resource_descriptions option)
    ?type_name:(type_name_ : type_name option) () =
  ({
     next_token = next_token_;
     resource_descriptions = resource_descriptions_;
     type_name = type_name_;
   }
    : list_resources_output)

let make_list_resources_input ?resource_model:(resource_model_ : properties option)
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : handler_next_token option) ?role_arn:(role_arn_ : role_arn option)
    ?type_version_id:(type_version_id_ : type_version_id option) ~type_name:(type_name_ : type_name)
    () =
  ({
     resource_model = resource_model_;
     max_results = max_results_;
     next_token = next_token_;
     role_arn = role_arn_;
     type_version_id = type_version_id_;
     type_name = type_name_;
   }
    : list_resources_input)

let make_list_resource_requests_output ?next_token:(next_token_ : next_token option)
    ?resource_request_status_summaries:
      (resource_request_status_summaries_ : resource_request_status_summaries option) () =
  ({
     next_token = next_token_;
     resource_request_status_summaries = resource_request_status_summaries_;
   }
    : list_resource_requests_output)

let make_list_resource_requests_input
    ?resource_request_status_filter:
      (resource_request_status_filter_ : resource_request_status_filter option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     resource_request_status_filter = resource_request_status_filter_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_resource_requests_input)

let make_hook_progress_event ?failure_mode:(failure_mode_ : hook_failure_mode option)
    ?hook_status_message:(hook_status_message_ : status_message option)
    ?hook_event_time:(hook_event_time_ : timestamp option)
    ?hook_status:(hook_status_ : hook_status option)
    ?invocation_point:(invocation_point_ : hook_invocation_point option)
    ?hook_type_arn:(hook_type_arn_ : hook_type_arn option)
    ?hook_type_version_id:(hook_type_version_id_ : type_version_id option)
    ?hook_type_name:(hook_type_name_ : type_name option) () =
  ({
     failure_mode = failure_mode_;
     hook_status_message = hook_status_message_;
     hook_event_time = hook_event_time_;
     hook_status = hook_status_;
     invocation_point = invocation_point_;
     hook_type_arn = hook_type_arn_;
     hook_type_version_id = hook_type_version_id_;
     hook_type_name = hook_type_name_;
   }
    : hook_progress_event)

let make_get_resource_request_status_output
    ?hooks_progress_event:(hooks_progress_event_ : hooks_progress_event option)
    ?progress_event:(progress_event_ : progress_event option) () =
  ({ hooks_progress_event = hooks_progress_event_; progress_event = progress_event_ }
    : get_resource_request_status_output)

let make_get_resource_request_status_input ~request_token:(request_token_ : request_token) () =
  ({ request_token = request_token_ } : get_resource_request_status_input)

let make_get_resource_output
    ?resource_description:(resource_description_ : resource_description option)
    ?type_name:(type_name_ : type_name option) () =
  ({ resource_description = resource_description_; type_name = type_name_ } : get_resource_output)

let make_get_resource_input ?role_arn:(role_arn_ : role_arn option)
    ?type_version_id:(type_version_id_ : type_version_id option)
    ~identifier:(identifier_ : identifier) ~type_name:(type_name_ : type_name) () =
  ({
     identifier = identifier_;
     role_arn = role_arn_;
     type_version_id = type_version_id_;
     type_name = type_name_;
   }
    : get_resource_input)

let make_delete_resource_output ?progress_event:(progress_event_ : progress_event option) () =
  ({ progress_event = progress_event_ } : delete_resource_output)

let make_delete_resource_input ?client_token:(client_token_ : client_token option)
    ?role_arn:(role_arn_ : role_arn option)
    ?type_version_id:(type_version_id_ : type_version_id option)
    ~identifier:(identifier_ : identifier) ~type_name:(type_name_ : type_name) () =
  ({
     identifier = identifier_;
     client_token = client_token_;
     role_arn = role_arn_;
     type_version_id = type_version_id_;
     type_name = type_name_;
   }
    : delete_resource_input)

let make_create_resource_output ?progress_event:(progress_event_ : progress_event option) () =
  ({ progress_event = progress_event_ } : create_resource_output)

let make_create_resource_input ?client_token:(client_token_ : client_token option)
    ?role_arn:(role_arn_ : role_arn option)
    ?type_version_id:(type_version_id_ : type_version_id option)
    ~desired_state:(desired_state_ : properties) ~type_name:(type_name_ : type_name) () =
  ({
     desired_state = desired_state_;
     client_token = client_token_;
     role_arn = role_arn_;
     type_version_id = type_version_id_;
     type_name = type_name_;
   }
    : create_resource_input)

let make_cancel_resource_request_output ?progress_event:(progress_event_ : progress_event option) ()
    =
  ({ progress_event = progress_event_ } : cancel_resource_request_output)

let make_cancel_resource_request_input ~request_token:(request_token_ : request_token) () =
  ({ request_token = request_token_ } : cancel_resource_request_input)
