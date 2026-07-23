open Smaws_Lib.Json.SerializeHelpers
open Types

let validation_exception_error_code_to_yojson (x : validation_exception_error_code) =
  match x with
  | REQUIRED_FIELD_MISSING -> `String "REQUIRED_FIELD_MISSING"
  | INVALID_ENUM_VALUE -> `String "INVALID_ENUM_VALUE"
  | INVALID_STRING_FORMAT -> `String "INVALID_STRING_FORMAT"
  | INVALID_VALUE -> `String "INVALID_VALUE"
  | NOT_ENOUGH_VALUES -> `String "NOT_ENOUGH_VALUES"
  | TOO_MANY_VALUES -> `String "TOO_MANY_VALUES"
  | INVALID_RESOURCE_STATE -> `String "INVALID_RESOURCE_STATE"
  | DUPLICATE_KEY_VALUE -> `String "DUPLICATE_KEY_VALUE"
  | VALUE_OUT_OF_RANGE -> `String "VALUE_OUT_OF_RANGE"
  | ACTION_NOT_PERMITTED -> `String "ACTION_NOT_PERMITTED"

let validation_exception_error_to_yojson (x : validation_exception_error) =
  assoc_to_yojson
    [
      ( "FieldName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.field_name );
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("Code", Some (validation_exception_error_code_to_yojson x.code));
    ]

let validation_exception_error_list_to_yojson tree =
  list_to_yojson validation_exception_error_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | REQUEST_VALIDATION_FAILED -> `String "REQUEST_VALIDATION_FAILED"
  | BUSINESS_VALIDATION_FAILED -> `String "BUSINESS_VALIDATION_FAILED"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("Reason", Some (validation_exception_reason_to_yojson x.reason));
      ("ErrorList", option_to_yojson validation_exception_error_list_to_yojson x.error_list);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let access_denied_exception_error_code_to_yojson (x : access_denied_exception_error_code) =
  match x with
  | INCOMPATIBLE_BENEFIT_AWS_PARTNER_STATE -> `String "INCOMPATIBLE_BENEFIT_AWS_PARTNER_STATE"

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("Reason", option_to_yojson access_denied_exception_error_code_to_yojson x.reason);
    ]

let engagement_context_identifier_to_yojson = string_to_yojson
let date_time_to_yojson = timestamp_iso_8601_to_yojson
let engagement_arn_to_yojson = string_to_yojson
let engagement_identifier_to_yojson = string_to_yojson

let update_engagement_context_response_to_yojson (x : update_engagement_context_response) =
  assoc_to_yojson
    [
      ("EngagementId", Some (engagement_identifier_to_yojson x.engagement_id));
      ("EngagementArn", Some (engagement_arn_to_yojson x.engagement_arn));
      ("EngagementLastModifiedAt", Some (date_time_to_yojson x.engagement_last_modified_at));
      ("ContextId", Some (engagement_context_identifier_to_yojson x.context_id));
    ]

let engagement_score_level_to_yojson = string_to_yojson

let prospecting_insights_to_yojson (x : prospecting_insights) =
  assoc_to_yojson
    [
      ( "MarketplaceEngagementScore",
        option_to_yojson engagement_score_level_to_yojson x.marketplace_engagement_score );
      ( "SolutionScore",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.solution_score );
      ( "SolutionCategory",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.solution_category
      );
      ( "SolutionSubCategory",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.solution_sub_category );
    ]

let prospecting_public_profile_summary_to_yojson = string_to_yojson

let eligible_programs_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let prospecting_company_size_to_yojson = string_to_yojson
let prospecting_segment_to_yojson = string_to_yojson
let prospecting_sub_industry_to_yojson = string_to_yojson

let industry_to_yojson (x : industry) =
  match x with
  | AEROSPACE_SATELLITE -> `String "Aerospace"
  | AGRICULTURE -> `String "Agriculture"
  | AUTOMOTIVE -> `String "Automotive"
  | COMPUTERS_ELECTRONICS -> `String "Computers and Electronics"
  | CONSUMER_GOODS -> `String "Consumer Goods"
  | EDUCATION -> `String "Education"
  | ENERGY_OIL_GAS -> `String "Energy - Oil and Gas"
  | ENERGY_POWER_UTILITIES -> `String "Energy - Power and Utilities"
  | FINANCIAL_SERVICES -> `String "Financial Services"
  | GAMING -> `String "Gaming"
  | GOVERNMENT -> `String "Government"
  | HEALTHCARE -> `String "Healthcare"
  | HOSPITALITY -> `String "Hospitality"
  | LIFE_SCIENCES -> `String "Life Sciences"
  | MANUFACTURING -> `String "Manufacturing"
  | MARKETING_ADVERTISING -> `String "Marketing and Advertising"
  | MEDIA_ENTERTAINMENT -> `String "Media and Entertainment"
  | MINING -> `String "Mining"
  | NON_PROFIT_ORGANIZATION -> `String "Non-Profit Organization"
  | PROFESSIONAL_SERVICES -> `String "Professional Services"
  | REALESTATE_CONSTRUCTION -> `String "Real Estate and Construction"
  | RETAIL -> `String "Retail"
  | SOFTWARE_INTERNET -> `String "Software and Internet"
  | TELECOMMUNICATIONS -> `String "Telecommunications"
  | TRANSPORTATION_LOGISTICS -> `String "Transportation and Logistics"
  | TRAVEL -> `String "Travel"
  | WHOLESALE_DISTRIBUTION -> `String "Wholesale and Distribution"
  | OTHER -> `String "Other"

let country_code_to_yojson (x : country_code) =
  match x with
  | US -> `String "US"
  | AF -> `String "AF"
  | AX -> `String "AX"
  | AL -> `String "AL"
  | DZ -> `String "DZ"
  | AS -> `String "AS"
  | AD -> `String "AD"
  | AO -> `String "AO"
  | AI -> `String "AI"
  | AQ -> `String "AQ"
  | AG -> `String "AG"
  | AR -> `String "AR"
  | AM -> `String "AM"
  | AW -> `String "AW"
  | AU -> `String "AU"
  | AT -> `String "AT"
  | AZ -> `String "AZ"
  | BS -> `String "BS"
  | BH -> `String "BH"
  | BD -> `String "BD"
  | BB -> `String "BB"
  | BY -> `String "BY"
  | BE -> `String "BE"
  | BZ -> `String "BZ"
  | BJ -> `String "BJ"
  | BM -> `String "BM"
  | BT -> `String "BT"
  | BO -> `String "BO"
  | BQ -> `String "BQ"
  | BA -> `String "BA"
  | BW -> `String "BW"
  | BV -> `String "BV"
  | BR -> `String "BR"
  | IO -> `String "IO"
  | BN -> `String "BN"
  | BG -> `String "BG"
  | BF -> `String "BF"
  | BI -> `String "BI"
  | KH -> `String "KH"
  | CM -> `String "CM"
  | CA -> `String "CA"
  | CV -> `String "CV"
  | KY -> `String "KY"
  | CF -> `String "CF"
  | TD -> `String "TD"
  | CL -> `String "CL"
  | CN -> `String "CN"
  | CX -> `String "CX"
  | CC -> `String "CC"
  | CO -> `String "CO"
  | KM -> `String "KM"
  | CG -> `String "CG"
  | CK -> `String "CK"
  | CR -> `String "CR"
  | CI -> `String "CI"
  | HR -> `String "HR"
  | CU -> `String "CU"
  | CW -> `String "CW"
  | CY -> `String "CY"
  | CZ -> `String "CZ"
  | CD -> `String "CD"
  | DK -> `String "DK"
  | DJ -> `String "DJ"
  | DM -> `String "DM"
  | DO -> `String "DO"
  | EC -> `String "EC"
  | EG -> `String "EG"
  | SV -> `String "SV"
  | GQ -> `String "GQ"
  | ER -> `String "ER"
  | EE -> `String "EE"
  | ET -> `String "ET"
  | FK -> `String "FK"
  | FO -> `String "FO"
  | FJ -> `String "FJ"
  | FI -> `String "FI"
  | FR -> `String "FR"
  | GF -> `String "GF"
  | PF -> `String "PF"
  | TF -> `String "TF"
  | GA -> `String "GA"
  | GM -> `String "GM"
  | GE -> `String "GE"
  | DE -> `String "DE"
  | GH -> `String "GH"
  | GI -> `String "GI"
  | GR -> `String "GR"
  | GL -> `String "GL"
  | GD -> `String "GD"
  | GP -> `String "GP"
  | GU -> `String "GU"
  | GT -> `String "GT"
  | GG -> `String "GG"
  | GN -> `String "GN"
  | GW -> `String "GW"
  | GY -> `String "GY"
  | HT -> `String "HT"
  | HM -> `String "HM"
  | VA -> `String "VA"
  | HN -> `String "HN"
  | HK -> `String "HK"
  | HU -> `String "HU"
  | IS -> `String "IS"
  | IN -> `String "IN"
  | ID -> `String "ID"
  | IR -> `String "IR"
  | IQ -> `String "IQ"
  | IE -> `String "IE"
  | IM -> `String "IM"
  | IL -> `String "IL"
  | IT -> `String "IT"
  | JM -> `String "JM"
  | JP -> `String "JP"
  | JE -> `String "JE"
  | JO -> `String "JO"
  | KZ -> `String "KZ"
  | KE -> `String "KE"
  | KI -> `String "KI"
  | KR -> `String "KR"
  | KW -> `String "KW"
  | KG -> `String "KG"
  | LA -> `String "LA"
  | LV -> `String "LV"
  | LB -> `String "LB"
  | LS -> `String "LS"
  | LR -> `String "LR"
  | LY -> `String "LY"
  | LI -> `String "LI"
  | LT -> `String "LT"
  | LU -> `String "LU"
  | MO -> `String "MO"
  | MK -> `String "MK"
  | MG -> `String "MG"
  | MW -> `String "MW"
  | MY -> `String "MY"
  | MV -> `String "MV"
  | ML -> `String "ML"
  | MT -> `String "MT"
  | MH -> `String "MH"
  | MQ -> `String "MQ"
  | MR -> `String "MR"
  | MU -> `String "MU"
  | YT -> `String "YT"
  | MX -> `String "MX"
  | FM -> `String "FM"
  | MD -> `String "MD"
  | MC -> `String "MC"
  | MN -> `String "MN"
  | ME -> `String "ME"
  | MS -> `String "MS"
  | MA -> `String "MA"
  | MZ -> `String "MZ"
  | MM -> `String "MM"
  | NA -> `String "NA"
  | NR -> `String "NR"
  | NP -> `String "NP"
  | NL -> `String "NL"
  | AN -> `String "AN"
  | NC -> `String "NC"
  | NZ -> `String "NZ"
  | NI -> `String "NI"
  | NE -> `String "NE"
  | NG -> `String "NG"
  | NU -> `String "NU"
  | NF -> `String "NF"
  | MP -> `String "MP"
  | NO -> `String "NO"
  | OM -> `String "OM"
  | PK -> `String "PK"
  | PW -> `String "PW"
  | PS -> `String "PS"
  | PA -> `String "PA"
  | PG -> `String "PG"
  | PY -> `String "PY"
  | PE -> `String "PE"
  | PH -> `String "PH"
  | PN -> `String "PN"
  | PL -> `String "PL"
  | PT -> `String "PT"
  | PR -> `String "PR"
  | QA -> `String "QA"
  | RE -> `String "RE"
  | RO -> `String "RO"
  | RU -> `String "RU"
  | RW -> `String "RW"
  | BL -> `String "BL"
  | SH -> `String "SH"
  | KN -> `String "KN"
  | LC -> `String "LC"
  | MF -> `String "MF"
  | PM -> `String "PM"
  | VC -> `String "VC"
  | WS -> `String "WS"
  | SM -> `String "SM"
  | ST -> `String "ST"
  | SA -> `String "SA"
  | SN -> `String "SN"
  | RS -> `String "RS"
  | SC -> `String "SC"
  | SL -> `String "SL"
  | SG -> `String "SG"
  | SX -> `String "SX"
  | SK -> `String "SK"
  | SI -> `String "SI"
  | SB -> `String "SB"
  | SO -> `String "SO"
  | ZA -> `String "ZA"
  | GS -> `String "GS"
  | SS -> `String "SS"
  | ES -> `String "ES"
  | LK -> `String "LK"
  | SD -> `String "SD"
  | SR -> `String "SR"
  | SJ -> `String "SJ"
  | SZ -> `String "SZ"
  | SE -> `String "SE"
  | CH -> `String "CH"
  | SY -> `String "SY"
  | TW -> `String "TW"
  | TJ -> `String "TJ"
  | TZ -> `String "TZ"
  | TH -> `String "TH"
  | TL -> `String "TL"
  | TG -> `String "TG"
  | TK -> `String "TK"
  | TO -> `String "TO"
  | TT -> `String "TT"
  | TN -> `String "TN"
  | TR -> `String "TR"
  | TM -> `String "TM"
  | TC -> `String "TC"
  | TV -> `String "TV"
  | UG -> `String "UG"
  | UA -> `String "UA"
  | AE -> `String "AE"
  | GB -> `String "GB"
  | UM -> `String "UM"
  | UY -> `String "UY"
  | UZ -> `String "UZ"
  | VU -> `String "VU"
  | VE -> `String "VE"
  | VN -> `String "VN"
  | VG -> `String "VG"
  | VI -> `String "VI"
  | WF -> `String "WF"
  | EH -> `String "EH"
  | YE -> `String "YE"
  | ZM -> `String "ZM"
  | ZW -> `String "ZW"

let prospecting_sub_region_to_yojson = string_to_yojson
let prospecting_region_to_yojson = string_to_yojson
let prospecting_geo_to_yojson = string_to_yojson
let prospecting_account_name_to_yojson = string_to_yojson

let prospecting_result_customer_to_yojson (x : prospecting_result_customer) =
  assoc_to_yojson
    [
      ("AccountName", option_to_yojson prospecting_account_name_to_yojson x.account_name);
      ("Geo", option_to_yojson prospecting_geo_to_yojson x.geo);
      ("Region", option_to_yojson prospecting_region_to_yojson x.region);
      ("SubRegion", option_to_yojson prospecting_sub_region_to_yojson x.sub_region);
      ("Country", option_to_yojson country_code_to_yojson x.country);
      ("Industry", option_to_yojson industry_to_yojson x.industry);
      ("SubIndustry", option_to_yojson prospecting_sub_industry_to_yojson x.sub_industry);
      ("Segment", option_to_yojson prospecting_segment_to_yojson x.segment);
      ("CompanySize", option_to_yojson prospecting_company_size_to_yojson x.company_size);
      ("EligiblePrograms", option_to_yojson eligible_programs_list_to_yojson x.eligible_programs);
      ( "PublicProfileSummary",
        option_to_yojson prospecting_public_profile_summary_to_yojson x.public_profile_summary );
    ]

let task_name_to_yojson = string_to_yojson
let task_arn_to_yojson = string_to_yojson
let prospecting_task_identifier_to_yojson = string_to_yojson

let prospecting_result_aws_to_yojson (x : prospecting_result_aws) =
  assoc_to_yojson
    [
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
      ("TaskId", option_to_yojson prospecting_task_identifier_to_yojson x.task_id);
      ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn);
      ("TaskName", option_to_yojson task_name_to_yojson x.task_name);
      ("Customer", option_to_yojson prospecting_result_customer_to_yojson x.customer);
      ("Insights", option_to_yojson prospecting_insights_to_yojson x.insights);
    ]

let prospecting_result_to_yojson (x : prospecting_result) =
  assoc_to_yojson [ ("Aws", option_to_yojson prospecting_result_aws_to_yojson x.aws) ]

let engagement_customer_business_problem_to_yojson = string_to_yojson
let engagement_customer_project_title_to_yojson = string_to_yojson

let engagement_customer_project_details_to_yojson (x : engagement_customer_project_details) =
  assoc_to_yojson
    [
      ("Title", Some (engagement_customer_project_title_to_yojson x.title));
      ("BusinessProblem", Some (engagement_customer_business_problem_to_yojson x.business_problem));
      ( "TargetCompletionDate",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.target_completion_date) );
    ]

let company_website_url_to_yojson = string_to_yojson
let company_name_to_yojson = string_to_yojson

let engagement_customer_to_yojson (x : engagement_customer) =
  assoc_to_yojson
    [
      ("Industry", Some (industry_to_yojson x.industry));
      ("CompanyName", Some (company_name_to_yojson x.company_name));
      ("WebsiteUrl", Some (company_website_url_to_yojson x.website_url));
      ("CountryCode", Some (country_code_to_yojson x.country_code));
    ]

let customer_projects_context_to_yojson (x : customer_projects_context) =
  assoc_to_yojson
    [
      ("Customer", option_to_yojson engagement_customer_to_yojson x.customer);
      ("Project", option_to_yojson engagement_customer_project_details_to_yojson x.project);
    ]

let lead_insights_to_yojson (x : lead_insights) =
  assoc_to_yojson
    [
      ( "LeadReadinessScore",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.lead_readiness_score );
    ]

let phone_number_to_yojson = string_to_yojson
let name_to_yojson = string_to_yojson
let email_to_yojson = string_to_yojson
let job_title_to_yojson = string_to_yojson

let lead_contact_to_yojson (x : lead_contact) =
  assoc_to_yojson
    [
      ("BusinessTitle", Some (job_title_to_yojson x.business_title));
      ("Email", Some (email_to_yojson x.email));
      ("FirstName", Some (name_to_yojson x.first_name));
      ("LastName", Some (name_to_yojson x.last_name));
      ("Phone", option_to_yojson phone_number_to_yojson x.phone);
    ]

let customer_action_to_yojson = string_to_yojson
let engagement_use_case_to_yojson = string_to_yojson
let lead_source_name_to_yojson = string_to_yojson
let lead_source_id_to_yojson = string_to_yojson
let lead_source_type_to_yojson = string_to_yojson

let lead_interaction_to_yojson (x : lead_interaction) =
  assoc_to_yojson
    [
      ("SourceType", Some (lead_source_type_to_yojson x.source_type));
      ("SourceId", Some (lead_source_id_to_yojson x.source_id));
      ("SourceName", Some (lead_source_name_to_yojson x.source_name));
      ("Usecase", option_to_yojson engagement_use_case_to_yojson x.usecase);
      ("InteractionDate", option_to_yojson date_time_to_yojson x.interaction_date);
      ("CustomerAction", Some (customer_action_to_yojson x.customer_action));
      ( "BusinessProblem",
        option_to_yojson engagement_customer_business_problem_to_yojson x.business_problem );
      ("Contact", Some (lead_contact_to_yojson x.contact));
    ]

let market_segment_to_yojson (x : market_segment) =
  match x with
  | ENTERPRISE -> `String "Enterprise"
  | LARGE -> `String "Large"
  | MEDIUM -> `String "Medium"
  | SMALL -> `String "Small"
  | MICRO -> `String "Micro"

let aws_maturity_to_yojson = string_to_yojson
let address_part_to_yojson = string_to_yojson

let address_summary_to_yojson (x : address_summary) =
  assoc_to_yojson
    [
      ("City", option_to_yojson address_part_to_yojson x.city);
      ("PostalCode", option_to_yojson address_part_to_yojson x.postal_code);
      ("StateOrRegion", option_to_yojson address_part_to_yojson x.state_or_region);
      ("CountryCode", option_to_yojson country_code_to_yojson x.country_code);
    ]

let lead_customer_to_yojson (x : lead_customer) =
  assoc_to_yojson
    [
      ("Industry", option_to_yojson industry_to_yojson x.industry);
      ("CompanyName", Some (company_name_to_yojson x.company_name));
      ("WebsiteUrl", option_to_yojson company_website_url_to_yojson x.website_url);
      ("Address", Some (address_summary_to_yojson x.address));
      ("AwsMaturity", option_to_yojson aws_maturity_to_yojson x.aws_maturity);
      ("MarketSegment", option_to_yojson market_segment_to_yojson x.market_segment);
    ]

let lead_qualification_status_to_yojson = string_to_yojson

let update_lead_context_to_yojson (x : update_lead_context) =
  assoc_to_yojson
    [
      ( "QualificationStatus",
        option_to_yojson lead_qualification_status_to_yojson x.qualification_status );
      ("Customer", Some (lead_customer_to_yojson x.customer));
      ("Interaction", option_to_yojson lead_interaction_to_yojson x.interaction);
      ("Insights", option_to_yojson lead_insights_to_yojson x.insights);
    ]

let update_engagement_context_payload_to_yojson (x : update_engagement_context_payload) =
  match x with
  | Lead arg -> assoc_to_yojson [ ("Lead", Some (update_lead_context_to_yojson arg)) ]
  | CustomerProject arg ->
      assoc_to_yojson [ ("CustomerProject", Some (customer_projects_context_to_yojson arg)) ]
  | ProspectingResult arg ->
      assoc_to_yojson [ ("ProspectingResult", Some (prospecting_result_to_yojson arg)) ]

let engagement_context_type_to_yojson (x : engagement_context_type) =
  match x with
  | CUSTOMER_PROJECT -> `String "CustomerProject"
  | LEAD -> `String "Lead"
  | PROSPECTING_RESULT -> `String "ProspectingResult"

let engagement_arn_or_identifier_to_yojson = string_to_yojson
let catalog_identifier_to_yojson = string_to_yojson

let update_engagement_context_request_to_yojson (x : update_engagement_context_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("EngagementIdentifier", Some (engagement_arn_or_identifier_to_yojson x.engagement_identifier));
      ("ContextIdentifier", Some (engagement_context_identifier_to_yojson x.context_identifier));
      ("EngagementLastModifiedAt", Some (date_time_to_yojson x.engagement_last_modified_at));
      ("Type", Some (engagement_context_type_to_yojson x.type_));
      ("Payload", Some (update_engagement_context_payload_to_yojson x.payload));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let taggable_resource_arn_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let resource_snapshot_job_role_arn_to_yojson = string_to_yojson

let put_selling_system_settings_response_to_yojson (x : put_selling_system_settings_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ( "ResourceSnapshotJobRoleArn",
        option_to_yojson resource_snapshot_job_role_arn_to_yojson x.resource_snapshot_job_role_arn
      );
    ]

let resource_snapshot_job_role_identifier_to_yojson = string_to_yojson

let put_selling_system_settings_request_to_yojson (x : put_selling_system_settings_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ( "ResourceSnapshotJobRoleIdentifier",
        option_to_yojson resource_snapshot_job_role_identifier_to_yojson
          x.resource_snapshot_job_role_identifier );
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", Some (tag_list_to_yojson x.tags)) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn)) ]

let get_selling_system_settings_response_to_yojson (x : get_selling_system_settings_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ( "ResourceSnapshotJobRoleArn",
        option_to_yojson resource_snapshot_job_role_arn_to_yojson x.resource_snapshot_job_role_arn
      );
    ]

let get_selling_system_settings_request_to_yojson (x : get_selling_system_settings_request) =
  assoc_to_yojson [ ("Catalog", Some (catalog_identifier_to_yojson x.catalog)) ]

let create_engagement_context_response_to_yojson (x : create_engagement_context_response) =
  assoc_to_yojson
    [
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
      ("EngagementArn", option_to_yojson engagement_arn_to_yojson x.engagement_arn);
      ( "EngagementLastModifiedAt",
        option_to_yojson date_time_to_yojson x.engagement_last_modified_at );
      ("ContextId", option_to_yojson engagement_context_identifier_to_yojson x.context_id);
    ]

let lead_interaction_list_to_yojson tree = list_to_yojson lead_interaction_to_yojson tree

let lead_context_to_yojson (x : lead_context) =
  assoc_to_yojson
    [
      ("Insights", option_to_yojson lead_insights_to_yojson x.insights);
      ( "QualificationStatus",
        option_to_yojson lead_qualification_status_to_yojson x.qualification_status );
      ("Customer", Some (lead_customer_to_yojson x.customer));
      ("Interactions", Some (lead_interaction_list_to_yojson x.interactions));
    ]

let engagement_context_payload_to_yojson (x : engagement_context_payload) =
  match x with
  | CustomerProject arg ->
      assoc_to_yojson [ ("CustomerProject", Some (customer_projects_context_to_yojson arg)) ]
  | Lead arg -> assoc_to_yojson [ ("Lead", Some (lead_context_to_yojson arg)) ]
  | ProspectingResult arg ->
      assoc_to_yojson [ ("ProspectingResult", Some (prospecting_result_to_yojson arg)) ]

let client_token_to_yojson = string_to_yojson

let create_engagement_context_request_to_yojson (x : create_engagement_context_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("EngagementIdentifier", Some (engagement_arn_or_identifier_to_yojson x.engagement_identifier));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Type", Some (engagement_context_type_to_yojson x.type_));
      ("Payload", Some (engagement_context_payload_to_yojson x.payload));
    ]

let engagement_invitation_arn_or_identifier_to_yojson = string_to_yojson

let accept_engagement_invitation_request_to_yojson (x : accept_engagement_invitation_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("Identifier", Some (engagement_invitation_arn_or_identifier_to_yojson x.identifier));
    ]

let duns_number_to_yojson = string_to_yojson

let address_to_yojson (x : address) =
  assoc_to_yojson
    [
      ("City", option_to_yojson address_part_to_yojson x.city);
      ("PostalCode", option_to_yojson address_part_to_yojson x.postal_code);
      ("StateOrRegion", option_to_yojson address_part_to_yojson x.state_or_region);
      ("CountryCode", option_to_yojson country_code_to_yojson x.country_code);
      ("StreetAddress", option_to_yojson address_part_to_yojson x.street_address);
    ]

let aws_account_to_yojson = string_to_yojson
let website_url_to_yojson = string_to_yojson

let account_to_yojson (x : account) =
  assoc_to_yojson
    [
      ("Industry", option_to_yojson industry_to_yojson x.industry);
      ( "OtherIndustry",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.other_industry );
      ("CompanyName", Some (name_to_yojson x.company_name));
      ("WebsiteUrl", option_to_yojson website_url_to_yojson x.website_url);
      ("AwsAccountId", option_to_yojson aws_account_to_yojson x.aws_account_id);
      ("Address", option_to_yojson address_to_yojson x.address);
      ("Duns", option_to_yojson duns_number_to_yojson x.duns);
    ]

let alias_to_yojson = string_to_yojson

let account_receiver_to_yojson (x : account_receiver) =
  assoc_to_yojson
    [
      ("Alias", option_to_yojson alias_to_yojson x.alias);
      ("AwsAccountId", Some (aws_account_to_yojson x.aws_account_id));
    ]

let account_summary_to_yojson (x : account_summary) =
  assoc_to_yojson
    [
      ("Industry", option_to_yojson industry_to_yojson x.industry);
      ( "OtherIndustry",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.other_industry );
      ("CompanyName", Some (name_to_yojson x.company_name));
      ("WebsiteUrl", option_to_yojson website_url_to_yojson x.website_url);
      ("Address", option_to_yojson address_summary_to_yojson x.address);
    ]

let amount_to_yojson = string_to_yojson
let monetary_amount_to_yojson = string_to_yojson

let amount_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson monetary_amount_to_yojson
    tree

let apn_programs_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let assignee_contact_to_yojson (x : assignee_contact) =
  assoc_to_yojson
    [
      ("Email", Some (email_to_yojson x.email));
      ("FirstName", Some (name_to_yojson x.first_name));
      ("LastName", Some (name_to_yojson x.last_name));
      ("Phone", option_to_yojson phone_number_to_yojson x.phone);
      ("BusinessTitle", Some (job_title_to_yojson x.business_title));
    ]

let opportunity_identifier_to_yojson = string_to_yojson

let assign_opportunity_request_to_yojson (x : assign_opportunity_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("Identifier", Some (opportunity_identifier_to_yojson x.identifier));
      ("Assignee", Some (assignee_contact_to_yojson x.assignee));
    ]

let related_entity_type_to_yojson (x : related_entity_type) =
  match x with
  | SOLUTIONS -> `String "Solutions"
  | AWS_PRODUCTS -> `String "AwsProducts"
  | AWS_MARKETPLACE_OFFERS -> `String "AwsMarketplaceOffers"
  | AWS_MARKETPLACE_OFFER_SETS -> `String "AwsMarketplaceOfferSets"
  | AWS_MARKETPLACE_SOLUTIONS -> `String "AwsMarketplaceSolutions"
  | AWS_MARKETPLACE_PRODUCTS -> `String "AwsMarketplaceProducts"

let associate_opportunity_request_to_yojson (x : associate_opportunity_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("OpportunityIdentifier", Some (opportunity_identifier_to_yojson x.opportunity_identifier));
      ("RelatedEntityType", Some (related_entity_type_to_yojson x.related_entity_type));
      ( "RelatedEntityIdentifier",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.related_entity_identifier)
      );
    ]

let aws_account_id_or_alias_list_to_yojson tree = list_to_yojson aws_account_to_yojson tree
let aws_account_list_to_yojson tree = list_to_yojson aws_account_to_yojson tree

let aws_closed_lost_reason_to_yojson (x : aws_closed_lost_reason) =
  match x with
  | ADMINISTRATIVE -> `String "Administrative"
  | BUSINESS_ASSOCIATE_AGREEMENT -> `String "Business Associate Agreement"
  | COMPANY_ACQUIRED_DISSOLVED -> `String "Company Acquired/Dissolved"
  | COMPETITIVE_OFFERING -> `String "Competitive Offering"
  | CUSTOMER_DATA_REQUIREMENT -> `String "Customer Data Requirement"
  | CUSTOMER_DEFICIENCY -> `String "Customer Deficiency"
  | CUSTOMER_EXPERIENCE -> `String "Customer Experience"
  | DELAY_CANCELLATION_OF_PROJECT -> `String "Delay / Cancellation of Project"
  | DUPLICATE -> `String "Duplicate"
  | DUPLICATE_OPPORTUNITY -> `String "Duplicate Opportunity"
  | EXECUTIVE_BLOCKER -> `String "Executive Blocker"
  | FAILED_VETTING -> `String "Failed Vetting"
  | FEATURE_LIMITATION -> `String "Feature Limitation"
  | FINANCIAL_COMMERCIAL -> `String "Financial/Commercial"
  | INSUFFICIENT_AMAZON_VALUE -> `String "Insufficient Amazon Value"
  | INSUFFICIENT_AWS_VALUE -> `String "Insufficient AWS Value"
  | INTERNATIONAL_CONSTRAINTS -> `String "International Constraints"
  | LEGAL_TAX_REGULATORY -> `String "Legal / Tax / Regulatory"
  | LEGAL_TERMS_AND_CONDITIONS -> `String "Legal Terms and Conditions"
  | LOST_TO_COMPETITOR -> `String "Lost to Competitor"
  | LOST_TO_COMPETITOR_GOOGLE -> `String "Lost to Competitor - Google"
  | LOST_TO_COMPETITOR_MICROSOFT -> `String "Lost to Competitor - Microsoft"
  | LOST_TO_COMPETITOR_OTHER -> `String "Lost to Competitor - Other"
  | LOST_TO_COMPETITOR_RACKSPACE -> `String "Lost to Competitor - Rackspace"
  | LOST_TO_COMPETITOR_SOFTLAYER -> `String "Lost to Competitor - SoftLayer"
  | LOST_TO_COMPETITOR_VMWARE -> `String "Lost to Competitor - VMWare"
  | NO_CUSTOMER_REFERENCE -> `String "No Customer Reference"
  | NO_INTEGRATION_RESOURCES -> `String "No Integration Resources"
  | NO_OPPORTUNITY -> `String "No Opportunity"
  | NO_PERCEIVED_VALUE_OF_MP -> `String "No Perceived Value of MP"
  | NO_RESPONSE -> `String "No Response"
  | NOT_COMMITTED_TO_AWS -> `String "Not Committed to AWS"
  | NO_UPDATE -> `String "No Update"
  | ON_PREMISES_DEPLOYMENT -> `String "On Premises Deployment"
  | OTHER -> `String "Other"
  | OTHER_DETAILS_IN_DESCRIPTION -> `String "Other (Details in Description)"
  | PARTNER_GAP -> `String "Partner Gap"
  | PAST_DUE -> `String "Past Due"
  | PEOPLE_RELATIONSHIP_GOVERNANCE -> `String "People/Relationship/Governance"
  | PLATFORM_TECHNOLOGY_LIMITATION -> `String "Platform Technology Limitation"
  | PREFERENCE_FOR_COMPETITOR -> `String "Preference for Competitor"
  | PRICE -> `String "Price"
  | PRODUCT_TECHNOLOGY -> `String "Product/Technology"
  | PRODUCT_NOT_ON_AWS -> `String "Product Not on AWS"
  | SECURITY_COMPLIANCE -> `String "Security / Compliance"
  | SELF_SERVICE -> `String "Self-Service"
  | TECHNICAL_LIMITATIONS -> `String "Technical Limitations"
  | TERM_SHEET_IMPASSE -> `String "Term Sheet Impasse"

let aws_funding_used_to_yojson (x : aws_funding_used) =
  match x with YES -> `String "Yes" | NO -> `String "No"

let aws_marketplace_offer_identifier_to_yojson = string_to_yojson

let aws_marketplace_offer_identifiers_to_yojson tree =
  list_to_yojson aws_marketplace_offer_identifier_to_yojson tree

let aws_marketplace_offer_set_identifier_to_yojson = string_to_yojson

let aws_marketplace_offer_set_identifiers_to_yojson tree =
  list_to_yojson aws_marketplace_offer_set_identifier_to_yojson tree

let aws_marketplace_product_arn_to_yojson = string_to_yojson

let aws_marketplace_product_identifiers_to_yojson tree =
  list_to_yojson aws_marketplace_product_arn_to_yojson tree

let aws_marketplace_solution_arn_to_yojson = string_to_yojson

let aws_marketplace_solution_arn_list_to_yojson tree =
  list_to_yojson aws_marketplace_solution_arn_to_yojson tree

let aws_marketplace_solution_identifier_to_yojson = string_to_yojson

let aws_marketplace_solution_identifiers_to_yojson tree =
  list_to_yojson aws_marketplace_solution_identifier_to_yojson tree

let aws_member_business_title_to_yojson (x : aws_member_business_title) =
  match x with
  | AWS_SALES_REP -> `String "AWSSalesRep"
  | AWS_ACCOUNT_OWNER -> `String "AWSAccountOwner"
  | WWPSPDM -> `String "WWPSPDM"
  | PDM -> `String "PDM"
  | PSM -> `String "PSM"
  | ISVSM -> `String "ISVSM"

let contact_to_yojson (x : contact) =
  assoc_to_yojson
    [
      ("Email", option_to_yojson email_to_yojson x.email);
      ("FirstName", option_to_yojson name_to_yojson x.first_name);
      ("LastName", option_to_yojson name_to_yojson x.last_name);
      ("BusinessTitle", option_to_yojson job_title_to_yojson x.business_title);
      ("Phone", option_to_yojson phone_number_to_yojson x.phone);
    ]

let customer_contacts_list_to_yojson tree = list_to_yojson contact_to_yojson tree

let aws_opportunity_customer_to_yojson (x : aws_opportunity_customer) =
  assoc_to_yojson [ ("Contacts", option_to_yojson customer_contacts_list_to_yojson x.contacts) ]

let recommendation_attribute_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let recommendation_to_yojson (x : recommendation) =
  assoc_to_yojson
    [
      ("Type", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.type_));
      ("Details", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.details));
      ("Attributes", option_to_yojson recommendation_attribute_map_to_yojson x.attributes);
    ]

let recommendation_list_to_yojson tree = list_to_yojson recommendation_to_yojson tree

let opportunity_quality_to_yojson (x : opportunity_quality) =
  assoc_to_yojson
    [
      ("Score", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.score);
      ("Trend", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.trend);
    ]

let aws_product_optimization_to_yojson (x : aws_product_optimization) =
  assoc_to_yojson
    [
      ("Description", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description));
      ("SavingsAmount", Some (monetary_amount_to_yojson x.savings_amount));
    ]

let aws_product_optimizations_list_to_yojson tree =
  list_to_yojson aws_product_optimization_to_yojson tree

let string_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let aws_product_details_to_yojson (x : aws_product_details) =
  assoc_to_yojson
    [
      ("ProductCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.product_code));
      ( "ServiceCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code );
      ("Categories", Some (string_list_to_yojson x.categories));
      ("Amount", option_to_yojson monetary_amount_to_yojson x.amount);
      ("OptimizedAmount", option_to_yojson monetary_amount_to_yojson x.optimized_amount);
      ( "PotentialSavingsAmount",
        option_to_yojson monetary_amount_to_yojson x.potential_savings_amount );
      ("Optimizations", Some (aws_product_optimizations_list_to_yojson x.optimizations));
    ]

let aws_products_list_to_yojson tree = list_to_yojson aws_product_details_to_yojson tree

let payment_frequency_to_yojson (x : payment_frequency) =
  match x with MONTHLY -> `String "Monthly"

let currency_code_to_yojson (x : currency_code) =
  match x with
  | USD -> `String "USD"
  | EUR -> `String "EUR"
  | GBP -> `String "GBP"
  | AUD -> `String "AUD"
  | CAD -> `String "CAD"
  | CNY -> `String "CNY"
  | NZD -> `String "NZD"
  | INR -> `String "INR"
  | JPY -> `String "JPY"
  | CHF -> `String "CHF"
  | SEK -> `String "SEK"
  | AED -> `String "AED"
  | AFN -> `String "AFN"
  | ALL -> `String "ALL"
  | AMD -> `String "AMD"
  | ANG -> `String "ANG"
  | AOA -> `String "AOA"
  | ARS -> `String "ARS"
  | AWG -> `String "AWG"
  | AZN -> `String "AZN"
  | BAM -> `String "BAM"
  | BBD -> `String "BBD"
  | BDT -> `String "BDT"
  | BGN -> `String "BGN"
  | BHD -> `String "BHD"
  | BIF -> `String "BIF"
  | BMD -> `String "BMD"
  | BND -> `String "BND"
  | BOB -> `String "BOB"
  | BOV -> `String "BOV"
  | BRL -> `String "BRL"
  | BSD -> `String "BSD"
  | BTN -> `String "BTN"
  | BWP -> `String "BWP"
  | BYN -> `String "BYN"
  | BZD -> `String "BZD"
  | CDF -> `String "CDF"
  | CHE -> `String "CHE"
  | CHW -> `String "CHW"
  | CLF -> `String "CLF"
  | CLP -> `String "CLP"
  | COP -> `String "COP"
  | COU -> `String "COU"
  | CRC -> `String "CRC"
  | CUC -> `String "CUC"
  | CUP -> `String "CUP"
  | CVE -> `String "CVE"
  | CZK -> `String "CZK"
  | DJF -> `String "DJF"
  | DKK -> `String "DKK"
  | DOP -> `String "DOP"
  | DZD -> `String "DZD"
  | EGP -> `String "EGP"
  | ERN -> `String "ERN"
  | ETB -> `String "ETB"
  | FJD -> `String "FJD"
  | FKP -> `String "FKP"
  | GEL -> `String "GEL"
  | GHS -> `String "GHS"
  | GIP -> `String "GIP"
  | GMD -> `String "GMD"
  | GNF -> `String "GNF"
  | GTQ -> `String "GTQ"
  | GYD -> `String "GYD"
  | HKD -> `String "HKD"
  | HNL -> `String "HNL"
  | HRK -> `String "HRK"
  | HTG -> `String "HTG"
  | HUF -> `String "HUF"
  | IDR -> `String "IDR"
  | ILS -> `String "ILS"
  | IQD -> `String "IQD"
  | IRR -> `String "IRR"
  | ISK -> `String "ISK"
  | JMD -> `String "JMD"
  | JOD -> `String "JOD"
  | KES -> `String "KES"
  | KGS -> `String "KGS"
  | KHR -> `String "KHR"
  | KMF -> `String "KMF"
  | KPW -> `String "KPW"
  | KRW -> `String "KRW"
  | KWD -> `String "KWD"
  | KYD -> `String "KYD"
  | KZT -> `String "KZT"
  | LAK -> `String "LAK"
  | LBP -> `String "LBP"
  | LKR -> `String "LKR"
  | LRD -> `String "LRD"
  | LSL -> `String "LSL"
  | LYD -> `String "LYD"
  | MAD -> `String "MAD"
  | MDL -> `String "MDL"
  | MGA -> `String "MGA"
  | MKD -> `String "MKD"
  | MMK -> `String "MMK"
  | MNT -> `String "MNT"
  | MOP -> `String "MOP"
  | MRU -> `String "MRU"
  | MUR -> `String "MUR"
  | MVR -> `String "MVR"
  | MWK -> `String "MWK"
  | MXN -> `String "MXN"
  | MXV -> `String "MXV"
  | MYR -> `String "MYR"
  | MZN -> `String "MZN"
  | NAD -> `String "NAD"
  | NGN -> `String "NGN"
  | NIO -> `String "NIO"
  | NOK -> `String "NOK"
  | NPR -> `String "NPR"
  | OMR -> `String "OMR"
  | PAB -> `String "PAB"
  | PEN -> `String "PEN"
  | PGK -> `String "PGK"
  | PHP -> `String "PHP"
  | PKR -> `String "PKR"
  | PLN -> `String "PLN"
  | PYG -> `String "PYG"
  | QAR -> `String "QAR"
  | RON -> `String "RON"
  | RSD -> `String "RSD"
  | RUB -> `String "RUB"
  | RWF -> `String "RWF"
  | SAR -> `String "SAR"
  | SBD -> `String "SBD"
  | SCR -> `String "SCR"
  | SDG -> `String "SDG"
  | SGD -> `String "SGD"
  | SHP -> `String "SHP"
  | SLL -> `String "SLL"
  | SOS -> `String "SOS"
  | SRD -> `String "SRD"
  | SSP -> `String "SSP"
  | STN -> `String "STN"
  | SVC -> `String "SVC"
  | SYP -> `String "SYP"
  | SZL -> `String "SZL"
  | THB -> `String "THB"
  | TJS -> `String "TJS"
  | TMT -> `String "TMT"
  | TND -> `String "TND"
  | TOP -> `String "TOP"
  | TRY -> `String "TRY"
  | TTD -> `String "TTD"
  | TWD -> `String "TWD"
  | TZS -> `String "TZS"
  | UAH -> `String "UAH"
  | UGX -> `String "UGX"
  | USN -> `String "USN"
  | UYI -> `String "UYI"
  | UYU -> `String "UYU"
  | UZS -> `String "UZS"
  | VEF -> `String "VEF"
  | VND -> `String "VND"
  | VUV -> `String "VUV"
  | WST -> `String "WST"
  | XAF -> `String "XAF"
  | XCD -> `String "XCD"
  | XDR -> `String "XDR"
  | XOF -> `String "XOF"
  | XPF -> `String "XPF"
  | XSU -> `String "XSU"
  | XUA -> `String "XUA"
  | YER -> `String "YER"
  | ZAR -> `String "ZAR"
  | ZMW -> `String "ZMW"
  | ZWL -> `String "ZWL"

let aws_product_insights_to_yojson (x : aws_product_insights) =
  assoc_to_yojson
    [
      ("CurrencyCode", Some (currency_code_to_yojson x.currency_code));
      ("Frequency", Some (payment_frequency_to_yojson x.frequency));
      ("TotalAmount", option_to_yojson monetary_amount_to_yojson x.total_amount);
      ("TotalOptimizedAmount", option_to_yojson monetary_amount_to_yojson x.total_optimized_amount);
      ( "TotalPotentialSavingsAmount",
        option_to_yojson monetary_amount_to_yojson x.total_potential_savings_amount );
      ("TotalAmountByCategory", Some (amount_map_to_yojson x.total_amount_by_category));
      ("AwsProducts", Some (aws_products_list_to_yojson x.aws_products));
    ]

let aws_products_spend_insights_by_source_to_yojson (x : aws_products_spend_insights_by_source) =
  assoc_to_yojson
    [
      ("Partner", option_to_yojson aws_product_insights_to_yojson x.partner);
      ("AWS", option_to_yojson aws_product_insights_to_yojson x.aw_s);
    ]

let engagement_score_to_yojson (x : engagement_score) =
  match x with HIGH -> `String "High" | MEDIUM -> `String "Medium" | LOW -> `String "Low"

let aws_opportunity_insights_to_yojson (x : aws_opportunity_insights) =
  assoc_to_yojson
    [
      ( "NextBestActions",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_best_actions
      );
      ("EngagementScore", option_to_yojson engagement_score_to_yojson x.engagement_score);
      ( "AwsProductsSpendInsightsBySource",
        option_to_yojson aws_products_spend_insights_by_source_to_yojson
          x.aws_products_spend_insights_by_source );
      ("OpportunityQuality", option_to_yojson opportunity_quality_to_yojson x.opportunity_quality);
      ("Recommendations", option_to_yojson recommendation_list_to_yojson x.recommendations);
    ]

let profile_next_steps_history_to_yojson (x : profile_next_steps_history) =
  assoc_to_yojson
    [
      ("Value", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.value));
      ("Time", Some (date_time_to_yojson x.time));
    ]

let profile_next_steps_histories_to_yojson tree =
  list_to_yojson profile_next_steps_history_to_yojson tree

let pii_string_to_yojson = string_to_yojson

let aws_opportunity_stage_to_yojson (x : aws_opportunity_stage) =
  match x with
  | NOT_STARTED -> `String "Not Started"
  | IN_PROGRESS -> `String "In Progress"
  | PROSPECT -> `String "Prospect"
  | ENGAGED -> `String "Engaged"
  | IDENTIFIED -> `String "Identified"
  | QUALIFY -> `String "Qualify"
  | RESEARCH -> `String "Research"
  | SELLER_ENGAGED -> `String "Seller Engaged"
  | EVALUATING -> `String "Evaluating"
  | SELLER_REGISTERED -> `String "Seller Registered"
  | TERM_SHEET_NEGOTIATION -> `String "Term Sheet Negotiation"
  | CONTRACT_NEGOTIATION -> `String "Contract Negotiation"
  | ONBOARDING -> `String "Onboarding"
  | BUILDING_INTEGRATION -> `String "Building Integration"
  | QUALIFIED -> `String "Qualified"
  | ON_HOLD -> `String "On-hold"
  | TECHNICAL_VALIDATION -> `String "Technical Validation"
  | BUSINESS_VALIDATION -> `String "Business Validation"
  | COMMITTED -> `String "Committed"
  | LAUNCHED -> `String "Launched"
  | DEFERRED_TO_PARTNER -> `String "Deferred to Partner"
  | CLOSED_LOST -> `String "Closed Lost"
  | COMPLETED -> `String "Completed"
  | CLOSED_INCOMPLETE -> `String "Closed Incomplete"

let date_to_yojson = string_to_yojson

let aws_opportunity_life_cycle_to_yojson (x : aws_opportunity_life_cycle) =
  assoc_to_yojson
    [
      ("TargetCloseDate", option_to_yojson date_to_yojson x.target_close_date);
      ("ClosedLostReason", option_to_yojson aws_closed_lost_reason_to_yojson x.closed_lost_reason);
      ("Stage", option_to_yojson aws_opportunity_stage_to_yojson x.stage);
      ("NextSteps", option_to_yojson pii_string_to_yojson x.next_steps);
      ( "NextStepsHistory",
        option_to_yojson profile_next_steps_histories_to_yojson x.next_steps_history );
    ]

let aws_partition_to_yojson (x : aws_partition) = match x with AWS_EUSC -> `String "aws-eusc"
let estimation_url_to_yojson = string_to_yojson

let expected_customer_spend_to_yojson (x : expected_customer_spend) =
  assoc_to_yojson
    [
      ("Amount", option_to_yojson amount_to_yojson x.amount);
      ("CurrencyCode", Some (currency_code_to_yojson x.currency_code));
      ("Frequency", Some (payment_frequency_to_yojson x.frequency));
      ( "TargetCompany",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.target_company) );
      ("EstimationUrl", option_to_yojson estimation_url_to_yojson x.estimation_url);
    ]

let expected_customer_spend_list_to_yojson tree =
  list_to_yojson expected_customer_spend_to_yojson tree

let aws_opportunity_project_to_yojson (x : aws_opportunity_project) =
  assoc_to_yojson
    [
      ( "ExpectedCustomerSpend",
        option_to_yojson expected_customer_spend_list_to_yojson x.expected_customer_spend );
      ("AwsPartition", option_to_yojson aws_partition_to_yojson x.aws_partition);
    ]

let solution_identifier_to_yojson = string_to_yojson
let solution_identifiers_to_yojson tree = list_to_yojson solution_identifier_to_yojson tree
let aws_product_identifier_to_yojson = string_to_yojson
let aws_product_identifiers_to_yojson tree = list_to_yojson aws_product_identifier_to_yojson tree

let aws_opportunity_related_entities_to_yojson (x : aws_opportunity_related_entities) =
  assoc_to_yojson
    [
      ("AwsProducts", option_to_yojson aws_product_identifiers_to_yojson x.aws_products);
      ("Solutions", option_to_yojson solution_identifiers_to_yojson x.solutions);
      ( "AwsMarketplaceSolutions",
        option_to_yojson aws_marketplace_solution_identifiers_to_yojson x.aws_marketplace_solutions
      );
      ( "AwsMarketplaceProducts",
        option_to_yojson aws_marketplace_product_identifiers_to_yojson x.aws_marketplace_products );
    ]

let involvement_type_change_reason_to_yojson (x : involvement_type_change_reason) =
  match x with
  | EXPANSION_OPPORTUNITY -> `String "Expansion Opportunity"
  | CHANGE_IN_DEAL_INFORMATION -> `String "Change in Deal Information"
  | CUSTOMER_REQUESTED -> `String "Customer Requested"
  | TECHNICAL_COMPLEXITY -> `String "Technical Complexity"
  | RISK_MITIGATION -> `String "Risk Mitigation"

let aws_team_member_to_yojson (x : aws_team_member) =
  assoc_to_yojson
    [
      ("Email", option_to_yojson email_to_yojson x.email);
      ("FirstName", option_to_yojson name_to_yojson x.first_name);
      ("LastName", option_to_yojson name_to_yojson x.last_name);
      ("BusinessTitle", option_to_yojson aws_member_business_title_to_yojson x.business_title);
    ]

let aws_opportunity_team_members_list_to_yojson tree = list_to_yojson aws_team_member_to_yojson tree

let visibility_to_yojson (x : visibility) =
  match x with FULL -> `String "Full" | LIMITED -> `String "Limited"

let sales_involvement_type_to_yojson (x : sales_involvement_type) =
  match x with FOR_VISIBILITY_ONLY -> `String "For Visibility Only" | CO_SELL -> `String "Co-Sell"

let opportunity_origin_to_yojson (x : opportunity_origin) =
  match x with
  | AWS_REFERRAL -> `String "AWS Referral"
  | PARTNER_REFERRAL -> `String "Partner Referral"

let aws_opportunity_summary_full_view_to_yojson (x : aws_opportunity_summary_full_view) =
  assoc_to_yojson
    [
      ( "RelatedOpportunityId",
        option_to_yojson opportunity_identifier_to_yojson x.related_opportunity_id );
      ("Origin", option_to_yojson opportunity_origin_to_yojson x.origin);
      ("InvolvementType", option_to_yojson sales_involvement_type_to_yojson x.involvement_type);
      ("Visibility", option_to_yojson visibility_to_yojson x.visibility);
      ("LifeCycle", option_to_yojson aws_opportunity_life_cycle_to_yojson x.life_cycle);
      ( "OpportunityTeam",
        option_to_yojson aws_opportunity_team_members_list_to_yojson x.opportunity_team );
      ("Insights", option_to_yojson aws_opportunity_insights_to_yojson x.insights);
      ( "InvolvementTypeChangeReason",
        option_to_yojson involvement_type_change_reason_to_yojson x.involvement_type_change_reason
      );
      ( "RelatedEntityIds",
        option_to_yojson aws_opportunity_related_entities_to_yojson x.related_entity_ids );
      ("Customer", option_to_yojson aws_opportunity_customer_to_yojson x.customer);
      ("Project", option_to_yojson aws_opportunity_project_to_yojson x.project);
      ( "CosellMotion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cosell_motion );
    ]

let aws_submission_to_yojson (x : aws_submission) =
  assoc_to_yojson
    [
      ("InvolvementType", Some (sales_involvement_type_to_yojson x.involvement_type));
      ("Visibility", option_to_yojson visibility_to_yojson x.visibility);
    ]

let channel_to_yojson (x : channel) =
  match x with
  | AWS_MARKETING_CENTRAL -> `String "AWS Marketing Central"
  | CONTENT_SYNDICATION -> `String "Content Syndication"
  | DISPLAY -> `String "Display"
  | EMAIL -> `String "Email"
  | LIVE_EVENT -> `String "Live Event"
  | OUT_OF_HOME -> `String "Out Of Home (OOH)"
  | PRINT -> `String "Print"
  | SEARCH -> `String "Search"
  | SOCIAL -> `String "Social"
  | TELEMARKETING -> `String "Telemarketing"
  | TV -> `String "TV"
  | VIDEO -> `String "Video"
  | VIRTUAL_EVENT -> `String "Virtual Event"

let channels_to_yojson tree = list_to_yojson channel_to_yojson tree

let closed_lost_reason_to_yojson (x : closed_lost_reason) =
  match x with
  | CUSTOMER_DEFICIENCY -> `String "Customer Deficiency"
  | DELAY_CANCELLATION_OF_PROJECT -> `String "Delay / Cancellation of Project"
  | LEGAL_TAX_REGULATORY -> `String "Legal / Tax / Regulatory"
  | LOST_TO_COMPETITOR_GOOGLE -> `String "Lost to Competitor - Google"
  | LOST_TO_COMPETITOR_MICROSOFT -> `String "Lost to Competitor - Microsoft"
  | LOST_TO_COMPETITOR_SOFTLAYER -> `String "Lost to Competitor - SoftLayer"
  | LOST_TO_COMPETITOR_VMWARE -> `String "Lost to Competitor - VMWare"
  | LOST_TO_COMPETITOR_OTHER -> `String "Lost to Competitor - Other"
  | NO_OPPORTUNITY -> `String "No Opportunity"
  | ON_PREMISES_DEPLOYMENT -> `String "On Premises Deployment"
  | PARTNER_GAP -> `String "Partner Gap"
  | PRICE -> `String "Price"
  | SECURITY_COMPLIANCE -> `String "Security / Compliance"
  | TECHNICAL_LIMITATIONS -> `String "Technical Limitations"
  | CUSTOMER_EXPERIENCE -> `String "Customer Experience"
  | OTHER -> `String "Other"
  | PEOPLERELATIONSHIPGOVERNANCE -> `String "People/Relationship/Governance"
  | PRODUCTTECHNOLOGY -> `String "Product/Technology"
  | FINANCIALCOMMERCIAL -> `String "Financial/Commercial"

let competitor_name_to_yojson (x : competitor_name) =
  match x with
  | ORACLE_CLOUD -> `String "Oracle Cloud"
  | ON_PREM -> `String "On-Prem"
  | CO_LOCATION -> `String "Co-location"
  | AKAMAI -> `String "Akamai"
  | ALICLOUD -> `String "AliCloud"
  | GOOGLE_CLOUD_PLATFORM -> `String "Google Cloud Platform"
  | IBM_SOFTLAYER -> `String "IBM Softlayer"
  | MICROSOFT_AZURE -> `String "Microsoft Azure"
  | OTHER_COST_OPTIMIZATION -> `String "Other- Cost Optimization"
  | NO_COMPETITION -> `String "No Competition"
  | OTHER -> `String "*Other"

let context_identifier_to_yojson = string_to_yojson
let context_identifiers_to_yojson tree = list_to_yojson context_identifier_to_yojson tree

let create_engagement_response_to_yojson (x : create_engagement_response) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson engagement_identifier_to_yojson x.id);
      ("Arn", option_to_yojson engagement_arn_to_yojson x.arn);
      ("ModifiedAt", option_to_yojson date_time_to_yojson x.modified_at);
    ]

let engagement_context_details_to_yojson (x : engagement_context_details) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson engagement_context_identifier_to_yojson x.id);
      ("Type", Some (engagement_context_type_to_yojson x.type_));
      ("Payload", option_to_yojson engagement_context_payload_to_yojson x.payload);
    ]

let engagement_contexts_to_yojson tree = list_to_yojson engagement_context_details_to_yojson tree
let engagement_description_to_yojson = string_to_yojson
let engagement_title_to_yojson = string_to_yojson

let create_engagement_request_to_yojson (x : create_engagement_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Title", Some (engagement_title_to_yojson x.title));
      ("Description", Some (engagement_description_to_yojson x.description));
      ("Contexts", option_to_yojson engagement_contexts_to_yojson x.contexts);
    ]

let engagement_invitation_arn_to_yojson = string_to_yojson
let engagement_invitation_identifier_to_yojson = string_to_yojson

let create_engagement_invitation_response_to_yojson (x : create_engagement_invitation_response) =
  assoc_to_yojson
    [
      ("Id", Some (engagement_invitation_identifier_to_yojson x.id));
      ("Arn", Some (engagement_invitation_arn_to_yojson x.arn));
    ]

let lead_invitation_interaction_to_yojson (x : lead_invitation_interaction) =
  assoc_to_yojson
    [
      ("SourceType", Some (lead_source_type_to_yojson x.source_type));
      ("SourceId", Some (lead_source_id_to_yojson x.source_id));
      ("SourceName", Some (lead_source_name_to_yojson x.source_name));
      ("Usecase", option_to_yojson engagement_use_case_to_yojson x.usecase);
      ("ContactBusinessTitle", Some (job_title_to_yojson x.contact_business_title));
    ]

let lead_invitation_customer_to_yojson (x : lead_invitation_customer) =
  assoc_to_yojson
    [
      ("Industry", option_to_yojson industry_to_yojson x.industry);
      ("CompanyName", Some (company_name_to_yojson x.company_name));
      ("WebsiteUrl", option_to_yojson company_website_url_to_yojson x.website_url);
      ("CountryCode", Some (country_code_to_yojson x.country_code));
      ("AwsMaturity", option_to_yojson aws_maturity_to_yojson x.aws_maturity);
      ("MarketSegment", option_to_yojson market_segment_to_yojson x.market_segment);
    ]

let lead_invitation_payload_to_yojson (x : lead_invitation_payload) =
  assoc_to_yojson
    [
      ("Customer", Some (lead_invitation_customer_to_yojson x.customer));
      ("Interaction", Some (lead_invitation_interaction_to_yojson x.interaction));
    ]

let project_details_to_yojson (x : project_details) =
  assoc_to_yojson
    [
      ("BusinessProblem", Some (engagement_customer_business_problem_to_yojson x.business_problem));
      ("Title", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.title));
      ("TargetCompletionDate", Some (date_to_yojson x.target_completion_date));
      ( "ExpectedCustomerSpend",
        Some (expected_customer_spend_list_to_yojson x.expected_customer_spend) );
    ]

let receiver_responsibility_to_yojson (x : receiver_responsibility) =
  match x with
  | DISTRIBUTOR -> `String "Distributor"
  | RESELLER -> `String "Reseller"
  | HARDWARE_PARTNER -> `String "Hardware Partner"
  | MANAGED_SERVICE_PROVIDER -> `String "Managed Service Provider"
  | SOFTWARE_PARTNER -> `String "Software Partner"
  | SERVICES_PARTNER -> `String "Services Partner"
  | TRAINING_PARTNER -> `String "Training Partner"
  | CO_SELL_FACILITATOR -> `String "Co-Sell Facilitator"
  | FACILITATOR -> `String "Facilitator"

let receiver_responsibility_list_to_yojson tree =
  list_to_yojson receiver_responsibility_to_yojson tree

let sender_contact_email_to_yojson = string_to_yojson

let sender_contact_to_yojson (x : sender_contact) =
  assoc_to_yojson
    [
      ("Email", Some (sender_contact_email_to_yojson x.email));
      ("FirstName", option_to_yojson name_to_yojson x.first_name);
      ("LastName", option_to_yojson name_to_yojson x.last_name);
      ("BusinessTitle", option_to_yojson job_title_to_yojson x.business_title);
      ("Phone", option_to_yojson phone_number_to_yojson x.phone);
    ]

let sender_contact_list_to_yojson tree = list_to_yojson sender_contact_to_yojson tree

let opportunity_invitation_payload_to_yojson (x : opportunity_invitation_payload) =
  assoc_to_yojson
    [
      ("SenderContacts", option_to_yojson sender_contact_list_to_yojson x.sender_contacts);
      ( "ReceiverResponsibilities",
        Some (receiver_responsibility_list_to_yojson x.receiver_responsibilities) );
      ("Customer", Some (engagement_customer_to_yojson x.customer));
      ("Project", Some (project_details_to_yojson x.project));
    ]

let payload_to_yojson (x : payload) =
  match x with
  | OpportunityInvitation arg ->
      assoc_to_yojson
        [ ("OpportunityInvitation", Some (opportunity_invitation_payload_to_yojson arg)) ]
  | LeadInvitation arg ->
      assoc_to_yojson [ ("LeadInvitation", Some (lead_invitation_payload_to_yojson arg)) ]

let receiver_to_yojson (x : receiver) =
  match x with
  | Account arg -> assoc_to_yojson [ ("Account", Some (account_receiver_to_yojson arg)) ]

let invitation_message_to_yojson = string_to_yojson

let invitation_to_yojson (x : invitation) =
  assoc_to_yojson
    [
      ("Message", Some (invitation_message_to_yojson x.message));
      ("Receiver", Some (receiver_to_yojson x.receiver));
      ("Payload", Some (payload_to_yojson x.payload));
    ]

let create_engagement_invitation_request_to_yojson (x : create_engagement_invitation_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("EngagementIdentifier", Some (engagement_identifier_to_yojson x.engagement_identifier));
      ("Invitation", Some (invitation_to_yojson x.invitation));
    ]

let create_opportunity_response_to_yojson (x : create_opportunity_response) =
  assoc_to_yojson
    [
      ("Id", Some (opportunity_identifier_to_yojson x.id));
      ( "PartnerOpportunityIdentifier",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.partner_opportunity_identifier );
      ("LastModifiedDate", option_to_yojson date_time_to_yojson x.last_modified_date);
    ]

let partner_opportunity_team_members_list_to_yojson tree = list_to_yojson contact_to_yojson tree

let next_steps_history_to_yojson (x : next_steps_history) =
  assoc_to_yojson
    [
      ("Value", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.value));
      ("Time", Some (date_time_to_yojson x.time));
    ]

let next_steps_histories_to_yojson tree = list_to_yojson next_steps_history_to_yojson tree

let review_status_to_yojson (x : review_status) =
  match x with
  | PENDING_SUBMISSION -> `String "Pending Submission"
  | SUBMITTED -> `String "Submitted"
  | IN_REVIEW -> `String "In review"
  | APPROVED -> `String "Approved"
  | REJECTED -> `String "Rejected"
  | ACTION_REQUIRED -> `String "Action Required"

let stage_to_yojson (x : stage) =
  match x with
  | PROSPECT -> `String "Prospect"
  | QUALIFIED -> `String "Qualified"
  | TECHNICAL_VALIDATION -> `String "Technical Validation"
  | BUSINESS_VALIDATION -> `String "Business Validation"
  | COMMITTED -> `String "Committed"
  | LAUNCHED -> `String "Launched"
  | CLOSED_LOST -> `String "Closed Lost"

let life_cycle_to_yojson (x : life_cycle) =
  assoc_to_yojson
    [
      ("Stage", option_to_yojson stage_to_yojson x.stage);
      ("ClosedLostReason", option_to_yojson closed_lost_reason_to_yojson x.closed_lost_reason);
      ("NextSteps", option_to_yojson pii_string_to_yojson x.next_steps);
      ("TargetCloseDate", option_to_yojson date_to_yojson x.target_close_date);
      ("ReviewStatus", option_to_yojson review_status_to_yojson x.review_status);
      ( "ReviewComments",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.review_comments
      );
      ( "ReviewStatusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.review_status_reason );
      ("NextStepsHistory", option_to_yojson next_steps_histories_to_yojson x.next_steps_history);
    ]

let monetary_value_to_yojson (x : monetary_value) =
  assoc_to_yojson
    [
      ("Amount", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.amount));
      ("CurrencyCode", Some (currency_code_to_yojson x.currency_code));
    ]

let revenue_model_to_yojson (x : revenue_model) =
  match x with
  | CONTRACT -> `String "Contract"
  | PAY_AS_YOU_GO -> `String "Pay-as-you-go"
  | SUBSCRIPTION -> `String "Subscription"

let software_revenue_to_yojson (x : software_revenue) =
  assoc_to_yojson
    [
      ("DeliveryModel", option_to_yojson revenue_model_to_yojson x.delivery_model);
      ("Value", option_to_yojson monetary_value_to_yojson x.value);
      ("EffectiveDate", option_to_yojson date_to_yojson x.effective_date);
      ("ExpirationDate", option_to_yojson date_to_yojson x.expiration_date);
    ]

let use_cases_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let marketing_source_to_yojson (x : marketing_source) =
  match x with MARKETING_ACTIVITY -> `String "Marketing Activity" | NONE -> `String "None"

let marketing_to_yojson (x : marketing) =
  assoc_to_yojson
    [
      ( "CampaignName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.campaign_name );
      ("Source", option_to_yojson marketing_source_to_yojson x.source);
      ("UseCases", option_to_yojson use_cases_to_yojson x.use_cases);
      ("Channels", option_to_yojson channels_to_yojson x.channels);
      ("AwsFundingUsed", option_to_yojson aws_funding_used_to_yojson x.aws_funding_used);
    ]

let opportunity_type_to_yojson (x : opportunity_type) =
  match x with
  | NET_NEW_BUSINESS -> `String "Net New Business"
  | FLAT_RENEWAL -> `String "Flat Renewal"
  | EXPANSION -> `String "Expansion"

let sales_activity_to_yojson (x : sales_activity) =
  match x with
  | INITIALIZED_DISCUSSIONS_WITH_CUSTOMER -> `String "Initialized discussions with customer"
  | CUSTOMER_HAS_SHOWN_INTEREST -> `String "Customer has shown interest in solution"
  | CONDUCTED_POC_DEMO -> `String "Conducted POC / Demo"
  | IN_EVALUATION_PLANNING_STAGE -> `String "In evaluation / planning stage"
  | AGREED_ON_SOLUTION_TO_BUSINESS_PROBLEM -> `String "Agreed on solution to Business Problem"
  | COMPLETED_ACTION_PLAN -> `String "Completed Action Plan"
  | FINALIZED_DEPLOYMENT_NEEDS -> `String "Finalized Deployment Need"
  | SOW_SIGNED -> `String "SOW Signed"

let sales_activities_to_yojson tree = list_to_yojson sales_activity_to_yojson tree

let expected_contract_duration_term_to_yojson (x : expected_contract_duration_term) =
  match x with MONTHS -> `String "Months"

let expected_contract_duration_to_yojson (x : expected_contract_duration) =
  assoc_to_yojson
    [
      ("Term", Some (expected_contract_duration_term_to_yojson x.term));
      ("Value", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.value));
    ]

let delivery_model_to_yojson (x : delivery_model) =
  match x with
  | SAAS_OR_PAAS -> `String "SaaS or PaaS"
  | BYOL_OR_AMI -> `String "BYOL or AMI"
  | MANAGED_SERVICES -> `String "Managed Services"
  | PROFESSIONAL_SERVICES -> `String "Professional Services"
  | RESELL -> `String "Resell"
  | OTHER -> `String "Other"

let delivery_models_to_yojson tree = list_to_yojson delivery_model_to_yojson tree

let project_to_yojson (x : project) =
  assoc_to_yojson
    [
      ("DeliveryModels", option_to_yojson delivery_models_to_yojson x.delivery_models);
      ( "ExpectedCustomerSpend",
        option_to_yojson expected_customer_spend_list_to_yojson x.expected_customer_spend );
      ( "ExpectedContractDuration",
        option_to_yojson expected_contract_duration_to_yojson x.expected_contract_duration );
      ("Title", option_to_yojson pii_string_to_yojson x.title);
      ("ApnPrograms", option_to_yojson apn_programs_to_yojson x.apn_programs);
      ("CustomerBusinessProblem", option_to_yojson pii_string_to_yojson x.customer_business_problem);
      ( "CustomerUseCase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.customer_use_case
      );
      ( "RelatedOpportunityIdentifier",
        option_to_yojson opportunity_identifier_to_yojson x.related_opportunity_identifier );
      ("SalesActivities", option_to_yojson sales_activities_to_yojson x.sales_activities);
      ("CompetitorName", option_to_yojson competitor_name_to_yojson x.competitor_name);
      ( "OtherCompetitorNames",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.other_competitor_names );
      ( "OtherSolutionDescription",
        option_to_yojson pii_string_to_yojson x.other_solution_description );
      ( "AdditionalComments",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.additional_comments );
      ("AwsPartition", option_to_yojson aws_partition_to_yojson x.aws_partition);
    ]

let customer_to_yojson (x : customer) =
  assoc_to_yojson
    [
      ("Account", option_to_yojson account_to_yojson x.account);
      ("Contacts", option_to_yojson customer_contacts_list_to_yojson x.contacts);
    ]

let national_security_to_yojson (x : national_security) =
  match x with YES -> `String "Yes" | NO -> `String "No"

let primary_need_from_aws_to_yojson (x : primary_need_from_aws) =
  match x with
  | CO_SELL_ARCHITECTURAL_VALIDATION -> `String "Co-Sell - Architectural Validation"
  | CO_SELL_BUSINESS_PRESENTATION -> `String "Co-Sell - Business Presentation"
  | CO_SELL_COMPETITIVE_INFORMATION -> `String "Co-Sell - Competitive Information"
  | CO_SELL_PRICING_ASSISTANCE -> `String "Co-Sell - Pricing Assistance"
  | CO_SELL_TECHNICAL_CONSULTATION -> `String "Co-Sell - Technical Consultation"
  | CO_SELL_TOTAL_COST_OF_OWNERSHIP_EVALUATION ->
      `String "Co-Sell - Total Cost of Ownership Evaluation"
  | CO_SELL_DEAL_SUPPORT -> `String "Co-Sell - Deal Support"
  | CO_SELL_SUPPORT_FOR_PUBLIC_TENDER_RFX -> `String "Co-Sell - Support for Public Tender / RFx"

let primary_needs_from_aws_to_yojson tree = list_to_yojson primary_need_from_aws_to_yojson tree

let create_opportunity_request_to_yojson (x : create_opportunity_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ( "PrimaryNeedsFromAws",
        option_to_yojson primary_needs_from_aws_to_yojson x.primary_needs_from_aws );
      ("NationalSecurity", option_to_yojson national_security_to_yojson x.national_security);
      ( "PartnerOpportunityIdentifier",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.partner_opportunity_identifier );
      ("Customer", option_to_yojson customer_to_yojson x.customer);
      ("Project", option_to_yojson project_to_yojson x.project);
      ("OpportunityType", option_to_yojson opportunity_type_to_yojson x.opportunity_type);
      ("Marketing", option_to_yojson marketing_to_yojson x.marketing);
      ("SoftwareRevenue", option_to_yojson software_revenue_to_yojson x.software_revenue);
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("LifeCycle", option_to_yojson life_cycle_to_yojson x.life_cycle);
      ("Origin", option_to_yojson opportunity_origin_to_yojson x.origin);
      ( "OpportunityTeam",
        option_to_yojson partner_opportunity_team_members_list_to_yojson x.opportunity_team );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let resource_snapshot_revision_to_yojson = int_to_yojson
let resource_arn_to_yojson = string_to_yojson

let create_resource_snapshot_response_to_yojson (x : create_resource_snapshot_response) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson resource_arn_to_yojson x.arn);
      ("Revision", option_to_yojson resource_snapshot_revision_to_yojson x.revision);
    ]

let resource_template_name_to_yojson = string_to_yojson
let resource_identifier_to_yojson = string_to_yojson

let resource_type_to_yojson (x : resource_type) =
  match x with OPPORTUNITY -> `String "Opportunity"

let create_resource_snapshot_request_to_yojson (x : create_resource_snapshot_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("EngagementIdentifier", Some (engagement_identifier_to_yojson x.engagement_identifier));
      ("ResourceType", Some (resource_type_to_yojson x.resource_type));
      ("ResourceIdentifier", Some (resource_identifier_to_yojson x.resource_identifier));
      ( "ResourceSnapshotTemplateIdentifier",
        Some (resource_template_name_to_yojson x.resource_snapshot_template_identifier) );
      ("ClientToken", Some (client_token_to_yojson x.client_token));
    ]

let resource_snapshot_job_arn_to_yojson = string_to_yojson
let resource_snapshot_job_identifier_to_yojson = string_to_yojson

let create_resource_snapshot_job_response_to_yojson (x : create_resource_snapshot_job_response) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_snapshot_job_identifier_to_yojson x.id);
      ("Arn", option_to_yojson resource_snapshot_job_arn_to_yojson x.arn);
    ]

let create_resource_snapshot_job_request_to_yojson (x : create_resource_snapshot_job_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("EngagementIdentifier", Some (engagement_identifier_to_yojson x.engagement_identifier));
      ("ResourceType", Some (resource_type_to_yojson x.resource_type));
      ("ResourceIdentifier", Some (resource_identifier_to_yojson x.resource_identifier));
      ( "ResourceSnapshotTemplateIdentifier",
        Some (resource_template_name_to_yojson x.resource_snapshot_template_identifier) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let created_date_filter_to_yojson (x : created_date_filter) =
  assoc_to_yojson
    [
      ("AfterCreatedDate", option_to_yojson date_time_to_yojson x.after_created_date);
      ("BeforeCreatedDate", option_to_yojson date_time_to_yojson x.before_created_date);
    ]

let customer_summary_to_yojson (x : customer_summary) =
  assoc_to_yojson [ ("Account", option_to_yojson account_summary_to_yojson x.account) ]

let delete_resource_snapshot_job_request_to_yojson (x : delete_resource_snapshot_job_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ( "ResourceSnapshotJobIdentifier",
        Some (resource_snapshot_job_identifier_to_yojson x.resource_snapshot_job_identifier) );
    ]

let disassociate_opportunity_request_to_yojson (x : disassociate_opportunity_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("OpportunityIdentifier", Some (opportunity_identifier_to_yojson x.opportunity_identifier));
      ("RelatedEntityType", Some (related_entity_type_to_yojson x.related_entity_type));
      ( "RelatedEntityIdentifier",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.related_entity_identifier)
      );
    ]

let engagement_context_type_list_to_yojson tree =
  list_to_yojson engagement_context_type_to_yojson tree

let engagement_identifier_list_to_yojson tree = list_to_yojson engagement_identifier_to_yojson tree

let engagement_identifiers_to_yojson tree =
  list_to_yojson engagement_arn_or_identifier_to_yojson tree

let engagement_invitation_identifiers_to_yojson tree =
  list_to_yojson engagement_invitation_arn_or_identifier_to_yojson tree

let engagement_invitation_payload_type_to_yojson (x : engagement_invitation_payload_type) =
  match x with
  | OPPORTUNITY_INVITATION -> `String "OpportunityInvitation"
  | LEAD_INVITATION -> `String "LeadInvitation"

let participant_type_to_yojson (x : participant_type) =
  match x with SENDER -> `String "SENDER" | RECEIVER -> `String "RECEIVER"

let invitation_status_to_yojson (x : invitation_status) =
  match x with
  | ACCEPTED -> `String "ACCEPTED"
  | PENDING -> `String "PENDING"
  | REJECTED -> `String "REJECTED"
  | EXPIRED -> `String "EXPIRED"

let engagement_invitation_summary_to_yojson (x : engagement_invitation_summary) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ("PayloadType", option_to_yojson engagement_invitation_payload_type_to_yojson x.payload_type);
      ("Id", Some (engagement_invitation_arn_or_identifier_to_yojson x.id));
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
      ("EngagementTitle", option_to_yojson engagement_title_to_yojson x.engagement_title);
      ("Status", option_to_yojson invitation_status_to_yojson x.status);
      ("InvitationDate", option_to_yojson date_time_to_yojson x.invitation_date);
      ("ExpirationDate", option_to_yojson date_time_to_yojson x.expiration_date);
      ("SenderAwsAccountId", option_to_yojson aws_account_to_yojson x.sender_aws_account_id);
      ( "SenderCompanyName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.sender_company_name );
      ("Receiver", option_to_yojson receiver_to_yojson x.receiver);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("ParticipantType", option_to_yojson participant_type_to_yojson x.participant_type);
    ]

let engagement_invitation_summaries_to_yojson tree =
  list_to_yojson engagement_invitation_summary_to_yojson tree

let engagement_invitations_payload_type_to_yojson tree =
  list_to_yojson engagement_invitation_payload_type_to_yojson tree

let member_company_name_to_yojson = string_to_yojson

let engagement_member_to_yojson (x : engagement_member) =
  assoc_to_yojson
    [
      ("CompanyName", option_to_yojson member_company_name_to_yojson x.company_name);
      ( "WebsiteUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.website_url );
      ("AccountId", option_to_yojson aws_account_to_yojson x.account_id);
    ]

let engagement_member_summary_to_yojson (x : engagement_member_summary) =
  assoc_to_yojson
    [
      ("CompanyName", option_to_yojson member_company_name_to_yojson x.company_name);
      ( "WebsiteUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.website_url );
    ]

let engagement_member_summaries_to_yojson tree =
  list_to_yojson engagement_member_summary_to_yojson tree

let engagement_members_to_yojson tree = list_to_yojson engagement_member_to_yojson tree
let engagement_page_size_to_yojson = int_to_yojson

let prospecting_task_status_to_yojson (x : prospecting_task_status) =
  match x with
  | PENDING -> `String "PENDING"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"

let engagement_prospecting_result_to_yojson (x : engagement_prospecting_result) =
  assoc_to_yojson
    [
      ("EngagementIdentifier", Some (engagement_identifier_to_yojson x.engagement_identifier));
      ( "EngagementContextId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.engagement_context_id );
      ("Status", Some (prospecting_task_status_to_yojson x.status));
      ( "ReasonCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reason_code );
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let engagement_prospecting_result_list_to_yojson tree =
  list_to_yojson engagement_prospecting_result_to_yojson tree

let engagement_resource_association_summary_to_yojson (x : engagement_resource_association_summary)
    =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("ResourceId", option_to_yojson resource_identifier_to_yojson x.resource_id);
      ("CreatedBy", option_to_yojson aws_account_to_yojson x.created_by);
    ]

let engagement_resource_association_summary_list_to_yojson tree =
  list_to_yojson engagement_resource_association_summary_to_yojson tree

let engagement_sort_name_to_yojson (x : engagement_sort_name) =
  match x with CreatedDate -> `String "CreatedDate"

let sort_order_to_yojson (x : sort_order) =
  match x with ASCENDING -> `String "ASCENDING" | DESCENDING -> `String "DESCENDING"

let engagement_sort_to_yojson (x : engagement_sort) =
  assoc_to_yojson
    [
      ("SortOrder", Some (sort_order_to_yojson x.sort_order));
      ("SortBy", Some (engagement_sort_name_to_yojson x.sort_by));
    ]

let engagement_summary_to_yojson (x : engagement_summary) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson engagement_arn_to_yojson x.arn);
      ("Id", option_to_yojson engagement_identifier_to_yojson x.id);
      ("Title", option_to_yojson engagement_title_to_yojson x.title);
      ("CreatedAt", option_to_yojson date_time_to_yojson x.created_at);
      ("CreatedBy", option_to_yojson aws_account_to_yojson x.created_by);
      ( "MemberCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.member_count );
      ("ModifiedAt", option_to_yojson date_time_to_yojson x.modified_at);
      ("ModifiedBy", option_to_yojson aws_account_to_yojson x.modified_by);
      ("ContextTypes", option_to_yojson engagement_context_type_list_to_yojson x.context_types);
    ]

let engagement_summary_list_to_yojson tree = list_to_yojson engagement_summary_to_yojson tree
let filter_identifier_to_yojson tree = list_to_yojson opportunity_identifier_to_yojson tree
let filter_life_cycle_review_status_to_yojson tree = list_to_yojson review_status_to_yojson tree
let filter_life_cycle_stage_to_yojson tree = list_to_yojson stage_to_yojson tree

let solution_status_to_yojson (x : solution_status) =
  match x with
  | ACTIVE -> `String "Active"
  | INACTIVE -> `String "Inactive"
  | DRAFT -> `String "Draft"

let filter_status_to_yojson tree = list_to_yojson solution_status_to_yojson tree

let get_aws_opportunity_summary_response_to_yojson (x : get_aws_opportunity_summary_response) =
  assoc_to_yojson
    [
      ( "RelatedOpportunityId",
        option_to_yojson opportunity_identifier_to_yojson x.related_opportunity_id );
      ("Origin", option_to_yojson opportunity_origin_to_yojson x.origin);
      ("InvolvementType", option_to_yojson sales_involvement_type_to_yojson x.involvement_type);
      ("Visibility", option_to_yojson visibility_to_yojson x.visibility);
      ("LifeCycle", option_to_yojson aws_opportunity_life_cycle_to_yojson x.life_cycle);
      ( "OpportunityTeam",
        option_to_yojson aws_opportunity_team_members_list_to_yojson x.opportunity_team );
      ("Insights", option_to_yojson aws_opportunity_insights_to_yojson x.insights);
      ( "InvolvementTypeChangeReason",
        option_to_yojson involvement_type_change_reason_to_yojson x.involvement_type_change_reason
      );
      ( "RelatedEntityIds",
        option_to_yojson aws_opportunity_related_entities_to_yojson x.related_entity_ids );
      ("Customer", option_to_yojson aws_opportunity_customer_to_yojson x.customer);
      ("Project", option_to_yojson aws_opportunity_project_to_yojson x.project);
      ( "CosellMotion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cosell_motion );
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let get_aws_opportunity_summary_request_to_yojson (x : get_aws_opportunity_summary_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ( "RelatedOpportunityIdentifier",
        Some (opportunity_identifier_to_yojson x.related_opportunity_identifier) );
    ]

let get_engagement_response_to_yojson (x : get_engagement_response) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson engagement_identifier_to_yojson x.id);
      ("Arn", option_to_yojson engagement_arn_to_yojson x.arn);
      ("Title", option_to_yojson engagement_title_to_yojson x.title);
      ("Description", option_to_yojson engagement_description_to_yojson x.description);
      ("CreatedAt", option_to_yojson date_time_to_yojson x.created_at);
      ("CreatedBy", option_to_yojson aws_account_to_yojson x.created_by);
      ( "MemberCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.member_count );
      ("ModifiedAt", option_to_yojson date_time_to_yojson x.modified_at);
      ("ModifiedBy", option_to_yojson aws_account_to_yojson x.modified_by);
      ("Contexts", option_to_yojson engagement_contexts_to_yojson x.contexts);
    ]

let get_engagement_request_to_yojson (x : get_engagement_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("Identifier", Some (engagement_arn_or_identifier_to_yojson x.identifier));
    ]

let rejection_reason_string_to_yojson = string_to_yojson

let get_engagement_invitation_response_to_yojson (x : get_engagement_invitation_response) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ("PayloadType", option_to_yojson engagement_invitation_payload_type_to_yojson x.payload_type);
      ("Id", Some (engagement_invitation_arn_or_identifier_to_yojson x.id));
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
      ("EngagementTitle", option_to_yojson engagement_title_to_yojson x.engagement_title);
      ("Status", option_to_yojson invitation_status_to_yojson x.status);
      ("InvitationDate", option_to_yojson date_time_to_yojson x.invitation_date);
      ("ExpirationDate", option_to_yojson date_time_to_yojson x.expiration_date);
      ("SenderAwsAccountId", option_to_yojson aws_account_to_yojson x.sender_aws_account_id);
      ( "SenderCompanyName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.sender_company_name );
      ("Receiver", option_to_yojson receiver_to_yojson x.receiver);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("RejectionReason", option_to_yojson rejection_reason_string_to_yojson x.rejection_reason);
      ("Payload", option_to_yojson payload_to_yojson x.payload);
      ("InvitationMessage", option_to_yojson invitation_message_to_yojson x.invitation_message);
      ( "EngagementDescription",
        option_to_yojson engagement_description_to_yojson x.engagement_description );
      ("ExistingMembers", option_to_yojson engagement_member_summaries_to_yojson x.existing_members);
    ]

let get_engagement_invitation_request_to_yojson (x : get_engagement_invitation_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("Identifier", Some (engagement_invitation_arn_or_identifier_to_yojson x.identifier));
    ]

let related_entity_identifiers_to_yojson (x : related_entity_identifiers) =
  assoc_to_yojson
    [
      ( "AwsMarketplaceOffers",
        option_to_yojson aws_marketplace_offer_identifiers_to_yojson x.aws_marketplace_offers );
      ( "AwsMarketplaceOfferSets",
        option_to_yojson aws_marketplace_offer_set_identifiers_to_yojson
          x.aws_marketplace_offer_sets );
      ("Solutions", option_to_yojson solution_identifiers_to_yojson x.solutions);
      ("AwsProducts", option_to_yojson aws_product_identifiers_to_yojson x.aws_products);
      ( "AwsMarketplaceSolutions",
        option_to_yojson aws_marketplace_solution_identifiers_to_yojson x.aws_marketplace_solutions
      );
      ( "AwsMarketplaceProducts",
        option_to_yojson aws_marketplace_product_identifiers_to_yojson x.aws_marketplace_products );
    ]

let opportunity_arn_to_yojson = string_to_yojson

let get_opportunity_response_to_yojson (x : get_opportunity_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ( "PrimaryNeedsFromAws",
        option_to_yojson primary_needs_from_aws_to_yojson x.primary_needs_from_aws );
      ("NationalSecurity", option_to_yojson national_security_to_yojson x.national_security);
      ( "PartnerOpportunityIdentifier",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.partner_opportunity_identifier );
      ("Customer", option_to_yojson customer_to_yojson x.customer);
      ("Project", option_to_yojson project_to_yojson x.project);
      ("OpportunityType", option_to_yojson opportunity_type_to_yojson x.opportunity_type);
      ("Marketing", option_to_yojson marketing_to_yojson x.marketing);
      ("SoftwareRevenue", option_to_yojson software_revenue_to_yojson x.software_revenue);
      ("Id", Some (opportunity_identifier_to_yojson x.id));
      ("Arn", option_to_yojson opportunity_arn_to_yojson x.arn);
      ("LastModifiedDate", Some (date_time_to_yojson x.last_modified_date));
      ("CreatedDate", Some (date_time_to_yojson x.created_date));
      ( "RelatedEntityIdentifiers",
        Some (related_entity_identifiers_to_yojson x.related_entity_identifiers) );
      ("LifeCycle", option_to_yojson life_cycle_to_yojson x.life_cycle);
      ( "OpportunityTeam",
        option_to_yojson partner_opportunity_team_members_list_to_yojson x.opportunity_team );
    ]

let get_opportunity_request_to_yojson (x : get_opportunity_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("Identifier", Some (opportunity_identifier_to_yojson x.identifier));
    ]

let prospecting_task_arn_to_yojson = string_to_yojson

let get_prospecting_from_engagement_task_response_to_yojson
    (x : get_prospecting_from_engagement_task_response) =
  assoc_to_yojson
    [
      ("TaskId", Some (prospecting_task_identifier_to_yojson x.task_id));
      ("TaskArn", Some (prospecting_task_arn_to_yojson x.task_arn));
      ("TaskName", Some (task_name_to_yojson x.task_name));
      ("StartTime", Some (date_time_to_yojson x.start_time));
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
      ("Engagements", Some (engagement_prospecting_result_list_to_yojson x.engagements));
    ]

let get_prospecting_from_engagement_task_request_to_yojson
    (x : get_prospecting_from_engagement_task_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("TaskIdentifier", Some (prospecting_task_identifier_to_yojson x.task_identifier));
    ]

let project_view_to_yojson (x : project_view) =
  assoc_to_yojson
    [
      ("DeliveryModels", option_to_yojson delivery_models_to_yojson x.delivery_models);
      ( "ExpectedCustomerSpend",
        option_to_yojson expected_customer_spend_list_to_yojson x.expected_customer_spend );
      ( "ExpectedContractDuration",
        option_to_yojson expected_contract_duration_to_yojson x.expected_contract_duration );
      ( "CustomerUseCase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.customer_use_case
      );
      ("SalesActivities", option_to_yojson sales_activities_to_yojson x.sales_activities);
      ( "OtherSolutionDescription",
        option_to_yojson pii_string_to_yojson x.other_solution_description );
    ]

let life_cycle_for_view_to_yojson (x : life_cycle_for_view) =
  assoc_to_yojson
    [
      ("TargetCloseDate", option_to_yojson date_to_yojson x.target_close_date);
      ("ReviewStatus", option_to_yojson review_status_to_yojson x.review_status);
      ("Stage", option_to_yojson stage_to_yojson x.stage);
      ("NextSteps", option_to_yojson pii_string_to_yojson x.next_steps);
    ]

let opportunity_summary_view_to_yojson (x : opportunity_summary_view) =
  assoc_to_yojson
    [
      ("OpportunityType", option_to_yojson opportunity_type_to_yojson x.opportunity_type);
      ("Lifecycle", option_to_yojson life_cycle_for_view_to_yojson x.lifecycle);
      ( "OpportunityTeam",
        option_to_yojson partner_opportunity_team_members_list_to_yojson x.opportunity_team );
      ( "PrimaryNeedsFromAws",
        option_to_yojson primary_needs_from_aws_to_yojson x.primary_needs_from_aws );
      ("Customer", option_to_yojson customer_to_yojson x.customer);
      ("Project", option_to_yojson project_view_to_yojson x.project);
      ( "RelatedEntityIdentifiers",
        option_to_yojson related_entity_identifiers_to_yojson x.related_entity_identifiers );
    ]

let resource_snapshot_payload_to_yojson (x : resource_snapshot_payload) =
  match x with
  | OpportunitySummary arg ->
      assoc_to_yojson [ ("OpportunitySummary", Some (opportunity_summary_view_to_yojson arg)) ]
  | AwsOpportunitySummaryFullView arg ->
      assoc_to_yojson
        [
          ("AwsOpportunitySummaryFullView", Some (aws_opportunity_summary_full_view_to_yojson arg));
        ]

let get_resource_snapshot_response_to_yojson (x : get_resource_snapshot_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("Arn", option_to_yojson resource_arn_to_yojson x.arn);
      ("CreatedBy", option_to_yojson aws_account_to_yojson x.created_by);
      ("CreatedAt", option_to_yojson date_time_to_yojson x.created_at);
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("ResourceId", option_to_yojson resource_identifier_to_yojson x.resource_id);
      ( "ResourceSnapshotTemplateName",
        option_to_yojson resource_template_name_to_yojson x.resource_snapshot_template_name );
      ("Revision", option_to_yojson resource_snapshot_revision_to_yojson x.revision);
      ("Payload", option_to_yojson resource_snapshot_payload_to_yojson x.payload);
      ( "TargetMemberAccounts",
        option_to_yojson aws_account_id_or_alias_list_to_yojson x.target_member_accounts );
    ]

let get_resource_snapshot_request_to_yojson (x : get_resource_snapshot_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("EngagementIdentifier", Some (engagement_identifier_to_yojson x.engagement_identifier));
      ("ResourceType", Some (resource_type_to_yojson x.resource_type));
      ("ResourceIdentifier", Some (resource_identifier_to_yojson x.resource_identifier));
      ( "ResourceSnapshotTemplateIdentifier",
        Some (resource_template_name_to_yojson x.resource_snapshot_template_identifier) );
      ("Revision", option_to_yojson resource_snapshot_revision_to_yojson x.revision);
    ]

let resource_snapshot_job_status_to_yojson (x : resource_snapshot_job_status) =
  match x with RUNNING -> `String "Running" | STOPPED -> `String "Stopped"

let get_resource_snapshot_job_response_to_yojson (x : get_resource_snapshot_job_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("Id", option_to_yojson resource_snapshot_job_identifier_to_yojson x.id);
      ("Arn", option_to_yojson resource_snapshot_job_arn_to_yojson x.arn);
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("ResourceId", option_to_yojson resource_identifier_to_yojson x.resource_id);
      ("ResourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ( "ResourceSnapshotTemplateName",
        option_to_yojson resource_template_name_to_yojson x.resource_snapshot_template_name );
      ("CreatedAt", option_to_yojson date_time_to_yojson x.created_at);
      ("Status", option_to_yojson resource_snapshot_job_status_to_yojson x.status);
      ( "LastSuccessfulExecutionDate",
        option_to_yojson date_time_to_yojson x.last_successful_execution_date );
      ( "LastFailure",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.last_failure );
    ]

let get_resource_snapshot_job_request_to_yojson (x : get_resource_snapshot_job_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ( "ResourceSnapshotJobIdentifier",
        Some (resource_snapshot_job_identifier_to_yojson x.resource_snapshot_job_identifier) );
    ]

let invitation_status_list_to_yojson tree = list_to_yojson invitation_status_to_yojson tree

let last_modified_date_to_yojson (x : last_modified_date) =
  assoc_to_yojson
    [
      ("AfterLastModifiedDate", option_to_yojson date_time_to_yojson x.after_last_modified_date);
      ("BeforeLastModifiedDate", option_to_yojson date_time_to_yojson x.before_last_modified_date);
    ]

let life_cycle_summary_to_yojson (x : life_cycle_summary) =
  assoc_to_yojson
    [
      ("Stage", option_to_yojson stage_to_yojson x.stage);
      ("ClosedLostReason", option_to_yojson closed_lost_reason_to_yojson x.closed_lost_reason);
      ("NextSteps", option_to_yojson pii_string_to_yojson x.next_steps);
      ("TargetCloseDate", option_to_yojson date_to_yojson x.target_close_date);
      ("ReviewStatus", option_to_yojson review_status_to_yojson x.review_status);
      ( "ReviewComments",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.review_comments
      );
      ( "ReviewStatusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.review_status_reason );
    ]

let reason_code_to_yojson (x : reason_code) =
  match x with
  | INVITATION_ACCESS_DENIED -> `String "InvitationAccessDenied"
  | INVITATION_VALIDATION_FAILED -> `String "InvitationValidationFailed"
  | ENGAGEMENT_ACCESS_DENIED -> `String "EngagementAccessDenied"
  | OPPORTUNITY_ACCESS_DENIED -> `String "OpportunityAccessDenied"
  | RESOURCE_SNAPSHOT_JOB_ACCESS_DENIED -> `String "ResourceSnapshotJobAccessDenied"
  | RESOURCE_SNAPSHOT_JOB_VALIDATION_FAILED -> `String "ResourceSnapshotJobValidationFailed"
  | RESOURCE_SNAPSHOT_JOB_CONFLICT -> `String "ResourceSnapshotJobConflict"
  | ENGAGEMENT_VALIDATION_FAILED -> `String "EngagementValidationFailed"
  | ENGAGEMENT_CONFLICT -> `String "EngagementConflict"
  | OPPORTUNITY_SUBMISSION_FAILED -> `String "OpportunitySubmissionFailed"
  | ENGAGEMENT_INVITATION_CONFLICT -> `String "EngagementInvitationConflict"
  | INTERNAL_ERROR -> `String "InternalError"
  | OPPORTUNITY_VALIDATION_FAILED -> `String "OpportunityValidationFailed"
  | OPPORTUNITY_CONFLICT -> `String "OpportunityConflict"
  | RESOURCE_SNAPSHOT_ACCESS_DENIED -> `String "ResourceSnapshotAccessDenied"
  | RESOURCE_SNAPSHOT_VALIDATION_FAILED -> `String "ResourceSnapshotValidationFailed"
  | RESOURCE_SNAPSHOT_CONFLICT -> `String "ResourceSnapshotConflict"
  | SERVICE_QUOTA_EXCEEDED -> `String "ServiceQuotaExceeded"
  | REQUEST_THROTTLED -> `String "RequestThrottled"
  | CONTEXT_NOT_FOUND -> `String "ContextNotFound"
  | CUSTOMER_PROJECT_CONTEXT_NOT_PERMITTED -> `String "CustomerProjectContextNotPermitted"
  | DISQUALIFIED_LEAD_NOT_PERMITTED -> `String "DisqualifiedLeadNotPermitted"

let task_status_to_yojson (x : task_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETE -> `String "COMPLETE"
  | FAILED -> `String "FAILED"

let task_identifier_to_yojson = string_to_yojson

let list_engagement_by_accepting_invitation_task_summary_to_yojson
    (x : list_engagement_by_accepting_invitation_task_summary) =
  assoc_to_yojson
    [
      ("TaskId", option_to_yojson task_identifier_to_yojson x.task_id);
      ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("TaskStatus", option_to_yojson task_status_to_yojson x.task_status);
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("ReasonCode", option_to_yojson reason_code_to_yojson x.reason_code);
      ("OpportunityId", option_to_yojson opportunity_identifier_to_yojson x.opportunity_id);
      ( "ResourceSnapshotJobId",
        option_to_yojson resource_snapshot_job_identifier_to_yojson x.resource_snapshot_job_id );
      ( "EngagementInvitationId",
        option_to_yojson engagement_invitation_identifier_to_yojson x.engagement_invitation_id );
    ]

let list_engagement_by_accepting_invitation_task_summaries_to_yojson tree =
  list_to_yojson list_engagement_by_accepting_invitation_task_summary_to_yojson tree

let list_engagement_by_accepting_invitation_tasks_response_to_yojson
    (x : list_engagement_by_accepting_invitation_tasks_response) =
  assoc_to_yojson
    [
      ( "TaskSummaries",
        option_to_yojson list_engagement_by_accepting_invitation_task_summaries_to_yojson
          x.task_summaries );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let task_arn_or_identifier_to_yojson = string_to_yojson
let task_identifiers_to_yojson tree = list_to_yojson task_arn_or_identifier_to_yojson tree
let opportunity_identifiers_to_yojson tree = list_to_yojson opportunity_identifier_to_yojson tree
let task_statuses_to_yojson tree = list_to_yojson task_status_to_yojson tree

let list_tasks_sort_name_to_yojson (x : list_tasks_sort_name) =
  match x with START_TIME -> `String "StartTime"

let list_tasks_sort_base_to_yojson (x : list_tasks_sort_base) =
  assoc_to_yojson
    [
      ("SortOrder", Some (sort_order_to_yojson x.sort_order));
      ("SortBy", Some (list_tasks_sort_name_to_yojson x.sort_by));
    ]

let list_engagement_by_accepting_invitation_tasks_request_to_yojson
    (x : list_engagement_by_accepting_invitation_tasks_request) =
  assoc_to_yojson
    [
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("Sort", option_to_yojson list_tasks_sort_base_to_yojson x.sort);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("TaskStatus", option_to_yojson task_statuses_to_yojson x.task_status);
      ( "OpportunityIdentifier",
        option_to_yojson opportunity_identifiers_to_yojson x.opportunity_identifier );
      ( "EngagementInvitationIdentifier",
        option_to_yojson engagement_invitation_identifiers_to_yojson
          x.engagement_invitation_identifier );
      ("TaskIdentifier", option_to_yojson task_identifiers_to_yojson x.task_identifier);
    ]

let list_engagement_from_opportunity_task_summary_to_yojson
    (x : list_engagement_from_opportunity_task_summary) =
  assoc_to_yojson
    [
      ("TaskId", option_to_yojson task_identifier_to_yojson x.task_id);
      ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("TaskStatus", option_to_yojson task_status_to_yojson x.task_status);
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("ReasonCode", option_to_yojson reason_code_to_yojson x.reason_code);
      ("OpportunityId", option_to_yojson opportunity_identifier_to_yojson x.opportunity_id);
      ( "ResourceSnapshotJobId",
        option_to_yojson resource_snapshot_job_identifier_to_yojson x.resource_snapshot_job_id );
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
      ( "EngagementInvitationId",
        option_to_yojson engagement_invitation_identifier_to_yojson x.engagement_invitation_id );
    ]

let list_engagement_from_opportunity_task_summaries_to_yojson tree =
  list_to_yojson list_engagement_from_opportunity_task_summary_to_yojson tree

let list_engagement_from_opportunity_tasks_response_to_yojson
    (x : list_engagement_from_opportunity_tasks_response) =
  assoc_to_yojson
    [
      ( "TaskSummaries",
        option_to_yojson list_engagement_from_opportunity_task_summaries_to_yojson x.task_summaries
      );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_engagement_from_opportunity_tasks_request_to_yojson
    (x : list_engagement_from_opportunity_tasks_request) =
  assoc_to_yojson
    [
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("Sort", option_to_yojson list_tasks_sort_base_to_yojson x.sort);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("TaskStatus", option_to_yojson task_statuses_to_yojson x.task_status);
      ("TaskIdentifier", option_to_yojson task_identifiers_to_yojson x.task_identifier);
      ( "OpportunityIdentifier",
        option_to_yojson opportunity_identifiers_to_yojson x.opportunity_identifier );
      ( "EngagementIdentifier",
        option_to_yojson engagement_identifiers_to_yojson x.engagement_identifier );
    ]

let list_engagement_invitations_response_to_yojson (x : list_engagement_invitations_response) =
  assoc_to_yojson
    [
      ( "EngagementInvitationSummaries",
        option_to_yojson engagement_invitation_summaries_to_yojson x.engagement_invitation_summaries
      );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let opportunity_engagement_invitation_sort_name_to_yojson
    (x : opportunity_engagement_invitation_sort_name) =
  match x with INVITATION_DATE -> `String "InvitationDate"

let opportunity_engagement_invitation_sort_to_yojson (x : opportunity_engagement_invitation_sort) =
  assoc_to_yojson
    [
      ("SortOrder", Some (sort_order_to_yojson x.sort_order));
      ("SortBy", Some (opportunity_engagement_invitation_sort_name_to_yojson x.sort_by));
    ]

let page_size_to_yojson = int_to_yojson

let list_engagement_invitations_request_to_yojson (x : list_engagement_invitations_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("Sort", option_to_yojson opportunity_engagement_invitation_sort_to_yojson x.sort);
      ("PayloadType", option_to_yojson engagement_invitations_payload_type_to_yojson x.payload_type);
      ("ParticipantType", Some (participant_type_to_yojson x.participant_type));
      ("Status", option_to_yojson invitation_status_list_to_yojson x.status);
      ( "EngagementIdentifier",
        option_to_yojson engagement_identifiers_to_yojson x.engagement_identifier );
      ( "SenderAwsAccountId",
        option_to_yojson aws_account_id_or_alias_list_to_yojson x.sender_aws_account_id );
    ]

let list_engagement_members_response_to_yojson (x : list_engagement_members_response) =
  assoc_to_yojson
    [
      ("EngagementMemberList", Some (engagement_members_to_yojson x.engagement_member_list));
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let member_page_size_to_yojson = int_to_yojson

let list_engagement_members_request_to_yojson (x : list_engagement_members_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("Identifier", Some (engagement_arn_or_identifier_to_yojson x.identifier));
      ("MaxResults", option_to_yojson member_page_size_to_yojson x.max_results);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_engagement_resource_associations_response_to_yojson
    (x : list_engagement_resource_associations_response) =
  assoc_to_yojson
    [
      ( "EngagementResourceAssociationSummaries",
        Some
          (engagement_resource_association_summary_list_to_yojson
             x.engagement_resource_association_summaries) );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_engagement_resource_associations_request_to_yojson
    (x : list_engagement_resource_associations_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "EngagementIdentifier",
        option_to_yojson engagement_identifier_to_yojson x.engagement_identifier );
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("ResourceIdentifier", option_to_yojson resource_identifier_to_yojson x.resource_identifier);
      ("CreatedBy", option_to_yojson aws_account_to_yojson x.created_by);
    ]

let list_engagements_response_to_yojson (x : list_engagements_response) =
  assoc_to_yojson
    [
      ("EngagementSummaryList", Some (engagement_summary_list_to_yojson x.engagement_summary_list));
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_engagements_request_to_yojson (x : list_engagements_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("CreatedBy", option_to_yojson aws_account_list_to_yojson x.created_by);
      ("ExcludeCreatedBy", option_to_yojson aws_account_list_to_yojson x.exclude_created_by);
      ("ContextTypes", option_to_yojson engagement_context_type_list_to_yojson x.context_types);
      ( "ExcludeContextTypes",
        option_to_yojson engagement_context_type_list_to_yojson x.exclude_context_types );
      ("Sort", option_to_yojson engagement_sort_to_yojson x.sort);
      ("MaxResults", option_to_yojson engagement_page_size_to_yojson x.max_results);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "EngagementIdentifier",
        option_to_yojson engagement_identifiers_to_yojson x.engagement_identifier );
    ]

let project_summary_to_yojson (x : project_summary) =
  assoc_to_yojson
    [
      ("DeliveryModels", option_to_yojson delivery_models_to_yojson x.delivery_models);
      ( "ExpectedCustomerSpend",
        option_to_yojson expected_customer_spend_list_to_yojson x.expected_customer_spend );
      ( "ExpectedContractDuration",
        option_to_yojson expected_contract_duration_to_yojson x.expected_contract_duration );
    ]

let opportunity_summary_to_yojson (x : opportunity_summary) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("Id", option_to_yojson opportunity_identifier_to_yojson x.id);
      ("Arn", option_to_yojson opportunity_arn_to_yojson x.arn);
      ( "PartnerOpportunityIdentifier",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.partner_opportunity_identifier );
      ("OpportunityType", option_to_yojson opportunity_type_to_yojson x.opportunity_type);
      ("LastModifiedDate", option_to_yojson date_time_to_yojson x.last_modified_date);
      ("CreatedDate", option_to_yojson date_time_to_yojson x.created_date);
      ("LifeCycle", option_to_yojson life_cycle_summary_to_yojson x.life_cycle);
      ("Customer", option_to_yojson customer_summary_to_yojson x.customer);
      ("Project", option_to_yojson project_summary_to_yojson x.project);
    ]

let opportunity_summaries_to_yojson tree = list_to_yojson opportunity_summary_to_yojson tree

let list_opportunities_response_to_yojson (x : list_opportunities_response) =
  assoc_to_yojson
    [
      ("OpportunitySummaries", Some (opportunity_summaries_to_yojson x.opportunity_summaries));
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let target_close_date_filter_to_yojson (x : target_close_date_filter) =
  assoc_to_yojson
    [
      ("AfterTargetCloseDate", option_to_yojson date_to_yojson x.after_target_close_date);
      ("BeforeTargetCloseDate", option_to_yojson date_to_yojson x.before_target_close_date);
    ]

let opportunity_sort_name_to_yojson (x : opportunity_sort_name) =
  match x with
  | LAST_MODIFIEDDATE -> `String "LastModifiedDate"
  | IDENTIFIER -> `String "Identifier"
  | CUSTOMER_COMPANY_NAME -> `String "CustomerCompanyName"
  | CREATED_DATE -> `String "CreatedDate"
  | TARGET_CLOSE_DATE -> `String "TargetCloseDate"

let opportunity_sort_to_yojson (x : opportunity_sort) =
  assoc_to_yojson
    [
      ("SortOrder", Some (sort_order_to_yojson x.sort_order));
      ("SortBy", Some (opportunity_sort_name_to_yojson x.sort_by));
    ]

let list_opportunities_request_to_yojson (x : list_opportunities_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("Sort", option_to_yojson opportunity_sort_to_yojson x.sort);
      ("LastModifiedDate", option_to_yojson last_modified_date_to_yojson x.last_modified_date);
      ("Identifier", option_to_yojson filter_identifier_to_yojson x.identifier);
      ("LifeCycleStage", option_to_yojson filter_life_cycle_stage_to_yojson x.life_cycle_stage);
      ( "LifeCycleReviewStatus",
        option_to_yojson filter_life_cycle_review_status_to_yojson x.life_cycle_review_status );
      ("CustomerCompanyName", option_to_yojson string_list_to_yojson x.customer_company_name);
      ("CreatedDate", option_to_yojson created_date_filter_to_yojson x.created_date);
      ("TargetCloseDate", option_to_yojson target_close_date_filter_to_yojson x.target_close_date);
    ]

let list_opportunity_from_engagement_task_summary_to_yojson
    (x : list_opportunity_from_engagement_task_summary) =
  assoc_to_yojson
    [
      ("TaskId", option_to_yojson task_identifier_to_yojson x.task_id);
      ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("TaskStatus", option_to_yojson task_status_to_yojson x.task_status);
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("ReasonCode", option_to_yojson reason_code_to_yojson x.reason_code);
      ("OpportunityId", option_to_yojson opportunity_identifier_to_yojson x.opportunity_id);
      ( "ResourceSnapshotJobId",
        option_to_yojson resource_snapshot_job_identifier_to_yojson x.resource_snapshot_job_id );
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
      ("ContextId", option_to_yojson context_identifier_to_yojson x.context_id);
    ]

let list_opportunity_from_engagement_task_summaries_to_yojson tree =
  list_to_yojson list_opportunity_from_engagement_task_summary_to_yojson tree

let list_opportunity_from_engagement_tasks_response_to_yojson
    (x : list_opportunity_from_engagement_tasks_response) =
  assoc_to_yojson
    [
      ( "TaskSummaries",
        option_to_yojson list_opportunity_from_engagement_task_summaries_to_yojson x.task_summaries
      );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_opportunity_from_engagement_tasks_request_to_yojson
    (x : list_opportunity_from_engagement_tasks_request) =
  assoc_to_yojson
    [
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("Sort", option_to_yojson list_tasks_sort_base_to_yojson x.sort);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("TaskStatus", option_to_yojson task_statuses_to_yojson x.task_status);
      ("TaskIdentifier", option_to_yojson task_identifiers_to_yojson x.task_identifier);
      ( "OpportunityIdentifier",
        option_to_yojson opportunity_identifiers_to_yojson x.opportunity_identifier );
      ( "EngagementIdentifier",
        option_to_yojson engagement_identifiers_to_yojson x.engagement_identifier );
      ("ContextIdentifier", option_to_yojson context_identifiers_to_yojson x.context_identifier);
    ]

let prospecting_task_summary_to_yojson (x : prospecting_task_summary) =
  assoc_to_yojson
    [
      ("TaskId", Some (prospecting_task_identifier_to_yojson x.task_id));
      ("TaskArn", Some (prospecting_task_arn_to_yojson x.task_arn));
      ("TaskName", Some (task_name_to_yojson x.task_name));
      ("StartTime", Some (date_time_to_yojson x.start_time));
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
      ( "TotalEngagementCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.total_engagement_count) );
      ( "CompletedEngagementCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.completed_engagement_count)
      );
      ( "FailedEngagementCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.failed_engagement_count) );
    ]

let prospecting_task_summary_list_to_yojson tree =
  list_to_yojson prospecting_task_summary_to_yojson tree

let list_prospecting_from_engagement_tasks_response_to_yojson
    (x : list_prospecting_from_engagement_tasks_response) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("TaskSummaries", Some (prospecting_task_summary_list_to_yojson x.task_summaries));
    ]

let prospecting_from_engagement_task_sort_name_to_yojson
    (x : prospecting_from_engagement_task_sort_name) =
  match x with
  | StartTime -> `String "StartTime"
  | TaskName -> `String "TaskName"
  | FailedEngagementCount -> `String "FailedEngagementCount"

let prospecting_from_engagement_task_sort_to_yojson (x : prospecting_from_engagement_task_sort) =
  assoc_to_yojson
    [
      ("SortOrder", Some (sort_order_to_yojson x.sort_order));
      ("SortBy", Some (prospecting_from_engagement_task_sort_name_to_yojson x.sort_by));
    ]

let task_name_list_to_yojson tree = list_to_yojson task_name_to_yojson tree
let task_identifier_list_to_yojson tree = list_to_yojson prospecting_task_identifier_to_yojson tree

let list_prospecting_from_engagement_tasks_request_to_yojson
    (x : list_prospecting_from_engagement_tasks_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("TaskIdentifier", option_to_yojson task_identifier_list_to_yojson x.task_identifier);
      ("TaskName", option_to_yojson task_name_list_to_yojson x.task_name);
      ("StartAfter", option_to_yojson date_time_to_yojson x.start_after);
      ("StartBefore", option_to_yojson date_time_to_yojson x.start_before);
      ("Sort", option_to_yojson prospecting_from_engagement_task_sort_to_yojson x.sort);
    ]

let resource_snapshot_job_summary_to_yojson (x : resource_snapshot_job_summary) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_snapshot_job_identifier_to_yojson x.id);
      ("Arn", option_to_yojson resource_snapshot_job_arn_to_yojson x.arn);
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
      ("Status", option_to_yojson resource_snapshot_job_status_to_yojson x.status);
    ]

let resource_snapshot_job_summary_list_to_yojson tree =
  list_to_yojson resource_snapshot_job_summary_to_yojson tree

let list_resource_snapshot_jobs_response_to_yojson (x : list_resource_snapshot_jobs_response) =
  assoc_to_yojson
    [
      ( "ResourceSnapshotJobSummaries",
        Some (resource_snapshot_job_summary_list_to_yojson x.resource_snapshot_job_summaries) );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let sort_by_to_yojson (x : sort_by) = match x with CREATED_DATE -> `String "CreatedDate"

let sort_object_to_yojson (x : sort_object) =
  assoc_to_yojson
    [
      ("SortBy", option_to_yojson sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let list_resource_snapshot_jobs_request_to_yojson (x : list_resource_snapshot_jobs_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "EngagementIdentifier",
        option_to_yojson engagement_identifier_to_yojson x.engagement_identifier );
      ("Status", option_to_yojson resource_snapshot_job_status_to_yojson x.status);
      ("Sort", option_to_yojson sort_object_to_yojson x.sort);
    ]

let resource_snapshot_arn_to_yojson = string_to_yojson

let resource_snapshot_summary_to_yojson (x : resource_snapshot_summary) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson resource_snapshot_arn_to_yojson x.arn);
      ("Revision", option_to_yojson resource_snapshot_revision_to_yojson x.revision);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("ResourceId", option_to_yojson resource_identifier_to_yojson x.resource_id);
      ( "ResourceSnapshotTemplateName",
        option_to_yojson resource_template_name_to_yojson x.resource_snapshot_template_name );
      ("CreatedBy", option_to_yojson aws_account_to_yojson x.created_by);
    ]

let resource_snapshot_summary_list_to_yojson tree =
  list_to_yojson resource_snapshot_summary_to_yojson tree

let list_resource_snapshots_response_to_yojson (x : list_resource_snapshots_response) =
  assoc_to_yojson
    [
      ( "ResourceSnapshotSummaries",
        Some (resource_snapshot_summary_list_to_yojson x.resource_snapshot_summaries) );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_resource_snapshots_request_to_yojson (x : list_resource_snapshots_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("EngagementIdentifier", Some (engagement_identifier_to_yojson x.engagement_identifier));
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("ResourceIdentifier", option_to_yojson resource_identifier_to_yojson x.resource_identifier);
      ( "ResourceSnapshotTemplateIdentifier",
        option_to_yojson resource_template_name_to_yojson x.resource_snapshot_template_identifier );
      ("CreatedBy", option_to_yojson aws_account_to_yojson x.created_by);
    ]

let solution_arn_to_yojson = string_to_yojson

let solution_base_to_yojson (x : solution_base) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("Id", Some (solution_identifier_to_yojson x.id));
      ("Arn", option_to_yojson solution_arn_to_yojson x.arn);
      ("Name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
      ("Status", Some (solution_status_to_yojson x.status));
      ("Category", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.category));
      ("CreatedDate", Some (date_time_to_yojson x.created_date));
      ( "AwsMarketplaceSolutionArn",
        option_to_yojson aws_marketplace_solution_arn_to_yojson x.aws_marketplace_solution_arn );
    ]

let solution_list_to_yojson tree = list_to_yojson solution_base_to_yojson tree

let list_solutions_response_to_yojson (x : list_solutions_response) =
  assoc_to_yojson
    [
      ("SolutionSummaries", Some (solution_list_to_yojson x.solution_summaries));
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let solution_sort_name_to_yojson (x : solution_sort_name) =
  match x with
  | IDENTIFIER -> `String "Identifier"
  | NAME -> `String "Name"
  | STATUS -> `String "Status"
  | CATEGORY -> `String "Category"
  | CREATEDDATE -> `String "CreatedDate"

let solution_sort_to_yojson (x : solution_sort) =
  assoc_to_yojson
    [
      ("SortOrder", Some (sort_order_to_yojson x.sort_order));
      ("SortBy", Some (solution_sort_name_to_yojson x.sort_by));
    ]

let list_solutions_request_to_yojson (x : list_solutions_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("Sort", option_to_yojson solution_sort_to_yojson x.sort);
      ("Status", option_to_yojson filter_status_to_yojson x.status);
      ("Identifier", option_to_yojson solution_identifiers_to_yojson x.identifier);
      ("Category", option_to_yojson string_list_to_yojson x.category);
      ( "AwsMarketplaceSolutionArn",
        option_to_yojson aws_marketplace_solution_arn_list_to_yojson x.aws_marketplace_solution_arn
      );
    ]

let reject_engagement_invitation_request_to_yojson (x : reject_engagement_invitation_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("Identifier", Some (engagement_invitation_arn_or_identifier_to_yojson x.identifier));
      ("RejectionReason", option_to_yojson rejection_reason_string_to_yojson x.rejection_reason);
    ]

let start_engagement_by_accepting_invitation_task_response_to_yojson
    (x : start_engagement_by_accepting_invitation_task_response) =
  assoc_to_yojson
    [
      ("TaskId", option_to_yojson task_identifier_to_yojson x.task_id);
      ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("TaskStatus", option_to_yojson task_status_to_yojson x.task_status);
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("ReasonCode", option_to_yojson reason_code_to_yojson x.reason_code);
      ("OpportunityId", option_to_yojson opportunity_identifier_to_yojson x.opportunity_id);
      ( "ResourceSnapshotJobId",
        option_to_yojson resource_snapshot_job_identifier_to_yojson x.resource_snapshot_job_id );
      ( "EngagementInvitationId",
        option_to_yojson engagement_invitation_identifier_to_yojson x.engagement_invitation_id );
    ]

let start_engagement_by_accepting_invitation_task_request_to_yojson
    (x : start_engagement_by_accepting_invitation_task_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Identifier", Some (engagement_invitation_arn_or_identifier_to_yojson x.identifier));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let start_engagement_from_opportunity_task_response_to_yojson
    (x : start_engagement_from_opportunity_task_response) =
  assoc_to_yojson
    [
      ("TaskId", option_to_yojson task_identifier_to_yojson x.task_id);
      ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("TaskStatus", option_to_yojson task_status_to_yojson x.task_status);
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("ReasonCode", option_to_yojson reason_code_to_yojson x.reason_code);
      ("OpportunityId", option_to_yojson opportunity_identifier_to_yojson x.opportunity_id);
      ( "ResourceSnapshotJobId",
        option_to_yojson resource_snapshot_job_identifier_to_yojson x.resource_snapshot_job_id );
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
      ( "EngagementInvitationId",
        option_to_yojson engagement_invitation_identifier_to_yojson x.engagement_invitation_id );
    ]

let start_engagement_from_opportunity_task_request_to_yojson
    (x : start_engagement_from_opportunity_task_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Identifier", Some (opportunity_identifier_to_yojson x.identifier));
      ("AwsSubmission", Some (aws_submission_to_yojson x.aws_submission));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let start_opportunity_from_engagement_task_response_to_yojson
    (x : start_opportunity_from_engagement_task_response) =
  assoc_to_yojson
    [
      ("TaskId", option_to_yojson task_identifier_to_yojson x.task_id);
      ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("TaskStatus", option_to_yojson task_status_to_yojson x.task_status);
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("ReasonCode", option_to_yojson reason_code_to_yojson x.reason_code);
      ("OpportunityId", option_to_yojson opportunity_identifier_to_yojson x.opportunity_id);
      ( "ResourceSnapshotJobId",
        option_to_yojson resource_snapshot_job_identifier_to_yojson x.resource_snapshot_job_id );
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
      ("ContextId", option_to_yojson context_identifier_to_yojson x.context_id);
    ]

let start_opportunity_from_engagement_task_request_to_yojson
    (x : start_opportunity_from_engagement_task_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Identifier", Some (engagement_arn_or_identifier_to_yojson x.identifier));
      ("ContextIdentifier", Some (context_identifier_to_yojson x.context_identifier));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let start_prospecting_from_engagement_task_response_to_yojson
    (x : start_prospecting_from_engagement_task_response) =
  assoc_to_yojson
    [
      ("Identifiers", Some (engagement_identifier_list_to_yojson x.identifiers));
      ("TaskName", Some (task_name_to_yojson x.task_name));
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ( "ReasonCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reason_code );
      ("StartTime", Some (date_time_to_yojson x.start_time));
      ("TaskId", option_to_yojson prospecting_task_identifier_to_yojson x.task_id);
      ("TaskArn", option_to_yojson prospecting_task_arn_to_yojson x.task_arn);
      ("TaskStatus", Some (prospecting_task_status_to_yojson x.task_status));
    ]

let start_prospecting_from_engagement_task_request_to_yojson
    (x : start_prospecting_from_engagement_task_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("Identifiers", Some (engagement_identifier_list_to_yojson x.identifiers));
      ("TaskName", Some (task_name_to_yojson x.task_name));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
    ]

let start_resource_snapshot_job_request_to_yojson (x : start_resource_snapshot_job_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ( "ResourceSnapshotJobIdentifier",
        Some (resource_snapshot_job_identifier_to_yojson x.resource_snapshot_job_identifier) );
    ]

let stop_resource_snapshot_job_request_to_yojson (x : stop_resource_snapshot_job_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ( "ResourceSnapshotJobIdentifier",
        Some (resource_snapshot_job_identifier_to_yojson x.resource_snapshot_job_identifier) );
    ]

let submit_opportunity_request_to_yojson (x : submit_opportunity_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("Identifier", Some (opportunity_identifier_to_yojson x.identifier));
      ("InvolvementType", Some (sales_involvement_type_to_yojson x.involvement_type));
      ("Visibility", option_to_yojson visibility_to_yojson x.visibility);
    ]

let update_opportunity_response_to_yojson (x : update_opportunity_response) =
  assoc_to_yojson
    [
      ("Id", Some (opportunity_identifier_to_yojson x.id));
      ("LastModifiedDate", Some (date_time_to_yojson x.last_modified_date));
    ]

let update_opportunity_request_to_yojson (x : update_opportunity_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ( "PrimaryNeedsFromAws",
        option_to_yojson primary_needs_from_aws_to_yojson x.primary_needs_from_aws );
      ("NationalSecurity", option_to_yojson national_security_to_yojson x.national_security);
      ( "PartnerOpportunityIdentifier",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.partner_opportunity_identifier );
      ("Customer", option_to_yojson customer_to_yojson x.customer);
      ("Project", option_to_yojson project_to_yojson x.project);
      ("OpportunityType", option_to_yojson opportunity_type_to_yojson x.opportunity_type);
      ("Marketing", option_to_yojson marketing_to_yojson x.marketing);
      ("SoftwareRevenue", option_to_yojson software_revenue_to_yojson x.software_revenue);
      ("LastModifiedDate", Some (date_time_to_yojson x.last_modified_date));
      ("Identifier", Some (opportunity_identifier_to_yojson x.identifier));
      ("LifeCycle", option_to_yojson life_cycle_to_yojson x.life_cycle);
    ]
