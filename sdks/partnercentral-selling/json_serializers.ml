open Smaws_Lib.Json.SerializeHelpers
open Types

let website_url_to_yojson = string_to_yojson

let visibility_to_yojson (x : visibility) =
  match x with LIMITED -> `String "Limited" | FULL -> `String "Full"

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | BUSINESS_VALIDATION_FAILED -> `String "BUSINESS_VALIDATION_FAILED"
  | REQUEST_VALIDATION_FAILED -> `String "REQUEST_VALIDATION_FAILED"

let validation_exception_error_code_to_yojson (x : validation_exception_error_code) =
  match x with
  | ACTION_NOT_PERMITTED -> `String "ACTION_NOT_PERMITTED"
  | VALUE_OUT_OF_RANGE -> `String "VALUE_OUT_OF_RANGE"
  | DUPLICATE_KEY_VALUE -> `String "DUPLICATE_KEY_VALUE"
  | INVALID_RESOURCE_STATE -> `String "INVALID_RESOURCE_STATE"
  | TOO_MANY_VALUES -> `String "TOO_MANY_VALUES"
  | NOT_ENOUGH_VALUES -> `String "NOT_ENOUGH_VALUES"
  | INVALID_VALUE -> `String "INVALID_VALUE"
  | INVALID_STRING_FORMAT -> `String "INVALID_STRING_FORMAT"
  | INVALID_ENUM_VALUE -> `String "INVALID_ENUM_VALUE"
  | REQUIRED_FIELD_MISSING -> `String "REQUIRED_FIELD_MISSING"

let validation_exception_error_to_yojson (x : validation_exception_error) =
  assoc_to_yojson
    [
      ("Code", Some (validation_exception_error_code_to_yojson x.code));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ( "FieldName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.field_name );
    ]

let validation_exception_error_list_to_yojson tree =
  list_to_yojson validation_exception_error_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("ErrorList", option_to_yojson validation_exception_error_list_to_yojson x.error_list);
      ("Reason", Some (validation_exception_reason_to_yojson x.reason));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let use_cases_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let opportunity_identifier_to_yojson = string_to_yojson
let date_time_to_yojson = timestamp_iso_8601_to_yojson

let update_opportunity_response_to_yojson (x : update_opportunity_response) =
  assoc_to_yojson
    [
      ("LastModifiedDate", Some (date_time_to_yojson x.last_modified_date));
      ("Id", Some (opportunity_identifier_to_yojson x.id));
    ]

let catalog_identifier_to_yojson = string_to_yojson

let primary_need_from_aws_to_yojson (x : primary_need_from_aws) =
  match x with
  | CO_SELL_SUPPORT_FOR_PUBLIC_TENDER_RFX -> `String "Co-Sell - Support for Public Tender / RFx"
  | CO_SELL_DEAL_SUPPORT -> `String "Co-Sell - Deal Support"
  | CO_SELL_TOTAL_COST_OF_OWNERSHIP_EVALUATION ->
      `String "Co-Sell - Total Cost of Ownership Evaluation"
  | CO_SELL_TECHNICAL_CONSULTATION -> `String "Co-Sell - Technical Consultation"
  | CO_SELL_PRICING_ASSISTANCE -> `String "Co-Sell - Pricing Assistance"
  | CO_SELL_COMPETITIVE_INFORMATION -> `String "Co-Sell - Competitive Information"
  | CO_SELL_BUSINESS_PRESENTATION -> `String "Co-Sell - Business Presentation"
  | CO_SELL_ARCHITECTURAL_VALIDATION -> `String "Co-Sell - Architectural Validation"

let primary_needs_from_aws_to_yojson tree = list_to_yojson primary_need_from_aws_to_yojson tree

let national_security_to_yojson (x : national_security) =
  match x with NO -> `String "No" | YES -> `String "Yes"

let industry_to_yojson (x : industry) =
  match x with
  | OTHER -> `String "Other"
  | WHOLESALE_DISTRIBUTION -> `String "Wholesale and Distribution"
  | TRAVEL -> `String "Travel"
  | TRANSPORTATION_LOGISTICS -> `String "Transportation and Logistics"
  | TELECOMMUNICATIONS -> `String "Telecommunications"
  | SOFTWARE_INTERNET -> `String "Software and Internet"
  | RETAIL -> `String "Retail"
  | REALESTATE_CONSTRUCTION -> `String "Real Estate and Construction"
  | PROFESSIONAL_SERVICES -> `String "Professional Services"
  | NON_PROFIT_ORGANIZATION -> `String "Non-Profit Organization"
  | MINING -> `String "Mining"
  | MEDIA_ENTERTAINMENT -> `String "Media and Entertainment"
  | MARKETING_ADVERTISING -> `String "Marketing and Advertising"
  | MANUFACTURING -> `String "Manufacturing"
  | LIFE_SCIENCES -> `String "Life Sciences"
  | HOSPITALITY -> `String "Hospitality"
  | HEALTHCARE -> `String "Healthcare"
  | GOVERNMENT -> `String "Government"
  | GAMING -> `String "Gaming"
  | FINANCIAL_SERVICES -> `String "Financial Services"
  | ENERGY_POWER_UTILITIES -> `String "Energy - Power and Utilities"
  | ENERGY_OIL_GAS -> `String "Energy - Oil and Gas"
  | EDUCATION -> `String "Education"
  | CONSUMER_GOODS -> `String "Consumer Goods"
  | COMPUTERS_ELECTRONICS -> `String "Computers and Electronics"
  | AUTOMOTIVE -> `String "Automotive"
  | AGRICULTURE -> `String "Agriculture"
  | AEROSPACE_SATELLITE -> `String "Aerospace"

let name_to_yojson = string_to_yojson
let aws_account_to_yojson = string_to_yojson
let address_part_to_yojson = string_to_yojson

let country_code_to_yojson (x : country_code) =
  match x with
  | ZW -> `String "ZW"
  | ZM -> `String "ZM"
  | YE -> `String "YE"
  | EH -> `String "EH"
  | WF -> `String "WF"
  | VI -> `String "VI"
  | VG -> `String "VG"
  | VN -> `String "VN"
  | VE -> `String "VE"
  | VU -> `String "VU"
  | UZ -> `String "UZ"
  | UY -> `String "UY"
  | UM -> `String "UM"
  | GB -> `String "GB"
  | AE -> `String "AE"
  | UA -> `String "UA"
  | UG -> `String "UG"
  | TV -> `String "TV"
  | TC -> `String "TC"
  | TM -> `String "TM"
  | TR -> `String "TR"
  | TN -> `String "TN"
  | TT -> `String "TT"
  | TO -> `String "TO"
  | TK -> `String "TK"
  | TG -> `String "TG"
  | TL -> `String "TL"
  | TH -> `String "TH"
  | TZ -> `String "TZ"
  | TJ -> `String "TJ"
  | TW -> `String "TW"
  | SY -> `String "SY"
  | CH -> `String "CH"
  | SE -> `String "SE"
  | SZ -> `String "SZ"
  | SJ -> `String "SJ"
  | SR -> `String "SR"
  | SD -> `String "SD"
  | LK -> `String "LK"
  | ES -> `String "ES"
  | SS -> `String "SS"
  | GS -> `String "GS"
  | ZA -> `String "ZA"
  | SO -> `String "SO"
  | SB -> `String "SB"
  | SI -> `String "SI"
  | SK -> `String "SK"
  | SX -> `String "SX"
  | SG -> `String "SG"
  | SL -> `String "SL"
  | SC -> `String "SC"
  | RS -> `String "RS"
  | SN -> `String "SN"
  | SA -> `String "SA"
  | ST -> `String "ST"
  | SM -> `String "SM"
  | WS -> `String "WS"
  | VC -> `String "VC"
  | PM -> `String "PM"
  | MF -> `String "MF"
  | LC -> `String "LC"
  | KN -> `String "KN"
  | SH -> `String "SH"
  | BL -> `String "BL"
  | RW -> `String "RW"
  | RU -> `String "RU"
  | RO -> `String "RO"
  | RE -> `String "RE"
  | QA -> `String "QA"
  | PR -> `String "PR"
  | PT -> `String "PT"
  | PL -> `String "PL"
  | PN -> `String "PN"
  | PH -> `String "PH"
  | PE -> `String "PE"
  | PY -> `String "PY"
  | PG -> `String "PG"
  | PA -> `String "PA"
  | PS -> `String "PS"
  | PW -> `String "PW"
  | PK -> `String "PK"
  | OM -> `String "OM"
  | NO -> `String "NO"
  | MP -> `String "MP"
  | NF -> `String "NF"
  | NU -> `String "NU"
  | NG -> `String "NG"
  | NE -> `String "NE"
  | NI -> `String "NI"
  | NZ -> `String "NZ"
  | NC -> `String "NC"
  | AN -> `String "AN"
  | NL -> `String "NL"
  | NP -> `String "NP"
  | NR -> `String "NR"
  | NA -> `String "NA"
  | MM -> `String "MM"
  | MZ -> `String "MZ"
  | MA -> `String "MA"
  | MS -> `String "MS"
  | ME -> `String "ME"
  | MN -> `String "MN"
  | MC -> `String "MC"
  | MD -> `String "MD"
  | FM -> `String "FM"
  | MX -> `String "MX"
  | YT -> `String "YT"
  | MU -> `String "MU"
  | MR -> `String "MR"
  | MQ -> `String "MQ"
  | MH -> `String "MH"
  | MT -> `String "MT"
  | ML -> `String "ML"
  | MV -> `String "MV"
  | MY -> `String "MY"
  | MW -> `String "MW"
  | MG -> `String "MG"
  | MK -> `String "MK"
  | MO -> `String "MO"
  | LU -> `String "LU"
  | LT -> `String "LT"
  | LI -> `String "LI"
  | LY -> `String "LY"
  | LR -> `String "LR"
  | LS -> `String "LS"
  | LB -> `String "LB"
  | LV -> `String "LV"
  | LA -> `String "LA"
  | KG -> `String "KG"
  | KW -> `String "KW"
  | KR -> `String "KR"
  | KI -> `String "KI"
  | KE -> `String "KE"
  | KZ -> `String "KZ"
  | JO -> `String "JO"
  | JE -> `String "JE"
  | JP -> `String "JP"
  | JM -> `String "JM"
  | IT -> `String "IT"
  | IL -> `String "IL"
  | IM -> `String "IM"
  | IE -> `String "IE"
  | IQ -> `String "IQ"
  | IR -> `String "IR"
  | ID -> `String "ID"
  | IN -> `String "IN"
  | IS -> `String "IS"
  | HU -> `String "HU"
  | HK -> `String "HK"
  | HN -> `String "HN"
  | VA -> `String "VA"
  | HM -> `String "HM"
  | HT -> `String "HT"
  | GY -> `String "GY"
  | GW -> `String "GW"
  | GN -> `String "GN"
  | GG -> `String "GG"
  | GT -> `String "GT"
  | GU -> `String "GU"
  | GP -> `String "GP"
  | GD -> `String "GD"
  | GL -> `String "GL"
  | GR -> `String "GR"
  | GI -> `String "GI"
  | GH -> `String "GH"
  | DE -> `String "DE"
  | GE -> `String "GE"
  | GM -> `String "GM"
  | GA -> `String "GA"
  | TF -> `String "TF"
  | PF -> `String "PF"
  | GF -> `String "GF"
  | FR -> `String "FR"
  | FI -> `String "FI"
  | FJ -> `String "FJ"
  | FO -> `String "FO"
  | FK -> `String "FK"
  | ET -> `String "ET"
  | EE -> `String "EE"
  | ER -> `String "ER"
  | GQ -> `String "GQ"
  | SV -> `String "SV"
  | EG -> `String "EG"
  | EC -> `String "EC"
  | DO -> `String "DO"
  | DM -> `String "DM"
  | DJ -> `String "DJ"
  | DK -> `String "DK"
  | CD -> `String "CD"
  | CZ -> `String "CZ"
  | CY -> `String "CY"
  | CW -> `String "CW"
  | CU -> `String "CU"
  | HR -> `String "HR"
  | CI -> `String "CI"
  | CR -> `String "CR"
  | CK -> `String "CK"
  | CG -> `String "CG"
  | KM -> `String "KM"
  | CO -> `String "CO"
  | CC -> `String "CC"
  | CX -> `String "CX"
  | CN -> `String "CN"
  | CL -> `String "CL"
  | TD -> `String "TD"
  | CF -> `String "CF"
  | KY -> `String "KY"
  | CV -> `String "CV"
  | CA -> `String "CA"
  | CM -> `String "CM"
  | KH -> `String "KH"
  | BI -> `String "BI"
  | BF -> `String "BF"
  | BG -> `String "BG"
  | BN -> `String "BN"
  | IO -> `String "IO"
  | BR -> `String "BR"
  | BV -> `String "BV"
  | BW -> `String "BW"
  | BA -> `String "BA"
  | BQ -> `String "BQ"
  | BO -> `String "BO"
  | BT -> `String "BT"
  | BM -> `String "BM"
  | BJ -> `String "BJ"
  | BZ -> `String "BZ"
  | BE -> `String "BE"
  | BY -> `String "BY"
  | BB -> `String "BB"
  | BD -> `String "BD"
  | BH -> `String "BH"
  | BS -> `String "BS"
  | AZ -> `String "AZ"
  | AT -> `String "AT"
  | AU -> `String "AU"
  | AW -> `String "AW"
  | AM -> `String "AM"
  | AR -> `String "AR"
  | AG -> `String "AG"
  | AQ -> `String "AQ"
  | AI -> `String "AI"
  | AO -> `String "AO"
  | AD -> `String "AD"
  | AS -> `String "AS"
  | DZ -> `String "DZ"
  | AL -> `String "AL"
  | AX -> `String "AX"
  | AF -> `String "AF"
  | US -> `String "US"

let address_to_yojson (x : address) =
  assoc_to_yojson
    [
      ("StreetAddress", option_to_yojson address_part_to_yojson x.street_address);
      ("CountryCode", option_to_yojson country_code_to_yojson x.country_code);
      ("StateOrRegion", option_to_yojson address_part_to_yojson x.state_or_region);
      ("PostalCode", option_to_yojson address_part_to_yojson x.postal_code);
      ("City", option_to_yojson address_part_to_yojson x.city);
    ]

let duns_number_to_yojson = string_to_yojson

let account_to_yojson (x : account) =
  assoc_to_yojson
    [
      ("Duns", option_to_yojson duns_number_to_yojson x.duns);
      ("Address", option_to_yojson address_to_yojson x.address);
      ("AwsAccountId", option_to_yojson aws_account_to_yojson x.aws_account_id);
      ("WebsiteUrl", option_to_yojson website_url_to_yojson x.website_url);
      ("CompanyName", Some (name_to_yojson x.company_name));
      ( "OtherIndustry",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.other_industry );
      ("Industry", option_to_yojson industry_to_yojson x.industry);
    ]

let email_to_yojson = string_to_yojson
let job_title_to_yojson = string_to_yojson
let phone_number_to_yojson = string_to_yojson

let contact_to_yojson (x : contact) =
  assoc_to_yojson
    [
      ("Phone", option_to_yojson phone_number_to_yojson x.phone);
      ("BusinessTitle", option_to_yojson job_title_to_yojson x.business_title);
      ("LastName", option_to_yojson name_to_yojson x.last_name);
      ("FirstName", option_to_yojson name_to_yojson x.first_name);
      ("Email", option_to_yojson email_to_yojson x.email);
    ]

let customer_contacts_list_to_yojson tree = list_to_yojson contact_to_yojson tree

let customer_to_yojson (x : customer) =
  assoc_to_yojson
    [
      ("Contacts", option_to_yojson customer_contacts_list_to_yojson x.contacts);
      ("Account", option_to_yojson account_to_yojson x.account);
    ]

let delivery_model_to_yojson (x : delivery_model) =
  match x with
  | OTHER -> `String "Other"
  | RESELL -> `String "Resell"
  | PROFESSIONAL_SERVICES -> `String "Professional Services"
  | MANAGED_SERVICES -> `String "Managed Services"
  | BYOL_OR_AMI -> `String "BYOL or AMI"
  | SAAS_OR_PAAS -> `String "SaaS or PaaS"

let delivery_models_to_yojson tree = list_to_yojson delivery_model_to_yojson tree
let amount_to_yojson = string_to_yojson

let currency_code_to_yojson (x : currency_code) =
  match x with
  | ZWL -> `String "ZWL"
  | ZMW -> `String "ZMW"
  | ZAR -> `String "ZAR"
  | YER -> `String "YER"
  | XUA -> `String "XUA"
  | XSU -> `String "XSU"
  | XPF -> `String "XPF"
  | XOF -> `String "XOF"
  | XDR -> `String "XDR"
  | XCD -> `String "XCD"
  | XAF -> `String "XAF"
  | WST -> `String "WST"
  | VUV -> `String "VUV"
  | VND -> `String "VND"
  | VEF -> `String "VEF"
  | UZS -> `String "UZS"
  | UYU -> `String "UYU"
  | UYI -> `String "UYI"
  | USN -> `String "USN"
  | UGX -> `String "UGX"
  | UAH -> `String "UAH"
  | TZS -> `String "TZS"
  | TWD -> `String "TWD"
  | TTD -> `String "TTD"
  | TRY -> `String "TRY"
  | TOP -> `String "TOP"
  | TND -> `String "TND"
  | TMT -> `String "TMT"
  | TJS -> `String "TJS"
  | THB -> `String "THB"
  | SZL -> `String "SZL"
  | SYP -> `String "SYP"
  | SVC -> `String "SVC"
  | STN -> `String "STN"
  | SSP -> `String "SSP"
  | SRD -> `String "SRD"
  | SOS -> `String "SOS"
  | SLL -> `String "SLL"
  | SHP -> `String "SHP"
  | SGD -> `String "SGD"
  | SDG -> `String "SDG"
  | SCR -> `String "SCR"
  | SBD -> `String "SBD"
  | SAR -> `String "SAR"
  | RWF -> `String "RWF"
  | RUB -> `String "RUB"
  | RSD -> `String "RSD"
  | RON -> `String "RON"
  | QAR -> `String "QAR"
  | PYG -> `String "PYG"
  | PLN -> `String "PLN"
  | PKR -> `String "PKR"
  | PHP -> `String "PHP"
  | PGK -> `String "PGK"
  | PEN -> `String "PEN"
  | PAB -> `String "PAB"
  | OMR -> `String "OMR"
  | NPR -> `String "NPR"
  | NOK -> `String "NOK"
  | NIO -> `String "NIO"
  | NGN -> `String "NGN"
  | NAD -> `String "NAD"
  | MZN -> `String "MZN"
  | MYR -> `String "MYR"
  | MXV -> `String "MXV"
  | MXN -> `String "MXN"
  | MWK -> `String "MWK"
  | MVR -> `String "MVR"
  | MUR -> `String "MUR"
  | MRU -> `String "MRU"
  | MOP -> `String "MOP"
  | MNT -> `String "MNT"
  | MMK -> `String "MMK"
  | MKD -> `String "MKD"
  | MGA -> `String "MGA"
  | MDL -> `String "MDL"
  | MAD -> `String "MAD"
  | LYD -> `String "LYD"
  | LSL -> `String "LSL"
  | LRD -> `String "LRD"
  | LKR -> `String "LKR"
  | LBP -> `String "LBP"
  | LAK -> `String "LAK"
  | KZT -> `String "KZT"
  | KYD -> `String "KYD"
  | KWD -> `String "KWD"
  | KRW -> `String "KRW"
  | KPW -> `String "KPW"
  | KMF -> `String "KMF"
  | KHR -> `String "KHR"
  | KGS -> `String "KGS"
  | KES -> `String "KES"
  | JOD -> `String "JOD"
  | JMD -> `String "JMD"
  | ISK -> `String "ISK"
  | IRR -> `String "IRR"
  | IQD -> `String "IQD"
  | ILS -> `String "ILS"
  | IDR -> `String "IDR"
  | HUF -> `String "HUF"
  | HTG -> `String "HTG"
  | HRK -> `String "HRK"
  | HNL -> `String "HNL"
  | HKD -> `String "HKD"
  | GYD -> `String "GYD"
  | GTQ -> `String "GTQ"
  | GNF -> `String "GNF"
  | GMD -> `String "GMD"
  | GIP -> `String "GIP"
  | GHS -> `String "GHS"
  | GEL -> `String "GEL"
  | FKP -> `String "FKP"
  | FJD -> `String "FJD"
  | ETB -> `String "ETB"
  | ERN -> `String "ERN"
  | EGP -> `String "EGP"
  | DZD -> `String "DZD"
  | DOP -> `String "DOP"
  | DKK -> `String "DKK"
  | DJF -> `String "DJF"
  | CZK -> `String "CZK"
  | CVE -> `String "CVE"
  | CUP -> `String "CUP"
  | CUC -> `String "CUC"
  | CRC -> `String "CRC"
  | COU -> `String "COU"
  | COP -> `String "COP"
  | CLP -> `String "CLP"
  | CLF -> `String "CLF"
  | CHW -> `String "CHW"
  | CHE -> `String "CHE"
  | CDF -> `String "CDF"
  | BZD -> `String "BZD"
  | BYN -> `String "BYN"
  | BWP -> `String "BWP"
  | BTN -> `String "BTN"
  | BSD -> `String "BSD"
  | BRL -> `String "BRL"
  | BOV -> `String "BOV"
  | BOB -> `String "BOB"
  | BND -> `String "BND"
  | BMD -> `String "BMD"
  | BIF -> `String "BIF"
  | BHD -> `String "BHD"
  | BGN -> `String "BGN"
  | BDT -> `String "BDT"
  | BBD -> `String "BBD"
  | BAM -> `String "BAM"
  | AZN -> `String "AZN"
  | AWG -> `String "AWG"
  | ARS -> `String "ARS"
  | AOA -> `String "AOA"
  | ANG -> `String "ANG"
  | AMD -> `String "AMD"
  | ALL -> `String "ALL"
  | AFN -> `String "AFN"
  | AED -> `String "AED"
  | SEK -> `String "SEK"
  | CHF -> `String "CHF"
  | JPY -> `String "JPY"
  | INR -> `String "INR"
  | NZD -> `String "NZD"
  | CNY -> `String "CNY"
  | CAD -> `String "CAD"
  | AUD -> `String "AUD"
  | GBP -> `String "GBP"
  | EUR -> `String "EUR"
  | USD -> `String "USD"

let payment_frequency_to_yojson (x : payment_frequency) =
  match x with MONTHLY -> `String "Monthly"

let estimation_url_to_yojson = string_to_yojson

let expected_customer_spend_to_yojson (x : expected_customer_spend) =
  assoc_to_yojson
    [
      ("EstimationUrl", option_to_yojson estimation_url_to_yojson x.estimation_url);
      ( "TargetCompany",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.target_company) );
      ("Frequency", Some (payment_frequency_to_yojson x.frequency));
      ("CurrencyCode", Some (currency_code_to_yojson x.currency_code));
      ("Amount", option_to_yojson amount_to_yojson x.amount);
    ]

let expected_customer_spend_list_to_yojson tree =
  list_to_yojson expected_customer_spend_to_yojson tree

let expected_contract_duration_term_to_yojson (x : expected_contract_duration_term) =
  match x with MONTHS -> `String "Months"

let expected_contract_duration_to_yojson (x : expected_contract_duration) =
  assoc_to_yojson
    [
      ("Value", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.value));
      ("Term", Some (expected_contract_duration_term_to_yojson x.term));
    ]

let pii_string_to_yojson = string_to_yojson

let apn_programs_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let sales_activity_to_yojson (x : sales_activity) =
  match x with
  | SOW_SIGNED -> `String "SOW Signed"
  | FINALIZED_DEPLOYMENT_NEEDS -> `String "Finalized Deployment Need"
  | COMPLETED_ACTION_PLAN -> `String "Completed Action Plan"
  | AGREED_ON_SOLUTION_TO_BUSINESS_PROBLEM -> `String "Agreed on solution to Business Problem"
  | IN_EVALUATION_PLANNING_STAGE -> `String "In evaluation / planning stage"
  | CONDUCTED_POC_DEMO -> `String "Conducted POC / Demo"
  | CUSTOMER_HAS_SHOWN_INTEREST -> `String "Customer has shown interest in solution"
  | INITIALIZED_DISCUSSIONS_WITH_CUSTOMER -> `String "Initialized discussions with customer"

let sales_activities_to_yojson tree = list_to_yojson sales_activity_to_yojson tree

let competitor_name_to_yojson (x : competitor_name) =
  match x with
  | OTHER -> `String "*Other"
  | NO_COMPETITION -> `String "No Competition"
  | OTHER_COST_OPTIMIZATION -> `String "Other- Cost Optimization"
  | MICROSOFT_AZURE -> `String "Microsoft Azure"
  | IBM_SOFTLAYER -> `String "IBM Softlayer"
  | GOOGLE_CLOUD_PLATFORM -> `String "Google Cloud Platform"
  | ALICLOUD -> `String "AliCloud"
  | AKAMAI -> `String "Akamai"
  | CO_LOCATION -> `String "Co-location"
  | ON_PREM -> `String "On-Prem"
  | ORACLE_CLOUD -> `String "Oracle Cloud"

let aws_partition_to_yojson (x : aws_partition) = match x with AWS_EUSC -> `String "aws-eusc"

let project_to_yojson (x : project) =
  assoc_to_yojson
    [
      ("AwsPartition", option_to_yojson aws_partition_to_yojson x.aws_partition);
      ( "AdditionalComments",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.additional_comments );
      ( "OtherSolutionDescription",
        option_to_yojson pii_string_to_yojson x.other_solution_description );
      ( "OtherCompetitorNames",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.other_competitor_names );
      ("CompetitorName", option_to_yojson competitor_name_to_yojson x.competitor_name);
      ("SalesActivities", option_to_yojson sales_activities_to_yojson x.sales_activities);
      ( "RelatedOpportunityIdentifier",
        option_to_yojson opportunity_identifier_to_yojson x.related_opportunity_identifier );
      ( "CustomerUseCase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.customer_use_case
      );
      ("CustomerBusinessProblem", option_to_yojson pii_string_to_yojson x.customer_business_problem);
      ("ApnPrograms", option_to_yojson apn_programs_to_yojson x.apn_programs);
      ("Title", option_to_yojson pii_string_to_yojson x.title);
      ( "ExpectedContractDuration",
        option_to_yojson expected_contract_duration_to_yojson x.expected_contract_duration );
      ( "ExpectedCustomerSpend",
        option_to_yojson expected_customer_spend_list_to_yojson x.expected_customer_spend );
      ("DeliveryModels", option_to_yojson delivery_models_to_yojson x.delivery_models);
    ]

let opportunity_type_to_yojson (x : opportunity_type) =
  match x with
  | EXPANSION -> `String "Expansion"
  | FLAT_RENEWAL -> `String "Flat Renewal"
  | NET_NEW_BUSINESS -> `String "Net New Business"

let marketing_source_to_yojson (x : marketing_source) =
  match x with NONE -> `String "None" | MARKETING_ACTIVITY -> `String "Marketing Activity"

let channel_to_yojson (x : channel) =
  match x with
  | VIRTUAL_EVENT -> `String "Virtual Event"
  | VIDEO -> `String "Video"
  | TV -> `String "TV"
  | TELEMARKETING -> `String "Telemarketing"
  | SOCIAL -> `String "Social"
  | SEARCH -> `String "Search"
  | PRINT -> `String "Print"
  | OUT_OF_HOME -> `String "Out Of Home (OOH)"
  | LIVE_EVENT -> `String "Live Event"
  | EMAIL -> `String "Email"
  | DISPLAY -> `String "Display"
  | CONTENT_SYNDICATION -> `String "Content Syndication"
  | AWS_MARKETING_CENTRAL -> `String "AWS Marketing Central"

let channels_to_yojson tree = list_to_yojson channel_to_yojson tree

let aws_funding_used_to_yojson (x : aws_funding_used) =
  match x with NO -> `String "No" | YES -> `String "Yes"

let marketing_to_yojson (x : marketing) =
  assoc_to_yojson
    [
      ("AwsFundingUsed", option_to_yojson aws_funding_used_to_yojson x.aws_funding_used);
      ("Channels", option_to_yojson channels_to_yojson x.channels);
      ("UseCases", option_to_yojson use_cases_to_yojson x.use_cases);
      ("Source", option_to_yojson marketing_source_to_yojson x.source);
      ( "CampaignName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.campaign_name );
    ]

let revenue_model_to_yojson (x : revenue_model) =
  match x with
  | SUBSCRIPTION -> `String "Subscription"
  | PAY_AS_YOU_GO -> `String "Pay-as-you-go"
  | CONTRACT -> `String "Contract"

let monetary_value_to_yojson (x : monetary_value) =
  assoc_to_yojson
    [
      ("CurrencyCode", Some (currency_code_to_yojson x.currency_code));
      ("Amount", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.amount));
    ]

let date_to_yojson = string_to_yojson

let software_revenue_to_yojson (x : software_revenue) =
  assoc_to_yojson
    [
      ("ExpirationDate", option_to_yojson date_to_yojson x.expiration_date);
      ("EffectiveDate", option_to_yojson date_to_yojson x.effective_date);
      ("Value", option_to_yojson monetary_value_to_yojson x.value);
      ("DeliveryModel", option_to_yojson revenue_model_to_yojson x.delivery_model);
    ]

let stage_to_yojson (x : stage) =
  match x with
  | CLOSED_LOST -> `String "Closed Lost"
  | LAUNCHED -> `String "Launched"
  | COMMITTED -> `String "Committed"
  | BUSINESS_VALIDATION -> `String "Business Validation"
  | TECHNICAL_VALIDATION -> `String "Technical Validation"
  | QUALIFIED -> `String "Qualified"
  | PROSPECT -> `String "Prospect"

let closed_lost_reason_to_yojson (x : closed_lost_reason) =
  match x with
  | FINANCIALCOMMERCIAL -> `String "Financial/Commercial"
  | PRODUCTTECHNOLOGY -> `String "Product/Technology"
  | PEOPLERELATIONSHIPGOVERNANCE -> `String "People/Relationship/Governance"
  | OTHER -> `String "Other"
  | CUSTOMER_EXPERIENCE -> `String "Customer Experience"
  | TECHNICAL_LIMITATIONS -> `String "Technical Limitations"
  | SECURITY_COMPLIANCE -> `String "Security / Compliance"
  | PRICE -> `String "Price"
  | PARTNER_GAP -> `String "Partner Gap"
  | ON_PREMISES_DEPLOYMENT -> `String "On Premises Deployment"
  | NO_OPPORTUNITY -> `String "No Opportunity"
  | LOST_TO_COMPETITOR_OTHER -> `String "Lost to Competitor - Other"
  | LOST_TO_COMPETITOR_VMWARE -> `String "Lost to Competitor - VMWare"
  | LOST_TO_COMPETITOR_SOFTLAYER -> `String "Lost to Competitor - SoftLayer"
  | LOST_TO_COMPETITOR_MICROSOFT -> `String "Lost to Competitor - Microsoft"
  | LOST_TO_COMPETITOR_GOOGLE -> `String "Lost to Competitor - Google"
  | LEGAL_TAX_REGULATORY -> `String "Legal / Tax / Regulatory"
  | DELAY_CANCELLATION_OF_PROJECT -> `String "Delay / Cancellation of Project"
  | CUSTOMER_DEFICIENCY -> `String "Customer Deficiency"

let review_status_to_yojson (x : review_status) =
  match x with
  | ACTION_REQUIRED -> `String "Action Required"
  | REJECTED -> `String "Rejected"
  | APPROVED -> `String "Approved"
  | IN_REVIEW -> `String "In review"
  | SUBMITTED -> `String "Submitted"
  | PENDING_SUBMISSION -> `String "Pending Submission"

let next_steps_history_to_yojson (x : next_steps_history) =
  assoc_to_yojson
    [
      ("Time", Some (date_time_to_yojson x.time));
      ("Value", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.value));
    ]

let next_steps_histories_to_yojson tree = list_to_yojson next_steps_history_to_yojson tree

let life_cycle_to_yojson (x : life_cycle) =
  assoc_to_yojson
    [
      ("NextStepsHistory", option_to_yojson next_steps_histories_to_yojson x.next_steps_history);
      ( "ReviewStatusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.review_status_reason );
      ( "ReviewComments",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.review_comments
      );
      ("ReviewStatus", option_to_yojson review_status_to_yojson x.review_status);
      ("TargetCloseDate", option_to_yojson date_to_yojson x.target_close_date);
      ("NextSteps", option_to_yojson pii_string_to_yojson x.next_steps);
      ("ClosedLostReason", option_to_yojson closed_lost_reason_to_yojson x.closed_lost_reason);
      ("Stage", option_to_yojson stage_to_yojson x.stage);
    ]

let update_opportunity_request_to_yojson (x : update_opportunity_request) =
  assoc_to_yojson
    [
      ("LifeCycle", option_to_yojson life_cycle_to_yojson x.life_cycle);
      ("Identifier", Some (opportunity_identifier_to_yojson x.identifier));
      ("LastModifiedDate", Some (date_time_to_yojson x.last_modified_date));
      ("SoftwareRevenue", option_to_yojson software_revenue_to_yojson x.software_revenue);
      ("Marketing", option_to_yojson marketing_to_yojson x.marketing);
      ("OpportunityType", option_to_yojson opportunity_type_to_yojson x.opportunity_type);
      ("Project", option_to_yojson project_to_yojson x.project);
      ("Customer", option_to_yojson customer_to_yojson x.customer);
      ( "PartnerOpportunityIdentifier",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.partner_opportunity_identifier );
      ("NationalSecurity", option_to_yojson national_security_to_yojson x.national_security);
      ( "PrimaryNeedsFromAws",
        option_to_yojson primary_needs_from_aws_to_yojson x.primary_needs_from_aws );
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
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
      ("Reason", option_to_yojson access_denied_exception_error_code_to_yojson x.reason);
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let lead_qualification_status_to_yojson = string_to_yojson
let company_name_to_yojson = string_to_yojson
let company_website_url_to_yojson = string_to_yojson

let address_summary_to_yojson (x : address_summary) =
  assoc_to_yojson
    [
      ("CountryCode", option_to_yojson country_code_to_yojson x.country_code);
      ("StateOrRegion", option_to_yojson address_part_to_yojson x.state_or_region);
      ("PostalCode", option_to_yojson address_part_to_yojson x.postal_code);
      ("City", option_to_yojson address_part_to_yojson x.city);
    ]

let aws_maturity_to_yojson = string_to_yojson

let market_segment_to_yojson (x : market_segment) =
  match x with
  | MICRO -> `String "Micro"
  | SMALL -> `String "Small"
  | MEDIUM -> `String "Medium"
  | LARGE -> `String "Large"
  | ENTERPRISE -> `String "Enterprise"

let lead_customer_to_yojson (x : lead_customer) =
  assoc_to_yojson
    [
      ("MarketSegment", option_to_yojson market_segment_to_yojson x.market_segment);
      ("AwsMaturity", option_to_yojson aws_maturity_to_yojson x.aws_maturity);
      ("Address", Some (address_summary_to_yojson x.address));
      ("WebsiteUrl", option_to_yojson company_website_url_to_yojson x.website_url);
      ("CompanyName", Some (company_name_to_yojson x.company_name));
      ("Industry", option_to_yojson industry_to_yojson x.industry);
    ]

let lead_source_type_to_yojson = string_to_yojson
let lead_source_id_to_yojson = string_to_yojson
let lead_source_name_to_yojson = string_to_yojson
let engagement_use_case_to_yojson = string_to_yojson
let customer_action_to_yojson = string_to_yojson
let engagement_customer_business_problem_to_yojson = string_to_yojson

let lead_contact_to_yojson (x : lead_contact) =
  assoc_to_yojson
    [
      ("Phone", option_to_yojson phone_number_to_yojson x.phone);
      ("LastName", Some (name_to_yojson x.last_name));
      ("FirstName", Some (name_to_yojson x.first_name));
      ("Email", Some (email_to_yojson x.email));
      ("BusinessTitle", Some (job_title_to_yojson x.business_title));
    ]

let lead_interaction_to_yojson (x : lead_interaction) =
  assoc_to_yojson
    [
      ("Contact", Some (lead_contact_to_yojson x.contact));
      ( "BusinessProblem",
        option_to_yojson engagement_customer_business_problem_to_yojson x.business_problem );
      ("CustomerAction", Some (customer_action_to_yojson x.customer_action));
      ("InteractionDate", option_to_yojson date_time_to_yojson x.interaction_date);
      ("Usecase", option_to_yojson engagement_use_case_to_yojson x.usecase);
      ("SourceName", Some (lead_source_name_to_yojson x.source_name));
      ("SourceId", Some (lead_source_id_to_yojson x.source_id));
      ("SourceType", Some (lead_source_type_to_yojson x.source_type));
    ]

let lead_insights_to_yojson (x : lead_insights) =
  assoc_to_yojson
    [
      ( "LeadReadinessScore",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.lead_readiness_score );
    ]

let update_lead_context_to_yojson (x : update_lead_context) =
  assoc_to_yojson
    [
      ("Insights", option_to_yojson lead_insights_to_yojson x.insights);
      ("Interaction", option_to_yojson lead_interaction_to_yojson x.interaction);
      ("Customer", Some (lead_customer_to_yojson x.customer));
      ( "QualificationStatus",
        option_to_yojson lead_qualification_status_to_yojson x.qualification_status );
    ]

let engagement_identifier_to_yojson = string_to_yojson
let engagement_arn_to_yojson = string_to_yojson
let engagement_context_identifier_to_yojson = string_to_yojson

let update_engagement_context_response_to_yojson (x : update_engagement_context_response) =
  assoc_to_yojson
    [
      ("ContextId", Some (engagement_context_identifier_to_yojson x.context_id));
      ("EngagementLastModifiedAt", Some (date_time_to_yojson x.engagement_last_modified_at));
      ("EngagementArn", Some (engagement_arn_to_yojson x.engagement_arn));
      ("EngagementId", Some (engagement_identifier_to_yojson x.engagement_id));
    ]

let engagement_arn_or_identifier_to_yojson = string_to_yojson

let engagement_context_type_to_yojson (x : engagement_context_type) =
  match x with
  | PROSPECTING_RESULT -> `String "ProspectingResult"
  | LEAD -> `String "Lead"
  | CUSTOMER_PROJECT -> `String "CustomerProject"

let engagement_customer_to_yojson (x : engagement_customer) =
  assoc_to_yojson
    [
      ("CountryCode", Some (country_code_to_yojson x.country_code));
      ("WebsiteUrl", Some (company_website_url_to_yojson x.website_url));
      ("CompanyName", Some (company_name_to_yojson x.company_name));
      ("Industry", Some (industry_to_yojson x.industry));
    ]

let engagement_customer_project_title_to_yojson = string_to_yojson

let engagement_customer_project_details_to_yojson (x : engagement_customer_project_details) =
  assoc_to_yojson
    [
      ( "TargetCompletionDate",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.target_completion_date) );
      ("BusinessProblem", Some (engagement_customer_business_problem_to_yojson x.business_problem));
      ("Title", Some (engagement_customer_project_title_to_yojson x.title));
    ]

let customer_projects_context_to_yojson (x : customer_projects_context) =
  assoc_to_yojson
    [
      ("Project", option_to_yojson engagement_customer_project_details_to_yojson x.project);
      ("Customer", option_to_yojson engagement_customer_to_yojson x.customer);
    ]

let prospecting_task_identifier_to_yojson = string_to_yojson
let task_arn_to_yojson = string_to_yojson
let task_name_to_yojson = string_to_yojson
let prospecting_account_name_to_yojson = string_to_yojson
let prospecting_geo_to_yojson = string_to_yojson
let prospecting_region_to_yojson = string_to_yojson
let prospecting_sub_region_to_yojson = string_to_yojson
let prospecting_sub_industry_to_yojson = string_to_yojson
let prospecting_segment_to_yojson = string_to_yojson
let prospecting_company_size_to_yojson = string_to_yojson

let eligible_programs_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let prospecting_public_profile_summary_to_yojson = string_to_yojson

let prospecting_result_customer_to_yojson (x : prospecting_result_customer) =
  assoc_to_yojson
    [
      ( "PublicProfileSummary",
        option_to_yojson prospecting_public_profile_summary_to_yojson x.public_profile_summary );
      ("EligiblePrograms", option_to_yojson eligible_programs_list_to_yojson x.eligible_programs);
      ("CompanySize", option_to_yojson prospecting_company_size_to_yojson x.company_size);
      ("Segment", option_to_yojson prospecting_segment_to_yojson x.segment);
      ("SubIndustry", option_to_yojson prospecting_sub_industry_to_yojson x.sub_industry);
      ("Industry", option_to_yojson industry_to_yojson x.industry);
      ("Country", option_to_yojson country_code_to_yojson x.country);
      ("SubRegion", option_to_yojson prospecting_sub_region_to_yojson x.sub_region);
      ("Region", option_to_yojson prospecting_region_to_yojson x.region);
      ("Geo", option_to_yojson prospecting_geo_to_yojson x.geo);
      ("AccountName", option_to_yojson prospecting_account_name_to_yojson x.account_name);
    ]

let engagement_score_level_to_yojson = string_to_yojson

let prospecting_insights_to_yojson (x : prospecting_insights) =
  assoc_to_yojson
    [
      ( "SolutionSubCategory",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.solution_sub_category );
      ( "SolutionCategory",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.solution_category
      );
      ( "SolutionScore",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.solution_score );
      ( "MarketplaceEngagementScore",
        option_to_yojson engagement_score_level_to_yojson x.marketplace_engagement_score );
    ]

let prospecting_result_aws_to_yojson (x : prospecting_result_aws) =
  assoc_to_yojson
    [
      ("Insights", option_to_yojson prospecting_insights_to_yojson x.insights);
      ("Customer", option_to_yojson prospecting_result_customer_to_yojson x.customer);
      ("TaskName", option_to_yojson task_name_to_yojson x.task_name);
      ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn);
      ("TaskId", option_to_yojson prospecting_task_identifier_to_yojson x.task_id);
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
    ]

let prospecting_result_to_yojson (x : prospecting_result) =
  assoc_to_yojson [ ("Aws", option_to_yojson prospecting_result_aws_to_yojson x.aws) ]

let update_engagement_context_payload_to_yojson (x : update_engagement_context_payload) =
  match x with
  | ProspectingResult arg ->
      assoc_to_yojson [ ("ProspectingResult", Some (prospecting_result_to_yojson arg)) ]
  | CustomerProject arg ->
      assoc_to_yojson [ ("CustomerProject", Some (customer_projects_context_to_yojson arg)) ]
  | Lead arg -> assoc_to_yojson [ ("Lead", Some (update_lead_context_to_yojson arg)) ]

let update_engagement_context_request_to_yojson (x : update_engagement_context_request) =
  assoc_to_yojson
    [
      ("Payload", Some (update_engagement_context_payload_to_yojson x.payload));
      ("Type", Some (engagement_context_type_to_yojson x.type_));
      ("EngagementLastModifiedAt", Some (date_time_to_yojson x.engagement_last_modified_at));
      ("ContextIdentifier", Some (engagement_context_identifier_to_yojson x.context_identifier));
      ("EngagementIdentifier", Some (engagement_arn_or_identifier_to_yojson x.engagement_identifier));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let taggable_resource_arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
    ]

let task_status_to_yojson (x : task_status) =
  match x with
  | FAILED -> `String "FAILED"
  | COMPLETE -> `String "COMPLETE"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let task_statuses_to_yojson tree = list_to_yojson task_status_to_yojson tree
let task_name_list_to_yojson tree = list_to_yojson task_name_to_yojson tree
let task_arn_or_identifier_to_yojson = string_to_yojson
let task_identifiers_to_yojson tree = list_to_yojson task_arn_or_identifier_to_yojson tree
let task_identifier_list_to_yojson tree = list_to_yojson prospecting_task_identifier_to_yojson tree
let task_identifier_to_yojson = string_to_yojson

let target_close_date_filter_to_yojson (x : target_close_date_filter) =
  assoc_to_yojson
    [
      ("BeforeTargetCloseDate", option_to_yojson date_to_yojson x.before_target_close_date);
      ("AfterTargetCloseDate", option_to_yojson date_to_yojson x.after_target_close_date);
    ]

let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
    ]

let sales_involvement_type_to_yojson (x : sales_involvement_type) =
  match x with CO_SELL -> `String "Co-Sell" | FOR_VISIBILITY_ONLY -> `String "For Visibility Only"

let submit_opportunity_request_to_yojson (x : submit_opportunity_request) =
  assoc_to_yojson
    [
      ("Visibility", option_to_yojson visibility_to_yojson x.visibility);
      ("InvolvementType", Some (sales_involvement_type_to_yojson x.involvement_type));
      ("Identifier", Some (opportunity_identifier_to_yojson x.identifier));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let string_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let resource_snapshot_job_identifier_to_yojson = string_to_yojson

let stop_resource_snapshot_job_request_to_yojson (x : stop_resource_snapshot_job_request) =
  assoc_to_yojson
    [
      ( "ResourceSnapshotJobIdentifier",
        Some (resource_snapshot_job_identifier_to_yojson x.resource_snapshot_job_identifier) );
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let start_resource_snapshot_job_request_to_yojson (x : start_resource_snapshot_job_request) =
  assoc_to_yojson
    [
      ( "ResourceSnapshotJobIdentifier",
        Some (resource_snapshot_job_identifier_to_yojson x.resource_snapshot_job_identifier) );
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let engagement_identifier_list_to_yojson tree = list_to_yojson engagement_identifier_to_yojson tree
let prospecting_task_arn_to_yojson = string_to_yojson

let prospecting_task_status_to_yojson (x : prospecting_task_status) =
  match x with
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | PENDING -> `String "PENDING"

let start_prospecting_from_engagement_task_response_to_yojson
    (x : start_prospecting_from_engagement_task_response) =
  assoc_to_yojson
    [
      ("TaskStatus", Some (prospecting_task_status_to_yojson x.task_status));
      ("TaskArn", option_to_yojson prospecting_task_arn_to_yojson x.task_arn);
      ("TaskId", option_to_yojson prospecting_task_identifier_to_yojson x.task_id);
      ("StartTime", Some (date_time_to_yojson x.start_time));
      ( "ReasonCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reason_code );
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("TaskName", Some (task_name_to_yojson x.task_name));
      ("Identifiers", Some (engagement_identifier_list_to_yojson x.identifiers));
    ]

let client_token_to_yojson = string_to_yojson

let start_prospecting_from_engagement_task_request_to_yojson
    (x : start_prospecting_from_engagement_task_request) =
  assoc_to_yojson
    [
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("TaskName", Some (task_name_to_yojson x.task_name));
      ("Identifiers", Some (engagement_identifier_list_to_yojson x.identifiers));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let reason_code_to_yojson (x : reason_code) =
  match x with
  | DISQUALIFIED_LEAD_NOT_PERMITTED -> `String "DisqualifiedLeadNotPermitted"
  | CUSTOMER_PROJECT_CONTEXT_NOT_PERMITTED -> `String "CustomerProjectContextNotPermitted"
  | CONTEXT_NOT_FOUND -> `String "ContextNotFound"
  | REQUEST_THROTTLED -> `String "RequestThrottled"
  | SERVICE_QUOTA_EXCEEDED -> `String "ServiceQuotaExceeded"
  | RESOURCE_SNAPSHOT_CONFLICT -> `String "ResourceSnapshotConflict"
  | RESOURCE_SNAPSHOT_VALIDATION_FAILED -> `String "ResourceSnapshotValidationFailed"
  | RESOURCE_SNAPSHOT_ACCESS_DENIED -> `String "ResourceSnapshotAccessDenied"
  | OPPORTUNITY_CONFLICT -> `String "OpportunityConflict"
  | OPPORTUNITY_VALIDATION_FAILED -> `String "OpportunityValidationFailed"
  | INTERNAL_ERROR -> `String "InternalError"
  | ENGAGEMENT_INVITATION_CONFLICT -> `String "EngagementInvitationConflict"
  | OPPORTUNITY_SUBMISSION_FAILED -> `String "OpportunitySubmissionFailed"
  | ENGAGEMENT_CONFLICT -> `String "EngagementConflict"
  | ENGAGEMENT_VALIDATION_FAILED -> `String "EngagementValidationFailed"
  | RESOURCE_SNAPSHOT_JOB_CONFLICT -> `String "ResourceSnapshotJobConflict"
  | RESOURCE_SNAPSHOT_JOB_VALIDATION_FAILED -> `String "ResourceSnapshotJobValidationFailed"
  | RESOURCE_SNAPSHOT_JOB_ACCESS_DENIED -> `String "ResourceSnapshotJobAccessDenied"
  | OPPORTUNITY_ACCESS_DENIED -> `String "OpportunityAccessDenied"
  | ENGAGEMENT_ACCESS_DENIED -> `String "EngagementAccessDenied"
  | INVITATION_VALIDATION_FAILED -> `String "InvitationValidationFailed"
  | INVITATION_ACCESS_DENIED -> `String "InvitationAccessDenied"

let context_identifier_to_yojson = string_to_yojson

let start_opportunity_from_engagement_task_response_to_yojson
    (x : start_opportunity_from_engagement_task_response) =
  assoc_to_yojson
    [
      ("ContextId", option_to_yojson context_identifier_to_yojson x.context_id);
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
      ( "ResourceSnapshotJobId",
        option_to_yojson resource_snapshot_job_identifier_to_yojson x.resource_snapshot_job_id );
      ("OpportunityId", option_to_yojson opportunity_identifier_to_yojson x.opportunity_id);
      ("ReasonCode", option_to_yojson reason_code_to_yojson x.reason_code);
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("TaskStatus", option_to_yojson task_status_to_yojson x.task_status);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn);
      ("TaskId", option_to_yojson task_identifier_to_yojson x.task_id);
    ]

let start_opportunity_from_engagement_task_request_to_yojson
    (x : start_opportunity_from_engagement_task_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ContextIdentifier", Some (context_identifier_to_yojson x.context_identifier));
      ("Identifier", Some (engagement_arn_or_identifier_to_yojson x.identifier));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let engagement_invitation_identifier_to_yojson = string_to_yojson

let start_engagement_from_opportunity_task_response_to_yojson
    (x : start_engagement_from_opportunity_task_response) =
  assoc_to_yojson
    [
      ( "EngagementInvitationId",
        option_to_yojson engagement_invitation_identifier_to_yojson x.engagement_invitation_id );
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
      ( "ResourceSnapshotJobId",
        option_to_yojson resource_snapshot_job_identifier_to_yojson x.resource_snapshot_job_id );
      ("OpportunityId", option_to_yojson opportunity_identifier_to_yojson x.opportunity_id);
      ("ReasonCode", option_to_yojson reason_code_to_yojson x.reason_code);
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("TaskStatus", option_to_yojson task_status_to_yojson x.task_status);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn);
      ("TaskId", option_to_yojson task_identifier_to_yojson x.task_id);
    ]

let aws_submission_to_yojson (x : aws_submission) =
  assoc_to_yojson
    [
      ("Visibility", option_to_yojson visibility_to_yojson x.visibility);
      ("InvolvementType", Some (sales_involvement_type_to_yojson x.involvement_type));
    ]

let start_engagement_from_opportunity_task_request_to_yojson
    (x : start_engagement_from_opportunity_task_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("AwsSubmission", Some (aws_submission_to_yojson x.aws_submission));
      ("Identifier", Some (opportunity_identifier_to_yojson x.identifier));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let start_engagement_by_accepting_invitation_task_response_to_yojson
    (x : start_engagement_by_accepting_invitation_task_response) =
  assoc_to_yojson
    [
      ( "EngagementInvitationId",
        option_to_yojson engagement_invitation_identifier_to_yojson x.engagement_invitation_id );
      ( "ResourceSnapshotJobId",
        option_to_yojson resource_snapshot_job_identifier_to_yojson x.resource_snapshot_job_id );
      ("OpportunityId", option_to_yojson opportunity_identifier_to_yojson x.opportunity_id);
      ("ReasonCode", option_to_yojson reason_code_to_yojson x.reason_code);
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("TaskStatus", option_to_yojson task_status_to_yojson x.task_status);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn);
      ("TaskId", option_to_yojson task_identifier_to_yojson x.task_id);
    ]

let engagement_invitation_arn_or_identifier_to_yojson = string_to_yojson

let start_engagement_by_accepting_invitation_task_request_to_yojson
    (x : start_engagement_by_accepting_invitation_task_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Identifier", Some (engagement_invitation_arn_or_identifier_to_yojson x.identifier));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let sort_order_to_yojson (x : sort_order) =
  match x with DESCENDING -> `String "DESCENDING" | ASCENDING -> `String "ASCENDING"

let sort_by_to_yojson (x : sort_by) = match x with CREATED_DATE -> `String "CreatedDate"

let sort_object_to_yojson (x : sort_object) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_by_to_yojson x.sort_by);
    ]

let solution_status_to_yojson (x : solution_status) =
  match x with
  | DRAFT -> `String "Draft"
  | INACTIVE -> `String "Inactive"
  | ACTIVE -> `String "Active"

let solution_sort_name_to_yojson (x : solution_sort_name) =
  match x with
  | CREATEDDATE -> `String "CreatedDate"
  | CATEGORY -> `String "Category"
  | STATUS -> `String "Status"
  | NAME -> `String "Name"
  | IDENTIFIER -> `String "Identifier"

let solution_sort_to_yojson (x : solution_sort) =
  assoc_to_yojson
    [
      ("SortBy", Some (solution_sort_name_to_yojson x.sort_by));
      ("SortOrder", Some (sort_order_to_yojson x.sort_order));
    ]

let solution_identifier_to_yojson = string_to_yojson
let solution_arn_to_yojson = string_to_yojson
let aws_marketplace_solution_arn_to_yojson = string_to_yojson

let solution_base_to_yojson (x : solution_base) =
  assoc_to_yojson
    [
      ( "AwsMarketplaceSolutionArn",
        option_to_yojson aws_marketplace_solution_arn_to_yojson x.aws_marketplace_solution_arn );
      ("CreatedDate", Some (date_time_to_yojson x.created_date));
      ("Category", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.category));
      ("Status", Some (solution_status_to_yojson x.status));
      ("Name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
      ("Arn", option_to_yojson solution_arn_to_yojson x.arn);
      ("Id", Some (solution_identifier_to_yojson x.id));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let solution_list_to_yojson tree = list_to_yojson solution_base_to_yojson tree
let solution_identifiers_to_yojson tree = list_to_yojson solution_identifier_to_yojson tree
let sender_contact_email_to_yojson = string_to_yojson

let sender_contact_to_yojson (x : sender_contact) =
  assoc_to_yojson
    [
      ("Phone", option_to_yojson phone_number_to_yojson x.phone);
      ("BusinessTitle", option_to_yojson job_title_to_yojson x.business_title);
      ("LastName", option_to_yojson name_to_yojson x.last_name);
      ("FirstName", option_to_yojson name_to_yojson x.first_name);
      ("Email", Some (sender_contact_email_to_yojson x.email));
    ]

let sender_contact_list_to_yojson tree = list_to_yojson sender_contact_to_yojson tree

let resource_type_to_yojson (x : resource_type) =
  match x with OPPORTUNITY -> `String "Opportunity"

let resource_template_name_to_yojson = string_to_yojson
let resource_snapshot_arn_to_yojson = string_to_yojson
let resource_snapshot_revision_to_yojson = int_to_yojson
let resource_identifier_to_yojson = string_to_yojson

let resource_snapshot_summary_to_yojson (x : resource_snapshot_summary) =
  assoc_to_yojson
    [
      ("CreatedBy", option_to_yojson aws_account_to_yojson x.created_by);
      ( "ResourceSnapshotTemplateName",
        option_to_yojson resource_template_name_to_yojson x.resource_snapshot_template_name );
      ("ResourceId", option_to_yojson resource_identifier_to_yojson x.resource_id);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("Revision", option_to_yojson resource_snapshot_revision_to_yojson x.revision);
      ("Arn", option_to_yojson resource_snapshot_arn_to_yojson x.arn);
    ]

let resource_snapshot_summary_list_to_yojson tree =
  list_to_yojson resource_snapshot_summary_to_yojson tree

let life_cycle_for_view_to_yojson (x : life_cycle_for_view) =
  assoc_to_yojson
    [
      ("NextSteps", option_to_yojson pii_string_to_yojson x.next_steps);
      ("Stage", option_to_yojson stage_to_yojson x.stage);
      ("ReviewStatus", option_to_yojson review_status_to_yojson x.review_status);
      ("TargetCloseDate", option_to_yojson date_to_yojson x.target_close_date);
    ]

let partner_opportunity_team_members_list_to_yojson tree = list_to_yojson contact_to_yojson tree

let project_view_to_yojson (x : project_view) =
  assoc_to_yojson
    [
      ( "OtherSolutionDescription",
        option_to_yojson pii_string_to_yojson x.other_solution_description );
      ("SalesActivities", option_to_yojson sales_activities_to_yojson x.sales_activities);
      ( "CustomerUseCase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.customer_use_case
      );
      ( "ExpectedContractDuration",
        option_to_yojson expected_contract_duration_to_yojson x.expected_contract_duration );
      ( "ExpectedCustomerSpend",
        option_to_yojson expected_customer_spend_list_to_yojson x.expected_customer_spend );
      ("DeliveryModels", option_to_yojson delivery_models_to_yojson x.delivery_models);
    ]

let aws_marketplace_offer_identifier_to_yojson = string_to_yojson

let aws_marketplace_offer_identifiers_to_yojson tree =
  list_to_yojson aws_marketplace_offer_identifier_to_yojson tree

let aws_marketplace_offer_set_identifier_to_yojson = string_to_yojson

let aws_marketplace_offer_set_identifiers_to_yojson tree =
  list_to_yojson aws_marketplace_offer_set_identifier_to_yojson tree

let aws_product_identifier_to_yojson = string_to_yojson
let aws_product_identifiers_to_yojson tree = list_to_yojson aws_product_identifier_to_yojson tree
let aws_marketplace_solution_identifier_to_yojson = string_to_yojson

let aws_marketplace_solution_identifiers_to_yojson tree =
  list_to_yojson aws_marketplace_solution_identifier_to_yojson tree

let aws_marketplace_product_arn_to_yojson = string_to_yojson

let aws_marketplace_product_identifiers_to_yojson tree =
  list_to_yojson aws_marketplace_product_arn_to_yojson tree

let related_entity_identifiers_to_yojson (x : related_entity_identifiers) =
  assoc_to_yojson
    [
      ( "AwsMarketplaceProducts",
        option_to_yojson aws_marketplace_product_identifiers_to_yojson x.aws_marketplace_products );
      ( "AwsMarketplaceSolutions",
        option_to_yojson aws_marketplace_solution_identifiers_to_yojson x.aws_marketplace_solutions
      );
      ("AwsProducts", option_to_yojson aws_product_identifiers_to_yojson x.aws_products);
      ("Solutions", option_to_yojson solution_identifiers_to_yojson x.solutions);
      ( "AwsMarketplaceOfferSets",
        option_to_yojson aws_marketplace_offer_set_identifiers_to_yojson
          x.aws_marketplace_offer_sets );
      ( "AwsMarketplaceOffers",
        option_to_yojson aws_marketplace_offer_identifiers_to_yojson x.aws_marketplace_offers );
    ]

let opportunity_summary_view_to_yojson (x : opportunity_summary_view) =
  assoc_to_yojson
    [
      ( "RelatedEntityIdentifiers",
        option_to_yojson related_entity_identifiers_to_yojson x.related_entity_identifiers );
      ("Project", option_to_yojson project_view_to_yojson x.project);
      ("Customer", option_to_yojson customer_to_yojson x.customer);
      ( "PrimaryNeedsFromAws",
        option_to_yojson primary_needs_from_aws_to_yojson x.primary_needs_from_aws );
      ( "OpportunityTeam",
        option_to_yojson partner_opportunity_team_members_list_to_yojson x.opportunity_team );
      ("Lifecycle", option_to_yojson life_cycle_for_view_to_yojson x.lifecycle);
      ("OpportunityType", option_to_yojson opportunity_type_to_yojson x.opportunity_type);
    ]

let opportunity_origin_to_yojson (x : opportunity_origin) =
  match x with
  | PARTNER_REFERRAL -> `String "Partner Referral"
  | AWS_REFERRAL -> `String "AWS Referral"

let aws_closed_lost_reason_to_yojson (x : aws_closed_lost_reason) =
  match x with
  | TERM_SHEET_IMPASSE -> `String "Term Sheet Impasse"
  | TECHNICAL_LIMITATIONS -> `String "Technical Limitations"
  | SELF_SERVICE -> `String "Self-Service"
  | SECURITY_COMPLIANCE -> `String "Security / Compliance"
  | PRODUCT_NOT_ON_AWS -> `String "Product Not on AWS"
  | PRODUCT_TECHNOLOGY -> `String "Product/Technology"
  | PRICE -> `String "Price"
  | PREFERENCE_FOR_COMPETITOR -> `String "Preference for Competitor"
  | PLATFORM_TECHNOLOGY_LIMITATION -> `String "Platform Technology Limitation"
  | PEOPLE_RELATIONSHIP_GOVERNANCE -> `String "People/Relationship/Governance"
  | PAST_DUE -> `String "Past Due"
  | PARTNER_GAP -> `String "Partner Gap"
  | OTHER_DETAILS_IN_DESCRIPTION -> `String "Other (Details in Description)"
  | OTHER -> `String "Other"
  | ON_PREMISES_DEPLOYMENT -> `String "On Premises Deployment"
  | NO_UPDATE -> `String "No Update"
  | NOT_COMMITTED_TO_AWS -> `String "Not Committed to AWS"
  | NO_RESPONSE -> `String "No Response"
  | NO_PERCEIVED_VALUE_OF_MP -> `String "No Perceived Value of MP"
  | NO_OPPORTUNITY -> `String "No Opportunity"
  | NO_INTEGRATION_RESOURCES -> `String "No Integration Resources"
  | NO_CUSTOMER_REFERENCE -> `String "No Customer Reference"
  | LOST_TO_COMPETITOR_VMWARE -> `String "Lost to Competitor - VMWare"
  | LOST_TO_COMPETITOR_SOFTLAYER -> `String "Lost to Competitor - SoftLayer"
  | LOST_TO_COMPETITOR_RACKSPACE -> `String "Lost to Competitor - Rackspace"
  | LOST_TO_COMPETITOR_OTHER -> `String "Lost to Competitor - Other"
  | LOST_TO_COMPETITOR_MICROSOFT -> `String "Lost to Competitor - Microsoft"
  | LOST_TO_COMPETITOR_GOOGLE -> `String "Lost to Competitor - Google"
  | LOST_TO_COMPETITOR -> `String "Lost to Competitor"
  | LEGAL_TERMS_AND_CONDITIONS -> `String "Legal Terms and Conditions"
  | LEGAL_TAX_REGULATORY -> `String "Legal / Tax / Regulatory"
  | INTERNATIONAL_CONSTRAINTS -> `String "International Constraints"
  | INSUFFICIENT_AWS_VALUE -> `String "Insufficient AWS Value"
  | INSUFFICIENT_AMAZON_VALUE -> `String "Insufficient Amazon Value"
  | FINANCIAL_COMMERCIAL -> `String "Financial/Commercial"
  | FEATURE_LIMITATION -> `String "Feature Limitation"
  | FAILED_VETTING -> `String "Failed Vetting"
  | EXECUTIVE_BLOCKER -> `String "Executive Blocker"
  | DUPLICATE_OPPORTUNITY -> `String "Duplicate Opportunity"
  | DUPLICATE -> `String "Duplicate"
  | DELAY_CANCELLATION_OF_PROJECT -> `String "Delay / Cancellation of Project"
  | CUSTOMER_EXPERIENCE -> `String "Customer Experience"
  | CUSTOMER_DEFICIENCY -> `String "Customer Deficiency"
  | CUSTOMER_DATA_REQUIREMENT -> `String "Customer Data Requirement"
  | COMPETITIVE_OFFERING -> `String "Competitive Offering"
  | COMPANY_ACQUIRED_DISSOLVED -> `String "Company Acquired/Dissolved"
  | BUSINESS_ASSOCIATE_AGREEMENT -> `String "Business Associate Agreement"
  | ADMINISTRATIVE -> `String "Administrative"

let aws_opportunity_stage_to_yojson (x : aws_opportunity_stage) =
  match x with
  | CLOSED_INCOMPLETE -> `String "Closed Incomplete"
  | COMPLETED -> `String "Completed"
  | CLOSED_LOST -> `String "Closed Lost"
  | DEFERRED_TO_PARTNER -> `String "Deferred to Partner"
  | LAUNCHED -> `String "Launched"
  | COMMITTED -> `String "Committed"
  | BUSINESS_VALIDATION -> `String "Business Validation"
  | TECHNICAL_VALIDATION -> `String "Technical Validation"
  | ON_HOLD -> `String "On-hold"
  | QUALIFIED -> `String "Qualified"
  | BUILDING_INTEGRATION -> `String "Building Integration"
  | ONBOARDING -> `String "Onboarding"
  | CONTRACT_NEGOTIATION -> `String "Contract Negotiation"
  | TERM_SHEET_NEGOTIATION -> `String "Term Sheet Negotiation"
  | SELLER_REGISTERED -> `String "Seller Registered"
  | EVALUATING -> `String "Evaluating"
  | SELLER_ENGAGED -> `String "Seller Engaged"
  | RESEARCH -> `String "Research"
  | QUALIFY -> `String "Qualify"
  | IDENTIFIED -> `String "Identified"
  | ENGAGED -> `String "Engaged"
  | PROSPECT -> `String "Prospect"
  | IN_PROGRESS -> `String "In Progress"
  | NOT_STARTED -> `String "Not Started"

let profile_next_steps_history_to_yojson (x : profile_next_steps_history) =
  assoc_to_yojson
    [
      ("Time", Some (date_time_to_yojson x.time));
      ("Value", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.value));
    ]

let profile_next_steps_histories_to_yojson tree =
  list_to_yojson profile_next_steps_history_to_yojson tree

let aws_opportunity_life_cycle_to_yojson (x : aws_opportunity_life_cycle) =
  assoc_to_yojson
    [
      ( "NextStepsHistory",
        option_to_yojson profile_next_steps_histories_to_yojson x.next_steps_history );
      ("NextSteps", option_to_yojson pii_string_to_yojson x.next_steps);
      ("Stage", option_to_yojson aws_opportunity_stage_to_yojson x.stage);
      ("ClosedLostReason", option_to_yojson aws_closed_lost_reason_to_yojson x.closed_lost_reason);
      ("TargetCloseDate", option_to_yojson date_to_yojson x.target_close_date);
    ]

let aws_member_business_title_to_yojson (x : aws_member_business_title) =
  match x with
  | ISVSM -> `String "ISVSM"
  | PSM -> `String "PSM"
  | PDM -> `String "PDM"
  | WWPSPDM -> `String "WWPSPDM"
  | AWS_ACCOUNT_OWNER -> `String "AWSAccountOwner"
  | AWS_SALES_REP -> `String "AWSSalesRep"

let aws_team_member_to_yojson (x : aws_team_member) =
  assoc_to_yojson
    [
      ("BusinessTitle", option_to_yojson aws_member_business_title_to_yojson x.business_title);
      ("LastName", option_to_yojson name_to_yojson x.last_name);
      ("FirstName", option_to_yojson name_to_yojson x.first_name);
      ("Email", option_to_yojson email_to_yojson x.email);
    ]

let aws_opportunity_team_members_list_to_yojson tree = list_to_yojson aws_team_member_to_yojson tree

let engagement_score_to_yojson (x : engagement_score) =
  match x with LOW -> `String "Low" | MEDIUM -> `String "Medium" | HIGH -> `String "High"

let monetary_amount_to_yojson = string_to_yojson

let amount_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson monetary_amount_to_yojson
    tree

let aws_product_optimization_to_yojson (x : aws_product_optimization) =
  assoc_to_yojson
    [
      ("SavingsAmount", Some (monetary_amount_to_yojson x.savings_amount));
      ("Description", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description));
    ]

let aws_product_optimizations_list_to_yojson tree =
  list_to_yojson aws_product_optimization_to_yojson tree

let aws_product_details_to_yojson (x : aws_product_details) =
  assoc_to_yojson
    [
      ("Optimizations", Some (aws_product_optimizations_list_to_yojson x.optimizations));
      ( "PotentialSavingsAmount",
        option_to_yojson monetary_amount_to_yojson x.potential_savings_amount );
      ("OptimizedAmount", option_to_yojson monetary_amount_to_yojson x.optimized_amount);
      ("Amount", option_to_yojson monetary_amount_to_yojson x.amount);
      ("Categories", Some (string_list_to_yojson x.categories));
      ( "ServiceCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code );
      ("ProductCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.product_code));
    ]

let aws_products_list_to_yojson tree = list_to_yojson aws_product_details_to_yojson tree

let aws_product_insights_to_yojson (x : aws_product_insights) =
  assoc_to_yojson
    [
      ("AwsProducts", Some (aws_products_list_to_yojson x.aws_products));
      ("TotalAmountByCategory", Some (amount_map_to_yojson x.total_amount_by_category));
      ( "TotalPotentialSavingsAmount",
        option_to_yojson monetary_amount_to_yojson x.total_potential_savings_amount );
      ("TotalOptimizedAmount", option_to_yojson monetary_amount_to_yojson x.total_optimized_amount);
      ("TotalAmount", option_to_yojson monetary_amount_to_yojson x.total_amount);
      ("Frequency", Some (payment_frequency_to_yojson x.frequency));
      ("CurrencyCode", Some (currency_code_to_yojson x.currency_code));
    ]

let aws_products_spend_insights_by_source_to_yojson (x : aws_products_spend_insights_by_source) =
  assoc_to_yojson
    [
      ("AWS", option_to_yojson aws_product_insights_to_yojson x.aw_s);
      ("Partner", option_to_yojson aws_product_insights_to_yojson x.partner);
    ]

let opportunity_quality_to_yojson (x : opportunity_quality) =
  assoc_to_yojson
    [
      ("Trend", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.trend);
      ("Score", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.score);
    ]

let recommendation_attribute_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let recommendation_to_yojson (x : recommendation) =
  assoc_to_yojson
    [
      ("Attributes", option_to_yojson recommendation_attribute_map_to_yojson x.attributes);
      ("Details", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.details));
      ("Type", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.type_));
    ]

let recommendation_list_to_yojson tree = list_to_yojson recommendation_to_yojson tree

let aws_opportunity_insights_to_yojson (x : aws_opportunity_insights) =
  assoc_to_yojson
    [
      ("Recommendations", option_to_yojson recommendation_list_to_yojson x.recommendations);
      ("OpportunityQuality", option_to_yojson opportunity_quality_to_yojson x.opportunity_quality);
      ( "AwsProductsSpendInsightsBySource",
        option_to_yojson aws_products_spend_insights_by_source_to_yojson
          x.aws_products_spend_insights_by_source );
      ("EngagementScore", option_to_yojson engagement_score_to_yojson x.engagement_score);
      ( "NextBestActions",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_best_actions
      );
    ]

let involvement_type_change_reason_to_yojson (x : involvement_type_change_reason) =
  match x with
  | RISK_MITIGATION -> `String "Risk Mitigation"
  | TECHNICAL_COMPLEXITY -> `String "Technical Complexity"
  | CUSTOMER_REQUESTED -> `String "Customer Requested"
  | CHANGE_IN_DEAL_INFORMATION -> `String "Change in Deal Information"
  | EXPANSION_OPPORTUNITY -> `String "Expansion Opportunity"

let aws_opportunity_related_entities_to_yojson (x : aws_opportunity_related_entities) =
  assoc_to_yojson
    [
      ( "AwsMarketplaceProducts",
        option_to_yojson aws_marketplace_product_identifiers_to_yojson x.aws_marketplace_products );
      ( "AwsMarketplaceSolutions",
        option_to_yojson aws_marketplace_solution_identifiers_to_yojson x.aws_marketplace_solutions
      );
      ("Solutions", option_to_yojson solution_identifiers_to_yojson x.solutions);
      ("AwsProducts", option_to_yojson aws_product_identifiers_to_yojson x.aws_products);
    ]

let aws_opportunity_customer_to_yojson (x : aws_opportunity_customer) =
  assoc_to_yojson [ ("Contacts", option_to_yojson customer_contacts_list_to_yojson x.contacts) ]

let aws_opportunity_project_to_yojson (x : aws_opportunity_project) =
  assoc_to_yojson
    [
      ("AwsPartition", option_to_yojson aws_partition_to_yojson x.aws_partition);
      ( "ExpectedCustomerSpend",
        option_to_yojson expected_customer_spend_list_to_yojson x.expected_customer_spend );
    ]

let aws_opportunity_summary_full_view_to_yojson (x : aws_opportunity_summary_full_view) =
  assoc_to_yojson
    [
      ( "CosellMotion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cosell_motion );
      ("Project", option_to_yojson aws_opportunity_project_to_yojson x.project);
      ("Customer", option_to_yojson aws_opportunity_customer_to_yojson x.customer);
      ( "RelatedEntityIds",
        option_to_yojson aws_opportunity_related_entities_to_yojson x.related_entity_ids );
      ( "InvolvementTypeChangeReason",
        option_to_yojson involvement_type_change_reason_to_yojson x.involvement_type_change_reason
      );
      ("Insights", option_to_yojson aws_opportunity_insights_to_yojson x.insights);
      ( "OpportunityTeam",
        option_to_yojson aws_opportunity_team_members_list_to_yojson x.opportunity_team );
      ("LifeCycle", option_to_yojson aws_opportunity_life_cycle_to_yojson x.life_cycle);
      ("Visibility", option_to_yojson visibility_to_yojson x.visibility);
      ("InvolvementType", option_to_yojson sales_involvement_type_to_yojson x.involvement_type);
      ("Origin", option_to_yojson opportunity_origin_to_yojson x.origin);
      ( "RelatedOpportunityId",
        option_to_yojson opportunity_identifier_to_yojson x.related_opportunity_id );
    ]

let resource_snapshot_payload_to_yojson (x : resource_snapshot_payload) =
  match x with
  | AwsOpportunitySummaryFullView arg ->
      assoc_to_yojson
        [
          ("AwsOpportunitySummaryFullView", Some (aws_opportunity_summary_full_view_to_yojson arg));
        ]
  | OpportunitySummary arg ->
      assoc_to_yojson [ ("OpportunitySummary", Some (opportunity_summary_view_to_yojson arg)) ]

let resource_snapshot_job_arn_to_yojson = string_to_yojson

let resource_snapshot_job_status_to_yojson (x : resource_snapshot_job_status) =
  match x with STOPPED -> `String "Stopped" | RUNNING -> `String "Running"

let resource_snapshot_job_summary_to_yojson (x : resource_snapshot_job_summary) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson resource_snapshot_job_status_to_yojson x.status);
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
      ("Arn", option_to_yojson resource_snapshot_job_arn_to_yojson x.arn);
      ("Id", option_to_yojson resource_snapshot_job_identifier_to_yojson x.id);
    ]

let resource_snapshot_job_summary_list_to_yojson tree =
  list_to_yojson resource_snapshot_job_summary_to_yojson tree

let resource_snapshot_job_role_identifier_to_yojson = string_to_yojson
let resource_snapshot_job_role_arn_to_yojson = string_to_yojson
let resource_arn_to_yojson = string_to_yojson

let related_entity_type_to_yojson (x : related_entity_type) =
  match x with
  | AWS_MARKETPLACE_PRODUCTS -> `String "AwsMarketplaceProducts"
  | AWS_MARKETPLACE_SOLUTIONS -> `String "AwsMarketplaceSolutions"
  | AWS_MARKETPLACE_OFFER_SETS -> `String "AwsMarketplaceOfferSets"
  | AWS_MARKETPLACE_OFFERS -> `String "AwsMarketplaceOffers"
  | AWS_PRODUCTS -> `String "AwsProducts"
  | SOLUTIONS -> `String "Solutions"

let rejection_reason_string_to_yojson = string_to_yojson

let reject_engagement_invitation_request_to_yojson (x : reject_engagement_invitation_request) =
  assoc_to_yojson
    [
      ("RejectionReason", option_to_yojson rejection_reason_string_to_yojson x.rejection_reason);
      ("Identifier", Some (engagement_invitation_arn_or_identifier_to_yojson x.identifier));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let receiver_responsibility_to_yojson (x : receiver_responsibility) =
  match x with
  | FACILITATOR -> `String "Facilitator"
  | CO_SELL_FACILITATOR -> `String "Co-Sell Facilitator"
  | TRAINING_PARTNER -> `String "Training Partner"
  | SERVICES_PARTNER -> `String "Services Partner"
  | SOFTWARE_PARTNER -> `String "Software Partner"
  | MANAGED_SERVICE_PROVIDER -> `String "Managed Service Provider"
  | HARDWARE_PARTNER -> `String "Hardware Partner"
  | RESELLER -> `String "Reseller"
  | DISTRIBUTOR -> `String "Distributor"

let receiver_responsibility_list_to_yojson tree =
  list_to_yojson receiver_responsibility_to_yojson tree

let alias_to_yojson = string_to_yojson

let account_receiver_to_yojson (x : account_receiver) =
  assoc_to_yojson
    [
      ("AwsAccountId", Some (aws_account_to_yojson x.aws_account_id));
      ("Alias", option_to_yojson alias_to_yojson x.alias);
    ]

let receiver_to_yojson (x : receiver) =
  match x with
  | Account arg -> assoc_to_yojson [ ("Account", Some (account_receiver_to_yojson arg)) ]

let put_selling_system_settings_response_to_yojson (x : put_selling_system_settings_response) =
  assoc_to_yojson
    [
      ( "ResourceSnapshotJobRoleArn",
        option_to_yojson resource_snapshot_job_role_arn_to_yojson x.resource_snapshot_job_role_arn
      );
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let put_selling_system_settings_request_to_yojson (x : put_selling_system_settings_request) =
  assoc_to_yojson
    [
      ( "ResourceSnapshotJobRoleIdentifier",
        option_to_yojson resource_snapshot_job_role_identifier_to_yojson
          x.resource_snapshot_job_role_identifier );
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let prospecting_task_summary_to_yojson (x : prospecting_task_summary) =
  assoc_to_yojson
    [
      ( "FailedEngagementCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.failed_engagement_count) );
      ( "CompletedEngagementCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.completed_engagement_count)
      );
      ( "TotalEngagementCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.total_engagement_count) );
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
      ("StartTime", Some (date_time_to_yojson x.start_time));
      ("TaskName", Some (task_name_to_yojson x.task_name));
      ("TaskArn", Some (prospecting_task_arn_to_yojson x.task_arn));
      ("TaskId", Some (prospecting_task_identifier_to_yojson x.task_id));
    ]

let prospecting_task_summary_list_to_yojson tree =
  list_to_yojson prospecting_task_summary_to_yojson tree

let prospecting_from_engagement_task_sort_name_to_yojson
    (x : prospecting_from_engagement_task_sort_name) =
  match x with
  | FailedEngagementCount -> `String "FailedEngagementCount"
  | TaskName -> `String "TaskName"
  | StartTime -> `String "StartTime"

let prospecting_from_engagement_task_sort_to_yojson (x : prospecting_from_engagement_task_sort) =
  assoc_to_yojson
    [
      ("SortBy", Some (prospecting_from_engagement_task_sort_name_to_yojson x.sort_by));
      ("SortOrder", Some (sort_order_to_yojson x.sort_order));
    ]

let project_summary_to_yojson (x : project_summary) =
  assoc_to_yojson
    [
      ( "ExpectedContractDuration",
        option_to_yojson expected_contract_duration_to_yojson x.expected_contract_duration );
      ( "ExpectedCustomerSpend",
        option_to_yojson expected_customer_spend_list_to_yojson x.expected_customer_spend );
      ("DeliveryModels", option_to_yojson delivery_models_to_yojson x.delivery_models);
    ]

let project_details_to_yojson (x : project_details) =
  assoc_to_yojson
    [
      ( "ExpectedCustomerSpend",
        Some (expected_customer_spend_list_to_yojson x.expected_customer_spend) );
      ("TargetCompletionDate", Some (date_to_yojson x.target_completion_date));
      ("Title", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.title));
      ("BusinessProblem", Some (engagement_customer_business_problem_to_yojson x.business_problem));
    ]

let opportunity_invitation_payload_to_yojson (x : opportunity_invitation_payload) =
  assoc_to_yojson
    [
      ("Project", Some (project_details_to_yojson x.project));
      ("Customer", Some (engagement_customer_to_yojson x.customer));
      ( "ReceiverResponsibilities",
        Some (receiver_responsibility_list_to_yojson x.receiver_responsibilities) );
      ("SenderContacts", option_to_yojson sender_contact_list_to_yojson x.sender_contacts);
    ]

let lead_invitation_customer_to_yojson (x : lead_invitation_customer) =
  assoc_to_yojson
    [
      ("MarketSegment", option_to_yojson market_segment_to_yojson x.market_segment);
      ("AwsMaturity", option_to_yojson aws_maturity_to_yojson x.aws_maturity);
      ("CountryCode", Some (country_code_to_yojson x.country_code));
      ("WebsiteUrl", option_to_yojson company_website_url_to_yojson x.website_url);
      ("CompanyName", Some (company_name_to_yojson x.company_name));
      ("Industry", option_to_yojson industry_to_yojson x.industry);
    ]

let lead_invitation_interaction_to_yojson (x : lead_invitation_interaction) =
  assoc_to_yojson
    [
      ("ContactBusinessTitle", Some (job_title_to_yojson x.contact_business_title));
      ("Usecase", option_to_yojson engagement_use_case_to_yojson x.usecase);
      ("SourceName", Some (lead_source_name_to_yojson x.source_name));
      ("SourceId", Some (lead_source_id_to_yojson x.source_id));
      ("SourceType", Some (lead_source_type_to_yojson x.source_type));
    ]

let lead_invitation_payload_to_yojson (x : lead_invitation_payload) =
  assoc_to_yojson
    [
      ("Interaction", Some (lead_invitation_interaction_to_yojson x.interaction));
      ("Customer", Some (lead_invitation_customer_to_yojson x.customer));
    ]

let payload_to_yojson (x : payload) =
  match x with
  | LeadInvitation arg ->
      assoc_to_yojson [ ("LeadInvitation", Some (lead_invitation_payload_to_yojson arg)) ]
  | OpportunityInvitation arg ->
      assoc_to_yojson
        [ ("OpportunityInvitation", Some (opportunity_invitation_payload_to_yojson arg)) ]

let participant_type_to_yojson (x : participant_type) =
  match x with RECEIVER -> `String "RECEIVER" | SENDER -> `String "SENDER"

let page_size_to_yojson = int_to_yojson
let opportunity_arn_to_yojson = string_to_yojson

let life_cycle_summary_to_yojson (x : life_cycle_summary) =
  assoc_to_yojson
    [
      ( "ReviewStatusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.review_status_reason );
      ( "ReviewComments",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.review_comments
      );
      ("ReviewStatus", option_to_yojson review_status_to_yojson x.review_status);
      ("TargetCloseDate", option_to_yojson date_to_yojson x.target_close_date);
      ("NextSteps", option_to_yojson pii_string_to_yojson x.next_steps);
      ("ClosedLostReason", option_to_yojson closed_lost_reason_to_yojson x.closed_lost_reason);
      ("Stage", option_to_yojson stage_to_yojson x.stage);
    ]

let account_summary_to_yojson (x : account_summary) =
  assoc_to_yojson
    [
      ("Address", option_to_yojson address_summary_to_yojson x.address);
      ("WebsiteUrl", option_to_yojson website_url_to_yojson x.website_url);
      ("CompanyName", Some (name_to_yojson x.company_name));
      ( "OtherIndustry",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.other_industry );
      ("Industry", option_to_yojson industry_to_yojson x.industry);
    ]

let customer_summary_to_yojson (x : customer_summary) =
  assoc_to_yojson [ ("Account", option_to_yojson account_summary_to_yojson x.account) ]

let opportunity_summary_to_yojson (x : opportunity_summary) =
  assoc_to_yojson
    [
      ("Project", option_to_yojson project_summary_to_yojson x.project);
      ("Customer", option_to_yojson customer_summary_to_yojson x.customer);
      ("LifeCycle", option_to_yojson life_cycle_summary_to_yojson x.life_cycle);
      ("CreatedDate", option_to_yojson date_time_to_yojson x.created_date);
      ("LastModifiedDate", option_to_yojson date_time_to_yojson x.last_modified_date);
      ("OpportunityType", option_to_yojson opportunity_type_to_yojson x.opportunity_type);
      ( "PartnerOpportunityIdentifier",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.partner_opportunity_identifier );
      ("Arn", option_to_yojson opportunity_arn_to_yojson x.arn);
      ("Id", option_to_yojson opportunity_identifier_to_yojson x.id);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let opportunity_summaries_to_yojson tree = list_to_yojson opportunity_summary_to_yojson tree

let opportunity_sort_name_to_yojson (x : opportunity_sort_name) =
  match x with
  | TARGET_CLOSE_DATE -> `String "TargetCloseDate"
  | CREATED_DATE -> `String "CreatedDate"
  | CUSTOMER_COMPANY_NAME -> `String "CustomerCompanyName"
  | IDENTIFIER -> `String "Identifier"
  | LAST_MODIFIEDDATE -> `String "LastModifiedDate"

let opportunity_sort_to_yojson (x : opportunity_sort) =
  assoc_to_yojson
    [
      ("SortBy", Some (opportunity_sort_name_to_yojson x.sort_by));
      ("SortOrder", Some (sort_order_to_yojson x.sort_order));
    ]

let opportunity_identifiers_to_yojson tree = list_to_yojson opportunity_identifier_to_yojson tree

let opportunity_engagement_invitation_sort_name_to_yojson
    (x : opportunity_engagement_invitation_sort_name) =
  match x with INVITATION_DATE -> `String "InvitationDate"

let opportunity_engagement_invitation_sort_to_yojson (x : opportunity_engagement_invitation_sort) =
  assoc_to_yojson
    [
      ("SortBy", Some (opportunity_engagement_invitation_sort_name_to_yojson x.sort_by));
      ("SortOrder", Some (sort_order_to_yojson x.sort_order));
    ]

let member_page_size_to_yojson = int_to_yojson
let member_company_name_to_yojson = string_to_yojson

let list_tasks_sort_name_to_yojson (x : list_tasks_sort_name) =
  match x with START_TIME -> `String "StartTime"

let list_tasks_sort_base_to_yojson (x : list_tasks_sort_base) =
  assoc_to_yojson
    [
      ("SortBy", Some (list_tasks_sort_name_to_yojson x.sort_by));
      ("SortOrder", Some (sort_order_to_yojson x.sort_order));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", Some (tag_list_to_yojson x.tags)) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn)) ]

let list_solutions_response_to_yojson (x : list_solutions_response) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("SolutionSummaries", Some (solution_list_to_yojson x.solution_summaries));
    ]

let filter_status_to_yojson tree = list_to_yojson solution_status_to_yojson tree

let aws_marketplace_solution_arn_list_to_yojson tree =
  list_to_yojson aws_marketplace_solution_arn_to_yojson tree

let list_solutions_request_to_yojson (x : list_solutions_request) =
  assoc_to_yojson
    [
      ( "AwsMarketplaceSolutionArn",
        option_to_yojson aws_marketplace_solution_arn_list_to_yojson x.aws_marketplace_solution_arn
      );
      ("Category", option_to_yojson string_list_to_yojson x.category);
      ("Identifier", option_to_yojson solution_identifiers_to_yojson x.identifier);
      ("Status", option_to_yojson filter_status_to_yojson x.status);
      ("Sort", option_to_yojson solution_sort_to_yojson x.sort);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let list_resource_snapshots_response_to_yojson (x : list_resource_snapshots_response) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "ResourceSnapshotSummaries",
        Some (resource_snapshot_summary_list_to_yojson x.resource_snapshot_summaries) );
    ]

let list_resource_snapshots_request_to_yojson (x : list_resource_snapshots_request) =
  assoc_to_yojson
    [
      ("CreatedBy", option_to_yojson aws_account_to_yojson x.created_by);
      ( "ResourceSnapshotTemplateIdentifier",
        option_to_yojson resource_template_name_to_yojson x.resource_snapshot_template_identifier );
      ("ResourceIdentifier", option_to_yojson resource_identifier_to_yojson x.resource_identifier);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("EngagementIdentifier", Some (engagement_identifier_to_yojson x.engagement_identifier));
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let list_resource_snapshot_jobs_response_to_yojson (x : list_resource_snapshot_jobs_response) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "ResourceSnapshotJobSummaries",
        Some (resource_snapshot_job_summary_list_to_yojson x.resource_snapshot_job_summaries) );
    ]

let list_resource_snapshot_jobs_request_to_yojson (x : list_resource_snapshot_jobs_request) =
  assoc_to_yojson
    [
      ("Sort", option_to_yojson sort_object_to_yojson x.sort);
      ("Status", option_to_yojson resource_snapshot_job_status_to_yojson x.status);
      ( "EngagementIdentifier",
        option_to_yojson engagement_identifier_to_yojson x.engagement_identifier );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let list_prospecting_from_engagement_tasks_response_to_yojson
    (x : list_prospecting_from_engagement_tasks_response) =
  assoc_to_yojson
    [
      ("TaskSummaries", Some (prospecting_task_summary_list_to_yojson x.task_summaries));
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_prospecting_from_engagement_tasks_request_to_yojson
    (x : list_prospecting_from_engagement_tasks_request) =
  assoc_to_yojson
    [
      ("Sort", option_to_yojson prospecting_from_engagement_task_sort_to_yojson x.sort);
      ("StartBefore", option_to_yojson date_time_to_yojson x.start_before);
      ("StartAfter", option_to_yojson date_time_to_yojson x.start_after);
      ("TaskName", option_to_yojson task_name_list_to_yojson x.task_name);
      ("TaskIdentifier", option_to_yojson task_identifier_list_to_yojson x.task_identifier);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let list_opportunity_from_engagement_task_summary_to_yojson
    (x : list_opportunity_from_engagement_task_summary) =
  assoc_to_yojson
    [
      ("ContextId", option_to_yojson context_identifier_to_yojson x.context_id);
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
      ( "ResourceSnapshotJobId",
        option_to_yojson resource_snapshot_job_identifier_to_yojson x.resource_snapshot_job_id );
      ("OpportunityId", option_to_yojson opportunity_identifier_to_yojson x.opportunity_id);
      ("ReasonCode", option_to_yojson reason_code_to_yojson x.reason_code);
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("TaskStatus", option_to_yojson task_status_to_yojson x.task_status);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn);
      ("TaskId", option_to_yojson task_identifier_to_yojson x.task_id);
    ]

let list_opportunity_from_engagement_task_summaries_to_yojson tree =
  list_to_yojson list_opportunity_from_engagement_task_summary_to_yojson tree

let list_opportunity_from_engagement_tasks_response_to_yojson
    (x : list_opportunity_from_engagement_tasks_response) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "TaskSummaries",
        option_to_yojson list_opportunity_from_engagement_task_summaries_to_yojson x.task_summaries
      );
    ]

let engagement_identifiers_to_yojson tree =
  list_to_yojson engagement_arn_or_identifier_to_yojson tree

let context_identifiers_to_yojson tree = list_to_yojson context_identifier_to_yojson tree

let list_opportunity_from_engagement_tasks_request_to_yojson
    (x : list_opportunity_from_engagement_tasks_request) =
  assoc_to_yojson
    [
      ("ContextIdentifier", option_to_yojson context_identifiers_to_yojson x.context_identifier);
      ( "EngagementIdentifier",
        option_to_yojson engagement_identifiers_to_yojson x.engagement_identifier );
      ( "OpportunityIdentifier",
        option_to_yojson opportunity_identifiers_to_yojson x.opportunity_identifier );
      ("TaskIdentifier", option_to_yojson task_identifiers_to_yojson x.task_identifier);
      ("TaskStatus", option_to_yojson task_statuses_to_yojson x.task_status);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("Sort", option_to_yojson list_tasks_sort_base_to_yojson x.sort);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let list_opportunities_response_to_yojson (x : list_opportunities_response) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("OpportunitySummaries", Some (opportunity_summaries_to_yojson x.opportunity_summaries));
    ]

let last_modified_date_to_yojson (x : last_modified_date) =
  assoc_to_yojson
    [
      ("BeforeLastModifiedDate", option_to_yojson date_time_to_yojson x.before_last_modified_date);
      ("AfterLastModifiedDate", option_to_yojson date_time_to_yojson x.after_last_modified_date);
    ]

let filter_identifier_to_yojson tree = list_to_yojson opportunity_identifier_to_yojson tree
let filter_life_cycle_stage_to_yojson tree = list_to_yojson stage_to_yojson tree
let filter_life_cycle_review_status_to_yojson tree = list_to_yojson review_status_to_yojson tree

let created_date_filter_to_yojson (x : created_date_filter) =
  assoc_to_yojson
    [
      ("BeforeCreatedDate", option_to_yojson date_time_to_yojson x.before_created_date);
      ("AfterCreatedDate", option_to_yojson date_time_to_yojson x.after_created_date);
    ]

let list_opportunities_request_to_yojson (x : list_opportunities_request) =
  assoc_to_yojson
    [
      ("TargetCloseDate", option_to_yojson target_close_date_filter_to_yojson x.target_close_date);
      ("CreatedDate", option_to_yojson created_date_filter_to_yojson x.created_date);
      ("CustomerCompanyName", option_to_yojson string_list_to_yojson x.customer_company_name);
      ( "LifeCycleReviewStatus",
        option_to_yojson filter_life_cycle_review_status_to_yojson x.life_cycle_review_status );
      ("LifeCycleStage", option_to_yojson filter_life_cycle_stage_to_yojson x.life_cycle_stage);
      ("Identifier", option_to_yojson filter_identifier_to_yojson x.identifier);
      ("LastModifiedDate", option_to_yojson last_modified_date_to_yojson x.last_modified_date);
      ("Sort", option_to_yojson opportunity_sort_to_yojson x.sort);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let engagement_title_to_yojson = string_to_yojson

let engagement_context_type_list_to_yojson tree =
  list_to_yojson engagement_context_type_to_yojson tree

let engagement_summary_to_yojson (x : engagement_summary) =
  assoc_to_yojson
    [
      ("ContextTypes", option_to_yojson engagement_context_type_list_to_yojson x.context_types);
      ("ModifiedBy", option_to_yojson aws_account_to_yojson x.modified_by);
      ("ModifiedAt", option_to_yojson date_time_to_yojson x.modified_at);
      ( "MemberCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.member_count );
      ("CreatedBy", option_to_yojson aws_account_to_yojson x.created_by);
      ("CreatedAt", option_to_yojson date_time_to_yojson x.created_at);
      ("Title", option_to_yojson engagement_title_to_yojson x.title);
      ("Id", option_to_yojson engagement_identifier_to_yojson x.id);
      ("Arn", option_to_yojson engagement_arn_to_yojson x.arn);
    ]

let engagement_summary_list_to_yojson tree = list_to_yojson engagement_summary_to_yojson tree

let list_engagements_response_to_yojson (x : list_engagements_response) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("EngagementSummaryList", Some (engagement_summary_list_to_yojson x.engagement_summary_list));
    ]

let aws_account_list_to_yojson tree = list_to_yojson aws_account_to_yojson tree

let engagement_sort_name_to_yojson (x : engagement_sort_name) =
  match x with CreatedDate -> `String "CreatedDate"

let engagement_sort_to_yojson (x : engagement_sort) =
  assoc_to_yojson
    [
      ("SortBy", Some (engagement_sort_name_to_yojson x.sort_by));
      ("SortOrder", Some (sort_order_to_yojson x.sort_order));
    ]

let engagement_page_size_to_yojson = int_to_yojson

let list_engagements_request_to_yojson (x : list_engagements_request) =
  assoc_to_yojson
    [
      ( "EngagementIdentifier",
        option_to_yojson engagement_identifiers_to_yojson x.engagement_identifier );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("MaxResults", option_to_yojson engagement_page_size_to_yojson x.max_results);
      ("Sort", option_to_yojson engagement_sort_to_yojson x.sort);
      ( "ExcludeContextTypes",
        option_to_yojson engagement_context_type_list_to_yojson x.exclude_context_types );
      ("ContextTypes", option_to_yojson engagement_context_type_list_to_yojson x.context_types);
      ("ExcludeCreatedBy", option_to_yojson aws_account_list_to_yojson x.exclude_created_by);
      ("CreatedBy", option_to_yojson aws_account_list_to_yojson x.created_by);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let engagement_resource_association_summary_to_yojson (x : engagement_resource_association_summary)
    =
  assoc_to_yojson
    [
      ("CreatedBy", option_to_yojson aws_account_to_yojson x.created_by);
      ("ResourceId", option_to_yojson resource_identifier_to_yojson x.resource_id);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let engagement_resource_association_summary_list_to_yojson tree =
  list_to_yojson engagement_resource_association_summary_to_yojson tree

let list_engagement_resource_associations_response_to_yojson
    (x : list_engagement_resource_associations_response) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "EngagementResourceAssociationSummaries",
        Some
          (engagement_resource_association_summary_list_to_yojson
             x.engagement_resource_association_summaries) );
    ]

let list_engagement_resource_associations_request_to_yojson
    (x : list_engagement_resource_associations_request) =
  assoc_to_yojson
    [
      ("CreatedBy", option_to_yojson aws_account_to_yojson x.created_by);
      ("ResourceIdentifier", option_to_yojson resource_identifier_to_yojson x.resource_identifier);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ( "EngagementIdentifier",
        option_to_yojson engagement_identifier_to_yojson x.engagement_identifier );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let engagement_member_to_yojson (x : engagement_member) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson aws_account_to_yojson x.account_id);
      ( "WebsiteUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.website_url );
      ("CompanyName", option_to_yojson member_company_name_to_yojson x.company_name);
    ]

let engagement_members_to_yojson tree = list_to_yojson engagement_member_to_yojson tree

let list_engagement_members_response_to_yojson (x : list_engagement_members_response) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("EngagementMemberList", Some (engagement_members_to_yojson x.engagement_member_list));
    ]

let list_engagement_members_request_to_yojson (x : list_engagement_members_request) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("MaxResults", option_to_yojson member_page_size_to_yojson x.max_results);
      ("Identifier", Some (engagement_arn_or_identifier_to_yojson x.identifier));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let engagement_invitation_payload_type_to_yojson (x : engagement_invitation_payload_type) =
  match x with
  | LEAD_INVITATION -> `String "LeadInvitation"
  | OPPORTUNITY_INVITATION -> `String "OpportunityInvitation"

let invitation_status_to_yojson (x : invitation_status) =
  match x with
  | EXPIRED -> `String "EXPIRED"
  | REJECTED -> `String "REJECTED"
  | PENDING -> `String "PENDING"
  | ACCEPTED -> `String "ACCEPTED"

let engagement_invitation_summary_to_yojson (x : engagement_invitation_summary) =
  assoc_to_yojson
    [
      ("ParticipantType", option_to_yojson participant_type_to_yojson x.participant_type);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("Receiver", option_to_yojson receiver_to_yojson x.receiver);
      ( "SenderCompanyName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.sender_company_name );
      ("SenderAwsAccountId", option_to_yojson aws_account_to_yojson x.sender_aws_account_id);
      ("ExpirationDate", option_to_yojson date_time_to_yojson x.expiration_date);
      ("InvitationDate", option_to_yojson date_time_to_yojson x.invitation_date);
      ("Status", option_to_yojson invitation_status_to_yojson x.status);
      ("EngagementTitle", option_to_yojson engagement_title_to_yojson x.engagement_title);
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
      ("Id", Some (engagement_invitation_arn_or_identifier_to_yojson x.id));
      ("PayloadType", option_to_yojson engagement_invitation_payload_type_to_yojson x.payload_type);
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
    ]

let engagement_invitation_summaries_to_yojson tree =
  list_to_yojson engagement_invitation_summary_to_yojson tree

let list_engagement_invitations_response_to_yojson (x : list_engagement_invitations_response) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "EngagementInvitationSummaries",
        option_to_yojson engagement_invitation_summaries_to_yojson x.engagement_invitation_summaries
      );
    ]

let engagement_invitations_payload_type_to_yojson tree =
  list_to_yojson engagement_invitation_payload_type_to_yojson tree

let invitation_status_list_to_yojson tree = list_to_yojson invitation_status_to_yojson tree
let aws_account_id_or_alias_list_to_yojson tree = list_to_yojson aws_account_to_yojson tree

let list_engagement_invitations_request_to_yojson (x : list_engagement_invitations_request) =
  assoc_to_yojson
    [
      ( "SenderAwsAccountId",
        option_to_yojson aws_account_id_or_alias_list_to_yojson x.sender_aws_account_id );
      ( "EngagementIdentifier",
        option_to_yojson engagement_identifiers_to_yojson x.engagement_identifier );
      ("Status", option_to_yojson invitation_status_list_to_yojson x.status);
      ("ParticipantType", Some (participant_type_to_yojson x.participant_type));
      ("PayloadType", option_to_yojson engagement_invitations_payload_type_to_yojson x.payload_type);
      ("Sort", option_to_yojson opportunity_engagement_invitation_sort_to_yojson x.sort);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let list_engagement_from_opportunity_task_summary_to_yojson
    (x : list_engagement_from_opportunity_task_summary) =
  assoc_to_yojson
    [
      ( "EngagementInvitationId",
        option_to_yojson engagement_invitation_identifier_to_yojson x.engagement_invitation_id );
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
      ( "ResourceSnapshotJobId",
        option_to_yojson resource_snapshot_job_identifier_to_yojson x.resource_snapshot_job_id );
      ("OpportunityId", option_to_yojson opportunity_identifier_to_yojson x.opportunity_id);
      ("ReasonCode", option_to_yojson reason_code_to_yojson x.reason_code);
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("TaskStatus", option_to_yojson task_status_to_yojson x.task_status);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn);
      ("TaskId", option_to_yojson task_identifier_to_yojson x.task_id);
    ]

let list_engagement_from_opportunity_task_summaries_to_yojson tree =
  list_to_yojson list_engagement_from_opportunity_task_summary_to_yojson tree

let list_engagement_from_opportunity_tasks_response_to_yojson
    (x : list_engagement_from_opportunity_tasks_response) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "TaskSummaries",
        option_to_yojson list_engagement_from_opportunity_task_summaries_to_yojson x.task_summaries
      );
    ]

let list_engagement_from_opportunity_tasks_request_to_yojson
    (x : list_engagement_from_opportunity_tasks_request) =
  assoc_to_yojson
    [
      ( "EngagementIdentifier",
        option_to_yojson engagement_identifiers_to_yojson x.engagement_identifier );
      ( "OpportunityIdentifier",
        option_to_yojson opportunity_identifiers_to_yojson x.opportunity_identifier );
      ("TaskIdentifier", option_to_yojson task_identifiers_to_yojson x.task_identifier);
      ("TaskStatus", option_to_yojson task_statuses_to_yojson x.task_status);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("Sort", option_to_yojson list_tasks_sort_base_to_yojson x.sort);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let list_engagement_by_accepting_invitation_task_summary_to_yojson
    (x : list_engagement_by_accepting_invitation_task_summary) =
  assoc_to_yojson
    [
      ( "EngagementInvitationId",
        option_to_yojson engagement_invitation_identifier_to_yojson x.engagement_invitation_id );
      ( "ResourceSnapshotJobId",
        option_to_yojson resource_snapshot_job_identifier_to_yojson x.resource_snapshot_job_id );
      ("OpportunityId", option_to_yojson opportunity_identifier_to_yojson x.opportunity_id);
      ("ReasonCode", option_to_yojson reason_code_to_yojson x.reason_code);
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("TaskStatus", option_to_yojson task_status_to_yojson x.task_status);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn);
      ("TaskId", option_to_yojson task_identifier_to_yojson x.task_id);
    ]

let list_engagement_by_accepting_invitation_task_summaries_to_yojson tree =
  list_to_yojson list_engagement_by_accepting_invitation_task_summary_to_yojson tree

let list_engagement_by_accepting_invitation_tasks_response_to_yojson
    (x : list_engagement_by_accepting_invitation_tasks_response) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "TaskSummaries",
        option_to_yojson list_engagement_by_accepting_invitation_task_summaries_to_yojson
          x.task_summaries );
    ]

let engagement_invitation_identifiers_to_yojson tree =
  list_to_yojson engagement_invitation_arn_or_identifier_to_yojson tree

let list_engagement_by_accepting_invitation_tasks_request_to_yojson
    (x : list_engagement_by_accepting_invitation_tasks_request) =
  assoc_to_yojson
    [
      ("TaskIdentifier", option_to_yojson task_identifiers_to_yojson x.task_identifier);
      ( "EngagementInvitationIdentifier",
        option_to_yojson engagement_invitation_identifiers_to_yojson
          x.engagement_invitation_identifier );
      ( "OpportunityIdentifier",
        option_to_yojson opportunity_identifiers_to_yojson x.opportunity_identifier );
      ("TaskStatus", option_to_yojson task_statuses_to_yojson x.task_status);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("Sort", option_to_yojson list_tasks_sort_base_to_yojson x.sort);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let lead_interaction_list_to_yojson tree = list_to_yojson lead_interaction_to_yojson tree

let lead_context_to_yojson (x : lead_context) =
  assoc_to_yojson
    [
      ("Interactions", Some (lead_interaction_list_to_yojson x.interactions));
      ("Customer", Some (lead_customer_to_yojson x.customer));
      ( "QualificationStatus",
        option_to_yojson lead_qualification_status_to_yojson x.qualification_status );
      ("Insights", option_to_yojson lead_insights_to_yojson x.insights);
    ]

let invitation_message_to_yojson = string_to_yojson

let invitation_to_yojson (x : invitation) =
  assoc_to_yojson
    [
      ("Payload", Some (payload_to_yojson x.payload));
      ("Receiver", Some (receiver_to_yojson x.receiver));
      ("Message", Some (invitation_message_to_yojson x.message));
    ]

let get_selling_system_settings_response_to_yojson (x : get_selling_system_settings_response) =
  assoc_to_yojson
    [
      ( "ResourceSnapshotJobRoleArn",
        option_to_yojson resource_snapshot_job_role_arn_to_yojson x.resource_snapshot_job_role_arn
      );
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let get_selling_system_settings_request_to_yojson (x : get_selling_system_settings_request) =
  assoc_to_yojson [ ("Catalog", Some (catalog_identifier_to_yojson x.catalog)) ]

let get_resource_snapshot_response_to_yojson (x : get_resource_snapshot_response) =
  assoc_to_yojson
    [
      ( "TargetMemberAccounts",
        option_to_yojson aws_account_id_or_alias_list_to_yojson x.target_member_accounts );
      ("Payload", option_to_yojson resource_snapshot_payload_to_yojson x.payload);
      ("Revision", option_to_yojson resource_snapshot_revision_to_yojson x.revision);
      ( "ResourceSnapshotTemplateName",
        option_to_yojson resource_template_name_to_yojson x.resource_snapshot_template_name );
      ("ResourceId", option_to_yojson resource_identifier_to_yojson x.resource_id);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
      ("CreatedAt", option_to_yojson date_time_to_yojson x.created_at);
      ("CreatedBy", option_to_yojson aws_account_to_yojson x.created_by);
      ("Arn", option_to_yojson resource_arn_to_yojson x.arn);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let get_resource_snapshot_request_to_yojson (x : get_resource_snapshot_request) =
  assoc_to_yojson
    [
      ("Revision", option_to_yojson resource_snapshot_revision_to_yojson x.revision);
      ( "ResourceSnapshotTemplateIdentifier",
        Some (resource_template_name_to_yojson x.resource_snapshot_template_identifier) );
      ("ResourceIdentifier", Some (resource_identifier_to_yojson x.resource_identifier));
      ("ResourceType", Some (resource_type_to_yojson x.resource_type));
      ("EngagementIdentifier", Some (engagement_identifier_to_yojson x.engagement_identifier));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let get_resource_snapshot_job_response_to_yojson (x : get_resource_snapshot_job_response) =
  assoc_to_yojson
    [
      ( "LastFailure",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.last_failure );
      ( "LastSuccessfulExecutionDate",
        option_to_yojson date_time_to_yojson x.last_successful_execution_date );
      ("Status", option_to_yojson resource_snapshot_job_status_to_yojson x.status);
      ("CreatedAt", option_to_yojson date_time_to_yojson x.created_at);
      ( "ResourceSnapshotTemplateName",
        option_to_yojson resource_template_name_to_yojson x.resource_snapshot_template_name );
      ("ResourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("ResourceId", option_to_yojson resource_identifier_to_yojson x.resource_id);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
      ("Arn", option_to_yojson resource_snapshot_job_arn_to_yojson x.arn);
      ("Id", option_to_yojson resource_snapshot_job_identifier_to_yojson x.id);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let get_resource_snapshot_job_request_to_yojson (x : get_resource_snapshot_job_request) =
  assoc_to_yojson
    [
      ( "ResourceSnapshotJobIdentifier",
        Some (resource_snapshot_job_identifier_to_yojson x.resource_snapshot_job_identifier) );
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let engagement_prospecting_result_to_yojson (x : engagement_prospecting_result) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ( "ReasonCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reason_code );
      ("Status", Some (prospecting_task_status_to_yojson x.status));
      ( "EngagementContextId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.engagement_context_id );
      ("EngagementIdentifier", Some (engagement_identifier_to_yojson x.engagement_identifier));
    ]

let engagement_prospecting_result_list_to_yojson tree =
  list_to_yojson engagement_prospecting_result_to_yojson tree

let get_prospecting_from_engagement_task_response_to_yojson
    (x : get_prospecting_from_engagement_task_response) =
  assoc_to_yojson
    [
      ("Engagements", Some (engagement_prospecting_result_list_to_yojson x.engagements));
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
      ("StartTime", Some (date_time_to_yojson x.start_time));
      ("TaskName", Some (task_name_to_yojson x.task_name));
      ("TaskArn", Some (prospecting_task_arn_to_yojson x.task_arn));
      ("TaskId", Some (prospecting_task_identifier_to_yojson x.task_id));
    ]

let get_prospecting_from_engagement_task_request_to_yojson
    (x : get_prospecting_from_engagement_task_request) =
  assoc_to_yojson
    [
      ("TaskIdentifier", Some (prospecting_task_identifier_to_yojson x.task_identifier));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let get_opportunity_response_to_yojson (x : get_opportunity_response) =
  assoc_to_yojson
    [
      ( "OpportunityTeam",
        option_to_yojson partner_opportunity_team_members_list_to_yojson x.opportunity_team );
      ("LifeCycle", option_to_yojson life_cycle_to_yojson x.life_cycle);
      ( "RelatedEntityIdentifiers",
        Some (related_entity_identifiers_to_yojson x.related_entity_identifiers) );
      ("CreatedDate", Some (date_time_to_yojson x.created_date));
      ("LastModifiedDate", Some (date_time_to_yojson x.last_modified_date));
      ("Arn", option_to_yojson opportunity_arn_to_yojson x.arn);
      ("Id", Some (opportunity_identifier_to_yojson x.id));
      ("SoftwareRevenue", option_to_yojson software_revenue_to_yojson x.software_revenue);
      ("Marketing", option_to_yojson marketing_to_yojson x.marketing);
      ("OpportunityType", option_to_yojson opportunity_type_to_yojson x.opportunity_type);
      ("Project", option_to_yojson project_to_yojson x.project);
      ("Customer", option_to_yojson customer_to_yojson x.customer);
      ( "PartnerOpportunityIdentifier",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.partner_opportunity_identifier );
      ("NationalSecurity", option_to_yojson national_security_to_yojson x.national_security);
      ( "PrimaryNeedsFromAws",
        option_to_yojson primary_needs_from_aws_to_yojson x.primary_needs_from_aws );
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let get_opportunity_request_to_yojson (x : get_opportunity_request) =
  assoc_to_yojson
    [
      ("Identifier", Some (opportunity_identifier_to_yojson x.identifier));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let engagement_description_to_yojson = string_to_yojson

let engagement_context_payload_to_yojson (x : engagement_context_payload) =
  match x with
  | ProspectingResult arg ->
      assoc_to_yojson [ ("ProspectingResult", Some (prospecting_result_to_yojson arg)) ]
  | Lead arg -> assoc_to_yojson [ ("Lead", Some (lead_context_to_yojson arg)) ]
  | CustomerProject arg ->
      assoc_to_yojson [ ("CustomerProject", Some (customer_projects_context_to_yojson arg)) ]

let engagement_context_details_to_yojson (x : engagement_context_details) =
  assoc_to_yojson
    [
      ("Payload", option_to_yojson engagement_context_payload_to_yojson x.payload);
      ("Type", Some (engagement_context_type_to_yojson x.type_));
      ("Id", option_to_yojson engagement_context_identifier_to_yojson x.id);
    ]

let engagement_contexts_to_yojson tree = list_to_yojson engagement_context_details_to_yojson tree

let get_engagement_response_to_yojson (x : get_engagement_response) =
  assoc_to_yojson
    [
      ("Contexts", option_to_yojson engagement_contexts_to_yojson x.contexts);
      ("ModifiedBy", option_to_yojson aws_account_to_yojson x.modified_by);
      ("ModifiedAt", option_to_yojson date_time_to_yojson x.modified_at);
      ( "MemberCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.member_count );
      ("CreatedBy", option_to_yojson aws_account_to_yojson x.created_by);
      ("CreatedAt", option_to_yojson date_time_to_yojson x.created_at);
      ("Description", option_to_yojson engagement_description_to_yojson x.description);
      ("Title", option_to_yojson engagement_title_to_yojson x.title);
      ("Arn", option_to_yojson engagement_arn_to_yojson x.arn);
      ("Id", option_to_yojson engagement_identifier_to_yojson x.id);
    ]

let get_engagement_request_to_yojson (x : get_engagement_request) =
  assoc_to_yojson
    [
      ("Identifier", Some (engagement_arn_or_identifier_to_yojson x.identifier));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let engagement_member_summary_to_yojson (x : engagement_member_summary) =
  assoc_to_yojson
    [
      ( "WebsiteUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.website_url );
      ("CompanyName", option_to_yojson member_company_name_to_yojson x.company_name);
    ]

let engagement_member_summaries_to_yojson tree =
  list_to_yojson engagement_member_summary_to_yojson tree

let get_engagement_invitation_response_to_yojson (x : get_engagement_invitation_response) =
  assoc_to_yojson
    [
      ("ExistingMembers", option_to_yojson engagement_member_summaries_to_yojson x.existing_members);
      ( "EngagementDescription",
        option_to_yojson engagement_description_to_yojson x.engagement_description );
      ("InvitationMessage", option_to_yojson invitation_message_to_yojson x.invitation_message);
      ("Payload", option_to_yojson payload_to_yojson x.payload);
      ("RejectionReason", option_to_yojson rejection_reason_string_to_yojson x.rejection_reason);
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ("Receiver", option_to_yojson receiver_to_yojson x.receiver);
      ( "SenderCompanyName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.sender_company_name );
      ("SenderAwsAccountId", option_to_yojson aws_account_to_yojson x.sender_aws_account_id);
      ("ExpirationDate", option_to_yojson date_time_to_yojson x.expiration_date);
      ("InvitationDate", option_to_yojson date_time_to_yojson x.invitation_date);
      ("Status", option_to_yojson invitation_status_to_yojson x.status);
      ("EngagementTitle", option_to_yojson engagement_title_to_yojson x.engagement_title);
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
      ("Id", Some (engagement_invitation_arn_or_identifier_to_yojson x.id));
      ("PayloadType", option_to_yojson engagement_invitation_payload_type_to_yojson x.payload_type);
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
    ]

let get_engagement_invitation_request_to_yojson (x : get_engagement_invitation_request) =
  assoc_to_yojson
    [
      ("Identifier", Some (engagement_invitation_arn_or_identifier_to_yojson x.identifier));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let get_aws_opportunity_summary_response_to_yojson (x : get_aws_opportunity_summary_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
      ( "CosellMotion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cosell_motion );
      ("Project", option_to_yojson aws_opportunity_project_to_yojson x.project);
      ("Customer", option_to_yojson aws_opportunity_customer_to_yojson x.customer);
      ( "RelatedEntityIds",
        option_to_yojson aws_opportunity_related_entities_to_yojson x.related_entity_ids );
      ( "InvolvementTypeChangeReason",
        option_to_yojson involvement_type_change_reason_to_yojson x.involvement_type_change_reason
      );
      ("Insights", option_to_yojson aws_opportunity_insights_to_yojson x.insights);
      ( "OpportunityTeam",
        option_to_yojson aws_opportunity_team_members_list_to_yojson x.opportunity_team );
      ("LifeCycle", option_to_yojson aws_opportunity_life_cycle_to_yojson x.life_cycle);
      ("Visibility", option_to_yojson visibility_to_yojson x.visibility);
      ("InvolvementType", option_to_yojson sales_involvement_type_to_yojson x.involvement_type);
      ("Origin", option_to_yojson opportunity_origin_to_yojson x.origin);
      ( "RelatedOpportunityId",
        option_to_yojson opportunity_identifier_to_yojson x.related_opportunity_id );
    ]

let get_aws_opportunity_summary_request_to_yojson (x : get_aws_opportunity_summary_request) =
  assoc_to_yojson
    [
      ( "RelatedOpportunityIdentifier",
        Some (opportunity_identifier_to_yojson x.related_opportunity_identifier) );
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let engagement_invitation_arn_to_yojson = string_to_yojson

let disassociate_opportunity_request_to_yojson (x : disassociate_opportunity_request) =
  assoc_to_yojson
    [
      ( "RelatedEntityIdentifier",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.related_entity_identifier)
      );
      ("RelatedEntityType", Some (related_entity_type_to_yojson x.related_entity_type));
      ("OpportunityIdentifier", Some (opportunity_identifier_to_yojson x.opportunity_identifier));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let delete_resource_snapshot_job_request_to_yojson (x : delete_resource_snapshot_job_request) =
  assoc_to_yojson
    [
      ( "ResourceSnapshotJobIdentifier",
        Some (resource_snapshot_job_identifier_to_yojson x.resource_snapshot_job_identifier) );
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let create_resource_snapshot_response_to_yojson (x : create_resource_snapshot_response) =
  assoc_to_yojson
    [
      ("Revision", option_to_yojson resource_snapshot_revision_to_yojson x.revision);
      ("Arn", option_to_yojson resource_arn_to_yojson x.arn);
    ]

let create_resource_snapshot_request_to_yojson (x : create_resource_snapshot_request) =
  assoc_to_yojson
    [
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ( "ResourceSnapshotTemplateIdentifier",
        Some (resource_template_name_to_yojson x.resource_snapshot_template_identifier) );
      ("ResourceIdentifier", Some (resource_identifier_to_yojson x.resource_identifier));
      ("ResourceType", Some (resource_type_to_yojson x.resource_type));
      ("EngagementIdentifier", Some (engagement_identifier_to_yojson x.engagement_identifier));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let create_resource_snapshot_job_response_to_yojson (x : create_resource_snapshot_job_response) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson resource_snapshot_job_arn_to_yojson x.arn);
      ("Id", option_to_yojson resource_snapshot_job_identifier_to_yojson x.id);
    ]

let create_resource_snapshot_job_request_to_yojson (x : create_resource_snapshot_job_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ResourceSnapshotTemplateIdentifier",
        Some (resource_template_name_to_yojson x.resource_snapshot_template_identifier) );
      ("ResourceIdentifier", Some (resource_identifier_to_yojson x.resource_identifier));
      ("ResourceType", Some (resource_type_to_yojson x.resource_type));
      ("EngagementIdentifier", Some (engagement_identifier_to_yojson x.engagement_identifier));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let create_opportunity_response_to_yojson (x : create_opportunity_response) =
  assoc_to_yojson
    [
      ("LastModifiedDate", option_to_yojson date_time_to_yojson x.last_modified_date);
      ( "PartnerOpportunityIdentifier",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.partner_opportunity_identifier );
      ("Id", Some (opportunity_identifier_to_yojson x.id));
    ]

let create_opportunity_request_to_yojson (x : create_opportunity_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "OpportunityTeam",
        option_to_yojson partner_opportunity_team_members_list_to_yojson x.opportunity_team );
      ("Origin", option_to_yojson opportunity_origin_to_yojson x.origin);
      ("LifeCycle", option_to_yojson life_cycle_to_yojson x.life_cycle);
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("SoftwareRevenue", option_to_yojson software_revenue_to_yojson x.software_revenue);
      ("Marketing", option_to_yojson marketing_to_yojson x.marketing);
      ("OpportunityType", option_to_yojson opportunity_type_to_yojson x.opportunity_type);
      ("Project", option_to_yojson project_to_yojson x.project);
      ("Customer", option_to_yojson customer_to_yojson x.customer);
      ( "PartnerOpportunityIdentifier",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.partner_opportunity_identifier );
      ("NationalSecurity", option_to_yojson national_security_to_yojson x.national_security);
      ( "PrimaryNeedsFromAws",
        option_to_yojson primary_needs_from_aws_to_yojson x.primary_needs_from_aws );
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let create_engagement_response_to_yojson (x : create_engagement_response) =
  assoc_to_yojson
    [
      ("ModifiedAt", option_to_yojson date_time_to_yojson x.modified_at);
      ("Arn", option_to_yojson engagement_arn_to_yojson x.arn);
      ("Id", option_to_yojson engagement_identifier_to_yojson x.id);
    ]

let create_engagement_request_to_yojson (x : create_engagement_request) =
  assoc_to_yojson
    [
      ("Contexts", option_to_yojson engagement_contexts_to_yojson x.contexts);
      ("Description", Some (engagement_description_to_yojson x.description));
      ("Title", Some (engagement_title_to_yojson x.title));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let create_engagement_invitation_response_to_yojson (x : create_engagement_invitation_response) =
  assoc_to_yojson
    [
      ("Arn", Some (engagement_invitation_arn_to_yojson x.arn));
      ("Id", Some (engagement_invitation_identifier_to_yojson x.id));
    ]

let create_engagement_invitation_request_to_yojson (x : create_engagement_invitation_request) =
  assoc_to_yojson
    [
      ("Invitation", Some (invitation_to_yojson x.invitation));
      ("EngagementIdentifier", Some (engagement_identifier_to_yojson x.engagement_identifier));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let create_engagement_context_response_to_yojson (x : create_engagement_context_response) =
  assoc_to_yojson
    [
      ("ContextId", option_to_yojson engagement_context_identifier_to_yojson x.context_id);
      ( "EngagementLastModifiedAt",
        option_to_yojson date_time_to_yojson x.engagement_last_modified_at );
      ("EngagementArn", option_to_yojson engagement_arn_to_yojson x.engagement_arn);
      ("EngagementId", option_to_yojson engagement_identifier_to_yojson x.engagement_id);
    ]

let create_engagement_context_request_to_yojson (x : create_engagement_context_request) =
  assoc_to_yojson
    [
      ("Payload", Some (engagement_context_payload_to_yojson x.payload));
      ("Type", Some (engagement_context_type_to_yojson x.type_));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("EngagementIdentifier", Some (engagement_arn_or_identifier_to_yojson x.engagement_identifier));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let associate_opportunity_request_to_yojson (x : associate_opportunity_request) =
  assoc_to_yojson
    [
      ( "RelatedEntityIdentifier",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.related_entity_identifier)
      );
      ("RelatedEntityType", Some (related_entity_type_to_yojson x.related_entity_type));
      ("OpportunityIdentifier", Some (opportunity_identifier_to_yojson x.opportunity_identifier));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let assignee_contact_to_yojson (x : assignee_contact) =
  assoc_to_yojson
    [
      ("BusinessTitle", Some (job_title_to_yojson x.business_title));
      ("Phone", option_to_yojson phone_number_to_yojson x.phone);
      ("LastName", Some (name_to_yojson x.last_name));
      ("FirstName", Some (name_to_yojson x.first_name));
      ("Email", Some (email_to_yojson x.email));
    ]

let assign_opportunity_request_to_yojson (x : assign_opportunity_request) =
  assoc_to_yojson
    [
      ("Assignee", Some (assignee_contact_to_yojson x.assignee));
      ("Identifier", Some (opportunity_identifier_to_yojson x.identifier));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]

let accept_engagement_invitation_request_to_yojson (x : accept_engagement_invitation_request) =
  assoc_to_yojson
    [
      ("Identifier", Some (engagement_invitation_arn_or_identifier_to_yojson x.identifier));
      ("Catalog", Some (catalog_identifier_to_yojson x.catalog));
    ]
