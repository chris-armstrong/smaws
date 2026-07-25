open Smaws_Lib.Json.DeserializeHelpers
open Types

let error_message_of_yojson = string_of_yojson

let unsupported_tl_d_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : unsupported_tl_d)

let operation_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : operation_limit_exceeded)

let invalid_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_input)

let domain_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : domain_limit_exceeded)

let operation_id_of_yojson = string_of_yojson

let accept_domain_transfer_from_another_aws_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : accept_domain_transfer_from_another_aws_account_response)

let password_of_yojson = string_of_yojson
let domain_name_of_yojson = string_of_yojson

let accept_domain_transfer_from_another_aws_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
     password = value_for_key password_of_yojson "Password" _list path;
   }
    : accept_domain_transfer_from_another_aws_account_request)

let account_id_of_yojson = string_of_yojson
let address_line_of_yojson = string_of_yojson

let tld_rules_violation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : tld_rules_violation)

let request_id_of_yojson = string_of_yojson

let duplicate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id = option_of_yojson (value_for_key request_id_of_yojson "requestId") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
   }
    : duplicate_request)

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

let dnssec_public_key_of_yojson = string_of_yojson
let nullable_integer_of_yojson = int_of_yojson

let dnssec_signing_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     algorithm = option_of_yojson (value_for_key nullable_integer_of_yojson "Algorithm") _list path;
     flags = option_of_yojson (value_for_key nullable_integer_of_yojson "Flags") _list path;
     public_key =
       option_of_yojson (value_for_key dnssec_public_key_of_yojson "PublicKey") _list path;
   }
    : dnssec_signing_attributes)

let associate_delegation_signer_to_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
     signing_attributes =
       value_for_key dnssec_signing_attributes_of_yojson "SigningAttributes" _list path;
   }
    : associate_delegation_signer_to_domain_request)

let price_of_yojson = double_of_yojson
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let invoice_id_of_yojson = string_of_yojson

let operation_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "REGISTER_DOMAIN" -> REGISTER_DOMAIN
    | `String "DELETE_DOMAIN" -> DELETE_DOMAIN
    | `String "TRANSFER_IN_DOMAIN" -> TRANSFER_IN_DOMAIN
    | `String "UPDATE_DOMAIN_CONTACT" -> UPDATE_DOMAIN_CONTACT
    | `String "UPDATE_NAMESERVER" -> UPDATE_NAMESERVER
    | `String "CHANGE_PRIVACY_PROTECTION" -> CHANGE_PRIVACY_PROTECTION
    | `String "DOMAIN_LOCK" -> DOMAIN_LOCK
    | `String "ENABLE_AUTORENEW" -> ENABLE_AUTORENEW
    | `String "DISABLE_AUTORENEW" -> DISABLE_AUTORENEW
    | `String "ADD_DNSSEC" -> ADD_DNSSEC
    | `String "REMOVE_DNSSEC" -> REMOVE_DNSSEC
    | `String "EXPIRE_DOMAIN" -> EXPIRE_DOMAIN
    | `String "TRANSFER_OUT_DOMAIN" -> TRANSFER_OUT_DOMAIN
    | `String "CHANGE_DOMAIN_OWNER" -> CHANGE_DOMAIN_OWNER
    | `String "RENEW_DOMAIN" -> RENEW_DOMAIN
    | `String "PUSH_DOMAIN" -> PUSH_DOMAIN
    | `String "INTERNAL_TRANSFER_OUT_DOMAIN" -> INTERNAL_TRANSFER_OUT_DOMAIN
    | `String "INTERNAL_TRANSFER_IN_DOMAIN" -> INTERNAL_TRANSFER_IN_DOMAIN
    | `String "RELEASE_TO_GANDI" -> RELEASE_TO_GANDI
    | `String "TRANSFER_ON_RENEW" -> TRANSFER_ON_RENEW
    | `String "RESTORE_DOMAIN" -> RESTORE_DOMAIN
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperationType" value)
    | _ -> raise (deserialize_wrong_type_error path "OperationType")
     : operation_type)
    : operation_type)

let billing_record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "DomainName") _list path;
     operation = option_of_yojson (value_for_key operation_type_of_yojson "Operation") _list path;
     invoice_id = option_of_yojson (value_for_key invoice_id_of_yojson "InvoiceId") _list path;
     bill_date = option_of_yojson (value_for_key timestamp_of_yojson "BillDate") _list path;
     price = option_of_yojson (value_for_key price_of_yojson "Price") _list path;
   }
    : billing_record)

let billing_records_of_yojson tree path = list_of_yojson billing_record_of_yojson tree path
let boolean__of_yojson = bool_of_yojson

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

let tld_name_of_yojson = string_of_yojson

let tld_in_maintenance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
     tld = option_of_yojson (value_for_key tld_name_of_yojson "tld") _list path;
   }
    : tld_in_maintenance)

let domain_availability_of_yojson (tree : t) path =
  ((match tree with
    | `String "AVAILABLE" -> AVAILABLE
    | `String "AVAILABLE_RESERVED" -> AVAILABLE_RESERVED
    | `String "AVAILABLE_PREORDER" -> AVAILABLE_PREORDER
    | `String "UNAVAILABLE" -> UNAVAILABLE
    | `String "UNAVAILABLE_PREMIUM" -> UNAVAILABLE_PREMIUM
    | `String "UNAVAILABLE_RESTRICTED" -> UNAVAILABLE_RESTRICTED
    | `String "RESERVED" -> RESERVED
    | `String "DONT_KNOW" -> DONT_KNOW
    | `String "INVALID_NAME_FOR_TLD" -> INVALID_NAME_FOR_TLD
    | `String "PENDING" -> PENDING
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

let lang_code_of_yojson = string_of_yojson

let check_domain_availability_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
     idn_lang_code = option_of_yojson (value_for_key lang_code_of_yojson "IdnLangCode") _list path;
   }
    : check_domain_availability_request)

let message_of_yojson = string_of_yojson

let transferable_of_yojson (tree : t) path =
  ((match tree with
    | `String "TRANSFERABLE" -> TRANSFERABLE
    | `String "UNTRANSFERABLE" -> UNTRANSFERABLE
    | `String "DONT_KNOW" -> DONT_KNOW
    | `String "DOMAIN_IN_OWN_ACCOUNT" -> DOMAIN_IN_OWN_ACCOUNT
    | `String "DOMAIN_IN_ANOTHER_ACCOUNT" -> DOMAIN_IN_ANOTHER_ACCOUNT
    | `String "PREMIUM_DOMAIN" -> PREMIUM_DOMAIN
    | `String value -> raise (deserialize_unknown_enum_value_error path "Transferable" value)
    | _ -> raise (deserialize_wrong_type_error path "Transferable")
     : transferable)
    : transferable)

let domain_transferability_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transferable =
       option_of_yojson (value_for_key transferable_of_yojson "Transferable") _list path;
   }
    : domain_transferability)

let check_domain_transferability_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transferability =
       option_of_yojson
         (value_for_key domain_transferability_of_yojson "Transferability")
         _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
   }
    : check_domain_transferability_response)

let domain_auth_code_of_yojson = string_of_yojson

let check_domain_transferability_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
     auth_code = option_of_yojson (value_for_key domain_auth_code_of_yojson "AuthCode") _list path;
   }
    : check_domain_transferability_request)

let city_of_yojson = string_of_yojson
let currency_of_yojson = string_of_yojson

let consent_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_price = value_for_key price_of_yojson "MaxPrice" _list path;
     currency = value_for_key currency_of_yojson "Currency" _list path;
   }
    : consent)

let extra_param_value_of_yojson = string_of_yojson

let extra_param_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "DUNS_NUMBER" -> DUNS_NUMBER
    | `String "BRAND_NUMBER" -> BRAND_NUMBER
    | `String "BIRTH_DEPARTMENT" -> BIRTH_DEPARTMENT
    | `String "BIRTH_DATE_IN_YYYY_MM_DD" -> BIRTH_DATE_IN_YYYY_MM_DD
    | `String "BIRTH_COUNTRY" -> BIRTH_COUNTRY
    | `String "BIRTH_CITY" -> BIRTH_CITY
    | `String "DOCUMENT_NUMBER" -> DOCUMENT_NUMBER
    | `String "AU_ID_NUMBER" -> AU_ID_NUMBER
    | `String "AU_ID_TYPE" -> AU_ID_TYPE
    | `String "CA_LEGAL_TYPE" -> CA_LEGAL_TYPE
    | `String "CA_BUSINESS_ENTITY_TYPE" -> CA_BUSINESS_ENTITY_TYPE
    | `String "CA_LEGAL_REPRESENTATIVE" -> CA_LEGAL_REPRESENTATIVE
    | `String "CA_LEGAL_REPRESENTATIVE_CAPACITY" -> CA_LEGAL_REPRESENTATIVE_CAPACITY
    | `String "ES_IDENTIFICATION" -> ES_IDENTIFICATION
    | `String "ES_IDENTIFICATION_TYPE" -> ES_IDENTIFICATION_TYPE
    | `String "ES_LEGAL_FORM" -> ES_LEGAL_FORM
    | `String "FI_BUSINESS_NUMBER" -> FI_BUSINESS_NUMBER
    | `String "FI_ID_NUMBER" -> ONWER_FI_ID_NUMBER
    | `String "FI_NATIONALITY" -> FI_NATIONALITY
    | `String "FI_ORGANIZATION_TYPE" -> FI_ORGANIZATION_TYPE
    | `String "IT_NATIONALITY" -> IT_NATIONALITY
    | `String "IT_PIN" -> IT_PIN
    | `String "IT_REGISTRANT_ENTITY_TYPE" -> IT_REGISTRANT_ENTITY_TYPE
    | `String "RU_PASSPORT_DATA" -> RU_PASSPORT_DATA
    | `String "SE_ID_NUMBER" -> SE_ID_NUMBER
    | `String "SG_ID_NUMBER" -> SG_ID_NUMBER
    | `String "VAT_NUMBER" -> VAT_NUMBER
    | `String "UK_CONTACT_TYPE" -> UK_CONTACT_TYPE
    | `String "UK_COMPANY_NUMBER" -> UK_COMPANY_NUMBER
    | `String "EU_COUNTRY_OF_CITIZENSHIP" -> EU_COUNTRY_OF_CITIZENSHIP
    | `String "AU_PRIORITY_TOKEN" -> AU_PRIORITY_TOKEN
    | `String "AU_ELIGIBILITY_TYPE" -> AU_ELIGIBILITY_TYPE
    | `String "AU_POLICY_REASON" -> AU_POLICY_REASON
    | `String "AU_REGISTRANT_NAME" -> AU_REGISTRANT_NAME
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExtraParamName" value)
    | _ -> raise (deserialize_wrong_type_error path "ExtraParamName")
     : extra_param_name)
    : extra_param_name)

let extra_param_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key extra_param_name_of_yojson "Name" _list path;
     value = value_for_key extra_param_value_of_yojson "Value" _list path;
   }
    : extra_param)

let extra_param_list_of_yojson tree path = list_of_yojson extra_param_of_yojson tree path
let contact_number_of_yojson = string_of_yojson
let email_of_yojson = string_of_yojson
let zip_code_of_yojson = string_of_yojson

let country_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "AC" -> AC
    | `String "AD" -> AD
    | `String "AE" -> AE
    | `String "AF" -> AF
    | `String "AG" -> AG
    | `String "AI" -> AI
    | `String "AL" -> AL
    | `String "AM" -> AM
    | `String "AN" -> AN
    | `String "AO" -> AO
    | `String "AQ" -> AQ
    | `String "AR" -> AR
    | `String "AS" -> AS
    | `String "AT" -> AT
    | `String "AU" -> AU
    | `String "AW" -> AW
    | `String "AX" -> AX
    | `String "AZ" -> AZ
    | `String "BA" -> BA
    | `String "BB" -> BB
    | `String "BD" -> BD
    | `String "BE" -> BE
    | `String "BF" -> BF
    | `String "BG" -> BG
    | `String "BH" -> BH
    | `String "BI" -> BI
    | `String "BJ" -> BJ
    | `String "BL" -> BL
    | `String "BM" -> BM
    | `String "BN" -> BN
    | `String "BO" -> BO
    | `String "BQ" -> BQ
    | `String "BR" -> BR
    | `String "BS" -> BS
    | `String "BT" -> BT
    | `String "BV" -> BV
    | `String "BW" -> BW
    | `String "BY" -> BY
    | `String "BZ" -> BZ
    | `String "CA" -> CA
    | `String "CC" -> CC
    | `String "CD" -> CD
    | `String "CF" -> CF
    | `String "CG" -> CG
    | `String "CH" -> CH
    | `String "CI" -> CI
    | `String "CK" -> CK
    | `String "CL" -> CL
    | `String "CM" -> CM
    | `String "CN" -> CN
    | `String "CO" -> CO
    | `String "CR" -> CR
    | `String "CU" -> CU
    | `String "CV" -> CV
    | `String "CW" -> CW
    | `String "CX" -> CX
    | `String "CY" -> CY
    | `String "CZ" -> CZ
    | `String "DE" -> DE
    | `String "DJ" -> DJ
    | `String "DK" -> DK
    | `String "DM" -> DM
    | `String "DO" -> DO
    | `String "DZ" -> DZ
    | `String "EC" -> EC
    | `String "EE" -> EE
    | `String "EG" -> EG
    | `String "EH" -> EH
    | `String "ER" -> ER
    | `String "ES" -> ES
    | `String "ET" -> ET
    | `String "FI" -> FI
    | `String "FJ" -> FJ
    | `String "FK" -> FK
    | `String "FM" -> FM
    | `String "FO" -> FO
    | `String "FR" -> FR
    | `String "GA" -> GA
    | `String "GB" -> GB
    | `String "GD" -> GD
    | `String "GE" -> GE
    | `String "GF" -> GF
    | `String "GG" -> GG
    | `String "GH" -> GH
    | `String "GI" -> GI
    | `String "GL" -> GL
    | `String "GM" -> GM
    | `String "GN" -> GN
    | `String "GP" -> GP
    | `String "GQ" -> GQ
    | `String "GR" -> GR
    | `String "GS" -> GS
    | `String "GT" -> GT
    | `String "GU" -> GU
    | `String "GW" -> GW
    | `String "GY" -> GY
    | `String "HK" -> HK
    | `String "HM" -> HM
    | `String "HN" -> HN
    | `String "HR" -> HR
    | `String "HT" -> HT
    | `String "HU" -> HU
    | `String "ID" -> ID
    | `String "IE" -> IE
    | `String "IL" -> IL
    | `String "IM" -> IM
    | `String "IN" -> IN
    | `String "IO" -> IO
    | `String "IQ" -> IQ
    | `String "IR" -> IR
    | `String "IS" -> IS
    | `String "IT" -> IT
    | `String "JE" -> JE
    | `String "JM" -> JM
    | `String "JO" -> JO
    | `String "JP" -> JP
    | `String "KE" -> KE
    | `String "KG" -> KG
    | `String "KH" -> KH
    | `String "KI" -> KI
    | `String "KM" -> KM
    | `String "KN" -> KN
    | `String "KP" -> KP
    | `String "KR" -> KR
    | `String "KW" -> KW
    | `String "KY" -> KY
    | `String "KZ" -> KZ
    | `String "LA" -> LA
    | `String "LB" -> LB
    | `String "LC" -> LC
    | `String "LI" -> LI
    | `String "LK" -> LK
    | `String "LR" -> LR
    | `String "LS" -> LS
    | `String "LT" -> LT
    | `String "LU" -> LU
    | `String "LV" -> LV
    | `String "LY" -> LY
    | `String "MA" -> MA
    | `String "MC" -> MC
    | `String "MD" -> MD
    | `String "ME" -> ME
    | `String "MF" -> MF
    | `String "MG" -> MG
    | `String "MH" -> MH
    | `String "MK" -> MK
    | `String "ML" -> ML
    | `String "MM" -> MM
    | `String "MN" -> MN
    | `String "MO" -> MO
    | `String "MP" -> MP
    | `String "MQ" -> MQ
    | `String "MR" -> MR
    | `String "MS" -> MS
    | `String "MT" -> MT
    | `String "MU" -> MU
    | `String "MV" -> MV
    | `String "MW" -> MW
    | `String "MX" -> MX
    | `String "MY" -> MY
    | `String "MZ" -> MZ
    | `String "NA" -> NA
    | `String "NC" -> NC
    | `String "NE" -> NE
    | `String "NF" -> NF
    | `String "NG" -> NG
    | `String "NI" -> NI
    | `String "NL" -> NL
    | `String "NO" -> NO
    | `String "NP" -> NP
    | `String "NR" -> NR
    | `String "NU" -> NU
    | `String "NZ" -> NZ
    | `String "OM" -> OM
    | `String "PA" -> PA
    | `String "PE" -> PE
    | `String "PF" -> PF
    | `String "PG" -> PG
    | `String "PH" -> PH
    | `String "PK" -> PK
    | `String "PL" -> PL
    | `String "PM" -> PM
    | `String "PN" -> PN
    | `String "PR" -> PR
    | `String "PS" -> PS
    | `String "PT" -> PT
    | `String "PW" -> PW
    | `String "PY" -> PY
    | `String "QA" -> QA
    | `String "RE" -> RE
    | `String "RO" -> RO
    | `String "RS" -> RS
    | `String "RU" -> RU
    | `String "RW" -> RW
    | `String "SA" -> SA
    | `String "SB" -> SB
    | `String "SC" -> SC
    | `String "SD" -> SD
    | `String "SE" -> SE
    | `String "SG" -> SG
    | `String "SH" -> SH
    | `String "SI" -> SI
    | `String "SJ" -> SJ
    | `String "SK" -> SK
    | `String "SL" -> SL
    | `String "SM" -> SM
    | `String "SN" -> SN
    | `String "SO" -> SO
    | `String "SR" -> SR
    | `String "SS" -> SS
    | `String "ST" -> ST
    | `String "SV" -> SV
    | `String "SX" -> SX
    | `String "SY" -> SY
    | `String "SZ" -> SZ
    | `String "TC" -> TC
    | `String "TD" -> TD
    | `String "TF" -> TF
    | `String "TG" -> TG
    | `String "TH" -> TH
    | `String "TJ" -> TJ
    | `String "TK" -> TK
    | `String "TL" -> TL
    | `String "TM" -> TM
    | `String "TN" -> TN
    | `String "TO" -> TO
    | `String "TP" -> TP
    | `String "TR" -> TR
    | `String "TT" -> TT
    | `String "TV" -> TV
    | `String "TW" -> TW
    | `String "TZ" -> TZ
    | `String "UA" -> UA
    | `String "UG" -> UG
    | `String "US" -> US
    | `String "UY" -> UY
    | `String "UZ" -> UZ
    | `String "VA" -> VA
    | `String "VC" -> VC
    | `String "VE" -> VE
    | `String "VG" -> VG
    | `String "VI" -> VI
    | `String "VN" -> VN
    | `String "VU" -> VU
    | `String "WF" -> WF
    | `String "WS" -> WS
    | `String "YE" -> YE
    | `String "YT" -> YT
    | `String "ZA" -> ZA
    | `String "ZM" -> ZM
    | `String "ZW" -> ZW
    | `String value -> raise (deserialize_unknown_enum_value_error path "CountryCode" value)
    | _ -> raise (deserialize_wrong_type_error path "CountryCode")
     : country_code)
    : country_code)

let state_of_yojson = string_of_yojson
let contact_name_of_yojson = string_of_yojson

let contact_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PERSON" -> PERSON
    | `String "COMPANY" -> COMPANY
    | `String "ASSOCIATION" -> ASSOCIATION
    | `String "PUBLIC_BODY" -> PUBLIC_BODY
    | `String "RESELLER" -> RESELLER
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContactType" value)
    | _ -> raise (deserialize_wrong_type_error path "ContactType")
     : contact_type)
    : contact_type)

let contact_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     first_name = option_of_yojson (value_for_key contact_name_of_yojson "FirstName") _list path;
     last_name = option_of_yojson (value_for_key contact_name_of_yojson "LastName") _list path;
     contact_type = option_of_yojson (value_for_key contact_type_of_yojson "ContactType") _list path;
     organization_name =
       option_of_yojson (value_for_key contact_name_of_yojson "OrganizationName") _list path;
     address_line1 =
       option_of_yojson (value_for_key address_line_of_yojson "AddressLine1") _list path;
     address_line2 =
       option_of_yojson (value_for_key address_line_of_yojson "AddressLine2") _list path;
     city = option_of_yojson (value_for_key city_of_yojson "City") _list path;
     state = option_of_yojson (value_for_key state_of_yojson "State") _list path;
     country_code = option_of_yojson (value_for_key country_code_of_yojson "CountryCode") _list path;
     zip_code = option_of_yojson (value_for_key zip_code_of_yojson "ZipCode") _list path;
     phone_number =
       option_of_yojson (value_for_key contact_number_of_yojson "PhoneNumber") _list path;
     email = option_of_yojson (value_for_key email_of_yojson "Email") _list path;
     fax = option_of_yojson (value_for_key contact_number_of_yojson "Fax") _list path;
     extra_params =
       option_of_yojson (value_for_key extra_param_list_of_yojson "ExtraParams") _list path;
   }
    : contact_detail)

let current_expiry_year_of_yojson = int_of_yojson
let dns_sec_of_yojson = string_of_yojson

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

let delete_tags_for_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let delete_tags_for_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
     tags_to_delete = value_for_key tag_key_list_of_yojson "TagsToDelete" _list path;
   }
    : delete_tags_for_domain_request)

let disable_domain_auto_renew_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disable_domain_auto_renew_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_name = value_for_key domain_name_of_yojson "DomainName" _list path }
    : disable_domain_auto_renew_request)

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

let disassociate_delegation_signer_from_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : disassociate_delegation_signer_from_domain_response)

let string__of_yojson = string_of_yojson

let disassociate_delegation_signer_from_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
     id = value_for_key string__of_yojson "Id" _list path;
   }
    : disassociate_delegation_signer_from_domain_request)

let dnssec_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     algorithm = option_of_yojson (value_for_key nullable_integer_of_yojson "Algorithm") _list path;
     flags = option_of_yojson (value_for_key nullable_integer_of_yojson "Flags") _list path;
     public_key =
       option_of_yojson (value_for_key dnssec_public_key_of_yojson "PublicKey") _list path;
     digest_type =
       option_of_yojson (value_for_key nullable_integer_of_yojson "DigestType") _list path;
     digest = option_of_yojson (value_for_key string__of_yojson "Digest") _list path;
     key_tag = option_of_yojson (value_for_key nullable_integer_of_yojson "KeyTag") _list path;
     id = option_of_yojson (value_for_key string__of_yojson "Id") _list path;
   }
    : dnssec_key)

let dnssec_key_list_of_yojson tree path = list_of_yojson dnssec_key_of_yojson tree path

let price_with_currency_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     price = value_for_key price_of_yojson "Price" _list path;
     currency = value_for_key currency_of_yojson "Currency" _list path;
   }
    : price_with_currency)

let domain_price_name_of_yojson = string_of_yojson

let domain_price_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key domain_price_name_of_yojson "Name") _list path;
     registration_price =
       option_of_yojson (value_for_key price_with_currency_of_yojson "RegistrationPrice") _list path;
     transfer_price =
       option_of_yojson (value_for_key price_with_currency_of_yojson "TransferPrice") _list path;
     renewal_price =
       option_of_yojson (value_for_key price_with_currency_of_yojson "RenewalPrice") _list path;
     change_ownership_price =
       option_of_yojson
         (value_for_key price_with_currency_of_yojson "ChangeOwnershipPrice")
         _list path;
     restoration_price =
       option_of_yojson (value_for_key price_with_currency_of_yojson "RestorationPrice") _list path;
   }
    : domain_price)

let domain_price_list_of_yojson tree path = list_of_yojson domain_price_of_yojson tree path
let domain_status_of_yojson = string_of_yojson
let domain_status_list_of_yojson tree path = list_of_yojson domain_status_of_yojson tree path

let domain_suggestion_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "DomainName") _list path;
     availability = option_of_yojson (value_for_key string__of_yojson "Availability") _list path;
   }
    : domain_suggestion)

let domain_suggestions_list_of_yojson tree path =
  list_of_yojson domain_suggestion_of_yojson tree path

let domain_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "DomainName") _list path;
     auto_renew = option_of_yojson (value_for_key boolean__of_yojson "AutoRenew") _list path;
     transfer_lock = option_of_yojson (value_for_key boolean__of_yojson "TransferLock") _list path;
     expiry = option_of_yojson (value_for_key timestamp_of_yojson "Expiry") _list path;
   }
    : domain_summary)

let domain_summary_list_of_yojson tree path = list_of_yojson domain_summary_of_yojson tree path
let duration_in_years_of_yojson = int_of_yojson

let enable_domain_auto_renew_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let enable_domain_auto_renew_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_name = value_for_key domain_name_of_yojson "DomainName" _list path }
    : enable_domain_auto_renew_request)

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

let fi_auth_key_of_yojson = string_of_yojson
let value_of_yojson = string_of_yojson
let values_of_yojson tree path = list_of_yojson value_of_yojson tree path

let operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "LE" -> LE
    | `String "GE" -> GE
    | `String "BEGINS_WITH" -> BEGINS_WITH
    | `String value -> raise (deserialize_unknown_enum_value_error path "Operator" value)
    | _ -> raise (deserialize_wrong_type_error path "Operator")
     : operator)
    : operator)

let list_domains_attribute_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "DomainName" -> DomainName
    | `String "Expiry" -> Expiry
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ListDomainsAttributeName" value)
    | _ -> raise (deserialize_wrong_type_error path "ListDomainsAttributeName")
     : list_domains_attribute_name)
    : list_domains_attribute_name)

let filter_condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key list_domains_attribute_name_of_yojson "Name" _list path;
     operator = value_for_key operator_of_yojson "Operator" _list path;
     values = value_for_key values_of_yojson "Values" _list path;
   }
    : filter_condition)

let filter_conditions_of_yojson tree path = list_of_yojson filter_condition_of_yojson tree path

let reachability_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "DONE" -> DONE
    | `String "EXPIRED" -> EXPIRED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReachabilityStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ReachabilityStatus")
     : reachability_status)
    : reachability_status)

let get_contact_reachability_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "domainName") _list path;
     status = option_of_yojson (value_for_key reachability_status_of_yojson "status") _list path;
   }
    : get_contact_reachability_status_response)

let get_contact_reachability_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_name = option_of_yojson (value_for_key domain_name_of_yojson "domainName") _list path }
    : get_contact_reachability_status_request)

let reseller_of_yojson = string_of_yojson
let registry_domain_id_of_yojson = string_of_yojson
let registrar_url_of_yojson = string_of_yojson
let registrar_who_is_server_of_yojson = string_of_yojson
let registrar_name_of_yojson = string_of_yojson
let glue_ip_of_yojson = string_of_yojson
let glue_ip_list_of_yojson tree path = list_of_yojson glue_ip_of_yojson tree path
let host_name_of_yojson = string_of_yojson

let nameserver_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key host_name_of_yojson "Name" _list path;
     glue_ips = option_of_yojson (value_for_key glue_ip_list_of_yojson "GlueIps") _list path;
   }
    : nameserver)

let nameserver_list_of_yojson tree path = list_of_yojson nameserver_of_yojson tree path

let get_domain_detail_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "DomainName") _list path;
     nameservers =
       option_of_yojson (value_for_key nameserver_list_of_yojson "Nameservers") _list path;
     auto_renew = option_of_yojson (value_for_key boolean__of_yojson "AutoRenew") _list path;
     admin_contact =
       option_of_yojson (value_for_key contact_detail_of_yojson "AdminContact") _list path;
     registrant_contact =
       option_of_yojson (value_for_key contact_detail_of_yojson "RegistrantContact") _list path;
     tech_contact =
       option_of_yojson (value_for_key contact_detail_of_yojson "TechContact") _list path;
     admin_privacy = option_of_yojson (value_for_key boolean__of_yojson "AdminPrivacy") _list path;
     registrant_privacy =
       option_of_yojson (value_for_key boolean__of_yojson "RegistrantPrivacy") _list path;
     tech_privacy = option_of_yojson (value_for_key boolean__of_yojson "TechPrivacy") _list path;
     registrar_name =
       option_of_yojson (value_for_key registrar_name_of_yojson "RegistrarName") _list path;
     who_is_server =
       option_of_yojson (value_for_key registrar_who_is_server_of_yojson "WhoIsServer") _list path;
     registrar_url =
       option_of_yojson (value_for_key registrar_url_of_yojson "RegistrarUrl") _list path;
     abuse_contact_email =
       option_of_yojson (value_for_key email_of_yojson "AbuseContactEmail") _list path;
     abuse_contact_phone =
       option_of_yojson (value_for_key contact_number_of_yojson "AbuseContactPhone") _list path;
     registry_domain_id =
       option_of_yojson (value_for_key registry_domain_id_of_yojson "RegistryDomainId") _list path;
     creation_date = option_of_yojson (value_for_key timestamp_of_yojson "CreationDate") _list path;
     updated_date = option_of_yojson (value_for_key timestamp_of_yojson "UpdatedDate") _list path;
     expiration_date =
       option_of_yojson (value_for_key timestamp_of_yojson "ExpirationDate") _list path;
     reseller = option_of_yojson (value_for_key reseller_of_yojson "Reseller") _list path;
     dns_sec = option_of_yojson (value_for_key dns_sec_of_yojson "DnsSec") _list path;
     status_list =
       option_of_yojson (value_for_key domain_status_list_of_yojson "StatusList") _list path;
     dnssec_keys =
       option_of_yojson (value_for_key dnssec_key_list_of_yojson "DnssecKeys") _list path;
     billing_contact =
       option_of_yojson (value_for_key contact_detail_of_yojson "BillingContact") _list path;
     billing_privacy =
       option_of_yojson (value_for_key boolean__of_yojson "BillingPrivacy") _list path;
   }
    : get_domain_detail_response)

let get_domain_detail_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_name = value_for_key domain_name_of_yojson "DomainName" _list path }
    : get_domain_detail_request)

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
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
     suggestion_count = value_for_key integer_of_yojson "SuggestionCount" _list path;
     only_available = value_for_key boolean__of_yojson "OnlyAvailable" _list path;
   }
    : get_domain_suggestions_request)

let status_flag_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING_ACCEPTANCE" -> PENDING_ACCEPTANCE
    | `String "PENDING_CUSTOMER_ACTION" -> PENDING_CUSTOMER_ACTION
    | `String "PENDING_AUTHORIZATION" -> PENDING_AUTHORIZATION
    | `String "PENDING_PAYMENT_VERIFICATION" -> PENDING_PAYMENT_VERIFICATION
    | `String "PENDING_SUPPORT_CASE" -> PENDING_SUPPORT_CASE
    | `String value -> raise (deserialize_unknown_enum_value_error path "StatusFlag" value)
    | _ -> raise (deserialize_wrong_type_error path "StatusFlag")
     : status_flag)
    : status_flag)

let operation_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUBMITTED" -> SUBMITTED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "ERROR" -> ERROR
    | `String "SUCCESSFUL" -> SUCCESSFUL
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OperationStatus")
     : operation_status)
    : operation_status)

let get_operation_detail_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
     status = option_of_yojson (value_for_key operation_status_of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "DomainName") _list path;
     type_ = option_of_yojson (value_for_key operation_type_of_yojson "Type") _list path;
     submitted_date =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmittedDate") _list path;
     last_updated_date =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedDate") _list path;
     status_flag = option_of_yojson (value_for_key status_flag_of_yojson "StatusFlag") _list path;
   }
    : get_operation_detail_response)

let get_operation_detail_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation_id = value_for_key operation_id_of_yojson "OperationId" _list path }
    : get_operation_detail_request)

let label_of_yojson = string_of_yojson
let page_marker_of_yojson = string_of_yojson

let list_domains_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domains = option_of_yojson (value_for_key domain_summary_list_of_yojson "Domains") _list path;
     next_page_marker =
       option_of_yojson (value_for_key page_marker_of_yojson "NextPageMarker") _list path;
   }
    : list_domains_response)

let page_max_items_of_yojson = int_of_yojson

let sort_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASC" -> ASC
    | `String "DESC" -> DESC
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")
     : sort_order)
    : sort_order)

let sort_condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key list_domains_attribute_name_of_yojson "Name" _list path;
     sort_order = value_for_key sort_order_of_yojson "SortOrder" _list path;
   }
    : sort_condition)

let list_domains_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter_conditions =
       option_of_yojson (value_for_key filter_conditions_of_yojson "FilterConditions") _list path;
     sort_condition =
       option_of_yojson (value_for_key sort_condition_of_yojson "SortCondition") _list path;
     marker = option_of_yojson (value_for_key page_marker_of_yojson "Marker") _list path;
     max_items = option_of_yojson (value_for_key page_max_items_of_yojson "MaxItems") _list path;
   }
    : list_domains_request)

let operation_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
     status = option_of_yojson (value_for_key operation_status_of_yojson "Status") _list path;
     type_ = option_of_yojson (value_for_key operation_type_of_yojson "Type") _list path;
     submitted_date =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmittedDate") _list path;
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "DomainName") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     status_flag = option_of_yojson (value_for_key status_flag_of_yojson "StatusFlag") _list path;
     last_updated_date =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedDate") _list path;
   }
    : operation_summary)

let operation_summary_list_of_yojson tree path =
  list_of_yojson operation_summary_of_yojson tree path

let list_operations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations =
       option_of_yojson (value_for_key operation_summary_list_of_yojson "Operations") _list path;
     next_page_marker =
       option_of_yojson (value_for_key page_marker_of_yojson "NextPageMarker") _list path;
   }
    : list_operations_response)

let list_operations_sort_attribute_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "SubmittedDate" -> SubmittedDate
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ListOperationsSortAttributeName" value)
    | _ -> raise (deserialize_wrong_type_error path "ListOperationsSortAttributeName")
     : list_operations_sort_attribute_name)
    : list_operations_sort_attribute_name)

let operation_type_list_of_yojson tree path = list_of_yojson operation_type_of_yojson tree path
let operation_status_list_of_yojson tree path = list_of_yojson operation_status_of_yojson tree path

let list_operations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     submitted_since =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmittedSince") _list path;
     marker = option_of_yojson (value_for_key page_marker_of_yojson "Marker") _list path;
     max_items = option_of_yojson (value_for_key page_max_items_of_yojson "MaxItems") _list path;
     status = option_of_yojson (value_for_key operation_status_list_of_yojson "Status") _list path;
     type_ = option_of_yojson (value_for_key operation_type_list_of_yojson "Type") _list path;
     sort_by =
       option_of_yojson
         (value_for_key list_operations_sort_attribute_name_of_yojson "SortBy")
         _list path;
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "SortOrder") _list path;
   }
    : list_operations_request)

let list_prices_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     prices = option_of_yojson (value_for_key domain_price_list_of_yojson "Prices") _list path;
     next_page_marker =
       option_of_yojson (value_for_key page_marker_of_yojson "NextPageMarker") _list path;
   }
    : list_prices_response)

let list_prices_page_max_items_of_yojson = int_of_yojson

let list_prices_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tld = option_of_yojson (value_for_key tld_name_of_yojson "Tld") _list path;
     marker = option_of_yojson (value_for_key page_marker_of_yojson "Marker") _list path;
     max_items =
       option_of_yojson (value_for_key list_prices_page_max_items_of_yojson "MaxItems") _list path;
   }
    : list_prices_request)

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key tag_key_of_yojson "Key") _list path;
     value = option_of_yojson (value_for_key tag_value_of_yojson "Value") _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let list_tags_for_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tag_list = option_of_yojson (value_for_key tag_list_of_yojson "TagList") _list path }
    : list_tags_for_domain_response)

let list_tags_for_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_name = value_for_key domain_name_of_yojson "DomainName" _list path }
    : list_tags_for_domain_request)

let push_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
     target = value_for_key label_of_yojson "Target" _list path;
   }
    : push_domain_request)

let register_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : register_domain_response)

let register_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
     idn_lang_code = option_of_yojson (value_for_key lang_code_of_yojson "IdnLangCode") _list path;
     duration_in_years = value_for_key duration_in_years_of_yojson "DurationInYears" _list path;
     auto_renew = option_of_yojson (value_for_key boolean__of_yojson "AutoRenew") _list path;
     admin_contact = value_for_key contact_detail_of_yojson "AdminContact" _list path;
     registrant_contact = value_for_key contact_detail_of_yojson "RegistrantContact" _list path;
     tech_contact = value_for_key contact_detail_of_yojson "TechContact" _list path;
     privacy_protect_admin_contact =
       option_of_yojson (value_for_key boolean__of_yojson "PrivacyProtectAdminContact") _list path;
     privacy_protect_registrant_contact =
       option_of_yojson
         (value_for_key boolean__of_yojson "PrivacyProtectRegistrantContact")
         _list path;
     privacy_protect_tech_contact =
       option_of_yojson (value_for_key boolean__of_yojson "PrivacyProtectTechContact") _list path;
     billing_contact =
       option_of_yojson (value_for_key contact_detail_of_yojson "BillingContact") _list path;
     privacy_protect_billing_contact =
       option_of_yojson (value_for_key boolean__of_yojson "PrivacyProtectBillingContact") _list path;
   }
    : register_domain_request)

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

let renew_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : renew_domain_response)

let renew_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
     duration_in_years =
       option_of_yojson (value_for_key duration_in_years_of_yojson "DurationInYears") _list path;
     current_expiry_year =
       value_for_key current_expiry_year_of_yojson "CurrentExpiryYear" _list path;
   }
    : renew_domain_request)

let resend_contact_reachability_email_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "domainName") _list path;
     email_address = option_of_yojson (value_for_key email_of_yojson "emailAddress") _list path;
     is_already_verified =
       option_of_yojson (value_for_key boolean__of_yojson "isAlreadyVerified") _list path;
   }
    : resend_contact_reachability_email_response)

let resend_contact_reachability_email_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_name = option_of_yojson (value_for_key domain_name_of_yojson "domainName") _list path }
    : resend_contact_reachability_email_request)

let resend_operation_authorization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation_id = value_for_key operation_id_of_yojson "OperationId" _list path }
    : resend_operation_authorization_request)

let retrieve_domain_auth_code_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ auth_code = option_of_yojson (value_for_key domain_auth_code_of_yojson "AuthCode") _list path }
    : retrieve_domain_auth_code_response)

let retrieve_domain_auth_code_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_name = value_for_key domain_name_of_yojson "DomainName" _list path }
    : retrieve_domain_auth_code_request)

let view_billing_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_marker =
       option_of_yojson (value_for_key page_marker_of_yojson "NextPageMarker") _list path;
     billing_records =
       option_of_yojson (value_for_key billing_records_of_yojson "BillingRecords") _list path;
   }
    : view_billing_response)

let view_billing_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start = option_of_yojson (value_for_key timestamp_of_yojson "Start") _list path;
     end_ = option_of_yojson (value_for_key timestamp_of_yojson "End") _list path;
     marker = option_of_yojson (value_for_key page_marker_of_yojson "Marker") _list path;
     max_items = option_of_yojson (value_for_key page_max_items_of_yojson "MaxItems") _list path;
   }
    : view_billing_request)

let update_tags_for_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_tags_for_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
     tags_to_update = option_of_yojson (value_for_key tag_list_of_yojson "TagsToUpdate") _list path;
   }
    : update_tags_for_domain_request)

let update_domain_nameservers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : update_domain_nameservers_response)

let update_domain_nameservers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
     fi_auth_key = option_of_yojson (value_for_key fi_auth_key_of_yojson "FIAuthKey") _list path;
     nameservers = value_for_key nameserver_list_of_yojson "Nameservers" _list path;
   }
    : update_domain_nameservers_request)

let update_domain_contact_privacy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : update_domain_contact_privacy_response)

let update_domain_contact_privacy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
     admin_privacy = option_of_yojson (value_for_key boolean__of_yojson "AdminPrivacy") _list path;
     registrant_privacy =
       option_of_yojson (value_for_key boolean__of_yojson "RegistrantPrivacy") _list path;
     tech_privacy = option_of_yojson (value_for_key boolean__of_yojson "TechPrivacy") _list path;
     billing_privacy =
       option_of_yojson (value_for_key boolean__of_yojson "BillingPrivacy") _list path;
   }
    : update_domain_contact_privacy_request)

let update_domain_contact_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : update_domain_contact_response)

let update_domain_contact_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
     admin_contact =
       option_of_yojson (value_for_key contact_detail_of_yojson "AdminContact") _list path;
     registrant_contact =
       option_of_yojson (value_for_key contact_detail_of_yojson "RegistrantContact") _list path;
     tech_contact =
       option_of_yojson (value_for_key contact_detail_of_yojson "TechContact") _list path;
     consent = option_of_yojson (value_for_key consent_of_yojson "Consent") _list path;
     billing_contact =
       option_of_yojson (value_for_key contact_detail_of_yojson "BillingContact") _list path;
   }
    : update_domain_contact_request)

let transfer_domain_to_another_aws_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
     password = option_of_yojson (value_for_key password_of_yojson "Password") _list path;
   }
    : transfer_domain_to_another_aws_account_response)

let transfer_domain_to_another_aws_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : transfer_domain_to_another_aws_account_request)

let transfer_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id = option_of_yojson (value_for_key operation_id_of_yojson "OperationId") _list path;
   }
    : transfer_domain_response)

let transfer_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
     idn_lang_code = option_of_yojson (value_for_key lang_code_of_yojson "IdnLangCode") _list path;
     duration_in_years =
       option_of_yojson (value_for_key duration_in_years_of_yojson "DurationInYears") _list path;
     nameservers =
       option_of_yojson (value_for_key nameserver_list_of_yojson "Nameservers") _list path;
     auth_code = option_of_yojson (value_for_key domain_auth_code_of_yojson "AuthCode") _list path;
     auto_renew = option_of_yojson (value_for_key boolean__of_yojson "AutoRenew") _list path;
     admin_contact = value_for_key contact_detail_of_yojson "AdminContact" _list path;
     registrant_contact = value_for_key contact_detail_of_yojson "RegistrantContact" _list path;
     tech_contact = value_for_key contact_detail_of_yojson "TechContact" _list path;
     privacy_protect_admin_contact =
       option_of_yojson (value_for_key boolean__of_yojson "PrivacyProtectAdminContact") _list path;
     privacy_protect_registrant_contact =
       option_of_yojson
         (value_for_key boolean__of_yojson "PrivacyProtectRegistrantContact")
         _list path;
     privacy_protect_tech_contact =
       option_of_yojson (value_for_key boolean__of_yojson "PrivacyProtectTechContact") _list path;
     billing_contact =
       option_of_yojson (value_for_key contact_detail_of_yojson "BillingContact") _list path;
     privacy_protect_billing_contact =
       option_of_yojson (value_for_key boolean__of_yojson "PrivacyProtectBillingContact") _list path;
   }
    : transfer_domain_request)
