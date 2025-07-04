open Smaws_Lib
open Types
let make_validation_exception_field ~message:(message_ : string)
  ~name:(name_ : string) () =
  ({ message = message_; name = name_ } : validation_exception_field)
let make_update_subscription_response () = (() : unit)
let make_update_subscription_request
  ?auto_renew:(auto_renew_ : auto_renew option) () =
  ({ auto_renew = auto_renew_ } : update_subscription_request)
let make_update_protection_group_response () = (() : unit)
let make_update_protection_group_request
  ?members:(members_ : string list option)
  ?resource_type:(resource_type_ : protected_resource_type option)
  ~pattern:(pattern_ : protection_group_pattern)
  ~aggregation:(aggregation_ : protection_group_aggregation)
  ~protection_group_id:(protection_group_id_ : string) () =
  ({
     members = members_;
     resource_type = resource_type_;
     pattern = pattern_;
     aggregation = aggregation_;
     protection_group_id = protection_group_id_
   } : update_protection_group_request)
let make_update_emergency_contact_settings_response () = (() : unit)
let make_emergency_contact ?contact_notes:(contact_notes_ : string option)
  ?phone_number:(phone_number_ : string option)
  ~email_address:(email_address_ : string) () =
  ({
     contact_notes = contact_notes_;
     phone_number = phone_number_;
     email_address = email_address_
   } : emergency_contact)
let make_update_emergency_contact_settings_request
  ?emergency_contact_list:(emergency_contact_list_ :
                            emergency_contact list option)
  () =
  ({ emergency_contact_list = emergency_contact_list_ } : update_emergency_contact_settings_request)
let make_update_application_layer_automatic_response_response () =
  (() : unit)
let make_block_action () = (() : unit)
let make_count_action () = (() : unit)
let make_response_action ?count:(count_ : unit option)
  ?block:(block_ : unit option) () =
  ({ count = count_; block = block_ } : response_action)
let make_update_application_layer_automatic_response_request
  ~action:(action_ : response_action) ~resource_arn:(resource_arn_ : string)
  () =
  ({ action = action_; resource_arn = resource_arn_ } : update_application_layer_automatic_response_request)
let make_untag_resource_response () = (() : unit)
let make_untag_resource_request ~tag_keys:(tag_keys_ : string list)
  ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)
let make_contributor ?value:(value_ : int option)
  ?name:(name_ : string option) () =
  ({ value = value_; name = name_ } : contributor)
let make_time_range
  ?to_exclusive:(to_exclusive_ : CoreTypes.Timestamp.t option)
  ?from_inclusive:(from_inclusive_ : CoreTypes.Timestamp.t option) () =
  ({ to_exclusive = to_exclusive_; from_inclusive = from_inclusive_ } : 
  time_range)
let make_tag_resource_response () = (() : unit)
let make_tag ?value:(value_ : string option) ?key:(key_ : string option) () =
  ({ value = value_; key = key_ } : tag)
let make_tag_resource_request ~tags:(tags_ : tag list)
  ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)
let make_summarized_counter ?unit_:(unit__ : string option)
  ?n:(n_ : int option) ?sum:(sum_ : float option)
  ?average:(average_ : float option) ?max:(max_ : float option)
  ?name:(name_ : string option) () =
  ({
     unit_ = unit__;
     n = n_;
     sum = sum_;
     average = average_;
     max = max_;
     name = name_
   } : summarized_counter)
let make_summarized_attack_vector
  ?vector_counters:(vector_counters_ : summarized_counter list option)
  ~vector_type:(vector_type_ : string) () =
  ({ vector_counters = vector_counters_; vector_type = vector_type_ } : 
  summarized_attack_vector)
let make_limit ?max:(max_ : int option) ?type_:(type__ : string option) () =
  ({ max = max_; type_ = type__ } : limit)
let make_protection_limits
  ~protected_resource_type_limits:(protected_resource_type_limits_ :
                                    limit list)
  () =
  ({ protected_resource_type_limits = protected_resource_type_limits_ } : 
  protection_limits)
let make_protection_group_arbitrary_pattern_limits
  ~max_members:(max_members_ : int) () =
  ({ max_members = max_members_ } : protection_group_arbitrary_pattern_limits)
let make_protection_group_pattern_type_limits
  ~arbitrary_pattern_limits:(arbitrary_pattern_limits_ :
                              protection_group_arbitrary_pattern_limits)
  () =
  ({ arbitrary_pattern_limits = arbitrary_pattern_limits_ } : protection_group_pattern_type_limits)
let make_protection_group_limits
  ~pattern_type_limits:(pattern_type_limits_ :
                         protection_group_pattern_type_limits)
  ~max_protection_groups:(max_protection_groups_ : int) () =
  ({
     pattern_type_limits = pattern_type_limits_;
     max_protection_groups = max_protection_groups_
   } : protection_group_limits)
let make_subscription_limits
  ~protection_group_limits:(protection_group_limits_ :
                             protection_group_limits)
  ~protection_limits:(protection_limits_ : protection_limits) () =
  ({
     protection_group_limits = protection_group_limits_;
     protection_limits = protection_limits_
   } : subscription_limits)
let make_subscription ?subscription_arn:(subscription_arn_ : string option)
  ?proactive_engagement_status:(proactive_engagement_status_ :
                                 proactive_engagement_status option)
  ?limits:(limits_ : limit list option)
  ?auto_renew:(auto_renew_ : auto_renew option)
  ?time_commitment_in_seconds:(time_commitment_in_seconds_ : int option)
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option)
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option)
  ~subscription_limits:(subscription_limits_ : subscription_limits) () =
  ({
     subscription_arn = subscription_arn_;
     subscription_limits = subscription_limits_;
     proactive_engagement_status = proactive_engagement_status_;
     limits = limits_;
     auto_renew = auto_renew_;
     time_commitment_in_seconds = time_commitment_in_seconds_;
     end_time = end_time_;
     start_time = start_time_
   } : subscription)
let make_sub_resource_summary
  ?counters:(counters_ : summarized_counter list option)
  ?attack_vectors:(attack_vectors_ : summarized_attack_vector list option)
  ?id:(id_ : string option) ?type_:(type__ : sub_resource_type option) () =
  ({
     counters = counters_;
     attack_vectors = attack_vectors_;
     id = id_;
     type_ = type__
   } : sub_resource_summary)
let make_application_layer_automatic_response_configuration
  ~action:(action_ : response_action)
  ~status:(status_ : application_layer_automatic_response_status) () =
  ({ action = action_; status = status_ } : application_layer_automatic_response_configuration)
let make_protection
  ?application_layer_automatic_response_configuration:(application_layer_automatic_response_configuration_
                                                        :
                                                        application_layer_automatic_response_configuration
                                                          option)
  ?protection_arn:(protection_arn_ : string option)
  ?health_check_ids:(health_check_ids_ : string list option)
  ?resource_arn:(resource_arn_ : string option) ?name:(name_ : string option)
  ?id:(id_ : string option) () =
  ({
     application_layer_automatic_response_configuration =
       application_layer_automatic_response_configuration_;
     protection_arn = protection_arn_;
     health_check_ids = health_check_ids_;
     resource_arn = resource_arn_;
     name = name_;
     id = id_
   } : protection)
let make_protection_group
  ?protection_group_arn:(protection_group_arn_ : string option)
  ?resource_type:(resource_type_ : protected_resource_type option)
  ~members:(members_ : string list)
  ~pattern:(pattern_ : protection_group_pattern)
  ~aggregation:(aggregation_ : protection_group_aggregation)
  ~protection_group_id:(protection_group_id_ : string) () =
  ({
     protection_group_arn = protection_group_arn_;
     members = members_;
     resource_type = resource_type_;
     pattern = pattern_;
     aggregation = aggregation_;
     protection_group_id = protection_group_id_
   } : protection_group)
let make_mitigation ?mitigation_name:(mitigation_name_ : string option) () =
  ({ mitigation_name = mitigation_name_ } : mitigation)
let make_list_tags_for_resource_response ?tags:(tags_ : tag list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)
let make_list_tags_for_resource_request
  ~resource_ar_n:(resource_ar_n_ : string) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)
let make_list_resources_in_protection_group_response
  ?next_token:(next_token_ : string option)
  ~resource_arns:(resource_arns_ : string list) () =
  ({ next_token = next_token_; resource_arns = resource_arns_ } : list_resources_in_protection_group_response)
let make_list_resources_in_protection_group_request
  ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option)
  ~protection_group_id:(protection_group_id_ : string) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     protection_group_id = protection_group_id_
   } : list_resources_in_protection_group_request)
let make_list_protections_response ?next_token:(next_token_ : string option)
  ?protections:(protections_ : protection list option) () =
  ({ next_token = next_token_; protections = protections_ } : list_protections_response)
let make_inclusion_protection_filters
  ?resource_types:(resource_types_ : protected_resource_type list option)
  ?protection_names:(protection_names_ : string list option)
  ?resource_arns:(resource_arns_ : string list option) () =
  ({
     resource_types = resource_types_;
     protection_names = protection_names_;
     resource_arns = resource_arns_
   } : inclusion_protection_filters)
let make_list_protections_request
  ?inclusion_filters:(inclusion_filters_ :
                       inclusion_protection_filters option)
  ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option) () =
  ({
     inclusion_filters = inclusion_filters_;
     max_results = max_results_;
     next_token = next_token_
   } : list_protections_request)
let make_list_protection_groups_response
  ?next_token:(next_token_ : string option)
  ~protection_groups:(protection_groups_ : protection_group list) () =
  ({ next_token = next_token_; protection_groups = protection_groups_ } : 
  list_protection_groups_response)
let make_inclusion_protection_group_filters
  ?aggregations:(aggregations_ : protection_group_aggregation list option)
  ?resource_types:(resource_types_ : protected_resource_type list option)
  ?patterns:(patterns_ : protection_group_pattern list option)
  ?protection_group_ids:(protection_group_ids_ : string list option) () =
  ({
     aggregations = aggregations_;
     resource_types = resource_types_;
     patterns = patterns_;
     protection_group_ids = protection_group_ids_
   } : inclusion_protection_group_filters)
let make_list_protection_groups_request
  ?inclusion_filters:(inclusion_filters_ :
                       inclusion_protection_group_filters option)
  ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option) () =
  ({
     inclusion_filters = inclusion_filters_;
     max_results = max_results_;
     next_token = next_token_
   } : list_protection_groups_request)
let make_attack_vector_description ~vector_type:(vector_type_ : string) () =
  ({ vector_type = vector_type_ } : attack_vector_description)
let make_attack_summary
  ?attack_vectors:(attack_vectors_ : attack_vector_description list option)
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option)
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option)
  ?resource_arn:(resource_arn_ : string option)
  ?attack_id:(attack_id_ : string option) () =
  ({
     attack_vectors = attack_vectors_;
     end_time = end_time_;
     start_time = start_time_;
     resource_arn = resource_arn_;
     attack_id = attack_id_
   } : attack_summary)
let make_list_attacks_response ?next_token:(next_token_ : string option)
  ?attack_summaries:(attack_summaries_ : attack_summary list option) () =
  ({ next_token = next_token_; attack_summaries = attack_summaries_ } : 
  list_attacks_response)
let make_list_attacks_request ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option)
  ?end_time:(end_time_ : time_range option)
  ?start_time:(start_time_ : time_range option)
  ?resource_arns:(resource_arns_ : string list option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     end_time = end_time_;
     start_time = start_time_;
     resource_arns = resource_arns_
   } : list_attacks_request)
let make_get_subscription_state_response
  ~subscription_state:(subscription_state_ : subscription_state) () =
  ({ subscription_state = subscription_state_ } : get_subscription_state_response)
let make_get_subscription_state_request () = (() : unit)
let make_enable_proactive_engagement_response () = (() : unit)
let make_enable_proactive_engagement_request () = (() : unit)
let make_enable_application_layer_automatic_response_response () =
  (() : unit)
let make_enable_application_layer_automatic_response_request
  ~action:(action_ : response_action) ~resource_arn:(resource_arn_ : string)
  () =
  ({ action = action_; resource_arn = resource_arn_ } : enable_application_layer_automatic_response_request)
let make_disassociate_health_check_response () = (() : unit)
let make_disassociate_health_check_request
  ~health_check_arn:(health_check_arn_ : string)
  ~protection_id:(protection_id_ : string) () =
  ({ health_check_arn = health_check_arn_; protection_id = protection_id_ } : 
  disassociate_health_check_request)
let make_disassociate_drt_role_response () = (() : unit)
let make_disassociate_drt_role_request () = (() : unit)
let make_disassociate_drt_log_bucket_response () = (() : unit)
let make_disassociate_drt_log_bucket_request
  ~log_bucket:(log_bucket_ : string) () =
  ({ log_bucket = log_bucket_ } : disassociate_drt_log_bucket_request)
let make_disable_proactive_engagement_response () = (() : unit)
let make_disable_proactive_engagement_request () = (() : unit)
let make_disable_application_layer_automatic_response_response () =
  (() : unit)
let make_disable_application_layer_automatic_response_request
  ~resource_arn:(resource_arn_ : string) () =
  ({ resource_arn = resource_arn_ } : disable_application_layer_automatic_response_request)
let make_describe_subscription_response
  ?subscription:(subscription_ : subscription option) () =
  ({ subscription = subscription_ } : describe_subscription_response)
let make_describe_subscription_request () = (() : unit)
let make_describe_protection_response
  ?protection:(protection_ : protection option) () =
  ({ protection = protection_ } : describe_protection_response)
let make_describe_protection_request
  ?resource_arn:(resource_arn_ : string option)
  ?protection_id:(protection_id_ : string option) () =
  ({ resource_arn = resource_arn_; protection_id = protection_id_ } : 
  describe_protection_request)
let make_describe_protection_group_response
  ~protection_group:(protection_group_ : protection_group) () =
  ({ protection_group = protection_group_ } : describe_protection_group_response)
let make_describe_protection_group_request
  ~protection_group_id:(protection_group_id_ : string) () =
  ({ protection_group_id = protection_group_id_ } : describe_protection_group_request)
let make_describe_emergency_contact_settings_response
  ?emergency_contact_list:(emergency_contact_list_ :
                            emergency_contact list option)
  () =
  ({ emergency_contact_list = emergency_contact_list_ } : describe_emergency_contact_settings_response)
let make_describe_emergency_contact_settings_request () = (() : unit)
let make_describe_drt_access_response
  ?log_bucket_list:(log_bucket_list_ : string list option)
  ?role_arn:(role_arn_ : string option) () =
  ({ log_bucket_list = log_bucket_list_; role_arn = role_arn_ } : describe_drt_access_response)
let make_describe_drt_access_request () = (() : unit)
let make_attack_volume_statistics ~max:(max_ : float) () =
  ({ max = max_ } : attack_volume_statistics)
let make_attack_volume
  ?requests_per_second:(requests_per_second_ :
                         attack_volume_statistics option)
  ?packets_per_second:(packets_per_second_ : attack_volume_statistics option)
  ?bits_per_second:(bits_per_second_ : attack_volume_statistics option) () =
  ({
     requests_per_second = requests_per_second_;
     packets_per_second = packets_per_second_;
     bits_per_second = bits_per_second_
   } : attack_volume)
let make_attack_statistics_data_item
  ?attack_volume:(attack_volume_ : attack_volume option)
  ~attack_count:(attack_count_ : int) () =
  ({ attack_count = attack_count_; attack_volume = attack_volume_ } : 
  attack_statistics_data_item)
let make_describe_attack_statistics_response
  ~data_items:(data_items_ : attack_statistics_data_item list)
  ~time_range:(time_range_ : time_range) () =
  ({ data_items = data_items_; time_range = time_range_ } : describe_attack_statistics_response)
let make_describe_attack_statistics_request () = (() : unit)
let make_attack_property ?total:(total_ : int option)
  ?unit_:(unit__ : unit_ option)
  ?top_contributors:(top_contributors_ : contributor list option)
  ?attack_property_identifier:(attack_property_identifier_ :
                                attack_property_identifier option)
  ?attack_layer:(attack_layer_ : attack_layer option) () =
  ({
     total = total_;
     unit_ = unit__;
     top_contributors = top_contributors_;
     attack_property_identifier = attack_property_identifier_;
     attack_layer = attack_layer_
   } : attack_property)
let make_attack_detail ?mitigations:(mitigations_ : mitigation list option)
  ?attack_properties:(attack_properties_ : attack_property list option)
  ?attack_counters:(attack_counters_ : summarized_counter list option)
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option)
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option)
  ?sub_resources:(sub_resources_ : sub_resource_summary list option)
  ?resource_arn:(resource_arn_ : string option)
  ?attack_id:(attack_id_ : string option) () =
  ({
     mitigations = mitigations_;
     attack_properties = attack_properties_;
     attack_counters = attack_counters_;
     end_time = end_time_;
     start_time = start_time_;
     sub_resources = sub_resources_;
     resource_arn = resource_arn_;
     attack_id = attack_id_
   } : attack_detail)
let make_describe_attack_response ?attack:(attack_ : attack_detail option) ()
  = ({ attack = attack_ } : describe_attack_response)
let make_describe_attack_request ~attack_id:(attack_id_ : string) () =
  ({ attack_id = attack_id_ } : describe_attack_request)
let make_delete_subscription_response () = (() : unit)
let make_delete_subscription_request () = (() : unit)
let make_delete_protection_response () = (() : unit)
let make_delete_protection_request ~protection_id:(protection_id_ : string)
  () = ({ protection_id = protection_id_ } : delete_protection_request)
let make_delete_protection_group_response () = (() : unit)
let make_delete_protection_group_request
  ~protection_group_id:(protection_group_id_ : string) () =
  ({ protection_group_id = protection_group_id_ } : delete_protection_group_request)
let make_create_subscription_response () = (() : unit)
let make_create_subscription_request () = (() : unit)
let make_create_protection_response
  ?protection_id:(protection_id_ : string option) () =
  ({ protection_id = protection_id_ } : create_protection_response)
let make_create_protection_request ?tags:(tags_ : tag list option)
  ~resource_arn:(resource_arn_ : string) ~name:(name_ : string) () =
  ({ tags = tags_; resource_arn = resource_arn_; name = name_ } : create_protection_request)
let make_create_protection_group_response () = (() : unit)
let make_create_protection_group_request ?tags:(tags_ : tag list option)
  ?members:(members_ : string list option)
  ?resource_type:(resource_type_ : protected_resource_type option)
  ~pattern:(pattern_ : protection_group_pattern)
  ~aggregation:(aggregation_ : protection_group_aggregation)
  ~protection_group_id:(protection_group_id_ : string) () =
  ({
     tags = tags_;
     members = members_;
     resource_type = resource_type_;
     pattern = pattern_;
     aggregation = aggregation_;
     protection_group_id = protection_group_id_
   } : create_protection_group_request)
let make_associate_proactive_engagement_details_response () = (() : unit)
let make_associate_proactive_engagement_details_request
  ~emergency_contact_list:(emergency_contact_list_ : emergency_contact list)
  () =
  ({ emergency_contact_list = emergency_contact_list_ } : associate_proactive_engagement_details_request)
let make_associate_health_check_response () = (() : unit)
let make_associate_health_check_request
  ~health_check_arn:(health_check_arn_ : string)
  ~protection_id:(protection_id_ : string) () =
  ({ health_check_arn = health_check_arn_; protection_id = protection_id_ } : 
  associate_health_check_request)
let make_associate_drt_role_response () = (() : unit)
let make_associate_drt_role_request ~role_arn:(role_arn_ : string) () =
  ({ role_arn = role_arn_ } : associate_drt_role_request)
let make_associate_drt_log_bucket_response () = (() : unit)
let make_associate_drt_log_bucket_request ~log_bucket:(log_bucket_ : string)
  () = ({ log_bucket = log_bucket_ } : associate_drt_log_bucket_request)