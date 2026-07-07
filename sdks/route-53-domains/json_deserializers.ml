open Smaws_Lib.Json.DeserializeHelpers
open Types

let zip_code_of_yojson = string_of_yojson
let page_marker_of_yojson = string_of_yojson
let domain_name_of_yojson = string_of_yojson

let operation_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "RESTORE_DOMAIN" -> RESTORE_DOMAIN
    | `String "TRANSFER_ON_RENEW" -> TRANSFER_ON_RENEW
    | `String "RELEASE_TO_GANDI" -> RELEASE_TO_GANDI
    | `String "INTERNAL_TRANSFER_IN_DOMAIN" -> INTERNAL_TRANSFER_IN_DOMAIN
    | `String "INTERNAL_TRANSFER_OUT_DOMAIN" -> INTERNAL_TRANSFER_OUT_DOMAIN
    | `String "PUSH_DOMAIN" -> PUSH_DOMAIN
    | `String "RENEW_DOMAIN" -> RENEW_DOMAIN
    | `String "CHANGE_DOMAIN_OWNER" -> CHANGE_DOMAIN_OWNER
    | `String "TRANSFER_OUT_DOMAIN" -> TRANSFER_OUT_DOMAIN
    | `String "EXPIRE_DOMAIN" -> EXPIRE_DOMAIN
    | `String "REMOVE_DNSSEC" -> REMOVE_DNSSEC
    | `String "ADD_DNSSEC" -> ADD_DNSSEC
    | `String "DISABLE_AUTORENEW" -> DISABLE_AUTORENEW
    | `String "ENABLE_AUTORENEW" -> ENABLE_AUTORENEW
    | `String "DOMAIN_LOCK" -> DOMAIN_LOCK
    | `String "CHANGE_PRIVACY_PROTECTION" -> CHANGE_PRIVACY_PROTECTION
    | `String "UPDATE_NAMESERVER" -> UPDATE_NAMESERVER
    | `String "UPDATE_DOMAIN_CONTACT" -> UPDATE_DOMAIN_CONTACT
    | `String "TRANSFER_IN_DOMAIN" -> TRANSFER_IN_DOMAIN
    | `String "DELETE_DOMAIN" -> DELETE_DOMAIN
    | `String "REGISTER_DOMAIN" -> REGISTER_DOMAIN
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperationType" value)
    | _ -> raise (deserialize_wrong_type_error path "OperationType")
     : operation_type)
    : operation_type)

let invoice_id_of_yojson = string_of_yojson
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let price_of_yojson = double_of_yojson

let billing_record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     price = option_of_yojson (value_for_key price_of_yojson "Price") _list path;
     bill_date = option_of_yojson (value_for_key timestamp_of_yojson "BillDate") _list path;
     invoice_id = option_of_yojson (value_for_key invoice_id_of_yojson "InvoiceId") _list path;
     operation = option_of_yojson (value_for_key operation_type_of_yojson "Operation") _list path;
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "DomainName") _list path;
   }
    : billing_record)

let billing_records_of_yojson tree path = list_of_yojson billing_record_of_yojson tree path

let view_billing_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billing_records =
       option_of_yojson (value_for_key billing_records_of_yojson "BillingRecords") _list path;
     next_page_marker =
       option_of_yojson (value_for_key page_marker_of_yojson "NextPageMarker") _list path;
   }
    : view_billing_response)

let page_max_items_of_yojson = int_of_yojson

let view_billing_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_items = option_of_yojson (value_for_key page_max_items_of_yojson "MaxItems") _list path;
     marker = option_of_yojson (value_for_key page_marker_of_yojson "Marker") _list path;
     end_ = option_of_yojson (value_for_key timestamp_of_yojson "End") _list path;
     start = option_of_yojson (value_for_key timestamp_of_yojson "Start") _list path;
   }
    : view_billing_request)

let error_message_of_yojson = string_of_yojson

let invalid_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_input)

let value_of_yojson = string_of_yojson
let values_of_yojson tree path = list_of_yojson value_of_yojson tree path

let update_tags_for_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key tag_value_of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key tag_key_of_yojson "Key") _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let update_tags_for_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags_to_update = option_of_yojson (value_for_key tag_list_of_yojson "TagsToUpdate") _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
   }
    : update_tags_for_domain_request)

let unsupported_tl_d_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : unsupported_tl_d)

let operation_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : operation_limit_exceeded)

let operation_id_of_yojson = string_of_yojson

let update_domain_nameservers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : update_domain_nameservers_response)

let fi_auth_key_of_yojson = string_of_yojson
let host_name_of_yojson = string_of_yojson
let glue_ip_of_yojson = string_of_yojson
let glue_ip_list_of_yojson tree path = list_of_yojson glue_ip_of_yojson tree path

let nameserver_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     glue_ips = option_of_yojson (value_for_key glue_ip_list_of_yojson "GlueIps") _list path;
     name = value_for_key host_name_of_yojson "Name" _list path;
   }
    : nameserver)

let nameserver_list_of_yojson tree path = list_of_yojson nameserver_of_yojson tree path

let update_domain_nameservers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     nameservers = value_for_key nameserver_list_of_yojson "Nameservers" _list path;
     fi_auth_key = option_of_yojson (value_for_key fi_auth_key_of_yojson "FIAuthKey") _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
   }
    : update_domain_nameservers_request)

let tld_rules_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : tld_rules_violation)

let request_id_of_yojson = string_of_yojson

let duplicate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "requestId") _list path;
   }
    : duplicate_request)

let update_domain_contact_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : update_domain_contact_response)

let contact_name_of_yojson = string_of_yojson

let contact_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "RESELLER" -> RESELLER
    | `String "PUBLIC_BODY" -> PUBLIC_BODY
    | `String "ASSOCIATION" -> ASSOCIATION
    | `String "COMPANY" -> COMPANY
    | `String "PERSON" -> PERSON
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContactType" value)
    | _ -> raise (deserialize_wrong_type_error path "ContactType")
     : contact_type)
    : contact_type)

let address_line_of_yojson = string_of_yojson
let city_of_yojson = string_of_yojson
let state_of_yojson = string_of_yojson

let country_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "ZW" -> ZW
    | `String "ZM" -> ZM
    | `String "ZA" -> ZA
    | `String "YT" -> YT
    | `String "YE" -> YE
    | `String "WS" -> WS
    | `String "WF" -> WF
    | `String "VU" -> VU
    | `String "VN" -> VN
    | `String "VI" -> VI
    | `String "VG" -> VG
    | `String "VE" -> VE
    | `String "VC" -> VC
    | `String "VA" -> VA
    | `String "UZ" -> UZ
    | `String "UY" -> UY
    | `String "US" -> US
    | `String "UG" -> UG
    | `String "UA" -> UA
    | `String "TZ" -> TZ
    | `String "TW" -> TW
    | `String "TV" -> TV
    | `String "TT" -> TT
    | `String "TR" -> TR
    | `String "TP" -> TP
    | `String "TO" -> TO
    | `String "TN" -> TN
    | `String "TM" -> TM
    | `String "TL" -> TL
    | `String "TK" -> TK
    | `String "TJ" -> TJ
    | `String "TH" -> TH
    | `String "TG" -> TG
    | `String "TF" -> TF
    | `String "TD" -> TD
    | `String "TC" -> TC
    | `String "SZ" -> SZ
    | `String "SY" -> SY
    | `String "SX" -> SX
    | `String "SV" -> SV
    | `String "ST" -> ST
    | `String "SS" -> SS
    | `String "SR" -> SR
    | `String "SO" -> SO
    | `String "SN" -> SN
    | `String "SM" -> SM
    | `String "SL" -> SL
    | `String "SK" -> SK
    | `String "SJ" -> SJ
    | `String "SI" -> SI
    | `String "SH" -> SH
    | `String "SG" -> SG
    | `String "SE" -> SE
    | `String "SD" -> SD
    | `String "SC" -> SC
    | `String "SB" -> SB
    | `String "SA" -> SA
    | `String "RW" -> RW
    | `String "RU" -> RU
    | `String "RS" -> RS
    | `String "RO" -> RO
    | `String "RE" -> RE
    | `String "QA" -> QA
    | `String "PY" -> PY
    | `String "PW" -> PW
    | `String "PT" -> PT
    | `String "PS" -> PS
    | `String "PR" -> PR
    | `String "PN" -> PN
    | `String "PM" -> PM
    | `String "PL" -> PL
    | `String "PK" -> PK
    | `String "PH" -> PH
    | `String "PG" -> PG
    | `String "PF" -> PF
    | `String "PE" -> PE
    | `String "PA" -> PA
    | `String "OM" -> OM
    | `String "NZ" -> NZ
    | `String "NU" -> NU
    | `String "NR" -> NR
    | `String "NP" -> NP
    | `String "NO" -> NO
    | `String "NL" -> NL
    | `String "NI" -> NI
    | `String "NG" -> NG
    | `String "NF" -> NF
    | `String "NE" -> NE
    | `String "NC" -> NC
    | `String "NA" -> NA
    | `String "MZ" -> MZ
    | `String "MY" -> MY
    | `String "MX" -> MX
    | `String "MW" -> MW
    | `String "MV" -> MV
    | `String "MU" -> MU
    | `String "MT" -> MT
    | `String "MS" -> MS
    | `String "MR" -> MR
    | `String "MQ" -> MQ
    | `String "MP" -> MP
    | `String "MO" -> MO
    | `String "MN" -> MN
    | `String "MM" -> MM
    | `String "ML" -> ML
    | `String "MK" -> MK
    | `String "MH" -> MH
    | `String "MG" -> MG
    | `String "MF" -> MF
    | `String "ME" -> ME
    | `String "MD" -> MD
    | `String "MC" -> MC
    | `String "MA" -> MA
    | `String "LY" -> LY
    | `String "LV" -> LV
    | `String "LU" -> LU
    | `String "LT" -> LT
    | `String "LS" -> LS
    | `String "LR" -> LR
    | `String "LK" -> LK
    | `String "LI" -> LI
    | `String "LC" -> LC
    | `String "LB" -> LB
    | `String "LA" -> LA
    | `String "KZ" -> KZ
    | `String "KY" -> KY
    | `String "KW" -> KW
    | `String "KR" -> KR
    | `String "KP" -> KP
    | `String "KN" -> KN
    | `String "KM" -> KM
    | `String "KI" -> KI
    | `String "KH" -> KH
    | `String "KG" -> KG
    | `String "KE" -> KE
    | `String "JP" -> JP
    | `String "JO" -> JO
    | `String "JM" -> JM
    | `String "JE" -> JE
    | `String "IT" -> IT
    | `String "IS" -> IS
    | `String "IR" -> IR
    | `String "IQ" -> IQ
    | `String "IO" -> IO
    | `String "IN" -> IN
    | `String "IM" -> IM
    | `String "IL" -> IL
    | `String "IE" -> IE
    | `String "ID" -> ID
    | `String "HU" -> HU
    | `String "HT" -> HT
    | `String "HR" -> HR
    | `String "HN" -> HN
    | `String "HM" -> HM
    | `String "HK" -> HK
    | `String "GY" -> GY
    | `String "GW" -> GW
    | `String "GU" -> GU
    | `String "GT" -> GT
    | `String "GS" -> GS
    | `String "GR" -> GR
    | `String "GQ" -> GQ
    | `String "GP" -> GP
    | `String "GN" -> GN
    | `String "GM" -> GM
    | `String "GL" -> GL
    | `String "GI" -> GI
    | `String "GH" -> GH
    | `String "GG" -> GG
    | `String "GF" -> GF
    | `String "GE" -> GE
    | `String "GD" -> GD
    | `String "GB" -> GB
    | `String "GA" -> GA
    | `String "FR" -> FR
    | `String "FO" -> FO
    | `String "FM" -> FM
    | `String "FK" -> FK
    | `String "FJ" -> FJ
    | `String "FI" -> FI
    | `String "ET" -> ET
    | `String "ES" -> ES
    | `String "ER" -> ER
    | `String "EH" -> EH
    | `String "EG" -> EG
    | `String "EE" -> EE
    | `String "EC" -> EC
    | `String "DZ" -> DZ
    | `String "DO" -> DO
    | `String "DM" -> DM
    | `String "DK" -> DK
    | `String "DJ" -> DJ
    | `String "DE" -> DE
    | `String "CZ" -> CZ
    | `String "CY" -> CY
    | `String "CX" -> CX
    | `String "CW" -> CW
    | `String "CV" -> CV
    | `String "CU" -> CU
    | `String "CR" -> CR
    | `String "CO" -> CO
    | `String "CN" -> CN
    | `String "CM" -> CM
    | `String "CL" -> CL
    | `String "CK" -> CK
    | `String "CI" -> CI
    | `String "CH" -> CH
    | `String "CG" -> CG
    | `String "CF" -> CF
    | `String "CD" -> CD
    | `String "CC" -> CC
    | `String "CA" -> CA
    | `String "BZ" -> BZ
    | `String "BY" -> BY
    | `String "BW" -> BW
    | `String "BV" -> BV
    | `String "BT" -> BT
    | `String "BS" -> BS
    | `String "BR" -> BR
    | `String "BQ" -> BQ
    | `String "BO" -> BO
    | `String "BN" -> BN
    | `String "BM" -> BM
    | `String "BL" -> BL
    | `String "BJ" -> BJ
    | `String "BI" -> BI
    | `String "BH" -> BH
    | `String "BG" -> BG
    | `String "BF" -> BF
    | `String "BE" -> BE
    | `String "BD" -> BD
    | `String "BB" -> BB
    | `String "BA" -> BA
    | `String "AZ" -> AZ
    | `String "AX" -> AX
    | `String "AW" -> AW
    | `String "AU" -> AU
    | `String "AT" -> AT
    | `String "AS" -> AS
    | `String "AR" -> AR
    | `String "AQ" -> AQ
    | `String "AO" -> AO
    | `String "AN" -> AN
    | `String "AM" -> AM
    | `String "AL" -> AL
    | `String "AI" -> AI
    | `String "AG" -> AG
    | `String "AF" -> AF
    | `String "AE" -> AE
    | `String "AD" -> AD
    | `String "AC" -> AC
    | `String value -> raise (deserialize_unknown_enum_value_error path "CountryCode" value)
    | _ -> raise (deserialize_wrong_type_error path "CountryCode")
     : country_code)
    : country_code)

let contact_number_of_yojson = string_of_yojson
let email_of_yojson = string_of_yojson

let extra_param_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "AU_REGISTRANT_NAME" -> AU_REGISTRANT_NAME
    | `String "AU_POLICY_REASON" -> AU_POLICY_REASON
    | `String "AU_ELIGIBILITY_TYPE" -> AU_ELIGIBILITY_TYPE
    | `String "AU_PRIORITY_TOKEN" -> AU_PRIORITY_TOKEN
    | `String "EU_COUNTRY_OF_CITIZENSHIP" -> EU_COUNTRY_OF_CITIZENSHIP
    | `String "UK_COMPANY_NUMBER" -> UK_COMPANY_NUMBER
    | `String "UK_CONTACT_TYPE" -> UK_CONTACT_TYPE
    | `String "VAT_NUMBER" -> VAT_NUMBER
    | `String "SG_ID_NUMBER" -> SG_ID_NUMBER
    | `String "SE_ID_NUMBER" -> SE_ID_NUMBER
    | `String "RU_PASSPORT_DATA" -> RU_PASSPORT_DATA
    | `String "IT_REGISTRANT_ENTITY_TYPE" -> IT_REGISTRANT_ENTITY_TYPE
    | `String "IT_PIN" -> IT_PIN
    | `String "IT_NATIONALITY" -> IT_NATIONALITY
    | `String "FI_ORGANIZATION_TYPE" -> FI_ORGANIZATION_TYPE
    | `String "FI_NATIONALITY" -> FI_NATIONALITY
    | `String "FI_ID_NUMBER" -> ONWER_FI_ID_NUMBER
    | `String "FI_BUSINESS_NUMBER" -> FI_BUSINESS_NUMBER
    | `String "ES_LEGAL_FORM" -> ES_LEGAL_FORM
    | `String "ES_IDENTIFICATION_TYPE" -> ES_IDENTIFICATION_TYPE
    | `String "ES_IDENTIFICATION" -> ES_IDENTIFICATION
    | `String "CA_LEGAL_REPRESENTATIVE_CAPACITY" -> CA_LEGAL_REPRESENTATIVE_CAPACITY
    | `String "CA_LEGAL_REPRESENTATIVE" -> CA_LEGAL_REPRESENTATIVE
    | `String "CA_BUSINESS_ENTITY_TYPE" -> CA_BUSINESS_ENTITY_TYPE
    | `String "CA_LEGAL_TYPE" -> CA_LEGAL_TYPE
    | `String "AU_ID_TYPE" -> AU_ID_TYPE
    | `String "AU_ID_NUMBER" -> AU_ID_NUMBER
    | `String "DOCUMENT_NUMBER" -> DOCUMENT_NUMBER
    | `String "BIRTH_CITY" -> BIRTH_CITY
    | `String "BIRTH_COUNTRY" -> BIRTH_COUNTRY
    | `String "BIRTH_DATE_IN_YYYY_MM_DD" -> BIRTH_DATE_IN_YYYY_MM_DD
    | `String "BIRTH_DEPARTMENT" -> BIRTH_DEPARTMENT
    | `String "BRAND_NUMBER" -> BRAND_NUMBER
    | `String "DUNS_NUMBER" -> DUNS_NUMBER
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExtraParamName" value)
    | _ -> raise (deserialize_wrong_type_error path "ExtraParamName")
     : extra_param_name)
    : extra_param_name)

let extra_param_value_of_yojson = string_of_yojson

let extra_param_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key extra_param_value_of_yojson "Value" _list path;
     name = value_for_key extra_param_name_of_yojson "Name" _list path;
   }
    : extra_param)

let extra_param_list_of_yojson tree path = list_of_yojson extra_param_of_yojson tree path

let contact_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     extra_params =
       option_of_yojson (value_for_key extra_param_list_of_yojson "ExtraParams") _list path;
     fax = option_of_yojson (value_for_key contact_number_of_yojson "Fax") _list path;
     email = option_of_yojson (value_for_key email_of_yojson "Email") _list path;
     phone_number =
       option_of_yojson (value_for_key contact_number_of_yojson "PhoneNumber") _list path;
     zip_code = option_of_yojson (value_for_key zip_code_of_yojson "ZipCode") _list path;
     country_code = option_of_yojson (value_for_key country_code_of_yojson "CountryCode") _list path;
     state = option_of_yojson (value_for_key state_of_yojson "State") _list path;
     city = option_of_yojson (value_for_key city_of_yojson "City") _list path;
     address_line2 =
       option_of_yojson (value_for_key address_line_of_yojson "AddressLine2") _list path;
     address_line1 =
       option_of_yojson (value_for_key address_line_of_yojson "AddressLine1") _list path;
     organization_name =
       option_of_yojson (value_for_key contact_name_of_yojson "OrganizationName") _list path;
     contact_type = option_of_yojson (value_for_key contact_type_of_yojson "ContactType") _list path;
     last_name = option_of_yojson (value_for_key contact_name_of_yojson "LastName") _list path;
     first_name = option_of_yojson (value_for_key contact_name_of_yojson "FirstName") _list path;
   }
    : contact_detail)

let currency_of_yojson = string_of_yojson

let consent_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     currency = value_for_key currency_of_yojson "Currency" _list path;
     max_price = value_for_key price_of_yojson "MaxPrice" _list path;
   }
    : consent)

let update_domain_contact_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billing_contact =
       option_of_yojson (value_for_key contact_detail_of_yojson "BillingContact") _list path;
     consent = option_of_yojson (value_for_key consent_of_yojson "Consent") _list path;
     tech_contact =
       option_of_yojson (value_for_key contact_detail_of_yojson "TechContact") _list path;
     registrant_contact =
       option_of_yojson (value_for_key contact_detail_of_yojson "RegistrantContact") _list path;
     admin_contact =
       option_of_yojson (value_for_key contact_detail_of_yojson "AdminContact") _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
   }
    : update_domain_contact_request)

let update_domain_contact_privacy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : update_domain_contact_privacy_response)

let boolean__of_yojson = bool_of_yojson

let update_domain_contact_privacy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billing_privacy =
       option_of_yojson (value_for_key boolean__of_yojson "BillingPrivacy") _list path;
     tech_privacy = option_of_yojson (value_for_key boolean__of_yojson "TechPrivacy") _list path;
     registrant_privacy =
       option_of_yojson (value_for_key boolean__of_yojson "RegistrantPrivacy") _list path;
     admin_privacy = option_of_yojson (value_for_key boolean__of_yojson "AdminPrivacy") _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
   }
    : update_domain_contact_privacy_request)

let transferable_of_yojson (tree : t) path =
  ((match tree with
    | `String "PREMIUM_DOMAIN" -> PREMIUM_DOMAIN
    | `String "DOMAIN_IN_ANOTHER_ACCOUNT" -> DOMAIN_IN_ANOTHER_ACCOUNT
    | `String "DOMAIN_IN_OWN_ACCOUNT" -> DOMAIN_IN_OWN_ACCOUNT
    | `String "DONT_KNOW" -> DONT_KNOW
    | `String "UNTRANSFERABLE" -> UNTRANSFERABLE
    | `String "TRANSFERABLE" -> TRANSFERABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Transferable" value)
    | _ -> raise (deserialize_wrong_type_error path "Transferable")
     : transferable)
    : transferable)

let password_of_yojson = string_of_yojson

let transfer_domain_to_another_aws_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     password = option_of_yojson (value_for_key password_of_yojson "Password") _list path;
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : transfer_domain_to_another_aws_account_response)

let account_id_of_yojson = string_of_yojson

let transfer_domain_to_another_aws_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
   }
    : transfer_domain_to_another_aws_account_request)

let transfer_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : transfer_domain_response)

let lang_code_of_yojson = string_of_yojson
let duration_in_years_of_yojson = int_of_yojson
let domain_auth_code_of_yojson = string_of_yojson

let transfer_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     privacy_protect_billing_contact =
       option_of_yojson (value_for_key boolean__of_yojson "PrivacyProtectBillingContact") _list path;
     billing_contact =
       option_of_yojson (value_for_key contact_detail_of_yojson "BillingContact") _list path;
     privacy_protect_tech_contact =
       option_of_yojson (value_for_key boolean__of_yojson "PrivacyProtectTechContact") _list path;
     privacy_protect_registrant_contact =
       option_of_yojson
         (value_for_key boolean__of_yojson "PrivacyProtectRegistrantContact")
         _list path;
     privacy_protect_admin_contact =
       option_of_yojson (value_for_key boolean__of_yojson "PrivacyProtectAdminContact") _list path;
     tech_contact = value_for_key contact_detail_of_yojson "TechContact" _list path;
     registrant_contact = value_for_key contact_detail_of_yojson "RegistrantContact" _list path;
     admin_contact = value_for_key contact_detail_of_yojson "AdminContact" _list path;
     auto_renew = option_of_yojson (value_for_key boolean__of_yojson "AutoRenew") _list path;
     auth_code = option_of_yojson (value_for_key domain_auth_code_of_yojson "AuthCode") _list path;
     nameservers =
       option_of_yojson (value_for_key nameserver_list_of_yojson "Nameservers") _list path;
     duration_in_years =
       option_of_yojson (value_for_key duration_in_years_of_yojson "DurationInYears") _list path;
     idn_lang_code = option_of_yojson (value_for_key lang_code_of_yojson "IdnLangCode") _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
   }
    : transfer_domain_request)

let domain_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : domain_limit_exceeded)

let tld_name_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let tld_in_maintenance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tld = option_of_yojson (value_for_key tld_name_of_yojson "tld") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
   }
    : tld_in_maintenance)

let string__of_yojson = string_of_yojson

let status_flag_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING_SUPPORT_CASE" -> PENDING_SUPPORT_CASE
    | `String "PENDING_PAYMENT_VERIFICATION" -> PENDING_PAYMENT_VERIFICATION
    | `String "PENDING_AUTHORIZATION" -> PENDING_AUTHORIZATION
    | `String "PENDING_CUSTOMER_ACTION" -> PENDING_CUSTOMER_ACTION
    | `String "PENDING_ACCEPTANCE" -> PENDING_ACCEPTANCE
    | `String value -> raise (deserialize_unknown_enum_value_error path "StatusFlag" value)
    | _ -> raise (deserialize_wrong_type_error path "StatusFlag")
     : status_flag)
    : status_flag)

let sort_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "DESC" -> DESC
    | `String "ASC" -> ASC
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")
     : sort_order)
    : sort_order)

let list_domains_attribute_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Expiry" -> Expiry
    | `String "DomainName" -> DomainName
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ListDomainsAttributeName" value)
    | _ -> raise (deserialize_wrong_type_error path "ListDomainsAttributeName")
     : list_domains_attribute_name)
    : list_domains_attribute_name)

let sort_condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order = value_for_key sort_order_of_yojson "SortOrder" _list path;
     name = value_for_key list_domains_attribute_name_of_yojson "Name" _list path;
   }
    : sort_condition)

let retrieve_domain_auth_code_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ auth_code = option_of_yojson (value_for_key domain_auth_code_of_yojson "AuthCode") _list path }
    : retrieve_domain_auth_code_response)

let retrieve_domain_auth_code_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_name = value_for_key domain_name_of_yojson "DomainName" _list path }
    : retrieve_domain_auth_code_request)

let resend_operation_authorization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation_id = value_for_key operation_id_of_yojson "OperationId" _list path }
    : resend_operation_authorization_request)

let resend_contact_reachability_email_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_already_verified =
       option_of_yojson (value_for_key boolean__of_yojson "isAlreadyVerified") _list path;
     email_address = option_of_yojson (value_for_key email_of_yojson "emailAddress") _list path;
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "domainName") _list path;
   }
    : resend_contact_reachability_email_response)

let resend_contact_reachability_email_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_name = option_of_yojson (value_for_key domain_name_of_yojson "domainName") _list path }
    : resend_contact_reachability_email_request)

let renew_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : renew_domain_response)

let current_expiry_year_of_yojson = int_of_yojson

let renew_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     current_expiry_year =
       value_for_key current_expiry_year_of_yojson "CurrentExpiryYear" _list path;
     duration_in_years =
       option_of_yojson (value_for_key duration_in_years_of_yojson "DurationInYears") _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
   }
    : renew_domain_request)

let reject_domain_transfer_from_another_aws_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : reject_domain_transfer_from_another_aws_account_response)

let reject_domain_transfer_from_another_aws_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_name = value_for_key domain_name_of_yojson "DomainName" _list path }
    : reject_domain_transfer_from_another_aws_account_request)

let register_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : register_domain_response)

let register_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     privacy_protect_billing_contact =
       option_of_yojson (value_for_key boolean__of_yojson "PrivacyProtectBillingContact") _list path;
     billing_contact =
       option_of_yojson (value_for_key contact_detail_of_yojson "BillingContact") _list path;
     privacy_protect_tech_contact =
       option_of_yojson (value_for_key boolean__of_yojson "PrivacyProtectTechContact") _list path;
     privacy_protect_registrant_contact =
       option_of_yojson
         (value_for_key boolean__of_yojson "PrivacyProtectRegistrantContact")
         _list path;
     privacy_protect_admin_contact =
       option_of_yojson (value_for_key boolean__of_yojson "PrivacyProtectAdminContact") _list path;
     tech_contact = value_for_key contact_detail_of_yojson "TechContact" _list path;
     registrant_contact = value_for_key contact_detail_of_yojson "RegistrantContact" _list path;
     admin_contact = value_for_key contact_detail_of_yojson "AdminContact" _list path;
     auto_renew = option_of_yojson (value_for_key boolean__of_yojson "AutoRenew") _list path;
     duration_in_years = value_for_key duration_in_years_of_yojson "DurationInYears" _list path;
     idn_lang_code = option_of_yojson (value_for_key lang_code_of_yojson "IdnLangCode") _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
   }
    : register_domain_request)

let label_of_yojson = string_of_yojson

let push_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target = value_for_key label_of_yojson "Target" _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
   }
    : push_domain_request)

let list_tags_for_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tag_list = option_of_yojson (value_for_key tag_list_of_yojson "TagList") _list path }
    : list_tags_for_domain_response)

let list_tags_for_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_name = value_for_key domain_name_of_yojson "DomainName" _list path }
    : list_tags_for_domain_request)

let domain_price_name_of_yojson = string_of_yojson

let price_with_currency_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     currency = value_for_key currency_of_yojson "Currency" _list path;
     price = value_for_key price_of_yojson "Price" _list path;
   }
    : price_with_currency)

let domain_price_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     restoration_price =
       option_of_yojson (value_for_key price_with_currency_of_yojson "RestorationPrice") _list path;
     change_ownership_price =
       option_of_yojson
         (value_for_key price_with_currency_of_yojson "ChangeOwnershipPrice")
         _list path;
     renewal_price =
       option_of_yojson (value_for_key price_with_currency_of_yojson "RenewalPrice") _list path;
     transfer_price =
       option_of_yojson (value_for_key price_with_currency_of_yojson "TransferPrice") _list path;
     registration_price =
       option_of_yojson (value_for_key price_with_currency_of_yojson "RegistrationPrice") _list path;
     name = option_of_yojson (value_for_key domain_price_name_of_yojson "Name") _list path;
   }
    : domain_price)

let domain_price_list_of_yojson tree path = list_of_yojson domain_price_of_yojson tree path

let list_prices_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_marker =
       option_of_yojson (value_for_key page_marker_of_yojson "NextPageMarker") _list path;
     prices = option_of_yojson (value_for_key domain_price_list_of_yojson "Prices") _list path;
   }
    : list_prices_response)

let list_prices_page_max_items_of_yojson = int_of_yojson

let list_prices_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_items =
       option_of_yojson (value_for_key list_prices_page_max_items_of_yojson "MaxItems") _list path;
     marker = option_of_yojson (value_for_key page_marker_of_yojson "Marker") _list path;
     tld = option_of_yojson (value_for_key tld_name_of_yojson "Tld") _list path;
   }
    : list_prices_request)

let operation_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "SUCCESSFUL" -> SUCCESSFUL
    | `String "ERROR" -> ERROR
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "SUBMITTED" -> SUBMITTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OperationStatus")
     : operation_status)
    : operation_status)

let operation_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_date =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedDate") _list path;
     status_flag = option_of_yojson (value_for_key status_flag_of_yojson "StatusFlag") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "DomainName") _list path;
     submitted_date =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmittedDate") _list path;
     type_ = option_of_yojson (value_for_key operation_type_of_yojson "Type") _list path;
     status = option_of_yojson (value_for_key operation_status_of_yojson "Status") _list path;
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : operation_summary)

let operation_summary_list_of_yojson tree path =
  list_of_yojson operation_summary_of_yojson tree path

let list_operations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_marker =
       option_of_yojson (value_for_key page_marker_of_yojson "NextPageMarker") _list path;
     operations =
       option_of_yojson (value_for_key operation_summary_list_of_yojson "Operations") _list path;
   }
    : list_operations_response)

let operation_status_list_of_yojson tree path = list_of_yojson operation_status_of_yojson tree path
let operation_type_list_of_yojson tree path = list_of_yojson operation_type_of_yojson tree path

let list_operations_sort_attribute_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "SubmittedDate" -> SubmittedDate
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ListOperationsSortAttributeName" value)
    | _ -> raise (deserialize_wrong_type_error path "ListOperationsSortAttributeName")
     : list_operations_sort_attribute_name)
    : list_operations_sort_attribute_name)

let list_operations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "SortOrder") _list path;
     sort_by =
       option_of_yojson
         (value_for_key list_operations_sort_attribute_name_of_yojson "SortBy")
         _list path;
     type_ = option_of_yojson (value_for_key operation_type_list_of_yojson "Type") _list path;
     status = option_of_yojson (value_for_key operation_status_list_of_yojson "Status") _list path;
     max_items = option_of_yojson (value_for_key page_max_items_of_yojson "MaxItems") _list path;
     marker = option_of_yojson (value_for_key page_marker_of_yojson "Marker") _list path;
     submitted_since =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmittedSince") _list path;
   }
    : list_operations_request)

let domain_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expiry = option_of_yojson (value_for_key timestamp_of_yojson "Expiry") _list path;
     transfer_lock = option_of_yojson (value_for_key boolean__of_yojson "TransferLock") _list path;
     auto_renew = option_of_yojson (value_for_key boolean__of_yojson "AutoRenew") _list path;
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "DomainName") _list path;
   }
    : domain_summary)

let domain_summary_list_of_yojson tree path = list_of_yojson domain_summary_of_yojson tree path

let list_domains_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_marker =
       option_of_yojson (value_for_key page_marker_of_yojson "NextPageMarker") _list path;
     domains = option_of_yojson (value_for_key domain_summary_list_of_yojson "Domains") _list path;
   }
    : list_domains_response)

let operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "BEGINS_WITH" -> BEGINS_WITH
    | `String "GE" -> GE
    | `String "LE" -> LE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Operator" value)
    | _ -> raise (deserialize_wrong_type_error path "Operator")
     : operator)
    : operator)

let filter_condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values = value_for_key values_of_yojson "Values" _list path;
     operator = value_for_key operator_of_yojson "Operator" _list path;
     name = value_for_key list_domains_attribute_name_of_yojson "Name" _list path;
   }
    : filter_condition)

let filter_conditions_of_yojson tree path = list_of_yojson filter_condition_of_yojson tree path

let list_domains_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_items = option_of_yojson (value_for_key page_max_items_of_yojson "MaxItems") _list path;
     marker = option_of_yojson (value_for_key page_marker_of_yojson "Marker") _list path;
     sort_condition =
       option_of_yojson (value_for_key sort_condition_of_yojson "SortCondition") _list path;
     filter_conditions =
       option_of_yojson (value_for_key filter_conditions_of_yojson "FilterConditions") _list path;
   }
    : list_domains_request)

let get_operation_detail_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_flag = option_of_yojson (value_for_key status_flag_of_yojson "StatusFlag") _list path;
     last_updated_date =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedDate") _list path;
     submitted_date =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmittedDate") _list path;
     type_ = option_of_yojson (value_for_key operation_type_of_yojson "Type") _list path;
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "DomainName") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     status = option_of_yojson (value_for_key operation_status_of_yojson "Status") _list path;
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : get_operation_detail_response)

let get_operation_detail_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation_id = value_for_key operation_id_of_yojson "OperationId" _list path }
    : get_operation_detail_request)

let domain_suggestion_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     availability = option_of_yojson (value_for_key string__of_yojson "Availability") _list path;
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "DomainName") _list path;
   }
    : domain_suggestion)

let domain_suggestions_list_of_yojson tree path =
  list_of_yojson domain_suggestion_of_yojson tree path

let get_domain_suggestions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     suggestions_list =
       option_of_yojson
         (value_for_key domain_suggestions_list_of_yojson "SuggestionsList")
         _list path;
   }
    : get_domain_suggestions_response)

let integer_of_yojson = int_of_yojson

let get_domain_suggestions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     only_available = value_for_key boolean__of_yojson "OnlyAvailable" _list path;
     suggestion_count = value_for_key integer_of_yojson "SuggestionCount" _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
   }
    : get_domain_suggestions_request)

let registrar_name_of_yojson = string_of_yojson
let registrar_who_is_server_of_yojson = string_of_yojson
let registrar_url_of_yojson = string_of_yojson
let registry_domain_id_of_yojson = string_of_yojson
let reseller_of_yojson = string_of_yojson
let dns_sec_of_yojson = string_of_yojson
let domain_status_of_yojson = string_of_yojson
let domain_status_list_of_yojson tree path = list_of_yojson domain_status_of_yojson tree path
let nullable_integer_of_yojson = int_of_yojson
let dnssec_public_key_of_yojson = string_of_yojson

let dnssec_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key string__of_yojson "Id") _list path;
     key_tag = option_of_yojson (value_for_key nullable_integer_of_yojson "KeyTag") _list path;
     digest = option_of_yojson (value_for_key string__of_yojson "Digest") _list path;
     digest_type =
       option_of_yojson (value_for_key nullable_integer_of_yojson "DigestType") _list path;
     public_key =
       option_of_yojson (value_for_key dnssec_public_key_of_yojson "PublicKey") _list path;
     flags = option_of_yojson (value_for_key nullable_integer_of_yojson "Flags") _list path;
     algorithm = option_of_yojson (value_for_key nullable_integer_of_yojson "Algorithm") _list path;
   }
    : dnssec_key)

let dnssec_key_list_of_yojson tree path = list_of_yojson dnssec_key_of_yojson tree path

let get_domain_detail_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billing_privacy =
       option_of_yojson (value_for_key boolean__of_yojson "BillingPrivacy") _list path;
     billing_contact =
       option_of_yojson (value_for_key contact_detail_of_yojson "BillingContact") _list path;
     dnssec_keys =
       option_of_yojson (value_for_key dnssec_key_list_of_yojson "DnssecKeys") _list path;
     status_list =
       option_of_yojson (value_for_key domain_status_list_of_yojson "StatusList") _list path;
     dns_sec = option_of_yojson (value_for_key dns_sec_of_yojson "DnsSec") _list path;
     reseller = option_of_yojson (value_for_key reseller_of_yojson "Reseller") _list path;
     expiration_date =
       option_of_yojson (value_for_key timestamp_of_yojson "ExpirationDate") _list path;
     updated_date = option_of_yojson (value_for_key timestamp_of_yojson "UpdatedDate") _list path;
     creation_date = option_of_yojson (value_for_key timestamp_of_yojson "CreationDate") _list path;
     registry_domain_id =
       option_of_yojson (value_for_key registry_domain_id_of_yojson "RegistryDomainId") _list path;
     abuse_contact_phone =
       option_of_yojson (value_for_key contact_number_of_yojson "AbuseContactPhone") _list path;
     abuse_contact_email =
       option_of_yojson (value_for_key email_of_yojson "AbuseContactEmail") _list path;
     registrar_url =
       option_of_yojson (value_for_key registrar_url_of_yojson "RegistrarUrl") _list path;
     who_is_server =
       option_of_yojson (value_for_key registrar_who_is_server_of_yojson "WhoIsServer") _list path;
     registrar_name =
       option_of_yojson (value_for_key registrar_name_of_yojson "RegistrarName") _list path;
     tech_privacy = option_of_yojson (value_for_key boolean__of_yojson "TechPrivacy") _list path;
     registrant_privacy =
       option_of_yojson (value_for_key boolean__of_yojson "RegistrantPrivacy") _list path;
     admin_privacy = option_of_yojson (value_for_key boolean__of_yojson "AdminPrivacy") _list path;
     tech_contact =
       option_of_yojson (value_for_key contact_detail_of_yojson "TechContact") _list path;
     registrant_contact =
       option_of_yojson (value_for_key contact_detail_of_yojson "RegistrantContact") _list path;
     admin_contact =
       option_of_yojson (value_for_key contact_detail_of_yojson "AdminContact") _list path;
     auto_renew = option_of_yojson (value_for_key boolean__of_yojson "AutoRenew") _list path;
     nameservers =
       option_of_yojson (value_for_key nameserver_list_of_yojson "Nameservers") _list path;
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "DomainName") _list path;
   }
    : get_domain_detail_response)

let get_domain_detail_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_name = value_for_key domain_name_of_yojson "DomainName" _list path }
    : get_domain_detail_request)

let reachability_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXPIRED" -> EXPIRED
    | `String "DONE" -> DONE
    | `String "PENDING" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReachabilityStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ReachabilityStatus")
     : reachability_status)
    : reachability_status)

let get_contact_reachability_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key reachability_status_of_yojson "status") _list path;
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "domainName") _list path;
   }
    : get_contact_reachability_status_response)

let get_contact_reachability_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_name = option_of_yojson (value_for_key domain_name_of_yojson "domainName") _list path }
    : get_contact_reachability_status_request)

let enable_domain_transfer_lock_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : enable_domain_transfer_lock_response)

let enable_domain_transfer_lock_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_name = value_for_key domain_name_of_yojson "DomainName" _list path }
    : enable_domain_transfer_lock_request)

let enable_domain_auto_renew_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let enable_domain_auto_renew_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_name = value_for_key domain_name_of_yojson "DomainName" _list path }
    : enable_domain_auto_renew_request)

let disassociate_delegation_signer_from_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : disassociate_delegation_signer_from_domain_response)

let disassociate_delegation_signer_from_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key string__of_yojson "Id" _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
   }
    : disassociate_delegation_signer_from_domain_request)

let disable_domain_transfer_lock_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : disable_domain_transfer_lock_response)

let disable_domain_transfer_lock_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_name = value_for_key domain_name_of_yojson "DomainName" _list path }
    : disable_domain_transfer_lock_request)

let disable_domain_auto_renew_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disable_domain_auto_renew_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_name = value_for_key domain_name_of_yojson "DomainName" _list path }
    : disable_domain_auto_renew_request)

let delete_tags_for_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_tags_for_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags_to_delete = value_for_key tag_key_list_of_yojson "TagsToDelete" _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
   }
    : delete_tags_for_domain_request)

let delete_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : delete_domain_response)

let delete_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_name = value_for_key domain_name_of_yojson "DomainName" _list path }
    : delete_domain_request)

let domain_transferability_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transferable =
       option_of_yojson (value_for_key transferable_of_yojson "Transferable") _list path;
   }
    : domain_transferability)

let message_of_yojson = string_of_yojson

let check_domain_transferability_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     transferability =
       option_of_yojson
         (value_for_key domain_transferability_of_yojson "Transferability")
         _list path;
   }
    : check_domain_transferability_response)

let check_domain_transferability_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auth_code = option_of_yojson (value_for_key domain_auth_code_of_yojson "AuthCode") _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
   }
    : check_domain_transferability_request)

let domain_availability_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "INVALID_NAME_FOR_TLD" -> INVALID_NAME_FOR_TLD
    | `String "DONT_KNOW" -> DONT_KNOW
    | `String "RESERVED" -> RESERVED
    | `String "UNAVAILABLE_RESTRICTED" -> UNAVAILABLE_RESTRICTED
    | `String "UNAVAILABLE_PREMIUM" -> UNAVAILABLE_PREMIUM
    | `String "UNAVAILABLE" -> UNAVAILABLE
    | `String "AVAILABLE_PREORDER" -> AVAILABLE_PREORDER
    | `String "AVAILABLE_RESERVED" -> AVAILABLE_RESERVED
    | `String "AVAILABLE" -> AVAILABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "DomainAvailability" value)
    | _ -> raise (deserialize_wrong_type_error path "DomainAvailability")
     : domain_availability)
    : domain_availability)

let check_domain_availability_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     availability =
       option_of_yojson (value_for_key domain_availability_of_yojson "Availability") _list path;
   }
    : check_domain_availability_response)

let check_domain_availability_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idn_lang_code = option_of_yojson (value_for_key lang_code_of_yojson "IdnLangCode") _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
   }
    : check_domain_availability_request)

let cancel_domain_transfer_to_another_aws_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : cancel_domain_transfer_to_another_aws_account_response)

let cancel_domain_transfer_to_another_aws_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_name = value_for_key domain_name_of_yojson "DomainName" _list path }
    : cancel_domain_transfer_to_another_aws_account_request)

let dnssec_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : dnssec_limit_exceeded)

let associate_delegation_signer_to_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : associate_delegation_signer_to_domain_response)

let dnssec_signing_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     public_key =
       option_of_yojson (value_for_key dnssec_public_key_of_yojson "PublicKey") _list path;
     flags = option_of_yojson (value_for_key nullable_integer_of_yojson "Flags") _list path;
     algorithm = option_of_yojson (value_for_key nullable_integer_of_yojson "Algorithm") _list path;
   }
    : dnssec_signing_attributes)

let associate_delegation_signer_to_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     signing_attributes =
       value_for_key dnssec_signing_attributes_of_yojson "SigningAttributes" _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
   }
    : associate_delegation_signer_to_domain_request)

let accept_domain_transfer_from_another_aws_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : accept_domain_transfer_from_another_aws_account_response)

let accept_domain_transfer_from_another_aws_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     password = value_for_key password_of_yojson "Password" _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
   }
    : accept_domain_transfer_from_another_aws_account_request)
