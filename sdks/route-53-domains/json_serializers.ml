open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let unsupported_tl_d_to_yojson (x : unsupported_tl_d) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let operation_limit_exceeded_to_yojson (x : operation_limit_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_input_to_yojson (x : invalid_input) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let domain_limit_exceeded_to_yojson (x : domain_limit_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let operation_id_to_yojson = string_to_yojson

let accept_domain_transfer_from_another_aws_account_response_to_yojson
    (x : accept_domain_transfer_from_another_aws_account_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let password_to_yojson = string_to_yojson
let domain_name_to_yojson = string_to_yojson

let accept_domain_transfer_from_another_aws_account_request_to_yojson
    (x : accept_domain_transfer_from_another_aws_account_request) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("Password", Some (password_to_yojson x.password));
    ]

let account_id_to_yojson = string_to_yojson
let address_line_to_yojson = string_to_yojson

let tld_rules_violation_to_yojson (x : tld_rules_violation) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let request_id_to_yojson = string_to_yojson

let duplicate_request_to_yojson (x : duplicate_request) =
  assoc_to_yojson
    [
      ("requestId", option_to_yojson request_id_to_yojson x.request_id);
      ("message", option_to_yojson error_message_to_yojson x.message);
    ]

let dnssec_limit_exceeded_to_yojson (x : dnssec_limit_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let associate_delegation_signer_to_domain_response_to_yojson
    (x : associate_delegation_signer_to_domain_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let dnssec_public_key_to_yojson = string_to_yojson
let nullable_integer_to_yojson = int_to_yojson

let dnssec_signing_attributes_to_yojson (x : dnssec_signing_attributes) =
  assoc_to_yojson
    [
      ("Algorithm", option_to_yojson nullable_integer_to_yojson x.algorithm);
      ("Flags", option_to_yojson nullable_integer_to_yojson x.flags);
      ("PublicKey", option_to_yojson dnssec_public_key_to_yojson x.public_key);
    ]

let associate_delegation_signer_to_domain_request_to_yojson
    (x : associate_delegation_signer_to_domain_request) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("SigningAttributes", Some (dnssec_signing_attributes_to_yojson x.signing_attributes));
    ]

let price_to_yojson = double_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let invoice_id_to_yojson = string_to_yojson

let operation_type_to_yojson (x : operation_type) =
  match x with
  | REGISTER_DOMAIN -> `String "REGISTER_DOMAIN"
  | DELETE_DOMAIN -> `String "DELETE_DOMAIN"
  | TRANSFER_IN_DOMAIN -> `String "TRANSFER_IN_DOMAIN"
  | UPDATE_DOMAIN_CONTACT -> `String "UPDATE_DOMAIN_CONTACT"
  | UPDATE_NAMESERVER -> `String "UPDATE_NAMESERVER"
  | CHANGE_PRIVACY_PROTECTION -> `String "CHANGE_PRIVACY_PROTECTION"
  | DOMAIN_LOCK -> `String "DOMAIN_LOCK"
  | ENABLE_AUTORENEW -> `String "ENABLE_AUTORENEW"
  | DISABLE_AUTORENEW -> `String "DISABLE_AUTORENEW"
  | ADD_DNSSEC -> `String "ADD_DNSSEC"
  | REMOVE_DNSSEC -> `String "REMOVE_DNSSEC"
  | EXPIRE_DOMAIN -> `String "EXPIRE_DOMAIN"
  | TRANSFER_OUT_DOMAIN -> `String "TRANSFER_OUT_DOMAIN"
  | CHANGE_DOMAIN_OWNER -> `String "CHANGE_DOMAIN_OWNER"
  | RENEW_DOMAIN -> `String "RENEW_DOMAIN"
  | PUSH_DOMAIN -> `String "PUSH_DOMAIN"
  | INTERNAL_TRANSFER_OUT_DOMAIN -> `String "INTERNAL_TRANSFER_OUT_DOMAIN"
  | INTERNAL_TRANSFER_IN_DOMAIN -> `String "INTERNAL_TRANSFER_IN_DOMAIN"
  | RELEASE_TO_GANDI -> `String "RELEASE_TO_GANDI"
  | TRANSFER_ON_RENEW -> `String "TRANSFER_ON_RENEW"
  | RESTORE_DOMAIN -> `String "RESTORE_DOMAIN"

let billing_record_to_yojson (x : billing_record) =
  assoc_to_yojson
    [
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("Operation", option_to_yojson operation_type_to_yojson x.operation);
      ("InvoiceId", option_to_yojson invoice_id_to_yojson x.invoice_id);
      ("BillDate", option_to_yojson timestamp_to_yojson x.bill_date);
      ("Price", option_to_yojson price_to_yojson x.price);
    ]

let billing_records_to_yojson tree = list_to_yojson billing_record_to_yojson tree
let boolean__to_yojson = bool_to_yojson

let cancel_domain_transfer_to_another_aws_account_response_to_yojson
    (x : cancel_domain_transfer_to_another_aws_account_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let cancel_domain_transfer_to_another_aws_account_request_to_yojson
    (x : cancel_domain_transfer_to_another_aws_account_request) =
  assoc_to_yojson [ ("DomainName", Some (domain_name_to_yojson x.domain_name)) ]

let tld_name_to_yojson = string_to_yojson

let tld_in_maintenance_to_yojson (x : tld_in_maintenance) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("tld", option_to_yojson tld_name_to_yojson x.tld);
    ]

let domain_availability_to_yojson (x : domain_availability) =
  match x with
  | AVAILABLE -> `String "AVAILABLE"
  | AVAILABLE_RESERVED -> `String "AVAILABLE_RESERVED"
  | AVAILABLE_PREORDER -> `String "AVAILABLE_PREORDER"
  | UNAVAILABLE -> `String "UNAVAILABLE"
  | UNAVAILABLE_PREMIUM -> `String "UNAVAILABLE_PREMIUM"
  | UNAVAILABLE_RESTRICTED -> `String "UNAVAILABLE_RESTRICTED"
  | RESERVED -> `String "RESERVED"
  | DONT_KNOW -> `String "DONT_KNOW"
  | INVALID_NAME_FOR_TLD -> `String "INVALID_NAME_FOR_TLD"
  | PENDING -> `String "PENDING"

let check_domain_availability_response_to_yojson (x : check_domain_availability_response) =
  assoc_to_yojson
    [ ("Availability", option_to_yojson domain_availability_to_yojson x.availability) ]

let lang_code_to_yojson = string_to_yojson

let check_domain_availability_request_to_yojson (x : check_domain_availability_request) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("IdnLangCode", option_to_yojson lang_code_to_yojson x.idn_lang_code);
    ]

let message_to_yojson = string_to_yojson

let transferable_to_yojson (x : transferable) =
  match x with
  | TRANSFERABLE -> `String "TRANSFERABLE"
  | UNTRANSFERABLE -> `String "UNTRANSFERABLE"
  | DONT_KNOW -> `String "DONT_KNOW"
  | DOMAIN_IN_OWN_ACCOUNT -> `String "DOMAIN_IN_OWN_ACCOUNT"
  | DOMAIN_IN_ANOTHER_ACCOUNT -> `String "DOMAIN_IN_ANOTHER_ACCOUNT"
  | PREMIUM_DOMAIN -> `String "PREMIUM_DOMAIN"

let domain_transferability_to_yojson (x : domain_transferability) =
  assoc_to_yojson [ ("Transferable", option_to_yojson transferable_to_yojson x.transferable) ]

let check_domain_transferability_response_to_yojson (x : check_domain_transferability_response) =
  assoc_to_yojson
    [
      ("Transferability", option_to_yojson domain_transferability_to_yojson x.transferability);
      ("Message", option_to_yojson message_to_yojson x.message);
    ]

let domain_auth_code_to_yojson = string_to_yojson

let check_domain_transferability_request_to_yojson (x : check_domain_transferability_request) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("AuthCode", option_to_yojson domain_auth_code_to_yojson x.auth_code);
    ]

let city_to_yojson = string_to_yojson
let currency_to_yojson = string_to_yojson

let consent_to_yojson (x : consent) =
  assoc_to_yojson
    [
      ("MaxPrice", Some (price_to_yojson x.max_price));
      ("Currency", Some (currency_to_yojson x.currency));
    ]

let extra_param_value_to_yojson = string_to_yojson

let extra_param_name_to_yojson (x : extra_param_name) =
  match x with
  | DUNS_NUMBER -> `String "DUNS_NUMBER"
  | BRAND_NUMBER -> `String "BRAND_NUMBER"
  | BIRTH_DEPARTMENT -> `String "BIRTH_DEPARTMENT"
  | BIRTH_DATE_IN_YYYY_MM_DD -> `String "BIRTH_DATE_IN_YYYY_MM_DD"
  | BIRTH_COUNTRY -> `String "BIRTH_COUNTRY"
  | BIRTH_CITY -> `String "BIRTH_CITY"
  | DOCUMENT_NUMBER -> `String "DOCUMENT_NUMBER"
  | AU_ID_NUMBER -> `String "AU_ID_NUMBER"
  | AU_ID_TYPE -> `String "AU_ID_TYPE"
  | CA_LEGAL_TYPE -> `String "CA_LEGAL_TYPE"
  | CA_BUSINESS_ENTITY_TYPE -> `String "CA_BUSINESS_ENTITY_TYPE"
  | CA_LEGAL_REPRESENTATIVE -> `String "CA_LEGAL_REPRESENTATIVE"
  | CA_LEGAL_REPRESENTATIVE_CAPACITY -> `String "CA_LEGAL_REPRESENTATIVE_CAPACITY"
  | ES_IDENTIFICATION -> `String "ES_IDENTIFICATION"
  | ES_IDENTIFICATION_TYPE -> `String "ES_IDENTIFICATION_TYPE"
  | ES_LEGAL_FORM -> `String "ES_LEGAL_FORM"
  | FI_BUSINESS_NUMBER -> `String "FI_BUSINESS_NUMBER"
  | ONWER_FI_ID_NUMBER -> `String "FI_ID_NUMBER"
  | FI_NATIONALITY -> `String "FI_NATIONALITY"
  | FI_ORGANIZATION_TYPE -> `String "FI_ORGANIZATION_TYPE"
  | IT_NATIONALITY -> `String "IT_NATIONALITY"
  | IT_PIN -> `String "IT_PIN"
  | IT_REGISTRANT_ENTITY_TYPE -> `String "IT_REGISTRANT_ENTITY_TYPE"
  | RU_PASSPORT_DATA -> `String "RU_PASSPORT_DATA"
  | SE_ID_NUMBER -> `String "SE_ID_NUMBER"
  | SG_ID_NUMBER -> `String "SG_ID_NUMBER"
  | VAT_NUMBER -> `String "VAT_NUMBER"
  | UK_CONTACT_TYPE -> `String "UK_CONTACT_TYPE"
  | UK_COMPANY_NUMBER -> `String "UK_COMPANY_NUMBER"
  | EU_COUNTRY_OF_CITIZENSHIP -> `String "EU_COUNTRY_OF_CITIZENSHIP"
  | AU_PRIORITY_TOKEN -> `String "AU_PRIORITY_TOKEN"
  | AU_ELIGIBILITY_TYPE -> `String "AU_ELIGIBILITY_TYPE"
  | AU_POLICY_REASON -> `String "AU_POLICY_REASON"
  | AU_REGISTRANT_NAME -> `String "AU_REGISTRANT_NAME"

let extra_param_to_yojson (x : extra_param) =
  assoc_to_yojson
    [
      ("Name", Some (extra_param_name_to_yojson x.name));
      ("Value", Some (extra_param_value_to_yojson x.value));
    ]

let extra_param_list_to_yojson tree = list_to_yojson extra_param_to_yojson tree
let contact_number_to_yojson = string_to_yojson
let email_to_yojson = string_to_yojson
let zip_code_to_yojson = string_to_yojson

let country_code_to_yojson (x : country_code) =
  match x with
  | AC -> `String "AC"
  | AD -> `String "AD"
  | AE -> `String "AE"
  | AF -> `String "AF"
  | AG -> `String "AG"
  | AI -> `String "AI"
  | AL -> `String "AL"
  | AM -> `String "AM"
  | AN -> `String "AN"
  | AO -> `String "AO"
  | AQ -> `String "AQ"
  | AR -> `String "AR"
  | AS -> `String "AS"
  | AT -> `String "AT"
  | AU -> `String "AU"
  | AW -> `String "AW"
  | AX -> `String "AX"
  | AZ -> `String "AZ"
  | BA -> `String "BA"
  | BB -> `String "BB"
  | BD -> `String "BD"
  | BE -> `String "BE"
  | BF -> `String "BF"
  | BG -> `String "BG"
  | BH -> `String "BH"
  | BI -> `String "BI"
  | BJ -> `String "BJ"
  | BL -> `String "BL"
  | BM -> `String "BM"
  | BN -> `String "BN"
  | BO -> `String "BO"
  | BQ -> `String "BQ"
  | BR -> `String "BR"
  | BS -> `String "BS"
  | BT -> `String "BT"
  | BV -> `String "BV"
  | BW -> `String "BW"
  | BY -> `String "BY"
  | BZ -> `String "BZ"
  | CA -> `String "CA"
  | CC -> `String "CC"
  | CD -> `String "CD"
  | CF -> `String "CF"
  | CG -> `String "CG"
  | CH -> `String "CH"
  | CI -> `String "CI"
  | CK -> `String "CK"
  | CL -> `String "CL"
  | CM -> `String "CM"
  | CN -> `String "CN"
  | CO -> `String "CO"
  | CR -> `String "CR"
  | CU -> `String "CU"
  | CV -> `String "CV"
  | CW -> `String "CW"
  | CX -> `String "CX"
  | CY -> `String "CY"
  | CZ -> `String "CZ"
  | DE -> `String "DE"
  | DJ -> `String "DJ"
  | DK -> `String "DK"
  | DM -> `String "DM"
  | DO -> `String "DO"
  | DZ -> `String "DZ"
  | EC -> `String "EC"
  | EE -> `String "EE"
  | EG -> `String "EG"
  | EH -> `String "EH"
  | ER -> `String "ER"
  | ES -> `String "ES"
  | ET -> `String "ET"
  | FI -> `String "FI"
  | FJ -> `String "FJ"
  | FK -> `String "FK"
  | FM -> `String "FM"
  | FO -> `String "FO"
  | FR -> `String "FR"
  | GA -> `String "GA"
  | GB -> `String "GB"
  | GD -> `String "GD"
  | GE -> `String "GE"
  | GF -> `String "GF"
  | GG -> `String "GG"
  | GH -> `String "GH"
  | GI -> `String "GI"
  | GL -> `String "GL"
  | GM -> `String "GM"
  | GN -> `String "GN"
  | GP -> `String "GP"
  | GQ -> `String "GQ"
  | GR -> `String "GR"
  | GS -> `String "GS"
  | GT -> `String "GT"
  | GU -> `String "GU"
  | GW -> `String "GW"
  | GY -> `String "GY"
  | HK -> `String "HK"
  | HM -> `String "HM"
  | HN -> `String "HN"
  | HR -> `String "HR"
  | HT -> `String "HT"
  | HU -> `String "HU"
  | ID -> `String "ID"
  | IE -> `String "IE"
  | IL -> `String "IL"
  | IM -> `String "IM"
  | IN -> `String "IN"
  | IO -> `String "IO"
  | IQ -> `String "IQ"
  | IR -> `String "IR"
  | IS -> `String "IS"
  | IT -> `String "IT"
  | JE -> `String "JE"
  | JM -> `String "JM"
  | JO -> `String "JO"
  | JP -> `String "JP"
  | KE -> `String "KE"
  | KG -> `String "KG"
  | KH -> `String "KH"
  | KI -> `String "KI"
  | KM -> `String "KM"
  | KN -> `String "KN"
  | KP -> `String "KP"
  | KR -> `String "KR"
  | KW -> `String "KW"
  | KY -> `String "KY"
  | KZ -> `String "KZ"
  | LA -> `String "LA"
  | LB -> `String "LB"
  | LC -> `String "LC"
  | LI -> `String "LI"
  | LK -> `String "LK"
  | LR -> `String "LR"
  | LS -> `String "LS"
  | LT -> `String "LT"
  | LU -> `String "LU"
  | LV -> `String "LV"
  | LY -> `String "LY"
  | MA -> `String "MA"
  | MC -> `String "MC"
  | MD -> `String "MD"
  | ME -> `String "ME"
  | MF -> `String "MF"
  | MG -> `String "MG"
  | MH -> `String "MH"
  | MK -> `String "MK"
  | ML -> `String "ML"
  | MM -> `String "MM"
  | MN -> `String "MN"
  | MO -> `String "MO"
  | MP -> `String "MP"
  | MQ -> `String "MQ"
  | MR -> `String "MR"
  | MS -> `String "MS"
  | MT -> `String "MT"
  | MU -> `String "MU"
  | MV -> `String "MV"
  | MW -> `String "MW"
  | MX -> `String "MX"
  | MY -> `String "MY"
  | MZ -> `String "MZ"
  | NA -> `String "NA"
  | NC -> `String "NC"
  | NE -> `String "NE"
  | NF -> `String "NF"
  | NG -> `String "NG"
  | NI -> `String "NI"
  | NL -> `String "NL"
  | NO -> `String "NO"
  | NP -> `String "NP"
  | NR -> `String "NR"
  | NU -> `String "NU"
  | NZ -> `String "NZ"
  | OM -> `String "OM"
  | PA -> `String "PA"
  | PE -> `String "PE"
  | PF -> `String "PF"
  | PG -> `String "PG"
  | PH -> `String "PH"
  | PK -> `String "PK"
  | PL -> `String "PL"
  | PM -> `String "PM"
  | PN -> `String "PN"
  | PR -> `String "PR"
  | PS -> `String "PS"
  | PT -> `String "PT"
  | PW -> `String "PW"
  | PY -> `String "PY"
  | QA -> `String "QA"
  | RE -> `String "RE"
  | RO -> `String "RO"
  | RS -> `String "RS"
  | RU -> `String "RU"
  | RW -> `String "RW"
  | SA -> `String "SA"
  | SB -> `String "SB"
  | SC -> `String "SC"
  | SD -> `String "SD"
  | SE -> `String "SE"
  | SG -> `String "SG"
  | SH -> `String "SH"
  | SI -> `String "SI"
  | SJ -> `String "SJ"
  | SK -> `String "SK"
  | SL -> `String "SL"
  | SM -> `String "SM"
  | SN -> `String "SN"
  | SO -> `String "SO"
  | SR -> `String "SR"
  | SS -> `String "SS"
  | ST -> `String "ST"
  | SV -> `String "SV"
  | SX -> `String "SX"
  | SY -> `String "SY"
  | SZ -> `String "SZ"
  | TC -> `String "TC"
  | TD -> `String "TD"
  | TF -> `String "TF"
  | TG -> `String "TG"
  | TH -> `String "TH"
  | TJ -> `String "TJ"
  | TK -> `String "TK"
  | TL -> `String "TL"
  | TM -> `String "TM"
  | TN -> `String "TN"
  | TO -> `String "TO"
  | TP -> `String "TP"
  | TR -> `String "TR"
  | TT -> `String "TT"
  | TV -> `String "TV"
  | TW -> `String "TW"
  | TZ -> `String "TZ"
  | UA -> `String "UA"
  | UG -> `String "UG"
  | US -> `String "US"
  | UY -> `String "UY"
  | UZ -> `String "UZ"
  | VA -> `String "VA"
  | VC -> `String "VC"
  | VE -> `String "VE"
  | VG -> `String "VG"
  | VI -> `String "VI"
  | VN -> `String "VN"
  | VU -> `String "VU"
  | WF -> `String "WF"
  | WS -> `String "WS"
  | YE -> `String "YE"
  | YT -> `String "YT"
  | ZA -> `String "ZA"
  | ZM -> `String "ZM"
  | ZW -> `String "ZW"

let state_to_yojson = string_to_yojson
let contact_name_to_yojson = string_to_yojson

let contact_type_to_yojson (x : contact_type) =
  match x with
  | PERSON -> `String "PERSON"
  | COMPANY -> `String "COMPANY"
  | ASSOCIATION -> `String "ASSOCIATION"
  | PUBLIC_BODY -> `String "PUBLIC_BODY"
  | RESELLER -> `String "RESELLER"

let contact_detail_to_yojson (x : contact_detail) =
  assoc_to_yojson
    [
      ("FirstName", option_to_yojson contact_name_to_yojson x.first_name);
      ("LastName", option_to_yojson contact_name_to_yojson x.last_name);
      ("ContactType", option_to_yojson contact_type_to_yojson x.contact_type);
      ("OrganizationName", option_to_yojson contact_name_to_yojson x.organization_name);
      ("AddressLine1", option_to_yojson address_line_to_yojson x.address_line1);
      ("AddressLine2", option_to_yojson address_line_to_yojson x.address_line2);
      ("City", option_to_yojson city_to_yojson x.city);
      ("State", option_to_yojson state_to_yojson x.state);
      ("CountryCode", option_to_yojson country_code_to_yojson x.country_code);
      ("ZipCode", option_to_yojson zip_code_to_yojson x.zip_code);
      ("PhoneNumber", option_to_yojson contact_number_to_yojson x.phone_number);
      ("Email", option_to_yojson email_to_yojson x.email);
      ("Fax", option_to_yojson contact_number_to_yojson x.fax);
      ("ExtraParams", option_to_yojson extra_param_list_to_yojson x.extra_params);
    ]

let current_expiry_year_to_yojson = int_to_yojson
let dns_sec_to_yojson = string_to_yojson

let delete_domain_response_to_yojson (x : delete_domain_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let delete_domain_request_to_yojson (x : delete_domain_request) =
  assoc_to_yojson [ ("DomainName", Some (domain_name_to_yojson x.domain_name)) ]

let delete_tags_for_domain_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let delete_tags_for_domain_request_to_yojson (x : delete_tags_for_domain_request) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("TagsToDelete", Some (tag_key_list_to_yojson x.tags_to_delete));
    ]

let disable_domain_auto_renew_response_to_yojson = unit_to_yojson

let disable_domain_auto_renew_request_to_yojson (x : disable_domain_auto_renew_request) =
  assoc_to_yojson [ ("DomainName", Some (domain_name_to_yojson x.domain_name)) ]

let disable_domain_transfer_lock_response_to_yojson (x : disable_domain_transfer_lock_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let disable_domain_transfer_lock_request_to_yojson (x : disable_domain_transfer_lock_request) =
  assoc_to_yojson [ ("DomainName", Some (domain_name_to_yojson x.domain_name)) ]

let disassociate_delegation_signer_from_domain_response_to_yojson
    (x : disassociate_delegation_signer_from_domain_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let string__to_yojson = string_to_yojson

let disassociate_delegation_signer_from_domain_request_to_yojson
    (x : disassociate_delegation_signer_from_domain_request) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("Id", Some (string__to_yojson x.id));
    ]

let dnssec_key_to_yojson (x : dnssec_key) =
  assoc_to_yojson
    [
      ("Algorithm", option_to_yojson nullable_integer_to_yojson x.algorithm);
      ("Flags", option_to_yojson nullable_integer_to_yojson x.flags);
      ("PublicKey", option_to_yojson dnssec_public_key_to_yojson x.public_key);
      ("DigestType", option_to_yojson nullable_integer_to_yojson x.digest_type);
      ("Digest", option_to_yojson string__to_yojson x.digest);
      ("KeyTag", option_to_yojson nullable_integer_to_yojson x.key_tag);
      ("Id", option_to_yojson string__to_yojson x.id);
    ]

let dnssec_key_list_to_yojson tree = list_to_yojson dnssec_key_to_yojson tree

let price_with_currency_to_yojson (x : price_with_currency) =
  assoc_to_yojson
    [
      ("Price", Some (price_to_yojson x.price)); ("Currency", Some (currency_to_yojson x.currency));
    ]

let domain_price_name_to_yojson = string_to_yojson

let domain_price_to_yojson (x : domain_price) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson domain_price_name_to_yojson x.name);
      ("RegistrationPrice", option_to_yojson price_with_currency_to_yojson x.registration_price);
      ("TransferPrice", option_to_yojson price_with_currency_to_yojson x.transfer_price);
      ("RenewalPrice", option_to_yojson price_with_currency_to_yojson x.renewal_price);
      ( "ChangeOwnershipPrice",
        option_to_yojson price_with_currency_to_yojson x.change_ownership_price );
      ("RestorationPrice", option_to_yojson price_with_currency_to_yojson x.restoration_price);
    ]

let domain_price_list_to_yojson tree = list_to_yojson domain_price_to_yojson tree
let domain_status_to_yojson = string_to_yojson
let domain_status_list_to_yojson tree = list_to_yojson domain_status_to_yojson tree

let domain_suggestion_to_yojson (x : domain_suggestion) =
  assoc_to_yojson
    [
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("Availability", option_to_yojson string__to_yojson x.availability);
    ]

let domain_suggestions_list_to_yojson tree = list_to_yojson domain_suggestion_to_yojson tree

let domain_summary_to_yojson (x : domain_summary) =
  assoc_to_yojson
    [
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("AutoRenew", option_to_yojson boolean__to_yojson x.auto_renew);
      ("TransferLock", option_to_yojson boolean__to_yojson x.transfer_lock);
      ("Expiry", option_to_yojson timestamp_to_yojson x.expiry);
    ]

let domain_summary_list_to_yojson tree = list_to_yojson domain_summary_to_yojson tree
let duration_in_years_to_yojson = int_to_yojson
let enable_domain_auto_renew_response_to_yojson = unit_to_yojson

let enable_domain_auto_renew_request_to_yojson (x : enable_domain_auto_renew_request) =
  assoc_to_yojson [ ("DomainName", Some (domain_name_to_yojson x.domain_name)) ]

let enable_domain_transfer_lock_response_to_yojson (x : enable_domain_transfer_lock_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let enable_domain_transfer_lock_request_to_yojson (x : enable_domain_transfer_lock_request) =
  assoc_to_yojson [ ("DomainName", Some (domain_name_to_yojson x.domain_name)) ]

let fi_auth_key_to_yojson = string_to_yojson
let value_to_yojson = string_to_yojson
let values_to_yojson tree = list_to_yojson value_to_yojson tree

let operator_to_yojson (x : operator) =
  match x with LE -> `String "LE" | GE -> `String "GE" | BEGINS_WITH -> `String "BEGINS_WITH"

let list_domains_attribute_name_to_yojson (x : list_domains_attribute_name) =
  match x with DomainName -> `String "DomainName" | Expiry -> `String "Expiry"

let filter_condition_to_yojson (x : filter_condition) =
  assoc_to_yojson
    [
      ("Name", Some (list_domains_attribute_name_to_yojson x.name));
      ("Operator", Some (operator_to_yojson x.operator));
      ("Values", Some (values_to_yojson x.values));
    ]

let filter_conditions_to_yojson tree = list_to_yojson filter_condition_to_yojson tree

let reachability_status_to_yojson (x : reachability_status) =
  match x with
  | PENDING -> `String "PENDING"
  | DONE -> `String "DONE"
  | EXPIRED -> `String "EXPIRED"

let get_contact_reachability_status_response_to_yojson
    (x : get_contact_reachability_status_response) =
  assoc_to_yojson
    [
      ("domainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("status", option_to_yojson reachability_status_to_yojson x.status);
    ]

let get_contact_reachability_status_request_to_yojson (x : get_contact_reachability_status_request)
    =
  assoc_to_yojson [ ("domainName", option_to_yojson domain_name_to_yojson x.domain_name) ]

let reseller_to_yojson = string_to_yojson
let registry_domain_id_to_yojson = string_to_yojson
let registrar_url_to_yojson = string_to_yojson
let registrar_who_is_server_to_yojson = string_to_yojson
let registrar_name_to_yojson = string_to_yojson
let glue_ip_to_yojson = string_to_yojson
let glue_ip_list_to_yojson tree = list_to_yojson glue_ip_to_yojson tree
let host_name_to_yojson = string_to_yojson

let nameserver_to_yojson (x : nameserver) =
  assoc_to_yojson
    [
      ("Name", Some (host_name_to_yojson x.name));
      ("GlueIps", option_to_yojson glue_ip_list_to_yojson x.glue_ips);
    ]

let nameserver_list_to_yojson tree = list_to_yojson nameserver_to_yojson tree

let get_domain_detail_response_to_yojson (x : get_domain_detail_response) =
  assoc_to_yojson
    [
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("Nameservers", option_to_yojson nameserver_list_to_yojson x.nameservers);
      ("AutoRenew", option_to_yojson boolean__to_yojson x.auto_renew);
      ("AdminContact", option_to_yojson contact_detail_to_yojson x.admin_contact);
      ("RegistrantContact", option_to_yojson contact_detail_to_yojson x.registrant_contact);
      ("TechContact", option_to_yojson contact_detail_to_yojson x.tech_contact);
      ("AdminPrivacy", option_to_yojson boolean__to_yojson x.admin_privacy);
      ("RegistrantPrivacy", option_to_yojson boolean__to_yojson x.registrant_privacy);
      ("TechPrivacy", option_to_yojson boolean__to_yojson x.tech_privacy);
      ("RegistrarName", option_to_yojson registrar_name_to_yojson x.registrar_name);
      ("WhoIsServer", option_to_yojson registrar_who_is_server_to_yojson x.who_is_server);
      ("RegistrarUrl", option_to_yojson registrar_url_to_yojson x.registrar_url);
      ("AbuseContactEmail", option_to_yojson email_to_yojson x.abuse_contact_email);
      ("AbuseContactPhone", option_to_yojson contact_number_to_yojson x.abuse_contact_phone);
      ("RegistryDomainId", option_to_yojson registry_domain_id_to_yojson x.registry_domain_id);
      ("CreationDate", option_to_yojson timestamp_to_yojson x.creation_date);
      ("UpdatedDate", option_to_yojson timestamp_to_yojson x.updated_date);
      ("ExpirationDate", option_to_yojson timestamp_to_yojson x.expiration_date);
      ("Reseller", option_to_yojson reseller_to_yojson x.reseller);
      ("DnsSec", option_to_yojson dns_sec_to_yojson x.dns_sec);
      ("StatusList", option_to_yojson domain_status_list_to_yojson x.status_list);
      ("DnssecKeys", option_to_yojson dnssec_key_list_to_yojson x.dnssec_keys);
      ("BillingContact", option_to_yojson contact_detail_to_yojson x.billing_contact);
      ("BillingPrivacy", option_to_yojson boolean__to_yojson x.billing_privacy);
    ]

let get_domain_detail_request_to_yojson (x : get_domain_detail_request) =
  assoc_to_yojson [ ("DomainName", Some (domain_name_to_yojson x.domain_name)) ]

let get_domain_suggestions_response_to_yojson (x : get_domain_suggestions_response) =
  assoc_to_yojson
    [ ("SuggestionsList", option_to_yojson domain_suggestions_list_to_yojson x.suggestions_list) ]

let integer_to_yojson = int_to_yojson

let get_domain_suggestions_request_to_yojson (x : get_domain_suggestions_request) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("SuggestionCount", Some (integer_to_yojson x.suggestion_count));
      ("OnlyAvailable", Some (boolean__to_yojson x.only_available));
    ]

let status_flag_to_yojson (x : status_flag) =
  match x with
  | PENDING_ACCEPTANCE -> `String "PENDING_ACCEPTANCE"
  | PENDING_CUSTOMER_ACTION -> `String "PENDING_CUSTOMER_ACTION"
  | PENDING_AUTHORIZATION -> `String "PENDING_AUTHORIZATION"
  | PENDING_PAYMENT_VERIFICATION -> `String "PENDING_PAYMENT_VERIFICATION"
  | PENDING_SUPPORT_CASE -> `String "PENDING_SUPPORT_CASE"

let operation_status_to_yojson (x : operation_status) =
  match x with
  | SUBMITTED -> `String "SUBMITTED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | ERROR -> `String "ERROR"
  | SUCCESSFUL -> `String "SUCCESSFUL"
  | FAILED -> `String "FAILED"

let get_operation_detail_response_to_yojson (x : get_operation_detail_response) =
  assoc_to_yojson
    [
      ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id);
      ("Status", option_to_yojson operation_status_to_yojson x.status);
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("Type", option_to_yojson operation_type_to_yojson x.type_);
      ("SubmittedDate", option_to_yojson timestamp_to_yojson x.submitted_date);
      ("LastUpdatedDate", option_to_yojson timestamp_to_yojson x.last_updated_date);
      ("StatusFlag", option_to_yojson status_flag_to_yojson x.status_flag);
    ]

let get_operation_detail_request_to_yojson (x : get_operation_detail_request) =
  assoc_to_yojson [ ("OperationId", Some (operation_id_to_yojson x.operation_id)) ]

let label_to_yojson = string_to_yojson
let page_marker_to_yojson = string_to_yojson

let list_domains_response_to_yojson (x : list_domains_response) =
  assoc_to_yojson
    [
      ("Domains", option_to_yojson domain_summary_list_to_yojson x.domains);
      ("NextPageMarker", option_to_yojson page_marker_to_yojson x.next_page_marker);
    ]

let page_max_items_to_yojson = int_to_yojson

let sort_order_to_yojson (x : sort_order) =
  match x with ASC -> `String "ASC" | DESC -> `String "DESC"

let sort_condition_to_yojson (x : sort_condition) =
  assoc_to_yojson
    [
      ("Name", Some (list_domains_attribute_name_to_yojson x.name));
      ("SortOrder", Some (sort_order_to_yojson x.sort_order));
    ]

let list_domains_request_to_yojson (x : list_domains_request) =
  assoc_to_yojson
    [
      ("FilterConditions", option_to_yojson filter_conditions_to_yojson x.filter_conditions);
      ("SortCondition", option_to_yojson sort_condition_to_yojson x.sort_condition);
      ("Marker", option_to_yojson page_marker_to_yojson x.marker);
      ("MaxItems", option_to_yojson page_max_items_to_yojson x.max_items);
    ]

let operation_summary_to_yojson (x : operation_summary) =
  assoc_to_yojson
    [
      ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id);
      ("Status", option_to_yojson operation_status_to_yojson x.status);
      ("Type", option_to_yojson operation_type_to_yojson x.type_);
      ("SubmittedDate", option_to_yojson timestamp_to_yojson x.submitted_date);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("StatusFlag", option_to_yojson status_flag_to_yojson x.status_flag);
      ("LastUpdatedDate", option_to_yojson timestamp_to_yojson x.last_updated_date);
    ]

let operation_summary_list_to_yojson tree = list_to_yojson operation_summary_to_yojson tree

let list_operations_response_to_yojson (x : list_operations_response) =
  assoc_to_yojson
    [
      ("Operations", option_to_yojson operation_summary_list_to_yojson x.operations);
      ("NextPageMarker", option_to_yojson page_marker_to_yojson x.next_page_marker);
    ]

let list_operations_sort_attribute_name_to_yojson (x : list_operations_sort_attribute_name) =
  match x with SubmittedDate -> `String "SubmittedDate"

let operation_type_list_to_yojson tree = list_to_yojson operation_type_to_yojson tree
let operation_status_list_to_yojson tree = list_to_yojson operation_status_to_yojson tree

let list_operations_request_to_yojson (x : list_operations_request) =
  assoc_to_yojson
    [
      ("SubmittedSince", option_to_yojson timestamp_to_yojson x.submitted_since);
      ("Marker", option_to_yojson page_marker_to_yojson x.marker);
      ("MaxItems", option_to_yojson page_max_items_to_yojson x.max_items);
      ("Status", option_to_yojson operation_status_list_to_yojson x.status);
      ("Type", option_to_yojson operation_type_list_to_yojson x.type_);
      ("SortBy", option_to_yojson list_operations_sort_attribute_name_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let list_prices_response_to_yojson (x : list_prices_response) =
  assoc_to_yojson
    [
      ("Prices", option_to_yojson domain_price_list_to_yojson x.prices);
      ("NextPageMarker", option_to_yojson page_marker_to_yojson x.next_page_marker);
    ]

let list_prices_page_max_items_to_yojson = int_to_yojson

let list_prices_request_to_yojson (x : list_prices_request) =
  assoc_to_yojson
    [
      ("Tld", option_to_yojson tld_name_to_yojson x.tld);
      ("Marker", option_to_yojson page_marker_to_yojson x.marker);
      ("MaxItems", option_to_yojson list_prices_page_max_items_to_yojson x.max_items);
    ]

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson tag_key_to_yojson x.key);
      ("Value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let list_tags_for_domain_response_to_yojson (x : list_tags_for_domain_response) =
  assoc_to_yojson [ ("TagList", option_to_yojson tag_list_to_yojson x.tag_list) ]

let list_tags_for_domain_request_to_yojson (x : list_tags_for_domain_request) =
  assoc_to_yojson [ ("DomainName", Some (domain_name_to_yojson x.domain_name)) ]

let push_domain_request_to_yojson (x : push_domain_request) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("Target", Some (label_to_yojson x.target));
    ]

let register_domain_response_to_yojson (x : register_domain_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let register_domain_request_to_yojson (x : register_domain_request) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("IdnLangCode", option_to_yojson lang_code_to_yojson x.idn_lang_code);
      ("DurationInYears", Some (duration_in_years_to_yojson x.duration_in_years));
      ("AutoRenew", option_to_yojson boolean__to_yojson x.auto_renew);
      ("AdminContact", Some (contact_detail_to_yojson x.admin_contact));
      ("RegistrantContact", Some (contact_detail_to_yojson x.registrant_contact));
      ("TechContact", Some (contact_detail_to_yojson x.tech_contact));
      ( "PrivacyProtectAdminContact",
        option_to_yojson boolean__to_yojson x.privacy_protect_admin_contact );
      ( "PrivacyProtectRegistrantContact",
        option_to_yojson boolean__to_yojson x.privacy_protect_registrant_contact );
      ( "PrivacyProtectTechContact",
        option_to_yojson boolean__to_yojson x.privacy_protect_tech_contact );
      ("BillingContact", option_to_yojson contact_detail_to_yojson x.billing_contact);
      ( "PrivacyProtectBillingContact",
        option_to_yojson boolean__to_yojson x.privacy_protect_billing_contact );
    ]

let reject_domain_transfer_from_another_aws_account_response_to_yojson
    (x : reject_domain_transfer_from_another_aws_account_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let reject_domain_transfer_from_another_aws_account_request_to_yojson
    (x : reject_domain_transfer_from_another_aws_account_request) =
  assoc_to_yojson [ ("DomainName", Some (domain_name_to_yojson x.domain_name)) ]

let renew_domain_response_to_yojson (x : renew_domain_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let renew_domain_request_to_yojson (x : renew_domain_request) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("DurationInYears", option_to_yojson duration_in_years_to_yojson x.duration_in_years);
      ("CurrentExpiryYear", Some (current_expiry_year_to_yojson x.current_expiry_year));
    ]

let resend_contact_reachability_email_response_to_yojson
    (x : resend_contact_reachability_email_response) =
  assoc_to_yojson
    [
      ("domainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("emailAddress", option_to_yojson email_to_yojson x.email_address);
      ("isAlreadyVerified", option_to_yojson boolean__to_yojson x.is_already_verified);
    ]

let resend_contact_reachability_email_request_to_yojson
    (x : resend_contact_reachability_email_request) =
  assoc_to_yojson [ ("domainName", option_to_yojson domain_name_to_yojson x.domain_name) ]

let resend_operation_authorization_request_to_yojson (x : resend_operation_authorization_request) =
  assoc_to_yojson [ ("OperationId", Some (operation_id_to_yojson x.operation_id)) ]

let retrieve_domain_auth_code_response_to_yojson (x : retrieve_domain_auth_code_response) =
  assoc_to_yojson [ ("AuthCode", option_to_yojson domain_auth_code_to_yojson x.auth_code) ]

let retrieve_domain_auth_code_request_to_yojson (x : retrieve_domain_auth_code_request) =
  assoc_to_yojson [ ("DomainName", Some (domain_name_to_yojson x.domain_name)) ]

let view_billing_response_to_yojson (x : view_billing_response) =
  assoc_to_yojson
    [
      ("NextPageMarker", option_to_yojson page_marker_to_yojson x.next_page_marker);
      ("BillingRecords", option_to_yojson billing_records_to_yojson x.billing_records);
    ]

let view_billing_request_to_yojson (x : view_billing_request) =
  assoc_to_yojson
    [
      ("Start", option_to_yojson timestamp_to_yojson x.start);
      ("End", option_to_yojson timestamp_to_yojson x.end_);
      ("Marker", option_to_yojson page_marker_to_yojson x.marker);
      ("MaxItems", option_to_yojson page_max_items_to_yojson x.max_items);
    ]

let update_tags_for_domain_response_to_yojson = unit_to_yojson

let update_tags_for_domain_request_to_yojson (x : update_tags_for_domain_request) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("TagsToUpdate", option_to_yojson tag_list_to_yojson x.tags_to_update);
    ]

let update_domain_nameservers_response_to_yojson (x : update_domain_nameservers_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let update_domain_nameservers_request_to_yojson (x : update_domain_nameservers_request) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("FIAuthKey", option_to_yojson fi_auth_key_to_yojson x.fi_auth_key);
      ("Nameservers", Some (nameserver_list_to_yojson x.nameservers));
    ]

let update_domain_contact_privacy_response_to_yojson (x : update_domain_contact_privacy_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let update_domain_contact_privacy_request_to_yojson (x : update_domain_contact_privacy_request) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("AdminPrivacy", option_to_yojson boolean__to_yojson x.admin_privacy);
      ("RegistrantPrivacy", option_to_yojson boolean__to_yojson x.registrant_privacy);
      ("TechPrivacy", option_to_yojson boolean__to_yojson x.tech_privacy);
      ("BillingPrivacy", option_to_yojson boolean__to_yojson x.billing_privacy);
    ]

let update_domain_contact_response_to_yojson (x : update_domain_contact_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let update_domain_contact_request_to_yojson (x : update_domain_contact_request) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("AdminContact", option_to_yojson contact_detail_to_yojson x.admin_contact);
      ("RegistrantContact", option_to_yojson contact_detail_to_yojson x.registrant_contact);
      ("TechContact", option_to_yojson contact_detail_to_yojson x.tech_contact);
      ("Consent", option_to_yojson consent_to_yojson x.consent);
      ("BillingContact", option_to_yojson contact_detail_to_yojson x.billing_contact);
    ]

let transfer_domain_to_another_aws_account_response_to_yojson
    (x : transfer_domain_to_another_aws_account_response) =
  assoc_to_yojson
    [
      ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id);
      ("Password", option_to_yojson password_to_yojson x.password);
    ]

let transfer_domain_to_another_aws_account_request_to_yojson
    (x : transfer_domain_to_another_aws_account_request) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let transfer_domain_response_to_yojson (x : transfer_domain_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let transfer_domain_request_to_yojson (x : transfer_domain_request) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("IdnLangCode", option_to_yojson lang_code_to_yojson x.idn_lang_code);
      ("DurationInYears", option_to_yojson duration_in_years_to_yojson x.duration_in_years);
      ("Nameservers", option_to_yojson nameserver_list_to_yojson x.nameservers);
      ("AuthCode", option_to_yojson domain_auth_code_to_yojson x.auth_code);
      ("AutoRenew", option_to_yojson boolean__to_yojson x.auto_renew);
      ("AdminContact", Some (contact_detail_to_yojson x.admin_contact));
      ("RegistrantContact", Some (contact_detail_to_yojson x.registrant_contact));
      ("TechContact", Some (contact_detail_to_yojson x.tech_contact));
      ( "PrivacyProtectAdminContact",
        option_to_yojson boolean__to_yojson x.privacy_protect_admin_contact );
      ( "PrivacyProtectRegistrantContact",
        option_to_yojson boolean__to_yojson x.privacy_protect_registrant_contact );
      ( "PrivacyProtectTechContact",
        option_to_yojson boolean__to_yojson x.privacy_protect_tech_contact );
      ("BillingContact", option_to_yojson contact_detail_to_yojson x.billing_contact);
      ( "PrivacyProtectBillingContact",
        option_to_yojson boolean__to_yojson x.privacy_protect_billing_contact );
    ]
