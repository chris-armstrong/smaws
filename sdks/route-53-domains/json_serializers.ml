open Smaws_Lib.Json.SerializeHelpers
open Types

let zip_code_to_yojson = string_to_yojson
let page_marker_to_yojson = string_to_yojson
let domain_name_to_yojson = string_to_yojson

let operation_type_to_yojson (x : operation_type) =
  match x with
  | RESTORE_DOMAIN -> `String "RESTORE_DOMAIN"
  | TRANSFER_ON_RENEW -> `String "TRANSFER_ON_RENEW"
  | RELEASE_TO_GANDI -> `String "RELEASE_TO_GANDI"
  | INTERNAL_TRANSFER_IN_DOMAIN -> `String "INTERNAL_TRANSFER_IN_DOMAIN"
  | INTERNAL_TRANSFER_OUT_DOMAIN -> `String "INTERNAL_TRANSFER_OUT_DOMAIN"
  | PUSH_DOMAIN -> `String "PUSH_DOMAIN"
  | RENEW_DOMAIN -> `String "RENEW_DOMAIN"
  | CHANGE_DOMAIN_OWNER -> `String "CHANGE_DOMAIN_OWNER"
  | TRANSFER_OUT_DOMAIN -> `String "TRANSFER_OUT_DOMAIN"
  | EXPIRE_DOMAIN -> `String "EXPIRE_DOMAIN"
  | REMOVE_DNSSEC -> `String "REMOVE_DNSSEC"
  | ADD_DNSSEC -> `String "ADD_DNSSEC"
  | DISABLE_AUTORENEW -> `String "DISABLE_AUTORENEW"
  | ENABLE_AUTORENEW -> `String "ENABLE_AUTORENEW"
  | DOMAIN_LOCK -> `String "DOMAIN_LOCK"
  | CHANGE_PRIVACY_PROTECTION -> `String "CHANGE_PRIVACY_PROTECTION"
  | UPDATE_NAMESERVER -> `String "UPDATE_NAMESERVER"
  | UPDATE_DOMAIN_CONTACT -> `String "UPDATE_DOMAIN_CONTACT"
  | TRANSFER_IN_DOMAIN -> `String "TRANSFER_IN_DOMAIN"
  | DELETE_DOMAIN -> `String "DELETE_DOMAIN"
  | REGISTER_DOMAIN -> `String "REGISTER_DOMAIN"

let invoice_id_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let price_to_yojson = double_to_yojson

let billing_record_to_yojson (x : billing_record) =
  assoc_to_yojson
    [
      ("Price", option_to_yojson price_to_yojson x.price);
      ("BillDate", option_to_yojson timestamp_to_yojson x.bill_date);
      ("InvoiceId", option_to_yojson invoice_id_to_yojson x.invoice_id);
      ("Operation", option_to_yojson operation_type_to_yojson x.operation);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
    ]

let billing_records_to_yojson tree = list_to_yojson billing_record_to_yojson tree

let view_billing_response_to_yojson (x : view_billing_response) =
  assoc_to_yojson
    [
      ("BillingRecords", option_to_yojson billing_records_to_yojson x.billing_records);
      ("NextPageMarker", option_to_yojson page_marker_to_yojson x.next_page_marker);
    ]

let page_max_items_to_yojson = int_to_yojson

let view_billing_request_to_yojson (x : view_billing_request) =
  assoc_to_yojson
    [
      ("MaxItems", option_to_yojson page_max_items_to_yojson x.max_items);
      ("Marker", option_to_yojson page_marker_to_yojson x.marker);
      ("End", option_to_yojson timestamp_to_yojson x.end_);
      ("Start", option_to_yojson timestamp_to_yojson x.start);
    ]

let error_message_to_yojson = string_to_yojson

let invalid_input_to_yojson (x : invalid_input) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let value_to_yojson = string_to_yojson
let values_to_yojson tree = list_to_yojson value_to_yojson tree
let update_tags_for_domain_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson tag_value_to_yojson x.value);
      ("Key", option_to_yojson tag_key_to_yojson x.key);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let update_tags_for_domain_request_to_yojson (x : update_tags_for_domain_request) =
  assoc_to_yojson
    [
      ("TagsToUpdate", option_to_yojson tag_list_to_yojson x.tags_to_update);
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]

let unsupported_tl_d_to_yojson (x : unsupported_tl_d) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let operation_limit_exceeded_to_yojson (x : operation_limit_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let operation_id_to_yojson = string_to_yojson

let update_domain_nameservers_response_to_yojson (x : update_domain_nameservers_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let fi_auth_key_to_yojson = string_to_yojson
let host_name_to_yojson = string_to_yojson
let glue_ip_to_yojson = string_to_yojson
let glue_ip_list_to_yojson tree = list_to_yojson glue_ip_to_yojson tree

let nameserver_to_yojson (x : nameserver) =
  assoc_to_yojson
    [
      ("GlueIps", option_to_yojson glue_ip_list_to_yojson x.glue_ips);
      ("Name", Some (host_name_to_yojson x.name));
    ]

let nameserver_list_to_yojson tree = list_to_yojson nameserver_to_yojson tree

let update_domain_nameservers_request_to_yojson (x : update_domain_nameservers_request) =
  assoc_to_yojson
    [
      ("Nameservers", Some (nameserver_list_to_yojson x.nameservers));
      ("FIAuthKey", option_to_yojson fi_auth_key_to_yojson x.fi_auth_key);
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]

let tld_rules_violation_to_yojson (x : tld_rules_violation) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let request_id_to_yojson = string_to_yojson

let duplicate_request_to_yojson (x : duplicate_request) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("requestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let update_domain_contact_response_to_yojson (x : update_domain_contact_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let contact_name_to_yojson = string_to_yojson

let contact_type_to_yojson (x : contact_type) =
  match x with
  | RESELLER -> `String "RESELLER"
  | PUBLIC_BODY -> `String "PUBLIC_BODY"
  | ASSOCIATION -> `String "ASSOCIATION"
  | COMPANY -> `String "COMPANY"
  | PERSON -> `String "PERSON"

let address_line_to_yojson = string_to_yojson
let city_to_yojson = string_to_yojson
let state_to_yojson = string_to_yojson

let country_code_to_yojson (x : country_code) =
  match x with
  | ZW -> `String "ZW"
  | ZM -> `String "ZM"
  | ZA -> `String "ZA"
  | YT -> `String "YT"
  | YE -> `String "YE"
  | WS -> `String "WS"
  | WF -> `String "WF"
  | VU -> `String "VU"
  | VN -> `String "VN"
  | VI -> `String "VI"
  | VG -> `String "VG"
  | VE -> `String "VE"
  | VC -> `String "VC"
  | VA -> `String "VA"
  | UZ -> `String "UZ"
  | UY -> `String "UY"
  | US -> `String "US"
  | UG -> `String "UG"
  | UA -> `String "UA"
  | TZ -> `String "TZ"
  | TW -> `String "TW"
  | TV -> `String "TV"
  | TT -> `String "TT"
  | TR -> `String "TR"
  | TP -> `String "TP"
  | TO -> `String "TO"
  | TN -> `String "TN"
  | TM -> `String "TM"
  | TL -> `String "TL"
  | TK -> `String "TK"
  | TJ -> `String "TJ"
  | TH -> `String "TH"
  | TG -> `String "TG"
  | TF -> `String "TF"
  | TD -> `String "TD"
  | TC -> `String "TC"
  | SZ -> `String "SZ"
  | SY -> `String "SY"
  | SX -> `String "SX"
  | SV -> `String "SV"
  | ST -> `String "ST"
  | SS -> `String "SS"
  | SR -> `String "SR"
  | SO -> `String "SO"
  | SN -> `String "SN"
  | SM -> `String "SM"
  | SL -> `String "SL"
  | SK -> `String "SK"
  | SJ -> `String "SJ"
  | SI -> `String "SI"
  | SH -> `String "SH"
  | SG -> `String "SG"
  | SE -> `String "SE"
  | SD -> `String "SD"
  | SC -> `String "SC"
  | SB -> `String "SB"
  | SA -> `String "SA"
  | RW -> `String "RW"
  | RU -> `String "RU"
  | RS -> `String "RS"
  | RO -> `String "RO"
  | RE -> `String "RE"
  | QA -> `String "QA"
  | PY -> `String "PY"
  | PW -> `String "PW"
  | PT -> `String "PT"
  | PS -> `String "PS"
  | PR -> `String "PR"
  | PN -> `String "PN"
  | PM -> `String "PM"
  | PL -> `String "PL"
  | PK -> `String "PK"
  | PH -> `String "PH"
  | PG -> `String "PG"
  | PF -> `String "PF"
  | PE -> `String "PE"
  | PA -> `String "PA"
  | OM -> `String "OM"
  | NZ -> `String "NZ"
  | NU -> `String "NU"
  | NR -> `String "NR"
  | NP -> `String "NP"
  | NO -> `String "NO"
  | NL -> `String "NL"
  | NI -> `String "NI"
  | NG -> `String "NG"
  | NF -> `String "NF"
  | NE -> `String "NE"
  | NC -> `String "NC"
  | NA -> `String "NA"
  | MZ -> `String "MZ"
  | MY -> `String "MY"
  | MX -> `String "MX"
  | MW -> `String "MW"
  | MV -> `String "MV"
  | MU -> `String "MU"
  | MT -> `String "MT"
  | MS -> `String "MS"
  | MR -> `String "MR"
  | MQ -> `String "MQ"
  | MP -> `String "MP"
  | MO -> `String "MO"
  | MN -> `String "MN"
  | MM -> `String "MM"
  | ML -> `String "ML"
  | MK -> `String "MK"
  | MH -> `String "MH"
  | MG -> `String "MG"
  | MF -> `String "MF"
  | ME -> `String "ME"
  | MD -> `String "MD"
  | MC -> `String "MC"
  | MA -> `String "MA"
  | LY -> `String "LY"
  | LV -> `String "LV"
  | LU -> `String "LU"
  | LT -> `String "LT"
  | LS -> `String "LS"
  | LR -> `String "LR"
  | LK -> `String "LK"
  | LI -> `String "LI"
  | LC -> `String "LC"
  | LB -> `String "LB"
  | LA -> `String "LA"
  | KZ -> `String "KZ"
  | KY -> `String "KY"
  | KW -> `String "KW"
  | KR -> `String "KR"
  | KP -> `String "KP"
  | KN -> `String "KN"
  | KM -> `String "KM"
  | KI -> `String "KI"
  | KH -> `String "KH"
  | KG -> `String "KG"
  | KE -> `String "KE"
  | JP -> `String "JP"
  | JO -> `String "JO"
  | JM -> `String "JM"
  | JE -> `String "JE"
  | IT -> `String "IT"
  | IS -> `String "IS"
  | IR -> `String "IR"
  | IQ -> `String "IQ"
  | IO -> `String "IO"
  | IN -> `String "IN"
  | IM -> `String "IM"
  | IL -> `String "IL"
  | IE -> `String "IE"
  | ID -> `String "ID"
  | HU -> `String "HU"
  | HT -> `String "HT"
  | HR -> `String "HR"
  | HN -> `String "HN"
  | HM -> `String "HM"
  | HK -> `String "HK"
  | GY -> `String "GY"
  | GW -> `String "GW"
  | GU -> `String "GU"
  | GT -> `String "GT"
  | GS -> `String "GS"
  | GR -> `String "GR"
  | GQ -> `String "GQ"
  | GP -> `String "GP"
  | GN -> `String "GN"
  | GM -> `String "GM"
  | GL -> `String "GL"
  | GI -> `String "GI"
  | GH -> `String "GH"
  | GG -> `String "GG"
  | GF -> `String "GF"
  | GE -> `String "GE"
  | GD -> `String "GD"
  | GB -> `String "GB"
  | GA -> `String "GA"
  | FR -> `String "FR"
  | FO -> `String "FO"
  | FM -> `String "FM"
  | FK -> `String "FK"
  | FJ -> `String "FJ"
  | FI -> `String "FI"
  | ET -> `String "ET"
  | ES -> `String "ES"
  | ER -> `String "ER"
  | EH -> `String "EH"
  | EG -> `String "EG"
  | EE -> `String "EE"
  | EC -> `String "EC"
  | DZ -> `String "DZ"
  | DO -> `String "DO"
  | DM -> `String "DM"
  | DK -> `String "DK"
  | DJ -> `String "DJ"
  | DE -> `String "DE"
  | CZ -> `String "CZ"
  | CY -> `String "CY"
  | CX -> `String "CX"
  | CW -> `String "CW"
  | CV -> `String "CV"
  | CU -> `String "CU"
  | CR -> `String "CR"
  | CO -> `String "CO"
  | CN -> `String "CN"
  | CM -> `String "CM"
  | CL -> `String "CL"
  | CK -> `String "CK"
  | CI -> `String "CI"
  | CH -> `String "CH"
  | CG -> `String "CG"
  | CF -> `String "CF"
  | CD -> `String "CD"
  | CC -> `String "CC"
  | CA -> `String "CA"
  | BZ -> `String "BZ"
  | BY -> `String "BY"
  | BW -> `String "BW"
  | BV -> `String "BV"
  | BT -> `String "BT"
  | BS -> `String "BS"
  | BR -> `String "BR"
  | BQ -> `String "BQ"
  | BO -> `String "BO"
  | BN -> `String "BN"
  | BM -> `String "BM"
  | BL -> `String "BL"
  | BJ -> `String "BJ"
  | BI -> `String "BI"
  | BH -> `String "BH"
  | BG -> `String "BG"
  | BF -> `String "BF"
  | BE -> `String "BE"
  | BD -> `String "BD"
  | BB -> `String "BB"
  | BA -> `String "BA"
  | AZ -> `String "AZ"
  | AX -> `String "AX"
  | AW -> `String "AW"
  | AU -> `String "AU"
  | AT -> `String "AT"
  | AS -> `String "AS"
  | AR -> `String "AR"
  | AQ -> `String "AQ"
  | AO -> `String "AO"
  | AN -> `String "AN"
  | AM -> `String "AM"
  | AL -> `String "AL"
  | AI -> `String "AI"
  | AG -> `String "AG"
  | AF -> `String "AF"
  | AE -> `String "AE"
  | AD -> `String "AD"
  | AC -> `String "AC"

let contact_number_to_yojson = string_to_yojson
let email_to_yojson = string_to_yojson

let extra_param_name_to_yojson (x : extra_param_name) =
  match x with
  | AU_REGISTRANT_NAME -> `String "AU_REGISTRANT_NAME"
  | AU_POLICY_REASON -> `String "AU_POLICY_REASON"
  | AU_ELIGIBILITY_TYPE -> `String "AU_ELIGIBILITY_TYPE"
  | AU_PRIORITY_TOKEN -> `String "AU_PRIORITY_TOKEN"
  | EU_COUNTRY_OF_CITIZENSHIP -> `String "EU_COUNTRY_OF_CITIZENSHIP"
  | UK_COMPANY_NUMBER -> `String "UK_COMPANY_NUMBER"
  | UK_CONTACT_TYPE -> `String "UK_CONTACT_TYPE"
  | VAT_NUMBER -> `String "VAT_NUMBER"
  | SG_ID_NUMBER -> `String "SG_ID_NUMBER"
  | SE_ID_NUMBER -> `String "SE_ID_NUMBER"
  | RU_PASSPORT_DATA -> `String "RU_PASSPORT_DATA"
  | IT_REGISTRANT_ENTITY_TYPE -> `String "IT_REGISTRANT_ENTITY_TYPE"
  | IT_PIN -> `String "IT_PIN"
  | IT_NATIONALITY -> `String "IT_NATIONALITY"
  | FI_ORGANIZATION_TYPE -> `String "FI_ORGANIZATION_TYPE"
  | FI_NATIONALITY -> `String "FI_NATIONALITY"
  | ONWER_FI_ID_NUMBER -> `String "FI_ID_NUMBER"
  | FI_BUSINESS_NUMBER -> `String "FI_BUSINESS_NUMBER"
  | ES_LEGAL_FORM -> `String "ES_LEGAL_FORM"
  | ES_IDENTIFICATION_TYPE -> `String "ES_IDENTIFICATION_TYPE"
  | ES_IDENTIFICATION -> `String "ES_IDENTIFICATION"
  | CA_LEGAL_REPRESENTATIVE_CAPACITY -> `String "CA_LEGAL_REPRESENTATIVE_CAPACITY"
  | CA_LEGAL_REPRESENTATIVE -> `String "CA_LEGAL_REPRESENTATIVE"
  | CA_BUSINESS_ENTITY_TYPE -> `String "CA_BUSINESS_ENTITY_TYPE"
  | CA_LEGAL_TYPE -> `String "CA_LEGAL_TYPE"
  | AU_ID_TYPE -> `String "AU_ID_TYPE"
  | AU_ID_NUMBER -> `String "AU_ID_NUMBER"
  | DOCUMENT_NUMBER -> `String "DOCUMENT_NUMBER"
  | BIRTH_CITY -> `String "BIRTH_CITY"
  | BIRTH_COUNTRY -> `String "BIRTH_COUNTRY"
  | BIRTH_DATE_IN_YYYY_MM_DD -> `String "BIRTH_DATE_IN_YYYY_MM_DD"
  | BIRTH_DEPARTMENT -> `String "BIRTH_DEPARTMENT"
  | BRAND_NUMBER -> `String "BRAND_NUMBER"
  | DUNS_NUMBER -> `String "DUNS_NUMBER"

let extra_param_value_to_yojson = string_to_yojson

let extra_param_to_yojson (x : extra_param) =
  assoc_to_yojson
    [
      ("Value", Some (extra_param_value_to_yojson x.value));
      ("Name", Some (extra_param_name_to_yojson x.name));
    ]

let extra_param_list_to_yojson tree = list_to_yojson extra_param_to_yojson tree

let contact_detail_to_yojson (x : contact_detail) =
  assoc_to_yojson
    [
      ("ExtraParams", option_to_yojson extra_param_list_to_yojson x.extra_params);
      ("Fax", option_to_yojson contact_number_to_yojson x.fax);
      ("Email", option_to_yojson email_to_yojson x.email);
      ("PhoneNumber", option_to_yojson contact_number_to_yojson x.phone_number);
      ("ZipCode", option_to_yojson zip_code_to_yojson x.zip_code);
      ("CountryCode", option_to_yojson country_code_to_yojson x.country_code);
      ("State", option_to_yojson state_to_yojson x.state);
      ("City", option_to_yojson city_to_yojson x.city);
      ("AddressLine2", option_to_yojson address_line_to_yojson x.address_line2);
      ("AddressLine1", option_to_yojson address_line_to_yojson x.address_line1);
      ("OrganizationName", option_to_yojson contact_name_to_yojson x.organization_name);
      ("ContactType", option_to_yojson contact_type_to_yojson x.contact_type);
      ("LastName", option_to_yojson contact_name_to_yojson x.last_name);
      ("FirstName", option_to_yojson contact_name_to_yojson x.first_name);
    ]

let currency_to_yojson = string_to_yojson

let consent_to_yojson (x : consent) =
  assoc_to_yojson
    [
      ("Currency", Some (currency_to_yojson x.currency));
      ("MaxPrice", Some (price_to_yojson x.max_price));
    ]

let update_domain_contact_request_to_yojson (x : update_domain_contact_request) =
  assoc_to_yojson
    [
      ("BillingContact", option_to_yojson contact_detail_to_yojson x.billing_contact);
      ("Consent", option_to_yojson consent_to_yojson x.consent);
      ("TechContact", option_to_yojson contact_detail_to_yojson x.tech_contact);
      ("RegistrantContact", option_to_yojson contact_detail_to_yojson x.registrant_contact);
      ("AdminContact", option_to_yojson contact_detail_to_yojson x.admin_contact);
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]

let update_domain_contact_privacy_response_to_yojson (x : update_domain_contact_privacy_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let boolean__to_yojson = bool_to_yojson

let update_domain_contact_privacy_request_to_yojson (x : update_domain_contact_privacy_request) =
  assoc_to_yojson
    [
      ("BillingPrivacy", option_to_yojson boolean__to_yojson x.billing_privacy);
      ("TechPrivacy", option_to_yojson boolean__to_yojson x.tech_privacy);
      ("RegistrantPrivacy", option_to_yojson boolean__to_yojson x.registrant_privacy);
      ("AdminPrivacy", option_to_yojson boolean__to_yojson x.admin_privacy);
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]

let transferable_to_yojson (x : transferable) =
  match x with
  | PREMIUM_DOMAIN -> `String "PREMIUM_DOMAIN"
  | DOMAIN_IN_ANOTHER_ACCOUNT -> `String "DOMAIN_IN_ANOTHER_ACCOUNT"
  | DOMAIN_IN_OWN_ACCOUNT -> `String "DOMAIN_IN_OWN_ACCOUNT"
  | DONT_KNOW -> `String "DONT_KNOW"
  | UNTRANSFERABLE -> `String "UNTRANSFERABLE"
  | TRANSFERABLE -> `String "TRANSFERABLE"

let password_to_yojson = string_to_yojson

let transfer_domain_to_another_aws_account_response_to_yojson
    (x : transfer_domain_to_another_aws_account_response) =
  assoc_to_yojson
    [
      ("Password", option_to_yojson password_to_yojson x.password);
      ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id);
    ]

let account_id_to_yojson = string_to_yojson

let transfer_domain_to_another_aws_account_request_to_yojson
    (x : transfer_domain_to_another_aws_account_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]

let transfer_domain_response_to_yojson (x : transfer_domain_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let lang_code_to_yojson = string_to_yojson
let duration_in_years_to_yojson = int_to_yojson
let domain_auth_code_to_yojson = string_to_yojson

let transfer_domain_request_to_yojson (x : transfer_domain_request) =
  assoc_to_yojson
    [
      ( "PrivacyProtectBillingContact",
        option_to_yojson boolean__to_yojson x.privacy_protect_billing_contact );
      ("BillingContact", option_to_yojson contact_detail_to_yojson x.billing_contact);
      ( "PrivacyProtectTechContact",
        option_to_yojson boolean__to_yojson x.privacy_protect_tech_contact );
      ( "PrivacyProtectRegistrantContact",
        option_to_yojson boolean__to_yojson x.privacy_protect_registrant_contact );
      ( "PrivacyProtectAdminContact",
        option_to_yojson boolean__to_yojson x.privacy_protect_admin_contact );
      ("TechContact", Some (contact_detail_to_yojson x.tech_contact));
      ("RegistrantContact", Some (contact_detail_to_yojson x.registrant_contact));
      ("AdminContact", Some (contact_detail_to_yojson x.admin_contact));
      ("AutoRenew", option_to_yojson boolean__to_yojson x.auto_renew);
      ("AuthCode", option_to_yojson domain_auth_code_to_yojson x.auth_code);
      ("Nameservers", option_to_yojson nameserver_list_to_yojson x.nameservers);
      ("DurationInYears", option_to_yojson duration_in_years_to_yojson x.duration_in_years);
      ("IdnLangCode", option_to_yojson lang_code_to_yojson x.idn_lang_code);
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]

let domain_limit_exceeded_to_yojson (x : domain_limit_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let tld_name_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let tld_in_maintenance_to_yojson (x : tld_in_maintenance) =
  assoc_to_yojson
    [
      ("tld", option_to_yojson tld_name_to_yojson x.tld);
      ("message", option_to_yojson error_message_to_yojson x.message);
    ]

let string__to_yojson = string_to_yojson

let status_flag_to_yojson (x : status_flag) =
  match x with
  | PENDING_SUPPORT_CASE -> `String "PENDING_SUPPORT_CASE"
  | PENDING_PAYMENT_VERIFICATION -> `String "PENDING_PAYMENT_VERIFICATION"
  | PENDING_AUTHORIZATION -> `String "PENDING_AUTHORIZATION"
  | PENDING_CUSTOMER_ACTION -> `String "PENDING_CUSTOMER_ACTION"
  | PENDING_ACCEPTANCE -> `String "PENDING_ACCEPTANCE"

let sort_order_to_yojson (x : sort_order) =
  match x with DESC -> `String "DESC" | ASC -> `String "ASC"

let list_domains_attribute_name_to_yojson (x : list_domains_attribute_name) =
  match x with Expiry -> `String "Expiry" | DomainName -> `String "DomainName"

let sort_condition_to_yojson (x : sort_condition) =
  assoc_to_yojson
    [
      ("SortOrder", Some (sort_order_to_yojson x.sort_order));
      ("Name", Some (list_domains_attribute_name_to_yojson x.name));
    ]

let retrieve_domain_auth_code_response_to_yojson (x : retrieve_domain_auth_code_response) =
  assoc_to_yojson [ ("AuthCode", option_to_yojson domain_auth_code_to_yojson x.auth_code) ]

let retrieve_domain_auth_code_request_to_yojson (x : retrieve_domain_auth_code_request) =
  assoc_to_yojson [ ("DomainName", Some (domain_name_to_yojson x.domain_name)) ]

let resend_operation_authorization_request_to_yojson (x : resend_operation_authorization_request) =
  assoc_to_yojson [ ("OperationId", Some (operation_id_to_yojson x.operation_id)) ]

let resend_contact_reachability_email_response_to_yojson
    (x : resend_contact_reachability_email_response) =
  assoc_to_yojson
    [
      ("isAlreadyVerified", option_to_yojson boolean__to_yojson x.is_already_verified);
      ("emailAddress", option_to_yojson email_to_yojson x.email_address);
      ("domainName", option_to_yojson domain_name_to_yojson x.domain_name);
    ]

let resend_contact_reachability_email_request_to_yojson
    (x : resend_contact_reachability_email_request) =
  assoc_to_yojson [ ("domainName", option_to_yojson domain_name_to_yojson x.domain_name) ]

let renew_domain_response_to_yojson (x : renew_domain_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let current_expiry_year_to_yojson = int_to_yojson

let renew_domain_request_to_yojson (x : renew_domain_request) =
  assoc_to_yojson
    [
      ("CurrentExpiryYear", Some (current_expiry_year_to_yojson x.current_expiry_year));
      ("DurationInYears", option_to_yojson duration_in_years_to_yojson x.duration_in_years);
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]

let reject_domain_transfer_from_another_aws_account_response_to_yojson
    (x : reject_domain_transfer_from_another_aws_account_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let reject_domain_transfer_from_another_aws_account_request_to_yojson
    (x : reject_domain_transfer_from_another_aws_account_request) =
  assoc_to_yojson [ ("DomainName", Some (domain_name_to_yojson x.domain_name)) ]

let register_domain_response_to_yojson (x : register_domain_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let register_domain_request_to_yojson (x : register_domain_request) =
  assoc_to_yojson
    [
      ( "PrivacyProtectBillingContact",
        option_to_yojson boolean__to_yojson x.privacy_protect_billing_contact );
      ("BillingContact", option_to_yojson contact_detail_to_yojson x.billing_contact);
      ( "PrivacyProtectTechContact",
        option_to_yojson boolean__to_yojson x.privacy_protect_tech_contact );
      ( "PrivacyProtectRegistrantContact",
        option_to_yojson boolean__to_yojson x.privacy_protect_registrant_contact );
      ( "PrivacyProtectAdminContact",
        option_to_yojson boolean__to_yojson x.privacy_protect_admin_contact );
      ("TechContact", Some (contact_detail_to_yojson x.tech_contact));
      ("RegistrantContact", Some (contact_detail_to_yojson x.registrant_contact));
      ("AdminContact", Some (contact_detail_to_yojson x.admin_contact));
      ("AutoRenew", option_to_yojson boolean__to_yojson x.auto_renew);
      ("DurationInYears", Some (duration_in_years_to_yojson x.duration_in_years));
      ("IdnLangCode", option_to_yojson lang_code_to_yojson x.idn_lang_code);
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]

let label_to_yojson = string_to_yojson

let push_domain_request_to_yojson (x : push_domain_request) =
  assoc_to_yojson
    [
      ("Target", Some (label_to_yojson x.target));
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]

let list_tags_for_domain_response_to_yojson (x : list_tags_for_domain_response) =
  assoc_to_yojson [ ("TagList", option_to_yojson tag_list_to_yojson x.tag_list) ]

let list_tags_for_domain_request_to_yojson (x : list_tags_for_domain_request) =
  assoc_to_yojson [ ("DomainName", Some (domain_name_to_yojson x.domain_name)) ]

let domain_price_name_to_yojson = string_to_yojson

let price_with_currency_to_yojson (x : price_with_currency) =
  assoc_to_yojson
    [
      ("Currency", Some (currency_to_yojson x.currency)); ("Price", Some (price_to_yojson x.price));
    ]

let domain_price_to_yojson (x : domain_price) =
  assoc_to_yojson
    [
      ("RestorationPrice", option_to_yojson price_with_currency_to_yojson x.restoration_price);
      ( "ChangeOwnershipPrice",
        option_to_yojson price_with_currency_to_yojson x.change_ownership_price );
      ("RenewalPrice", option_to_yojson price_with_currency_to_yojson x.renewal_price);
      ("TransferPrice", option_to_yojson price_with_currency_to_yojson x.transfer_price);
      ("RegistrationPrice", option_to_yojson price_with_currency_to_yojson x.registration_price);
      ("Name", option_to_yojson domain_price_name_to_yojson x.name);
    ]

let domain_price_list_to_yojson tree = list_to_yojson domain_price_to_yojson tree

let list_prices_response_to_yojson (x : list_prices_response) =
  assoc_to_yojson
    [
      ("NextPageMarker", option_to_yojson page_marker_to_yojson x.next_page_marker);
      ("Prices", option_to_yojson domain_price_list_to_yojson x.prices);
    ]

let list_prices_page_max_items_to_yojson = int_to_yojson

let list_prices_request_to_yojson (x : list_prices_request) =
  assoc_to_yojson
    [
      ("MaxItems", option_to_yojson list_prices_page_max_items_to_yojson x.max_items);
      ("Marker", option_to_yojson page_marker_to_yojson x.marker);
      ("Tld", option_to_yojson tld_name_to_yojson x.tld);
    ]

let operation_status_to_yojson (x : operation_status) =
  match x with
  | FAILED -> `String "FAILED"
  | SUCCESSFUL -> `String "SUCCESSFUL"
  | ERROR -> `String "ERROR"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUBMITTED -> `String "SUBMITTED"

let operation_summary_to_yojson (x : operation_summary) =
  assoc_to_yojson
    [
      ("LastUpdatedDate", option_to_yojson timestamp_to_yojson x.last_updated_date);
      ("StatusFlag", option_to_yojson status_flag_to_yojson x.status_flag);
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("SubmittedDate", option_to_yojson timestamp_to_yojson x.submitted_date);
      ("Type", option_to_yojson operation_type_to_yojson x.type_);
      ("Status", option_to_yojson operation_status_to_yojson x.status);
      ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id);
    ]

let operation_summary_list_to_yojson tree = list_to_yojson operation_summary_to_yojson tree

let list_operations_response_to_yojson (x : list_operations_response) =
  assoc_to_yojson
    [
      ("NextPageMarker", option_to_yojson page_marker_to_yojson x.next_page_marker);
      ("Operations", option_to_yojson operation_summary_list_to_yojson x.operations);
    ]

let operation_status_list_to_yojson tree = list_to_yojson operation_status_to_yojson tree
let operation_type_list_to_yojson tree = list_to_yojson operation_type_to_yojson tree

let list_operations_sort_attribute_name_to_yojson (x : list_operations_sort_attribute_name) =
  match x with SubmittedDate -> `String "SubmittedDate"

let list_operations_request_to_yojson (x : list_operations_request) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson list_operations_sort_attribute_name_to_yojson x.sort_by);
      ("Type", option_to_yojson operation_type_list_to_yojson x.type_);
      ("Status", option_to_yojson operation_status_list_to_yojson x.status);
      ("MaxItems", option_to_yojson page_max_items_to_yojson x.max_items);
      ("Marker", option_to_yojson page_marker_to_yojson x.marker);
      ("SubmittedSince", option_to_yojson timestamp_to_yojson x.submitted_since);
    ]

let domain_summary_to_yojson (x : domain_summary) =
  assoc_to_yojson
    [
      ("Expiry", option_to_yojson timestamp_to_yojson x.expiry);
      ("TransferLock", option_to_yojson boolean__to_yojson x.transfer_lock);
      ("AutoRenew", option_to_yojson boolean__to_yojson x.auto_renew);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
    ]

let domain_summary_list_to_yojson tree = list_to_yojson domain_summary_to_yojson tree

let list_domains_response_to_yojson (x : list_domains_response) =
  assoc_to_yojson
    [
      ("NextPageMarker", option_to_yojson page_marker_to_yojson x.next_page_marker);
      ("Domains", option_to_yojson domain_summary_list_to_yojson x.domains);
    ]

let operator_to_yojson (x : operator) =
  match x with BEGINS_WITH -> `String "BEGINS_WITH" | GE -> `String "GE" | LE -> `String "LE"

let filter_condition_to_yojson (x : filter_condition) =
  assoc_to_yojson
    [
      ("Values", Some (values_to_yojson x.values));
      ("Operator", Some (operator_to_yojson x.operator));
      ("Name", Some (list_domains_attribute_name_to_yojson x.name));
    ]

let filter_conditions_to_yojson tree = list_to_yojson filter_condition_to_yojson tree

let list_domains_request_to_yojson (x : list_domains_request) =
  assoc_to_yojson
    [
      ("MaxItems", option_to_yojson page_max_items_to_yojson x.max_items);
      ("Marker", option_to_yojson page_marker_to_yojson x.marker);
      ("SortCondition", option_to_yojson sort_condition_to_yojson x.sort_condition);
      ("FilterConditions", option_to_yojson filter_conditions_to_yojson x.filter_conditions);
    ]

let get_operation_detail_response_to_yojson (x : get_operation_detail_response) =
  assoc_to_yojson
    [
      ("StatusFlag", option_to_yojson status_flag_to_yojson x.status_flag);
      ("LastUpdatedDate", option_to_yojson timestamp_to_yojson x.last_updated_date);
      ("SubmittedDate", option_to_yojson timestamp_to_yojson x.submitted_date);
      ("Type", option_to_yojson operation_type_to_yojson x.type_);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("Status", option_to_yojson operation_status_to_yojson x.status);
      ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id);
    ]

let get_operation_detail_request_to_yojson (x : get_operation_detail_request) =
  assoc_to_yojson [ ("OperationId", Some (operation_id_to_yojson x.operation_id)) ]

let domain_suggestion_to_yojson (x : domain_suggestion) =
  assoc_to_yojson
    [
      ("Availability", option_to_yojson string__to_yojson x.availability);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
    ]

let domain_suggestions_list_to_yojson tree = list_to_yojson domain_suggestion_to_yojson tree

let get_domain_suggestions_response_to_yojson (x : get_domain_suggestions_response) =
  assoc_to_yojson
    [ ("SuggestionsList", option_to_yojson domain_suggestions_list_to_yojson x.suggestions_list) ]

let integer_to_yojson = int_to_yojson

let get_domain_suggestions_request_to_yojson (x : get_domain_suggestions_request) =
  assoc_to_yojson
    [
      ("OnlyAvailable", Some (boolean__to_yojson x.only_available));
      ("SuggestionCount", Some (integer_to_yojson x.suggestion_count));
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]

let registrar_name_to_yojson = string_to_yojson
let registrar_who_is_server_to_yojson = string_to_yojson
let registrar_url_to_yojson = string_to_yojson
let registry_domain_id_to_yojson = string_to_yojson
let reseller_to_yojson = string_to_yojson
let dns_sec_to_yojson = string_to_yojson
let domain_status_to_yojson = string_to_yojson
let domain_status_list_to_yojson tree = list_to_yojson domain_status_to_yojson tree
let nullable_integer_to_yojson = int_to_yojson
let dnssec_public_key_to_yojson = string_to_yojson

let dnssec_key_to_yojson (x : dnssec_key) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson string__to_yojson x.id);
      ("KeyTag", option_to_yojson nullable_integer_to_yojson x.key_tag);
      ("Digest", option_to_yojson string__to_yojson x.digest);
      ("DigestType", option_to_yojson nullable_integer_to_yojson x.digest_type);
      ("PublicKey", option_to_yojson dnssec_public_key_to_yojson x.public_key);
      ("Flags", option_to_yojson nullable_integer_to_yojson x.flags);
      ("Algorithm", option_to_yojson nullable_integer_to_yojson x.algorithm);
    ]

let dnssec_key_list_to_yojson tree = list_to_yojson dnssec_key_to_yojson tree

let get_domain_detail_response_to_yojson (x : get_domain_detail_response) =
  assoc_to_yojson
    [
      ("BillingPrivacy", option_to_yojson boolean__to_yojson x.billing_privacy);
      ("BillingContact", option_to_yojson contact_detail_to_yojson x.billing_contact);
      ("DnssecKeys", option_to_yojson dnssec_key_list_to_yojson x.dnssec_keys);
      ("StatusList", option_to_yojson domain_status_list_to_yojson x.status_list);
      ("DnsSec", option_to_yojson dns_sec_to_yojson x.dns_sec);
      ("Reseller", option_to_yojson reseller_to_yojson x.reseller);
      ("ExpirationDate", option_to_yojson timestamp_to_yojson x.expiration_date);
      ("UpdatedDate", option_to_yojson timestamp_to_yojson x.updated_date);
      ("CreationDate", option_to_yojson timestamp_to_yojson x.creation_date);
      ("RegistryDomainId", option_to_yojson registry_domain_id_to_yojson x.registry_domain_id);
      ("AbuseContactPhone", option_to_yojson contact_number_to_yojson x.abuse_contact_phone);
      ("AbuseContactEmail", option_to_yojson email_to_yojson x.abuse_contact_email);
      ("RegistrarUrl", option_to_yojson registrar_url_to_yojson x.registrar_url);
      ("WhoIsServer", option_to_yojson registrar_who_is_server_to_yojson x.who_is_server);
      ("RegistrarName", option_to_yojson registrar_name_to_yojson x.registrar_name);
      ("TechPrivacy", option_to_yojson boolean__to_yojson x.tech_privacy);
      ("RegistrantPrivacy", option_to_yojson boolean__to_yojson x.registrant_privacy);
      ("AdminPrivacy", option_to_yojson boolean__to_yojson x.admin_privacy);
      ("TechContact", option_to_yojson contact_detail_to_yojson x.tech_contact);
      ("RegistrantContact", option_to_yojson contact_detail_to_yojson x.registrant_contact);
      ("AdminContact", option_to_yojson contact_detail_to_yojson x.admin_contact);
      ("AutoRenew", option_to_yojson boolean__to_yojson x.auto_renew);
      ("Nameservers", option_to_yojson nameserver_list_to_yojson x.nameservers);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
    ]

let get_domain_detail_request_to_yojson (x : get_domain_detail_request) =
  assoc_to_yojson [ ("DomainName", Some (domain_name_to_yojson x.domain_name)) ]

let reachability_status_to_yojson (x : reachability_status) =
  match x with
  | EXPIRED -> `String "EXPIRED"
  | DONE -> `String "DONE"
  | PENDING -> `String "PENDING"

let get_contact_reachability_status_response_to_yojson
    (x : get_contact_reachability_status_response) =
  assoc_to_yojson
    [
      ("status", option_to_yojson reachability_status_to_yojson x.status);
      ("domainName", option_to_yojson domain_name_to_yojson x.domain_name);
    ]

let get_contact_reachability_status_request_to_yojson (x : get_contact_reachability_status_request)
    =
  assoc_to_yojson [ ("domainName", option_to_yojson domain_name_to_yojson x.domain_name) ]

let enable_domain_transfer_lock_response_to_yojson (x : enable_domain_transfer_lock_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let enable_domain_transfer_lock_request_to_yojson (x : enable_domain_transfer_lock_request) =
  assoc_to_yojson [ ("DomainName", Some (domain_name_to_yojson x.domain_name)) ]

let enable_domain_auto_renew_response_to_yojson = unit_to_yojson

let enable_domain_auto_renew_request_to_yojson (x : enable_domain_auto_renew_request) =
  assoc_to_yojson [ ("DomainName", Some (domain_name_to_yojson x.domain_name)) ]

let disassociate_delegation_signer_from_domain_response_to_yojson
    (x : disassociate_delegation_signer_from_domain_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let disassociate_delegation_signer_from_domain_request_to_yojson
    (x : disassociate_delegation_signer_from_domain_request) =
  assoc_to_yojson
    [
      ("Id", Some (string__to_yojson x.id));
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]

let disable_domain_transfer_lock_response_to_yojson (x : disable_domain_transfer_lock_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let disable_domain_transfer_lock_request_to_yojson (x : disable_domain_transfer_lock_request) =
  assoc_to_yojson [ ("DomainName", Some (domain_name_to_yojson x.domain_name)) ]

let disable_domain_auto_renew_response_to_yojson = unit_to_yojson

let disable_domain_auto_renew_request_to_yojson (x : disable_domain_auto_renew_request) =
  assoc_to_yojson [ ("DomainName", Some (domain_name_to_yojson x.domain_name)) ]

let delete_tags_for_domain_response_to_yojson = unit_to_yojson

let delete_tags_for_domain_request_to_yojson (x : delete_tags_for_domain_request) =
  assoc_to_yojson
    [
      ("TagsToDelete", Some (tag_key_list_to_yojson x.tags_to_delete));
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]

let delete_domain_response_to_yojson (x : delete_domain_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let delete_domain_request_to_yojson (x : delete_domain_request) =
  assoc_to_yojson [ ("DomainName", Some (domain_name_to_yojson x.domain_name)) ]

let domain_transferability_to_yojson (x : domain_transferability) =
  assoc_to_yojson [ ("Transferable", option_to_yojson transferable_to_yojson x.transferable) ]

let message_to_yojson = string_to_yojson

let check_domain_transferability_response_to_yojson (x : check_domain_transferability_response) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson message_to_yojson x.message);
      ("Transferability", option_to_yojson domain_transferability_to_yojson x.transferability);
    ]

let check_domain_transferability_request_to_yojson (x : check_domain_transferability_request) =
  assoc_to_yojson
    [
      ("AuthCode", option_to_yojson domain_auth_code_to_yojson x.auth_code);
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]

let domain_availability_to_yojson (x : domain_availability) =
  match x with
  | PENDING -> `String "PENDING"
  | INVALID_NAME_FOR_TLD -> `String "INVALID_NAME_FOR_TLD"
  | DONT_KNOW -> `String "DONT_KNOW"
  | RESERVED -> `String "RESERVED"
  | UNAVAILABLE_RESTRICTED -> `String "UNAVAILABLE_RESTRICTED"
  | UNAVAILABLE_PREMIUM -> `String "UNAVAILABLE_PREMIUM"
  | UNAVAILABLE -> `String "UNAVAILABLE"
  | AVAILABLE_PREORDER -> `String "AVAILABLE_PREORDER"
  | AVAILABLE_RESERVED -> `String "AVAILABLE_RESERVED"
  | AVAILABLE -> `String "AVAILABLE"

let check_domain_availability_response_to_yojson (x : check_domain_availability_response) =
  assoc_to_yojson
    [ ("Availability", option_to_yojson domain_availability_to_yojson x.availability) ]

let check_domain_availability_request_to_yojson (x : check_domain_availability_request) =
  assoc_to_yojson
    [
      ("IdnLangCode", option_to_yojson lang_code_to_yojson x.idn_lang_code);
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]

let cancel_domain_transfer_to_another_aws_account_response_to_yojson
    (x : cancel_domain_transfer_to_another_aws_account_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let cancel_domain_transfer_to_another_aws_account_request_to_yojson
    (x : cancel_domain_transfer_to_another_aws_account_request) =
  assoc_to_yojson [ ("DomainName", Some (domain_name_to_yojson x.domain_name)) ]

let dnssec_limit_exceeded_to_yojson (x : dnssec_limit_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let associate_delegation_signer_to_domain_response_to_yojson
    (x : associate_delegation_signer_to_domain_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let dnssec_signing_attributes_to_yojson (x : dnssec_signing_attributes) =
  assoc_to_yojson
    [
      ("PublicKey", option_to_yojson dnssec_public_key_to_yojson x.public_key);
      ("Flags", option_to_yojson nullable_integer_to_yojson x.flags);
      ("Algorithm", option_to_yojson nullable_integer_to_yojson x.algorithm);
    ]

let associate_delegation_signer_to_domain_request_to_yojson
    (x : associate_delegation_signer_to_domain_request) =
  assoc_to_yojson
    [
      ("SigningAttributes", Some (dnssec_signing_attributes_to_yojson x.signing_attributes));
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]

let accept_domain_transfer_from_another_aws_account_response_to_yojson
    (x : accept_domain_transfer_from_another_aws_account_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let accept_domain_transfer_from_another_aws_account_request_to_yojson
    (x : accept_domain_transfer_from_another_aws_account_request) =
  assoc_to_yojson
    [
      ("Password", Some (password_to_yojson x.password));
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]
