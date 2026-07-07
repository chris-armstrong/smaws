open Types

let make_external_id ~id:(id_ : external_id_identifier) ~issuer:(issuer_ : external_id_issuer) () =
  ({ id = id_; issuer = issuer_ } : external_id)

let make_name ?honorific_suffix:(honorific_suffix_ : sensitive_string_type option)
    ?honorific_prefix:(honorific_prefix_ : sensitive_string_type option)
    ?middle_name:(middle_name_ : sensitive_string_type option)
    ?given_name:(given_name_ : sensitive_string_type option)
    ?family_name:(family_name_ : sensitive_string_type option)
    ?formatted:(formatted_ : sensitive_string_type option) () =
  ({
     honorific_suffix = honorific_suffix_;
     honorific_prefix = honorific_prefix_;
     middle_name = middle_name_;
     given_name = given_name_;
     family_name = family_name_;
     formatted = formatted_;
   }
    : name)

let make_email ?primary:(primary_ : boolean_type option)
    ?type_:(type__ : sensitive_string_type option) ?value:(value_ : sensitive_string_type option) ()
    =
  ({ primary = primary_; type_ = type__; value = value_ } : email)

let make_address ?primary:(primary_ : boolean_type option)
    ?type_:(type__ : sensitive_string_type option)
    ?formatted:(formatted_ : sensitive_string_type option)
    ?country:(country_ : sensitive_string_type option)
    ?postal_code:(postal_code_ : sensitive_string_type option)
    ?region:(region_ : sensitive_string_type option)
    ?locality:(locality_ : sensitive_string_type option)
    ?street_address:(street_address_ : sensitive_string_type option) () =
  ({
     primary = primary_;
     type_ = type__;
     formatted = formatted_;
     country = country_;
     postal_code = postal_code_;
     region = region_;
     locality = locality_;
     street_address = street_address_;
   }
    : address)

let make_phone_number ?primary:(primary_ : boolean_type option)
    ?type_:(type__ : sensitive_string_type option) ?value:(value_ : sensitive_string_type option) ()
    =
  ({ primary = primary_; type_ = type__; value = value_ } : phone_number)

let make_photo ?primary:(primary_ : boolean_type option)
    ?display:(display_ : sensitive_string_type option)
    ?type_:(type__ : sensitive_string_type option) ~value:(value_ : sensitive_string_type) () =
  ({ primary = primary_; display = display_; type_ = type__; value = value_ } : photo)

let make_role ?primary:(primary_ : boolean_type option)
    ?type_:(type__ : sensitive_string_type option) ?value:(value_ : sensitive_string_type option) ()
    =
  ({ primary = primary_; type_ = type__; value = value_ } : role)

let make_user ?extensions:(extensions_ : extensions option)
    ?updated_by:(updated_by_ : string_type option) ?updated_at:(updated_at_ : date_type option)
    ?created_by:(created_by_ : string_type option) ?created_at:(created_at_ : date_type option)
    ?roles:(roles_ : roles option) ?birthdate:(birthdate_ : sensitive_string_type option)
    ?website:(website_ : sensitive_string_type option) ?photos:(photos_ : photos option)
    ?user_status:(user_status_ : user_status option)
    ?timezone:(timezone_ : sensitive_string_type option)
    ?locale:(locale_ : sensitive_string_type option)
    ?preferred_language:(preferred_language_ : sensitive_string_type option)
    ?title:(title_ : sensitive_string_type option)
    ?user_type:(user_type_ : sensitive_string_type option)
    ?phone_numbers:(phone_numbers_ : phone_numbers option)
    ?addresses:(addresses_ : addresses option) ?emails:(emails_ : emails option)
    ?profile_url:(profile_url_ : sensitive_string_type option)
    ?nick_name:(nick_name_ : sensitive_string_type option)
    ?display_name:(display_name_ : sensitive_string_type option) ?name:(name_ : name option)
    ?external_ids:(external_ids_ : external_ids option) ?user_name:(user_name_ : user_name option)
    ~user_id:(user_id_ : resource_id) ~identity_store_id:(identity_store_id_ : identity_store_id) ()
    =
  ({
     extensions = extensions_;
     updated_by = updated_by_;
     updated_at = updated_at_;
     created_by = created_by_;
     created_at = created_at_;
     roles = roles_;
     birthdate = birthdate_;
     website = website_;
     photos = photos_;
     user_status = user_status_;
     timezone = timezone_;
     locale = locale_;
     preferred_language = preferred_language_;
     title = title_;
     user_type = user_type_;
     phone_numbers = phone_numbers_;
     addresses = addresses_;
     emails = emails_;
     profile_url = profile_url_;
     nick_name = nick_name_;
     display_name = display_name_;
     name = name_;
     external_ids = external_ids_;
     user_name = user_name_;
     user_id = user_id_;
     identity_store_id = identity_store_id_;
   }
    : user)

let make_update_user_response () = (() : unit)

let make_attribute_operation ?attribute_value:(attribute_value_ : attribute_value option)
    ~attribute_path:(attribute_path_ : attribute_path) () =
  ({ attribute_value = attribute_value_; attribute_path = attribute_path_ } : attribute_operation)

let make_update_user_request ~operations:(operations_ : attribute_operations)
    ~user_id:(user_id_ : resource_id) ~identity_store_id:(identity_store_id_ : identity_store_id) ()
    =
  ({ operations = operations_; user_id = user_id_; identity_store_id = identity_store_id_ }
    : update_user_request)

let make_update_group_response () = (() : unit)

let make_update_group_request ~operations:(operations_ : attribute_operations)
    ~group_id:(group_id_ : resource_id) ~identity_store_id:(identity_store_id_ : identity_store_id)
    () =
  ({ operations = operations_; group_id = group_id_; identity_store_id = identity_store_id_ }
    : update_group_request)

let make_unique_attribute ~attribute_value:(attribute_value_ : attribute_value)
    ~attribute_path:(attribute_path_ : attribute_path) () =
  ({ attribute_value = attribute_value_; attribute_path = attribute_path_ } : unique_attribute)

let make_list_users_response ?next_token:(next_token_ : next_token option) ~users:(users_ : users)
    () =
  ({ next_token = next_token_; users = users_ } : list_users_response)

let make_filter ~attribute_value:(attribute_value_ : sensitive_string_type)
    ~attribute_path:(attribute_path_ : attribute_path) () =
  ({ attribute_value = attribute_value_; attribute_path = attribute_path_ } : filter)

let make_list_users_request ?filters:(filters_ : filters option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?extensions:(extensions_ : extension_names option)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
     extensions = extensions_;
     identity_store_id = identity_store_id_;
   }
    : list_users_request)

let make_group ?updated_by:(updated_by_ : string_type option)
    ?created_by:(created_by_ : string_type option) ?updated_at:(updated_at_ : date_type option)
    ?created_at:(created_at_ : date_type option)
    ?description:(description_ : sensitive_string_type option)
    ?external_ids:(external_ids_ : external_ids option)
    ?display_name:(display_name_ : group_display_name option)
    ~identity_store_id:(identity_store_id_ : identity_store_id) ~group_id:(group_id_ : resource_id)
    () =
  ({
     identity_store_id = identity_store_id_;
     updated_by = updated_by_;
     created_by = created_by_;
     updated_at = updated_at_;
     created_at = created_at_;
     description = description_;
     external_ids = external_ids_;
     display_name = display_name_;
     group_id = group_id_;
   }
    : group)

let make_list_groups_response ?next_token:(next_token_ : next_token option)
    ~groups:(groups_ : groups) () =
  ({ next_token = next_token_; groups = groups_ } : list_groups_response)

let make_list_groups_request ?filters:(filters_ : filters option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
     identity_store_id = identity_store_id_;
   }
    : list_groups_request)

let make_group_membership ?updated_by:(updated_by_ : string_type option)
    ?created_by:(created_by_ : string_type option) ?updated_at:(updated_at_ : date_type option)
    ?created_at:(created_at_ : date_type option) ?member_id:(member_id_ : member_id option)
    ?group_id:(group_id_ : resource_id option) ?membership_id:(membership_id_ : resource_id option)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({
     updated_by = updated_by_;
     created_by = created_by_;
     updated_at = updated_at_;
     created_at = created_at_;
     member_id = member_id_;
     group_id = group_id_;
     membership_id = membership_id_;
     identity_store_id = identity_store_id_;
   }
    : group_membership)

let make_list_group_memberships_response ?next_token:(next_token_ : next_token option)
    ~group_memberships:(group_memberships_ : group_memberships) () =
  ({ next_token = next_token_; group_memberships = group_memberships_ }
    : list_group_memberships_response)

let make_list_group_memberships_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~group_id:(group_id_ : resource_id)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     group_id = group_id_;
     identity_store_id = identity_store_id_;
   }
    : list_group_memberships_request)

let make_list_group_memberships_for_member_response ?next_token:(next_token_ : next_token option)
    ~group_memberships:(group_memberships_ : group_memberships) () =
  ({ next_token = next_token_; group_memberships = group_memberships_ }
    : list_group_memberships_for_member_response)

let make_list_group_memberships_for_member_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~member_id:(member_id_ : member_id)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     member_id = member_id_;
     identity_store_id = identity_store_id_;
   }
    : list_group_memberships_for_member_request)

let make_is_member_in_groups_response ~results:(results_ : group_membership_existence_results) () =
  ({ results = results_ } : is_member_in_groups_response)

let make_is_member_in_groups_request ~group_ids:(group_ids_ : group_ids)
    ~member_id:(member_id_ : member_id) ~identity_store_id:(identity_store_id_ : identity_store_id)
    () =
  ({ group_ids = group_ids_; member_id = member_id_; identity_store_id = identity_store_id_ }
    : is_member_in_groups_request)

let make_get_user_id_response ~user_id:(user_id_ : resource_id)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({ user_id = user_id_; identity_store_id = identity_store_id_ } : get_user_id_response)

let make_get_user_id_request ~alternate_identifier:(alternate_identifier_ : alternate_identifier)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({ alternate_identifier = alternate_identifier_; identity_store_id = identity_store_id_ }
    : get_user_id_request)

let make_get_group_membership_id_response
    ~identity_store_id:(identity_store_id_ : identity_store_id)
    ~membership_id:(membership_id_ : resource_id) () =
  ({ identity_store_id = identity_store_id_; membership_id = membership_id_ }
    : get_group_membership_id_response)

let make_get_group_membership_id_request ~member_id:(member_id_ : member_id)
    ~group_id:(group_id_ : resource_id) ~identity_store_id:(identity_store_id_ : identity_store_id)
    () =
  ({ member_id = member_id_; group_id = group_id_; identity_store_id = identity_store_id_ }
    : get_group_membership_id_request)

let make_get_group_id_response ~identity_store_id:(identity_store_id_ : identity_store_id)
    ~group_id:(group_id_ : resource_id) () =
  ({ identity_store_id = identity_store_id_; group_id = group_id_ } : get_group_id_response)

let make_get_group_id_request ~alternate_identifier:(alternate_identifier_ : alternate_identifier)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({ alternate_identifier = alternate_identifier_; identity_store_id = identity_store_id_ }
    : get_group_id_request)

let make_describe_user_response ?extensions:(extensions_ : extensions option)
    ?updated_by:(updated_by_ : string_type option) ?updated_at:(updated_at_ : date_type option)
    ?created_by:(created_by_ : string_type option) ?created_at:(created_at_ : date_type option)
    ?roles:(roles_ : roles option) ?birthdate:(birthdate_ : sensitive_string_type option)
    ?website:(website_ : sensitive_string_type option) ?photos:(photos_ : photos option)
    ?user_status:(user_status_ : user_status option)
    ?timezone:(timezone_ : sensitive_string_type option)
    ?locale:(locale_ : sensitive_string_type option)
    ?preferred_language:(preferred_language_ : sensitive_string_type option)
    ?title:(title_ : sensitive_string_type option)
    ?user_type:(user_type_ : sensitive_string_type option)
    ?phone_numbers:(phone_numbers_ : phone_numbers option)
    ?addresses:(addresses_ : addresses option) ?emails:(emails_ : emails option)
    ?profile_url:(profile_url_ : sensitive_string_type option)
    ?nick_name:(nick_name_ : sensitive_string_type option)
    ?display_name:(display_name_ : sensitive_string_type option) ?name:(name_ : name option)
    ?external_ids:(external_ids_ : external_ids option) ?user_name:(user_name_ : user_name option)
    ~user_id:(user_id_ : resource_id) ~identity_store_id:(identity_store_id_ : identity_store_id) ()
    =
  ({
     extensions = extensions_;
     updated_by = updated_by_;
     updated_at = updated_at_;
     created_by = created_by_;
     created_at = created_at_;
     roles = roles_;
     birthdate = birthdate_;
     website = website_;
     photos = photos_;
     user_status = user_status_;
     timezone = timezone_;
     locale = locale_;
     preferred_language = preferred_language_;
     title = title_;
     user_type = user_type_;
     phone_numbers = phone_numbers_;
     addresses = addresses_;
     emails = emails_;
     profile_url = profile_url_;
     nick_name = nick_name_;
     display_name = display_name_;
     name = name_;
     external_ids = external_ids_;
     user_name = user_name_;
     user_id = user_id_;
     identity_store_id = identity_store_id_;
   }
    : describe_user_response)

let make_describe_user_request ?extensions:(extensions_ : extension_names option)
    ~user_id:(user_id_ : resource_id) ~identity_store_id:(identity_store_id_ : identity_store_id) ()
    =
  ({ extensions = extensions_; user_id = user_id_; identity_store_id = identity_store_id_ }
    : describe_user_request)

let make_describe_group_response ?updated_by:(updated_by_ : string_type option)
    ?created_by:(created_by_ : string_type option) ?updated_at:(updated_at_ : date_type option)
    ?created_at:(created_at_ : date_type option)
    ?description:(description_ : sensitive_string_type option)
    ?external_ids:(external_ids_ : external_ids option)
    ?display_name:(display_name_ : group_display_name option)
    ~identity_store_id:(identity_store_id_ : identity_store_id) ~group_id:(group_id_ : resource_id)
    () =
  ({
     identity_store_id = identity_store_id_;
     updated_by = updated_by_;
     created_by = created_by_;
     updated_at = updated_at_;
     created_at = created_at_;
     description = description_;
     external_ids = external_ids_;
     display_name = display_name_;
     group_id = group_id_;
   }
    : describe_group_response)

let make_describe_group_request ~group_id:(group_id_ : resource_id)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({ group_id = group_id_; identity_store_id = identity_store_id_ } : describe_group_request)

let make_describe_group_membership_response ?updated_by:(updated_by_ : string_type option)
    ?created_by:(created_by_ : string_type option) ?updated_at:(updated_at_ : date_type option)
    ?created_at:(created_at_ : date_type option) ~member_id:(member_id_ : member_id)
    ~group_id:(group_id_ : resource_id) ~membership_id:(membership_id_ : resource_id)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({
     updated_by = updated_by_;
     created_by = created_by_;
     updated_at = updated_at_;
     created_at = created_at_;
     member_id = member_id_;
     group_id = group_id_;
     membership_id = membership_id_;
     identity_store_id = identity_store_id_;
   }
    : describe_group_membership_response)

let make_describe_group_membership_request ~membership_id:(membership_id_ : resource_id)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({ membership_id = membership_id_; identity_store_id = identity_store_id_ }
    : describe_group_membership_request)

let make_delete_user_response () = (() : unit)

let make_delete_user_request ~user_id:(user_id_ : resource_id)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({ user_id = user_id_; identity_store_id = identity_store_id_ } : delete_user_request)

let make_delete_group_response () = (() : unit)

let make_delete_group_request ~group_id:(group_id_ : resource_id)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({ group_id = group_id_; identity_store_id = identity_store_id_ } : delete_group_request)

let make_delete_group_membership_response () = (() : unit)

let make_delete_group_membership_request ~membership_id:(membership_id_ : resource_id)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({ membership_id = membership_id_; identity_store_id = identity_store_id_ }
    : delete_group_membership_request)

let make_create_user_response ~user_id:(user_id_ : resource_id)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({ user_id = user_id_; identity_store_id = identity_store_id_ } : create_user_response)

let make_create_user_request ?extensions:(extensions_ : extensions option)
    ?roles:(roles_ : roles option) ?birthdate:(birthdate_ : sensitive_string_type option)
    ?website:(website_ : sensitive_string_type option) ?photos:(photos_ : photos option)
    ?timezone:(timezone_ : sensitive_string_type option)
    ?locale:(locale_ : sensitive_string_type option)
    ?preferred_language:(preferred_language_ : sensitive_string_type option)
    ?title:(title_ : sensitive_string_type option)
    ?user_type:(user_type_ : sensitive_string_type option)
    ?phone_numbers:(phone_numbers_ : phone_numbers option)
    ?addresses:(addresses_ : addresses option) ?emails:(emails_ : emails option)
    ?profile_url:(profile_url_ : sensitive_string_type option)
    ?nick_name:(nick_name_ : sensitive_string_type option)
    ?display_name:(display_name_ : sensitive_string_type option) ?name:(name_ : name option)
    ?user_name:(user_name_ : user_name option)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({
     extensions = extensions_;
     roles = roles_;
     birthdate = birthdate_;
     website = website_;
     photos = photos_;
     timezone = timezone_;
     locale = locale_;
     preferred_language = preferred_language_;
     title = title_;
     user_type = user_type_;
     phone_numbers = phone_numbers_;
     addresses = addresses_;
     emails = emails_;
     profile_url = profile_url_;
     nick_name = nick_name_;
     display_name = display_name_;
     name = name_;
     user_name = user_name_;
     identity_store_id = identity_store_id_;
   }
    : create_user_request)

let make_create_group_response ~identity_store_id:(identity_store_id_ : identity_store_id)
    ~group_id:(group_id_ : resource_id) () =
  ({ identity_store_id = identity_store_id_; group_id = group_id_ } : create_group_response)

let make_create_group_request ?description:(description_ : sensitive_string_type option)
    ?display_name:(display_name_ : group_display_name option)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({
     description = description_;
     display_name = display_name_;
     identity_store_id = identity_store_id_;
   }
    : create_group_request)

let make_create_group_membership_response
    ~identity_store_id:(identity_store_id_ : identity_store_id)
    ~membership_id:(membership_id_ : resource_id) () =
  ({ identity_store_id = identity_store_id_; membership_id = membership_id_ }
    : create_group_membership_response)

let make_create_group_membership_request ~member_id:(member_id_ : member_id)
    ~group_id:(group_id_ : resource_id) ~identity_store_id:(identity_store_id_ : identity_store_id)
    () =
  ({ member_id = member_id_; group_id = group_id_; identity_store_id = identity_store_id_ }
    : create_group_membership_request)
