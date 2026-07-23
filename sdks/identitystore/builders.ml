open Types

let make_group_membership ?membership_id:(membership_id_ : resource_id option)
    ?group_id:(group_id_ : resource_id option) ?member_id:(member_id_ : member_id option)
    ?created_at:(created_at_ : date_type option) ?updated_at:(updated_at_ : date_type option)
    ?created_by:(created_by_ : string_type option) ?updated_by:(updated_by_ : string_type option)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({
     identity_store_id = identity_store_id_;
     membership_id = membership_id_;
     group_id = group_id_;
     member_id = member_id_;
     created_at = created_at_;
     updated_at = updated_at_;
     created_by = created_by_;
     updated_by = updated_by_;
   }
    : group_membership)

let make_list_group_memberships_for_member_response ?next_token:(next_token_ : next_token option)
    ~group_memberships:(group_memberships_ : group_memberships) () =
  ({ group_memberships = group_memberships_; next_token = next_token_ }
    : list_group_memberships_for_member_response)

let make_list_group_memberships_for_member_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ~identity_store_id:(identity_store_id_ : identity_store_id) ~member_id:(member_id_ : member_id)
    () =
  ({
     identity_store_id = identity_store_id_;
     member_id = member_id_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_group_memberships_for_member_request)

let make_is_member_in_groups_response ~results:(results_ : group_membership_existence_results) () =
  ({ results = results_ } : is_member_in_groups_response)

let make_is_member_in_groups_request ~identity_store_id:(identity_store_id_ : identity_store_id)
    ~member_id:(member_id_ : member_id) ~group_ids:(group_ids_ : group_ids) () =
  ({ identity_store_id = identity_store_id_; member_id = member_id_; group_ids = group_ids_ }
    : is_member_in_groups_request)

let make_get_user_id_response ~identity_store_id:(identity_store_id_ : identity_store_id)
    ~user_id:(user_id_ : resource_id) () =
  ({ identity_store_id = identity_store_id_; user_id = user_id_ } : get_user_id_response)

let make_unique_attribute ~attribute_path:(attribute_path_ : attribute_path)
    ~attribute_value:(attribute_value_ : attribute_value) () =
  ({ attribute_path = attribute_path_; attribute_value = attribute_value_ } : unique_attribute)

let make_external_id ~issuer:(issuer_ : external_id_issuer) ~id:(id_ : external_id_identifier) () =
  ({ issuer = issuer_; id = id_ } : external_id)

let make_get_user_id_request ~identity_store_id:(identity_store_id_ : identity_store_id)
    ~alternate_identifier:(alternate_identifier_ : alternate_identifier) () =
  ({ identity_store_id = identity_store_id_; alternate_identifier = alternate_identifier_ }
    : get_user_id_request)

let make_get_group_membership_id_response ~membership_id:(membership_id_ : resource_id)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({ membership_id = membership_id_; identity_store_id = identity_store_id_ }
    : get_group_membership_id_response)

let make_get_group_membership_id_request ~identity_store_id:(identity_store_id_ : identity_store_id)
    ~group_id:(group_id_ : resource_id) ~member_id:(member_id_ : member_id) () =
  ({ identity_store_id = identity_store_id_; group_id = group_id_; member_id = member_id_ }
    : get_group_membership_id_request)

let make_get_group_id_response ~group_id:(group_id_ : resource_id)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({ group_id = group_id_; identity_store_id = identity_store_id_ } : get_group_id_response)

let make_get_group_id_request ~identity_store_id:(identity_store_id_ : identity_store_id)
    ~alternate_identifier:(alternate_identifier_ : alternate_identifier) () =
  ({ identity_store_id = identity_store_id_; alternate_identifier = alternate_identifier_ }
    : get_group_id_request)

let make_address ?street_address:(street_address_ : sensitive_string_type option)
    ?locality:(locality_ : sensitive_string_type option)
    ?region:(region_ : sensitive_string_type option)
    ?postal_code:(postal_code_ : sensitive_string_type option)
    ?country:(country_ : sensitive_string_type option)
    ?formatted:(formatted_ : sensitive_string_type option)
    ?type_:(type__ : sensitive_string_type option) ?primary:(primary_ : boolean_type option) () =
  ({
     street_address = street_address_;
     locality = locality_;
     region = region_;
     postal_code = postal_code_;
     country = country_;
     formatted = formatted_;
     type_ = type__;
     primary = primary_;
   }
    : address)

let make_attribute_operation ?attribute_value:(attribute_value_ : attribute_value option)
    ~attribute_path:(attribute_path_ : attribute_path) () =
  ({ attribute_path = attribute_path_; attribute_value = attribute_value_ } : attribute_operation)

let make_create_group_response ~group_id:(group_id_ : resource_id)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({ group_id = group_id_; identity_store_id = identity_store_id_ } : create_group_response)

let make_create_group_request ?display_name:(display_name_ : group_display_name option)
    ?description:(description_ : sensitive_string_type option)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({
     identity_store_id = identity_store_id_;
     display_name = display_name_;
     description = description_;
   }
    : create_group_request)

let make_create_group_membership_response ~membership_id:(membership_id_ : resource_id)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({ membership_id = membership_id_; identity_store_id = identity_store_id_ }
    : create_group_membership_response)

let make_create_group_membership_request ~identity_store_id:(identity_store_id_ : identity_store_id)
    ~group_id:(group_id_ : resource_id) ~member_id:(member_id_ : member_id) () =
  ({ identity_store_id = identity_store_id_; group_id = group_id_; member_id = member_id_ }
    : create_group_membership_request)

let make_create_user_response ~identity_store_id:(identity_store_id_ : identity_store_id)
    ~user_id:(user_id_ : resource_id) () =
  ({ identity_store_id = identity_store_id_; user_id = user_id_ } : create_user_response)

let make_role ?value:(value_ : sensitive_string_type option)
    ?type_:(type__ : sensitive_string_type option) ?primary:(primary_ : boolean_type option) () =
  ({ value = value_; type_ = type__; primary = primary_ } : role)

let make_photo ?type_:(type__ : sensitive_string_type option)
    ?display:(display_ : sensitive_string_type option) ?primary:(primary_ : boolean_type option)
    ~value:(value_ : sensitive_string_type) () =
  ({ value = value_; type_ = type__; display = display_; primary = primary_ } : photo)

let make_phone_number ?value:(value_ : sensitive_string_type option)
    ?type_:(type__ : sensitive_string_type option) ?primary:(primary_ : boolean_type option) () =
  ({ value = value_; type_ = type__; primary = primary_ } : phone_number)

let make_email ?value:(value_ : sensitive_string_type option)
    ?type_:(type__ : sensitive_string_type option) ?primary:(primary_ : boolean_type option) () =
  ({ value = value_; type_ = type__; primary = primary_ } : email)

let make_name ?formatted:(formatted_ : sensitive_string_type option)
    ?family_name:(family_name_ : sensitive_string_type option)
    ?given_name:(given_name_ : sensitive_string_type option)
    ?middle_name:(middle_name_ : sensitive_string_type option)
    ?honorific_prefix:(honorific_prefix_ : sensitive_string_type option)
    ?honorific_suffix:(honorific_suffix_ : sensitive_string_type option) () =
  ({
     formatted = formatted_;
     family_name = family_name_;
     given_name = given_name_;
     middle_name = middle_name_;
     honorific_prefix = honorific_prefix_;
     honorific_suffix = honorific_suffix_;
   }
    : name)

let make_create_user_request ?user_name:(user_name_ : user_name option) ?name:(name_ : name option)
    ?display_name:(display_name_ : sensitive_string_type option)
    ?nick_name:(nick_name_ : sensitive_string_type option)
    ?profile_url:(profile_url_ : sensitive_string_type option) ?emails:(emails_ : emails option)
    ?addresses:(addresses_ : addresses option)
    ?phone_numbers:(phone_numbers_ : phone_numbers option)
    ?user_type:(user_type_ : sensitive_string_type option)
    ?title:(title_ : sensitive_string_type option)
    ?preferred_language:(preferred_language_ : sensitive_string_type option)
    ?locale:(locale_ : sensitive_string_type option)
    ?timezone:(timezone_ : sensitive_string_type option) ?photos:(photos_ : photos option)
    ?website:(website_ : sensitive_string_type option)
    ?birthdate:(birthdate_ : sensitive_string_type option) ?roles:(roles_ : roles option)
    ?extensions:(extensions_ : extensions option)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({
     identity_store_id = identity_store_id_;
     user_name = user_name_;
     name = name_;
     display_name = display_name_;
     nick_name = nick_name_;
     profile_url = profile_url_;
     emails = emails_;
     addresses = addresses_;
     phone_numbers = phone_numbers_;
     user_type = user_type_;
     title = title_;
     preferred_language = preferred_language_;
     locale = locale_;
     timezone = timezone_;
     photos = photos_;
     website = website_;
     birthdate = birthdate_;
     roles = roles_;
     extensions = extensions_;
   }
    : create_user_request)

let make_delete_group_response () = (() : unit)

let make_delete_group_request ~identity_store_id:(identity_store_id_ : identity_store_id)
    ~group_id:(group_id_ : resource_id) () =
  ({ identity_store_id = identity_store_id_; group_id = group_id_ } : delete_group_request)

let make_delete_group_membership_response () = (() : unit)

let make_delete_group_membership_request ~identity_store_id:(identity_store_id_ : identity_store_id)
    ~membership_id:(membership_id_ : resource_id) () =
  ({ identity_store_id = identity_store_id_; membership_id = membership_id_ }
    : delete_group_membership_request)

let make_delete_user_response () = (() : unit)

let make_delete_user_request ~identity_store_id:(identity_store_id_ : identity_store_id)
    ~user_id:(user_id_ : resource_id) () =
  ({ identity_store_id = identity_store_id_; user_id = user_id_ } : delete_user_request)

let make_describe_group_response ?display_name:(display_name_ : group_display_name option)
    ?external_ids:(external_ids_ : external_ids option)
    ?description:(description_ : sensitive_string_type option)
    ?created_at:(created_at_ : date_type option) ?updated_at:(updated_at_ : date_type option)
    ?created_by:(created_by_ : string_type option) ?updated_by:(updated_by_ : string_type option)
    ~group_id:(group_id_ : resource_id) ~identity_store_id:(identity_store_id_ : identity_store_id)
    () =
  ({
     group_id = group_id_;
     display_name = display_name_;
     external_ids = external_ids_;
     description = description_;
     created_at = created_at_;
     updated_at = updated_at_;
     created_by = created_by_;
     updated_by = updated_by_;
     identity_store_id = identity_store_id_;
   }
    : describe_group_response)

let make_describe_group_request ~identity_store_id:(identity_store_id_ : identity_store_id)
    ~group_id:(group_id_ : resource_id) () =
  ({ identity_store_id = identity_store_id_; group_id = group_id_ } : describe_group_request)

let make_describe_group_membership_response ?created_at:(created_at_ : date_type option)
    ?updated_at:(updated_at_ : date_type option) ?created_by:(created_by_ : string_type option)
    ?updated_by:(updated_by_ : string_type option)
    ~identity_store_id:(identity_store_id_ : identity_store_id)
    ~membership_id:(membership_id_ : resource_id) ~group_id:(group_id_ : resource_id)
    ~member_id:(member_id_ : member_id) () =
  ({
     identity_store_id = identity_store_id_;
     membership_id = membership_id_;
     group_id = group_id_;
     member_id = member_id_;
     created_at = created_at_;
     updated_at = updated_at_;
     created_by = created_by_;
     updated_by = updated_by_;
   }
    : describe_group_membership_response)

let make_describe_group_membership_request
    ~identity_store_id:(identity_store_id_ : identity_store_id)
    ~membership_id:(membership_id_ : resource_id) () =
  ({ identity_store_id = identity_store_id_; membership_id = membership_id_ }
    : describe_group_membership_request)

let make_describe_user_response ?user_name:(user_name_ : user_name option)
    ?external_ids:(external_ids_ : external_ids option) ?name:(name_ : name option)
    ?display_name:(display_name_ : sensitive_string_type option)
    ?nick_name:(nick_name_ : sensitive_string_type option)
    ?profile_url:(profile_url_ : sensitive_string_type option) ?emails:(emails_ : emails option)
    ?addresses:(addresses_ : addresses option)
    ?phone_numbers:(phone_numbers_ : phone_numbers option)
    ?user_type:(user_type_ : sensitive_string_type option)
    ?title:(title_ : sensitive_string_type option)
    ?preferred_language:(preferred_language_ : sensitive_string_type option)
    ?locale:(locale_ : sensitive_string_type option)
    ?timezone:(timezone_ : sensitive_string_type option)
    ?user_status:(user_status_ : user_status option) ?photos:(photos_ : photos option)
    ?website:(website_ : sensitive_string_type option)
    ?birthdate:(birthdate_ : sensitive_string_type option) ?roles:(roles_ : roles option)
    ?created_at:(created_at_ : date_type option) ?created_by:(created_by_ : string_type option)
    ?updated_at:(updated_at_ : date_type option) ?updated_by:(updated_by_ : string_type option)
    ?extensions:(extensions_ : extensions option)
    ~identity_store_id:(identity_store_id_ : identity_store_id) ~user_id:(user_id_ : resource_id) ()
    =
  ({
     identity_store_id = identity_store_id_;
     user_id = user_id_;
     user_name = user_name_;
     external_ids = external_ids_;
     name = name_;
     display_name = display_name_;
     nick_name = nick_name_;
     profile_url = profile_url_;
     emails = emails_;
     addresses = addresses_;
     phone_numbers = phone_numbers_;
     user_type = user_type_;
     title = title_;
     preferred_language = preferred_language_;
     locale = locale_;
     timezone = timezone_;
     user_status = user_status_;
     photos = photos_;
     website = website_;
     birthdate = birthdate_;
     roles = roles_;
     created_at = created_at_;
     created_by = created_by_;
     updated_at = updated_at_;
     updated_by = updated_by_;
     extensions = extensions_;
   }
    : describe_user_response)

let make_describe_user_request ?extensions:(extensions_ : extension_names option)
    ~identity_store_id:(identity_store_id_ : identity_store_id) ~user_id:(user_id_ : resource_id) ()
    =
  ({ identity_store_id = identity_store_id_; user_id = user_id_; extensions = extensions_ }
    : describe_user_request)

let make_filter ~attribute_path:(attribute_path_ : attribute_path)
    ~attribute_value:(attribute_value_ : sensitive_string_type) () =
  ({ attribute_path = attribute_path_; attribute_value = attribute_value_ } : filter)

let make_group ?display_name:(display_name_ : group_display_name option)
    ?external_ids:(external_ids_ : external_ids option)
    ?description:(description_ : sensitive_string_type option)
    ?created_at:(created_at_ : date_type option) ?updated_at:(updated_at_ : date_type option)
    ?created_by:(created_by_ : string_type option) ?updated_by:(updated_by_ : string_type option)
    ~group_id:(group_id_ : resource_id) ~identity_store_id:(identity_store_id_ : identity_store_id)
    () =
  ({
     group_id = group_id_;
     display_name = display_name_;
     external_ids = external_ids_;
     description = description_;
     created_at = created_at_;
     updated_at = updated_at_;
     created_by = created_by_;
     updated_by = updated_by_;
     identity_store_id = identity_store_id_;
   }
    : group)

let make_list_group_memberships_response ?next_token:(next_token_ : next_token option)
    ~group_memberships:(group_memberships_ : group_memberships) () =
  ({ group_memberships = group_memberships_; next_token = next_token_ }
    : list_group_memberships_response)

let make_list_group_memberships_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ~identity_store_id:(identity_store_id_ : identity_store_id) ~group_id:(group_id_ : resource_id)
    () =
  ({
     identity_store_id = identity_store_id_;
     group_id = group_id_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_group_memberships_request)

let make_list_groups_response ?next_token:(next_token_ : next_token option)
    ~groups:(groups_ : groups) () =
  ({ groups = groups_; next_token = next_token_ } : list_groups_response)

let make_list_groups_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?filters:(filters_ : filters option)
    ~identity_store_id:(identity_store_id_ : identity_store_id) () =
  ({
     identity_store_id = identity_store_id_;
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
   }
    : list_groups_request)

let make_user ?user_name:(user_name_ : user_name option)
    ?external_ids:(external_ids_ : external_ids option) ?name:(name_ : name option)
    ?display_name:(display_name_ : sensitive_string_type option)
    ?nick_name:(nick_name_ : sensitive_string_type option)
    ?profile_url:(profile_url_ : sensitive_string_type option) ?emails:(emails_ : emails option)
    ?addresses:(addresses_ : addresses option)
    ?phone_numbers:(phone_numbers_ : phone_numbers option)
    ?user_type:(user_type_ : sensitive_string_type option)
    ?title:(title_ : sensitive_string_type option)
    ?preferred_language:(preferred_language_ : sensitive_string_type option)
    ?locale:(locale_ : sensitive_string_type option)
    ?timezone:(timezone_ : sensitive_string_type option)
    ?user_status:(user_status_ : user_status option) ?photos:(photos_ : photos option)
    ?website:(website_ : sensitive_string_type option)
    ?birthdate:(birthdate_ : sensitive_string_type option) ?roles:(roles_ : roles option)
    ?created_at:(created_at_ : date_type option) ?created_by:(created_by_ : string_type option)
    ?updated_at:(updated_at_ : date_type option) ?updated_by:(updated_by_ : string_type option)
    ?extensions:(extensions_ : extensions option)
    ~identity_store_id:(identity_store_id_ : identity_store_id) ~user_id:(user_id_ : resource_id) ()
    =
  ({
     identity_store_id = identity_store_id_;
     user_id = user_id_;
     user_name = user_name_;
     external_ids = external_ids_;
     name = name_;
     display_name = display_name_;
     nick_name = nick_name_;
     profile_url = profile_url_;
     emails = emails_;
     addresses = addresses_;
     phone_numbers = phone_numbers_;
     user_type = user_type_;
     title = title_;
     preferred_language = preferred_language_;
     locale = locale_;
     timezone = timezone_;
     user_status = user_status_;
     photos = photos_;
     website = website_;
     birthdate = birthdate_;
     roles = roles_;
     created_at = created_at_;
     created_by = created_by_;
     updated_at = updated_at_;
     updated_by = updated_by_;
     extensions = extensions_;
   }
    : user)

let make_list_users_response ?next_token:(next_token_ : next_token option) ~users:(users_ : users)
    () =
  ({ users = users_; next_token = next_token_ } : list_users_response)

let make_list_users_request ?extensions:(extensions_ : extension_names option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : filters option) ~identity_store_id:(identity_store_id_ : identity_store_id)
    () =
  ({
     identity_store_id = identity_store_id_;
     extensions = extensions_;
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
   }
    : list_users_request)

let make_update_group_response () = (() : unit)

let make_update_group_request ~identity_store_id:(identity_store_id_ : identity_store_id)
    ~group_id:(group_id_ : resource_id) ~operations:(operations_ : attribute_operations) () =
  ({ identity_store_id = identity_store_id_; group_id = group_id_; operations = operations_ }
    : update_group_request)

let make_update_user_response () = (() : unit)

let make_update_user_request ~identity_store_id:(identity_store_id_ : identity_store_id)
    ~user_id:(user_id_ : resource_id) ~operations:(operations_ : attribute_operations) () =
  ({ identity_store_id = identity_store_id_; user_id = user_id_; operations = operations_ }
    : update_user_request)
