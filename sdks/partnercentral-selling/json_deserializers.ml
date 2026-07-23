open Smaws_Lib.Json.DeserializeHelpers
open Types

let validation_exception_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "REQUIRED_FIELD_MISSING" -> REQUIRED_FIELD_MISSING
    | `String "INVALID_ENUM_VALUE" -> INVALID_ENUM_VALUE
    | `String "INVALID_STRING_FORMAT" -> INVALID_STRING_FORMAT
    | `String "INVALID_VALUE" -> INVALID_VALUE
    | `String "NOT_ENOUGH_VALUES" -> NOT_ENOUGH_VALUES
    | `String "TOO_MANY_VALUES" -> TOO_MANY_VALUES
    | `String "INVALID_RESOURCE_STATE" -> INVALID_RESOURCE_STATE
    | `String "DUPLICATE_KEY_VALUE" -> DUPLICATE_KEY_VALUE
    | `String "VALUE_OUT_OF_RANGE" -> VALUE_OUT_OF_RANGE
    | `String "ACTION_NOT_PERMITTED" -> ACTION_NOT_PERMITTED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionErrorCode")
     : validation_exception_error_code)
    : validation_exception_error_code)

let validation_exception_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "FieldName")
         _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
     code = value_for_key validation_exception_error_code_of_yojson "Code" _list path;
   }
    : validation_exception_error)

let validation_exception_error_list_of_yojson tree path =
  list_of_yojson validation_exception_error_of_yojson tree path

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "REQUEST_VALIDATION_FAILED" -> REQUEST_VALIDATION_FAILED
    | `String "BUSINESS_VALIDATION_FAILED" -> BUSINESS_VALIDATION_FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
     reason = value_for_key validation_exception_reason_of_yojson "Reason" _list path;
     error_list =
       option_of_yojson
         (value_for_key validation_exception_error_list_of_yojson "ErrorList")
         _list path;
   }
    : validation_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
   }
    : throttling_exception)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
   }
    : service_quota_exceeded_exception)

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
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     reason =
       option_of_yojson
         (value_for_key access_denied_exception_error_code_of_yojson "Reason")
         _list path;
   }
    : access_denied_exception)

let engagement_context_identifier_of_yojson = string_of_yojson
let date_time_of_yojson = timestamp_iso_8601_of_yojson
let engagement_arn_of_yojson = string_of_yojson
let engagement_identifier_of_yojson = string_of_yojson

let update_engagement_context_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engagement_id = value_for_key engagement_identifier_of_yojson "EngagementId" _list path;
     engagement_arn = value_for_key engagement_arn_of_yojson "EngagementArn" _list path;
     engagement_last_modified_at =
       value_for_key date_time_of_yojson "EngagementLastModifiedAt" _list path;
     context_id = value_for_key engagement_context_identifier_of_yojson "ContextId" _list path;
   }
    : update_engagement_context_response)

let engagement_score_level_of_yojson = string_of_yojson

let prospecting_insights_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marketplace_engagement_score =
       option_of_yojson
         (value_for_key engagement_score_level_of_yojson "MarketplaceEngagementScore")
         _list path;
     solution_score =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "SolutionScore")
         _list path;
     solution_category =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "SolutionCategory")
         _list path;
     solution_sub_category =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "SolutionSubCategory")
         _list path;
   }
    : prospecting_insights)

let prospecting_public_profile_summary_of_yojson = string_of_yojson

let eligible_programs_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let prospecting_company_size_of_yojson = string_of_yojson
let prospecting_segment_of_yojson = string_of_yojson
let prospecting_sub_industry_of_yojson = string_of_yojson

let industry_of_yojson (tree : t) path =
  ((match tree with
    | `String "Aerospace" -> AEROSPACE_SATELLITE
    | `String "Agriculture" -> AGRICULTURE
    | `String "Automotive" -> AUTOMOTIVE
    | `String "Computers and Electronics" -> COMPUTERS_ELECTRONICS
    | `String "Consumer Goods" -> CONSUMER_GOODS
    | `String "Education" -> EDUCATION
    | `String "Energy - Oil and Gas" -> ENERGY_OIL_GAS
    | `String "Energy - Power and Utilities" -> ENERGY_POWER_UTILITIES
    | `String "Financial Services" -> FINANCIAL_SERVICES
    | `String "Gaming" -> GAMING
    | `String "Government" -> GOVERNMENT
    | `String "Healthcare" -> HEALTHCARE
    | `String "Hospitality" -> HOSPITALITY
    | `String "Life Sciences" -> LIFE_SCIENCES
    | `String "Manufacturing" -> MANUFACTURING
    | `String "Marketing and Advertising" -> MARKETING_ADVERTISING
    | `String "Media and Entertainment" -> MEDIA_ENTERTAINMENT
    | `String "Mining" -> MINING
    | `String "Non-Profit Organization" -> NON_PROFIT_ORGANIZATION
    | `String "Professional Services" -> PROFESSIONAL_SERVICES
    | `String "Real Estate and Construction" -> REALESTATE_CONSTRUCTION
    | `String "Retail" -> RETAIL
    | `String "Software and Internet" -> SOFTWARE_INTERNET
    | `String "Telecommunications" -> TELECOMMUNICATIONS
    | `String "Transportation and Logistics" -> TRANSPORTATION_LOGISTICS
    | `String "Travel" -> TRAVEL
    | `String "Wholesale and Distribution" -> WHOLESALE_DISTRIBUTION
    | `String "Other" -> OTHER
    | `String value -> raise (deserialize_unknown_enum_value_error path "Industry" value)
    | _ -> raise (deserialize_wrong_type_error path "Industry")
     : industry)
    : industry)

let country_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "US" -> US
    | `String "AF" -> AF
    | `String "AX" -> AX
    | `String "AL" -> AL
    | `String "DZ" -> DZ
    | `String "AS" -> AS
    | `String "AD" -> AD
    | `String "AO" -> AO
    | `String "AI" -> AI
    | `String "AQ" -> AQ
    | `String "AG" -> AG
    | `String "AR" -> AR
    | `String "AM" -> AM
    | `String "AW" -> AW
    | `String "AU" -> AU
    | `String "AT" -> AT
    | `String "AZ" -> AZ
    | `String "BS" -> BS
    | `String "BH" -> BH
    | `String "BD" -> BD
    | `String "BB" -> BB
    | `String "BY" -> BY
    | `String "BE" -> BE
    | `String "BZ" -> BZ
    | `String "BJ" -> BJ
    | `String "BM" -> BM
    | `String "BT" -> BT
    | `String "BO" -> BO
    | `String "BQ" -> BQ
    | `String "BA" -> BA
    | `String "BW" -> BW
    | `String "BV" -> BV
    | `String "BR" -> BR
    | `String "IO" -> IO
    | `String "BN" -> BN
    | `String "BG" -> BG
    | `String "BF" -> BF
    | `String "BI" -> BI
    | `String "KH" -> KH
    | `String "CM" -> CM
    | `String "CA" -> CA
    | `String "CV" -> CV
    | `String "KY" -> KY
    | `String "CF" -> CF
    | `String "TD" -> TD
    | `String "CL" -> CL
    | `String "CN" -> CN
    | `String "CX" -> CX
    | `String "CC" -> CC
    | `String "CO" -> CO
    | `String "KM" -> KM
    | `String "CG" -> CG
    | `String "CK" -> CK
    | `String "CR" -> CR
    | `String "CI" -> CI
    | `String "HR" -> HR
    | `String "CU" -> CU
    | `String "CW" -> CW
    | `String "CY" -> CY
    | `String "CZ" -> CZ
    | `String "CD" -> CD
    | `String "DK" -> DK
    | `String "DJ" -> DJ
    | `String "DM" -> DM
    | `String "DO" -> DO
    | `String "EC" -> EC
    | `String "EG" -> EG
    | `String "SV" -> SV
    | `String "GQ" -> GQ
    | `String "ER" -> ER
    | `String "EE" -> EE
    | `String "ET" -> ET
    | `String "FK" -> FK
    | `String "FO" -> FO
    | `String "FJ" -> FJ
    | `String "FI" -> FI
    | `String "FR" -> FR
    | `String "GF" -> GF
    | `String "PF" -> PF
    | `String "TF" -> TF
    | `String "GA" -> GA
    | `String "GM" -> GM
    | `String "GE" -> GE
    | `String "DE" -> DE
    | `String "GH" -> GH
    | `String "GI" -> GI
    | `String "GR" -> GR
    | `String "GL" -> GL
    | `String "GD" -> GD
    | `String "GP" -> GP
    | `String "GU" -> GU
    | `String "GT" -> GT
    | `String "GG" -> GG
    | `String "GN" -> GN
    | `String "GW" -> GW
    | `String "GY" -> GY
    | `String "HT" -> HT
    | `String "HM" -> HM
    | `String "VA" -> VA
    | `String "HN" -> HN
    | `String "HK" -> HK
    | `String "HU" -> HU
    | `String "IS" -> IS
    | `String "IN" -> IN
    | `String "ID" -> ID
    | `String "IR" -> IR
    | `String "IQ" -> IQ
    | `String "IE" -> IE
    | `String "IM" -> IM
    | `String "IL" -> IL
    | `String "IT" -> IT
    | `String "JM" -> JM
    | `String "JP" -> JP
    | `String "JE" -> JE
    | `String "JO" -> JO
    | `String "KZ" -> KZ
    | `String "KE" -> KE
    | `String "KI" -> KI
    | `String "KR" -> KR
    | `String "KW" -> KW
    | `String "KG" -> KG
    | `String "LA" -> LA
    | `String "LV" -> LV
    | `String "LB" -> LB
    | `String "LS" -> LS
    | `String "LR" -> LR
    | `String "LY" -> LY
    | `String "LI" -> LI
    | `String "LT" -> LT
    | `String "LU" -> LU
    | `String "MO" -> MO
    | `String "MK" -> MK
    | `String "MG" -> MG
    | `String "MW" -> MW
    | `String "MY" -> MY
    | `String "MV" -> MV
    | `String "ML" -> ML
    | `String "MT" -> MT
    | `String "MH" -> MH
    | `String "MQ" -> MQ
    | `String "MR" -> MR
    | `String "MU" -> MU
    | `String "YT" -> YT
    | `String "MX" -> MX
    | `String "FM" -> FM
    | `String "MD" -> MD
    | `String "MC" -> MC
    | `String "MN" -> MN
    | `String "ME" -> ME
    | `String "MS" -> MS
    | `String "MA" -> MA
    | `String "MZ" -> MZ
    | `String "MM" -> MM
    | `String "NA" -> NA
    | `String "NR" -> NR
    | `String "NP" -> NP
    | `String "NL" -> NL
    | `String "AN" -> AN
    | `String "NC" -> NC
    | `String "NZ" -> NZ
    | `String "NI" -> NI
    | `String "NE" -> NE
    | `String "NG" -> NG
    | `String "NU" -> NU
    | `String "NF" -> NF
    | `String "MP" -> MP
    | `String "NO" -> NO
    | `String "OM" -> OM
    | `String "PK" -> PK
    | `String "PW" -> PW
    | `String "PS" -> PS
    | `String "PA" -> PA
    | `String "PG" -> PG
    | `String "PY" -> PY
    | `String "PE" -> PE
    | `String "PH" -> PH
    | `String "PN" -> PN
    | `String "PL" -> PL
    | `String "PT" -> PT
    | `String "PR" -> PR
    | `String "QA" -> QA
    | `String "RE" -> RE
    | `String "RO" -> RO
    | `String "RU" -> RU
    | `String "RW" -> RW
    | `String "BL" -> BL
    | `String "SH" -> SH
    | `String "KN" -> KN
    | `String "LC" -> LC
    | `String "MF" -> MF
    | `String "PM" -> PM
    | `String "VC" -> VC
    | `String "WS" -> WS
    | `String "SM" -> SM
    | `String "ST" -> ST
    | `String "SA" -> SA
    | `String "SN" -> SN
    | `String "RS" -> RS
    | `String "SC" -> SC
    | `String "SL" -> SL
    | `String "SG" -> SG
    | `String "SX" -> SX
    | `String "SK" -> SK
    | `String "SI" -> SI
    | `String "SB" -> SB
    | `String "SO" -> SO
    | `String "ZA" -> ZA
    | `String "GS" -> GS
    | `String "SS" -> SS
    | `String "ES" -> ES
    | `String "LK" -> LK
    | `String "SD" -> SD
    | `String "SR" -> SR
    | `String "SJ" -> SJ
    | `String "SZ" -> SZ
    | `String "SE" -> SE
    | `String "CH" -> CH
    | `String "SY" -> SY
    | `String "TW" -> TW
    | `String "TJ" -> TJ
    | `String "TZ" -> TZ
    | `String "TH" -> TH
    | `String "TL" -> TL
    | `String "TG" -> TG
    | `String "TK" -> TK
    | `String "TO" -> TO
    | `String "TT" -> TT
    | `String "TN" -> TN
    | `String "TR" -> TR
    | `String "TM" -> TM
    | `String "TC" -> TC
    | `String "TV" -> TV
    | `String "UG" -> UG
    | `String "UA" -> UA
    | `String "AE" -> AE
    | `String "GB" -> GB
    | `String "UM" -> UM
    | `String "UY" -> UY
    | `String "UZ" -> UZ
    | `String "VU" -> VU
    | `String "VE" -> VE
    | `String "VN" -> VN
    | `String "VG" -> VG
    | `String "VI" -> VI
    | `String "WF" -> WF
    | `String "EH" -> EH
    | `String "YE" -> YE
    | `String "ZM" -> ZM
    | `String "ZW" -> ZW
    | `String value -> raise (deserialize_unknown_enum_value_error path "CountryCode" value)
    | _ -> raise (deserialize_wrong_type_error path "CountryCode")
     : country_code)
    : country_code)

let prospecting_sub_region_of_yojson = string_of_yojson
let prospecting_region_of_yojson = string_of_yojson
let prospecting_geo_of_yojson = string_of_yojson
let prospecting_account_name_of_yojson = string_of_yojson

let prospecting_result_customer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_name =
       option_of_yojson (value_for_key prospecting_account_name_of_yojson "AccountName") _list path;
     geo = option_of_yojson (value_for_key prospecting_geo_of_yojson "Geo") _list path;
     region = option_of_yojson (value_for_key prospecting_region_of_yojson "Region") _list path;
     sub_region =
       option_of_yojson (value_for_key prospecting_sub_region_of_yojson "SubRegion") _list path;
     country = option_of_yojson (value_for_key country_code_of_yojson "Country") _list path;
     industry = option_of_yojson (value_for_key industry_of_yojson "Industry") _list path;
     sub_industry =
       option_of_yojson (value_for_key prospecting_sub_industry_of_yojson "SubIndustry") _list path;
     segment = option_of_yojson (value_for_key prospecting_segment_of_yojson "Segment") _list path;
     company_size =
       option_of_yojson (value_for_key prospecting_company_size_of_yojson "CompanySize") _list path;
     eligible_programs =
       option_of_yojson
         (value_for_key eligible_programs_list_of_yojson "EligiblePrograms")
         _list path;
     public_profile_summary =
       option_of_yojson
         (value_for_key prospecting_public_profile_summary_of_yojson "PublicProfileSummary")
         _list path;
   }
    : prospecting_result_customer)

let task_name_of_yojson = string_of_yojson
let task_arn_of_yojson = string_of_yojson
let prospecting_task_identifier_of_yojson = string_of_yojson

let prospecting_result_aws_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key date_time_of_yojson "EndTime") _list path;
     task_id =
       option_of_yojson (value_for_key prospecting_task_identifier_of_yojson "TaskId") _list path;
     task_arn = option_of_yojson (value_for_key task_arn_of_yojson "TaskArn") _list path;
     task_name = option_of_yojson (value_for_key task_name_of_yojson "TaskName") _list path;
     customer =
       option_of_yojson (value_for_key prospecting_result_customer_of_yojson "Customer") _list path;
     insights =
       option_of_yojson (value_for_key prospecting_insights_of_yojson "Insights") _list path;
   }
    : prospecting_result_aws)

let prospecting_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ aws = option_of_yojson (value_for_key prospecting_result_aws_of_yojson "Aws") _list path }
    : prospecting_result)

let engagement_customer_business_problem_of_yojson = string_of_yojson
let engagement_customer_project_title_of_yojson = string_of_yojson

let engagement_customer_project_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     title = value_for_key engagement_customer_project_title_of_yojson "Title" _list path;
     business_problem =
       value_for_key engagement_customer_business_problem_of_yojson "BusinessProblem" _list path;
     target_completion_date =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "TargetCompletionDate" _list path;
   }
    : engagement_customer_project_details)

let company_website_url_of_yojson = string_of_yojson
let company_name_of_yojson = string_of_yojson

let engagement_customer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     industry = value_for_key industry_of_yojson "Industry" _list path;
     company_name = value_for_key company_name_of_yojson "CompanyName" _list path;
     website_url = value_for_key company_website_url_of_yojson "WebsiteUrl" _list path;
     country_code = value_for_key country_code_of_yojson "CountryCode" _list path;
   }
    : engagement_customer)

let customer_projects_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     customer = option_of_yojson (value_for_key engagement_customer_of_yojson "Customer") _list path;
     project =
       option_of_yojson
         (value_for_key engagement_customer_project_details_of_yojson "Project")
         _list path;
   }
    : customer_projects_context)

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

let phone_number_of_yojson = string_of_yojson
let name_of_yojson = string_of_yojson
let email_of_yojson = string_of_yojson
let job_title_of_yojson = string_of_yojson

let lead_contact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     business_title = value_for_key job_title_of_yojson "BusinessTitle" _list path;
     email = value_for_key email_of_yojson "Email" _list path;
     first_name = value_for_key name_of_yojson "FirstName" _list path;
     last_name = value_for_key name_of_yojson "LastName" _list path;
     phone = option_of_yojson (value_for_key phone_number_of_yojson "Phone") _list path;
   }
    : lead_contact)

let customer_action_of_yojson = string_of_yojson
let engagement_use_case_of_yojson = string_of_yojson
let lead_source_name_of_yojson = string_of_yojson
let lead_source_id_of_yojson = string_of_yojson
let lead_source_type_of_yojson = string_of_yojson

let lead_interaction_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_type = value_for_key lead_source_type_of_yojson "SourceType" _list path;
     source_id = value_for_key lead_source_id_of_yojson "SourceId" _list path;
     source_name = value_for_key lead_source_name_of_yojson "SourceName" _list path;
     usecase = option_of_yojson (value_for_key engagement_use_case_of_yojson "Usecase") _list path;
     interaction_date =
       option_of_yojson (value_for_key date_time_of_yojson "InteractionDate") _list path;
     customer_action = value_for_key customer_action_of_yojson "CustomerAction" _list path;
     business_problem =
       option_of_yojson
         (value_for_key engagement_customer_business_problem_of_yojson "BusinessProblem")
         _list path;
     contact = value_for_key lead_contact_of_yojson "Contact" _list path;
   }
    : lead_interaction)

let market_segment_of_yojson (tree : t) path =
  ((match tree with
    | `String "Enterprise" -> ENTERPRISE
    | `String "Large" -> LARGE
    | `String "Medium" -> MEDIUM
    | `String "Small" -> SMALL
    | `String "Micro" -> MICRO
    | `String value -> raise (deserialize_unknown_enum_value_error path "MarketSegment" value)
    | _ -> raise (deserialize_wrong_type_error path "MarketSegment")
     : market_segment)
    : market_segment)

let aws_maturity_of_yojson = string_of_yojson
let address_part_of_yojson = string_of_yojson

let address_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     city = option_of_yojson (value_for_key address_part_of_yojson "City") _list path;
     postal_code = option_of_yojson (value_for_key address_part_of_yojson "PostalCode") _list path;
     state_or_region =
       option_of_yojson (value_for_key address_part_of_yojson "StateOrRegion") _list path;
     country_code = option_of_yojson (value_for_key country_code_of_yojson "CountryCode") _list path;
   }
    : address_summary)

let lead_customer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     industry = option_of_yojson (value_for_key industry_of_yojson "Industry") _list path;
     company_name = value_for_key company_name_of_yojson "CompanyName" _list path;
     website_url =
       option_of_yojson (value_for_key company_website_url_of_yojson "WebsiteUrl") _list path;
     address = value_for_key address_summary_of_yojson "Address" _list path;
     aws_maturity = option_of_yojson (value_for_key aws_maturity_of_yojson "AwsMaturity") _list path;
     market_segment =
       option_of_yojson (value_for_key market_segment_of_yojson "MarketSegment") _list path;
   }
    : lead_customer)

let lead_qualification_status_of_yojson = string_of_yojson

let update_lead_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     qualification_status =
       option_of_yojson
         (value_for_key lead_qualification_status_of_yojson "QualificationStatus")
         _list path;
     customer = value_for_key lead_customer_of_yojson "Customer" _list path;
     interaction =
       option_of_yojson (value_for_key lead_interaction_of_yojson "Interaction") _list path;
     insights = option_of_yojson (value_for_key lead_insights_of_yojson "Insights") _list path;
   }
    : update_lead_context)

let update_engagement_context_payload_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Lead" -> Lead (update_lead_context_of_yojson value_ path)
   | "CustomerProject" -> CustomerProject (customer_projects_context_of_yojson value_ path)
   | "ProspectingResult" -> ProspectingResult (prospecting_result_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "UpdateEngagementContextPayload" unknown)
    : update_engagement_context_payload)

let engagement_context_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CustomerProject" -> CUSTOMER_PROJECT
    | `String "Lead" -> LEAD
    | `String "ProspectingResult" -> PROSPECTING_RESULT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EngagementContextType" value)
    | _ -> raise (deserialize_wrong_type_error path "EngagementContextType")
     : engagement_context_type)
    : engagement_context_type)

let engagement_arn_or_identifier_of_yojson = string_of_yojson
let catalog_identifier_of_yojson = string_of_yojson

let update_engagement_context_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     engagement_identifier =
       value_for_key engagement_arn_or_identifier_of_yojson "EngagementIdentifier" _list path;
     context_identifier =
       value_for_key engagement_context_identifier_of_yojson "ContextIdentifier" _list path;
     engagement_last_modified_at =
       value_for_key date_time_of_yojson "EngagementLastModifiedAt" _list path;
     type_ = value_for_key engagement_context_type_of_yojson "Type" _list path;
     payload = value_for_key update_engagement_context_payload_of_yojson "Payload" _list path;
   }
    : update_engagement_context_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path
let taggable_resource_arn_of_yojson = string_of_yojson

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = value_for_key tag_value_of_yojson "Value" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let resource_snapshot_job_role_arn_of_yojson = string_of_yojson

let put_selling_system_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     resource_snapshot_job_role_arn =
       option_of_yojson
         (value_for_key resource_snapshot_job_role_arn_of_yojson "ResourceSnapshotJobRoleArn")
         _list path;
   }
    : put_selling_system_settings_response)

let resource_snapshot_job_role_identifier_of_yojson = string_of_yojson

let put_selling_system_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     resource_snapshot_job_role_identifier =
       option_of_yojson
         (value_for_key resource_snapshot_job_role_identifier_of_yojson
            "ResourceSnapshotJobRoleIdentifier")
         _list path;
   }
    : put_selling_system_settings_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = value_for_key tag_list_of_yojson "Tags" _list path } : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let get_selling_system_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     resource_snapshot_job_role_arn =
       option_of_yojson
         (value_for_key resource_snapshot_job_role_arn_of_yojson "ResourceSnapshotJobRoleArn")
         _list path;
   }
    : get_selling_system_settings_response)

let get_selling_system_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path }
    : get_selling_system_settings_request)

let create_engagement_context_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
     engagement_arn =
       option_of_yojson (value_for_key engagement_arn_of_yojson "EngagementArn") _list path;
     engagement_last_modified_at =
       option_of_yojson (value_for_key date_time_of_yojson "EngagementLastModifiedAt") _list path;
     context_id =
       option_of_yojson
         (value_for_key engagement_context_identifier_of_yojson "ContextId")
         _list path;
   }
    : create_engagement_context_response)

let lead_interaction_list_of_yojson tree path = list_of_yojson lead_interaction_of_yojson tree path

let lead_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     insights = option_of_yojson (value_for_key lead_insights_of_yojson "Insights") _list path;
     qualification_status =
       option_of_yojson
         (value_for_key lead_qualification_status_of_yojson "QualificationStatus")
         _list path;
     customer = value_for_key lead_customer_of_yojson "Customer" _list path;
     interactions = value_for_key lead_interaction_list_of_yojson "Interactions" _list path;
   }
    : lead_context)

let engagement_context_payload_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "CustomerProject" -> CustomerProject (customer_projects_context_of_yojson value_ path)
   | "Lead" -> Lead (lead_context_of_yojson value_ path)
   | "ProspectingResult" -> ProspectingResult (prospecting_result_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "EngagementContextPayload" unknown)
    : engagement_context_payload)

let client_token_of_yojson = string_of_yojson

let create_engagement_context_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     engagement_identifier =
       value_for_key engagement_arn_or_identifier_of_yojson "EngagementIdentifier" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     type_ = value_for_key engagement_context_type_of_yojson "Type" _list path;
     payload = value_for_key engagement_context_payload_of_yojson "Payload" _list path;
   }
    : create_engagement_context_request)

let engagement_invitation_arn_or_identifier_of_yojson = string_of_yojson

let accept_engagement_invitation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     identifier =
       value_for_key engagement_invitation_arn_or_identifier_of_yojson "Identifier" _list path;
   }
    : accept_engagement_invitation_request)

let duns_number_of_yojson = string_of_yojson

let address_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     city = option_of_yojson (value_for_key address_part_of_yojson "City") _list path;
     postal_code = option_of_yojson (value_for_key address_part_of_yojson "PostalCode") _list path;
     state_or_region =
       option_of_yojson (value_for_key address_part_of_yojson "StateOrRegion") _list path;
     country_code = option_of_yojson (value_for_key country_code_of_yojson "CountryCode") _list path;
     street_address =
       option_of_yojson (value_for_key address_part_of_yojson "StreetAddress") _list path;
   }
    : address)

let aws_account_of_yojson = string_of_yojson
let website_url_of_yojson = string_of_yojson

let account_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     industry = option_of_yojson (value_for_key industry_of_yojson "Industry") _list path;
     other_industry =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "OtherIndustry")
         _list path;
     company_name = value_for_key name_of_yojson "CompanyName" _list path;
     website_url = option_of_yojson (value_for_key website_url_of_yojson "WebsiteUrl") _list path;
     aws_account_id =
       option_of_yojson (value_for_key aws_account_of_yojson "AwsAccountId") _list path;
     address = option_of_yojson (value_for_key address_of_yojson "Address") _list path;
     duns = option_of_yojson (value_for_key duns_number_of_yojson "Duns") _list path;
   }
    : account)

let alias_of_yojson = string_of_yojson

let account_receiver_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alias = option_of_yojson (value_for_key alias_of_yojson "Alias") _list path;
     aws_account_id = value_for_key aws_account_of_yojson "AwsAccountId" _list path;
   }
    : account_receiver)

let account_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     industry = option_of_yojson (value_for_key industry_of_yojson "Industry") _list path;
     other_industry =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "OtherIndustry")
         _list path;
     company_name = value_for_key name_of_yojson "CompanyName" _list path;
     website_url = option_of_yojson (value_for_key website_url_of_yojson "WebsiteUrl") _list path;
     address = option_of_yojson (value_for_key address_summary_of_yojson "Address") _list path;
   }
    : account_summary)

let amount_of_yojson = string_of_yojson
let monetary_amount_of_yojson = string_of_yojson

let amount_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson monetary_amount_of_yojson
    tree path

let apn_programs_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let assignee_contact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     email = value_for_key email_of_yojson "Email" _list path;
     first_name = value_for_key name_of_yojson "FirstName" _list path;
     last_name = value_for_key name_of_yojson "LastName" _list path;
     phone = option_of_yojson (value_for_key phone_number_of_yojson "Phone") _list path;
     business_title = value_for_key job_title_of_yojson "BusinessTitle" _list path;
   }
    : assignee_contact)

let opportunity_identifier_of_yojson = string_of_yojson

let assign_opportunity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     identifier = value_for_key opportunity_identifier_of_yojson "Identifier" _list path;
     assignee = value_for_key assignee_contact_of_yojson "Assignee" _list path;
   }
    : assign_opportunity_request)

let related_entity_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Solutions" -> SOLUTIONS
    | `String "AwsProducts" -> AWS_PRODUCTS
    | `String "AwsMarketplaceOffers" -> AWS_MARKETPLACE_OFFERS
    | `String "AwsMarketplaceOfferSets" -> AWS_MARKETPLACE_OFFER_SETS
    | `String "AwsMarketplaceSolutions" -> AWS_MARKETPLACE_SOLUTIONS
    | `String "AwsMarketplaceProducts" -> AWS_MARKETPLACE_PRODUCTS
    | `String value -> raise (deserialize_unknown_enum_value_error path "RelatedEntityType" value)
    | _ -> raise (deserialize_wrong_type_error path "RelatedEntityType")
     : related_entity_type)
    : related_entity_type)

let associate_opportunity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     opportunity_identifier =
       value_for_key opportunity_identifier_of_yojson "OpportunityIdentifier" _list path;
     related_entity_type =
       value_for_key related_entity_type_of_yojson "RelatedEntityType" _list path;
     related_entity_identifier =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "RelatedEntityIdentifier" _list path;
   }
    : associate_opportunity_request)

let aws_account_id_or_alias_list_of_yojson tree path =
  list_of_yojson aws_account_of_yojson tree path

let aws_account_list_of_yojson tree path = list_of_yojson aws_account_of_yojson tree path

let aws_closed_lost_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "Administrative" -> ADMINISTRATIVE
    | `String "Business Associate Agreement" -> BUSINESS_ASSOCIATE_AGREEMENT
    | `String "Company Acquired/Dissolved" -> COMPANY_ACQUIRED_DISSOLVED
    | `String "Competitive Offering" -> COMPETITIVE_OFFERING
    | `String "Customer Data Requirement" -> CUSTOMER_DATA_REQUIREMENT
    | `String "Customer Deficiency" -> CUSTOMER_DEFICIENCY
    | `String "Customer Experience" -> CUSTOMER_EXPERIENCE
    | `String "Delay / Cancellation of Project" -> DELAY_CANCELLATION_OF_PROJECT
    | `String "Duplicate" -> DUPLICATE
    | `String "Duplicate Opportunity" -> DUPLICATE_OPPORTUNITY
    | `String "Executive Blocker" -> EXECUTIVE_BLOCKER
    | `String "Failed Vetting" -> FAILED_VETTING
    | `String "Feature Limitation" -> FEATURE_LIMITATION
    | `String "Financial/Commercial" -> FINANCIAL_COMMERCIAL
    | `String "Insufficient Amazon Value" -> INSUFFICIENT_AMAZON_VALUE
    | `String "Insufficient AWS Value" -> INSUFFICIENT_AWS_VALUE
    | `String "International Constraints" -> INTERNATIONAL_CONSTRAINTS
    | `String "Legal / Tax / Regulatory" -> LEGAL_TAX_REGULATORY
    | `String "Legal Terms and Conditions" -> LEGAL_TERMS_AND_CONDITIONS
    | `String "Lost to Competitor" -> LOST_TO_COMPETITOR
    | `String "Lost to Competitor - Google" -> LOST_TO_COMPETITOR_GOOGLE
    | `String "Lost to Competitor - Microsoft" -> LOST_TO_COMPETITOR_MICROSOFT
    | `String "Lost to Competitor - Other" -> LOST_TO_COMPETITOR_OTHER
    | `String "Lost to Competitor - Rackspace" -> LOST_TO_COMPETITOR_RACKSPACE
    | `String "Lost to Competitor - SoftLayer" -> LOST_TO_COMPETITOR_SOFTLAYER
    | `String "Lost to Competitor - VMWare" -> LOST_TO_COMPETITOR_VMWARE
    | `String "No Customer Reference" -> NO_CUSTOMER_REFERENCE
    | `String "No Integration Resources" -> NO_INTEGRATION_RESOURCES
    | `String "No Opportunity" -> NO_OPPORTUNITY
    | `String "No Perceived Value of MP" -> NO_PERCEIVED_VALUE_OF_MP
    | `String "No Response" -> NO_RESPONSE
    | `String "Not Committed to AWS" -> NOT_COMMITTED_TO_AWS
    | `String "No Update" -> NO_UPDATE
    | `String "On Premises Deployment" -> ON_PREMISES_DEPLOYMENT
    | `String "Other" -> OTHER
    | `String "Other (Details in Description)" -> OTHER_DETAILS_IN_DESCRIPTION
    | `String "Partner Gap" -> PARTNER_GAP
    | `String "Past Due" -> PAST_DUE
    | `String "People/Relationship/Governance" -> PEOPLE_RELATIONSHIP_GOVERNANCE
    | `String "Platform Technology Limitation" -> PLATFORM_TECHNOLOGY_LIMITATION
    | `String "Preference for Competitor" -> PREFERENCE_FOR_COMPETITOR
    | `String "Price" -> PRICE
    | `String "Product/Technology" -> PRODUCT_TECHNOLOGY
    | `String "Product Not on AWS" -> PRODUCT_NOT_ON_AWS
    | `String "Security / Compliance" -> SECURITY_COMPLIANCE
    | `String "Self-Service" -> SELF_SERVICE
    | `String "Technical Limitations" -> TECHNICAL_LIMITATIONS
    | `String "Term Sheet Impasse" -> TERM_SHEET_IMPASSE
    | `String value -> raise (deserialize_unknown_enum_value_error path "AwsClosedLostReason" value)
    | _ -> raise (deserialize_wrong_type_error path "AwsClosedLostReason")
     : aws_closed_lost_reason)
    : aws_closed_lost_reason)

let aws_funding_used_of_yojson (tree : t) path =
  ((match tree with
    | `String "Yes" -> YES
    | `String "No" -> NO
    | `String value -> raise (deserialize_unknown_enum_value_error path "AwsFundingUsed" value)
    | _ -> raise (deserialize_wrong_type_error path "AwsFundingUsed")
     : aws_funding_used)
    : aws_funding_used)

let aws_marketplace_offer_identifier_of_yojson = string_of_yojson

let aws_marketplace_offer_identifiers_of_yojson tree path =
  list_of_yojson aws_marketplace_offer_identifier_of_yojson tree path

let aws_marketplace_offer_set_identifier_of_yojson = string_of_yojson

let aws_marketplace_offer_set_identifiers_of_yojson tree path =
  list_of_yojson aws_marketplace_offer_set_identifier_of_yojson tree path

let aws_marketplace_product_arn_of_yojson = string_of_yojson

let aws_marketplace_product_identifiers_of_yojson tree path =
  list_of_yojson aws_marketplace_product_arn_of_yojson tree path

let aws_marketplace_solution_arn_of_yojson = string_of_yojson

let aws_marketplace_solution_arn_list_of_yojson tree path =
  list_of_yojson aws_marketplace_solution_arn_of_yojson tree path

let aws_marketplace_solution_identifier_of_yojson = string_of_yojson

let aws_marketplace_solution_identifiers_of_yojson tree path =
  list_of_yojson aws_marketplace_solution_identifier_of_yojson tree path

let aws_member_business_title_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWSSalesRep" -> AWS_SALES_REP
    | `String "AWSAccountOwner" -> AWS_ACCOUNT_OWNER
    | `String "WWPSPDM" -> WWPSPDM
    | `String "PDM" -> PDM
    | `String "PSM" -> PSM
    | `String "ISVSM" -> ISVSM
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AwsMemberBusinessTitle" value)
    | _ -> raise (deserialize_wrong_type_error path "AwsMemberBusinessTitle")
     : aws_member_business_title)
    : aws_member_business_title)

let contact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     email = option_of_yojson (value_for_key email_of_yojson "Email") _list path;
     first_name = option_of_yojson (value_for_key name_of_yojson "FirstName") _list path;
     last_name = option_of_yojson (value_for_key name_of_yojson "LastName") _list path;
     business_title =
       option_of_yojson (value_for_key job_title_of_yojson "BusinessTitle") _list path;
     phone = option_of_yojson (value_for_key phone_number_of_yojson "Phone") _list path;
   }
    : contact)

let customer_contacts_list_of_yojson tree path = list_of_yojson contact_of_yojson tree path

let aws_opportunity_customer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     contacts =
       option_of_yojson (value_for_key customer_contacts_list_of_yojson "Contacts") _list path;
   }
    : aws_opportunity_customer)

let recommendation_attribute_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let recommendation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Type" _list path;
     details =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Details" _list path;
     attributes =
       option_of_yojson
         (value_for_key recommendation_attribute_map_of_yojson "Attributes")
         _list path;
   }
    : recommendation)

let recommendation_list_of_yojson tree path = list_of_yojson recommendation_of_yojson tree path

let opportunity_quality_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     score =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "Score")
         _list path;
     trend =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Trend")
         _list path;
   }
    : opportunity_quality)

let aws_product_optimization_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Description" _list
         path;
     savings_amount = value_for_key monetary_amount_of_yojson "SavingsAmount" _list path;
   }
    : aws_product_optimization)

let aws_product_optimizations_list_of_yojson tree path =
  list_of_yojson aws_product_optimization_of_yojson tree path

let string_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let aws_product_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     product_code =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ProductCode" _list
         path;
     service_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ServiceCode")
         _list path;
     categories = value_for_key string_list_of_yojson "Categories" _list path;
     amount = option_of_yojson (value_for_key monetary_amount_of_yojson "Amount") _list path;
     optimized_amount =
       option_of_yojson (value_for_key monetary_amount_of_yojson "OptimizedAmount") _list path;
     potential_savings_amount =
       option_of_yojson
         (value_for_key monetary_amount_of_yojson "PotentialSavingsAmount")
         _list path;
     optimizations =
       value_for_key aws_product_optimizations_list_of_yojson "Optimizations" _list path;
   }
    : aws_product_details)

let aws_products_list_of_yojson tree path = list_of_yojson aws_product_details_of_yojson tree path

let payment_frequency_of_yojson (tree : t) path =
  ((match tree with
    | `String "Monthly" -> MONTHLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "PaymentFrequency" value)
    | _ -> raise (deserialize_wrong_type_error path "PaymentFrequency")
     : payment_frequency)
    : payment_frequency)

let currency_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "USD" -> USD
    | `String "EUR" -> EUR
    | `String "GBP" -> GBP
    | `String "AUD" -> AUD
    | `String "CAD" -> CAD
    | `String "CNY" -> CNY
    | `String "NZD" -> NZD
    | `String "INR" -> INR
    | `String "JPY" -> JPY
    | `String "CHF" -> CHF
    | `String "SEK" -> SEK
    | `String "AED" -> AED
    | `String "AFN" -> AFN
    | `String "ALL" -> ALL
    | `String "AMD" -> AMD
    | `String "ANG" -> ANG
    | `String "AOA" -> AOA
    | `String "ARS" -> ARS
    | `String "AWG" -> AWG
    | `String "AZN" -> AZN
    | `String "BAM" -> BAM
    | `String "BBD" -> BBD
    | `String "BDT" -> BDT
    | `String "BGN" -> BGN
    | `String "BHD" -> BHD
    | `String "BIF" -> BIF
    | `String "BMD" -> BMD
    | `String "BND" -> BND
    | `String "BOB" -> BOB
    | `String "BOV" -> BOV
    | `String "BRL" -> BRL
    | `String "BSD" -> BSD
    | `String "BTN" -> BTN
    | `String "BWP" -> BWP
    | `String "BYN" -> BYN
    | `String "BZD" -> BZD
    | `String "CDF" -> CDF
    | `String "CHE" -> CHE
    | `String "CHW" -> CHW
    | `String "CLF" -> CLF
    | `String "CLP" -> CLP
    | `String "COP" -> COP
    | `String "COU" -> COU
    | `String "CRC" -> CRC
    | `String "CUC" -> CUC
    | `String "CUP" -> CUP
    | `String "CVE" -> CVE
    | `String "CZK" -> CZK
    | `String "DJF" -> DJF
    | `String "DKK" -> DKK
    | `String "DOP" -> DOP
    | `String "DZD" -> DZD
    | `String "EGP" -> EGP
    | `String "ERN" -> ERN
    | `String "ETB" -> ETB
    | `String "FJD" -> FJD
    | `String "FKP" -> FKP
    | `String "GEL" -> GEL
    | `String "GHS" -> GHS
    | `String "GIP" -> GIP
    | `String "GMD" -> GMD
    | `String "GNF" -> GNF
    | `String "GTQ" -> GTQ
    | `String "GYD" -> GYD
    | `String "HKD" -> HKD
    | `String "HNL" -> HNL
    | `String "HRK" -> HRK
    | `String "HTG" -> HTG
    | `String "HUF" -> HUF
    | `String "IDR" -> IDR
    | `String "ILS" -> ILS
    | `String "IQD" -> IQD
    | `String "IRR" -> IRR
    | `String "ISK" -> ISK
    | `String "JMD" -> JMD
    | `String "JOD" -> JOD
    | `String "KES" -> KES
    | `String "KGS" -> KGS
    | `String "KHR" -> KHR
    | `String "KMF" -> KMF
    | `String "KPW" -> KPW
    | `String "KRW" -> KRW
    | `String "KWD" -> KWD
    | `String "KYD" -> KYD
    | `String "KZT" -> KZT
    | `String "LAK" -> LAK
    | `String "LBP" -> LBP
    | `String "LKR" -> LKR
    | `String "LRD" -> LRD
    | `String "LSL" -> LSL
    | `String "LYD" -> LYD
    | `String "MAD" -> MAD
    | `String "MDL" -> MDL
    | `String "MGA" -> MGA
    | `String "MKD" -> MKD
    | `String "MMK" -> MMK
    | `String "MNT" -> MNT
    | `String "MOP" -> MOP
    | `String "MRU" -> MRU
    | `String "MUR" -> MUR
    | `String "MVR" -> MVR
    | `String "MWK" -> MWK
    | `String "MXN" -> MXN
    | `String "MXV" -> MXV
    | `String "MYR" -> MYR
    | `String "MZN" -> MZN
    | `String "NAD" -> NAD
    | `String "NGN" -> NGN
    | `String "NIO" -> NIO
    | `String "NOK" -> NOK
    | `String "NPR" -> NPR
    | `String "OMR" -> OMR
    | `String "PAB" -> PAB
    | `String "PEN" -> PEN
    | `String "PGK" -> PGK
    | `String "PHP" -> PHP
    | `String "PKR" -> PKR
    | `String "PLN" -> PLN
    | `String "PYG" -> PYG
    | `String "QAR" -> QAR
    | `String "RON" -> RON
    | `String "RSD" -> RSD
    | `String "RUB" -> RUB
    | `String "RWF" -> RWF
    | `String "SAR" -> SAR
    | `String "SBD" -> SBD
    | `String "SCR" -> SCR
    | `String "SDG" -> SDG
    | `String "SGD" -> SGD
    | `String "SHP" -> SHP
    | `String "SLL" -> SLL
    | `String "SOS" -> SOS
    | `String "SRD" -> SRD
    | `String "SSP" -> SSP
    | `String "STN" -> STN
    | `String "SVC" -> SVC
    | `String "SYP" -> SYP
    | `String "SZL" -> SZL
    | `String "THB" -> THB
    | `String "TJS" -> TJS
    | `String "TMT" -> TMT
    | `String "TND" -> TND
    | `String "TOP" -> TOP
    | `String "TRY" -> TRY
    | `String "TTD" -> TTD
    | `String "TWD" -> TWD
    | `String "TZS" -> TZS
    | `String "UAH" -> UAH
    | `String "UGX" -> UGX
    | `String "USN" -> USN
    | `String "UYI" -> UYI
    | `String "UYU" -> UYU
    | `String "UZS" -> UZS
    | `String "VEF" -> VEF
    | `String "VND" -> VND
    | `String "VUV" -> VUV
    | `String "WST" -> WST
    | `String "XAF" -> XAF
    | `String "XCD" -> XCD
    | `String "XDR" -> XDR
    | `String "XOF" -> XOF
    | `String "XPF" -> XPF
    | `String "XSU" -> XSU
    | `String "XUA" -> XUA
    | `String "YER" -> YER
    | `String "ZAR" -> ZAR
    | `String "ZMW" -> ZMW
    | `String "ZWL" -> ZWL
    | `String value -> raise (deserialize_unknown_enum_value_error path "CurrencyCode" value)
    | _ -> raise (deserialize_wrong_type_error path "CurrencyCode")
     : currency_code)
    : currency_code)

let aws_product_insights_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     currency_code = value_for_key currency_code_of_yojson "CurrencyCode" _list path;
     frequency = value_for_key payment_frequency_of_yojson "Frequency" _list path;
     total_amount =
       option_of_yojson (value_for_key monetary_amount_of_yojson "TotalAmount") _list path;
     total_optimized_amount =
       option_of_yojson (value_for_key monetary_amount_of_yojson "TotalOptimizedAmount") _list path;
     total_potential_savings_amount =
       option_of_yojson
         (value_for_key monetary_amount_of_yojson "TotalPotentialSavingsAmount")
         _list path;
     total_amount_by_category =
       value_for_key amount_map_of_yojson "TotalAmountByCategory" _list path;
     aws_products = value_for_key aws_products_list_of_yojson "AwsProducts" _list path;
   }
    : aws_product_insights)

let aws_products_spend_insights_by_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     partner = option_of_yojson (value_for_key aws_product_insights_of_yojson "Partner") _list path;
     aw_s = option_of_yojson (value_for_key aws_product_insights_of_yojson "AWS") _list path;
   }
    : aws_products_spend_insights_by_source)

let engagement_score_of_yojson (tree : t) path =
  ((match tree with
    | `String "High" -> HIGH
    | `String "Medium" -> MEDIUM
    | `String "Low" -> LOW
    | `String value -> raise (deserialize_unknown_enum_value_error path "EngagementScore" value)
    | _ -> raise (deserialize_wrong_type_error path "EngagementScore")
     : engagement_score)
    : engagement_score)

let aws_opportunity_insights_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_best_actions =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextBestActions")
         _list path;
     engagement_score =
       option_of_yojson (value_for_key engagement_score_of_yojson "EngagementScore") _list path;
     aws_products_spend_insights_by_source =
       option_of_yojson
         (value_for_key aws_products_spend_insights_by_source_of_yojson
            "AwsProductsSpendInsightsBySource")
         _list path;
     opportunity_quality =
       option_of_yojson
         (value_for_key opportunity_quality_of_yojson "OpportunityQuality")
         _list path;
     recommendations =
       option_of_yojson (value_for_key recommendation_list_of_yojson "Recommendations") _list path;
   }
    : aws_opportunity_insights)

let profile_next_steps_history_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Value" _list path;
     time = value_for_key date_time_of_yojson "Time" _list path;
   }
    : profile_next_steps_history)

let profile_next_steps_histories_of_yojson tree path =
  list_of_yojson profile_next_steps_history_of_yojson tree path

let pii_string_of_yojson = string_of_yojson

let aws_opportunity_stage_of_yojson (tree : t) path =
  ((match tree with
    | `String "Not Started" -> NOT_STARTED
    | `String "In Progress" -> IN_PROGRESS
    | `String "Prospect" -> PROSPECT
    | `String "Engaged" -> ENGAGED
    | `String "Identified" -> IDENTIFIED
    | `String "Qualify" -> QUALIFY
    | `String "Research" -> RESEARCH
    | `String "Seller Engaged" -> SELLER_ENGAGED
    | `String "Evaluating" -> EVALUATING
    | `String "Seller Registered" -> SELLER_REGISTERED
    | `String "Term Sheet Negotiation" -> TERM_SHEET_NEGOTIATION
    | `String "Contract Negotiation" -> CONTRACT_NEGOTIATION
    | `String "Onboarding" -> ONBOARDING
    | `String "Building Integration" -> BUILDING_INTEGRATION
    | `String "Qualified" -> QUALIFIED
    | `String "On-hold" -> ON_HOLD
    | `String "Technical Validation" -> TECHNICAL_VALIDATION
    | `String "Business Validation" -> BUSINESS_VALIDATION
    | `String "Committed" -> COMMITTED
    | `String "Launched" -> LAUNCHED
    | `String "Deferred to Partner" -> DEFERRED_TO_PARTNER
    | `String "Closed Lost" -> CLOSED_LOST
    | `String "Completed" -> COMPLETED
    | `String "Closed Incomplete" -> CLOSED_INCOMPLETE
    | `String value -> raise (deserialize_unknown_enum_value_error path "AwsOpportunityStage" value)
    | _ -> raise (deserialize_wrong_type_error path "AwsOpportunityStage")
     : aws_opportunity_stage)
    : aws_opportunity_stage)

let date_of_yojson = string_of_yojson

let aws_opportunity_life_cycle_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_close_date =
       option_of_yojson (value_for_key date_of_yojson "TargetCloseDate") _list path;
     closed_lost_reason =
       option_of_yojson
         (value_for_key aws_closed_lost_reason_of_yojson "ClosedLostReason")
         _list path;
     stage = option_of_yojson (value_for_key aws_opportunity_stage_of_yojson "Stage") _list path;
     next_steps = option_of_yojson (value_for_key pii_string_of_yojson "NextSteps") _list path;
     next_steps_history =
       option_of_yojson
         (value_for_key profile_next_steps_histories_of_yojson "NextStepsHistory")
         _list path;
   }
    : aws_opportunity_life_cycle)

let aws_partition_of_yojson (tree : t) path =
  ((match tree with
    | `String "aws-eusc" -> AWS_EUSC
    | `String value -> raise (deserialize_unknown_enum_value_error path "AwsPartition" value)
    | _ -> raise (deserialize_wrong_type_error path "AwsPartition")
     : aws_partition)
    : aws_partition)

let estimation_url_of_yojson = string_of_yojson

let expected_customer_spend_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     amount = option_of_yojson (value_for_key amount_of_yojson "Amount") _list path;
     currency_code = value_for_key currency_code_of_yojson "CurrencyCode" _list path;
     frequency = value_for_key payment_frequency_of_yojson "Frequency" _list path;
     target_company =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "TargetCompany" _list
         path;
     estimation_url =
       option_of_yojson (value_for_key estimation_url_of_yojson "EstimationUrl") _list path;
   }
    : expected_customer_spend)

let expected_customer_spend_list_of_yojson tree path =
  list_of_yojson expected_customer_spend_of_yojson tree path

let aws_opportunity_project_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expected_customer_spend =
       option_of_yojson
         (value_for_key expected_customer_spend_list_of_yojson "ExpectedCustomerSpend")
         _list path;
     aws_partition =
       option_of_yojson (value_for_key aws_partition_of_yojson "AwsPartition") _list path;
   }
    : aws_opportunity_project)

let solution_identifier_of_yojson = string_of_yojson

let solution_identifiers_of_yojson tree path =
  list_of_yojson solution_identifier_of_yojson tree path

let aws_product_identifier_of_yojson = string_of_yojson

let aws_product_identifiers_of_yojson tree path =
  list_of_yojson aws_product_identifier_of_yojson tree path

let aws_opportunity_related_entities_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_products =
       option_of_yojson (value_for_key aws_product_identifiers_of_yojson "AwsProducts") _list path;
     solutions =
       option_of_yojson (value_for_key solution_identifiers_of_yojson "Solutions") _list path;
     aws_marketplace_solutions =
       option_of_yojson
         (value_for_key aws_marketplace_solution_identifiers_of_yojson "AwsMarketplaceSolutions")
         _list path;
     aws_marketplace_products =
       option_of_yojson
         (value_for_key aws_marketplace_product_identifiers_of_yojson "AwsMarketplaceProducts")
         _list path;
   }
    : aws_opportunity_related_entities)

let involvement_type_change_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "Expansion Opportunity" -> EXPANSION_OPPORTUNITY
    | `String "Change in Deal Information" -> CHANGE_IN_DEAL_INFORMATION
    | `String "Customer Requested" -> CUSTOMER_REQUESTED
    | `String "Technical Complexity" -> TECHNICAL_COMPLEXITY
    | `String "Risk Mitigation" -> RISK_MITIGATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InvolvementTypeChangeReason" value)
    | _ -> raise (deserialize_wrong_type_error path "InvolvementTypeChangeReason")
     : involvement_type_change_reason)
    : involvement_type_change_reason)

let aws_team_member_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     email = option_of_yojson (value_for_key email_of_yojson "Email") _list path;
     first_name = option_of_yojson (value_for_key name_of_yojson "FirstName") _list path;
     last_name = option_of_yojson (value_for_key name_of_yojson "LastName") _list path;
     business_title =
       option_of_yojson
         (value_for_key aws_member_business_title_of_yojson "BusinessTitle")
         _list path;
   }
    : aws_team_member)

let aws_opportunity_team_members_list_of_yojson tree path =
  list_of_yojson aws_team_member_of_yojson tree path

let visibility_of_yojson (tree : t) path =
  ((match tree with
    | `String "Full" -> FULL
    | `String "Limited" -> LIMITED
    | `String value -> raise (deserialize_unknown_enum_value_error path "Visibility" value)
    | _ -> raise (deserialize_wrong_type_error path "Visibility")
     : visibility)
    : visibility)

let sales_involvement_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "For Visibility Only" -> FOR_VISIBILITY_ONLY
    | `String "Co-Sell" -> CO_SELL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SalesInvolvementType" value)
    | _ -> raise (deserialize_wrong_type_error path "SalesInvolvementType")
     : sales_involvement_type)
    : sales_involvement_type)

let opportunity_origin_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS Referral" -> AWS_REFERRAL
    | `String "Partner Referral" -> PARTNER_REFERRAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpportunityOrigin" value)
    | _ -> raise (deserialize_wrong_type_error path "OpportunityOrigin")
     : opportunity_origin)
    : opportunity_origin)

let aws_opportunity_summary_full_view_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     related_opportunity_id =
       option_of_yojson
         (value_for_key opportunity_identifier_of_yojson "RelatedOpportunityId")
         _list path;
     origin = option_of_yojson (value_for_key opportunity_origin_of_yojson "Origin") _list path;
     involvement_type =
       option_of_yojson
         (value_for_key sales_involvement_type_of_yojson "InvolvementType")
         _list path;
     visibility = option_of_yojson (value_for_key visibility_of_yojson "Visibility") _list path;
     life_cycle =
       option_of_yojson (value_for_key aws_opportunity_life_cycle_of_yojson "LifeCycle") _list path;
     opportunity_team =
       option_of_yojson
         (value_for_key aws_opportunity_team_members_list_of_yojson "OpportunityTeam")
         _list path;
     insights =
       option_of_yojson (value_for_key aws_opportunity_insights_of_yojson "Insights") _list path;
     involvement_type_change_reason =
       option_of_yojson
         (value_for_key involvement_type_change_reason_of_yojson "InvolvementTypeChangeReason")
         _list path;
     related_entity_ids =
       option_of_yojson
         (value_for_key aws_opportunity_related_entities_of_yojson "RelatedEntityIds")
         _list path;
     customer =
       option_of_yojson (value_for_key aws_opportunity_customer_of_yojson "Customer") _list path;
     project =
       option_of_yojson (value_for_key aws_opportunity_project_of_yojson "Project") _list path;
     cosell_motion =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "CosellMotion")
         _list path;
   }
    : aws_opportunity_summary_full_view)

let aws_submission_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     involvement_type = value_for_key sales_involvement_type_of_yojson "InvolvementType" _list path;
     visibility = option_of_yojson (value_for_key visibility_of_yojson "Visibility") _list path;
   }
    : aws_submission)

let channel_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS Marketing Central" -> AWS_MARKETING_CENTRAL
    | `String "Content Syndication" -> CONTENT_SYNDICATION
    | `String "Display" -> DISPLAY
    | `String "Email" -> EMAIL
    | `String "Live Event" -> LIVE_EVENT
    | `String "Out Of Home (OOH)" -> OUT_OF_HOME
    | `String "Print" -> PRINT
    | `String "Search" -> SEARCH
    | `String "Social" -> SOCIAL
    | `String "Telemarketing" -> TELEMARKETING
    | `String "TV" -> TV
    | `String "Video" -> VIDEO
    | `String "Virtual Event" -> VIRTUAL_EVENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "Channel" value)
    | _ -> raise (deserialize_wrong_type_error path "Channel")
     : channel)
    : channel)

let channels_of_yojson tree path = list_of_yojson channel_of_yojson tree path

let closed_lost_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "Customer Deficiency" -> CUSTOMER_DEFICIENCY
    | `String "Delay / Cancellation of Project" -> DELAY_CANCELLATION_OF_PROJECT
    | `String "Legal / Tax / Regulatory" -> LEGAL_TAX_REGULATORY
    | `String "Lost to Competitor - Google" -> LOST_TO_COMPETITOR_GOOGLE
    | `String "Lost to Competitor - Microsoft" -> LOST_TO_COMPETITOR_MICROSOFT
    | `String "Lost to Competitor - SoftLayer" -> LOST_TO_COMPETITOR_SOFTLAYER
    | `String "Lost to Competitor - VMWare" -> LOST_TO_COMPETITOR_VMWARE
    | `String "Lost to Competitor - Other" -> LOST_TO_COMPETITOR_OTHER
    | `String "No Opportunity" -> NO_OPPORTUNITY
    | `String "On Premises Deployment" -> ON_PREMISES_DEPLOYMENT
    | `String "Partner Gap" -> PARTNER_GAP
    | `String "Price" -> PRICE
    | `String "Security / Compliance" -> SECURITY_COMPLIANCE
    | `String "Technical Limitations" -> TECHNICAL_LIMITATIONS
    | `String "Customer Experience" -> CUSTOMER_EXPERIENCE
    | `String "Other" -> OTHER
    | `String "People/Relationship/Governance" -> PEOPLERELATIONSHIPGOVERNANCE
    | `String "Product/Technology" -> PRODUCTTECHNOLOGY
    | `String "Financial/Commercial" -> FINANCIALCOMMERCIAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ClosedLostReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ClosedLostReason")
     : closed_lost_reason)
    : closed_lost_reason)

let competitor_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Oracle Cloud" -> ORACLE_CLOUD
    | `String "On-Prem" -> ON_PREM
    | `String "Co-location" -> CO_LOCATION
    | `String "Akamai" -> AKAMAI
    | `String "AliCloud" -> ALICLOUD
    | `String "Google Cloud Platform" -> GOOGLE_CLOUD_PLATFORM
    | `String "IBM Softlayer" -> IBM_SOFTLAYER
    | `String "Microsoft Azure" -> MICROSOFT_AZURE
    | `String "Other- Cost Optimization" -> OTHER_COST_OPTIMIZATION
    | `String "No Competition" -> NO_COMPETITION
    | `String "*Other" -> OTHER
    | `String value -> raise (deserialize_unknown_enum_value_error path "CompetitorName" value)
    | _ -> raise (deserialize_wrong_type_error path "CompetitorName")
     : competitor_name)
    : competitor_name)

let context_identifier_of_yojson = string_of_yojson
let context_identifiers_of_yojson tree path = list_of_yojson context_identifier_of_yojson tree path

let create_engagement_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key engagement_identifier_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key engagement_arn_of_yojson "Arn") _list path;
     modified_at = option_of_yojson (value_for_key date_time_of_yojson "ModifiedAt") _list path;
   }
    : create_engagement_response)

let engagement_context_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key engagement_context_identifier_of_yojson "Id") _list path;
     type_ = value_for_key engagement_context_type_of_yojson "Type" _list path;
     payload =
       option_of_yojson (value_for_key engagement_context_payload_of_yojson "Payload") _list path;
   }
    : engagement_context_details)

let engagement_contexts_of_yojson tree path =
  list_of_yojson engagement_context_details_of_yojson tree path

let engagement_description_of_yojson = string_of_yojson
let engagement_title_of_yojson = string_of_yojson

let create_engagement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     title = value_for_key engagement_title_of_yojson "Title" _list path;
     description = value_for_key engagement_description_of_yojson "Description" _list path;
     contexts = option_of_yojson (value_for_key engagement_contexts_of_yojson "Contexts") _list path;
   }
    : create_engagement_request)

let engagement_invitation_arn_of_yojson = string_of_yojson
let engagement_invitation_identifier_of_yojson = string_of_yojson

let create_engagement_invitation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key engagement_invitation_identifier_of_yojson "Id" _list path;
     arn = value_for_key engagement_invitation_arn_of_yojson "Arn" _list path;
   }
    : create_engagement_invitation_response)

let lead_invitation_interaction_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_type = value_for_key lead_source_type_of_yojson "SourceType" _list path;
     source_id = value_for_key lead_source_id_of_yojson "SourceId" _list path;
     source_name = value_for_key lead_source_name_of_yojson "SourceName" _list path;
     usecase = option_of_yojson (value_for_key engagement_use_case_of_yojson "Usecase") _list path;
     contact_business_title = value_for_key job_title_of_yojson "ContactBusinessTitle" _list path;
   }
    : lead_invitation_interaction)

let lead_invitation_customer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     industry = option_of_yojson (value_for_key industry_of_yojson "Industry") _list path;
     company_name = value_for_key company_name_of_yojson "CompanyName" _list path;
     website_url =
       option_of_yojson (value_for_key company_website_url_of_yojson "WebsiteUrl") _list path;
     country_code = value_for_key country_code_of_yojson "CountryCode" _list path;
     aws_maturity = option_of_yojson (value_for_key aws_maturity_of_yojson "AwsMaturity") _list path;
     market_segment =
       option_of_yojson (value_for_key market_segment_of_yojson "MarketSegment") _list path;
   }
    : lead_invitation_customer)

let lead_invitation_payload_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     customer = value_for_key lead_invitation_customer_of_yojson "Customer" _list path;
     interaction = value_for_key lead_invitation_interaction_of_yojson "Interaction" _list path;
   }
    : lead_invitation_payload)

let project_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     business_problem =
       value_for_key engagement_customer_business_problem_of_yojson "BusinessProblem" _list path;
     title =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Title" _list path;
     target_completion_date = value_for_key date_of_yojson "TargetCompletionDate" _list path;
     expected_customer_spend =
       value_for_key expected_customer_spend_list_of_yojson "ExpectedCustomerSpend" _list path;
   }
    : project_details)

let receiver_responsibility_of_yojson (tree : t) path =
  ((match tree with
    | `String "Distributor" -> DISTRIBUTOR
    | `String "Reseller" -> RESELLER
    | `String "Hardware Partner" -> HARDWARE_PARTNER
    | `String "Managed Service Provider" -> MANAGED_SERVICE_PROVIDER
    | `String "Software Partner" -> SOFTWARE_PARTNER
    | `String "Services Partner" -> SERVICES_PARTNER
    | `String "Training Partner" -> TRAINING_PARTNER
    | `String "Co-Sell Facilitator" -> CO_SELL_FACILITATOR
    | `String "Facilitator" -> FACILITATOR
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ReceiverResponsibility" value)
    | _ -> raise (deserialize_wrong_type_error path "ReceiverResponsibility")
     : receiver_responsibility)
    : receiver_responsibility)

let receiver_responsibility_list_of_yojson tree path =
  list_of_yojson receiver_responsibility_of_yojson tree path

let sender_contact_email_of_yojson = string_of_yojson

let sender_contact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     email = value_for_key sender_contact_email_of_yojson "Email" _list path;
     first_name = option_of_yojson (value_for_key name_of_yojson "FirstName") _list path;
     last_name = option_of_yojson (value_for_key name_of_yojson "LastName") _list path;
     business_title =
       option_of_yojson (value_for_key job_title_of_yojson "BusinessTitle") _list path;
     phone = option_of_yojson (value_for_key phone_number_of_yojson "Phone") _list path;
   }
    : sender_contact)

let sender_contact_list_of_yojson tree path = list_of_yojson sender_contact_of_yojson tree path

let opportunity_invitation_payload_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sender_contacts =
       option_of_yojson (value_for_key sender_contact_list_of_yojson "SenderContacts") _list path;
     receiver_responsibilities =
       value_for_key receiver_responsibility_list_of_yojson "ReceiverResponsibilities" _list path;
     customer = value_for_key engagement_customer_of_yojson "Customer" _list path;
     project = value_for_key project_details_of_yojson "Project" _list path;
   }
    : opportunity_invitation_payload)

let payload_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "OpportunityInvitation" ->
       OpportunityInvitation (opportunity_invitation_payload_of_yojson value_ path)
   | "LeadInvitation" -> LeadInvitation (lead_invitation_payload_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "Payload" unknown)
    : payload)

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

let invitation_message_of_yojson = string_of_yojson

let invitation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key invitation_message_of_yojson "Message" _list path;
     receiver = value_for_key receiver_of_yojson "Receiver" _list path;
     payload = value_for_key payload_of_yojson "Payload" _list path;
   }
    : invitation)

let create_engagement_invitation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     engagement_identifier =
       value_for_key engagement_identifier_of_yojson "EngagementIdentifier" _list path;
     invitation = value_for_key invitation_of_yojson "Invitation" _list path;
   }
    : create_engagement_invitation_request)

let create_opportunity_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key opportunity_identifier_of_yojson "Id" _list path;
     partner_opportunity_identifier =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "PartnerOpportunityIdentifier")
         _list path;
     last_modified_date =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedDate") _list path;
   }
    : create_opportunity_response)

let partner_opportunity_team_members_list_of_yojson tree path =
  list_of_yojson contact_of_yojson tree path

let next_steps_history_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Value" _list path;
     time = value_for_key date_time_of_yojson "Time" _list path;
   }
    : next_steps_history)

let next_steps_histories_of_yojson tree path = list_of_yojson next_steps_history_of_yojson tree path

let review_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Pending Submission" -> PENDING_SUBMISSION
    | `String "Submitted" -> SUBMITTED
    | `String "In review" -> IN_REVIEW
    | `String "Approved" -> APPROVED
    | `String "Rejected" -> REJECTED
    | `String "Action Required" -> ACTION_REQUIRED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReviewStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ReviewStatus")
     : review_status)
    : review_status)

let stage_of_yojson (tree : t) path =
  ((match tree with
    | `String "Prospect" -> PROSPECT
    | `String "Qualified" -> QUALIFIED
    | `String "Technical Validation" -> TECHNICAL_VALIDATION
    | `String "Business Validation" -> BUSINESS_VALIDATION
    | `String "Committed" -> COMMITTED
    | `String "Launched" -> LAUNCHED
    | `String "Closed Lost" -> CLOSED_LOST
    | `String value -> raise (deserialize_unknown_enum_value_error path "Stage" value)
    | _ -> raise (deserialize_wrong_type_error path "Stage")
     : stage)
    : stage)

let life_cycle_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stage = option_of_yojson (value_for_key stage_of_yojson "Stage") _list path;
     closed_lost_reason =
       option_of_yojson (value_for_key closed_lost_reason_of_yojson "ClosedLostReason") _list path;
     next_steps = option_of_yojson (value_for_key pii_string_of_yojson "NextSteps") _list path;
     target_close_date =
       option_of_yojson (value_for_key date_of_yojson "TargetCloseDate") _list path;
     review_status =
       option_of_yojson (value_for_key review_status_of_yojson "ReviewStatus") _list path;
     review_comments =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ReviewComments")
         _list path;
     review_status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ReviewStatusReason")
         _list path;
     next_steps_history =
       option_of_yojson (value_for_key next_steps_histories_of_yojson "NextStepsHistory") _list path;
   }
    : life_cycle)

let monetary_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     amount =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Amount" _list path;
     currency_code = value_for_key currency_code_of_yojson "CurrencyCode" _list path;
   }
    : monetary_value)

let revenue_model_of_yojson (tree : t) path =
  ((match tree with
    | `String "Contract" -> CONTRACT
    | `String "Pay-as-you-go" -> PAY_AS_YOU_GO
    | `String "Subscription" -> SUBSCRIPTION
    | `String value -> raise (deserialize_unknown_enum_value_error path "RevenueModel" value)
    | _ -> raise (deserialize_wrong_type_error path "RevenueModel")
     : revenue_model)
    : revenue_model)

let software_revenue_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_model =
       option_of_yojson (value_for_key revenue_model_of_yojson "DeliveryModel") _list path;
     value = option_of_yojson (value_for_key monetary_value_of_yojson "Value") _list path;
     effective_date = option_of_yojson (value_for_key date_of_yojson "EffectiveDate") _list path;
     expiration_date = option_of_yojson (value_for_key date_of_yojson "ExpirationDate") _list path;
   }
    : software_revenue)

let use_cases_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let marketing_source_of_yojson (tree : t) path =
  ((match tree with
    | `String "Marketing Activity" -> MARKETING_ACTIVITY
    | `String "None" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "MarketingSource" value)
    | _ -> raise (deserialize_wrong_type_error path "MarketingSource")
     : marketing_source)
    : marketing_source)

let marketing_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     campaign_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "CampaignName")
         _list path;
     source = option_of_yojson (value_for_key marketing_source_of_yojson "Source") _list path;
     use_cases = option_of_yojson (value_for_key use_cases_of_yojson "UseCases") _list path;
     channels = option_of_yojson (value_for_key channels_of_yojson "Channels") _list path;
     aws_funding_used =
       option_of_yojson (value_for_key aws_funding_used_of_yojson "AwsFundingUsed") _list path;
   }
    : marketing)

let opportunity_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Net New Business" -> NET_NEW_BUSINESS
    | `String "Flat Renewal" -> FLAT_RENEWAL
    | `String "Expansion" -> EXPANSION
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpportunityType" value)
    | _ -> raise (deserialize_wrong_type_error path "OpportunityType")
     : opportunity_type)
    : opportunity_type)

let sales_activity_of_yojson (tree : t) path =
  ((match tree with
    | `String "Initialized discussions with customer" -> INITIALIZED_DISCUSSIONS_WITH_CUSTOMER
    | `String "Customer has shown interest in solution" -> CUSTOMER_HAS_SHOWN_INTEREST
    | `String "Conducted POC / Demo" -> CONDUCTED_POC_DEMO
    | `String "In evaluation / planning stage" -> IN_EVALUATION_PLANNING_STAGE
    | `String "Agreed on solution to Business Problem" -> AGREED_ON_SOLUTION_TO_BUSINESS_PROBLEM
    | `String "Completed Action Plan" -> COMPLETED_ACTION_PLAN
    | `String "Finalized Deployment Need" -> FINALIZED_DEPLOYMENT_NEEDS
    | `String "SOW Signed" -> SOW_SIGNED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SalesActivity" value)
    | _ -> raise (deserialize_wrong_type_error path "SalesActivity")
     : sales_activity)
    : sales_activity)

let sales_activities_of_yojson tree path = list_of_yojson sales_activity_of_yojson tree path

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
     term = value_for_key expected_contract_duration_term_of_yojson "Term" _list path;
     value =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Value" _list path;
   }
    : expected_contract_duration)

let delivery_model_of_yojson (tree : t) path =
  ((match tree with
    | `String "SaaS or PaaS" -> SAAS_OR_PAAS
    | `String "BYOL or AMI" -> BYOL_OR_AMI
    | `String "Managed Services" -> MANAGED_SERVICES
    | `String "Professional Services" -> PROFESSIONAL_SERVICES
    | `String "Resell" -> RESELL
    | `String "Other" -> OTHER
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeliveryModel" value)
    | _ -> raise (deserialize_wrong_type_error path "DeliveryModel")
     : delivery_model)
    : delivery_model)

let delivery_models_of_yojson tree path = list_of_yojson delivery_model_of_yojson tree path

let project_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_models =
       option_of_yojson (value_for_key delivery_models_of_yojson "DeliveryModels") _list path;
     expected_customer_spend =
       option_of_yojson
         (value_for_key expected_customer_spend_list_of_yojson "ExpectedCustomerSpend")
         _list path;
     expected_contract_duration =
       option_of_yojson
         (value_for_key expected_contract_duration_of_yojson "ExpectedContractDuration")
         _list path;
     title = option_of_yojson (value_for_key pii_string_of_yojson "Title") _list path;
     apn_programs = option_of_yojson (value_for_key apn_programs_of_yojson "ApnPrograms") _list path;
     customer_business_problem =
       option_of_yojson (value_for_key pii_string_of_yojson "CustomerBusinessProblem") _list path;
     customer_use_case =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "CustomerUseCase")
         _list path;
     related_opportunity_identifier =
       option_of_yojson
         (value_for_key opportunity_identifier_of_yojson "RelatedOpportunityIdentifier")
         _list path;
     sales_activities =
       option_of_yojson (value_for_key sales_activities_of_yojson "SalesActivities") _list path;
     competitor_name =
       option_of_yojson (value_for_key competitor_name_of_yojson "CompetitorName") _list path;
     other_competitor_names =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "OtherCompetitorNames")
         _list path;
     other_solution_description =
       option_of_yojson (value_for_key pii_string_of_yojson "OtherSolutionDescription") _list path;
     additional_comments =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "AdditionalComments")
         _list path;
     aws_partition =
       option_of_yojson (value_for_key aws_partition_of_yojson "AwsPartition") _list path;
   }
    : project)

let customer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account = option_of_yojson (value_for_key account_of_yojson "Account") _list path;
     contacts =
       option_of_yojson (value_for_key customer_contacts_list_of_yojson "Contacts") _list path;
   }
    : customer)

let national_security_of_yojson (tree : t) path =
  ((match tree with
    | `String "Yes" -> YES
    | `String "No" -> NO
    | `String value -> raise (deserialize_unknown_enum_value_error path "NationalSecurity" value)
    | _ -> raise (deserialize_wrong_type_error path "NationalSecurity")
     : national_security)
    : national_security)

let primary_need_from_aws_of_yojson (tree : t) path =
  ((match tree with
    | `String "Co-Sell - Architectural Validation" -> CO_SELL_ARCHITECTURAL_VALIDATION
    | `String "Co-Sell - Business Presentation" -> CO_SELL_BUSINESS_PRESENTATION
    | `String "Co-Sell - Competitive Information" -> CO_SELL_COMPETITIVE_INFORMATION
    | `String "Co-Sell - Pricing Assistance" -> CO_SELL_PRICING_ASSISTANCE
    | `String "Co-Sell - Technical Consultation" -> CO_SELL_TECHNICAL_CONSULTATION
    | `String "Co-Sell - Total Cost of Ownership Evaluation" ->
        CO_SELL_TOTAL_COST_OF_OWNERSHIP_EVALUATION
    | `String "Co-Sell - Deal Support" -> CO_SELL_DEAL_SUPPORT
    | `String "Co-Sell - Support for Public Tender / RFx" -> CO_SELL_SUPPORT_FOR_PUBLIC_TENDER_RFX
    | `String value -> raise (deserialize_unknown_enum_value_error path "PrimaryNeedFromAws" value)
    | _ -> raise (deserialize_wrong_type_error path "PrimaryNeedFromAws")
     : primary_need_from_aws)
    : primary_need_from_aws)

let primary_needs_from_aws_of_yojson tree path =
  list_of_yojson primary_need_from_aws_of_yojson tree path

let create_opportunity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     primary_needs_from_aws =
       option_of_yojson
         (value_for_key primary_needs_from_aws_of_yojson "PrimaryNeedsFromAws")
         _list path;
     national_security =
       option_of_yojson (value_for_key national_security_of_yojson "NationalSecurity") _list path;
     partner_opportunity_identifier =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "PartnerOpportunityIdentifier")
         _list path;
     customer = option_of_yojson (value_for_key customer_of_yojson "Customer") _list path;
     project = option_of_yojson (value_for_key project_of_yojson "Project") _list path;
     opportunity_type =
       option_of_yojson (value_for_key opportunity_type_of_yojson "OpportunityType") _list path;
     marketing = option_of_yojson (value_for_key marketing_of_yojson "Marketing") _list path;
     software_revenue =
       option_of_yojson (value_for_key software_revenue_of_yojson "SoftwareRevenue") _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     life_cycle = option_of_yojson (value_for_key life_cycle_of_yojson "LifeCycle") _list path;
     origin = option_of_yojson (value_for_key opportunity_origin_of_yojson "Origin") _list path;
     opportunity_team =
       option_of_yojson
         (value_for_key partner_opportunity_team_members_list_of_yojson "OpportunityTeam")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_opportunity_request)

let resource_snapshot_revision_of_yojson = int_of_yojson
let resource_arn_of_yojson = string_of_yojson

let create_resource_snapshot_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key resource_arn_of_yojson "Arn") _list path;
     revision =
       option_of_yojson (value_for_key resource_snapshot_revision_of_yojson "Revision") _list path;
   }
    : create_resource_snapshot_response)

let resource_template_name_of_yojson = string_of_yojson
let resource_identifier_of_yojson = string_of_yojson

let resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Opportunity" -> OPPORTUNITY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let create_resource_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     engagement_identifier =
       value_for_key engagement_identifier_of_yojson "EngagementIdentifier" _list path;
     resource_type = value_for_key resource_type_of_yojson "ResourceType" _list path;
     resource_identifier =
       value_for_key resource_identifier_of_yojson "ResourceIdentifier" _list path;
     resource_snapshot_template_identifier =
       value_for_key resource_template_name_of_yojson "ResourceSnapshotTemplateIdentifier" _list
         path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
   }
    : create_resource_snapshot_request)

let resource_snapshot_job_arn_of_yojson = string_of_yojson
let resource_snapshot_job_identifier_of_yojson = string_of_yojson

let create_resource_snapshot_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id =
       option_of_yojson (value_for_key resource_snapshot_job_identifier_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key resource_snapshot_job_arn_of_yojson "Arn") _list path;
   }
    : create_resource_snapshot_job_response)

let create_resource_snapshot_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     engagement_identifier =
       value_for_key engagement_identifier_of_yojson "EngagementIdentifier" _list path;
     resource_type = value_for_key resource_type_of_yojson "ResourceType" _list path;
     resource_identifier =
       value_for_key resource_identifier_of_yojson "ResourceIdentifier" _list path;
     resource_snapshot_template_identifier =
       value_for_key resource_template_name_of_yojson "ResourceSnapshotTemplateIdentifier" _list
         path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_resource_snapshot_job_request)

let created_date_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     after_created_date =
       option_of_yojson (value_for_key date_time_of_yojson "AfterCreatedDate") _list path;
     before_created_date =
       option_of_yojson (value_for_key date_time_of_yojson "BeforeCreatedDate") _list path;
   }
    : created_date_filter)

let customer_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ account = option_of_yojson (value_for_key account_summary_of_yojson "Account") _list path }
    : customer_summary)

let delete_resource_snapshot_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     resource_snapshot_job_identifier =
       value_for_key resource_snapshot_job_identifier_of_yojson "ResourceSnapshotJobIdentifier"
         _list path;
   }
    : delete_resource_snapshot_job_request)

let disassociate_opportunity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     opportunity_identifier =
       value_for_key opportunity_identifier_of_yojson "OpportunityIdentifier" _list path;
     related_entity_type =
       value_for_key related_entity_type_of_yojson "RelatedEntityType" _list path;
     related_entity_identifier =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "RelatedEntityIdentifier" _list path;
   }
    : disassociate_opportunity_request)

let engagement_context_type_list_of_yojson tree path =
  list_of_yojson engagement_context_type_of_yojson tree path

let engagement_identifier_list_of_yojson tree path =
  list_of_yojson engagement_identifier_of_yojson tree path

let engagement_identifiers_of_yojson tree path =
  list_of_yojson engagement_arn_or_identifier_of_yojson tree path

let engagement_invitation_identifiers_of_yojson tree path =
  list_of_yojson engagement_invitation_arn_or_identifier_of_yojson tree path

let engagement_invitation_payload_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "OpportunityInvitation" -> OPPORTUNITY_INVITATION
    | `String "LeadInvitation" -> LEAD_INVITATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EngagementInvitationPayloadType" value)
    | _ -> raise (deserialize_wrong_type_error path "EngagementInvitationPayloadType")
     : engagement_invitation_payload_type)
    : engagement_invitation_payload_type)

let participant_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SENDER" -> SENDER
    | `String "RECEIVER" -> RECEIVER
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParticipantType" value)
    | _ -> raise (deserialize_wrong_type_error path "ParticipantType")
     : participant_type)
    : participant_type)

let invitation_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCEPTED" -> ACCEPTED
    | `String "PENDING" -> PENDING
    | `String "REJECTED" -> REJECTED
    | `String "EXPIRED" -> EXPIRED
    | `String value -> raise (deserialize_unknown_enum_value_error path "InvitationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "InvitationStatus")
     : invitation_status)
    : invitation_status)

let engagement_invitation_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Arn")
         _list path;
     payload_type =
       option_of_yojson
         (value_for_key engagement_invitation_payload_type_of_yojson "PayloadType")
         _list path;
     id = value_for_key engagement_invitation_arn_or_identifier_of_yojson "Id" _list path;
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
     engagement_title =
       option_of_yojson (value_for_key engagement_title_of_yojson "EngagementTitle") _list path;
     status = option_of_yojson (value_for_key invitation_status_of_yojson "Status") _list path;
     invitation_date =
       option_of_yojson (value_for_key date_time_of_yojson "InvitationDate") _list path;
     expiration_date =
       option_of_yojson (value_for_key date_time_of_yojson "ExpirationDate") _list path;
     sender_aws_account_id =
       option_of_yojson (value_for_key aws_account_of_yojson "SenderAwsAccountId") _list path;
     sender_company_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "SenderCompanyName")
         _list path;
     receiver = option_of_yojson (value_for_key receiver_of_yojson "Receiver") _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     participant_type =
       option_of_yojson (value_for_key participant_type_of_yojson "ParticipantType") _list path;
   }
    : engagement_invitation_summary)

let engagement_invitation_summaries_of_yojson tree path =
  list_of_yojson engagement_invitation_summary_of_yojson tree path

let engagement_invitations_payload_type_of_yojson tree path =
  list_of_yojson engagement_invitation_payload_type_of_yojson tree path

let member_company_name_of_yojson = string_of_yojson

let engagement_member_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     company_name =
       option_of_yojson (value_for_key member_company_name_of_yojson "CompanyName") _list path;
     website_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "WebsiteUrl")
         _list path;
     account_id = option_of_yojson (value_for_key aws_account_of_yojson "AccountId") _list path;
   }
    : engagement_member)

let engagement_member_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     company_name =
       option_of_yojson (value_for_key member_company_name_of_yojson "CompanyName") _list path;
     website_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "WebsiteUrl")
         _list path;
   }
    : engagement_member_summary)

let engagement_member_summaries_of_yojson tree path =
  list_of_yojson engagement_member_summary_of_yojson tree path

let engagement_members_of_yojson tree path = list_of_yojson engagement_member_of_yojson tree path
let engagement_page_size_of_yojson = int_of_yojson

let prospecting_task_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "COMPLETED" -> COMPLETED
    | `String "FAILED" -> FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProspectingTaskStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ProspectingTaskStatus")
     : prospecting_task_status)
    : prospecting_task_status)

let engagement_prospecting_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engagement_identifier =
       value_for_key engagement_identifier_of_yojson "EngagementIdentifier" _list path;
     engagement_context_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "EngagementContextId")
         _list path;
     status = value_for_key prospecting_task_status_of_yojson "Status" _list path;
     reason_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ReasonCode")
         _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
   }
    : engagement_prospecting_result)

let engagement_prospecting_result_list_of_yojson tree path =
  list_of_yojson engagement_prospecting_result_of_yojson tree path

let engagement_resource_association_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     resource_id =
       option_of_yojson (value_for_key resource_identifier_of_yojson "ResourceId") _list path;
     created_by = option_of_yojson (value_for_key aws_account_of_yojson "CreatedBy") _list path;
   }
    : engagement_resource_association_summary)

let engagement_resource_association_summary_list_of_yojson tree path =
  list_of_yojson engagement_resource_association_summary_of_yojson tree path

let engagement_sort_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "CreatedDate" -> CreatedDate
    | `String value -> raise (deserialize_unknown_enum_value_error path "EngagementSortName" value)
    | _ -> raise (deserialize_wrong_type_error path "EngagementSortName")
     : engagement_sort_name)
    : engagement_sort_name)

let sort_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASCENDING" -> ASCENDING
    | `String "DESCENDING" -> DESCENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")
     : sort_order)
    : sort_order)

let engagement_sort_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order = value_for_key sort_order_of_yojson "SortOrder" _list path;
     sort_by = value_for_key engagement_sort_name_of_yojson "SortBy" _list path;
   }
    : engagement_sort)

let engagement_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key engagement_arn_of_yojson "Arn") _list path;
     id = option_of_yojson (value_for_key engagement_identifier_of_yojson "Id") _list path;
     title = option_of_yojson (value_for_key engagement_title_of_yojson "Title") _list path;
     created_at = option_of_yojson (value_for_key date_time_of_yojson "CreatedAt") _list path;
     created_by = option_of_yojson (value_for_key aws_account_of_yojson "CreatedBy") _list path;
     member_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MemberCount")
         _list path;
     modified_at = option_of_yojson (value_for_key date_time_of_yojson "ModifiedAt") _list path;
     modified_by = option_of_yojson (value_for_key aws_account_of_yojson "ModifiedBy") _list path;
     context_types =
       option_of_yojson
         (value_for_key engagement_context_type_list_of_yojson "ContextTypes")
         _list path;
   }
    : engagement_summary)

let engagement_summary_list_of_yojson tree path =
  list_of_yojson engagement_summary_of_yojson tree path

let filter_identifier_of_yojson tree path =
  list_of_yojson opportunity_identifier_of_yojson tree path

let filter_life_cycle_review_status_of_yojson tree path =
  list_of_yojson review_status_of_yojson tree path

let filter_life_cycle_stage_of_yojson tree path = list_of_yojson stage_of_yojson tree path

let solution_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Active" -> ACTIVE
    | `String "Inactive" -> INACTIVE
    | `String "Draft" -> DRAFT
    | `String value -> raise (deserialize_unknown_enum_value_error path "SolutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SolutionStatus")
     : solution_status)
    : solution_status)

let filter_status_of_yojson tree path = list_of_yojson solution_status_of_yojson tree path

let get_aws_opportunity_summary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     related_opportunity_id =
       option_of_yojson
         (value_for_key opportunity_identifier_of_yojson "RelatedOpportunityId")
         _list path;
     origin = option_of_yojson (value_for_key opportunity_origin_of_yojson "Origin") _list path;
     involvement_type =
       option_of_yojson
         (value_for_key sales_involvement_type_of_yojson "InvolvementType")
         _list path;
     visibility = option_of_yojson (value_for_key visibility_of_yojson "Visibility") _list path;
     life_cycle =
       option_of_yojson (value_for_key aws_opportunity_life_cycle_of_yojson "LifeCycle") _list path;
     opportunity_team =
       option_of_yojson
         (value_for_key aws_opportunity_team_members_list_of_yojson "OpportunityTeam")
         _list path;
     insights =
       option_of_yojson (value_for_key aws_opportunity_insights_of_yojson "Insights") _list path;
     involvement_type_change_reason =
       option_of_yojson
         (value_for_key involvement_type_change_reason_of_yojson "InvolvementTypeChangeReason")
         _list path;
     related_entity_ids =
       option_of_yojson
         (value_for_key aws_opportunity_related_entities_of_yojson "RelatedEntityIds")
         _list path;
     customer =
       option_of_yojson (value_for_key aws_opportunity_customer_of_yojson "Customer") _list path;
     project =
       option_of_yojson (value_for_key aws_opportunity_project_of_yojson "Project") _list path;
     cosell_motion =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "CosellMotion")
         _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
   }
    : get_aws_opportunity_summary_response)

let get_aws_opportunity_summary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     related_opportunity_identifier =
       value_for_key opportunity_identifier_of_yojson "RelatedOpportunityIdentifier" _list path;
   }
    : get_aws_opportunity_summary_request)

let get_engagement_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key engagement_identifier_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key engagement_arn_of_yojson "Arn") _list path;
     title = option_of_yojson (value_for_key engagement_title_of_yojson "Title") _list path;
     description =
       option_of_yojson (value_for_key engagement_description_of_yojson "Description") _list path;
     created_at = option_of_yojson (value_for_key date_time_of_yojson "CreatedAt") _list path;
     created_by = option_of_yojson (value_for_key aws_account_of_yojson "CreatedBy") _list path;
     member_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MemberCount")
         _list path;
     modified_at = option_of_yojson (value_for_key date_time_of_yojson "ModifiedAt") _list path;
     modified_by = option_of_yojson (value_for_key aws_account_of_yojson "ModifiedBy") _list path;
     contexts = option_of_yojson (value_for_key engagement_contexts_of_yojson "Contexts") _list path;
   }
    : get_engagement_response)

let get_engagement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     identifier = value_for_key engagement_arn_or_identifier_of_yojson "Identifier" _list path;
   }
    : get_engagement_request)

let rejection_reason_string_of_yojson = string_of_yojson

let get_engagement_invitation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Arn")
         _list path;
     payload_type =
       option_of_yojson
         (value_for_key engagement_invitation_payload_type_of_yojson "PayloadType")
         _list path;
     id = value_for_key engagement_invitation_arn_or_identifier_of_yojson "Id" _list path;
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
     engagement_title =
       option_of_yojson (value_for_key engagement_title_of_yojson "EngagementTitle") _list path;
     status = option_of_yojson (value_for_key invitation_status_of_yojson "Status") _list path;
     invitation_date =
       option_of_yojson (value_for_key date_time_of_yojson "InvitationDate") _list path;
     expiration_date =
       option_of_yojson (value_for_key date_time_of_yojson "ExpirationDate") _list path;
     sender_aws_account_id =
       option_of_yojson (value_for_key aws_account_of_yojson "SenderAwsAccountId") _list path;
     sender_company_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "SenderCompanyName")
         _list path;
     receiver = option_of_yojson (value_for_key receiver_of_yojson "Receiver") _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     rejection_reason =
       option_of_yojson
         (value_for_key rejection_reason_string_of_yojson "RejectionReason")
         _list path;
     payload = option_of_yojson (value_for_key payload_of_yojson "Payload") _list path;
     invitation_message =
       option_of_yojson (value_for_key invitation_message_of_yojson "InvitationMessage") _list path;
     engagement_description =
       option_of_yojson
         (value_for_key engagement_description_of_yojson "EngagementDescription")
         _list path;
     existing_members =
       option_of_yojson
         (value_for_key engagement_member_summaries_of_yojson "ExistingMembers")
         _list path;
   }
    : get_engagement_invitation_response)

let get_engagement_invitation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     identifier =
       value_for_key engagement_invitation_arn_or_identifier_of_yojson "Identifier" _list path;
   }
    : get_engagement_invitation_request)

let related_entity_identifiers_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_marketplace_offers =
       option_of_yojson
         (value_for_key aws_marketplace_offer_identifiers_of_yojson "AwsMarketplaceOffers")
         _list path;
     aws_marketplace_offer_sets =
       option_of_yojson
         (value_for_key aws_marketplace_offer_set_identifiers_of_yojson "AwsMarketplaceOfferSets")
         _list path;
     solutions =
       option_of_yojson (value_for_key solution_identifiers_of_yojson "Solutions") _list path;
     aws_products =
       option_of_yojson (value_for_key aws_product_identifiers_of_yojson "AwsProducts") _list path;
     aws_marketplace_solutions =
       option_of_yojson
         (value_for_key aws_marketplace_solution_identifiers_of_yojson "AwsMarketplaceSolutions")
         _list path;
     aws_marketplace_products =
       option_of_yojson
         (value_for_key aws_marketplace_product_identifiers_of_yojson "AwsMarketplaceProducts")
         _list path;
   }
    : related_entity_identifiers)

let opportunity_arn_of_yojson = string_of_yojson

let get_opportunity_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     primary_needs_from_aws =
       option_of_yojson
         (value_for_key primary_needs_from_aws_of_yojson "PrimaryNeedsFromAws")
         _list path;
     national_security =
       option_of_yojson (value_for_key national_security_of_yojson "NationalSecurity") _list path;
     partner_opportunity_identifier =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "PartnerOpportunityIdentifier")
         _list path;
     customer = option_of_yojson (value_for_key customer_of_yojson "Customer") _list path;
     project = option_of_yojson (value_for_key project_of_yojson "Project") _list path;
     opportunity_type =
       option_of_yojson (value_for_key opportunity_type_of_yojson "OpportunityType") _list path;
     marketing = option_of_yojson (value_for_key marketing_of_yojson "Marketing") _list path;
     software_revenue =
       option_of_yojson (value_for_key software_revenue_of_yojson "SoftwareRevenue") _list path;
     id = value_for_key opportunity_identifier_of_yojson "Id" _list path;
     arn = option_of_yojson (value_for_key opportunity_arn_of_yojson "Arn") _list path;
     last_modified_date = value_for_key date_time_of_yojson "LastModifiedDate" _list path;
     created_date = value_for_key date_time_of_yojson "CreatedDate" _list path;
     related_entity_identifiers =
       value_for_key related_entity_identifiers_of_yojson "RelatedEntityIdentifiers" _list path;
     life_cycle = option_of_yojson (value_for_key life_cycle_of_yojson "LifeCycle") _list path;
     opportunity_team =
       option_of_yojson
         (value_for_key partner_opportunity_team_members_list_of_yojson "OpportunityTeam")
         _list path;
   }
    : get_opportunity_response)

let get_opportunity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     identifier = value_for_key opportunity_identifier_of_yojson "Identifier" _list path;
   }
    : get_opportunity_request)

let prospecting_task_arn_of_yojson = string_of_yojson

let get_prospecting_from_engagement_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_id = value_for_key prospecting_task_identifier_of_yojson "TaskId" _list path;
     task_arn = value_for_key prospecting_task_arn_of_yojson "TaskArn" _list path;
     task_name = value_for_key task_name_of_yojson "TaskName" _list path;
     start_time = value_for_key date_time_of_yojson "StartTime" _list path;
     end_time = option_of_yojson (value_for_key date_time_of_yojson "EndTime") _list path;
     engagements =
       value_for_key engagement_prospecting_result_list_of_yojson "Engagements" _list path;
   }
    : get_prospecting_from_engagement_task_response)

let get_prospecting_from_engagement_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     task_identifier =
       value_for_key prospecting_task_identifier_of_yojson "TaskIdentifier" _list path;
   }
    : get_prospecting_from_engagement_task_request)

let project_view_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_models =
       option_of_yojson (value_for_key delivery_models_of_yojson "DeliveryModels") _list path;
     expected_customer_spend =
       option_of_yojson
         (value_for_key expected_customer_spend_list_of_yojson "ExpectedCustomerSpend")
         _list path;
     expected_contract_duration =
       option_of_yojson
         (value_for_key expected_contract_duration_of_yojson "ExpectedContractDuration")
         _list path;
     customer_use_case =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "CustomerUseCase")
         _list path;
     sales_activities =
       option_of_yojson (value_for_key sales_activities_of_yojson "SalesActivities") _list path;
     other_solution_description =
       option_of_yojson (value_for_key pii_string_of_yojson "OtherSolutionDescription") _list path;
   }
    : project_view)

let life_cycle_for_view_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_close_date =
       option_of_yojson (value_for_key date_of_yojson "TargetCloseDate") _list path;
     review_status =
       option_of_yojson (value_for_key review_status_of_yojson "ReviewStatus") _list path;
     stage = option_of_yojson (value_for_key stage_of_yojson "Stage") _list path;
     next_steps = option_of_yojson (value_for_key pii_string_of_yojson "NextSteps") _list path;
   }
    : life_cycle_for_view)

let opportunity_summary_view_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     opportunity_type =
       option_of_yojson (value_for_key opportunity_type_of_yojson "OpportunityType") _list path;
     lifecycle =
       option_of_yojson (value_for_key life_cycle_for_view_of_yojson "Lifecycle") _list path;
     opportunity_team =
       option_of_yojson
         (value_for_key partner_opportunity_team_members_list_of_yojson "OpportunityTeam")
         _list path;
     primary_needs_from_aws =
       option_of_yojson
         (value_for_key primary_needs_from_aws_of_yojson "PrimaryNeedsFromAws")
         _list path;
     customer = option_of_yojson (value_for_key customer_of_yojson "Customer") _list path;
     project = option_of_yojson (value_for_key project_view_of_yojson "Project") _list path;
     related_entity_identifiers =
       option_of_yojson
         (value_for_key related_entity_identifiers_of_yojson "RelatedEntityIdentifiers")
         _list path;
   }
    : opportunity_summary_view)

let resource_snapshot_payload_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "OpportunitySummary" -> OpportunitySummary (opportunity_summary_view_of_yojson value_ path)
   | "AwsOpportunitySummaryFullView" ->
       AwsOpportunitySummaryFullView (aws_opportunity_summary_full_view_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "ResourceSnapshotPayload" unknown)
    : resource_snapshot_payload)

let get_resource_snapshot_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     arn = option_of_yojson (value_for_key resource_arn_of_yojson "Arn") _list path;
     created_by = option_of_yojson (value_for_key aws_account_of_yojson "CreatedBy") _list path;
     created_at = option_of_yojson (value_for_key date_time_of_yojson "CreatedAt") _list path;
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     resource_id =
       option_of_yojson (value_for_key resource_identifier_of_yojson "ResourceId") _list path;
     resource_snapshot_template_name =
       option_of_yojson
         (value_for_key resource_template_name_of_yojson "ResourceSnapshotTemplateName")
         _list path;
     revision =
       option_of_yojson (value_for_key resource_snapshot_revision_of_yojson "Revision") _list path;
     payload =
       option_of_yojson (value_for_key resource_snapshot_payload_of_yojson "Payload") _list path;
     target_member_accounts =
       option_of_yojson
         (value_for_key aws_account_id_or_alias_list_of_yojson "TargetMemberAccounts")
         _list path;
   }
    : get_resource_snapshot_response)

let get_resource_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     engagement_identifier =
       value_for_key engagement_identifier_of_yojson "EngagementIdentifier" _list path;
     resource_type = value_for_key resource_type_of_yojson "ResourceType" _list path;
     resource_identifier =
       value_for_key resource_identifier_of_yojson "ResourceIdentifier" _list path;
     resource_snapshot_template_identifier =
       value_for_key resource_template_name_of_yojson "ResourceSnapshotTemplateIdentifier" _list
         path;
     revision =
       option_of_yojson (value_for_key resource_snapshot_revision_of_yojson "Revision") _list path;
   }
    : get_resource_snapshot_request)

let resource_snapshot_job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Running" -> RUNNING
    | `String "Stopped" -> STOPPED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResourceSnapshotJobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceSnapshotJobStatus")
     : resource_snapshot_job_status)
    : resource_snapshot_job_status)

let get_resource_snapshot_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     id =
       option_of_yojson (value_for_key resource_snapshot_job_identifier_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key resource_snapshot_job_arn_of_yojson "Arn") _list path;
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     resource_id =
       option_of_yojson (value_for_key resource_identifier_of_yojson "ResourceId") _list path;
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "ResourceArn") _list path;
     resource_snapshot_template_name =
       option_of_yojson
         (value_for_key resource_template_name_of_yojson "ResourceSnapshotTemplateName")
         _list path;
     created_at = option_of_yojson (value_for_key date_time_of_yojson "CreatedAt") _list path;
     status =
       option_of_yojson (value_for_key resource_snapshot_job_status_of_yojson "Status") _list path;
     last_successful_execution_date =
       option_of_yojson (value_for_key date_time_of_yojson "LastSuccessfulExecutionDate") _list path;
     last_failure =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "LastFailure")
         _list path;
   }
    : get_resource_snapshot_job_response)

let get_resource_snapshot_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     resource_snapshot_job_identifier =
       value_for_key resource_snapshot_job_identifier_of_yojson "ResourceSnapshotJobIdentifier"
         _list path;
   }
    : get_resource_snapshot_job_request)

let invitation_status_list_of_yojson tree path =
  list_of_yojson invitation_status_of_yojson tree path

let last_modified_date_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     after_last_modified_date =
       option_of_yojson (value_for_key date_time_of_yojson "AfterLastModifiedDate") _list path;
     before_last_modified_date =
       option_of_yojson (value_for_key date_time_of_yojson "BeforeLastModifiedDate") _list path;
   }
    : last_modified_date)

let life_cycle_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stage = option_of_yojson (value_for_key stage_of_yojson "Stage") _list path;
     closed_lost_reason =
       option_of_yojson (value_for_key closed_lost_reason_of_yojson "ClosedLostReason") _list path;
     next_steps = option_of_yojson (value_for_key pii_string_of_yojson "NextSteps") _list path;
     target_close_date =
       option_of_yojson (value_for_key date_of_yojson "TargetCloseDate") _list path;
     review_status =
       option_of_yojson (value_for_key review_status_of_yojson "ReviewStatus") _list path;
     review_comments =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ReviewComments")
         _list path;
     review_status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ReviewStatusReason")
         _list path;
   }
    : life_cycle_summary)

let reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "InvitationAccessDenied" -> INVITATION_ACCESS_DENIED
    | `String "InvitationValidationFailed" -> INVITATION_VALIDATION_FAILED
    | `String "EngagementAccessDenied" -> ENGAGEMENT_ACCESS_DENIED
    | `String "OpportunityAccessDenied" -> OPPORTUNITY_ACCESS_DENIED
    | `String "ResourceSnapshotJobAccessDenied" -> RESOURCE_SNAPSHOT_JOB_ACCESS_DENIED
    | `String "ResourceSnapshotJobValidationFailed" -> RESOURCE_SNAPSHOT_JOB_VALIDATION_FAILED
    | `String "ResourceSnapshotJobConflict" -> RESOURCE_SNAPSHOT_JOB_CONFLICT
    | `String "EngagementValidationFailed" -> ENGAGEMENT_VALIDATION_FAILED
    | `String "EngagementConflict" -> ENGAGEMENT_CONFLICT
    | `String "OpportunitySubmissionFailed" -> OPPORTUNITY_SUBMISSION_FAILED
    | `String "EngagementInvitationConflict" -> ENGAGEMENT_INVITATION_CONFLICT
    | `String "InternalError" -> INTERNAL_ERROR
    | `String "OpportunityValidationFailed" -> OPPORTUNITY_VALIDATION_FAILED
    | `String "OpportunityConflict" -> OPPORTUNITY_CONFLICT
    | `String "ResourceSnapshotAccessDenied" -> RESOURCE_SNAPSHOT_ACCESS_DENIED
    | `String "ResourceSnapshotValidationFailed" -> RESOURCE_SNAPSHOT_VALIDATION_FAILED
    | `String "ResourceSnapshotConflict" -> RESOURCE_SNAPSHOT_CONFLICT
    | `String "ServiceQuotaExceeded" -> SERVICE_QUOTA_EXCEEDED
    | `String "RequestThrottled" -> REQUEST_THROTTLED
    | `String "ContextNotFound" -> CONTEXT_NOT_FOUND
    | `String "CustomerProjectContextNotPermitted" -> CUSTOMER_PROJECT_CONTEXT_NOT_PERMITTED
    | `String "DisqualifiedLeadNotPermitted" -> DISQUALIFIED_LEAD_NOT_PERMITTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ReasonCode")
     : reason_code)
    : reason_code)

let task_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "COMPLETE" -> COMPLETE
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "TaskStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TaskStatus")
     : task_status)
    : task_status)

let task_identifier_of_yojson = string_of_yojson

let list_engagement_by_accepting_invitation_task_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_id = option_of_yojson (value_for_key task_identifier_of_yojson "TaskId") _list path;
     task_arn = option_of_yojson (value_for_key task_arn_of_yojson "TaskArn") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     task_status = option_of_yojson (value_for_key task_status_of_yojson "TaskStatus") _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     reason_code = option_of_yojson (value_for_key reason_code_of_yojson "ReasonCode") _list path;
     opportunity_id =
       option_of_yojson (value_for_key opportunity_identifier_of_yojson "OpportunityId") _list path;
     resource_snapshot_job_id =
       option_of_yojson
         (value_for_key resource_snapshot_job_identifier_of_yojson "ResourceSnapshotJobId")
         _list path;
     engagement_invitation_id =
       option_of_yojson
         (value_for_key engagement_invitation_identifier_of_yojson "EngagementInvitationId")
         _list path;
   }
    : list_engagement_by_accepting_invitation_task_summary)

let list_engagement_by_accepting_invitation_task_summaries_of_yojson tree path =
  list_of_yojson list_engagement_by_accepting_invitation_task_summary_of_yojson tree path

let list_engagement_by_accepting_invitation_tasks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_summaries =
       option_of_yojson
         (value_for_key list_engagement_by_accepting_invitation_task_summaries_of_yojson
            "TaskSummaries")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_engagement_by_accepting_invitation_tasks_response)

let task_arn_or_identifier_of_yojson = string_of_yojson
let task_identifiers_of_yojson tree path = list_of_yojson task_arn_or_identifier_of_yojson tree path

let opportunity_identifiers_of_yojson tree path =
  list_of_yojson opportunity_identifier_of_yojson tree path

let task_statuses_of_yojson tree path = list_of_yojson task_status_of_yojson tree path

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
     sort_order = value_for_key sort_order_of_yojson "SortOrder" _list path;
     sort_by = value_for_key list_tasks_sort_name_of_yojson "SortBy" _list path;
   }
    : list_tasks_sort_base)

let list_engagement_by_accepting_invitation_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MaxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     sort = option_of_yojson (value_for_key list_tasks_sort_base_of_yojson "Sort") _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     task_status = option_of_yojson (value_for_key task_statuses_of_yojson "TaskStatus") _list path;
     opportunity_identifier =
       option_of_yojson
         (value_for_key opportunity_identifiers_of_yojson "OpportunityIdentifier")
         _list path;
     engagement_invitation_identifier =
       option_of_yojson
         (value_for_key engagement_invitation_identifiers_of_yojson "EngagementInvitationIdentifier")
         _list path;
     task_identifier =
       option_of_yojson (value_for_key task_identifiers_of_yojson "TaskIdentifier") _list path;
   }
    : list_engagement_by_accepting_invitation_tasks_request)

let list_engagement_from_opportunity_task_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_id = option_of_yojson (value_for_key task_identifier_of_yojson "TaskId") _list path;
     task_arn = option_of_yojson (value_for_key task_arn_of_yojson "TaskArn") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     task_status = option_of_yojson (value_for_key task_status_of_yojson "TaskStatus") _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     reason_code = option_of_yojson (value_for_key reason_code_of_yojson "ReasonCode") _list path;
     opportunity_id =
       option_of_yojson (value_for_key opportunity_identifier_of_yojson "OpportunityId") _list path;
     resource_snapshot_job_id =
       option_of_yojson
         (value_for_key resource_snapshot_job_identifier_of_yojson "ResourceSnapshotJobId")
         _list path;
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
     engagement_invitation_id =
       option_of_yojson
         (value_for_key engagement_invitation_identifier_of_yojson "EngagementInvitationId")
         _list path;
   }
    : list_engagement_from_opportunity_task_summary)

let list_engagement_from_opportunity_task_summaries_of_yojson tree path =
  list_of_yojson list_engagement_from_opportunity_task_summary_of_yojson tree path

let list_engagement_from_opportunity_tasks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_summaries =
       option_of_yojson
         (value_for_key list_engagement_from_opportunity_task_summaries_of_yojson "TaskSummaries")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_engagement_from_opportunity_tasks_response)

let list_engagement_from_opportunity_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MaxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     sort = option_of_yojson (value_for_key list_tasks_sort_base_of_yojson "Sort") _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     task_status = option_of_yojson (value_for_key task_statuses_of_yojson "TaskStatus") _list path;
     task_identifier =
       option_of_yojson (value_for_key task_identifiers_of_yojson "TaskIdentifier") _list path;
     opportunity_identifier =
       option_of_yojson
         (value_for_key opportunity_identifiers_of_yojson "OpportunityIdentifier")
         _list path;
     engagement_identifier =
       option_of_yojson
         (value_for_key engagement_identifiers_of_yojson "EngagementIdentifier")
         _list path;
   }
    : list_engagement_from_opportunity_tasks_request)

let list_engagement_invitations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engagement_invitation_summaries =
       option_of_yojson
         (value_for_key engagement_invitation_summaries_of_yojson "EngagementInvitationSummaries")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_engagement_invitations_response)

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
     sort_order = value_for_key sort_order_of_yojson "SortOrder" _list path;
     sort_by =
       value_for_key opportunity_engagement_invitation_sort_name_of_yojson "SortBy" _list path;
   }
    : opportunity_engagement_invitation_sort)

let page_size_of_yojson = int_of_yojson

let list_engagement_invitations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     sort =
       option_of_yojson
         (value_for_key opportunity_engagement_invitation_sort_of_yojson "Sort")
         _list path;
     payload_type =
       option_of_yojson
         (value_for_key engagement_invitations_payload_type_of_yojson "PayloadType")
         _list path;
     participant_type = value_for_key participant_type_of_yojson "ParticipantType" _list path;
     status = option_of_yojson (value_for_key invitation_status_list_of_yojson "Status") _list path;
     engagement_identifier =
       option_of_yojson
         (value_for_key engagement_identifiers_of_yojson "EngagementIdentifier")
         _list path;
     sender_aws_account_id =
       option_of_yojson
         (value_for_key aws_account_id_or_alias_list_of_yojson "SenderAwsAccountId")
         _list path;
   }
    : list_engagement_invitations_request)

let list_engagement_members_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engagement_member_list =
       value_for_key engagement_members_of_yojson "EngagementMemberList" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_engagement_members_response)

let member_page_size_of_yojson = int_of_yojson

let list_engagement_members_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     identifier = value_for_key engagement_arn_or_identifier_of_yojson "Identifier" _list path;
     max_results =
       option_of_yojson (value_for_key member_page_size_of_yojson "MaxResults") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_engagement_members_request)

let list_engagement_resource_associations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engagement_resource_association_summaries =
       value_for_key engagement_resource_association_summary_list_of_yojson
         "EngagementResourceAssociationSummaries" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_engagement_resource_associations_response)

let list_engagement_resource_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     engagement_identifier =
       option_of_yojson
         (value_for_key engagement_identifier_of_yojson "EngagementIdentifier")
         _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     resource_identifier =
       option_of_yojson
         (value_for_key resource_identifier_of_yojson "ResourceIdentifier")
         _list path;
     created_by = option_of_yojson (value_for_key aws_account_of_yojson "CreatedBy") _list path;
   }
    : list_engagement_resource_associations_request)

let list_engagements_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engagement_summary_list =
       value_for_key engagement_summary_list_of_yojson "EngagementSummaryList" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_engagements_response)

let list_engagements_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     created_by = option_of_yojson (value_for_key aws_account_list_of_yojson "CreatedBy") _list path;
     exclude_created_by =
       option_of_yojson (value_for_key aws_account_list_of_yojson "ExcludeCreatedBy") _list path;
     context_types =
       option_of_yojson
         (value_for_key engagement_context_type_list_of_yojson "ContextTypes")
         _list path;
     exclude_context_types =
       option_of_yojson
         (value_for_key engagement_context_type_list_of_yojson "ExcludeContextTypes")
         _list path;
     sort = option_of_yojson (value_for_key engagement_sort_of_yojson "Sort") _list path;
     max_results =
       option_of_yojson (value_for_key engagement_page_size_of_yojson "MaxResults") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     engagement_identifier =
       option_of_yojson
         (value_for_key engagement_identifiers_of_yojson "EngagementIdentifier")
         _list path;
   }
    : list_engagements_request)

let project_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_models =
       option_of_yojson (value_for_key delivery_models_of_yojson "DeliveryModels") _list path;
     expected_customer_spend =
       option_of_yojson
         (value_for_key expected_customer_spend_list_of_yojson "ExpectedCustomerSpend")
         _list path;
     expected_contract_duration =
       option_of_yojson
         (value_for_key expected_contract_duration_of_yojson "ExpectedContractDuration")
         _list path;
   }
    : project_summary)

let opportunity_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     id = option_of_yojson (value_for_key opportunity_identifier_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key opportunity_arn_of_yojson "Arn") _list path;
     partner_opportunity_identifier =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "PartnerOpportunityIdentifier")
         _list path;
     opportunity_type =
       option_of_yojson (value_for_key opportunity_type_of_yojson "OpportunityType") _list path;
     last_modified_date =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedDate") _list path;
     created_date = option_of_yojson (value_for_key date_time_of_yojson "CreatedDate") _list path;
     life_cycle =
       option_of_yojson (value_for_key life_cycle_summary_of_yojson "LifeCycle") _list path;
     customer = option_of_yojson (value_for_key customer_summary_of_yojson "Customer") _list path;
     project = option_of_yojson (value_for_key project_summary_of_yojson "Project") _list path;
   }
    : opportunity_summary)

let opportunity_summaries_of_yojson tree path =
  list_of_yojson opportunity_summary_of_yojson tree path

let list_opportunities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     opportunity_summaries =
       value_for_key opportunity_summaries_of_yojson "OpportunitySummaries" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_opportunities_response)

let target_close_date_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     after_target_close_date =
       option_of_yojson (value_for_key date_of_yojson "AfterTargetCloseDate") _list path;
     before_target_close_date =
       option_of_yojson (value_for_key date_of_yojson "BeforeTargetCloseDate") _list path;
   }
    : target_close_date_filter)

let opportunity_sort_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "LastModifiedDate" -> LAST_MODIFIEDDATE
    | `String "Identifier" -> IDENTIFIER
    | `String "CustomerCompanyName" -> CUSTOMER_COMPANY_NAME
    | `String "CreatedDate" -> CREATED_DATE
    | `String "TargetCloseDate" -> TARGET_CLOSE_DATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpportunitySortName" value)
    | _ -> raise (deserialize_wrong_type_error path "OpportunitySortName")
     : opportunity_sort_name)
    : opportunity_sort_name)

let opportunity_sort_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order = value_for_key sort_order_of_yojson "SortOrder" _list path;
     sort_by = value_for_key opportunity_sort_name_of_yojson "SortBy" _list path;
   }
    : opportunity_sort)

let list_opportunities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     sort = option_of_yojson (value_for_key opportunity_sort_of_yojson "Sort") _list path;
     last_modified_date =
       option_of_yojson (value_for_key last_modified_date_of_yojson "LastModifiedDate") _list path;
     identifier =
       option_of_yojson (value_for_key filter_identifier_of_yojson "Identifier") _list path;
     life_cycle_stage =
       option_of_yojson
         (value_for_key filter_life_cycle_stage_of_yojson "LifeCycleStage")
         _list path;
     life_cycle_review_status =
       option_of_yojson
         (value_for_key filter_life_cycle_review_status_of_yojson "LifeCycleReviewStatus")
         _list path;
     customer_company_name =
       option_of_yojson (value_for_key string_list_of_yojson "CustomerCompanyName") _list path;
     created_date =
       option_of_yojson (value_for_key created_date_filter_of_yojson "CreatedDate") _list path;
     target_close_date =
       option_of_yojson
         (value_for_key target_close_date_filter_of_yojson "TargetCloseDate")
         _list path;
   }
    : list_opportunities_request)

let list_opportunity_from_engagement_task_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_id = option_of_yojson (value_for_key task_identifier_of_yojson "TaskId") _list path;
     task_arn = option_of_yojson (value_for_key task_arn_of_yojson "TaskArn") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     task_status = option_of_yojson (value_for_key task_status_of_yojson "TaskStatus") _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     reason_code = option_of_yojson (value_for_key reason_code_of_yojson "ReasonCode") _list path;
     opportunity_id =
       option_of_yojson (value_for_key opportunity_identifier_of_yojson "OpportunityId") _list path;
     resource_snapshot_job_id =
       option_of_yojson
         (value_for_key resource_snapshot_job_identifier_of_yojson "ResourceSnapshotJobId")
         _list path;
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
     context_id =
       option_of_yojson (value_for_key context_identifier_of_yojson "ContextId") _list path;
   }
    : list_opportunity_from_engagement_task_summary)

let list_opportunity_from_engagement_task_summaries_of_yojson tree path =
  list_of_yojson list_opportunity_from_engagement_task_summary_of_yojson tree path

let list_opportunity_from_engagement_tasks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_summaries =
       option_of_yojson
         (value_for_key list_opportunity_from_engagement_task_summaries_of_yojson "TaskSummaries")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_opportunity_from_engagement_tasks_response)

let list_opportunity_from_engagement_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MaxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     sort = option_of_yojson (value_for_key list_tasks_sort_base_of_yojson "Sort") _list path;
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     task_status = option_of_yojson (value_for_key task_statuses_of_yojson "TaskStatus") _list path;
     task_identifier =
       option_of_yojson (value_for_key task_identifiers_of_yojson "TaskIdentifier") _list path;
     opportunity_identifier =
       option_of_yojson
         (value_for_key opportunity_identifiers_of_yojson "OpportunityIdentifier")
         _list path;
     engagement_identifier =
       option_of_yojson
         (value_for_key engagement_identifiers_of_yojson "EngagementIdentifier")
         _list path;
     context_identifier =
       option_of_yojson (value_for_key context_identifiers_of_yojson "ContextIdentifier") _list path;
   }
    : list_opportunity_from_engagement_tasks_request)

let prospecting_task_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_id = value_for_key prospecting_task_identifier_of_yojson "TaskId" _list path;
     task_arn = value_for_key prospecting_task_arn_of_yojson "TaskArn" _list path;
     task_name = value_for_key task_name_of_yojson "TaskName" _list path;
     start_time = value_for_key date_time_of_yojson "StartTime" _list path;
     end_time = option_of_yojson (value_for_key date_time_of_yojson "EndTime") _list path;
     total_engagement_count =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
         "TotalEngagementCount" _list path;
     completed_engagement_count =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
         "CompletedEngagementCount" _list path;
     failed_engagement_count =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
         "FailedEngagementCount" _list path;
   }
    : prospecting_task_summary)

let prospecting_task_summary_list_of_yojson tree path =
  list_of_yojson prospecting_task_summary_of_yojson tree path

let list_prospecting_from_engagement_tasks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     task_summaries =
       value_for_key prospecting_task_summary_list_of_yojson "TaskSummaries" _list path;
   }
    : list_prospecting_from_engagement_tasks_response)

let prospecting_from_engagement_task_sort_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "StartTime" -> StartTime
    | `String "TaskName" -> TaskName
    | `String "FailedEngagementCount" -> FailedEngagementCount
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ProspectingFromEngagementTaskSortName" value)
    | _ -> raise (deserialize_wrong_type_error path "ProspectingFromEngagementTaskSortName")
     : prospecting_from_engagement_task_sort_name)
    : prospecting_from_engagement_task_sort_name)

let prospecting_from_engagement_task_sort_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order = value_for_key sort_order_of_yojson "SortOrder" _list path;
     sort_by =
       value_for_key prospecting_from_engagement_task_sort_name_of_yojson "SortBy" _list path;
   }
    : prospecting_from_engagement_task_sort)

let task_name_list_of_yojson tree path = list_of_yojson task_name_of_yojson tree path

let task_identifier_list_of_yojson tree path =
  list_of_yojson prospecting_task_identifier_of_yojson tree path

let list_prospecting_from_engagement_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     task_identifier =
       option_of_yojson (value_for_key task_identifier_list_of_yojson "TaskIdentifier") _list path;
     task_name = option_of_yojson (value_for_key task_name_list_of_yojson "TaskName") _list path;
     start_after = option_of_yojson (value_for_key date_time_of_yojson "StartAfter") _list path;
     start_before = option_of_yojson (value_for_key date_time_of_yojson "StartBefore") _list path;
     sort =
       option_of_yojson
         (value_for_key prospecting_from_engagement_task_sort_of_yojson "Sort")
         _list path;
   }
    : list_prospecting_from_engagement_tasks_request)

let resource_snapshot_job_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id =
       option_of_yojson (value_for_key resource_snapshot_job_identifier_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key resource_snapshot_job_arn_of_yojson "Arn") _list path;
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
     status =
       option_of_yojson (value_for_key resource_snapshot_job_status_of_yojson "Status") _list path;
   }
    : resource_snapshot_job_summary)

let resource_snapshot_job_summary_list_of_yojson tree path =
  list_of_yojson resource_snapshot_job_summary_of_yojson tree path

let list_resource_snapshot_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_snapshot_job_summaries =
       value_for_key resource_snapshot_job_summary_list_of_yojson "ResourceSnapshotJobSummaries"
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_resource_snapshot_jobs_response)

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
     sort_by = option_of_yojson (value_for_key sort_by_of_yojson "SortBy") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "SortOrder") _list path;
   }
    : sort_object)

let list_resource_snapshot_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     engagement_identifier =
       option_of_yojson
         (value_for_key engagement_identifier_of_yojson "EngagementIdentifier")
         _list path;
     status =
       option_of_yojson (value_for_key resource_snapshot_job_status_of_yojson "Status") _list path;
     sort = option_of_yojson (value_for_key sort_object_of_yojson "Sort") _list path;
   }
    : list_resource_snapshot_jobs_request)

let resource_snapshot_arn_of_yojson = string_of_yojson

let resource_snapshot_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key resource_snapshot_arn_of_yojson "Arn") _list path;
     revision =
       option_of_yojson (value_for_key resource_snapshot_revision_of_yojson "Revision") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     resource_id =
       option_of_yojson (value_for_key resource_identifier_of_yojson "ResourceId") _list path;
     resource_snapshot_template_name =
       option_of_yojson
         (value_for_key resource_template_name_of_yojson "ResourceSnapshotTemplateName")
         _list path;
     created_by = option_of_yojson (value_for_key aws_account_of_yojson "CreatedBy") _list path;
   }
    : resource_snapshot_summary)

let resource_snapshot_summary_list_of_yojson tree path =
  list_of_yojson resource_snapshot_summary_of_yojson tree path

let list_resource_snapshots_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_snapshot_summaries =
       value_for_key resource_snapshot_summary_list_of_yojson "ResourceSnapshotSummaries" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_resource_snapshots_response)

let list_resource_snapshots_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     engagement_identifier =
       value_for_key engagement_identifier_of_yojson "EngagementIdentifier" _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     resource_identifier =
       option_of_yojson
         (value_for_key resource_identifier_of_yojson "ResourceIdentifier")
         _list path;
     resource_snapshot_template_identifier =
       option_of_yojson
         (value_for_key resource_template_name_of_yojson "ResourceSnapshotTemplateIdentifier")
         _list path;
     created_by = option_of_yojson (value_for_key aws_account_of_yojson "CreatedBy") _list path;
   }
    : list_resource_snapshots_request)

let solution_arn_of_yojson = string_of_yojson

let solution_base_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     id = value_for_key solution_identifier_of_yojson "Id" _list path;
     arn = option_of_yojson (value_for_key solution_arn_of_yojson "Arn") _list path;
     name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Name" _list path;
     status = value_for_key solution_status_of_yojson "Status" _list path;
     category =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Category" _list path;
     created_date = value_for_key date_time_of_yojson "CreatedDate" _list path;
     aws_marketplace_solution_arn =
       option_of_yojson
         (value_for_key aws_marketplace_solution_arn_of_yojson "AwsMarketplaceSolutionArn")
         _list path;
   }
    : solution_base)

let solution_list_of_yojson tree path = list_of_yojson solution_base_of_yojson tree path

let list_solutions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     solution_summaries = value_for_key solution_list_of_yojson "SolutionSummaries" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_solutions_response)

let solution_sort_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Identifier" -> IDENTIFIER
    | `String "Name" -> NAME
    | `String "Status" -> STATUS
    | `String "Category" -> CATEGORY
    | `String "CreatedDate" -> CREATEDDATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SolutionSortName" value)
    | _ -> raise (deserialize_wrong_type_error path "SolutionSortName")
     : solution_sort_name)
    : solution_sort_name)

let solution_sort_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order = value_for_key sort_order_of_yojson "SortOrder" _list path;
     sort_by = value_for_key solution_sort_name_of_yojson "SortBy" _list path;
   }
    : solution_sort)

let list_solutions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     sort = option_of_yojson (value_for_key solution_sort_of_yojson "Sort") _list path;
     status = option_of_yojson (value_for_key filter_status_of_yojson "Status") _list path;
     identifier =
       option_of_yojson (value_for_key solution_identifiers_of_yojson "Identifier") _list path;
     category = option_of_yojson (value_for_key string_list_of_yojson "Category") _list path;
     aws_marketplace_solution_arn =
       option_of_yojson
         (value_for_key aws_marketplace_solution_arn_list_of_yojson "AwsMarketplaceSolutionArn")
         _list path;
   }
    : list_solutions_request)

let reject_engagement_invitation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     identifier =
       value_for_key engagement_invitation_arn_or_identifier_of_yojson "Identifier" _list path;
     rejection_reason =
       option_of_yojson
         (value_for_key rejection_reason_string_of_yojson "RejectionReason")
         _list path;
   }
    : reject_engagement_invitation_request)

let start_engagement_by_accepting_invitation_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_id = option_of_yojson (value_for_key task_identifier_of_yojson "TaskId") _list path;
     task_arn = option_of_yojson (value_for_key task_arn_of_yojson "TaskArn") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     task_status = option_of_yojson (value_for_key task_status_of_yojson "TaskStatus") _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     reason_code = option_of_yojson (value_for_key reason_code_of_yojson "ReasonCode") _list path;
     opportunity_id =
       option_of_yojson (value_for_key opportunity_identifier_of_yojson "OpportunityId") _list path;
     resource_snapshot_job_id =
       option_of_yojson
         (value_for_key resource_snapshot_job_identifier_of_yojson "ResourceSnapshotJobId")
         _list path;
     engagement_invitation_id =
       option_of_yojson
         (value_for_key engagement_invitation_identifier_of_yojson "EngagementInvitationId")
         _list path;
   }
    : start_engagement_by_accepting_invitation_task_response)

let start_engagement_by_accepting_invitation_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     identifier =
       value_for_key engagement_invitation_arn_or_identifier_of_yojson "Identifier" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : start_engagement_by_accepting_invitation_task_request)

let start_engagement_from_opportunity_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_id = option_of_yojson (value_for_key task_identifier_of_yojson "TaskId") _list path;
     task_arn = option_of_yojson (value_for_key task_arn_of_yojson "TaskArn") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     task_status = option_of_yojson (value_for_key task_status_of_yojson "TaskStatus") _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     reason_code = option_of_yojson (value_for_key reason_code_of_yojson "ReasonCode") _list path;
     opportunity_id =
       option_of_yojson (value_for_key opportunity_identifier_of_yojson "OpportunityId") _list path;
     resource_snapshot_job_id =
       option_of_yojson
         (value_for_key resource_snapshot_job_identifier_of_yojson "ResourceSnapshotJobId")
         _list path;
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
     engagement_invitation_id =
       option_of_yojson
         (value_for_key engagement_invitation_identifier_of_yojson "EngagementInvitationId")
         _list path;
   }
    : start_engagement_from_opportunity_task_response)

let start_engagement_from_opportunity_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     identifier = value_for_key opportunity_identifier_of_yojson "Identifier" _list path;
     aws_submission = value_for_key aws_submission_of_yojson "AwsSubmission" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : start_engagement_from_opportunity_task_request)

let start_opportunity_from_engagement_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_id = option_of_yojson (value_for_key task_identifier_of_yojson "TaskId") _list path;
     task_arn = option_of_yojson (value_for_key task_arn_of_yojson "TaskArn") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     task_status = option_of_yojson (value_for_key task_status_of_yojson "TaskStatus") _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     reason_code = option_of_yojson (value_for_key reason_code_of_yojson "ReasonCode") _list path;
     opportunity_id =
       option_of_yojson (value_for_key opportunity_identifier_of_yojson "OpportunityId") _list path;
     resource_snapshot_job_id =
       option_of_yojson
         (value_for_key resource_snapshot_job_identifier_of_yojson "ResourceSnapshotJobId")
         _list path;
     engagement_id =
       option_of_yojson (value_for_key engagement_identifier_of_yojson "EngagementId") _list path;
     context_id =
       option_of_yojson (value_for_key context_identifier_of_yojson "ContextId") _list path;
   }
    : start_opportunity_from_engagement_task_response)

let start_opportunity_from_engagement_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     identifier = value_for_key engagement_arn_or_identifier_of_yojson "Identifier" _list path;
     context_identifier = value_for_key context_identifier_of_yojson "ContextIdentifier" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : start_opportunity_from_engagement_task_request)

let start_prospecting_from_engagement_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identifiers = value_for_key engagement_identifier_list_of_yojson "Identifiers" _list path;
     task_name = value_for_key task_name_of_yojson "TaskName" _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     reason_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ReasonCode")
         _list path;
     start_time = value_for_key date_time_of_yojson "StartTime" _list path;
     task_id =
       option_of_yojson (value_for_key prospecting_task_identifier_of_yojson "TaskId") _list path;
     task_arn = option_of_yojson (value_for_key prospecting_task_arn_of_yojson "TaskArn") _list path;
     task_status = value_for_key prospecting_task_status_of_yojson "TaskStatus" _list path;
   }
    : start_prospecting_from_engagement_task_response)

let start_prospecting_from_engagement_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     identifiers = value_for_key engagement_identifier_list_of_yojson "Identifiers" _list path;
     task_name = value_for_key task_name_of_yojson "TaskName" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
   }
    : start_prospecting_from_engagement_task_request)

let start_resource_snapshot_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     resource_snapshot_job_identifier =
       value_for_key resource_snapshot_job_identifier_of_yojson "ResourceSnapshotJobIdentifier"
         _list path;
   }
    : start_resource_snapshot_job_request)

let stop_resource_snapshot_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     resource_snapshot_job_identifier =
       value_for_key resource_snapshot_job_identifier_of_yojson "ResourceSnapshotJobIdentifier"
         _list path;
   }
    : stop_resource_snapshot_job_request)

let submit_opportunity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     identifier = value_for_key opportunity_identifier_of_yojson "Identifier" _list path;
     involvement_type = value_for_key sales_involvement_type_of_yojson "InvolvementType" _list path;
     visibility = option_of_yojson (value_for_key visibility_of_yojson "Visibility") _list path;
   }
    : submit_opportunity_request)

let update_opportunity_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key opportunity_identifier_of_yojson "Id" _list path;
     last_modified_date = value_for_key date_time_of_yojson "LastModifiedDate" _list path;
   }
    : update_opportunity_response)

let update_opportunity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_identifier_of_yojson "Catalog" _list path;
     primary_needs_from_aws =
       option_of_yojson
         (value_for_key primary_needs_from_aws_of_yojson "PrimaryNeedsFromAws")
         _list path;
     national_security =
       option_of_yojson (value_for_key national_security_of_yojson "NationalSecurity") _list path;
     partner_opportunity_identifier =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "PartnerOpportunityIdentifier")
         _list path;
     customer = option_of_yojson (value_for_key customer_of_yojson "Customer") _list path;
     project = option_of_yojson (value_for_key project_of_yojson "Project") _list path;
     opportunity_type =
       option_of_yojson (value_for_key opportunity_type_of_yojson "OpportunityType") _list path;
     marketing = option_of_yojson (value_for_key marketing_of_yojson "Marketing") _list path;
     software_revenue =
       option_of_yojson (value_for_key software_revenue_of_yojson "SoftwareRevenue") _list path;
     last_modified_date = value_for_key date_time_of_yojson "LastModifiedDate" _list path;
     identifier = value_for_key opportunity_identifier_of_yojson "Identifier" _list path;
     life_cycle = option_of_yojson (value_for_key life_cycle_of_yojson "LifeCycle") _list path;
   }
    : update_opportunity_request)
