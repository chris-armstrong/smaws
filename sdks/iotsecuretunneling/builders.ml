open Types

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_tunnel_summary ?last_updated_at:(last_updated_at_ : date_type option)
    ?created_at:(created_at_ : date_type option) ?description:(description_ : description option)
    ?status:(status_ : tunnel_status option) ?tunnel_arn:(tunnel_arn_ : tunnel_arn option)
    ?tunnel_id:(tunnel_id_ : tunnel_id option) () =
  ({
     last_updated_at = last_updated_at_;
     created_at = created_at_;
     description = description_;
     status = status_;
     tunnel_arn = tunnel_arn_;
     tunnel_id = tunnel_id_;
   }
    : tunnel_summary)

let make_connection_state ?last_updated_at:(last_updated_at_ : date_type option)
    ?status:(status_ : connection_status option) () =
  ({ last_updated_at = last_updated_at_; status = status_ } : connection_state)

let make_destination_config ?thing_name:(thing_name_ : thing_name option)
    ~services:(services_ : service_list) () =
  ({ services = services_; thing_name = thing_name_ } : destination_config)

let make_timeout_config
    ?max_lifetime_timeout_minutes:(max_lifetime_timeout_minutes_ : timeout_in_min option) () =
  ({ max_lifetime_timeout_minutes = max_lifetime_timeout_minutes_ } : timeout_config)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tunnel ?last_updated_at:(last_updated_at_ : date_type option)
    ?created_at:(created_at_ : date_type option) ?tags:(tags_ : tag_list option)
    ?timeout_config:(timeout_config_ : timeout_config option)
    ?destination_config:(destination_config_ : destination_config option)
    ?description:(description_ : description option)
    ?destination_connection_state:(destination_connection_state_ : connection_state option)
    ?source_connection_state:(source_connection_state_ : connection_state option)
    ?status:(status_ : tunnel_status option) ?tunnel_arn:(tunnel_arn_ : tunnel_arn option)
    ?tunnel_id:(tunnel_id_ : tunnel_id option) () =
  ({
     last_updated_at = last_updated_at_;
     created_at = created_at_;
     tags = tags_;
     timeout_config = timeout_config_;
     destination_config = destination_config_;
     description = description_;
     destination_connection_state = destination_connection_state_;
     source_connection_state = source_connection_state_;
     status = status_;
     tunnel_arn = tunnel_arn_;
     tunnel_id = tunnel_id_;
   }
    : tunnel)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_rotate_tunnel_access_token_response
    ?destination_access_token:(destination_access_token_ : client_access_token option)
    ?source_access_token:(source_access_token_ : client_access_token option)
    ?tunnel_arn:(tunnel_arn_ : tunnel_arn option) () =
  ({
     destination_access_token = destination_access_token_;
     source_access_token = source_access_token_;
     tunnel_arn = tunnel_arn_;
   }
    : rotate_tunnel_access_token_response)

let make_rotate_tunnel_access_token_request
    ?destination_config:(destination_config_ : destination_config option)
    ~client_mode:(client_mode_ : client_mode) ~tunnel_id:(tunnel_id_ : tunnel_id) () =
  ({ destination_config = destination_config_; client_mode = client_mode_; tunnel_id = tunnel_id_ }
    : rotate_tunnel_access_token_request)

let make_open_tunnel_response
    ?destination_access_token:(destination_access_token_ : client_access_token option)
    ?source_access_token:(source_access_token_ : client_access_token option)
    ?tunnel_arn:(tunnel_arn_ : tunnel_arn option) ?tunnel_id:(tunnel_id_ : tunnel_id option) () =
  ({
     destination_access_token = destination_access_token_;
     source_access_token = source_access_token_;
     tunnel_arn = tunnel_arn_;
     tunnel_id = tunnel_id_;
   }
    : open_tunnel_response)

let make_open_tunnel_request ?timeout_config:(timeout_config_ : timeout_config option)
    ?destination_config:(destination_config_ : destination_config option)
    ?tags:(tags_ : tag_list option) ?description:(description_ : description option) () =
  ({
     timeout_config = timeout_config_;
     destination_config = destination_config_;
     tags = tags_;
     description = description_;
   }
    : open_tunnel_request)

let make_list_tunnels_response ?next_token:(next_token_ : next_token option)
    ?tunnel_summaries:(tunnel_summaries_ : tunnel_summary_list option) () =
  ({ next_token = next_token_; tunnel_summaries = tunnel_summaries_ } : list_tunnels_response)

let make_list_tunnels_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?thing_name:(thing_name_ : thing_name option)
    () =
  ({ next_token = next_token_; max_results = max_results_; thing_name = thing_name_ }
    : list_tunnels_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_describe_tunnel_response ?tunnel:(tunnel_ : tunnel option) () =
  ({ tunnel = tunnel_ } : describe_tunnel_response)

let make_describe_tunnel_request ~tunnel_id:(tunnel_id_ : tunnel_id) () =
  ({ tunnel_id = tunnel_id_ } : describe_tunnel_request)

let make_close_tunnel_response () = (() : unit)

let make_close_tunnel_request ?delete:(delete_ : delete_flag option)
    ~tunnel_id:(tunnel_id_ : tunnel_id) () =
  ({ delete = delete_; tunnel_id = tunnel_id_ } : close_tunnel_request)
