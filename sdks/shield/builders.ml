open Types

let make_validation_exception_field ~name:(name_ : string_) ~message:(message_ : string_) () =
  ({ name = name_; message = message_ } : validation_exception_field)

let make_update_subscription_response () = (() : unit)

let make_update_subscription_request ?auto_renew:(auto_renew_ : auto_renew option) () =
  ({ auto_renew = auto_renew_ } : update_subscription_request)

let make_update_protection_group_response () = (() : unit)

let make_update_protection_group_request
    ?resource_type:(resource_type_ : protected_resource_type option)
    ?members:(members_ : protection_group_members option)
    ~protection_group_id:(protection_group_id_ : protection_group_id)
    ~aggregation:(aggregation_ : protection_group_aggregation)
    ~pattern:(pattern_ : protection_group_pattern) () =
  ({
     protection_group_id = protection_group_id_;
     aggregation = aggregation_;
     pattern = pattern_;
     resource_type = resource_type_;
     members = members_;
   }
    : update_protection_group_request)

let make_update_emergency_contact_settings_response () = (() : unit)

let make_emergency_contact ?phone_number:(phone_number_ : phone_number option)
    ?contact_notes:(contact_notes_ : contact_notes option)
    ~email_address:(email_address_ : email_address) () =
  ({ email_address = email_address_; phone_number = phone_number_; contact_notes = contact_notes_ }
    : emergency_contact)

let make_update_emergency_contact_settings_request
    ?emergency_contact_list:(emergency_contact_list_ : emergency_contact_list option) () =
  ({ emergency_contact_list = emergency_contact_list_ } : update_emergency_contact_settings_request)

let make_update_application_layer_automatic_response_response () = (() : unit)
let make_count_action () = (() : unit)
let make_block_action () = (() : unit)

let make_response_action ?block:(block_ : block_action option) ?count:(count_ : count_action option)
    () =
  ({ block = block_; count = count_ } : response_action)

let make_update_application_layer_automatic_response_request
    ~resource_arn:(resource_arn_ : resource_arn) ~action:(action_ : response_action) () =
  ({ resource_arn = resource_arn_; action = action_ }
    : update_application_layer_automatic_response_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : resource_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ?key:(key_ : tag_key option) ?value:(value_ : tag_value option) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : resource_arn)
    ~tags:(tags_ : tag_list) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : resource_arn) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_list_resources_in_protection_group_response ?next_token:(next_token_ : token option)
    ~resource_arns:(resource_arns_ : resource_arn_list) () =
  ({ resource_arns = resource_arns_; next_token = next_token_ }
    : list_resources_in_protection_group_response)

let make_list_resources_in_protection_group_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_results option)
    ~protection_group_id:(protection_group_id_ : protection_group_id) () =
  ({
     protection_group_id = protection_group_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_resources_in_protection_group_request)

let make_application_layer_automatic_response_configuration
    ~status:(status_ : application_layer_automatic_response_status)
    ~action:(action_ : response_action) () =
  ({ status = status_; action = action_ } : application_layer_automatic_response_configuration)

let make_protection ?id:(id_ : protection_id option) ?name:(name_ : protection_name option)
    ?resource_arn:(resource_arn_ : resource_arn option)
    ?health_check_ids:(health_check_ids_ : health_check_ids option)
    ?protection_arn:(protection_arn_ : resource_arn option)
    ?application_layer_automatic_response_configuration:
      (application_layer_automatic_response_configuration_ :
         application_layer_automatic_response_configuration option) () =
  ({
     id = id_;
     name = name_;
     resource_arn = resource_arn_;
     health_check_ids = health_check_ids_;
     protection_arn = protection_arn_;
     application_layer_automatic_response_configuration =
       application_layer_automatic_response_configuration_;
   }
    : protection)

let make_list_protections_response ?protections:(protections_ : protections option)
    ?next_token:(next_token_ : token option) () =
  ({ protections = protections_; next_token = next_token_ } : list_protections_response)

let make_inclusion_protection_filters ?resource_arns:(resource_arns_ : resource_arn_filters option)
    ?protection_names:(protection_names_ : protection_name_filters option)
    ?resource_types:(resource_types_ : protected_resource_type_filters option) () =
  ({
     resource_arns = resource_arns_;
     protection_names = protection_names_;
     resource_types = resource_types_;
   }
    : inclusion_protection_filters)

let make_list_protections_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_results option)
    ?inclusion_filters:(inclusion_filters_ : inclusion_protection_filters option) () =
  ({ next_token = next_token_; max_results = max_results_; inclusion_filters = inclusion_filters_ }
    : list_protections_request)

let make_protection_group ?resource_type:(resource_type_ : protected_resource_type option)
    ?protection_group_arn:(protection_group_arn_ : resource_arn option)
    ~protection_group_id:(protection_group_id_ : protection_group_id)
    ~aggregation:(aggregation_ : protection_group_aggregation)
    ~pattern:(pattern_ : protection_group_pattern) ~members:(members_ : protection_group_members) ()
    =
  ({
     protection_group_id = protection_group_id_;
     aggregation = aggregation_;
     pattern = pattern_;
     resource_type = resource_type_;
     members = members_;
     protection_group_arn = protection_group_arn_;
   }
    : protection_group)

let make_list_protection_groups_response ?next_token:(next_token_ : token option)
    ~protection_groups:(protection_groups_ : protection_groups) () =
  ({ protection_groups = protection_groups_; next_token = next_token_ }
    : list_protection_groups_response)

let make_inclusion_protection_group_filters
    ?protection_group_ids:(protection_group_ids_ : protection_group_id_filters option)
    ?patterns:(patterns_ : protection_group_pattern_filters option)
    ?resource_types:(resource_types_ : protected_resource_type_filters option)
    ?aggregations:(aggregations_ : protection_group_aggregation_filters option) () =
  ({
     protection_group_ids = protection_group_ids_;
     patterns = patterns_;
     resource_types = resource_types_;
     aggregations = aggregations_;
   }
    : inclusion_protection_group_filters)

let make_list_protection_groups_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : max_results option)
    ?inclusion_filters:(inclusion_filters_ : inclusion_protection_group_filters option) () =
  ({ next_token = next_token_; max_results = max_results_; inclusion_filters = inclusion_filters_ }
    : list_protection_groups_request)

let make_attack_vector_description ~vector_type:(vector_type_ : string_) () =
  ({ vector_type = vector_type_ } : attack_vector_description)

let make_attack_summary ?attack_id:(attack_id_ : string_ option)
    ?resource_arn:(resource_arn_ : string_ option)
    ?start_time:(start_time_ : attack_timestamp option)
    ?end_time:(end_time_ : attack_timestamp option)
    ?attack_vectors:(attack_vectors_ : attack_vector_description_list option) () =
  ({
     attack_id = attack_id_;
     resource_arn = resource_arn_;
     start_time = start_time_;
     end_time = end_time_;
     attack_vectors = attack_vectors_;
   }
    : attack_summary)

let make_list_attacks_response ?attack_summaries:(attack_summaries_ : attack_summaries option)
    ?next_token:(next_token_ : token option) () =
  ({ attack_summaries = attack_summaries_; next_token = next_token_ } : list_attacks_response)

let make_time_range ?from_inclusive:(from_inclusive_ : timestamp option)
    ?to_exclusive:(to_exclusive_ : timestamp option) () =
  ({ from_inclusive = from_inclusive_; to_exclusive = to_exclusive_ } : time_range)

let make_list_attacks_request ?resource_arns:(resource_arns_ : resource_arn_filter_list option)
    ?start_time:(start_time_ : time_range option) ?end_time:(end_time_ : time_range option)
    ?next_token:(next_token_ : token option) ?max_results:(max_results_ : max_results option) () =
  ({
     resource_arns = resource_arns_;
     start_time = start_time_;
     end_time = end_time_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_attacks_request)

let make_get_subscription_state_response
    ~subscription_state:(subscription_state_ : subscription_state) () =
  ({ subscription_state = subscription_state_ } : get_subscription_state_response)

let make_get_subscription_state_request () = (() : unit)
let make_enable_proactive_engagement_response () = (() : unit)
let make_enable_proactive_engagement_request () = (() : unit)
let make_enable_application_layer_automatic_response_response () = (() : unit)

let make_enable_application_layer_automatic_response_request
    ~resource_arn:(resource_arn_ : resource_arn) ~action:(action_ : response_action) () =
  ({ resource_arn = resource_arn_; action = action_ }
    : enable_application_layer_automatic_response_request)

let make_disassociate_health_check_response () = (() : unit)

let make_disassociate_health_check_request ~protection_id:(protection_id_ : protection_id)
    ~health_check_arn:(health_check_arn_ : health_check_arn) () =
  ({ protection_id = protection_id_; health_check_arn = health_check_arn_ }
    : disassociate_health_check_request)

let make_disassociate_drt_role_response () = (() : unit)
let make_disassociate_drt_role_request () = (() : unit)
let make_disassociate_drt_log_bucket_response () = (() : unit)

let make_disassociate_drt_log_bucket_request ~log_bucket:(log_bucket_ : log_bucket) () =
  ({ log_bucket = log_bucket_ } : disassociate_drt_log_bucket_request)

let make_disable_proactive_engagement_response () = (() : unit)
let make_disable_proactive_engagement_request () = (() : unit)
let make_disable_application_layer_automatic_response_response () = (() : unit)

let make_disable_application_layer_automatic_response_request
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : disable_application_layer_automatic_response_request)

let make_protection_group_arbitrary_pattern_limits ~max_members:(max_members_ : long) () =
  ({ max_members = max_members_ } : protection_group_arbitrary_pattern_limits)

let make_protection_group_pattern_type_limits
    ~arbitrary_pattern_limits:
      (arbitrary_pattern_limits_ : protection_group_arbitrary_pattern_limits) () =
  ({ arbitrary_pattern_limits = arbitrary_pattern_limits_ } : protection_group_pattern_type_limits)

let make_protection_group_limits ~max_protection_groups:(max_protection_groups_ : long)
    ~pattern_type_limits:(pattern_type_limits_ : protection_group_pattern_type_limits) () =
  ({ max_protection_groups = max_protection_groups_; pattern_type_limits = pattern_type_limits_ }
    : protection_group_limits)

let make_limit ?type_:(type__ : string_ option) ?max:(max_ : long option) () =
  ({ type_ = type__; max = max_ } : limit)

let make_protection_limits
    ~protected_resource_type_limits:(protected_resource_type_limits_ : limits) () =
  ({ protected_resource_type_limits = protected_resource_type_limits_ } : protection_limits)

let make_subscription_limits ~protection_limits:(protection_limits_ : protection_limits)
    ~protection_group_limits:(protection_group_limits_ : protection_group_limits) () =
  ({ protection_limits = protection_limits_; protection_group_limits = protection_group_limits_ }
    : subscription_limits)

let make_subscription ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option)
    ?time_commitment_in_seconds:(time_commitment_in_seconds_ : duration_in_seconds option)
    ?auto_renew:(auto_renew_ : auto_renew option) ?limits:(limits_ : limits option)
    ?proactive_engagement_status:(proactive_engagement_status_ : proactive_engagement_status option)
    ?subscription_arn:(subscription_arn_ : resource_arn option)
    ~subscription_limits:(subscription_limits_ : subscription_limits) () =
  ({
     start_time = start_time_;
     end_time = end_time_;
     time_commitment_in_seconds = time_commitment_in_seconds_;
     auto_renew = auto_renew_;
     limits = limits_;
     proactive_engagement_status = proactive_engagement_status_;
     subscription_limits = subscription_limits_;
     subscription_arn = subscription_arn_;
   }
    : subscription)

let make_describe_subscription_response ?subscription:(subscription_ : subscription option) () =
  ({ subscription = subscription_ } : describe_subscription_response)

let make_describe_subscription_request () = (() : unit)

let make_describe_protection_group_response ~protection_group:(protection_group_ : protection_group)
    () =
  ({ protection_group = protection_group_ } : describe_protection_group_response)

let make_describe_protection_group_request
    ~protection_group_id:(protection_group_id_ : protection_group_id) () =
  ({ protection_group_id = protection_group_id_ } : describe_protection_group_request)

let make_describe_protection_response ?protection:(protection_ : protection option) () =
  ({ protection = protection_ } : describe_protection_response)

let make_describe_protection_request ?protection_id:(protection_id_ : protection_id option)
    ?resource_arn:(resource_arn_ : resource_arn option) () =
  ({ protection_id = protection_id_; resource_arn = resource_arn_ } : describe_protection_request)

let make_describe_emergency_contact_settings_response
    ?emergency_contact_list:(emergency_contact_list_ : emergency_contact_list option) () =
  ({ emergency_contact_list = emergency_contact_list_ }
    : describe_emergency_contact_settings_response)

let make_describe_emergency_contact_settings_request () = (() : unit)

let make_describe_drt_access_response ?role_arn:(role_arn_ : role_arn option)
    ?log_bucket_list:(log_bucket_list_ : log_bucket_list option) () =
  ({ role_arn = role_arn_; log_bucket_list = log_bucket_list_ } : describe_drt_access_response)

let make_describe_drt_access_request () = (() : unit)

let make_attack_volume_statistics ~max:(max_ : double) () =
  ({ max = max_ } : attack_volume_statistics)

let make_attack_volume ?bits_per_second:(bits_per_second_ : attack_volume_statistics option)
    ?packets_per_second:(packets_per_second_ : attack_volume_statistics option)
    ?requests_per_second:(requests_per_second_ : attack_volume_statistics option) () =
  ({
     bits_per_second = bits_per_second_;
     packets_per_second = packets_per_second_;
     requests_per_second = requests_per_second_;
   }
    : attack_volume)

let make_attack_statistics_data_item ?attack_volume:(attack_volume_ : attack_volume option)
    ~attack_count:(attack_count_ : long) () =
  ({ attack_volume = attack_volume_; attack_count = attack_count_ } : attack_statistics_data_item)

let make_describe_attack_statistics_response ~time_range:(time_range_ : time_range)
    ~data_items:(data_items_ : attack_statistics_data_list) () =
  ({ time_range = time_range_; data_items = data_items_ } : describe_attack_statistics_response)

let make_describe_attack_statistics_request () = (() : unit)

let make_mitigation ?mitigation_name:(mitigation_name_ : string_ option) () =
  ({ mitigation_name = mitigation_name_ } : mitigation)

let make_contributor ?name:(name_ : string_ option) ?value:(value_ : long option) () =
  ({ name = name_; value = value_ } : contributor)

let make_attack_property ?attack_layer:(attack_layer_ : attack_layer option)
    ?attack_property_identifier:(attack_property_identifier_ : attack_property_identifier option)
    ?top_contributors:(top_contributors_ : top_contributors option) ?unit_:(unit__ : unit_ option)
    ?total:(total_ : long option) () =
  ({
     attack_layer = attack_layer_;
     attack_property_identifier = attack_property_identifier_;
     top_contributors = top_contributors_;
     unit_ = unit__;
     total = total_;
   }
    : attack_property)

let make_summarized_counter ?name:(name_ : string_ option) ?max:(max_ : double option)
    ?average:(average_ : double option) ?sum:(sum_ : double option) ?n:(n_ : integer option)
    ?unit_:(unit__ : string_ option) () =
  ({ name = name_; max = max_; average = average_; sum = sum_; n = n_; unit_ = unit__ }
    : summarized_counter)

let make_summarized_attack_vector
    ?vector_counters:(vector_counters_ : summarized_counter_list option)
    ~vector_type:(vector_type_ : string_) () =
  ({ vector_type = vector_type_; vector_counters = vector_counters_ } : summarized_attack_vector)

let make_sub_resource_summary ?type_:(type__ : sub_resource_type option) ?id:(id_ : string_ option)
    ?attack_vectors:(attack_vectors_ : summarized_attack_vector_list option)
    ?counters:(counters_ : summarized_counter_list option) () =
  ({ type_ = type__; id = id_; attack_vectors = attack_vectors_; counters = counters_ }
    : sub_resource_summary)

let make_attack_detail ?attack_id:(attack_id_ : attack_id option)
    ?resource_arn:(resource_arn_ : resource_arn option)
    ?sub_resources:(sub_resources_ : sub_resource_summary_list option)
    ?start_time:(start_time_ : attack_timestamp option)
    ?end_time:(end_time_ : attack_timestamp option)
    ?attack_counters:(attack_counters_ : summarized_counter_list option)
    ?attack_properties:(attack_properties_ : attack_properties option)
    ?mitigations:(mitigations_ : mitigation_list option) () =
  ({
     attack_id = attack_id_;
     resource_arn = resource_arn_;
     sub_resources = sub_resources_;
     start_time = start_time_;
     end_time = end_time_;
     attack_counters = attack_counters_;
     attack_properties = attack_properties_;
     mitigations = mitigations_;
   }
    : attack_detail)

let make_describe_attack_response ?attack:(attack_ : attack_detail option) () =
  ({ attack = attack_ } : describe_attack_response)

let make_describe_attack_request ~attack_id:(attack_id_ : attack_id) () =
  ({ attack_id = attack_id_ } : describe_attack_request)

let make_delete_subscription_response () = (() : unit)
let make_delete_subscription_request () = (() : unit)
let make_delete_protection_group_response () = (() : unit)

let make_delete_protection_group_request
    ~protection_group_id:(protection_group_id_ : protection_group_id) () =
  ({ protection_group_id = protection_group_id_ } : delete_protection_group_request)

let make_delete_protection_response () = (() : unit)

let make_delete_protection_request ~protection_id:(protection_id_ : protection_id) () =
  ({ protection_id = protection_id_ } : delete_protection_request)

let make_create_subscription_response () = (() : unit)
let make_create_subscription_request () = (() : unit)
let make_create_protection_group_response () = (() : unit)

let make_create_protection_group_request
    ?resource_type:(resource_type_ : protected_resource_type option)
    ?members:(members_ : protection_group_members option) ?tags:(tags_ : tag_list option)
    ~protection_group_id:(protection_group_id_ : protection_group_id)
    ~aggregation:(aggregation_ : protection_group_aggregation)
    ~pattern:(pattern_ : protection_group_pattern) () =
  ({
     protection_group_id = protection_group_id_;
     aggregation = aggregation_;
     pattern = pattern_;
     resource_type = resource_type_;
     members = members_;
     tags = tags_;
   }
    : create_protection_group_request)

let make_create_protection_response ?protection_id:(protection_id_ : protection_id option) () =
  ({ protection_id = protection_id_ } : create_protection_response)

let make_create_protection_request ?tags:(tags_ : tag_list option) ~name:(name_ : protection_name)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ name = name_; resource_arn = resource_arn_; tags = tags_ } : create_protection_request)

let make_associate_proactive_engagement_details_response () = (() : unit)

let make_associate_proactive_engagement_details_request
    ~emergency_contact_list:(emergency_contact_list_ : emergency_contact_list) () =
  ({ emergency_contact_list = emergency_contact_list_ }
    : associate_proactive_engagement_details_request)

let make_associate_health_check_response () = (() : unit)

let make_associate_health_check_request ~protection_id:(protection_id_ : protection_id)
    ~health_check_arn:(health_check_arn_ : health_check_arn) () =
  ({ protection_id = protection_id_; health_check_arn = health_check_arn_ }
    : associate_health_check_request)

let make_associate_drt_role_response () = (() : unit)

let make_associate_drt_role_request ~role_arn:(role_arn_ : role_arn) () =
  ({ role_arn = role_arn_ } : associate_drt_role_request)

let make_associate_drt_log_bucket_response () = (() : unit)

let make_associate_drt_log_bucket_request ~log_bucket:(log_bucket_ : log_bucket) () =
  ({ log_bucket = log_bucket_ } : associate_drt_log_bucket_request)
