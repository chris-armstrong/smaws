open Smaws_Lib.Json.DeserializeHelpers
open Types

let website_url_of_yojson = string_of_yojson

let visibility_of_yojson (tree : t) path =
  ((match tree with
    | `String "Limited" -> LIMITED
    | `String "Full" -> FULL
    | `String value -> raise (deserialize_unknown_enum_value_error path "Visibility" value)
    | _ -> raise (deserialize_wrong_type_error path "Visibility")
     : visibility)
    : visibility)

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "BUSINESS_VALIDATION_FAILED" -> BUSINESS_VALIDATION_FAILED
    | `String "REQUEST_VALIDATION_FAILED" -> REQUEST_VALIDATION_FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let validation_exception_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTION_NOT_PERMITTED" -> ACTION_NOT_PERMITTED
    | `String "VALUE_OUT_OF_RANGE" -> VALUE_OUT_OF_RANGE
    | `String "DUPLICATE_KEY_VALUE" -> DUPLICATE_KEY_VALUE
    | `String "INVALID_RESOURCE_STATE" -> INVALID_RESOURCE_STATE
    | `String "TOO_MANY_VALUES" -> TOO_MANY_VALUES
    | `String "NOT_ENOUGH_VALUES" -> NOT_ENOUGH_VALUES
    | `String "INVALID_VALUE" -> INVALID_VALUE
    | `String "INVALID_STRING_FORMAT" -> INVALID_STRING_FORMAT
    | `String "INVALID_ENUM_VALUE" -> INVALID_ENUM_VALUE
    | `String "REQUIRED_FIELD_MISSING" -> REQUIRED_FIELD_MISSING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionErrorCode")
     : validation_exception_error_code)
    : validation_exception_error_code)

let validation_exception_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code = value_for_key validation_exception_error_code_of_yojson "Code" _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
     field_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "FieldName")
         _list path;
   }
    : validation_exception_error)

let validation_exception_error_list_of_yojson tree path =
  list_of_yojson validation_exception_error_of_yojson tree path

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_list =
       option_of_yojson
         (value_for_key validation_exception_error_list_of_yojson "ErrorList")
         _list path;
     reason = value_for_key validation_exception_reason_of_yojson "Reason" _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
   }
    : validation_exception)

let use_cases_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let opportunity_identifier_of_yojson = string_of_yojson
let date_time_of_yojson = timestamp_iso_8601_of_yojson

let update_opportunity_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_date = value_for_key date_time_of_yojson "LastModifiedDate" _list path;
     id = value_for_key opportunity_identifier_of_yojson "Id" _list path;
   }
    : update_opportunity_response)

let catalog_identifier_of_yojson = string_of_yojson

let primary_need_from_aws_of_yojson (tree : t) path =
  ((match tree with
    | `String "Co-Sell - Support for Public Tender / RFx" -> CO_SELL_SUPPORT_FOR_PUBLIC_TENDER_RFX
    | `String "Co-Sell - Deal Support" -> CO_SELL_DEAL_SUPPORT
    | `String "Co-Sell - Total Cost of Ownership Evaluation" ->
        CO_SELL_TOTAL_COST_OF_OWNERSHIP_EVALUATION
    | `String "Co-Sell - Technical Consultation" -> CO_SELL_TECHNICAL_CONSULTATION
    | `String "Co-Sell - Pricing Assistance" -> CO_SELL_PRICING_ASSISTANCE
    | `String "Co-Sell - Competitive Information" -> CO_SELL_COMPETITIVE_INFORMATION
    | `String "Co-Sell - Business Presentation" -> CO_SELL_BUSINESS_PRESENTATION
    | `String "Co-Sell - Architectural Validation" -> CO_SELL_ARCHITECTURAL_VALIDATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "PrimaryNeedFromAws" value)
    | _ -> raise (deserialize_wrong_type_error path "PrimaryNeedFromAws")
     : primary_need_from_aws)
    : primary_need_from_aws)

let primary_needs_from_aws_of_yojson tree path =
  list_of_yojson primary_need_from_aws_of_yojson tree path

let national_security_of_yojson (tree : t) path =
  ((match tree with
    | `String "No" -> NO
    | `String "Yes" -> YES
    | `String value -> raise (deserialize_unknown_enum_value_error path "NationalSecurity" value)
    | _ -> raise (deserialize_wrong_type_error path "NationalSecurity")
     : national_security)
    : national_security)

let industry_of_yojson (tree : t) path =
  ((match tree with
    | `String "Other" -> OTHER
    | `String "Wholesale and Distribution" -> WHOLESALE_DISTRIBUTION
    | `String "Travel" -> TRAVEL
    | `String "Transportation and Logistics" -> TRANSPORTATION_LOGISTICS
    | `String "Telecommunications" -> TELECOMMUNICATIONS
    | `String "Software and Internet" -> SOFTWARE_INTERNET
    | `String "Retail" -> RETAIL
    | `String "Real Estate and Construction" -> REALESTATE_CONSTRUCTION
    | `String "Professional Services" -> PROFESSIONAL_SERVICES
    | `String "Non-Profit Organization" -> NON_PROFIT_ORGANIZATION
    | `String "Mining" -> MINING
    | `String "Media and Entertainment" -> MEDIA_ENTERTAINMENT
    | `String "Marketing and Advertising" -> MARKETING_ADVERTISING
    | `String "Manufacturing" -> MANUFACTURING
    | `String "Life Sciences" -> LIFE_SCIENCES
    | `String "Hospitality" -> HOSPITALITY
    | `String "Healthcare" -> HEALTHCARE
    | `String "Government" -> GOVERNMENT
    | `String "Gaming" -> GAMING
    | `String "Financial Services" -> FINANCIAL_SERVICES
    | `String "Energy - Power and Utilities" -> ENERGY_POWER_UTILITIES
    | `String "Energy - Oil and Gas" -> ENERGY_OIL_GAS
    | `String "Education" -> EDUCATION
    | `String "Consumer Goods" -> CONSUMER_GOODS
    | `String "Computers and Electronics" -> COMPUTERS_ELECTRONICS
    | `String "Automotive" -> AUTOMOTIVE
    | `String "Agriculture" -> AGRICULTURE
    | `String "Aerospace" -> AEROSPACE_SATELLITE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Industry" value)
    | _ -> raise (deserialize_wrong_type_error path "Industry")
     : industry)
    : industry)

let name_of_yojson = string_of_yojson
let aws_account_of_yojson = string_of_yojson
let address_part_of_yojson = string_of_yojson

let country_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "ZW" -> ZW
    | `String "ZM" -> ZM
    | `String "YE" -> YE
    | `String "EH" -> EH
    | `String "WF" -> WF
    | `String "VI" -> VI
    | `String "VG" -> VG
    | `String "VN" -> VN
    | `String "VE" -> VE
    | `String "VU" -> VU
    | `String "UZ" -> UZ
    | `String "UY" -> UY
    | `String "UM" -> UM
    | `String "GB" -> GB
    | `String "AE" -> AE
    | `String "UA" -> UA
    | `String "UG" -> UG
    | `String "TV" -> TV
    | `String "TC" -> TC
    | `String "TM" -> TM
    | `String "TR" -> TR
    | `String "TN" -> TN
    | `String "TT" -> TT
    | `String "TO" -> TO
    | `String "TK" -> TK
    | `String "TG" -> TG
    | `String "TL" -> TL
    | `String "TH" -> TH
    | `String "TZ" -> TZ
    | `String "TJ" -> TJ
    | `String "TW" -> TW
    | `String "SY" -> SY
    | `String "CH" -> CH
    | `String "SE" -> SE
    | `String "SZ" -> SZ
    | `String "SJ" -> SJ
    | `String "SR" -> SR
    | `String "SD" -> SD
    | `String "LK" -> LK
    | `String "ES" -> ES
    | `String "SS" -> SS
    | `String "GS" -> GS
    | `String "ZA" -> ZA
    | `String "SO" -> SO
    | `String "SB" -> SB
    | `String "SI" -> SI
    | `String "SK" -> SK
    | `String "SX" -> SX
    | `String "SG" -> SG
    | `String "SL" -> SL
    | `String "SC" -> SC
    | `String "RS" -> RS
    | `String "SN" -> SN
    | `String "SA" -> SA
    | `String "ST" -> ST
    | `String "SM" -> SM
    | `String "WS" -> WS
    | `String "VC" -> VC
    | `String "PM" -> PM
    | `String "MF" -> MF
    | `String "LC" -> LC
    | `String "KN" -> KN
    | `String "SH" -> SH
    | `String "BL" -> BL
    | `String "RW" -> RW
    | `String "RU" -> RU
    | `String "RO" -> RO
    | `String "RE" -> RE
    | `String "QA" -> QA
    | `String "PR" -> PR
    | `String "PT" -> PT
    | `String "PL" -> PL
    | `String "PN" -> PN
    | `String "PH" -> PH
    | `String "PE" -> PE
    | `String "PY" -> PY
    | `String "PG" -> PG
    | `String "PA" -> PA
    | `String "PS" -> PS
    | `String "PW" -> PW
    | `String "PK" -> PK
    | `String "OM" -> OM
    | `String "NO" -> NO
    | `String "MP" -> MP
    | `String "NF" -> NF
    | `String "NU" -> NU
    | `String "NG" -> NG
    | `String "NE" -> NE
    | `String "NI" -> NI
    | `String "NZ" -> NZ
    | `String "NC" -> NC
    | `String "AN" -> AN
    | `String "NL" -> NL
    | `String "NP" -> NP
    | `String "NR" -> NR
    | `String "NA" -> NA
    | `String "MM" -> MM
    | `String "MZ" -> MZ
    | `String "MA" -> MA
    | `String "MS" -> MS
    | `String "ME" -> ME
    | `String "MN" -> MN
    | `String "MC" -> MC
    | `String "MD" -> MD
    | `String "FM" -> FM
    | `String "MX" -> MX
    | `String "YT" -> YT
    | `String "MU" -> MU
    | `String "MR" -> MR
    | `String "MQ" -> MQ
    | `String "MH" -> MH
    | `String "MT" -> MT
    | `String "ML" -> ML
    | `String "MV" -> MV
    | `String "MY" -> MY
    | `String "MW" -> MW
    | `String "MG" -> MG
    | `String "MK" -> MK
    | `String "MO" -> MO
    | `String "LU" -> LU
    | `String "LT" -> LT
    | `String "LI" -> LI
    | `String "LY" -> LY
    | `String "LR" -> LR
    | `String "LS" -> LS
    | `String "LB" -> LB
    | `String "LV" -> LV
    | `String "LA" -> LA
    | `String "KG" -> KG
    | `String "KW" -> KW
    | `String "KR" -> KR
    | `String "KI" -> KI
    | `String "KE" -> KE
    | `String "KZ" -> KZ
    | `String "JO" -> JO
    | `String "JE" -> JE
    | `String "JP" -> JP
    | `String "JM" -> JM
    | `String "IT" -> IT
    | `String "IL" -> IL
    | `String "IM" -> IM
    | `String "IE" -> IE
    | `String "IQ" -> IQ
    | `String "IR" -> IR
    | `String "ID" -> ID
    | `String "IN" -> IN
    | `String "IS" -> IS
    | `String "HU" -> HU
    | `String "HK" -> HK
    | `String "HN" -> HN
    | `String "VA" -> VA
    | `String "HM" -> HM
    | `String "HT" -> HT
    | `String "GY" -> GY
    | `String "GW" -> GW
    | `String "GN" -> GN
    | `String "GG" -> GG
    | `String "GT" -> GT
    | `String "GU" -> GU
    | `String "GP" -> GP
    | `String "GD" -> GD
    | `String "GL" -> GL
    | `String "GR" -> GR
    | `String "GI" -> GI
    | `String "GH" -> GH
    | `String "DE" -> DE
    | `String "GE" -> GE
    | `String "GM" -> GM
    | `String "GA" -> GA
    | `String "TF" -> TF
    | `String "PF" -> PF
    | `String "GF" -> GF
    | `String "FR" -> FR
    | `String "FI" -> FI
    | `String "FJ" -> FJ
    | `String "FO" -> FO
    | `String "FK" -> FK
    | `String "ET" -> ET
    | `String "EE" -> EE
    | `String "ER" -> ER
    | `String "GQ" -> GQ
    | `String "SV" -> SV
    | `String "EG" -> EG
    | `String "EC" -> EC
    | `String "DO" -> DO
    | `String "DM" -> DM
    | `String "DJ" -> DJ
    | `String "DK" -> DK
    | `String "CD" -> CD
    | `String "CZ" -> CZ
    | `String "CY" -> CY
    | `String "CW" -> CW
    | `String "CU" -> CU
    | `String "HR" -> HR
    | `String "CI" -> CI
    | `String "CR" -> CR
    | `String "CK" -> CK
    | `String "CG" -> CG
    | `String "KM" -> KM
    | `String "CO" -> CO
    | `String "CC" -> CC
    | `String "CX" -> CX
    | `String "CN" -> CN
    | `String "CL" -> CL
    | `String "TD" -> TD
    | `String "CF" -> CF
    | `String "KY" -> KY
    | `String "CV" -> CV
    | `String "CA" -> CA
    | `String "CM" -> CM
    | `String "KH" -> KH
    | `String "BI" -> BI
    | `String "BF" -> BF
    | `String "BG" -> BG
    | `String "BN" -> BN
    | `String "IO" -> IO
    | `String "BR" -> BR
    | `String "BV" -> BV
    | `String "BW" -> BW
    | `String "BA" -> BA
    | `String "BQ" -> BQ
    | `String "BO" -> BO
    | `String "BT" -> BT
    | `String "BM" -> BM
    | `String "BJ" -> BJ
    | `String "BZ" -> BZ
    | `String "BE" -> BE
    | `String "BY" -> BY
    | `String "BB" -> BB
    | `String "BD" -> BD
    | `String "BH" -> BH
    | `String "BS" -> BS
    | `String "AZ" -> AZ
    | `String "AT" -> AT
    | `String "AU" -> AU
    | `String "AW" -> AW
    | `String "AM" -> AM
    | `String "AR" -> AR
    | `String "AG" -> AG
    | `String "AQ" -> AQ
    | `String "AI" -> AI
    | `String "AO" -> AO
    | `String "AD" -> AD
    | `String "AS" -> AS
    | `String "DZ" -> DZ
    | `String "AL" -> AL
    | `String "AX" -> AX
    | `String "AF" -> AF
    | `String "US" -> US
    | `String value -> raise (deserialize_unknown_enum_value_error path "CountryCode" value)
    | _ -> raise (deserialize_wrong_type_error path "CountryCode")
     : country_code)
    : country_code)

let address_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     street_address =
       option_of_yojson (value_for_key address_part_of_yojson "StreetAddress") _list path;
     country_code = option_of_yojson (value_for_key country_code_of_yojson "CountryCode") _list path;
     state_or_region =
       option_of_yojson (value_for_key address_part_of_yojson "StateOrRegion") _list path;
     postal_code = option_of_yojson (value_for_key address_part_of_yojson "PostalCode") _list path;
     city = option_of_yojson (value_for_key address_part_of_yojson "City") _list path;
   }
    : address)

let duns_number_of_yojson = string_of_yojson

let account_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     duns = option_of_yojson (value_for_key duns_number_of_yojson "Duns") _list path;
     address = option_of_yojson (value_for_key address_of_yojson "Address") _list path;
     aws_account_id =
       option_of_yojson (value_for_key aws_account_of_yojson "AwsAccountId") _list path;
     website_url = option_of_yojson (value_for_key website_url_of_yojson "WebsiteUrl") _list path;
     company_name = value_for_key name_of_yojson "CompanyName" _list path;
     other_industry =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "OtherIndustry")
         _list path;
     industry = option_of_yojson (value_for_key industry_of_yojson "Industry") _list path;
   }
    : account)

let email_of_yojson = string_of_yojson
let job_title_of_yojson = string_of_yojson
let phone_number_of_yojson = string_of_yojson

let contact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     phone = option_of_yojson (value_for_key phone_number_of_yojson "Phone") _list path;
     business_title =
       option_of_yojson (value_for_key job_title_of_yojson "BusinessTitle") _list path;
     last_name = option_of_yojson (value_for_key name_of_yojson "LastName") _list path;
     first_name = option_of_yojson (value_for_key name_of_yojson "FirstName") _list path;
     email = option_of_yojson (value_for_key email_of_yojson "Email") _list path;
   }
    : contact)

let customer_contacts_list_of_yojson tree path = list_of_yojson contact_of_yojson tree path

let customer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     contacts =
       option_of_yojson (value_for_key customer_contacts_list_of_yojson "Contacts") _list path;
     account = option_of_yojson (value_for_key account_of_yojson "Account") _list path;
   }
    : customer)

let delivery_model_of_yojson (tree : t) path =
  ((match tree with
    | `String "Other" -> OTHER
    | `String "Resell" -> RESELL
    | `String "Professional Services" -> PROFESSIONAL_SERVICES
    | `String "Managed Services" -> MANAGED_SERVICES
    | `String "BYOL or AMI" -> BYOL_OR_AMI
    | `String "SaaS or PaaS" -> SAAS_OR_PAAS
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeliveryModel" value)
    | _ -> raise (deserialize_wrong_type_error path "DeliveryModel")
     : delivery_model)
    : delivery_model)

let delivery_models_of_yojson tree path = list_of_yojson delivery_model_of_yojson tree path
let amount_of_yojson = string_of_yojson

let currency_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "ZWL" -> ZWL
    | `String "ZMW" -> ZMW
    | `String "ZAR" -> ZAR
    | `String "YER" -> YER
    | `String "XUA" -> XUA
    | `String "XSU" -> XSU
    | `String "XPF" -> XPF
    | `String "XOF" -> XOF
    | `String "XDR" -> XDR
    | `String "XCD" -> XCD
    | `String "XAF" -> XAF
    | `String "WST" -> WST
    | `String "VUV" -> VUV
    | `String "VND" -> VND
    | `String "VEF" -> VEF
    | `String "UZS" -> UZS
    | `String "UYU" -> UYU
    | `String "UYI" -> UYI
    | `String "USN" -> USN
    | `String "UGX" -> UGX
    | `String "UAH" -> UAH
    | `String "TZS" -> TZS
    | `String "TWD" -> TWD
    | `String "TTD" -> TTD
    | `String "TRY" -> TRY
    | `String "TOP" -> TOP
    | `String "TND" -> TND
    | `String "TMT" -> TMT
    | `String "TJS" -> TJS
    | `String "THB" -> THB
    | `String "SZL" -> SZL
    | `String "SYP" -> SYP
    | `String "SVC" -> SVC
    | `String "STN" -> STN
    | `String "SSP" -> SSP
    | `String "SRD" -> SRD
    | `String "SOS" -> SOS
    | `String "SLL" -> SLL
    | `String "SHP" -> SHP
    | `String "SGD" -> SGD
    | `String "SDG" -> SDG
    | `String "SCR" -> SCR
    | `String "SBD" -> SBD
    | `String "SAR" -> SAR
    | `String "RWF" -> RWF
    | `String "RUB" -> RUB
    | `String "RSD" -> RSD
    | `String "RON" -> RON
    | `String "QAR" -> QAR
    | `String "PYG" -> PYG
    | `String "PLN" -> PLN
    | `String "PKR" -> PKR
    | `String "PHP" -> PHP
    | `String "PGK" -> PGK
    | `String "PEN" -> PEN
    | `String "PAB" -> PAB
    | `String "OMR" -> OMR
    | `String "NPR" -> NPR
    | `String "NOK" -> NOK
    | `String "NIO" -> NIO
    | `String "NGN" -> NGN
    | `String "NAD" -> NAD
    | `String "MZN" -> MZN
    | `String "MYR" -> MYR
    | `String "MXV" -> MXV
    | `String "MXN" -> MXN
    | `String "MWK" -> MWK
    | `String "MVR" -> MVR
    | `String "MUR" -> MUR
    | `String "MRU" -> MRU
    | `String "MOP" -> MOP
    | `String "MNT" -> MNT
    | `String "MMK" -> MMK
    | `String "MKD" -> MKD
    | `String "MGA" -> MGA
    | `String "MDL" -> MDL
    | `String "MAD" -> MAD
    | `String "LYD" -> LYD
    | `String "LSL" -> LSL
    | `String "LRD" -> LRD
    | `String "LKR" -> LKR
    | `String "LBP" -> LBP
    | `String "LAK" -> LAK
    | `String "KZT" -> KZT
    | `String "KYD" -> KYD
    | `String "KWD" -> KWD
    | `String "KRW" -> KRW
    | `String "KPW" -> KPW
    | `String "KMF" -> KMF
    | `String "KHR" -> KHR
    | `String "KGS" -> KGS
    | `String "KES" -> KES
    | `String "JOD" -> JOD
    | `String "JMD" -> JMD
    | `String "ISK" -> ISK
    | `String "IRR" -> IRR
    | `String "IQD" -> IQD
    | `String "ILS" -> ILS
    | `String "IDR" -> IDR
    | `String "HUF" -> HUF
    | `String "HTG" -> HTG
    | `String "HRK" -> HRK
    | `String "HNL" -> HNL
    | `String "HKD" -> HKD
    | `String "GYD" -> GYD
    | `String "GTQ" -> GTQ
    | `String "GNF" -> GNF
    | `String "GMD" -> GMD
    | `String "GIP" -> GIP
    | `String "GHS" -> GHS
    | `String "GEL" -> GEL
    | `String "FKP" -> FKP
    | `String "FJD" -> FJD
    | `String "ETB" -> ETB
    | `String "ERN" -> ERN
    | `String "EGP" -> EGP
    | `String "DZD" -> DZD
    | `String "DOP" -> DOP
    | `String "DKK" -> DKK
    | `String "DJF" -> DJF
    | `String "CZK" -> CZK
    | `String "CVE" -> CVE
    | `String "CUP" -> CUP
    | `String "CUC" -> CUC
    | `String "CRC" -> CRC
    | `String "COU" -> COU
    | `String "COP" -> COP
    | `String "CLP" -> CLP
    | `String "CLF" -> CLF
    | `String "CHW" -> CHW
    | `String "CHE" -> CHE
    | `String "CDF" -> CDF
    | `String "BZD" -> BZD
    | `String "BYN" -> BYN
    | `String "BWP" -> BWP
    | `String "BTN" -> BTN
    | `String "BSD" -> BSD
    | `String "BRL" -> BRL
    | `String "BOV" -> BOV
    | `String "BOB" -> BOB
    | `String "BND" -> BND
    | `String "BMD" -> BMD
    | `String "BIF" -> BIF
    | `String "BHD" -> BHD
    | `String "BGN" -> BGN
    | `String "BDT" -> BDT
    | `String "BBD" -> BBD
    | `String "BAM" -> BAM
    | `String "AZN" -> AZN
    | `String "AWG" -> AWG
    | `String "ARS" -> ARS
    | `String "AOA" -> AOA
    | `String "ANG" -> ANG
    | `String "AMD" -> AMD
    | `String "ALL" -> ALL
    | `String "AFN" -> AFN
    | `String "AED" -> AED
    | `String "SEK" -> SEK
    | `String "CHF" -> CHF
    | `String "JPY" -> JPY
    | `String "INR" -> INR
    | `String "NZD" -> NZD
    | `String "CNY" -> CNY
    | `String "CAD" -> CAD
    | `String "AUD" -> AUD
    | `String "GBP" -> GBP
    | `String "EUR" -> EUR
    | `String "USD" -> USD
    | `String value -> raise (deserialize_unknown_enum_value_error path "CurrencyCode" value)
    | _ -> raise (deserialize_wrong_type_error path "CurrencyCode")
     : currency_code)
    : currency_code)

let payment_frequency_of_yojson (tree : t) path =
  ((match tree with
    | `String "Monthly" -> MONTHLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "PaymentFrequency" value)
    | _ -> raise (deserialize_wrong_type_error path "PaymentFrequency")
     : payment_frequency)
    : payment_frequency)

let estimation_url_of_yojson = string_of_yojson

let expected_customer_spend_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     estimation_url =
       option_of_yojson (value_for_key estimation_url_of_yojson "EstimationUrl") _list path;
     target_company =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "TargetCompany" _list
         path;
     frequency = value_for_key payment_frequency_of_yojson "Frequency" _list path;
     currency_code = value_for_key currency_code_of_yojson "CurrencyCode" _list path;
     amount = option_of_yojson (value_for_key amount_of_yojson "Amount") _list path;
   }
    : expected_customer_spend)

let expected_customer_spend_list_of_yojson tree path =
  list_of_yojson expected_customer_spend_of_yojson tree path

let expected_contract_duration_term_of_yojson (tree : t) path =
  ((match tree with
    | `String "Months" -> MONTHS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExpectedContractDurationTerm" value)
    | _ -> raise (deserialize_wrong_type_error path "ExpectedContractDurationTerm")
     : expected_contract_duration_term)
    : expected_contract_duration_term)

let expected_contract_duration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Value" _list path;
     term = value_for_key expected_contract_duration_term_of_yojson "Term" _list path;
   }
    : expected_contract_duration)

let pii_string_of_yojson = string_of_yojson

let apn_programs_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let sales_activity_of_yojson (tree : t) path =
  ((match tree with
    | `String "SOW Signed" -> SOW_SIGNED
    | `String "Finalized Deployment Need" -> FINALIZED_DEPLOYMENT_NEEDS
    | `String "Completed Action Plan" -> COMPLETED_ACTION_PLAN
    | `String "Agreed on solution to Business Problem" -> AGREED_ON_SOLUTION_TO_BUSINESS_PROBLEM
    | `String "In evaluation / planning stage" -> IN_EVALUATION_PLANNING_STAGE
    | `String "Conducted POC / Demo" -> CONDUCTED_POC_DEMO
    | `String "Customer has shown interest in solution" -> CUSTOMER_HAS_SHOWN_INTEREST
    | `String "Initialized discussions with customer" -> INITIALIZED_DISCUSSIONS_WITH_CUSTOMER
    | `String value -> raise (deserialize_unknown_enum_value_error path "SalesActivity" value)
    | _ -> raise (deserialize_wrong_type_error path "SalesActivity")
     : sales_activity)
    : sales_activity)

let sales_activities_of_yojson tree path = list_of_yojson sales_activity_of_yojson tree path

let competitor_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "*Other" -> OTHER
    | `String "No Competition" -> NO_COMPETITION
    | `String "Other- Cost Optimization" -> OTHER_COST_OPTIMIZATION
    | `String "Microsoft Azure" -> MICROSOFT_AZURE
    | `String "IBM Softlayer" -> IBM_SOFTLAYER
    | `String "Google Cloud Platform" -> GOOGLE_CLOUD_PLATFORM
    | `String "AliCloud" -> ALICLOUD
    | `String "Akamai" -> AKAMAI
    | `String "Co-location" -> CO_LOCATION
    | `String "On-Prem" -> ON_PREM
    | `String "Oracle Cloud" -> ORACLE_CLOUD
    | `String value -> raise (deserialize_unknown_enum_value_error path "CompetitorName" value)
    | _ -> raise (deserialize_wrong_type_error path "CompetitorName")
     : competitor_name)
    : competitor_name)

let aws_partition_of_yojson (tree : t) path =
  ((match tree with
    | `String "aws-eusc" -> AWS_EUSC
    | `String value -> raise (deserialize_unknown_enum_value_error path "AwsPartition" value)
    | _ -> raise (deserialize_wrong_type_error path "AwsPartition")
     : aws_partition)
    : aws_partition)

let project_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_partition =
       option_of_yojson (value_for_key aws_partition_of_yojson "AwsPartition") _list path;
     additional_comments =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "AdditionalComments")
         _list path;
     other_solution_description =
       option_of_yojson (value_for_key pii_string_of_yojson "OtherSolutionDescription") _list path;
     other_competitor_names =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "OtherCompetitorNames")
         _list path;
     competitor_name =
       option_of_yojson (value_for_key competitor_name_of_yojson "CompetitorName") _list path;
     sales_activities =
       option_of_yojson (value_for_key sales_activities_of_yojson "SalesActivities") _list path;
     related_opportunity_identifier =
       option_of_yojson
         (value_for_key opportunity_identifier_of_yojson "RelatedOpportunityIdentifier")
         _list path;
     customer_use_case =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "CustomerUseCase")
         _list path;
     customer_business_problem =
       option_of_yojson (value_for_key pii_string_of_yojson "CustomerBusinessProblem") _list path;
     apn_programs = option_of_yojson (value_for_key apn_programs_of_yojson "ApnPrograms") _list path;
     title = option_of_yojson (value_for_key pii_string_of_yojson "Title") _list path;
     expected_contract_duration =
       option_of_yojson
         (value_for_key expected_contract_duration_of_yojson "ExpectedContractDuration")
         _list path;
     expected_customer_spend =
       option_of_yojson
         (value_for_key expected_customer_spend_list_of_yojson "ExpectedCustomerSpend")
         _list path;
     delivery_models =
       option_of_yojson (value_for_key delivery_models_of_yojson "DeliveryModels") _list path;
   }
    : project)

let opportunity_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Expansion" -> EXPANSION
    | `String "Flat Renewal" -> FLAT_RENEWAL
    | `String "Net New Business" -> NET_NEW_BUSINESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpportunityType" value)
    | _ -> raise (deserialize_wrong_type_error path "OpportunityType")
     : opportunity_type)
    : opportunity_type)

let marketing_source_of_yojson (tree : t) path =
  ((match tree with
    | `String "None" -> NONE
    | `String "Marketing Activity" -> MARKETING_ACTIVITY
    | `String value -> raise (deserialize_unknown_enum_value_error path "MarketingSource" value)
    | _ -> raise (deserialize_wrong_type_error path "MarketingSource")
     : marketing_source)
    : marketing_source)

let channel_of_yojson (tree : t) path =
  ((match tree with
    | `String "Virtual Event" -> VIRTUAL_EVENT
    | `String "Video" -> VIDEO
    | `String "TV" -> TV
    | `String "Telemarketing" -> TELEMARKETING
    | `String "Social" -> SOCIAL
    | `String "Search" -> SEARCH
    | `String "Print" -> PRINT
    | `String "Out Of Home (OOH)" -> OUT_OF_HOME
    | `String "Live Event" -> LIVE_EVENT
    | `String "Email" -> EMAIL
    | `String "Display" -> DISPLAY
    | `String "Content Syndication" -> CONTENT_SYNDICATION
    | `String "AWS Marketing Central" -> AWS_MARKETING_CENTRAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "Channel" value)
    | _ -> raise (deserialize_wrong_type_error path "Channel")
     : channel)
    : channel)

let channels_of_yojson tree path = list_of_yojson channel_of_yojson tree path

let aws_funding_used_of_yojson (tree : t) path =
  ((match tree with
    | `String "No" -> NO
    | `String "Yes" -> YES
    | `String value -> raise (deserialize_unknown_enum_value_error path "AwsFundingUsed" value)
    | _ -> raise (deserialize_wrong_type_error path "AwsFundingUsed")
     : aws_funding_used)
    : aws_funding_used)

let marketing_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_funding_used =
       option_of_yojson (value_for_key aws_funding_used_of_yojson "AwsFundingUsed") _list path;
     channels = option_of_yojson (value_for_key channels_of_yojson "Channels") _list path;
     use_cases = option_of_yojson (value_for_key use_cases_of_yojson "UseCases") _list path;
     source = option_of_yojson (value_for_key marketing_source_of_yojson "Source") _list path;
     campaign_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "CampaignName")
         _list path;
   }
    : marketing)

let revenue_model_of_yojson (tree : t) path =
  ((match tree with
    | `String "Subscription" -> SUBSCRIPTION
    | `String "Pay-as-you-go" -> PAY_AS_YOU_GO
    | `String "Contract" -> CONTRACT
    | `String value -> raise (deserialize_unknown_enum_value_error path "RevenueModel" value)
    | _ -> raise (deserialize_wrong_type_error path "RevenueModel")
     : revenue_model)
    : revenue_model)

let monetary_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     currency_code = value_for_key currency_code_of_yojson "CurrencyCode" _list path;
     amount =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Amount" _list path;
   }
    : monetary_value)

let date_of_yojson = string_of_yojson

let software_revenue_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expiration_date = option_of_yojson (value_for_key date_of_yojson "ExpirationDate") _list path;
     effective_date = option_of_yojson (value_for_key date_of_yojson "EffectiveDate") _list path;
     value = option_of_yojson (value_for_key monetary_value_of_yojson "Value") _list path;
     delivery_model =
       option_of_yojson (value_for_key revenue_model_of_yojson "DeliveryModel") _list path;
   }
    : software_revenue)

let stage_of_yojson (tree : t) path =
  ((match tree with
    | `String "Closed Lost" -> CLOSED_LOST
    | `String "Launched" -> LAUNCHED
    | `String "Committed" -> COMMITTED
    | `String "Business Validation" -> BUSINESS_VALIDATION
    | `String "Technical Validation" -> TECHNICAL_VALIDATION
    | `String "Qualified" -> QUALIFIED
    | `String "Prospect" -> PROSPECT
    | `String value -> raise (deserialize_unknown_enum_value_error path "Stage" value)
    | _ -> raise (deserialize_wrong_type_error path "Stage")
     : stage)
    : stage)

let closed_lost_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "Financial/Commercial" -> FINANCIALCOMMERCIAL
    | `String "Product/Technology" -> PRODUCTTECHNOLOGY
    | `String "People/Relationship/Governance" -> PEOPLERELATIONSHIPGOVERNANCE
    | `String "Other" -> OTHER
    | `String "Customer Experience" -> CUSTOMER_EXPERIENCE
    | `String "Technical Limitations" -> TECHNICAL_LIMITATIONS
    | `String "Security / Compliance" -> SECURITY_COMPLIANCE
    | `String "Price" -> PRICE
    | `String "Partner Gap" -> PARTNER_GAP
    | `String "On Premises Deployment" -> ON_PREMISES_DEPLOYMENT
    | `String "No Opportunity" -> NO_OPPORTUNITY
    | `String "Lost to Competitor - Other" -> LOST_TO_COMPETITOR_OTHER
    | `String "Lost to Competitor - VMWare" -> LOST_TO_COMPETITOR_VMWARE
    | `String "Lost to Competitor - SoftLayer" -> LOST_TO_COMPETITOR_SOFTLAYER
    | `String "Lost to Competitor - Microsoft" -> LOST_TO_COMPETITOR_MICROSOFT
    | `String "Lost to Competitor - Google" -> LOST_TO_COMPETITOR_GOOGLE
    | `String "Legal / Tax / Regulatory" -> LEGAL_TAX_REGULATORY
    | `String "Delay / Cancellation of Project" -> DELAY_CANCELLATION_OF_PROJECT
    | `String "Customer Deficiency" -> CUSTOMER_DEFICIENCY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ClosedLostReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ClosedLostReason")
     : closed_lost_reason)
    : closed_lost_reason)

let review_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Action Required" -> ACTION_REQUIRED
    | `String "Rejected" -> REJECTED
    | `String "Approved" -> APPROVED
    | `String "In review" -> IN_REVIEW
    | `String "Submitted" -> SUBMITTED
    | `String "Pending Submission" -> PENDING_SUBMISSION
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReviewStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ReviewStatus")
     : review_status)
    : review_status)

let next_steps_history_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time = value_for_key date_time_of_yojson "Time" _list path;
     value =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Value" _list path;
   }
    : next_steps_history)

let next_steps_histories_of_yojson tree path = list_of_yojson next_steps_history_of_yojson tree path

let life_cycle_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_steps_history =
       option_of_yojson (value_for_key next_steps_histories_of_yojson "NextStepsHistory") _list path;
     review_status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ReviewStatusReason")
         _list path;
     review_comments =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ReviewComments")
         _list path;
     review_status =
       option_of_yojson (value_for_key review_status_of_yojson "ReviewStatus") _list path;
     target_close_date =
       option_of_yojson (value_for_key date_of_yojson "TargetCloseDate") _list path;
     next_steps = option_of_yojson (value_for_key pii_string_of_yojson "NextSteps") _list path;
     closed_lost_reason =
       option_of_yojson (value_for_key closed_lost_reason_of_yojson "ClosedLostReason") _list path;
     stage = option_of_yojson (value_for_key stage_of_yojson "Stage") _list path;
   }
    : life_cycle)

let update_opportunity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     life_cycle = option_of_yojson (value_for_key life_cycle_of_yojson "LifeCycle") _list path;
     identifier = value_for_key opportunity_identifier_of_yojson "Identifier" _list path;
     last_modified_date = value_for_key date_time_of_yojson "LastModifiedDate" _list path;
     software_revenue =
       option_of_yojson (value_for_key software_revenue_of_yojson "SoftwareRevenue") _list path;
     marketing = option_of_yojson (value_for_key marketing_of_yojson "Marketing") _list path;
     opportunity_type =
       option_of_yojson (value_for_key opportunity_type_of_yojson "OpportunityType") _list path;
     project = option_of_yojson (value_for_key project_of_yojson "Project") _list path;
     customer = option_of_yojson (value_for_key customer_of_yojson "Customer") _list path;
     partner_opportunity_identifier =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "PartnerOpportunityIdentifier")
         _list path;
     national_security =
       option_of_yojson (value_for_key national_security_of_yojson "NationalSecurity") _list path;
     primary_needs_from_aws =
       option_of_yojson
         (value_for_key primary_needs_from_aws_of_yojson "PrimaryNeedsFromAws")
         _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : update_opportunity_request)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
   }
    : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
   }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
   }
    : internal_server_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
   }
    : conflict_exception)

let access_denied_exception_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INCOMPATIBLE_BENEFIT_AWS_PARTNER_STATE" -> INCOMPATIBLE_BENEFIT_AWS_PARTNER_STATE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AccessDeniedExceptionErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessDeniedExceptionErrorCode")
     : access_denied_exception_error_code)
    : access_denied_exception_error_code)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason =
       option_of_yojson
         (value_for_key access_denied_exception_error_code_of_yojson "Reason")
         _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
   }
    : access_denied_exception)

let lead_qualification_status_of_yojson = string_of_yojson
let company_name_of_yojson = string_of_yojson
let company_website_url_of_yojson = string_of_yojson

let address_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     country_code = option_of_yojson (value_for_key country_code_of_yojson "CountryCode") _list path;
     state_or_region =
       option_of_yojson (value_for_key address_part_of_yojson "StateOrRegion") _list path;
     postal_code = option_of_yojson (value_for_key address_part_of_yojson "PostalCode") _list path;
     city = option_of_yojson (value_for_key address_part_of_yojson "City") _list path;
   }
    : address_summary)

let aws_maturity_of_yojson = string_of_yojson

let market_segment_of_yojson (tree : t) path =
  ((match tree with
    | `String "Micro" -> MICRO
    | `String "Small" -> SMALL
    | `String "Medium" -> MEDIUM
    | `String "Large" -> LARGE
    | `String "Enterprise" -> ENTERPRISE
    | `String value -> raise (deserialize_unknown_enum_value_error path "MarketSegment" value)
    | _ -> raise (deserialize_wrong_type_error path "MarketSegment")
     : market_segment)
    : market_segment)

let lead_customer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     market_segment =
       option_of_yojson (value_for_key market_segment_of_yojson "MarketSegment") _list path;
     aws_maturity = option_of_yojson (value_for_key aws_maturity_of_yojson "AwsMaturity") _list path;
     address = value_for_key address_summary_of_yojson "Address" _list path;
     website_url =
       option_of_yojson (value_for_key company_website_url_of_yojson "WebsiteUrl") _list path;
     company_name = value_for_key company_name_of_yojson "CompanyName" _list path;
     industry = option_of_yojson (value_for_key industry_of_yojson "Industry") _list path;
   }
    : lead_customer)

let lead_source_type_of_yojson = string_of_yojson
let lead_source_id_of_yojson = string_of_yojson
let lead_source_name_of_yojson = string_of_yojson
let engagement_use_case_of_yojson = string_of_yojson
let customer_action_of_yojson = string_of_yojson
let engagement_customer_business_problem_of_yojson = string_of_yojson

let lead_contact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     phone = option_of_yojson (value_for_key phone_number_of_yojson "Phone") _list path;
     last_name = value_for_key name_of_yojson "LastName" _list path;
     first_name = value_for_key name_of_yojson "FirstName" _list path;
     email = value_for_key email_of_yojson "Email" _list path;
     business_title = value_for_key job_title_of_yojson "BusinessTitle" _list path;
   }
    : lead_contact)

let lead_interaction_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     contact = value_for_key lead_contact_of_yojson "Contact" _list path;
     business_problem =
       option_of_yojson
         (value_for_key engagement_customer_business_problem_of_yojson "BusinessProblem")
         _list path;
     customer_action = value_for_key customer_action_of_yojson "CustomerAction" _list path;
     interaction_date =
       option_of_yojson (value_for_key date_time_of_yojson "InteractionDate") _list path;
     usecase = option_of_yojson (value_for_key engagement_use_case_of_yojson "Usecase") _list path;
     source_name = value_for_key lead_source_name_of_yojson "SourceName" _list path;
     source_id = value_for_key lead_source_id_of_yojson "SourceId" _list path;
     source_type = value_for_key lead_source_type_of_yojson "SourceType" _list path;
   }
    : lead_interaction)

let lead_insights_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lead_readiness_score =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "LeadReadinessScore")
         _list path;
   }
    : lead_insights)

let update_lead_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     insights = option_of_yojson (value_for_key lead_insights_of_yojson "Insights") _list path;
     interaction =
       option_of_yojson (value_for_key lead_interaction_of_yojson "Interaction") _list path;
     customer = value_for_key lead_customer_of_yojson "Customer" _list path;
     qualification_status =
       option_of_yojson
         (value_for_key lead_qualification_status_of_yojson "QualificationStatus")
         _list path;
   }
    : update_lead_context)

let engagement_identifier_of_yojson = string_of_yojson
let engagement_arn_of_yojson = string_of_yojson
let engagement_context_identifier_of_yojson = string_of_yojson

let update_engagement_context_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     context_id = value_for_key engagement_context_identifier_of_yojson "ContextId" _list path;
     engagement_last_modified_at =
       value_for_key date_time_of_yojson "EngagementLastModifiedAt" _list path;
     engagement_arn = value_for_key engagement_arn_of_yojson "EngagementArn" _list path;
     engagement_id = value_for_key engagement_identifier_of_yojson "EngagementId" _list path;
   }
    : update_engagement_context_response)

let engagement_arn_or_identifier_of_yojson = string_of_yojson

let engagement_context_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ProspectingResult" -> PROSPECTING_RESULT
    | `String "Lead" -> LEAD
    | `String "CustomerProject" -> CUSTOMER_PROJECT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EngagementContextType" value)
    | _ -> raise (deserialize_wrong_type_error path "EngagementContextType")
     : engagement_context_type)
    : engagement_context_type)

let engagement_customer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     country_code = value_for_key country_code_of_yojson "CountryCode" _list path;
     website_url = value_for_key company_website_url_of_yojson "WebsiteUrl" _list path;
     company_name = value_for_key company_name_of_yojson "CompanyName" _list path;
     industry = value_for_key industry_of_yojson "Industry" _list path;
   }
    : engagement_customer)

let engagement_customer_project_title_of_yojson = string_of_yojson

let engagement_customer_project_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_completion_date =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "TargetCompletionDate" _list path;
     business_problem =
       value_for_key engagement_customer_business_problem_of_yojson "BusinessProblem" _list path;
     title = value_for_key engagement_customer_project_title_of_yojson "Title" _list path;
   }
    : engagement_customer_project_details)

let customer_projects_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project =
       option_of_yojson
         (value_for_key engagement_customer_project_details_of_yojson "Project")
         _list path;
     customer = option_of_yojson (value_for_key engagement_customer_of_yojson "Customer") _list path;
   }
    : customer_projects_context)

let prospecting_task_identifier_of_yojson = string_of_yojson
let task_arn_of_yojson = string_of_yojson
let task_name_of_yojson = string_of_yojson
let prospecting_account_name_of_yojson = string_of_yojson
let prospecting_geo_of_yojson = string_of_yojson
let prospecting_region_of_yojson = string_of_yojson
let prospecting_sub_region_of_yojson = string_of_yojson
let prospecting_sub_industry_of_yojson = string_of_yojson
let prospecting_segment_of_yojson = string_of_yojson
let prospecting_company_size_of_yojson = string_of_yojson

let eligible_programs_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let prospecting_public_profile_summary_of_yojson = string_of_yojson

let prospecting_result_customer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     public_profile_summary =
       option_of_yojson
         (value_for_key prospecting_public_profile_summary_of_yojson "PublicProfileSummary")
         _list path;
     eligible_programs =
       option_of_yojson
         (value_for_key eligible_programs_list_of_yojson "EligiblePrograms")
         _list path;
     company_size =
       option_of_yojson (value_for_key prospecting_company_size_of_yojson "CompanySize") _list path;
     segment = option_of_yojson (value_for_key prospecting_segment_of_yojson "Segment") _list path;
     sub_industry =
       option_of_yojson (value_for_key prospecting_sub_industry_of_yojson "SubIndustry") _list path;
     industry = option_of_yojson (value_for_key industry_of_yojson "Industry") _list path;
     country = option_of_yojson (value_for_key country_code_of_yojson "Country") _list path;
     sub_region =
       option_of_yojson (value_for_key prospecting_sub_region_of_yojson "SubRegion") _list path;
     region = option_of_yojson (value_for_key prospecting_region_of_yojson "Region") _list path;
     geo = option_of_yojson (value_for_key prospecting_geo_of_yojson "Geo") _list path;
     account_name =
       option_of_yojson (value_for_key prospecting_account_name_of_yojson "AccountName") _list path;
   }
    : prospecting_result_customer)

let engagement_score_level_of_yojson = string_of_yojson

let prospecting_insights_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     solution_sub_category =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "SolutionSubCategory")
         _list path;
     solution_category =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "SolutionCategory")
         _list path;
     solution_score =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "SolutionScore")
         _list path;
     marketplace_engagement_score =
       option_of_yojson
         (value_for_key engagement_score_level_of_yojson "MarketplaceEngagementScore")
         _list path;
   }
    : prospecting_insights)

let prospecting_result_aws_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     insights =
       option_of_yojson (value_for_key prospecting_insights_of_yojson "Insights") _list path;
     customer =
       option_of_yojson (value_for_key prospecting_result_customer_of_yojson "Customer") _list path;
     task_name = option_of_yojson (value_for_key task_name_of_yojson "TaskName") _list path;
     task_arn = option_of_yojson (value_for_key task_arn_of_yojson "TaskArn") _list path;
     task_id =
       option_of_yojson (value_for_key prospecting_task_identifier_of_yojson "TaskId") _list path;
     end_time = option_of_yojson (value_for_key date_time_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
   }
    : prospecting_result_aws)

let prospecting_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ aws = option_of_yojson (value_for_key prospecting_result_aws_of_yojson "Aws") _list path }
    : prospecting_result)

let update_engagement_context_payload_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "ProspectingResult" -> ProspectingResult (prospecting_result_of_yojson value_ path)
   | "CustomerProject" -> CustomerProject (customer_projects_context_of_yojson value_ path)
   | "Lead" -> Lead (update_lead_context_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "UpdateEngagementContextPayload" unknown)
    : update_engagement_context_payload)

let update_engagement_context_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payload = value_for_key update_engagement_context_payload_of_yojson "Payload" _list path;
     type_ = value_for_key engagement_context_type_of_yojson "Type" _list path;
     engagement_last_modified_at =
       value_for_key date_time_of_yojson "EngagementLastModifiedAt" _list path;
     context_identifier =
       value_for_key engagement_context_identifier_of_yojson "ContextIdentifier" _list path;
     engagement_identifier =
       value_for_key engagement_arn_or_identifier_of_yojson "EngagementIdentifier" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : update_engagement_context_request)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
   }
    : service_quota_exceeded_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let taggable_resource_arn_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path;
   }
    : untag_resource_request)

let task_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "COMPLETE" -> COMPLETE
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "TaskStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TaskStatus")
     : task_status)
    : task_status)

let task_statuses_of_yojson tree path = list_of_yojson task_status_of_yojson tree path
let task_name_list_of_yojson tree path = list_of_yojson task_name_of_yojson tree path
let task_arn_or_identifier_of_yojson = string_of_yojson
let task_identifiers_of_yojson tree path = list_of_yojson task_arn_or_identifier_of_yojson tree path

let task_identifier_list_of_yojson tree path =
  list_of_yojson prospecting_task_identifier_of_yojson tree path

let task_identifier_of_yojson = string_of_yojson

let target_close_date_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     before_target_close_date =
       option_of_yojson (value_for_key date_of_yojson "BeforeTargetCloseDate") _list path;
     after_target_close_date =
       option_of_yojson (value_for_key date_of_yojson "AfterTargetCloseDate") _list path;
   }
    : target_close_date_filter)

let tag_value_of_yojson = string_of_yojson

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "Value" _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path;
   }
    : tag_resource_request)

let sales_involvement_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Co-Sell" -> CO_SELL
    | `String "For Visibility Only" -> FOR_VISIBILITY_ONLY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SalesInvolvementType" value)
    | _ -> raise (deserialize_wrong_type_error path "SalesInvolvementType")
     : sales_involvement_type)
    : sales_involvement_type)

let submit_opportunity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     visibility = option_of_yojson (value_for_key visibility_of_yojson "Visibility") _list path;
     involvement_type = value_for_key sales_involvement_type_of_yojson "InvolvementType" _list path;
     identifier = value_for_key opportunity_identifier_of_yojson "Identifier" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : submit_opportunity_request)

let string_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let resource_snapshot_job_identifier_of_yojson = string_of_yojson

let stop_resource_snapshot_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_snapshot_job_identifier =
       value_for_key resource_snapshot_job_identifier_of_yojson "ResourceSnapshotJobIdentifier"
         _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : stop_resource_snapshot_job_request)

let start_resource_snapshot_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_snapshot_job_identifier =
       value_for_key resource_snapshot_job_identifier_of_yojson "ResourceSnapshotJobIdentifier"
         _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : start_resource_snapshot_job_request)

let engagement_identifier_list_of_yojson tree path =
  list_of_yojson engagement_identifier_of_yojson tree path

let prospecting_task_arn_of_yojson = string_of_yojson

let prospecting_task_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "PENDING" -> PENDING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProspectingTaskStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ProspectingTaskStatus")
     : prospecting_task_status)
    : prospecting_task_status)

let start_prospecting_from_engagement_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_status = value_for_key prospecting_task_status_of_yojson "TaskStatus" _list path;
     task_arn = option_of_yojson (value_for_key prospecting_task_arn_of_yojson "TaskArn") _list path;
     task_id =
       option_of_yojson (value_for_key prospecting_task_identifier_of_yojson "TaskId") _list path;
     start_time = value_for_key date_time_of_yojson "StartTime" _list path;
     reason_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ReasonCode")
         _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     task_name = value_for_key task_name_of_yojson "TaskName" _list path;
     identifiers = value_for_key engagement_identifier_list_of_yojson "Identifiers" _list path;
   }
    : start_prospecting_from_engagement_task_response)

let client_token_of_yojson = string_of_yojson

let start_prospecting_from_engagement_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     task_name = value_for_key task_name_of_yojson "TaskName" _list path;
     identifiers = value_for_key engagement_identifier_list_of_yojson "Identifiers" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : start_prospecting_from_engagement_task_request)

let reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "DisqualifiedLeadNotPermitted" -> DISQUALIFIED_LEAD_NOT_PERMITTED
    | `String "CustomerProjectContextNotPermitted" -> CUSTOMER_PROJECT_CONTEXT_NOT_PERMITTED
    | `String "ContextNotFound" -> CONTEXT_NOT_FOUND
    | `String "RequestThrottled" -> REQUEST_THROTTLED
    | `String "ServiceQuotaExceeded" -> SERVICE_QUOTA_EXCEEDED
    | `String "ResourceSnapshotConflict" -> RESOURCE_SNAPSHOT_CONFLICT
    | `String "ResourceSnapshotValidationFailed" -> RESOURCE_SNAPSHOT_VALIDATION_FAILED
    | `String "ResourceSnapshotAccessDenied" -> RESOURCE_SNAPSHOT_ACCESS_DENIED
    | `String "OpportunityConflict" -> OPPORTUNITY_CONFLICT
    | `String "OpportunityValidationFailed" -> OPPORTUNITY_VALIDATION_FAILED
    | `String "InternalError" -> INTERNAL_ERROR
    | `String "EngagementInvitationConflict" -> ENGAGEMENT_INVITATION_CONFLICT
    | `String "OpportunitySubmissionFailed" -> OPPORTUNITY_SUBMISSION_FAILED
    | `String "EngagementConflict" -> ENGAGEMENT_CONFLICT
    | `String "EngagementValidationFailed" -> ENGAGEMENT_VALIDATION_FAILED
    | `String "ResourceSnapshotJobConflict" -> RESOURCE_SNAPSHOT_JOB_CONFLICT
    | `String "ResourceSnapshotJobValidationFailed" -> RESOURCE_SNAPSHOT_JOB_VALIDATION_FAILED
    | `String "ResourceSnapshotJobAccessDenied" -> RESOURCE_SNAPSHOT_JOB_ACCESS_DENIED
    | `String "OpportunityAccessDenied" -> OPPORTUNITY_ACCESS_DENIED
    | `String "EngagementAccessDenied" -> ENGAGEMENT_ACCESS_DENIED
    | `String "InvitationValidationFailed" -> INVITATION_VALIDATION_FAILED
    | `String "InvitationAccessDenied" -> INVITATION_ACCESS_DENIED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ReasonCode")
     : reason_code)
    : reason_code)

let context_identifier_of_yojson = string_of_yojson

let start_opportunity_from_engagement_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     context_id =
       option_of_yojson (value_for_key context_identifier_of_yojson "ContextId") _list path;
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
     resource_snapshot_job_id =
       option_of_yojson
         (value_for_key resource_snapshot_job_identifier_of_yojson "ResourceSnapshotJobId")
         _list path;
     opportunity_id =
       option_of_yojson (value_for_key opportunity_identifier_of_yojson "OpportunityId") _list path;
     reason_code = option_of_yojson (value_for_key reason_code_of_yojson "ReasonCode") _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     task_status = option_of_yojson (value_for_key task_status_of_yojson "TaskStatus") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     task_arn = option_of_yojson (value_for_key task_arn_of_yojson "TaskArn") _list path;
     task_id = option_of_yojson (value_for_key task_identifier_of_yojson "TaskId") _list path;
   }
    : start_opportunity_from_engagement_task_response)

let start_opportunity_from_engagement_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     context_identifier = value_for_key context_identifier_of_yojson "ContextIdentifier" _list path;
     identifier = value_for_key engagement_arn_or_identifier_of_yojson "Identifier" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : start_opportunity_from_engagement_task_request)

let engagement_invitation_identifier_of_yojson = string_of_yojson

let start_engagement_from_opportunity_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engagement_invitation_id =
       option_of_yojson
         (value_for_key engagement_invitation_identifier_of_yojson "EngagementInvitationId")
         _list path;
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
     resource_snapshot_job_id =
       option_of_yojson
         (value_for_key resource_snapshot_job_identifier_of_yojson "ResourceSnapshotJobId")
         _list path;
     opportunity_id =
       option_of_yojson (value_for_key opportunity_identifier_of_yojson "OpportunityId") _list path;
     reason_code = option_of_yojson (value_for_key reason_code_of_yojson "ReasonCode") _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     task_status = option_of_yojson (value_for_key task_status_of_yojson "TaskStatus") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     task_arn = option_of_yojson (value_for_key task_arn_of_yojson "TaskArn") _list path;
     task_id = option_of_yojson (value_for_key task_identifier_of_yojson "TaskId") _list path;
   }
    : start_engagement_from_opportunity_task_response)

let aws_submission_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     visibility = option_of_yojson (value_for_key visibility_of_yojson "Visibility") _list path;
     involvement_type = value_for_key sales_involvement_type_of_yojson "InvolvementType" _list path;
   }
    : aws_submission)

let start_engagement_from_opportunity_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     aws_submission = value_for_key aws_submission_of_yojson "AwsSubmission" _list path;
     identifier = value_for_key opportunity_identifier_of_yojson "Identifier" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : start_engagement_from_opportunity_task_request)

let start_engagement_by_accepting_invitation_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engagement_invitation_id =
       option_of_yojson
         (value_for_key engagement_invitation_identifier_of_yojson "EngagementInvitationId")
         _list path;
     resource_snapshot_job_id =
       option_of_yojson
         (value_for_key resource_snapshot_job_identifier_of_yojson "ResourceSnapshotJobId")
         _list path;
     opportunity_id =
       option_of_yojson (value_for_key opportunity_identifier_of_yojson "OpportunityId") _list path;
     reason_code = option_of_yojson (value_for_key reason_code_of_yojson "ReasonCode") _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     task_status = option_of_yojson (value_for_key task_status_of_yojson "TaskStatus") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     task_arn = option_of_yojson (value_for_key task_arn_of_yojson "TaskArn") _list path;
     task_id = option_of_yojson (value_for_key task_identifier_of_yojson "TaskId") _list path;
   }
    : start_engagement_by_accepting_invitation_task_response)

let engagement_invitation_arn_or_identifier_of_yojson = string_of_yojson

let start_engagement_by_accepting_invitation_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     identifier =
       value_for_key engagement_invitation_arn_or_identifier_of_yojson "Identifier" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : start_engagement_by_accepting_invitation_task_request)

let sort_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "DESCENDING" -> DESCENDING
    | `String "ASCENDING" -> ASCENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")
     : sort_order)
    : sort_order)

let sort_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "CreatedDate" -> CREATED_DATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortBy" value)
    | _ -> raise (deserialize_wrong_type_error path "SortBy")
     : sort_by)
    : sort_by)

let sort_object_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "SortOrder") _list path;
     sort_by = option_of_yojson (value_for_key sort_by_of_yojson "SortBy") _list path;
   }
    : sort_object)

let solution_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Draft" -> DRAFT
    | `String "Inactive" -> INACTIVE
    | `String "Active" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SolutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SolutionStatus")
     : solution_status)
    : solution_status)

let solution_sort_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "CreatedDate" -> CREATEDDATE
    | `String "Category" -> CATEGORY
    | `String "Status" -> STATUS
    | `String "Name" -> NAME
    | `String "Identifier" -> IDENTIFIER
    | `String value -> raise (deserialize_unknown_enum_value_error path "SolutionSortName" value)
    | _ -> raise (deserialize_wrong_type_error path "SolutionSortName")
     : solution_sort_name)
    : solution_sort_name)

let solution_sort_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_by = value_for_key solution_sort_name_of_yojson "SortBy" _list path;
     sort_order = value_for_key sort_order_of_yojson "SortOrder" _list path;
   }
    : solution_sort)

let solution_identifier_of_yojson = string_of_yojson
let solution_arn_of_yojson = string_of_yojson
let aws_marketplace_solution_arn_of_yojson = string_of_yojson

let solution_base_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_marketplace_solution_arn =
       option_of_yojson
         (value_for_key aws_marketplace_solution_arn_of_yojson "AwsMarketplaceSolutionArn")
         _list path;
     created_date = value_for_key date_time_of_yojson "CreatedDate" _list path;
     category =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Category" _list path;
     status = value_for_key solution_status_of_yojson "Status" _list path;
     name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Name" _list path;
     arn = option_of_yojson (value_for_key solution_arn_of_yojson "Arn") _list path;
     id = value_for_key solution_identifier_of_yojson "Id" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : solution_base)

let solution_list_of_yojson tree path = list_of_yojson solution_base_of_yojson tree path

let solution_identifiers_of_yojson tree path =
  list_of_yojson solution_identifier_of_yojson tree path

let sender_contact_email_of_yojson = string_of_yojson

let sender_contact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     phone = option_of_yojson (value_for_key phone_number_of_yojson "Phone") _list path;
     business_title =
       option_of_yojson (value_for_key job_title_of_yojson "BusinessTitle") _list path;
     last_name = option_of_yojson (value_for_key name_of_yojson "LastName") _list path;
     first_name = option_of_yojson (value_for_key name_of_yojson "FirstName") _list path;
     email = value_for_key sender_contact_email_of_yojson "Email" _list path;
   }
    : sender_contact)

let sender_contact_list_of_yojson tree path = list_of_yojson sender_contact_of_yojson tree path

let resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Opportunity" -> OPPORTUNITY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let resource_template_name_of_yojson = string_of_yojson
let resource_snapshot_arn_of_yojson = string_of_yojson
let resource_snapshot_revision_of_yojson = int_of_yojson
let resource_identifier_of_yojson = string_of_yojson

let resource_snapshot_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_by = option_of_yojson (value_for_key aws_account_of_yojson "CreatedBy") _list path;
     resource_snapshot_template_name =
       option_of_yojson
         (value_for_key resource_template_name_of_yojson "ResourceSnapshotTemplateName")
         _list path;
     resource_id =
       option_of_yojson (value_for_key resource_identifier_of_yojson "ResourceId") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     revision =
       option_of_yojson (value_for_key resource_snapshot_revision_of_yojson "Revision") _list path;
     arn = option_of_yojson (value_for_key resource_snapshot_arn_of_yojson "Arn") _list path;
   }
    : resource_snapshot_summary)

let resource_snapshot_summary_list_of_yojson tree path =
  list_of_yojson resource_snapshot_summary_of_yojson tree path

let life_cycle_for_view_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_steps = option_of_yojson (value_for_key pii_string_of_yojson "NextSteps") _list path;
     stage = option_of_yojson (value_for_key stage_of_yojson "Stage") _list path;
     review_status =
       option_of_yojson (value_for_key review_status_of_yojson "ReviewStatus") _list path;
     target_close_date =
       option_of_yojson (value_for_key date_of_yojson "TargetCloseDate") _list path;
   }
    : life_cycle_for_view)

let partner_opportunity_team_members_list_of_yojson tree path =
  list_of_yojson contact_of_yojson tree path

let project_view_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     other_solution_description =
       option_of_yojson (value_for_key pii_string_of_yojson "OtherSolutionDescription") _list path;
     sales_activities =
       option_of_yojson (value_for_key sales_activities_of_yojson "SalesActivities") _list path;
     customer_use_case =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "CustomerUseCase")
         _list path;
     expected_contract_duration =
       option_of_yojson
         (value_for_key expected_contract_duration_of_yojson "ExpectedContractDuration")
         _list path;
     expected_customer_spend =
       option_of_yojson
         (value_for_key expected_customer_spend_list_of_yojson "ExpectedCustomerSpend")
         _list path;
     delivery_models =
       option_of_yojson (value_for_key delivery_models_of_yojson "DeliveryModels") _list path;
   }
    : project_view)

let aws_marketplace_offer_identifier_of_yojson = string_of_yojson

let aws_marketplace_offer_identifiers_of_yojson tree path =
  list_of_yojson aws_marketplace_offer_identifier_of_yojson tree path

let aws_marketplace_offer_set_identifier_of_yojson = string_of_yojson

let aws_marketplace_offer_set_identifiers_of_yojson tree path =
  list_of_yojson aws_marketplace_offer_set_identifier_of_yojson tree path

let aws_product_identifier_of_yojson = string_of_yojson

let aws_product_identifiers_of_yojson tree path =
  list_of_yojson aws_product_identifier_of_yojson tree path

let aws_marketplace_solution_identifier_of_yojson = string_of_yojson

let aws_marketplace_solution_identifiers_of_yojson tree path =
  list_of_yojson aws_marketplace_solution_identifier_of_yojson tree path

let aws_marketplace_product_arn_of_yojson = string_of_yojson

let aws_marketplace_product_identifiers_of_yojson tree path =
  list_of_yojson aws_marketplace_product_arn_of_yojson tree path

let related_entity_identifiers_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_marketplace_products =
       option_of_yojson
         (value_for_key aws_marketplace_product_identifiers_of_yojson "AwsMarketplaceProducts")
         _list path;
     aws_marketplace_solutions =
       option_of_yojson
         (value_for_key aws_marketplace_solution_identifiers_of_yojson "AwsMarketplaceSolutions")
         _list path;
     aws_products =
       option_of_yojson (value_for_key aws_product_identifiers_of_yojson "AwsProducts") _list path;
     solutions =
       option_of_yojson (value_for_key solution_identifiers_of_yojson "Solutions") _list path;
     aws_marketplace_offer_sets =
       option_of_yojson
         (value_for_key aws_marketplace_offer_set_identifiers_of_yojson "AwsMarketplaceOfferSets")
         _list path;
     aws_marketplace_offers =
       option_of_yojson
         (value_for_key aws_marketplace_offer_identifiers_of_yojson "AwsMarketplaceOffers")
         _list path;
   }
    : related_entity_identifiers)

let opportunity_summary_view_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     related_entity_identifiers =
       option_of_yojson
         (value_for_key related_entity_identifiers_of_yojson "RelatedEntityIdentifiers")
         _list path;
     project = option_of_yojson (value_for_key project_view_of_yojson "Project") _list path;
     customer = option_of_yojson (value_for_key customer_of_yojson "Customer") _list path;
     primary_needs_from_aws =
       option_of_yojson
         (value_for_key primary_needs_from_aws_of_yojson "PrimaryNeedsFromAws")
         _list path;
     opportunity_team =
       option_of_yojson
         (value_for_key partner_opportunity_team_members_list_of_yojson "OpportunityTeam")
         _list path;
     lifecycle =
       option_of_yojson (value_for_key life_cycle_for_view_of_yojson "Lifecycle") _list path;
     opportunity_type =
       option_of_yojson (value_for_key opportunity_type_of_yojson "OpportunityType") _list path;
   }
    : opportunity_summary_view)

let opportunity_origin_of_yojson (tree : t) path =
  ((match tree with
    | `String "Partner Referral" -> PARTNER_REFERRAL
    | `String "AWS Referral" -> AWS_REFERRAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpportunityOrigin" value)
    | _ -> raise (deserialize_wrong_type_error path "OpportunityOrigin")
     : opportunity_origin)
    : opportunity_origin)

let aws_closed_lost_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "Term Sheet Impasse" -> TERM_SHEET_IMPASSE
    | `String "Technical Limitations" -> TECHNICAL_LIMITATIONS
    | `String "Self-Service" -> SELF_SERVICE
    | `String "Security / Compliance" -> SECURITY_COMPLIANCE
    | `String "Product Not on AWS" -> PRODUCT_NOT_ON_AWS
    | `String "Product/Technology" -> PRODUCT_TECHNOLOGY
    | `String "Price" -> PRICE
    | `String "Preference for Competitor" -> PREFERENCE_FOR_COMPETITOR
    | `String "Platform Technology Limitation" -> PLATFORM_TECHNOLOGY_LIMITATION
    | `String "People/Relationship/Governance" -> PEOPLE_RELATIONSHIP_GOVERNANCE
    | `String "Past Due" -> PAST_DUE
    | `String "Partner Gap" -> PARTNER_GAP
    | `String "Other (Details in Description)" -> OTHER_DETAILS_IN_DESCRIPTION
    | `String "Other" -> OTHER
    | `String "On Premises Deployment" -> ON_PREMISES_DEPLOYMENT
    | `String "No Update" -> NO_UPDATE
    | `String "Not Committed to AWS" -> NOT_COMMITTED_TO_AWS
    | `String "No Response" -> NO_RESPONSE
    | `String "No Perceived Value of MP" -> NO_PERCEIVED_VALUE_OF_MP
    | `String "No Opportunity" -> NO_OPPORTUNITY
    | `String "No Integration Resources" -> NO_INTEGRATION_RESOURCES
    | `String "No Customer Reference" -> NO_CUSTOMER_REFERENCE
    | `String "Lost to Competitor - VMWare" -> LOST_TO_COMPETITOR_VMWARE
    | `String "Lost to Competitor - SoftLayer" -> LOST_TO_COMPETITOR_SOFTLAYER
    | `String "Lost to Competitor - Rackspace" -> LOST_TO_COMPETITOR_RACKSPACE
    | `String "Lost to Competitor - Other" -> LOST_TO_COMPETITOR_OTHER
    | `String "Lost to Competitor - Microsoft" -> LOST_TO_COMPETITOR_MICROSOFT
    | `String "Lost to Competitor - Google" -> LOST_TO_COMPETITOR_GOOGLE
    | `String "Lost to Competitor" -> LOST_TO_COMPETITOR
    | `String "Legal Terms and Conditions" -> LEGAL_TERMS_AND_CONDITIONS
    | `String "Legal / Tax / Regulatory" -> LEGAL_TAX_REGULATORY
    | `String "International Constraints" -> INTERNATIONAL_CONSTRAINTS
    | `String "Insufficient AWS Value" -> INSUFFICIENT_AWS_VALUE
    | `String "Insufficient Amazon Value" -> INSUFFICIENT_AMAZON_VALUE
    | `String "Financial/Commercial" -> FINANCIAL_COMMERCIAL
    | `String "Feature Limitation" -> FEATURE_LIMITATION
    | `String "Failed Vetting" -> FAILED_VETTING
    | `String "Executive Blocker" -> EXECUTIVE_BLOCKER
    | `String "Duplicate Opportunity" -> DUPLICATE_OPPORTUNITY
    | `String "Duplicate" -> DUPLICATE
    | `String "Delay / Cancellation of Project" -> DELAY_CANCELLATION_OF_PROJECT
    | `String "Customer Experience" -> CUSTOMER_EXPERIENCE
    | `String "Customer Deficiency" -> CUSTOMER_DEFICIENCY
    | `String "Customer Data Requirement" -> CUSTOMER_DATA_REQUIREMENT
    | `String "Competitive Offering" -> COMPETITIVE_OFFERING
    | `String "Company Acquired/Dissolved" -> COMPANY_ACQUIRED_DISSOLVED
    | `String "Business Associate Agreement" -> BUSINESS_ASSOCIATE_AGREEMENT
    | `String "Administrative" -> ADMINISTRATIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "AwsClosedLostReason" value)
    | _ -> raise (deserialize_wrong_type_error path "AwsClosedLostReason")
     : aws_closed_lost_reason)
    : aws_closed_lost_reason)

let aws_opportunity_stage_of_yojson (tree : t) path =
  ((match tree with
    | `String "Closed Incomplete" -> CLOSED_INCOMPLETE
    | `String "Completed" -> COMPLETED
    | `String "Closed Lost" -> CLOSED_LOST
    | `String "Deferred to Partner" -> DEFERRED_TO_PARTNER
    | `String "Launched" -> LAUNCHED
    | `String "Committed" -> COMMITTED
    | `String "Business Validation" -> BUSINESS_VALIDATION
    | `String "Technical Validation" -> TECHNICAL_VALIDATION
    | `String "On-hold" -> ON_HOLD
    | `String "Qualified" -> QUALIFIED
    | `String "Building Integration" -> BUILDING_INTEGRATION
    | `String "Onboarding" -> ONBOARDING
    | `String "Contract Negotiation" -> CONTRACT_NEGOTIATION
    | `String "Term Sheet Negotiation" -> TERM_SHEET_NEGOTIATION
    | `String "Seller Registered" -> SELLER_REGISTERED
    | `String "Evaluating" -> EVALUATING
    | `String "Seller Engaged" -> SELLER_ENGAGED
    | `String "Research" -> RESEARCH
    | `String "Qualify" -> QUALIFY
    | `String "Identified" -> IDENTIFIED
    | `String "Engaged" -> ENGAGED
    | `String "Prospect" -> PROSPECT
    | `String "In Progress" -> IN_PROGRESS
    | `String "Not Started" -> NOT_STARTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AwsOpportunityStage" value)
    | _ -> raise (deserialize_wrong_type_error path "AwsOpportunityStage")
     : aws_opportunity_stage)
    : aws_opportunity_stage)

let profile_next_steps_history_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time = value_for_key date_time_of_yojson "Time" _list path;
     value =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Value" _list path;
   }
    : profile_next_steps_history)

let profile_next_steps_histories_of_yojson tree path =
  list_of_yojson profile_next_steps_history_of_yojson tree path

let aws_opportunity_life_cycle_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_steps_history =
       option_of_yojson
         (value_for_key profile_next_steps_histories_of_yojson "NextStepsHistory")
         _list path;
     next_steps = option_of_yojson (value_for_key pii_string_of_yojson "NextSteps") _list path;
     stage = option_of_yojson (value_for_key aws_opportunity_stage_of_yojson "Stage") _list path;
     closed_lost_reason =
       option_of_yojson
         (value_for_key aws_closed_lost_reason_of_yojson "ClosedLostReason")
         _list path;
     target_close_date =
       option_of_yojson (value_for_key date_of_yojson "TargetCloseDate") _list path;
   }
    : aws_opportunity_life_cycle)

let aws_member_business_title_of_yojson (tree : t) path =
  ((match tree with
    | `String "ISVSM" -> ISVSM
    | `String "PSM" -> PSM
    | `String "PDM" -> PDM
    | `String "WWPSPDM" -> WWPSPDM
    | `String "AWSAccountOwner" -> AWS_ACCOUNT_OWNER
    | `String "AWSSalesRep" -> AWS_SALES_REP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AwsMemberBusinessTitle" value)
    | _ -> raise (deserialize_wrong_type_error path "AwsMemberBusinessTitle")
     : aws_member_business_title)
    : aws_member_business_title)

let aws_team_member_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     business_title =
       option_of_yojson
         (value_for_key aws_member_business_title_of_yojson "BusinessTitle")
         _list path;
     last_name = option_of_yojson (value_for_key name_of_yojson "LastName") _list path;
     first_name = option_of_yojson (value_for_key name_of_yojson "FirstName") _list path;
     email = option_of_yojson (value_for_key email_of_yojson "Email") _list path;
   }
    : aws_team_member)

let aws_opportunity_team_members_list_of_yojson tree path =
  list_of_yojson aws_team_member_of_yojson tree path

let engagement_score_of_yojson (tree : t) path =
  ((match tree with
    | `String "Low" -> LOW
    | `String "Medium" -> MEDIUM
    | `String "High" -> HIGH
    | `String value -> raise (deserialize_unknown_enum_value_error path "EngagementScore" value)
    | _ -> raise (deserialize_wrong_type_error path "EngagementScore")
     : engagement_score)
    : engagement_score)

let monetary_amount_of_yojson = string_of_yojson

let amount_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson monetary_amount_of_yojson
    tree path

let aws_product_optimization_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_amount = value_for_key monetary_amount_of_yojson "SavingsAmount" _list path;
     description =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Description" _list
         path;
   }
    : aws_product_optimization)

let aws_product_optimizations_list_of_yojson tree path =
  list_of_yojson aws_product_optimization_of_yojson tree path

let aws_product_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     optimizations =
       value_for_key aws_product_optimizations_list_of_yojson "Optimizations" _list path;
     potential_savings_amount =
       option_of_yojson
         (value_for_key monetary_amount_of_yojson "PotentialSavingsAmount")
         _list path;
     optimized_amount =
       option_of_yojson (value_for_key monetary_amount_of_yojson "OptimizedAmount") _list path;
     amount = option_of_yojson (value_for_key monetary_amount_of_yojson "Amount") _list path;
     categories = value_for_key string_list_of_yojson "Categories" _list path;
     service_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ServiceCode")
         _list path;
     product_code =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ProductCode" _list
         path;
   }
    : aws_product_details)

let aws_products_list_of_yojson tree path = list_of_yojson aws_product_details_of_yojson tree path

let aws_product_insights_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_products = value_for_key aws_products_list_of_yojson "AwsProducts" _list path;
     total_amount_by_category =
       value_for_key amount_map_of_yojson "TotalAmountByCategory" _list path;
     total_potential_savings_amount =
       option_of_yojson
         (value_for_key monetary_amount_of_yojson "TotalPotentialSavingsAmount")
         _list path;
     total_optimized_amount =
       option_of_yojson (value_for_key monetary_amount_of_yojson "TotalOptimizedAmount") _list path;
     total_amount =
       option_of_yojson (value_for_key monetary_amount_of_yojson "TotalAmount") _list path;
     frequency = value_for_key payment_frequency_of_yojson "Frequency" _list path;
     currency_code = value_for_key currency_code_of_yojson "CurrencyCode" _list path;
   }
    : aws_product_insights)

let aws_products_spend_insights_by_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aw_s = option_of_yojson (value_for_key aws_product_insights_of_yojson "AWS") _list path;
     partner = option_of_yojson (value_for_key aws_product_insights_of_yojson "Partner") _list path;
   }
    : aws_products_spend_insights_by_source)

let opportunity_quality_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trend =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Trend")
         _list path;
     score =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "Score")
         _list path;
   }
    : opportunity_quality)

let recommendation_attribute_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let recommendation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes =
       option_of_yojson
         (value_for_key recommendation_attribute_map_of_yojson "Attributes")
         _list path;
     details =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Details" _list path;
     type_ =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Type" _list path;
   }
    : recommendation)

let recommendation_list_of_yojson tree path = list_of_yojson recommendation_of_yojson tree path

let aws_opportunity_insights_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommendations =
       option_of_yojson (value_for_key recommendation_list_of_yojson "Recommendations") _list path;
     opportunity_quality =
       option_of_yojson
         (value_for_key opportunity_quality_of_yojson "OpportunityQuality")
         _list path;
     aws_products_spend_insights_by_source =
       option_of_yojson
         (value_for_key aws_products_spend_insights_by_source_of_yojson
            "AwsProductsSpendInsightsBySource")
         _list path;
     engagement_score =
       option_of_yojson (value_for_key engagement_score_of_yojson "EngagementScore") _list path;
     next_best_actions =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextBestActions")
         _list path;
   }
    : aws_opportunity_insights)

let involvement_type_change_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "Risk Mitigation" -> RISK_MITIGATION
    | `String "Technical Complexity" -> TECHNICAL_COMPLEXITY
    | `String "Customer Requested" -> CUSTOMER_REQUESTED
    | `String "Change in Deal Information" -> CHANGE_IN_DEAL_INFORMATION
    | `String "Expansion Opportunity" -> EXPANSION_OPPORTUNITY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InvolvementTypeChangeReason" value)
    | _ -> raise (deserialize_wrong_type_error path "InvolvementTypeChangeReason")
     : involvement_type_change_reason)
    : involvement_type_change_reason)

let aws_opportunity_related_entities_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_marketplace_products =
       option_of_yojson
         (value_for_key aws_marketplace_product_identifiers_of_yojson "AwsMarketplaceProducts")
         _list path;
     aws_marketplace_solutions =
       option_of_yojson
         (value_for_key aws_marketplace_solution_identifiers_of_yojson "AwsMarketplaceSolutions")
         _list path;
     solutions =
       option_of_yojson (value_for_key solution_identifiers_of_yojson "Solutions") _list path;
     aws_products =
       option_of_yojson (value_for_key aws_product_identifiers_of_yojson "AwsProducts") _list path;
   }
    : aws_opportunity_related_entities)

let aws_opportunity_customer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     contacts =
       option_of_yojson (value_for_key customer_contacts_list_of_yojson "Contacts") _list path;
   }
    : aws_opportunity_customer)

let aws_opportunity_project_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_partition =
       option_of_yojson (value_for_key aws_partition_of_yojson "AwsPartition") _list path;
     expected_customer_spend =
       option_of_yojson
         (value_for_key expected_customer_spend_list_of_yojson "ExpectedCustomerSpend")
         _list path;
   }
    : aws_opportunity_project)

let aws_opportunity_summary_full_view_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cosell_motion =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "CosellMotion")
         _list path;
     project =
       option_of_yojson (value_for_key aws_opportunity_project_of_yojson "Project") _list path;
     customer =
       option_of_yojson (value_for_key aws_opportunity_customer_of_yojson "Customer") _list path;
     related_entity_ids =
       option_of_yojson
         (value_for_key aws_opportunity_related_entities_of_yojson "RelatedEntityIds")
         _list path;
     involvement_type_change_reason =
       option_of_yojson
         (value_for_key involvement_type_change_reason_of_yojson "InvolvementTypeChangeReason")
         _list path;
     insights =
       option_of_yojson (value_for_key aws_opportunity_insights_of_yojson "Insights") _list path;
     opportunity_team =
       option_of_yojson
         (value_for_key aws_opportunity_team_members_list_of_yojson "OpportunityTeam")
         _list path;
     life_cycle =
       option_of_yojson (value_for_key aws_opportunity_life_cycle_of_yojson "LifeCycle") _list path;
     visibility = option_of_yojson (value_for_key visibility_of_yojson "Visibility") _list path;
     involvement_type =
       option_of_yojson
         (value_for_key sales_involvement_type_of_yojson "InvolvementType")
         _list path;
     origin = option_of_yojson (value_for_key opportunity_origin_of_yojson "Origin") _list path;
     related_opportunity_id =
       option_of_yojson
         (value_for_key opportunity_identifier_of_yojson "RelatedOpportunityId")
         _list path;
   }
    : aws_opportunity_summary_full_view)

let resource_snapshot_payload_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "AwsOpportunitySummaryFullView" ->
       AwsOpportunitySummaryFullView (aws_opportunity_summary_full_view_of_yojson value_ path)
   | "OpportunitySummary" -> OpportunitySummary (opportunity_summary_view_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "ResourceSnapshotPayload" unknown)
    : resource_snapshot_payload)

let resource_snapshot_job_arn_of_yojson = string_of_yojson

let resource_snapshot_job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Stopped" -> STOPPED
    | `String "Running" -> RUNNING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResourceSnapshotJobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceSnapshotJobStatus")
     : resource_snapshot_job_status)
    : resource_snapshot_job_status)

let resource_snapshot_job_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key resource_snapshot_job_status_of_yojson "Status") _list path;
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
     arn = option_of_yojson (value_for_key resource_snapshot_job_arn_of_yojson "Arn") _list path;
     id =
       option_of_yojson (value_for_key resource_snapshot_job_identifier_of_yojson "Id") _list path;
   }
    : resource_snapshot_job_summary)

let resource_snapshot_job_summary_list_of_yojson tree path =
  list_of_yojson resource_snapshot_job_summary_of_yojson tree path

let resource_snapshot_job_role_identifier_of_yojson = string_of_yojson
let resource_snapshot_job_role_arn_of_yojson = string_of_yojson
let resource_arn_of_yojson = string_of_yojson

let related_entity_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AwsMarketplaceProducts" -> AWS_MARKETPLACE_PRODUCTS
    | `String "AwsMarketplaceSolutions" -> AWS_MARKETPLACE_SOLUTIONS
    | `String "AwsMarketplaceOfferSets" -> AWS_MARKETPLACE_OFFER_SETS
    | `String "AwsMarketplaceOffers" -> AWS_MARKETPLACE_OFFERS
    | `String "AwsProducts" -> AWS_PRODUCTS
    | `String "Solutions" -> SOLUTIONS
    | `String value -> raise (deserialize_unknown_enum_value_error path "RelatedEntityType" value)
    | _ -> raise (deserialize_wrong_type_error path "RelatedEntityType")
     : related_entity_type)
    : related_entity_type)

let rejection_reason_string_of_yojson = string_of_yojson

let reject_engagement_invitation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rejection_reason =
       option_of_yojson
         (value_for_key rejection_reason_string_of_yojson "RejectionReason")
         _list path;
     identifier =
       value_for_key engagement_invitation_arn_or_identifier_of_yojson "Identifier" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : reject_engagement_invitation_request)

let receiver_responsibility_of_yojson (tree : t) path =
  ((match tree with
    | `String "Facilitator" -> FACILITATOR
    | `String "Co-Sell Facilitator" -> CO_SELL_FACILITATOR
    | `String "Training Partner" -> TRAINING_PARTNER
    | `String "Services Partner" -> SERVICES_PARTNER
    | `String "Software Partner" -> SOFTWARE_PARTNER
    | `String "Managed Service Provider" -> MANAGED_SERVICE_PROVIDER
    | `String "Hardware Partner" -> HARDWARE_PARTNER
    | `String "Reseller" -> RESELLER
    | `String "Distributor" -> DISTRIBUTOR
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ReceiverResponsibility" value)
    | _ -> raise (deserialize_wrong_type_error path "ReceiverResponsibility")
     : receiver_responsibility)
    : receiver_responsibility)

let receiver_responsibility_list_of_yojson tree path =
  list_of_yojson receiver_responsibility_of_yojson tree path

let alias_of_yojson = string_of_yojson

let account_receiver_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_account_id = value_for_key aws_account_of_yojson "AwsAccountId" _list path;
     alias = option_of_yojson (value_for_key alias_of_yojson "Alias") _list path;
   }
    : account_receiver)

let receiver_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Account" -> Account (account_receiver_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "Receiver" unknown)
    : receiver)

let put_selling_system_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_snapshot_job_role_arn =
       option_of_yojson
         (value_for_key resource_snapshot_job_role_arn_of_yojson "ResourceSnapshotJobRoleArn")
         _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : put_selling_system_settings_response)

let put_selling_system_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_snapshot_job_role_identifier =
       option_of_yojson
         (value_for_key resource_snapshot_job_role_identifier_of_yojson
            "ResourceSnapshotJobRoleIdentifier")
         _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : put_selling_system_settings_request)

let prospecting_task_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_engagement_count =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
         "FailedEngagementCount" _list path;
     completed_engagement_count =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
         "CompletedEngagementCount" _list path;
     total_engagement_count =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
         "TotalEngagementCount" _list path;
     end_time = option_of_yojson (value_for_key date_time_of_yojson "EndTime") _list path;
     start_time = value_for_key date_time_of_yojson "StartTime" _list path;
     task_name = value_for_key task_name_of_yojson "TaskName" _list path;
     task_arn = value_for_key prospecting_task_arn_of_yojson "TaskArn" _list path;
     task_id = value_for_key prospecting_task_identifier_of_yojson "TaskId" _list path;
   }
    : prospecting_task_summary)

let prospecting_task_summary_list_of_yojson tree path =
  list_of_yojson prospecting_task_summary_of_yojson tree path

let prospecting_from_engagement_task_sort_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "FailedEngagementCount" -> FailedEngagementCount
    | `String "TaskName" -> TaskName
    | `String "StartTime" -> StartTime
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ProspectingFromEngagementTaskSortName" value)
    | _ -> raise (deserialize_wrong_type_error path "ProspectingFromEngagementTaskSortName")
     : prospecting_from_engagement_task_sort_name)
    : prospecting_from_engagement_task_sort_name)

let prospecting_from_engagement_task_sort_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_by =
       value_for_key prospecting_from_engagement_task_sort_name_of_yojson "SortBy" _list path;
     sort_order = value_for_key sort_order_of_yojson "SortOrder" _list path;
   }
    : prospecting_from_engagement_task_sort)

let project_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expected_contract_duration =
       option_of_yojson
         (value_for_key expected_contract_duration_of_yojson "ExpectedContractDuration")
         _list path;
     expected_customer_spend =
       option_of_yojson
         (value_for_key expected_customer_spend_list_of_yojson "ExpectedCustomerSpend")
         _list path;
     delivery_models =
       option_of_yojson (value_for_key delivery_models_of_yojson "DeliveryModels") _list path;
   }
    : project_summary)

let project_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expected_customer_spend =
       value_for_key expected_customer_spend_list_of_yojson "ExpectedCustomerSpend" _list path;
     target_completion_date = value_for_key date_of_yojson "TargetCompletionDate" _list path;
     title =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Title" _list path;
     business_problem =
       value_for_key engagement_customer_business_problem_of_yojson "BusinessProblem" _list path;
   }
    : project_details)

let opportunity_invitation_payload_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project = value_for_key project_details_of_yojson "Project" _list path;
     customer = value_for_key engagement_customer_of_yojson "Customer" _list path;
     receiver_responsibilities =
       value_for_key receiver_responsibility_list_of_yojson "ReceiverResponsibilities" _list path;
     sender_contacts =
       option_of_yojson (value_for_key sender_contact_list_of_yojson "SenderContacts") _list path;
   }
    : opportunity_invitation_payload)

let lead_invitation_customer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     market_segment =
       option_of_yojson (value_for_key market_segment_of_yojson "MarketSegment") _list path;
     aws_maturity = option_of_yojson (value_for_key aws_maturity_of_yojson "AwsMaturity") _list path;
     country_code = value_for_key country_code_of_yojson "CountryCode" _list path;
     website_url =
       option_of_yojson (value_for_key company_website_url_of_yojson "WebsiteUrl") _list path;
     company_name = value_for_key company_name_of_yojson "CompanyName" _list path;
     industry = option_of_yojson (value_for_key industry_of_yojson "Industry") _list path;
   }
    : lead_invitation_customer)

let lead_invitation_interaction_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     contact_business_title = value_for_key job_title_of_yojson "ContactBusinessTitle" _list path;
     usecase = option_of_yojson (value_for_key engagement_use_case_of_yojson "Usecase") _list path;
     source_name = value_for_key lead_source_name_of_yojson "SourceName" _list path;
     source_id = value_for_key lead_source_id_of_yojson "SourceId" _list path;
     source_type = value_for_key lead_source_type_of_yojson "SourceType" _list path;
   }
    : lead_invitation_interaction)

let lead_invitation_payload_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     interaction = value_for_key lead_invitation_interaction_of_yojson "Interaction" _list path;
     customer = value_for_key lead_invitation_customer_of_yojson "Customer" _list path;
   }
    : lead_invitation_payload)

let payload_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "LeadInvitation" -> LeadInvitation (lead_invitation_payload_of_yojson value_ path)
   | "OpportunityInvitation" ->
       OpportunityInvitation (opportunity_invitation_payload_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "Payload" unknown)
    : payload)

let participant_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "RECEIVER" -> RECEIVER
    | `String "SENDER" -> SENDER
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParticipantType" value)
    | _ -> raise (deserialize_wrong_type_error path "ParticipantType")
     : participant_type)
    : participant_type)

let page_size_of_yojson = int_of_yojson
let opportunity_arn_of_yojson = string_of_yojson

let life_cycle_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     review_status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ReviewStatusReason")
         _list path;
     review_comments =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ReviewComments")
         _list path;
     review_status =
       option_of_yojson (value_for_key review_status_of_yojson "ReviewStatus") _list path;
     target_close_date =
       option_of_yojson (value_for_key date_of_yojson "TargetCloseDate") _list path;
     next_steps = option_of_yojson (value_for_key pii_string_of_yojson "NextSteps") _list path;
     closed_lost_reason =
       option_of_yojson (value_for_key closed_lost_reason_of_yojson "ClosedLostReason") _list path;
     stage = option_of_yojson (value_for_key stage_of_yojson "Stage") _list path;
   }
    : life_cycle_summary)

let account_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     address = option_of_yojson (value_for_key address_summary_of_yojson "Address") _list path;
     website_url = option_of_yojson (value_for_key website_url_of_yojson "WebsiteUrl") _list path;
     company_name = value_for_key name_of_yojson "CompanyName" _list path;
     other_industry =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "OtherIndustry")
         _list path;
     industry = option_of_yojson (value_for_key industry_of_yojson "Industry") _list path;
   }
    : account_summary)

let customer_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ account = option_of_yojson (value_for_key account_summary_of_yojson "Account") _list path }
    : customer_summary)

let opportunity_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     project = option_of_yojson (value_for_key project_summary_of_yojson "Project") _list path;
     customer = option_of_yojson (value_for_key customer_summary_of_yojson "Customer") _list path;
     life_cycle =
       option_of_yojson (value_for_key life_cycle_summary_of_yojson "LifeCycle") _list path;
     created_date = option_of_yojson (value_for_key date_time_of_yojson "CreatedDate") _list path;
     last_modified_date =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedDate") _list path;
     opportunity_type =
       option_of_yojson (value_for_key opportunity_type_of_yojson "OpportunityType") _list path;
     partner_opportunity_identifier =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "PartnerOpportunityIdentifier")
         _list path;
     arn = option_of_yojson (value_for_key opportunity_arn_of_yojson "Arn") _list path;
     id = option_of_yojson (value_for_key opportunity_identifier_of_yojson "Id") _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : opportunity_summary)

let opportunity_summaries_of_yojson tree path =
  list_of_yojson opportunity_summary_of_yojson tree path

let opportunity_sort_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "TargetCloseDate" -> TARGET_CLOSE_DATE
    | `String "CreatedDate" -> CREATED_DATE
    | `String "CustomerCompanyName" -> CUSTOMER_COMPANY_NAME
    | `String "Identifier" -> IDENTIFIER
    | `String "LastModifiedDate" -> LAST_MODIFIEDDATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpportunitySortName" value)
    | _ -> raise (deserialize_wrong_type_error path "OpportunitySortName")
     : opportunity_sort_name)
    : opportunity_sort_name)

let opportunity_sort_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_by = value_for_key opportunity_sort_name_of_yojson "SortBy" _list path;
     sort_order = value_for_key sort_order_of_yojson "SortOrder" _list path;
   }
    : opportunity_sort)

let opportunity_identifiers_of_yojson tree path =
  list_of_yojson opportunity_identifier_of_yojson tree path

let opportunity_engagement_invitation_sort_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "InvitationDate" -> INVITATION_DATE
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "OpportunityEngagementInvitationSortName" value)
    | _ -> raise (deserialize_wrong_type_error path "OpportunityEngagementInvitationSortName")
     : opportunity_engagement_invitation_sort_name)
    : opportunity_engagement_invitation_sort_name)

let opportunity_engagement_invitation_sort_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_by =
       value_for_key opportunity_engagement_invitation_sort_name_of_yojson "SortBy" _list path;
     sort_order = value_for_key sort_order_of_yojson "SortOrder" _list path;
   }
    : opportunity_engagement_invitation_sort)

let member_page_size_of_yojson = int_of_yojson
let member_company_name_of_yojson = string_of_yojson

let list_tasks_sort_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "StartTime" -> START_TIME
    | `String value -> raise (deserialize_unknown_enum_value_error path "ListTasksSortName" value)
    | _ -> raise (deserialize_wrong_type_error path "ListTasksSortName")
     : list_tasks_sort_name)
    : list_tasks_sort_name)

let list_tasks_sort_base_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_by = value_for_key list_tasks_sort_name_of_yojson "SortBy" _list path;
     sort_order = value_for_key sort_order_of_yojson "SortOrder" _list path;
   }
    : list_tasks_sort_base)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = value_for_key tag_list_of_yojson "Tags" _list path } : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let list_solutions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     solution_summaries = value_for_key solution_list_of_yojson "SolutionSummaries" _list path;
   }
    : list_solutions_response)

let filter_status_of_yojson tree path = list_of_yojson solution_status_of_yojson tree path

let aws_marketplace_solution_arn_list_of_yojson tree path =
  list_of_yojson aws_marketplace_solution_arn_of_yojson tree path

let list_solutions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_marketplace_solution_arn =
       option_of_yojson
         (value_for_key aws_marketplace_solution_arn_list_of_yojson "AwsMarketplaceSolutionArn")
         _list path;
     category = option_of_yojson (value_for_key string_list_of_yojson "Category") _list path;
     identifier =
       option_of_yojson (value_for_key solution_identifiers_of_yojson "Identifier") _list path;
     status = option_of_yojson (value_for_key filter_status_of_yojson "Status") _list path;
     sort = option_of_yojson (value_for_key solution_sort_of_yojson "Sort") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : list_solutions_request)

let list_resource_snapshots_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     resource_snapshot_summaries =
       value_for_key resource_snapshot_summary_list_of_yojson "ResourceSnapshotSummaries" _list path;
   }
    : list_resource_snapshots_response)

let list_resource_snapshots_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_by = option_of_yojson (value_for_key aws_account_of_yojson "CreatedBy") _list path;
     resource_snapshot_template_identifier =
       option_of_yojson
         (value_for_key resource_template_name_of_yojson "ResourceSnapshotTemplateIdentifier")
         _list path;
     resource_identifier =
       option_of_yojson
         (value_for_key resource_identifier_of_yojson "ResourceIdentifier")
         _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     engagement_identifier =
       value_for_key engagement_identifier_of_yojson "EngagementIdentifier" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : list_resource_snapshots_request)

let list_resource_snapshot_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     resource_snapshot_job_summaries =
       value_for_key resource_snapshot_job_summary_list_of_yojson "ResourceSnapshotJobSummaries"
         _list path;
   }
    : list_resource_snapshot_jobs_response)

let list_resource_snapshot_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort = option_of_yojson (value_for_key sort_object_of_yojson "Sort") _list path;
     status =
       option_of_yojson (value_for_key resource_snapshot_job_status_of_yojson "Status") _list path;
     engagement_identifier =
       option_of_yojson
         (value_for_key engagement_identifier_of_yojson "EngagementIdentifier")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : list_resource_snapshot_jobs_request)

let list_prospecting_from_engagement_tasks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_summaries =
       value_for_key prospecting_task_summary_list_of_yojson "TaskSummaries" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_prospecting_from_engagement_tasks_response)

let list_prospecting_from_engagement_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort =
       option_of_yojson
         (value_for_key prospecting_from_engagement_task_sort_of_yojson "Sort")
         _list path;
     start_before = option_of_yojson (value_for_key date_time_of_yojson "StartBefore") _list path;
     start_after = option_of_yojson (value_for_key date_time_of_yojson "StartAfter") _list path;
     task_name = option_of_yojson (value_for_key task_name_list_of_yojson "TaskName") _list path;
     task_identifier =
       option_of_yojson (value_for_key task_identifier_list_of_yojson "TaskIdentifier") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : list_prospecting_from_engagement_tasks_request)

let list_opportunity_from_engagement_task_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     context_id =
       option_of_yojson (value_for_key context_identifier_of_yojson "ContextId") _list path;
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
     resource_snapshot_job_id =
       option_of_yojson
         (value_for_key resource_snapshot_job_identifier_of_yojson "ResourceSnapshotJobId")
         _list path;
     opportunity_id =
       option_of_yojson (value_for_key opportunity_identifier_of_yojson "OpportunityId") _list path;
     reason_code = option_of_yojson (value_for_key reason_code_of_yojson "ReasonCode") _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     task_status = option_of_yojson (value_for_key task_status_of_yojson "TaskStatus") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     task_arn = option_of_yojson (value_for_key task_arn_of_yojson "TaskArn") _list path;
     task_id = option_of_yojson (value_for_key task_identifier_of_yojson "TaskId") _list path;
   }
    : list_opportunity_from_engagement_task_summary)

let list_opportunity_from_engagement_task_summaries_of_yojson tree path =
  list_of_yojson list_opportunity_from_engagement_task_summary_of_yojson tree path

let list_opportunity_from_engagement_tasks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     task_summaries =
       option_of_yojson
         (value_for_key list_opportunity_from_engagement_task_summaries_of_yojson "TaskSummaries")
         _list path;
   }
    : list_opportunity_from_engagement_tasks_response)

let engagement_identifiers_of_yojson tree path =
  list_of_yojson engagement_arn_or_identifier_of_yojson tree path

let context_identifiers_of_yojson tree path = list_of_yojson context_identifier_of_yojson tree path

let list_opportunity_from_engagement_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     context_identifier =
       option_of_yojson (value_for_key context_identifiers_of_yojson "ContextIdentifier") _list path;
     engagement_identifier =
       option_of_yojson
         (value_for_key engagement_identifiers_of_yojson "EngagementIdentifier")
         _list path;
     opportunity_identifier =
       option_of_yojson
         (value_for_key opportunity_identifiers_of_yojson "OpportunityIdentifier")
         _list path;
     task_identifier =
       option_of_yojson (value_for_key task_identifiers_of_yojson "TaskIdentifier") _list path;
     task_status = option_of_yojson (value_for_key task_statuses_of_yojson "TaskStatus") _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     sort = option_of_yojson (value_for_key list_tasks_sort_base_of_yojson "Sort") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MaxResults")
         _list path;
   }
    : list_opportunity_from_engagement_tasks_request)

let list_opportunities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     opportunity_summaries =
       value_for_key opportunity_summaries_of_yojson "OpportunitySummaries" _list path;
   }
    : list_opportunities_response)

let last_modified_date_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     before_last_modified_date =
       option_of_yojson (value_for_key date_time_of_yojson "BeforeLastModifiedDate") _list path;
     after_last_modified_date =
       option_of_yojson (value_for_key date_time_of_yojson "AfterLastModifiedDate") _list path;
   }
    : last_modified_date)

let filter_identifier_of_yojson tree path =
  list_of_yojson opportunity_identifier_of_yojson tree path

let filter_life_cycle_stage_of_yojson tree path = list_of_yojson stage_of_yojson tree path

let filter_life_cycle_review_status_of_yojson tree path =
  list_of_yojson review_status_of_yojson tree path

let created_date_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     before_created_date =
       option_of_yojson (value_for_key date_time_of_yojson "BeforeCreatedDate") _list path;
     after_created_date =
       option_of_yojson (value_for_key date_time_of_yojson "AfterCreatedDate") _list path;
   }
    : created_date_filter)

let list_opportunities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_close_date =
       option_of_yojson
         (value_for_key target_close_date_filter_of_yojson "TargetCloseDate")
         _list path;
     created_date =
       option_of_yojson (value_for_key created_date_filter_of_yojson "CreatedDate") _list path;
     customer_company_name =
       option_of_yojson (value_for_key string_list_of_yojson "CustomerCompanyName") _list path;
     life_cycle_review_status =
       option_of_yojson
         (value_for_key filter_life_cycle_review_status_of_yojson "LifeCycleReviewStatus")
         _list path;
     life_cycle_stage =
       option_of_yojson
         (value_for_key filter_life_cycle_stage_of_yojson "LifeCycleStage")
         _list path;
     identifier =
       option_of_yojson (value_for_key filter_identifier_of_yojson "Identifier") _list path;
     last_modified_date =
       option_of_yojson (value_for_key last_modified_date_of_yojson "LastModifiedDate") _list path;
     sort = option_of_yojson (value_for_key opportunity_sort_of_yojson "Sort") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : list_opportunities_request)

let engagement_title_of_yojson = string_of_yojson

let engagement_context_type_list_of_yojson tree path =
  list_of_yojson engagement_context_type_of_yojson tree path

let engagement_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     context_types =
       option_of_yojson
         (value_for_key engagement_context_type_list_of_yojson "ContextTypes")
         _list path;
     modified_by = option_of_yojson (value_for_key aws_account_of_yojson "ModifiedBy") _list path;
     modified_at = option_of_yojson (value_for_key date_time_of_yojson "ModifiedAt") _list path;
     member_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MemberCount")
         _list path;
     created_by = option_of_yojson (value_for_key aws_account_of_yojson "CreatedBy") _list path;
     created_at = option_of_yojson (value_for_key date_time_of_yojson "CreatedAt") _list path;
     title = option_of_yojson (value_for_key engagement_title_of_yojson "Title") _list path;
     id = option_of_yojson (value_for_key engagement_identifier_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key engagement_arn_of_yojson "Arn") _list path;
   }
    : engagement_summary)

let engagement_summary_list_of_yojson tree path =
  list_of_yojson engagement_summary_of_yojson tree path

let list_engagements_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     engagement_summary_list =
       value_for_key engagement_summary_list_of_yojson "EngagementSummaryList" _list path;
   }
    : list_engagements_response)

let aws_account_list_of_yojson tree path = list_of_yojson aws_account_of_yojson tree path

let engagement_sort_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "CreatedDate" -> CreatedDate
    | `String value -> raise (deserialize_unknown_enum_value_error path "EngagementSortName" value)
    | _ -> raise (deserialize_wrong_type_error path "EngagementSortName")
     : engagement_sort_name)
    : engagement_sort_name)

let engagement_sort_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_by = value_for_key engagement_sort_name_of_yojson "SortBy" _list path;
     sort_order = value_for_key sort_order_of_yojson "SortOrder" _list path;
   }
    : engagement_sort)

let engagement_page_size_of_yojson = int_of_yojson

let list_engagements_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engagement_identifier =
       option_of_yojson
         (value_for_key engagement_identifiers_of_yojson "EngagementIdentifier")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     max_results =
       option_of_yojson (value_for_key engagement_page_size_of_yojson "MaxResults") _list path;
     sort = option_of_yojson (value_for_key engagement_sort_of_yojson "Sort") _list path;
     exclude_context_types =
       option_of_yojson
         (value_for_key engagement_context_type_list_of_yojson "ExcludeContextTypes")
         _list path;
     context_types =
       option_of_yojson
         (value_for_key engagement_context_type_list_of_yojson "ContextTypes")
         _list path;
     exclude_created_by =
       option_of_yojson (value_for_key aws_account_list_of_yojson "ExcludeCreatedBy") _list path;
     created_by = option_of_yojson (value_for_key aws_account_list_of_yojson "CreatedBy") _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : list_engagements_request)

let engagement_resource_association_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_by = option_of_yojson (value_for_key aws_account_of_yojson "CreatedBy") _list path;
     resource_id =
       option_of_yojson (value_for_key resource_identifier_of_yojson "ResourceId") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : engagement_resource_association_summary)

let engagement_resource_association_summary_list_of_yojson tree path =
  list_of_yojson engagement_resource_association_summary_of_yojson tree path

let list_engagement_resource_associations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     engagement_resource_association_summaries =
       value_for_key engagement_resource_association_summary_list_of_yojson
         "EngagementResourceAssociationSummaries" _list path;
   }
    : list_engagement_resource_associations_response)

let list_engagement_resource_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_by = option_of_yojson (value_for_key aws_account_of_yojson "CreatedBy") _list path;
     resource_identifier =
       option_of_yojson
         (value_for_key resource_identifier_of_yojson "ResourceIdentifier")
         _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     engagement_identifier =
       option_of_yojson
         (value_for_key engagement_identifier_of_yojson "EngagementIdentifier")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : list_engagement_resource_associations_request)

let engagement_member_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key aws_account_of_yojson "AccountId") _list path;
     website_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "WebsiteUrl")
         _list path;
     company_name =
       option_of_yojson (value_for_key member_company_name_of_yojson "CompanyName") _list path;
   }
    : engagement_member)

let engagement_members_of_yojson tree path = list_of_yojson engagement_member_of_yojson tree path

let list_engagement_members_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     engagement_member_list =
       value_for_key engagement_members_of_yojson "EngagementMemberList" _list path;
   }
    : list_engagement_members_response)

let list_engagement_members_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     max_results =
       option_of_yojson (value_for_key member_page_size_of_yojson "MaxResults") _list path;
     identifier = value_for_key engagement_arn_or_identifier_of_yojson "Identifier" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : list_engagement_members_request)

let engagement_invitation_payload_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "LeadInvitation" -> LEAD_INVITATION
    | `String "OpportunityInvitation" -> OPPORTUNITY_INVITATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EngagementInvitationPayloadType" value)
    | _ -> raise (deserialize_wrong_type_error path "EngagementInvitationPayloadType")
     : engagement_invitation_payload_type)
    : engagement_invitation_payload_type)

let invitation_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXPIRED" -> EXPIRED
    | `String "REJECTED" -> REJECTED
    | `String "PENDING" -> PENDING
    | `String "ACCEPTED" -> ACCEPTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "InvitationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "InvitationStatus")
     : invitation_status)
    : invitation_status)

let engagement_invitation_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     participant_type =
       option_of_yojson (value_for_key participant_type_of_yojson "ParticipantType") _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     receiver = option_of_yojson (value_for_key receiver_of_yojson "Receiver") _list path;
     sender_company_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "SenderCompanyName")
         _list path;
     sender_aws_account_id =
       option_of_yojson (value_for_key aws_account_of_yojson "SenderAwsAccountId") _list path;
     expiration_date =
       option_of_yojson (value_for_key date_time_of_yojson "ExpirationDate") _list path;
     invitation_date =
       option_of_yojson (value_for_key date_time_of_yojson "InvitationDate") _list path;
     status = option_of_yojson (value_for_key invitation_status_of_yojson "Status") _list path;
     engagement_title =
       option_of_yojson (value_for_key engagement_title_of_yojson "EngagementTitle") _list path;
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
     id = value_for_key engagement_invitation_arn_or_identifier_of_yojson "Id" _list path;
     payload_type =
       option_of_yojson
         (value_for_key engagement_invitation_payload_type_of_yojson "PayloadType")
         _list path;
     arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Arn")
         _list path;
   }
    : engagement_invitation_summary)

let engagement_invitation_summaries_of_yojson tree path =
  list_of_yojson engagement_invitation_summary_of_yojson tree path

let list_engagement_invitations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     engagement_invitation_summaries =
       option_of_yojson
         (value_for_key engagement_invitation_summaries_of_yojson "EngagementInvitationSummaries")
         _list path;
   }
    : list_engagement_invitations_response)

let engagement_invitations_payload_type_of_yojson tree path =
  list_of_yojson engagement_invitation_payload_type_of_yojson tree path

let invitation_status_list_of_yojson tree path =
  list_of_yojson invitation_status_of_yojson tree path

let aws_account_id_or_alias_list_of_yojson tree path =
  list_of_yojson aws_account_of_yojson tree path

let list_engagement_invitations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sender_aws_account_id =
       option_of_yojson
         (value_for_key aws_account_id_or_alias_list_of_yojson "SenderAwsAccountId")
         _list path;
     engagement_identifier =
       option_of_yojson
         (value_for_key engagement_identifiers_of_yojson "EngagementIdentifier")
         _list path;
     status = option_of_yojson (value_for_key invitation_status_list_of_yojson "Status") _list path;
     participant_type = value_for_key participant_type_of_yojson "ParticipantType" _list path;
     payload_type =
       option_of_yojson
         (value_for_key engagement_invitations_payload_type_of_yojson "PayloadType")
         _list path;
     sort =
       option_of_yojson
         (value_for_key opportunity_engagement_invitation_sort_of_yojson "Sort")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : list_engagement_invitations_request)

let list_engagement_from_opportunity_task_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engagement_invitation_id =
       option_of_yojson
         (value_for_key engagement_invitation_identifier_of_yojson "EngagementInvitationId")
         _list path;
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
     resource_snapshot_job_id =
       option_of_yojson
         (value_for_key resource_snapshot_job_identifier_of_yojson "ResourceSnapshotJobId")
         _list path;
     opportunity_id =
       option_of_yojson (value_for_key opportunity_identifier_of_yojson "OpportunityId") _list path;
     reason_code = option_of_yojson (value_for_key reason_code_of_yojson "ReasonCode") _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     task_status = option_of_yojson (value_for_key task_status_of_yojson "TaskStatus") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     task_arn = option_of_yojson (value_for_key task_arn_of_yojson "TaskArn") _list path;
     task_id = option_of_yojson (value_for_key task_identifier_of_yojson "TaskId") _list path;
   }
    : list_engagement_from_opportunity_task_summary)

let list_engagement_from_opportunity_task_summaries_of_yojson tree path =
  list_of_yojson list_engagement_from_opportunity_task_summary_of_yojson tree path

let list_engagement_from_opportunity_tasks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     task_summaries =
       option_of_yojson
         (value_for_key list_engagement_from_opportunity_task_summaries_of_yojson "TaskSummaries")
         _list path;
   }
    : list_engagement_from_opportunity_tasks_response)

let list_engagement_from_opportunity_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engagement_identifier =
       option_of_yojson
         (value_for_key engagement_identifiers_of_yojson "EngagementIdentifier")
         _list path;
     opportunity_identifier =
       option_of_yojson
         (value_for_key opportunity_identifiers_of_yojson "OpportunityIdentifier")
         _list path;
     task_identifier =
       option_of_yojson (value_for_key task_identifiers_of_yojson "TaskIdentifier") _list path;
     task_status = option_of_yojson (value_for_key task_statuses_of_yojson "TaskStatus") _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     sort = option_of_yojson (value_for_key list_tasks_sort_base_of_yojson "Sort") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MaxResults")
         _list path;
   }
    : list_engagement_from_opportunity_tasks_request)

let list_engagement_by_accepting_invitation_task_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engagement_invitation_id =
       option_of_yojson
         (value_for_key engagement_invitation_identifier_of_yojson "EngagementInvitationId")
         _list path;
     resource_snapshot_job_id =
       option_of_yojson
         (value_for_key resource_snapshot_job_identifier_of_yojson "ResourceSnapshotJobId")
         _list path;
     opportunity_id =
       option_of_yojson (value_for_key opportunity_identifier_of_yojson "OpportunityId") _list path;
     reason_code = option_of_yojson (value_for_key reason_code_of_yojson "ReasonCode") _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     task_status = option_of_yojson (value_for_key task_status_of_yojson "TaskStatus") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     task_arn = option_of_yojson (value_for_key task_arn_of_yojson "TaskArn") _list path;
     task_id = option_of_yojson (value_for_key task_identifier_of_yojson "TaskId") _list path;
   }
    : list_engagement_by_accepting_invitation_task_summary)

let list_engagement_by_accepting_invitation_task_summaries_of_yojson tree path =
  list_of_yojson list_engagement_by_accepting_invitation_task_summary_of_yojson tree path

let list_engagement_by_accepting_invitation_tasks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     task_summaries =
       option_of_yojson
         (value_for_key list_engagement_by_accepting_invitation_task_summaries_of_yojson
            "TaskSummaries")
         _list path;
   }
    : list_engagement_by_accepting_invitation_tasks_response)

let engagement_invitation_identifiers_of_yojson tree path =
  list_of_yojson engagement_invitation_arn_or_identifier_of_yojson tree path

let list_engagement_by_accepting_invitation_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_identifier =
       option_of_yojson (value_for_key task_identifiers_of_yojson "TaskIdentifier") _list path;
     engagement_invitation_identifier =
       option_of_yojson
         (value_for_key engagement_invitation_identifiers_of_yojson "EngagementInvitationIdentifier")
         _list path;
     opportunity_identifier =
       option_of_yojson
         (value_for_key opportunity_identifiers_of_yojson "OpportunityIdentifier")
         _list path;
     task_status = option_of_yojson (value_for_key task_statuses_of_yojson "TaskStatus") _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     sort = option_of_yojson (value_for_key list_tasks_sort_base_of_yojson "Sort") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MaxResults")
         _list path;
   }
    : list_engagement_by_accepting_invitation_tasks_request)

let lead_interaction_list_of_yojson tree path = list_of_yojson lead_interaction_of_yojson tree path

let lead_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     interactions = value_for_key lead_interaction_list_of_yojson "Interactions" _list path;
     customer = value_for_key lead_customer_of_yojson "Customer" _list path;
     qualification_status =
       option_of_yojson
         (value_for_key lead_qualification_status_of_yojson "QualificationStatus")
         _list path;
     insights = option_of_yojson (value_for_key lead_insights_of_yojson "Insights") _list path;
   }
    : lead_context)

let invitation_message_of_yojson = string_of_yojson

let invitation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payload = value_for_key payload_of_yojson "Payload" _list path;
     receiver = value_for_key receiver_of_yojson "Receiver" _list path;
     message = value_for_key invitation_message_of_yojson "Message" _list path;
   }
    : invitation)

let get_selling_system_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_snapshot_job_role_arn =
       option_of_yojson
         (value_for_key resource_snapshot_job_role_arn_of_yojson "ResourceSnapshotJobRoleArn")
         _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : get_selling_system_settings_response)

let get_selling_system_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path }
    : get_selling_system_settings_request)

let get_resource_snapshot_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_member_accounts =
       option_of_yojson
         (value_for_key aws_account_id_or_alias_list_of_yojson "TargetMemberAccounts")
         _list path;
     payload =
       option_of_yojson (value_for_key resource_snapshot_payload_of_yojson "Payload") _list path;
     revision =
       option_of_yojson (value_for_key resource_snapshot_revision_of_yojson "Revision") _list path;
     resource_snapshot_template_name =
       option_of_yojson
         (value_for_key resource_template_name_of_yojson "ResourceSnapshotTemplateName")
         _list path;
     resource_id =
       option_of_yojson (value_for_key resource_identifier_of_yojson "ResourceId") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
     created_at = option_of_yojson (value_for_key date_time_of_yojson "CreatedAt") _list path;
     created_by = option_of_yojson (value_for_key aws_account_of_yojson "CreatedBy") _list path;
     arn = option_of_yojson (value_for_key resource_arn_of_yojson "Arn") _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : get_resource_snapshot_response)

let get_resource_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revision =
       option_of_yojson (value_for_key resource_snapshot_revision_of_yojson "Revision") _list path;
     resource_snapshot_template_identifier =
       value_for_key resource_template_name_of_yojson "ResourceSnapshotTemplateIdentifier" _list
         path;
     resource_identifier =
       value_for_key resource_identifier_of_yojson "ResourceIdentifier" _list path;
     resource_type = value_for_key resource_type_of_yojson "ResourceType" _list path;
     engagement_identifier =
       value_for_key engagement_identifier_of_yojson "EngagementIdentifier" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : get_resource_snapshot_request)

let get_resource_snapshot_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_failure =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "LastFailure")
         _list path;
     last_successful_execution_date =
       option_of_yojson (value_for_key date_time_of_yojson "LastSuccessfulExecutionDate") _list path;
     status =
       option_of_yojson (value_for_key resource_snapshot_job_status_of_yojson "Status") _list path;
     created_at = option_of_yojson (value_for_key date_time_of_yojson "CreatedAt") _list path;
     resource_snapshot_template_name =
       option_of_yojson
         (value_for_key resource_template_name_of_yojson "ResourceSnapshotTemplateName")
         _list path;
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "ResourceArn") _list path;
     resource_id =
       option_of_yojson (value_for_key resource_identifier_of_yojson "ResourceId") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
     arn = option_of_yojson (value_for_key resource_snapshot_job_arn_of_yojson "Arn") _list path;
     id =
       option_of_yojson (value_for_key resource_snapshot_job_identifier_of_yojson "Id") _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : get_resource_snapshot_job_response)

let get_resource_snapshot_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_snapshot_job_identifier =
       value_for_key resource_snapshot_job_identifier_of_yojson "ResourceSnapshotJobIdentifier"
         _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : get_resource_snapshot_job_request)

let engagement_prospecting_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     reason_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ReasonCode")
         _list path;
     status = value_for_key prospecting_task_status_of_yojson "Status" _list path;
     engagement_context_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "EngagementContextId")
         _list path;
     engagement_identifier =
       value_for_key engagement_identifier_of_yojson "EngagementIdentifier" _list path;
   }
    : engagement_prospecting_result)

let engagement_prospecting_result_list_of_yojson tree path =
  list_of_yojson engagement_prospecting_result_of_yojson tree path

let get_prospecting_from_engagement_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engagements =
       value_for_key engagement_prospecting_result_list_of_yojson "Engagements" _list path;
     end_time = option_of_yojson (value_for_key date_time_of_yojson "EndTime") _list path;
     start_time = value_for_key date_time_of_yojson "StartTime" _list path;
     task_name = value_for_key task_name_of_yojson "TaskName" _list path;
     task_arn = value_for_key prospecting_task_arn_of_yojson "TaskArn" _list path;
     task_id = value_for_key prospecting_task_identifier_of_yojson "TaskId" _list path;
   }
    : get_prospecting_from_engagement_task_response)

let get_prospecting_from_engagement_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_identifier =
       value_for_key prospecting_task_identifier_of_yojson "TaskIdentifier" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : get_prospecting_from_engagement_task_request)

let get_opportunity_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     opportunity_team =
       option_of_yojson
         (value_for_key partner_opportunity_team_members_list_of_yojson "OpportunityTeam")
         _list path;
     life_cycle = option_of_yojson (value_for_key life_cycle_of_yojson "LifeCycle") _list path;
     related_entity_identifiers =
       value_for_key related_entity_identifiers_of_yojson "RelatedEntityIdentifiers" _list path;
     created_date = value_for_key date_time_of_yojson "CreatedDate" _list path;
     last_modified_date = value_for_key date_time_of_yojson "LastModifiedDate" _list path;
     arn = option_of_yojson (value_for_key opportunity_arn_of_yojson "Arn") _list path;
     id = value_for_key opportunity_identifier_of_yojson "Id" _list path;
     software_revenue =
       option_of_yojson (value_for_key software_revenue_of_yojson "SoftwareRevenue") _list path;
     marketing = option_of_yojson (value_for_key marketing_of_yojson "Marketing") _list path;
     opportunity_type =
       option_of_yojson (value_for_key opportunity_type_of_yojson "OpportunityType") _list path;
     project = option_of_yojson (value_for_key project_of_yojson "Project") _list path;
     customer = option_of_yojson (value_for_key customer_of_yojson "Customer") _list path;
     partner_opportunity_identifier =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "PartnerOpportunityIdentifier")
         _list path;
     national_security =
       option_of_yojson (value_for_key national_security_of_yojson "NationalSecurity") _list path;
     primary_needs_from_aws =
       option_of_yojson
         (value_for_key primary_needs_from_aws_of_yojson "PrimaryNeedsFromAws")
         _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : get_opportunity_response)

let get_opportunity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identifier = value_for_key opportunity_identifier_of_yojson "Identifier" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : get_opportunity_request)

let engagement_description_of_yojson = string_of_yojson

let engagement_context_payload_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "ProspectingResult" -> ProspectingResult (prospecting_result_of_yojson value_ path)
   | "Lead" -> Lead (lead_context_of_yojson value_ path)
   | "CustomerProject" -> CustomerProject (customer_projects_context_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "EngagementContextPayload" unknown)
    : engagement_context_payload)

let engagement_context_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payload =
       option_of_yojson (value_for_key engagement_context_payload_of_yojson "Payload") _list path;
     type_ = value_for_key engagement_context_type_of_yojson "Type" _list path;
     id = option_of_yojson (value_for_key engagement_context_identifier_of_yojson "Id") _list path;
   }
    : engagement_context_details)

let engagement_contexts_of_yojson tree path =
  list_of_yojson engagement_context_details_of_yojson tree path

let get_engagement_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     contexts = option_of_yojson (value_for_key engagement_contexts_of_yojson "Contexts") _list path;
     modified_by = option_of_yojson (value_for_key aws_account_of_yojson "ModifiedBy") _list path;
     modified_at = option_of_yojson (value_for_key date_time_of_yojson "ModifiedAt") _list path;
     member_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MemberCount")
         _list path;
     created_by = option_of_yojson (value_for_key aws_account_of_yojson "CreatedBy") _list path;
     created_at = option_of_yojson (value_for_key date_time_of_yojson "CreatedAt") _list path;
     description =
       option_of_yojson (value_for_key engagement_description_of_yojson "Description") _list path;
     title = option_of_yojson (value_for_key engagement_title_of_yojson "Title") _list path;
     arn = option_of_yojson (value_for_key engagement_arn_of_yojson "Arn") _list path;
     id = option_of_yojson (value_for_key engagement_identifier_of_yojson "Id") _list path;
   }
    : get_engagement_response)

let get_engagement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identifier = value_for_key engagement_arn_or_identifier_of_yojson "Identifier" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : get_engagement_request)

let engagement_member_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     website_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "WebsiteUrl")
         _list path;
     company_name =
       option_of_yojson (value_for_key member_company_name_of_yojson "CompanyName") _list path;
   }
    : engagement_member_summary)

let engagement_member_summaries_of_yojson tree path =
  list_of_yojson engagement_member_summary_of_yojson tree path

let get_engagement_invitation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     existing_members =
       option_of_yojson
         (value_for_key engagement_member_summaries_of_yojson "ExistingMembers")
         _list path;
     engagement_description =
       option_of_yojson
         (value_for_key engagement_description_of_yojson "EngagementDescription")
         _list path;
     invitation_message =
       option_of_yojson (value_for_key invitation_message_of_yojson "InvitationMessage") _list path;
     payload = option_of_yojson (value_for_key payload_of_yojson "Payload") _list path;
     rejection_reason =
       option_of_yojson
         (value_for_key rejection_reason_string_of_yojson "RejectionReason")
         _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     receiver = option_of_yojson (value_for_key receiver_of_yojson "Receiver") _list path;
     sender_company_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "SenderCompanyName")
         _list path;
     sender_aws_account_id =
       option_of_yojson (value_for_key aws_account_of_yojson "SenderAwsAccountId") _list path;
     expiration_date =
       option_of_yojson (value_for_key date_time_of_yojson "ExpirationDate") _list path;
     invitation_date =
       option_of_yojson (value_for_key date_time_of_yojson "InvitationDate") _list path;
     status = option_of_yojson (value_for_key invitation_status_of_yojson "Status") _list path;
     engagement_title =
       option_of_yojson (value_for_key engagement_title_of_yojson "EngagementTitle") _list path;
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
     id = value_for_key engagement_invitation_arn_or_identifier_of_yojson "Id" _list path;
     payload_type =
       option_of_yojson
         (value_for_key engagement_invitation_payload_type_of_yojson "PayloadType")
         _list path;
     arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Arn")
         _list path;
   }
    : get_engagement_invitation_response)

let get_engagement_invitation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identifier =
       value_for_key engagement_invitation_arn_or_identifier_of_yojson "Identifier" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : get_engagement_invitation_request)

let get_aws_opportunity_summary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     cosell_motion =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "CosellMotion")
         _list path;
     project =
       option_of_yojson (value_for_key aws_opportunity_project_of_yojson "Project") _list path;
     customer =
       option_of_yojson (value_for_key aws_opportunity_customer_of_yojson "Customer") _list path;
     related_entity_ids =
       option_of_yojson
         (value_for_key aws_opportunity_related_entities_of_yojson "RelatedEntityIds")
         _list path;
     involvement_type_change_reason =
       option_of_yojson
         (value_for_key involvement_type_change_reason_of_yojson "InvolvementTypeChangeReason")
         _list path;
     insights =
       option_of_yojson (value_for_key aws_opportunity_insights_of_yojson "Insights") _list path;
     opportunity_team =
       option_of_yojson
         (value_for_key aws_opportunity_team_members_list_of_yojson "OpportunityTeam")
         _list path;
     life_cycle =
       option_of_yojson (value_for_key aws_opportunity_life_cycle_of_yojson "LifeCycle") _list path;
     visibility = option_of_yojson (value_for_key visibility_of_yojson "Visibility") _list path;
     involvement_type =
       option_of_yojson
         (value_for_key sales_involvement_type_of_yojson "InvolvementType")
         _list path;
     origin = option_of_yojson (value_for_key opportunity_origin_of_yojson "Origin") _list path;
     related_opportunity_id =
       option_of_yojson
         (value_for_key opportunity_identifier_of_yojson "RelatedOpportunityId")
         _list path;
   }
    : get_aws_opportunity_summary_response)

let get_aws_opportunity_summary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     related_opportunity_identifier =
       value_for_key opportunity_identifier_of_yojson "RelatedOpportunityIdentifier" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : get_aws_opportunity_summary_request)

let engagement_invitation_arn_of_yojson = string_of_yojson

let disassociate_opportunity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     related_entity_identifier =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "RelatedEntityIdentifier" _list path;
     related_entity_type =
       value_for_key related_entity_type_of_yojson "RelatedEntityType" _list path;
     opportunity_identifier =
       value_for_key opportunity_identifier_of_yojson "OpportunityIdentifier" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : disassociate_opportunity_request)

let delete_resource_snapshot_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_snapshot_job_identifier =
       value_for_key resource_snapshot_job_identifier_of_yojson "ResourceSnapshotJobIdentifier"
         _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : delete_resource_snapshot_job_request)

let create_resource_snapshot_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revision =
       option_of_yojson (value_for_key resource_snapshot_revision_of_yojson "Revision") _list path;
     arn = option_of_yojson (value_for_key resource_arn_of_yojson "Arn") _list path;
   }
    : create_resource_snapshot_response)

let create_resource_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     resource_snapshot_template_identifier =
       value_for_key resource_template_name_of_yojson "ResourceSnapshotTemplateIdentifier" _list
         path;
     resource_identifier =
       value_for_key resource_identifier_of_yojson "ResourceIdentifier" _list path;
     resource_type = value_for_key resource_type_of_yojson "ResourceType" _list path;
     engagement_identifier =
       value_for_key engagement_identifier_of_yojson "EngagementIdentifier" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : create_resource_snapshot_request)

let create_resource_snapshot_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key resource_snapshot_job_arn_of_yojson "Arn") _list path;
     id =
       option_of_yojson (value_for_key resource_snapshot_job_identifier_of_yojson "Id") _list path;
   }
    : create_resource_snapshot_job_response)

let create_resource_snapshot_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     resource_snapshot_template_identifier =
       value_for_key resource_template_name_of_yojson "ResourceSnapshotTemplateIdentifier" _list
         path;
     resource_identifier =
       value_for_key resource_identifier_of_yojson "ResourceIdentifier" _list path;
     resource_type = value_for_key resource_type_of_yojson "ResourceType" _list path;
     engagement_identifier =
       value_for_key engagement_identifier_of_yojson "EngagementIdentifier" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : create_resource_snapshot_job_request)

let create_opportunity_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_date =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedDate") _list path;
     partner_opportunity_identifier =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "PartnerOpportunityIdentifier")
         _list path;
     id = value_for_key opportunity_identifier_of_yojson "Id" _list path;
   }
    : create_opportunity_response)

let create_opportunity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     opportunity_team =
       option_of_yojson
         (value_for_key partner_opportunity_team_members_list_of_yojson "OpportunityTeam")
         _list path;
     origin = option_of_yojson (value_for_key opportunity_origin_of_yojson "Origin") _list path;
     life_cycle = option_of_yojson (value_for_key life_cycle_of_yojson "LifeCycle") _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     software_revenue =
       option_of_yojson (value_for_key software_revenue_of_yojson "SoftwareRevenue") _list path;
     marketing = option_of_yojson (value_for_key marketing_of_yojson "Marketing") _list path;
     opportunity_type =
       option_of_yojson (value_for_key opportunity_type_of_yojson "OpportunityType") _list path;
     project = option_of_yojson (value_for_key project_of_yojson "Project") _list path;
     customer = option_of_yojson (value_for_key customer_of_yojson "Customer") _list path;
     partner_opportunity_identifier =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "PartnerOpportunityIdentifier")
         _list path;
     national_security =
       option_of_yojson (value_for_key national_security_of_yojson "NationalSecurity") _list path;
     primary_needs_from_aws =
       option_of_yojson
         (value_for_key primary_needs_from_aws_of_yojson "PrimaryNeedsFromAws")
         _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : create_opportunity_request)

let create_engagement_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     modified_at = option_of_yojson (value_for_key date_time_of_yojson "ModifiedAt") _list path;
     arn = option_of_yojson (value_for_key engagement_arn_of_yojson "Arn") _list path;
     id = option_of_yojson (value_for_key engagement_identifier_of_yojson "Id") _list path;
   }
    : create_engagement_response)

let create_engagement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     contexts = option_of_yojson (value_for_key engagement_contexts_of_yojson "Contexts") _list path;
     description = value_for_key engagement_description_of_yojson "Description" _list path;
     title = value_for_key engagement_title_of_yojson "Title" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : create_engagement_request)

let create_engagement_invitation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key engagement_invitation_arn_of_yojson "Arn" _list path;
     id = value_for_key engagement_invitation_identifier_of_yojson "Id" _list path;
   }
    : create_engagement_invitation_response)

let create_engagement_invitation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invitation = value_for_key invitation_of_yojson "Invitation" _list path;
     engagement_identifier =
       value_for_key engagement_identifier_of_yojson "EngagementIdentifier" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : create_engagement_invitation_request)

let create_engagement_context_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     context_id =
       option_of_yojson
         (value_for_key engagement_context_identifier_of_yojson "ContextId")
         _list path;
     engagement_last_modified_at =
       option_of_yojson (value_for_key date_time_of_yojson "EngagementLastModifiedAt") _list path;
     engagement_arn =
       option_of_yojson (value_for_key engagement_arn_of_yojson "EngagementArn") _list path;
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
   }
    : create_engagement_context_response)

let create_engagement_context_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payload = value_for_key engagement_context_payload_of_yojson "Payload" _list path;
     type_ = value_for_key engagement_context_type_of_yojson "Type" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     engagement_identifier =
       value_for_key engagement_arn_or_identifier_of_yojson "EngagementIdentifier" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : create_engagement_context_request)

let associate_opportunity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     related_entity_identifier =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "RelatedEntityIdentifier" _list path;
     related_entity_type =
       value_for_key related_entity_type_of_yojson "RelatedEntityType" _list path;
     opportunity_identifier =
       value_for_key opportunity_identifier_of_yojson "OpportunityIdentifier" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : associate_opportunity_request)

let assignee_contact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     business_title = value_for_key job_title_of_yojson "BusinessTitle" _list path;
     phone = option_of_yojson (value_for_key phone_number_of_yojson "Phone") _list path;
     last_name = value_for_key name_of_yojson "LastName" _list path;
     first_name = value_for_key name_of_yojson "FirstName" _list path;
     email = value_for_key email_of_yojson "Email" _list path;
   }
    : assignee_contact)

let assign_opportunity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assignee = value_for_key assignee_contact_of_yojson "Assignee" _list path;
     identifier = value_for_key opportunity_identifier_of_yojson "Identifier" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : assign_opportunity_request)

let accept_engagement_invitation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identifier =
       value_for_key engagement_invitation_arn_or_identifier_of_yojson "Identifier" _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : accept_engagement_invitation_request)
