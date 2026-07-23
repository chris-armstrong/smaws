open Types

let make_update_preferences_response
    ?management_account_rate_type_selections:
      (management_account_rate_type_selections_ : rate_types option)
    ?member_account_rate_type_selections:(member_account_rate_type_selections_ : rate_types option)
    ?standalone_account_rate_type_selections:
      (standalone_account_rate_type_selections_ : rate_types option) () =
  ({
     management_account_rate_type_selections = management_account_rate_type_selections_;
     member_account_rate_type_selections = member_account_rate_type_selections_;
     standalone_account_rate_type_selections = standalone_account_rate_type_selections_;
   }
    : update_preferences_response)

let make_update_preferences_request
    ?management_account_rate_type_selections:
      (management_account_rate_type_selections_ : rate_types option)
    ?member_account_rate_type_selections:(member_account_rate_type_selections_ : rate_types option)
    ?standalone_account_rate_type_selections:
      (standalone_account_rate_type_selections_ : rate_types option) () =
  ({
     management_account_rate_type_selections = management_account_rate_type_selections_;
     member_account_rate_type_selections = member_account_rate_type_selections_;
     standalone_account_rate_type_selections = standalone_account_rate_type_selections_;
   }
    : update_preferences_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~arn:(arn_ : arn) ~tag_keys:(tag_keys_ : resource_tag_keys) () =
  ({ arn = arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~arn:(arn_ : arn) ~tags:(tags_ : tags) () =
  ({ arn = arn_; tags = tags_ } : tag_resource_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~arn:(arn_ : arn) () =
  ({ arn = arn_ } : list_tags_for_resource_request)

let make_get_preferences_response
    ?management_account_rate_type_selections:
      (management_account_rate_type_selections_ : rate_types option)
    ?member_account_rate_type_selections:(member_account_rate_type_selections_ : rate_types option)
    ?standalone_account_rate_type_selections:
      (standalone_account_rate_type_selections_ : rate_types option) () =
  ({
     management_account_rate_type_selections = management_account_rate_type_selections_;
     member_account_rate_type_selections = member_account_rate_type_selections_;
     standalone_account_rate_type_selections = standalone_account_rate_type_selections_;
   }
    : get_preferences_response)

let make_get_preferences_request () = (() : unit)

let make_add_reserved_instance_action
    ?reserved_instances_offering_id:(reserved_instances_offering_id_ : uuid option)
    ?instance_count:(instance_count_ : reserved_instance_instance_count option) () =
  ({
     reserved_instances_offering_id = reserved_instances_offering_id_;
     instance_count = instance_count_;
   }
    : add_reserved_instance_action)

let make_add_savings_plan_action ?savings_plan_offering_id:(savings_plan_offering_id_ : uuid option)
    ?commitment:(commitment_ : savings_plan_commitment option) () =
  ({ savings_plan_offering_id = savings_plan_offering_id_; commitment = commitment_ }
    : add_savings_plan_action)

let make_batch_create_bill_scenario_commitment_modification_error ?key:(key_ : key option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?error_code:(error_code_ : batch_create_bill_scenario_commitment_modification_error_code option)
    () =
  ({ key = key_; error_message = error_message_; error_code = error_code_ }
    : batch_create_bill_scenario_commitment_modification_error)

let make_negate_savings_plan_action ?savings_plan_id:(savings_plan_id_ : uuid option) () =
  ({ savings_plan_id = savings_plan_id_ } : negate_savings_plan_action)

let make_negate_reserved_instance_action
    ?reserved_instances_id:(reserved_instances_id_ : uuid option) () =
  ({ reserved_instances_id = reserved_instances_id_ } : negate_reserved_instance_action)

let make_batch_create_bill_scenario_commitment_modification_item ?key:(key_ : key option)
    ?id:(id_ : resource_id option) ?group:(group_ : usage_group option)
    ?usage_account_id:(usage_account_id_ : account_id option)
    ?commitment_action:(commitment_action_ : bill_scenario_commitment_modification_action option) ()
    =
  ({
     key = key_;
     id = id_;
     group = group_;
     usage_account_id = usage_account_id_;
     commitment_action = commitment_action_;
   }
    : batch_create_bill_scenario_commitment_modification_item)

let make_batch_create_bill_scenario_commitment_modification_response
    ?items:(items_ : batch_create_bill_scenario_commitment_modification_items option)
    ?errors:(errors_ : batch_create_bill_scenario_commitment_modification_errors option) () =
  ({ items = items_; errors = errors_ }
    : batch_create_bill_scenario_commitment_modification_response)

let make_batch_create_bill_scenario_commitment_modification_entry
    ?group:(group_ : usage_group option) ~key:(key_ : key)
    ~usage_account_id:(usage_account_id_ : account_id)
    ~commitment_action:(commitment_action_ : bill_scenario_commitment_modification_action) () =
  ({
     key = key_;
     group = group_;
     usage_account_id = usage_account_id_;
     commitment_action = commitment_action_;
   }
    : batch_create_bill_scenario_commitment_modification_entry)

let make_batch_create_bill_scenario_commitment_modification_request
    ?client_token:(client_token_ : client_token option)
    ~bill_scenario_id:(bill_scenario_id_ : resource_id)
    ~commitment_modifications:
      (commitment_modifications_ : batch_create_bill_scenario_commitment_modification_entries) () =
  ({
     bill_scenario_id = bill_scenario_id_;
     commitment_modifications = commitment_modifications_;
     client_token = client_token_;
   }
    : batch_create_bill_scenario_commitment_modification_request)

let make_batch_create_bill_scenario_usage_modification_error ?key:(key_ : key option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?error_code:(error_code_ : batch_create_bill_scenario_usage_modification_error_code option) () =
  ({ key = key_; error_message = error_message_; error_code = error_code_ }
    : batch_create_bill_scenario_usage_modification_error)

let make_expression_filter ?key:(key_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?match_options:(match_options_ : string_list option) ?values:(values_ : string_list option) () =
  ({ key = key_; match_options = match_options_; values = values_ } : expression_filter)

let make_expression ?and_:(and__ : expression_list option) ?\#or:(or_ : expression_list option)
    ?not:(not_ : expression option) ?cost_categories:(cost_categories_ : expression_filter option)
    ?dimensions:(dimensions_ : expression_filter option) ?tags:(tags_ : expression_filter option) ()
    =
  ({
     and_ = and__;
     \#or = or_;
     not = not_;
     cost_categories = cost_categories_;
     dimensions = dimensions_;
     tags = tags_;
   }
    : expression)

let make_bill_interval ?start:(start_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?end_:(end__ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({ start = start_; end_ = end__ } : bill_interval)

let make_historical_usage_entity ?location:(location_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~service_code:(service_code_ : service_code) ~usage_type:(usage_type_ : usage_type)
    ~operation:(operation_ : operation) ~usage_account_id:(usage_account_id_ : account_id)
    ~bill_interval:(bill_interval_ : bill_interval)
    ~filter_expression:(filter_expression_ : expression) () =
  ({
     service_code = service_code_;
     usage_type = usage_type_;
     operation = operation_;
     location = location_;
     usage_account_id = usage_account_id_;
     bill_interval = bill_interval_;
     filter_expression = filter_expression_;
   }
    : historical_usage_entity)

let make_usage_quantity ?start_hour:(start_hour_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?unit_:(unit__ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?amount:(amount_ : Smaws_Lib.Smithy_api.Types.double option) () =
  ({ start_hour = start_hour_; unit_ = unit__; amount = amount_ } : usage_quantity)

let make_batch_create_bill_scenario_usage_modification_item
    ?location:(location_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?id:(id_ : resource_id option) ?group:(group_ : usage_group option)
    ?usage_account_id:(usage_account_id_ : account_id option)
    ?quantities:(quantities_ : usage_quantities option)
    ?historical_usage:(historical_usage_ : historical_usage_entity option) ?key:(key_ : key option)
    ~service_code:(service_code_ : service_code) ~usage_type:(usage_type_ : usage_type)
    ~operation:(operation_ : operation) () =
  ({
     service_code = service_code_;
     usage_type = usage_type_;
     operation = operation_;
     location = location_;
     availability_zone = availability_zone_;
     id = id_;
     group = group_;
     usage_account_id = usage_account_id_;
     quantities = quantities_;
     historical_usage = historical_usage_;
     key = key_;
   }
    : batch_create_bill_scenario_usage_modification_item)

let make_batch_create_bill_scenario_usage_modification_response
    ?items:(items_ : batch_create_bill_scenario_usage_modification_items option)
    ?errors:(errors_ : batch_create_bill_scenario_usage_modification_errors option) () =
  ({ items = items_; errors = errors_ } : batch_create_bill_scenario_usage_modification_response)

let make_usage_amount ~start_hour:(start_hour_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~amount:(amount_ : Smaws_Lib.Smithy_api.Types.double) () =
  ({ start_hour = start_hour_; amount = amount_ } : usage_amount)

let make_batch_create_bill_scenario_usage_modification_entry
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?group:(group_ : usage_group option) ?amounts:(amounts_ : usage_amounts option)
    ?historical_usage:(historical_usage_ : historical_usage_entity option)
    ~service_code:(service_code_ : service_code) ~usage_type:(usage_type_ : usage_type)
    ~operation:(operation_ : operation) ~key:(key_ : key)
    ~usage_account_id:(usage_account_id_ : account_id) () =
  ({
     service_code = service_code_;
     usage_type = usage_type_;
     operation = operation_;
     availability_zone = availability_zone_;
     key = key_;
     group = group_;
     usage_account_id = usage_account_id_;
     amounts = amounts_;
     historical_usage = historical_usage_;
   }
    : batch_create_bill_scenario_usage_modification_entry)

let make_batch_create_bill_scenario_usage_modification_request
    ?client_token:(client_token_ : client_token option)
    ~bill_scenario_id:(bill_scenario_id_ : resource_id)
    ~usage_modifications:
      (usage_modifications_ : batch_create_bill_scenario_usage_modification_entries) () =
  ({
     bill_scenario_id = bill_scenario_id_;
     usage_modifications = usage_modifications_;
     client_token = client_token_;
   }
    : batch_create_bill_scenario_usage_modification_request)

let make_batch_create_workload_estimate_usage_error ?key:(key_ : key option)
    ?error_code:(error_code_ : batch_create_workload_estimate_usage_code option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ key = key_; error_code = error_code_; error_message = error_message_ }
    : batch_create_workload_estimate_usage_error)

let make_workload_estimate_usage_quantity
    ?unit_:(unit__ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?amount:(amount_ : Smaws_Lib.Smithy_api.Types.double option) () =
  ({ unit_ = unit__; amount = amount_ } : workload_estimate_usage_quantity)

let make_batch_create_workload_estimate_usage_item
    ?location:(location_ : Smaws_Lib.Smithy_api.Types.string_ option) ?id:(id_ : resource_id option)
    ?usage_account_id:(usage_account_id_ : account_id option) ?group:(group_ : usage_group option)
    ?quantity:(quantity_ : workload_estimate_usage_quantity option)
    ?cost:(cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?currency:(currency_ : currency_code option)
    ?status:(status_ : workload_estimate_cost_status option)
    ?historical_usage:(historical_usage_ : historical_usage_entity option) ?key:(key_ : key option)
    ~service_code:(service_code_ : service_code) ~usage_type:(usage_type_ : usage_type)
    ~operation:(operation_ : operation) () =
  ({
     service_code = service_code_;
     usage_type = usage_type_;
     operation = operation_;
     location = location_;
     id = id_;
     usage_account_id = usage_account_id_;
     group = group_;
     quantity = quantity_;
     cost = cost_;
     currency = currency_;
     status = status_;
     historical_usage = historical_usage_;
     key = key_;
   }
    : batch_create_workload_estimate_usage_item)

let make_batch_create_workload_estimate_usage_response
    ?items:(items_ : batch_create_workload_estimate_usage_items option)
    ?errors:(errors_ : batch_create_workload_estimate_usage_errors option) () =
  ({ items = items_; errors = errors_ } : batch_create_workload_estimate_usage_response)

let make_batch_create_workload_estimate_usage_entry ?group:(group_ : usage_group option)
    ?historical_usage:(historical_usage_ : historical_usage_entity option)
    ~service_code:(service_code_ : service_code) ~usage_type:(usage_type_ : usage_type)
    ~operation:(operation_ : operation) ~key:(key_ : key)
    ~usage_account_id:(usage_account_id_ : account_id)
    ~amount:(amount_ : Smaws_Lib.Smithy_api.Types.double) () =
  ({
     service_code = service_code_;
     usage_type = usage_type_;
     operation = operation_;
     key = key_;
     group = group_;
     usage_account_id = usage_account_id_;
     amount = amount_;
     historical_usage = historical_usage_;
   }
    : batch_create_workload_estimate_usage_entry)

let make_batch_create_workload_estimate_usage_request
    ?client_token:(client_token_ : client_token option)
    ~workload_estimate_id:(workload_estimate_id_ : resource_id)
    ~usage:(usage_ : batch_create_workload_estimate_usage_entries) () =
  ({ workload_estimate_id = workload_estimate_id_; usage = usage_; client_token = client_token_ }
    : batch_create_workload_estimate_usage_request)

let make_batch_delete_bill_scenario_commitment_modification_error ?id:(id_ : resource_id option)
    ?error_code:(error_code_ : batch_delete_bill_scenario_commitment_modification_error_code option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ id = id_; error_code = error_code_; error_message = error_message_ }
    : batch_delete_bill_scenario_commitment_modification_error)

let make_batch_delete_bill_scenario_commitment_modification_response
    ?errors:(errors_ : batch_delete_bill_scenario_commitment_modification_errors option) () =
  ({ errors = errors_ } : batch_delete_bill_scenario_commitment_modification_response)

let make_batch_delete_bill_scenario_commitment_modification_request
    ~bill_scenario_id:(bill_scenario_id_ : resource_id)
    ~ids:(ids_ : batch_delete_bill_scenario_commitment_modification_entries) () =
  ({ bill_scenario_id = bill_scenario_id_; ids = ids_ }
    : batch_delete_bill_scenario_commitment_modification_request)

let make_batch_delete_bill_scenario_usage_modification_error ?id:(id_ : resource_id option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?error_code:(error_code_ : batch_delete_bill_scenario_usage_modification_error_code option) () =
  ({ id = id_; error_message = error_message_; error_code = error_code_ }
    : batch_delete_bill_scenario_usage_modification_error)

let make_batch_delete_bill_scenario_usage_modification_response
    ?errors:(errors_ : batch_delete_bill_scenario_usage_modification_errors option) () =
  ({ errors = errors_ } : batch_delete_bill_scenario_usage_modification_response)

let make_batch_delete_bill_scenario_usage_modification_request
    ~bill_scenario_id:(bill_scenario_id_ : resource_id)
    ~ids:(ids_ : batch_delete_bill_scenario_usage_modification_entries) () =
  ({ bill_scenario_id = bill_scenario_id_; ids = ids_ }
    : batch_delete_bill_scenario_usage_modification_request)

let make_batch_delete_workload_estimate_usage_error ?id:(id_ : resource_id option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?error_code:(error_code_ : workload_estimate_update_usage_error_code option) () =
  ({ id = id_; error_message = error_message_; error_code = error_code_ }
    : batch_delete_workload_estimate_usage_error)

let make_batch_delete_workload_estimate_usage_response
    ?errors:(errors_ : batch_delete_workload_estimate_usage_errors option) () =
  ({ errors = errors_ } : batch_delete_workload_estimate_usage_response)

let make_batch_delete_workload_estimate_usage_request
    ~workload_estimate_id:(workload_estimate_id_ : resource_id)
    ~ids:(ids_ : batch_delete_workload_estimate_usage_entries) () =
  ({ workload_estimate_id = workload_estimate_id_; ids = ids_ }
    : batch_delete_workload_estimate_usage_request)

let make_batch_update_bill_scenario_commitment_modification_error ?id:(id_ : resource_id option)
    ?error_code:(error_code_ : batch_update_bill_scenario_commitment_modification_error_code option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ id = id_; error_code = error_code_; error_message = error_message_ }
    : batch_update_bill_scenario_commitment_modification_error)

let make_bill_scenario_commitment_modification_item ?id:(id_ : resource_id option)
    ?usage_account_id:(usage_account_id_ : account_id option) ?group:(group_ : usage_group option)
    ?commitment_action:(commitment_action_ : bill_scenario_commitment_modification_action option) ()
    =
  ({
     id = id_;
     usage_account_id = usage_account_id_;
     group = group_;
     commitment_action = commitment_action_;
   }
    : bill_scenario_commitment_modification_item)

let make_batch_update_bill_scenario_commitment_modification_response
    ?items:(items_ : bill_scenario_commitment_modification_items option)
    ?errors:(errors_ : batch_update_bill_scenario_commitment_modification_errors option) () =
  ({ items = items_; errors = errors_ }
    : batch_update_bill_scenario_commitment_modification_response)

let make_batch_update_bill_scenario_commitment_modification_entry
    ?group:(group_ : usage_group option) ~id:(id_ : resource_id) () =
  ({ id = id_; group = group_ } : batch_update_bill_scenario_commitment_modification_entry)

let make_batch_update_bill_scenario_commitment_modification_request
    ~bill_scenario_id:(bill_scenario_id_ : resource_id)
    ~commitment_modifications:
      (commitment_modifications_ : batch_update_bill_scenario_commitment_modification_entries) () =
  ({ bill_scenario_id = bill_scenario_id_; commitment_modifications = commitment_modifications_ }
    : batch_update_bill_scenario_commitment_modification_request)

let make_batch_update_bill_scenario_usage_modification_error ?id:(id_ : resource_id option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?error_code:(error_code_ : batch_update_bill_scenario_usage_modification_error_code option) () =
  ({ id = id_; error_message = error_message_; error_code = error_code_ }
    : batch_update_bill_scenario_usage_modification_error)

let make_bill_scenario_usage_modification_item
    ?location:(location_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?id:(id_ : resource_id option) ?group:(group_ : usage_group option)
    ?usage_account_id:(usage_account_id_ : account_id option)
    ?quantities:(quantities_ : usage_quantities option)
    ?historical_usage:(historical_usage_ : historical_usage_entity option)
    ~service_code:(service_code_ : service_code) ~usage_type:(usage_type_ : usage_type)
    ~operation:(operation_ : operation) () =
  ({
     service_code = service_code_;
     usage_type = usage_type_;
     operation = operation_;
     location = location_;
     availability_zone = availability_zone_;
     id = id_;
     group = group_;
     usage_account_id = usage_account_id_;
     quantities = quantities_;
     historical_usage = historical_usage_;
   }
    : bill_scenario_usage_modification_item)

let make_batch_update_bill_scenario_usage_modification_response
    ?items:(items_ : bill_scenario_usage_modification_items option)
    ?errors:(errors_ : batch_update_bill_scenario_usage_modification_errors option) () =
  ({ items = items_; errors = errors_ } : batch_update_bill_scenario_usage_modification_response)

let make_batch_update_bill_scenario_usage_modification_entry ?group:(group_ : usage_group option)
    ?amounts:(amounts_ : usage_amounts option) ~id:(id_ : resource_id) () =
  ({ id = id_; group = group_; amounts = amounts_ }
    : batch_update_bill_scenario_usage_modification_entry)

let make_batch_update_bill_scenario_usage_modification_request
    ~bill_scenario_id:(bill_scenario_id_ : resource_id)
    ~usage_modifications:
      (usage_modifications_ : batch_update_bill_scenario_usage_modification_entries) () =
  ({ bill_scenario_id = bill_scenario_id_; usage_modifications = usage_modifications_ }
    : batch_update_bill_scenario_usage_modification_request)

let make_batch_update_workload_estimate_usage_error ?id:(id_ : resource_id option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?error_code:(error_code_ : workload_estimate_update_usage_error_code option) () =
  ({ id = id_; error_message = error_message_; error_code = error_code_ }
    : batch_update_workload_estimate_usage_error)

let make_workload_estimate_usage_item
    ?location:(location_ : Smaws_Lib.Smithy_api.Types.string_ option) ?id:(id_ : resource_id option)
    ?usage_account_id:(usage_account_id_ : account_id option) ?group:(group_ : usage_group option)
    ?quantity:(quantity_ : workload_estimate_usage_quantity option)
    ?cost:(cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?currency:(currency_ : currency_code option)
    ?status:(status_ : workload_estimate_cost_status option)
    ?historical_usage:(historical_usage_ : historical_usage_entity option)
    ~service_code:(service_code_ : service_code) ~usage_type:(usage_type_ : usage_type)
    ~operation:(operation_ : operation) () =
  ({
     service_code = service_code_;
     usage_type = usage_type_;
     operation = operation_;
     location = location_;
     id = id_;
     usage_account_id = usage_account_id_;
     group = group_;
     quantity = quantity_;
     cost = cost_;
     currency = currency_;
     status = status_;
     historical_usage = historical_usage_;
   }
    : workload_estimate_usage_item)

let make_batch_update_workload_estimate_usage_response
    ?items:(items_ : workload_estimate_usage_items option)
    ?errors:(errors_ : batch_update_workload_estimate_usage_errors option) () =
  ({ items = items_; errors = errors_ } : batch_update_workload_estimate_usage_response)

let make_batch_update_workload_estimate_usage_entry ?group:(group_ : usage_group option)
    ?amount:(amount_ : Smaws_Lib.Smithy_api.Types.double option) ~id:(id_ : resource_id) () =
  ({ id = id_; group = group_; amount = amount_ } : batch_update_workload_estimate_usage_entry)

let make_batch_update_workload_estimate_usage_request
    ~workload_estimate_id:(workload_estimate_id_ : resource_id)
    ~usage:(usage_ : batch_update_workload_estimate_usage_entries) () =
  ({ workload_estimate_id = workload_estimate_id_; usage = usage_ }
    : batch_update_workload_estimate_usage_request)

let make_cost_amount ?amount:(amount_ : Smaws_Lib.Smithy_api.Types.double option)
    ?currency:(currency_ : currency_code option) () =
  ({ amount = amount_; currency = currency_ } : cost_amount)

let make_bill_estimate_commitment_summary ?id:(id_ : resource_id option)
    ?purchase_agreement_type:(purchase_agreement_type_ : purchase_agreement_type option)
    ?offering_id:(offering_id_ : uuid option)
    ?usage_account_id:(usage_account_id_ : account_id option)
    ?region:(region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term_length:(term_length_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?upfront_payment:(upfront_payment_ : cost_amount option)
    ?monthly_payment:(monthly_payment_ : cost_amount option) () =
  ({
     id = id_;
     purchase_agreement_type = purchase_agreement_type_;
     offering_id = offering_id_;
     usage_account_id = usage_account_id_;
     region = region_;
     term_length = term_length_;
     payment_option = payment_option_;
     upfront_payment = upfront_payment_;
     monthly_payment = monthly_payment_;
   }
    : bill_estimate_commitment_summary)

let make_cost_difference ?historical_cost:(historical_cost_ : cost_amount option)
    ?estimated_cost:(estimated_cost_ : cost_amount option) () =
  ({ historical_cost = historical_cost_; estimated_cost = estimated_cost_ } : cost_difference)

let make_bill_estimate_cost_summary
    ?total_cost_difference:(total_cost_difference_ : cost_difference option)
    ?service_cost_differences:(service_cost_differences_ : service_cost_difference_map option) () =
  ({
     total_cost_difference = total_cost_difference_;
     service_cost_differences = service_cost_differences_;
   }
    : bill_estimate_cost_summary)

let make_bill_estimate_input_commitment_modification_summary ?id:(id_ : resource_id option)
    ?group:(group_ : usage_group option) ?usage_account_id:(usage_account_id_ : account_id option)
    ?commitment_action:(commitment_action_ : bill_scenario_commitment_modification_action option) ()
    =
  ({
     id = id_;
     group = group_;
     usage_account_id = usage_account_id_;
     commitment_action = commitment_action_;
   }
    : bill_estimate_input_commitment_modification_summary)

let make_bill_estimate_input_usage_modification_summary
    ?location:(location_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?id:(id_ : resource_id option) ?group:(group_ : usage_group option)
    ?usage_account_id:(usage_account_id_ : account_id option)
    ?quantities:(quantities_ : usage_quantities option)
    ?historical_usage:(historical_usage_ : historical_usage_entity option)
    ~service_code:(service_code_ : service_code) ~usage_type:(usage_type_ : usage_type)
    ~operation:(operation_ : operation) () =
  ({
     service_code = service_code_;
     usage_type = usage_type_;
     operation = operation_;
     location = location_;
     availability_zone = availability_zone_;
     id = id_;
     group = group_;
     usage_account_id = usage_account_id_;
     quantities = quantities_;
     historical_usage = historical_usage_;
   }
    : bill_estimate_input_usage_modification_summary)

let make_bill_estimate_line_item_summary
    ?location:(location_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?id:(id_ : resource_id option)
    ?line_item_id:(line_item_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?line_item_type:(line_item_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payer_account_id:(payer_account_id_ : account_id option)
    ?usage_account_id:(usage_account_id_ : account_id option)
    ?estimated_usage_quantity:(estimated_usage_quantity_ : usage_quantity_result option)
    ?estimated_cost:(estimated_cost_ : cost_amount option)
    ?historical_usage_quantity:(historical_usage_quantity_ : usage_quantity_result option)
    ?historical_cost:(historical_cost_ : cost_amount option)
    ?savings_plan_arns:(savings_plan_arns_ : savings_plan_arns option)
    ~service_code:(service_code_ : service_code) ~usage_type:(usage_type_ : usage_type)
    ~operation:(operation_ : operation) () =
  ({
     service_code = service_code_;
     usage_type = usage_type_;
     operation = operation_;
     location = location_;
     availability_zone = availability_zone_;
     id = id_;
     line_item_id = line_item_id_;
     line_item_type = line_item_type_;
     payer_account_id = payer_account_id_;
     usage_account_id = usage_account_id_;
     estimated_usage_quantity = estimated_usage_quantity_;
     estimated_cost = estimated_cost_;
     historical_usage_quantity = historical_usage_quantity_;
     historical_cost = historical_cost_;
     savings_plan_arns = savings_plan_arns_;
   }
    : bill_estimate_line_item_summary)

let make_bill_estimate_summary ?name:(name_ : bill_estimate_name option)
    ?status:(status_ : bill_estimate_status option)
    ?bill_interval:(bill_interval_ : bill_interval option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option) ~id:(id_ : resource_id)
    () =
  ({
     id = id_;
     name = name_;
     status = status_;
     bill_interval = bill_interval_;
     created_at = created_at_;
     expires_at = expires_at_;
   }
    : bill_estimate_summary)

let make_bill_scenario_summary ?name:(name_ : bill_scenario_name option)
    ?bill_interval:(bill_interval_ : bill_interval option)
    ?status:(status_ : bill_scenario_status option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?group_sharing_preference:(group_sharing_preference_ : group_sharing_preference_enum option)
    ?cost_category_group_sharing_preference_arn:
      (cost_category_group_sharing_preference_arn_ : cost_category_arn option)
    ~id:(id_ : resource_id) () =
  ({
     id = id_;
     name = name_;
     bill_interval = bill_interval_;
     status = status_;
     created_at = created_at_;
     expires_at = expires_at_;
     failure_message = failure_message_;
     group_sharing_preference = group_sharing_preference_;
     cost_category_group_sharing_preference_arn = cost_category_group_sharing_preference_arn_;
   }
    : bill_scenario_summary)

let make_create_bill_estimate_response ?name:(name_ : bill_estimate_name option)
    ?status:(status_ : bill_estimate_status option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?bill_interval:(bill_interval_ : bill_interval option)
    ?cost_summary:(cost_summary_ : bill_estimate_cost_summary option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?group_sharing_preference:(group_sharing_preference_ : group_sharing_preference_enum option)
    ?cost_category_group_sharing_preference_arn:
      (cost_category_group_sharing_preference_arn_ : cost_category_arn option)
    ?cost_category_group_sharing_preference_effective_date:
      (cost_category_group_sharing_preference_effective_date_ :
         Smaws_Lib.Smithy_api.Types.timestamp option) ~id:(id_ : resource_id) () =
  ({
     id = id_;
     name = name_;
     status = status_;
     failure_message = failure_message_;
     bill_interval = bill_interval_;
     cost_summary = cost_summary_;
     created_at = created_at_;
     expires_at = expires_at_;
     group_sharing_preference = group_sharing_preference_;
     cost_category_group_sharing_preference_arn = cost_category_group_sharing_preference_arn_;
     cost_category_group_sharing_preference_effective_date =
       cost_category_group_sharing_preference_effective_date_;
   }
    : create_bill_estimate_response)

let make_create_bill_estimate_request ?client_token:(client_token_ : client_token option)
    ?tags:(tags_ : tags option) ~bill_scenario_id:(bill_scenario_id_ : resource_id)
    ~name:(name_ : bill_estimate_name) () =
  ({
     bill_scenario_id = bill_scenario_id_;
     name = name_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_bill_estimate_request)

let make_create_bill_scenario_response ?name:(name_ : bill_scenario_name option)
    ?bill_interval:(bill_interval_ : bill_interval option)
    ?status:(status_ : bill_scenario_status option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?group_sharing_preference:(group_sharing_preference_ : group_sharing_preference_enum option)
    ?cost_category_group_sharing_preference_arn:
      (cost_category_group_sharing_preference_arn_ : cost_category_arn option)
    ~id:(id_ : resource_id) () =
  ({
     id = id_;
     name = name_;
     bill_interval = bill_interval_;
     status = status_;
     created_at = created_at_;
     expires_at = expires_at_;
     failure_message = failure_message_;
     group_sharing_preference = group_sharing_preference_;
     cost_category_group_sharing_preference_arn = cost_category_group_sharing_preference_arn_;
   }
    : create_bill_scenario_response)

let make_create_bill_scenario_request ?client_token:(client_token_ : client_token option)
    ?tags:(tags_ : tags option)
    ?group_sharing_preference:(group_sharing_preference_ : group_sharing_preference_enum option)
    ?cost_category_group_sharing_preference_arn:
      (cost_category_group_sharing_preference_arn_ : cost_category_arn option)
    ~name:(name_ : bill_scenario_name) () =
  ({
     name = name_;
     client_token = client_token_;
     tags = tags_;
     group_sharing_preference = group_sharing_preference_;
     cost_category_group_sharing_preference_arn = cost_category_group_sharing_preference_arn_;
   }
    : create_bill_scenario_request)

let make_create_workload_estimate_response ?name:(name_ : workload_estimate_name option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?rate_type:(rate_type_ : workload_estimate_rate_type option)
    ?rate_timestamp:(rate_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?status:(status_ : workload_estimate_status option)
    ?total_cost:(total_cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?cost_currency:(cost_currency_ : currency_code option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~id:(id_ : resource_id) () =
  ({
     id = id_;
     name = name_;
     created_at = created_at_;
     expires_at = expires_at_;
     rate_type = rate_type_;
     rate_timestamp = rate_timestamp_;
     status = status_;
     total_cost = total_cost_;
     cost_currency = cost_currency_;
     failure_message = failure_message_;
   }
    : create_workload_estimate_response)

let make_create_workload_estimate_request ?client_token:(client_token_ : client_token option)
    ?rate_type:(rate_type_ : workload_estimate_rate_type option) ?tags:(tags_ : tags option)
    ~name:(name_ : workload_estimate_name) () =
  ({ name = name_; client_token = client_token_; rate_type = rate_type_; tags = tags_ }
    : create_workload_estimate_request)

let make_delete_bill_estimate_response () = (() : unit)

let make_delete_bill_estimate_request ~identifier:(identifier_ : resource_id) () =
  ({ identifier = identifier_ } : delete_bill_estimate_request)

let make_delete_bill_scenario_response () = (() : unit)

let make_delete_bill_scenario_request ~identifier:(identifier_ : resource_id) () =
  ({ identifier = identifier_ } : delete_bill_scenario_request)

let make_delete_workload_estimate_response () = (() : unit)

let make_delete_workload_estimate_request ~identifier:(identifier_ : resource_id) () =
  ({ identifier = identifier_ } : delete_workload_estimate_request)

let make_filter_timestamp
    ?after_timestamp:(after_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?before_timestamp:(before_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({ after_timestamp = after_timestamp_; before_timestamp = before_timestamp_ } : filter_timestamp)

let make_get_bill_estimate_response ?name:(name_ : bill_estimate_name option)
    ?status:(status_ : bill_estimate_status option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?bill_interval:(bill_interval_ : bill_interval option)
    ?cost_summary:(cost_summary_ : bill_estimate_cost_summary option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?group_sharing_preference:(group_sharing_preference_ : group_sharing_preference_enum option)
    ?cost_category_group_sharing_preference_arn:
      (cost_category_group_sharing_preference_arn_ : cost_category_arn option)
    ?cost_category_group_sharing_preference_effective_date:
      (cost_category_group_sharing_preference_effective_date_ :
         Smaws_Lib.Smithy_api.Types.timestamp option) ~id:(id_ : resource_id) () =
  ({
     id = id_;
     name = name_;
     status = status_;
     failure_message = failure_message_;
     bill_interval = bill_interval_;
     cost_summary = cost_summary_;
     created_at = created_at_;
     expires_at = expires_at_;
     group_sharing_preference = group_sharing_preference_;
     cost_category_group_sharing_preference_arn = cost_category_group_sharing_preference_arn_;
     cost_category_group_sharing_preference_effective_date =
       cost_category_group_sharing_preference_effective_date_;
   }
    : get_bill_estimate_response)

let make_get_bill_estimate_request ~identifier:(identifier_ : resource_id) () =
  ({ identifier = identifier_ } : get_bill_estimate_request)

let make_get_bill_scenario_response ?name:(name_ : bill_scenario_name option)
    ?bill_interval:(bill_interval_ : bill_interval option)
    ?status:(status_ : bill_scenario_status option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?group_sharing_preference:(group_sharing_preference_ : group_sharing_preference_enum option)
    ?cost_category_group_sharing_preference_arn:
      (cost_category_group_sharing_preference_arn_ : cost_category_arn option)
    ~id:(id_ : resource_id) () =
  ({
     id = id_;
     name = name_;
     bill_interval = bill_interval_;
     status = status_;
     created_at = created_at_;
     expires_at = expires_at_;
     failure_message = failure_message_;
     group_sharing_preference = group_sharing_preference_;
     cost_category_group_sharing_preference_arn = cost_category_group_sharing_preference_arn_;
   }
    : get_bill_scenario_response)

let make_get_bill_scenario_request ~identifier:(identifier_ : resource_id) () =
  ({ identifier = identifier_ } : get_bill_scenario_request)

let make_get_workload_estimate_response ?name:(name_ : workload_estimate_name option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?rate_type:(rate_type_ : workload_estimate_rate_type option)
    ?rate_timestamp:(rate_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?status:(status_ : workload_estimate_status option)
    ?total_cost:(total_cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?cost_currency:(cost_currency_ : currency_code option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~id:(id_ : resource_id) () =
  ({
     id = id_;
     name = name_;
     created_at = created_at_;
     expires_at = expires_at_;
     rate_type = rate_type_;
     rate_timestamp = rate_timestamp_;
     status = status_;
     total_cost = total_cost_;
     cost_currency = cost_currency_;
     failure_message = failure_message_;
   }
    : get_workload_estimate_response)

let make_get_workload_estimate_request ~identifier:(identifier_ : resource_id) () =
  ({ identifier = identifier_ } : get_workload_estimate_request)

let make_list_bill_estimate_commitments_response
    ?items:(items_ : bill_estimate_commitment_summaries option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ items = items_; next_token = next_token_ } : list_bill_estimate_commitments_response)

let make_list_bill_estimate_commitments_request ?next_token:(next_token_ : next_page_token option)
    ?max_results:(max_results_ : max_results option)
    ~bill_estimate_id:(bill_estimate_id_ : resource_id) () =
  ({ bill_estimate_id = bill_estimate_id_; next_token = next_token_; max_results = max_results_ }
    : list_bill_estimate_commitments_request)

let make_list_bill_estimate_input_commitment_modifications_response
    ?items:(items_ : bill_estimate_input_commitment_modification_summaries option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ items = items_; next_token = next_token_ }
    : list_bill_estimate_input_commitment_modifications_response)

let make_list_bill_estimate_input_commitment_modifications_request
    ?next_token:(next_token_ : next_page_token option)
    ?max_results:(max_results_ : max_results option)
    ~bill_estimate_id:(bill_estimate_id_ : resource_id) () =
  ({ bill_estimate_id = bill_estimate_id_; next_token = next_token_; max_results = max_results_ }
    : list_bill_estimate_input_commitment_modifications_request)

let make_list_bill_estimate_input_usage_modifications_response
    ?items:(items_ : bill_estimate_input_usage_modification_summaries option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ items = items_; next_token = next_token_ }
    : list_bill_estimate_input_usage_modifications_response)

let make_list_usage_filter ?match_option:(match_option_ : match_option option)
    ~name:(name_ : list_usage_filter_name) ~values:(values_ : list_usage_filter_values) () =
  ({ name = name_; values = values_; match_option = match_option_ } : list_usage_filter)

let make_list_bill_estimate_input_usage_modifications_request
    ?filters:(filters_ : list_usage_filters option)
    ?next_token:(next_token_ : next_page_token option)
    ?max_results:(max_results_ : max_results option)
    ~bill_estimate_id:(bill_estimate_id_ : resource_id) () =
  ({
     bill_estimate_id = bill_estimate_id_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_bill_estimate_input_usage_modifications_request)

let make_list_bill_estimate_line_items_response
    ?items:(items_ : bill_estimate_line_item_summaries option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ items = items_; next_token = next_token_ } : list_bill_estimate_line_items_response)

let make_list_bill_estimate_line_items_filter ?match_option:(match_option_ : match_option option)
    ~name:(name_ : list_bill_estimate_line_items_filter_name)
    ~values:(values_ : list_bill_estimate_line_items_filter_values) () =
  ({ name = name_; values = values_; match_option = match_option_ }
    : list_bill_estimate_line_items_filter)

let make_list_bill_estimate_line_items_request
    ?filters:(filters_ : list_bill_estimate_line_items_filters option)
    ?next_token:(next_token_ : next_page_token option)
    ?max_results:(max_results_ : max_results option)
    ~bill_estimate_id:(bill_estimate_id_ : resource_id) () =
  ({
     bill_estimate_id = bill_estimate_id_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_bill_estimate_line_items_request)

let make_list_bill_estimates_response ?items:(items_ : bill_estimate_summaries option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ items = items_; next_token = next_token_ } : list_bill_estimates_response)

let make_list_bill_estimates_filter ?match_option:(match_option_ : match_option option)
    ~name:(name_ : list_bill_estimates_filter_name)
    ~values:(values_ : list_bill_estimates_filter_values) () =
  ({ name = name_; values = values_; match_option = match_option_ } : list_bill_estimates_filter)

let make_list_bill_estimates_request ?filters:(filters_ : list_bill_estimates_filters option)
    ?created_at_filter:(created_at_filter_ : filter_timestamp option)
    ?expires_at_filter:(expires_at_filter_ : filter_timestamp option)
    ?next_token:(next_token_ : next_page_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({
     filters = filters_;
     created_at_filter = created_at_filter_;
     expires_at_filter = expires_at_filter_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_bill_estimates_request)

let make_list_bill_scenario_commitment_modifications_response
    ?items:(items_ : bill_scenario_commitment_modification_items option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ items = items_; next_token = next_token_ }
    : list_bill_scenario_commitment_modifications_response)

let make_list_bill_scenario_commitment_modifications_request
    ?next_token:(next_token_ : next_page_token option)
    ?max_results:(max_results_ : max_results option)
    ~bill_scenario_id:(bill_scenario_id_ : resource_id) () =
  ({ bill_scenario_id = bill_scenario_id_; next_token = next_token_; max_results = max_results_ }
    : list_bill_scenario_commitment_modifications_request)

let make_list_bill_scenario_usage_modifications_response
    ?items:(items_ : bill_scenario_usage_modification_items option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ items = items_; next_token = next_token_ } : list_bill_scenario_usage_modifications_response)

let make_list_bill_scenario_usage_modifications_request
    ?filters:(filters_ : list_usage_filters option)
    ?next_token:(next_token_ : next_page_token option)
    ?max_results:(max_results_ : max_results option)
    ~bill_scenario_id:(bill_scenario_id_ : resource_id) () =
  ({
     bill_scenario_id = bill_scenario_id_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_bill_scenario_usage_modifications_request)

let make_list_bill_scenarios_response ?items:(items_ : bill_scenario_summaries option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ items = items_; next_token = next_token_ } : list_bill_scenarios_response)

let make_list_bill_scenarios_filter ?match_option:(match_option_ : match_option option)
    ~name:(name_ : list_bill_scenarios_filter_name)
    ~values:(values_ : list_bill_scenarios_filter_values) () =
  ({ name = name_; values = values_; match_option = match_option_ } : list_bill_scenarios_filter)

let make_list_bill_scenarios_request ?filters:(filters_ : list_bill_scenarios_filters option)
    ?created_at_filter:(created_at_filter_ : filter_timestamp option)
    ?expires_at_filter:(expires_at_filter_ : filter_timestamp option)
    ?next_token:(next_token_ : next_page_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({
     filters = filters_;
     created_at_filter = created_at_filter_;
     expires_at_filter = expires_at_filter_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_bill_scenarios_request)

let make_list_workload_estimate_usage_response
    ?items:(items_ : workload_estimate_usage_items option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ items = items_; next_token = next_token_ } : list_workload_estimate_usage_response)

let make_list_workload_estimate_usage_request ?filters:(filters_ : list_usage_filters option)
    ?next_token:(next_token_ : next_page_token option)
    ?max_results:(max_results_ : workload_estimate_usage_max_results option)
    ~workload_estimate_id:(workload_estimate_id_ : resource_id) () =
  ({
     workload_estimate_id = workload_estimate_id_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_workload_estimate_usage_request)

let make_workload_estimate_summary ?name:(name_ : workload_estimate_name option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?rate_type:(rate_type_ : workload_estimate_rate_type option)
    ?rate_timestamp:(rate_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?status:(status_ : workload_estimate_status option)
    ?total_cost:(total_cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?cost_currency:(cost_currency_ : currency_code option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~id:(id_ : resource_id) () =
  ({
     id = id_;
     name = name_;
     created_at = created_at_;
     expires_at = expires_at_;
     rate_type = rate_type_;
     rate_timestamp = rate_timestamp_;
     status = status_;
     total_cost = total_cost_;
     cost_currency = cost_currency_;
     failure_message = failure_message_;
   }
    : workload_estimate_summary)

let make_list_workload_estimates_response ?items:(items_ : workload_estimate_summaries option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ items = items_; next_token = next_token_ } : list_workload_estimates_response)

let make_list_workload_estimates_filter ?match_option:(match_option_ : match_option option)
    ~name:(name_ : list_workload_estimates_filter_name)
    ~values:(values_ : list_workload_estimates_filter_values) () =
  ({ name = name_; values = values_; match_option = match_option_ }
    : list_workload_estimates_filter)

let make_list_workload_estimates_request
    ?created_at_filter:(created_at_filter_ : filter_timestamp option)
    ?expires_at_filter:(expires_at_filter_ : filter_timestamp option)
    ?filters:(filters_ : list_workload_estimates_filters option)
    ?next_token:(next_token_ : next_page_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({
     created_at_filter = created_at_filter_;
     expires_at_filter = expires_at_filter_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_workload_estimates_request)

let make_update_bill_estimate_response ?name:(name_ : bill_estimate_name option)
    ?status:(status_ : bill_estimate_status option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?bill_interval:(bill_interval_ : bill_interval option)
    ?cost_summary:(cost_summary_ : bill_estimate_cost_summary option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?group_sharing_preference:(group_sharing_preference_ : group_sharing_preference_enum option)
    ?cost_category_group_sharing_preference_arn:
      (cost_category_group_sharing_preference_arn_ : cost_category_arn option)
    ?cost_category_group_sharing_preference_effective_date:
      (cost_category_group_sharing_preference_effective_date_ :
         Smaws_Lib.Smithy_api.Types.timestamp option) ~id:(id_ : resource_id) () =
  ({
     id = id_;
     name = name_;
     status = status_;
     failure_message = failure_message_;
     bill_interval = bill_interval_;
     cost_summary = cost_summary_;
     created_at = created_at_;
     expires_at = expires_at_;
     group_sharing_preference = group_sharing_preference_;
     cost_category_group_sharing_preference_arn = cost_category_group_sharing_preference_arn_;
     cost_category_group_sharing_preference_effective_date =
       cost_category_group_sharing_preference_effective_date_;
   }
    : update_bill_estimate_response)

let make_update_bill_estimate_request ?name:(name_ : bill_estimate_name option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~identifier:(identifier_ : resource_id) () =
  ({ identifier = identifier_; name = name_; expires_at = expires_at_ }
    : update_bill_estimate_request)

let make_update_bill_scenario_response ?name:(name_ : bill_scenario_name option)
    ?bill_interval:(bill_interval_ : bill_interval option)
    ?status:(status_ : bill_scenario_status option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?group_sharing_preference:(group_sharing_preference_ : group_sharing_preference_enum option)
    ?cost_category_group_sharing_preference_arn:
      (cost_category_group_sharing_preference_arn_ : cost_category_arn option)
    ~id:(id_ : resource_id) () =
  ({
     id = id_;
     name = name_;
     bill_interval = bill_interval_;
     status = status_;
     created_at = created_at_;
     expires_at = expires_at_;
     failure_message = failure_message_;
     group_sharing_preference = group_sharing_preference_;
     cost_category_group_sharing_preference_arn = cost_category_group_sharing_preference_arn_;
   }
    : update_bill_scenario_response)

let make_update_bill_scenario_request ?name:(name_ : bill_scenario_name option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?group_sharing_preference:(group_sharing_preference_ : group_sharing_preference_enum option)
    ?cost_category_group_sharing_preference_arn:
      (cost_category_group_sharing_preference_arn_ : cost_category_arn option)
    ~identifier:(identifier_ : resource_id) () =
  ({
     identifier = identifier_;
     name = name_;
     expires_at = expires_at_;
     group_sharing_preference = group_sharing_preference_;
     cost_category_group_sharing_preference_arn = cost_category_group_sharing_preference_arn_;
   }
    : update_bill_scenario_request)

let make_update_workload_estimate_response ?name:(name_ : workload_estimate_name option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?rate_type:(rate_type_ : workload_estimate_rate_type option)
    ?rate_timestamp:(rate_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?status:(status_ : workload_estimate_status option)
    ?total_cost:(total_cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?cost_currency:(cost_currency_ : currency_code option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~id:(id_ : resource_id) () =
  ({
     id = id_;
     name = name_;
     created_at = created_at_;
     expires_at = expires_at_;
     rate_type = rate_type_;
     rate_timestamp = rate_timestamp_;
     status = status_;
     total_cost = total_cost_;
     cost_currency = cost_currency_;
     failure_message = failure_message_;
   }
    : update_workload_estimate_response)

let make_update_workload_estimate_request ?name:(name_ : workload_estimate_name option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~identifier:(identifier_ : resource_id) () =
  ({ identifier = identifier_; name = name_; expires_at = expires_at_ }
    : update_workload_estimate_request)

let make_validation_exception_field ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ name = name_; message = message_ } : validation_exception_field)
