open Types

let make_connection ?tags:(tags_ : tag_map option)
    ?billing_tier:(billing_tier_ : billing_tier option)
    ~activation_key:(activation_key_ : activation_key)
    ~owner_account:(owner_account_ : owner_account_id)
    ~shared_id:(shared_id_ : connection_shared_id) ~state:(state_ : connection_state)
    ~type_:(type__ : product_type) ~location:(location_ : location) ~provider:(provider_ : provider)
    ~environment_id:(environment_id_ : environment_id) ~attach_point:(attach_point_ : attach_point)
    ~bandwidth:(bandwidth_ : connection_bandwidth)
    ~description:(description_ : connection_description) ~arn:(arn_ : amazon_resource_name)
    ~id:(id_ : connection_id) () =
  ({
     tags = tags_;
     activation_key = activation_key_;
     owner_account = owner_account_;
     billing_tier = billing_tier_;
     shared_id = shared_id_;
     state = state_;
     type_ = type__;
     location = location_;
     provider = provider_;
     environment_id = environment_id_;
     attach_point = attach_point_;
     bandwidth = bandwidth_;
     description = description_;
     arn = arn_;
     id = id_;
   }
    : connection)

let make_update_connection_response ?connection:(connection_ : connection option) () =
  ({ connection = connection_ } : update_connection_response)

let make_update_connection_request
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?bandwidth:(bandwidth_ : connection_bandwidth option)
    ?description:(description_ : connection_description option)
    ~identifier:(identifier_ : connection_id) () =
  ({
     client_token = client_token_;
     bandwidth = bandwidth_;
     description = description_;
     identifier = identifier_;
   }
    : update_connection_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~arn:(arn_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; arn = arn_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : tag_map) ~arn:(arn_ : amazon_resource_name) () =
  ({ tags = tags_; arn = arn_ } : tag_resource_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_map option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : list_tags_for_resource_request)

let make_bandwidths ?supported:(supported_ : bandwidth_list option)
    ?available:(available_ : bandwidth_list option) () =
  ({ supported = supported_; available = available_ } : bandwidths)

let make_environment
    ?remote_identifier_type:(remote_identifier_type_ : remote_account_identifier_type option)
    ?activation_page_url:(activation_page_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~type_:(type__ : product_type) ~bandwidths:(bandwidths_ : bandwidths)
    ~state:(state_ : environment_state) ~environment_id:(environment_id_ : environment_id)
    ~location:(location_ : location) ~provider:(provider_ : provider) () =
  ({
     remote_identifier_type = remote_identifier_type_;
     activation_page_url = activation_page_url_;
     type_ = type__;
     bandwidths = bandwidths_;
     state = state_;
     environment_id = environment_id_;
     location = location_;
     provider = provider_;
   }
    : environment)

let make_list_environments_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~environments:(environments_ : environment_list) () =
  ({ next_token = next_token_; environments = environments_ } : list_environments_response)

let make_list_environments_request ?location:(location_ : location option)
    ?provider:(provider_ : provider option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({
     location = location_;
     provider = provider_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_environments_request)

let make_connection_summary ?billing_tier:(billing_tier_ : billing_tier option)
    ~shared_id:(shared_id_ : connection_shared_id) ~state:(state_ : connection_state)
    ~type_:(type__ : product_type) ~location:(location_ : location) ~provider:(provider_ : provider)
    ~environment_id:(environment_id_ : environment_id) ~attach_point:(attach_point_ : attach_point)
    ~bandwidth:(bandwidth_ : connection_bandwidth)
    ~description:(description_ : connection_description) ~arn:(arn_ : amazon_resource_name)
    ~id:(id_ : connection_id) () =
  ({
     billing_tier = billing_tier_;
     shared_id = shared_id_;
     state = state_;
     type_ = type__;
     location = location_;
     provider = provider_;
     environment_id = environment_id_;
     attach_point = attach_point_;
     bandwidth = bandwidth_;
     description = description_;
     arn = arn_;
     id = id_;
   }
    : connection_summary)

let make_list_connections_response ?next_token:(next_token_ : next_token option)
    ?connections:(connections_ : connection_summaries_list option) () =
  ({ next_token = next_token_; connections = connections_ } : list_connections_response)

let make_list_connections_request ?attach_point:(attach_point_ : attach_point option)
    ?provider:(provider_ : provider option)
    ?environment_id:(environment_id_ : environment_id option)
    ?state:(state_ : connection_state option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({
     attach_point = attach_point_;
     provider = provider_;
     environment_id = environment_id_;
     state = state_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_connections_request)

let make_attach_point_descriptor ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~identifier:(identifier_ : Smaws_Lib.Smithy_api.Types.string_)
    ~type_:(type__ : attach_point_type) () =
  ({ name = name_; identifier = identifier_; type_ = type__ } : attach_point_descriptor)

let make_list_attach_points_response ?next_token:(next_token_ : next_token option)
    ~attach_points:(attach_points_ : attach_point_descriptor_list) () =
  ({ next_token = next_token_; attach_points = attach_points_ } : list_attach_points_response)

let make_list_attach_points_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~environment_id:(environment_id_ : environment_id) () =
  ({ next_token = next_token_; max_results = max_results_; environment_id = environment_id_ }
    : list_attach_points_request)

let make_describe_connection_proposal_response ~location:(location_ : location)
    ~provider:(provider_ : provider) ~environment_id:(environment_id_ : environment_id)
    ~bandwidth:(bandwidth_ : connection_bandwidth) () =
  ({
     location = location_;
     provider = provider_;
     environment_id = environment_id_;
     bandwidth = bandwidth_;
   }
    : describe_connection_proposal_response)

let make_describe_connection_proposal_request ~activation_key:(activation_key_ : activation_key) ()
    =
  ({ activation_key = activation_key_ } : describe_connection_proposal_request)

let make_accept_connection_proposal_response ?connection:(connection_ : connection option) () =
  ({ connection = connection_ } : accept_connection_proposal_response)

let make_accept_connection_proposal_request
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?tags:(tags_ : tag_map option) ?description:(description_ : connection_description option)
    ~activation_key:(activation_key_ : activation_key) ~attach_point:(attach_point_ : attach_point)
    () =
  ({
     client_token = client_token_;
     tags = tags_;
     description = description_;
     activation_key = activation_key_;
     attach_point = attach_point_;
   }
    : accept_connection_proposal_request)

let make_get_environment_response ~environment:(environment_ : environment) () =
  ({ environment = environment_ } : get_environment_response)

let make_get_environment_request ~id:(id_ : environment_id) () =
  ({ id = id_ } : get_environment_request)

let make_get_connection_response ?connection:(connection_ : connection option) () =
  ({ connection = connection_ } : get_connection_response)

let make_get_connection_request ~identifier:(identifier_ : connection_id) () =
  ({ identifier = identifier_ } : get_connection_request)

let make_delete_connection_response ~connection:(connection_ : connection) () =
  ({ connection = connection_ } : delete_connection_response)

let make_delete_connection_request
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~identifier:(identifier_ : connection_id) () =
  ({ client_token = client_token_; identifier = identifier_ } : delete_connection_request)

let make_create_connection_response ?connection:(connection_ : connection option) () =
  ({ connection = connection_ } : create_connection_response)

let make_create_connection_request
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?tags:(tags_ : tag_map option)
    ?remote_account:(remote_account_ : remote_account_identifier option)
    ?description:(description_ : connection_description option)
    ~environment_id:(environment_id_ : environment_id) ~attach_point:(attach_point_ : attach_point)
    ~bandwidth:(bandwidth_ : connection_bandwidth) () =
  ({
     client_token = client_token_;
     tags = tags_;
     remote_account = remote_account_;
     environment_id = environment_id_;
     attach_point = attach_point_;
     bandwidth = bandwidth_;
     description = description_;
   }
    : create_connection_request)
