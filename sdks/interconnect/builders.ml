open Types

let make_connection ?billing_tier:(billing_tier_ : billing_tier option)
    ?tags:(tags_ : tag_map option) ~id:(id_ : connection_id) ~arn:(arn_ : amazon_resource_name)
    ~description:(description_ : connection_description)
    ~bandwidth:(bandwidth_ : connection_bandwidth) ~attach_point:(attach_point_ : attach_point)
    ~environment_id:(environment_id_ : environment_id) ~provider:(provider_ : provider)
    ~location:(location_ : location) ~type_:(type__ : product_type)
    ~state:(state_ : connection_state) ~shared_id:(shared_id_ : connection_shared_id)
    ~owner_account:(owner_account_ : owner_account_id)
    ~activation_key:(activation_key_ : activation_key) () =
  ({
     id = id_;
     arn = arn_;
     description = description_;
     bandwidth = bandwidth_;
     attach_point = attach_point_;
     environment_id = environment_id_;
     provider = provider_;
     location = location_;
     type_ = type__;
     state = state_;
     shared_id = shared_id_;
     billing_tier = billing_tier_;
     owner_account = owner_account_;
     activation_key = activation_key_;
     tags = tags_;
   }
    : connection)

let make_accept_connection_proposal_response ?connection:(connection_ : connection option) () =
  ({ connection = connection_ } : accept_connection_proposal_response)

let make_accept_connection_proposal_request
    ?description:(description_ : connection_description option) ?tags:(tags_ : tag_map option)
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~attach_point:(attach_point_ : attach_point) ~activation_key:(activation_key_ : activation_key)
    () =
  ({
     attach_point = attach_point_;
     activation_key = activation_key_;
     description = description_;
     tags = tags_;
     client_token = client_token_;
   }
    : accept_connection_proposal_request)

let make_attach_point_descriptor ~type_:(type__ : attach_point_type)
    ~identifier:(identifier_ : Smaws_Lib.Smithy_api.Types.string_)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ type_ = type__; identifier = identifier_; name = name_ } : attach_point_descriptor)

let make_bandwidths ?available:(available_ : bandwidth_list option)
    ?supported:(supported_ : bandwidth_list option) () =
  ({ available = available_; supported = supported_ } : bandwidths)

let make_connection_summary ?billing_tier:(billing_tier_ : billing_tier option)
    ~id:(id_ : connection_id) ~arn:(arn_ : amazon_resource_name)
    ~description:(description_ : connection_description)
    ~bandwidth:(bandwidth_ : connection_bandwidth) ~attach_point:(attach_point_ : attach_point)
    ~environment_id:(environment_id_ : environment_id) ~provider:(provider_ : provider)
    ~location:(location_ : location) ~type_:(type__ : product_type)
    ~state:(state_ : connection_state) ~shared_id:(shared_id_ : connection_shared_id) () =
  ({
     id = id_;
     arn = arn_;
     description = description_;
     bandwidth = bandwidth_;
     attach_point = attach_point_;
     environment_id = environment_id_;
     provider = provider_;
     location = location_;
     type_ = type__;
     state = state_;
     shared_id = shared_id_;
     billing_tier = billing_tier_;
   }
    : connection_summary)

let make_create_connection_response ?connection:(connection_ : connection option) () =
  ({ connection = connection_ } : create_connection_response)

let make_create_connection_request ?description:(description_ : connection_description option)
    ?remote_account:(remote_account_ : remote_account_identifier option)
    ?tags:(tags_ : tag_map option)
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~bandwidth:(bandwidth_ : connection_bandwidth) ~attach_point:(attach_point_ : attach_point)
    ~environment_id:(environment_id_ : environment_id) () =
  ({
     description = description_;
     bandwidth = bandwidth_;
     attach_point = attach_point_;
     environment_id = environment_id_;
     remote_account = remote_account_;
     tags = tags_;
     client_token = client_token_;
   }
    : create_connection_request)

let make_delete_connection_response ~connection:(connection_ : connection) () =
  ({ connection = connection_ } : delete_connection_response)

let make_delete_connection_request
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~identifier:(identifier_ : connection_id) () =
  ({ identifier = identifier_; client_token = client_token_ } : delete_connection_request)

let make_describe_connection_proposal_response ~bandwidth:(bandwidth_ : connection_bandwidth)
    ~environment_id:(environment_id_ : environment_id) ~provider:(provider_ : provider)
    ~location:(location_ : location) () =
  ({
     bandwidth = bandwidth_;
     environment_id = environment_id_;
     provider = provider_;
     location = location_;
   }
    : describe_connection_proposal_response)

let make_describe_connection_proposal_request ~activation_key:(activation_key_ : activation_key) ()
    =
  ({ activation_key = activation_key_ } : describe_connection_proposal_request)

let make_environment
    ?activation_page_url:(activation_page_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?remote_identifier_type:(remote_identifier_type_ : remote_account_identifier_type option)
    ~provider:(provider_ : provider) ~location:(location_ : location)
    ~environment_id:(environment_id_ : environment_id) ~state:(state_ : environment_state)
    ~bandwidths:(bandwidths_ : bandwidths) ~type_:(type__ : product_type) () =
  ({
     provider = provider_;
     location = location_;
     environment_id = environment_id_;
     state = state_;
     bandwidths = bandwidths_;
     type_ = type__;
     activation_page_url = activation_page_url_;
     remote_identifier_type = remote_identifier_type_;
   }
    : environment)

let make_get_connection_response ?connection:(connection_ : connection option) () =
  ({ connection = connection_ } : get_connection_response)

let make_get_connection_request ~identifier:(identifier_ : connection_id) () =
  ({ identifier = identifier_ } : get_connection_request)

let make_get_environment_response ~environment:(environment_ : environment) () =
  ({ environment = environment_ } : get_environment_response)

let make_get_environment_request ~id:(id_ : environment_id) () =
  ({ id = id_ } : get_environment_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~arn:(arn_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ arn = arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~arn:(arn_ : amazon_resource_name) ~tags:(tags_ : tag_map) () =
  ({ arn = arn_; tags = tags_ } : tag_resource_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_map option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : list_tags_for_resource_request)

let make_list_attach_points_response ?next_token:(next_token_ : next_token option)
    ~attach_points:(attach_points_ : attach_point_descriptor_list) () =
  ({ attach_points = attach_points_; next_token = next_token_ } : list_attach_points_response)

let make_list_attach_points_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~environment_id:(environment_id_ : environment_id)
    () =
  ({ environment_id = environment_id_; max_results = max_results_; next_token = next_token_ }
    : list_attach_points_request)

let make_list_connections_response ?connections:(connections_ : connection_summaries_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ connections = connections_; next_token = next_token_ } : list_connections_response)

let make_list_connections_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?state:(state_ : connection_state option)
    ?environment_id:(environment_id_ : environment_id option)
    ?provider:(provider_ : provider option) ?attach_point:(attach_point_ : attach_point option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     state = state_;
     environment_id = environment_id_;
     provider = provider_;
     attach_point = attach_point_;
   }
    : list_connections_request)

let make_list_environments_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~environments:(environments_ : environment_list) () =
  ({ environments = environments_; next_token = next_token_ } : list_environments_response)

let make_list_environments_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?provider:(provider_ : provider option)
    ?location:(location_ : location option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     provider = provider_;
     location = location_;
   }
    : list_environments_request)

let make_update_connection_response ?connection:(connection_ : connection option) () =
  ({ connection = connection_ } : update_connection_response)

let make_update_connection_request ?description:(description_ : connection_description option)
    ?bandwidth:(bandwidth_ : connection_bandwidth option)
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~identifier:(identifier_ : connection_id) () =
  ({
     identifier = identifier_;
     description = description_;
     bandwidth = bandwidth_;
     client_token = client_token_;
   }
    : update_connection_request)
