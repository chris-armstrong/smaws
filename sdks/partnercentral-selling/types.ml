type nonrec website_url = string [@@ocaml.doc ""]

type nonrec visibility = LIMITED [@ocaml.doc ""] | FULL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec validation_exception_reason =
  | BUSINESS_VALIDATION_FAILED [@ocaml.doc ""]
  | REQUEST_VALIDATION_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception_error_code =
  | ACTION_NOT_PERMITTED [@ocaml.doc ""]
  | VALUE_OUT_OF_RANGE [@ocaml.doc ""]
  | DUPLICATE_KEY_VALUE [@ocaml.doc ""]
  | INVALID_RESOURCE_STATE [@ocaml.doc ""]
  | TOO_MANY_VALUES [@ocaml.doc ""]
  | NOT_ENOUGH_VALUES [@ocaml.doc ""]
  | INVALID_VALUE [@ocaml.doc ""]
  | INVALID_STRING_FORMAT [@ocaml.doc ""]
  | INVALID_ENUM_VALUE [@ocaml.doc ""]
  | REQUIRED_FIELD_MISSING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception_error = {
  code : validation_exception_error_code;
      [@ocaml.doc "Specifies the error code for the invalid field value.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Specifies the detailed error message for the invalid field value.\n"]
  field_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Specifies the field name with the invalid value.\n"]
}
[@@ocaml.doc
  "Indicates an invalid value for a field.\n\n\
  \ {ul\n\
  \       {-   {i REQUIRED_FIELD_MISSING:} The request is missing a required field.\n\
  \           \n\
  \            Fix: Verify your request payload includes all required fields.\n\
  \            \n\
  \             }\n\
  \       {-   {i INVALID_ENUM_VALUE:} The enum field value isn't an accepted values.\n\
  \           \n\
  \            Fix: Check the documentation for the list of valid enum values, and update your \
   request with a valid value.\n\
  \            \n\
  \             }\n\
  \       {-   {i INVALID_STRING_FORMAT:} The string format is invalid.\n\
  \           \n\
  \            Fix: Confirm that the string is in the expected format (For example: email address, \
   date).\n\
  \            \n\
  \             }\n\
  \       {-   {i INVALID_VALUE:} The value isn't valid.\n\
  \           \n\
  \            Fix: Confirm that the value meets the expected criteria and is within the allowable \
   range or set.\n\
  \            \n\
  \             }\n\
  \       {-   {i TOO_MANY_VALUES:} There are too many values in a field that expects fewer entries.\n\
  \           \n\
  \            Fix: Reduce the number of values to match the expected limit.\n\
  \            \n\
  \             }\n\
  \       {-   {i NOT_ENOUGH_VALUES:} There are not enough values in a field that expects more \
   entries.\n\
  \           \n\
  \            Fix: Increase the number of values to match the expected threshold.\n\
  \            \n\
  \             }\n\
  \       {-   {i ACTION_NOT_PERMITTED:} The action isn't permitted due to current state or \
   permissions.\n\
  \           \n\
  \            Fix: Verify that the action is appropriate for the current state, and that you have \
   the necessary permissions to perform it.\n\
  \            \n\
  \             }\n\
  \       {-   {i DUPLICATE_KEY_VALUE:} The value in a field duplicates a value that must be unique.\n\
  \           \n\
  \            Fix: Verify that the value is unique and doesn't duplicate an existing value in the \
   system.\n\
  \            \n\
  \             }\n\
  \       }\n\
  \  "]

type nonrec validation_exception_error_list = validation_exception_error list [@@ocaml.doc ""]

type nonrec validation_exception = {
  error_list : validation_exception_error_list option;
      [@ocaml.doc
        "A list of issues that were discovered in the submitted request or the resource state.\n"]
  reason : validation_exception_reason;
      [@ocaml.doc
        "The primary reason for this validation exception to occur.\n\n\
        \ {ul\n\
        \       {-   {i REQUEST_VALIDATION_FAILED:} The request format is not valid.\n\
        \           \n\
        \            Fix: Verify your request payload includes all required fields, uses correct \
         data types and string formats.\n\
        \            \n\
        \             }\n\
        \       {-   {i BUSINESS_VALIDATION_FAILED:} The requested change doesn't pass the \
         business validation rules.\n\
        \           \n\
        \            Fix: Check that your change aligns with the business rules defined by AWS \
         Partner Central.\n\
        \            \n\
        \             }\n\
        \       }\n\
        \  "]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The input fails to satisfy the constraints specified by the service or business validation \
   rules.\n\n\
  \ Suggested action: Review the error message, including the failed fields and reasons, to \
   correct the request payload.\n\
  \ "]

type nonrec use_cases = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec opportunity_identifier = string [@@ocaml.doc ""]

type nonrec date_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec update_opportunity_response = {
  last_modified_date : date_time;
      [@ocaml.doc " [DateTime] when the opportunity was last modified.\n"]
  id : opportunity_identifier;
      [@ocaml.doc "Read-only, system generated [Opportunity] unique identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec catalog_identifier = string [@@ocaml.doc ""]

type nonrec primary_need_from_aws =
  | CO_SELL_SUPPORT_FOR_PUBLIC_TENDER_RFX [@ocaml.doc ""]
  | CO_SELL_DEAL_SUPPORT [@ocaml.doc ""]
  | CO_SELL_TOTAL_COST_OF_OWNERSHIP_EVALUATION [@ocaml.doc ""]
  | CO_SELL_TECHNICAL_CONSULTATION [@ocaml.doc ""]
  | CO_SELL_PRICING_ASSISTANCE [@ocaml.doc ""]
  | CO_SELL_COMPETITIVE_INFORMATION [@ocaml.doc ""]
  | CO_SELL_BUSINESS_PRESENTATION [@ocaml.doc ""]
  | CO_SELL_ARCHITECTURAL_VALIDATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec primary_needs_from_aws = primary_need_from_aws list [@@ocaml.doc ""]

type nonrec national_security = NO [@ocaml.doc ""] | YES [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec industry =
  | OTHER [@ocaml.doc ""]
  | WHOLESALE_DISTRIBUTION [@ocaml.doc ""]
  | TRAVEL [@ocaml.doc ""]
  | TRANSPORTATION_LOGISTICS [@ocaml.doc ""]
  | TELECOMMUNICATIONS [@ocaml.doc ""]
  | SOFTWARE_INTERNET [@ocaml.doc ""]
  | RETAIL [@ocaml.doc ""]
  | REALESTATE_CONSTRUCTION [@ocaml.doc ""]
  | PROFESSIONAL_SERVICES [@ocaml.doc ""]
  | NON_PROFIT_ORGANIZATION [@ocaml.doc ""]
  | MINING [@ocaml.doc ""]
  | MEDIA_ENTERTAINMENT [@ocaml.doc ""]
  | MARKETING_ADVERTISING [@ocaml.doc ""]
  | MANUFACTURING [@ocaml.doc ""]
  | LIFE_SCIENCES [@ocaml.doc ""]
  | HOSPITALITY [@ocaml.doc ""]
  | HEALTHCARE [@ocaml.doc ""]
  | GOVERNMENT [@ocaml.doc ""]
  | GAMING [@ocaml.doc ""]
  | FINANCIAL_SERVICES [@ocaml.doc ""]
  | ENERGY_POWER_UTILITIES [@ocaml.doc ""]
  | ENERGY_OIL_GAS [@ocaml.doc ""]
  | EDUCATION [@ocaml.doc ""]
  | CONSUMER_GOODS [@ocaml.doc ""]
  | COMPUTERS_ELECTRONICS [@ocaml.doc ""]
  | AUTOMOTIVE [@ocaml.doc ""]
  | AGRICULTURE [@ocaml.doc ""]
  | AEROSPACE_SATELLITE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec name = string [@@ocaml.doc ""]

type nonrec aws_account = string [@@ocaml.doc ""]

type nonrec address_part = string [@@ocaml.doc ""]

type nonrec country_code =
  | ZW [@ocaml.doc ""]
  | ZM [@ocaml.doc ""]
  | YE [@ocaml.doc ""]
  | EH [@ocaml.doc ""]
  | WF [@ocaml.doc ""]
  | VI [@ocaml.doc ""]
  | VG [@ocaml.doc ""]
  | VN [@ocaml.doc ""]
  | VE [@ocaml.doc ""]
  | VU [@ocaml.doc ""]
  | UZ [@ocaml.doc ""]
  | UY [@ocaml.doc ""]
  | UM [@ocaml.doc ""]
  | GB [@ocaml.doc ""]
  | AE [@ocaml.doc ""]
  | UA [@ocaml.doc ""]
  | UG [@ocaml.doc ""]
  | TV [@ocaml.doc ""]
  | TC [@ocaml.doc ""]
  | TM [@ocaml.doc ""]
  | TR [@ocaml.doc ""]
  | TN [@ocaml.doc ""]
  | TT [@ocaml.doc ""]
  | TO [@ocaml.doc ""]
  | TK [@ocaml.doc ""]
  | TG [@ocaml.doc ""]
  | TL [@ocaml.doc ""]
  | TH [@ocaml.doc ""]
  | TZ [@ocaml.doc ""]
  | TJ [@ocaml.doc ""]
  | TW [@ocaml.doc ""]
  | SY [@ocaml.doc ""]
  | CH [@ocaml.doc ""]
  | SE [@ocaml.doc ""]
  | SZ [@ocaml.doc ""]
  | SJ [@ocaml.doc ""]
  | SR [@ocaml.doc ""]
  | SD [@ocaml.doc ""]
  | LK [@ocaml.doc ""]
  | ES [@ocaml.doc ""]
  | SS [@ocaml.doc ""]
  | GS [@ocaml.doc ""]
  | ZA [@ocaml.doc ""]
  | SO [@ocaml.doc ""]
  | SB [@ocaml.doc ""]
  | SI [@ocaml.doc ""]
  | SK [@ocaml.doc ""]
  | SX [@ocaml.doc ""]
  | SG [@ocaml.doc ""]
  | SL [@ocaml.doc ""]
  | SC [@ocaml.doc ""]
  | RS [@ocaml.doc ""]
  | SN [@ocaml.doc ""]
  | SA [@ocaml.doc ""]
  | ST [@ocaml.doc ""]
  | SM [@ocaml.doc ""]
  | WS [@ocaml.doc ""]
  | VC [@ocaml.doc ""]
  | PM [@ocaml.doc ""]
  | MF [@ocaml.doc ""]
  | LC [@ocaml.doc ""]
  | KN [@ocaml.doc ""]
  | SH [@ocaml.doc ""]
  | BL [@ocaml.doc ""]
  | RW [@ocaml.doc ""]
  | RU [@ocaml.doc ""]
  | RO [@ocaml.doc ""]
  | RE [@ocaml.doc ""]
  | QA [@ocaml.doc ""]
  | PR [@ocaml.doc ""]
  | PT [@ocaml.doc ""]
  | PL [@ocaml.doc ""]
  | PN [@ocaml.doc ""]
  | PH [@ocaml.doc ""]
  | PE [@ocaml.doc ""]
  | PY [@ocaml.doc ""]
  | PG [@ocaml.doc ""]
  | PA [@ocaml.doc ""]
  | PS [@ocaml.doc ""]
  | PW [@ocaml.doc ""]
  | PK [@ocaml.doc ""]
  | OM [@ocaml.doc ""]
  | NO [@ocaml.doc ""]
  | MP [@ocaml.doc ""]
  | NF [@ocaml.doc ""]
  | NU [@ocaml.doc ""]
  | NG [@ocaml.doc ""]
  | NE [@ocaml.doc ""]
  | NI [@ocaml.doc ""]
  | NZ [@ocaml.doc ""]
  | NC [@ocaml.doc ""]
  | AN [@ocaml.doc ""]
  | NL [@ocaml.doc ""]
  | NP [@ocaml.doc ""]
  | NR [@ocaml.doc ""]
  | NA [@ocaml.doc ""]
  | MM [@ocaml.doc ""]
  | MZ [@ocaml.doc ""]
  | MA [@ocaml.doc ""]
  | MS [@ocaml.doc ""]
  | ME [@ocaml.doc ""]
  | MN [@ocaml.doc ""]
  | MC [@ocaml.doc ""]
  | MD [@ocaml.doc ""]
  | FM [@ocaml.doc ""]
  | MX [@ocaml.doc ""]
  | YT [@ocaml.doc ""]
  | MU [@ocaml.doc ""]
  | MR [@ocaml.doc ""]
  | MQ [@ocaml.doc ""]
  | MH [@ocaml.doc ""]
  | MT [@ocaml.doc ""]
  | ML [@ocaml.doc ""]
  | MV [@ocaml.doc ""]
  | MY [@ocaml.doc ""]
  | MW [@ocaml.doc ""]
  | MG [@ocaml.doc ""]
  | MK [@ocaml.doc ""]
  | MO [@ocaml.doc ""]
  | LU [@ocaml.doc ""]
  | LT [@ocaml.doc ""]
  | LI [@ocaml.doc ""]
  | LY [@ocaml.doc ""]
  | LR [@ocaml.doc ""]
  | LS [@ocaml.doc ""]
  | LB [@ocaml.doc ""]
  | LV [@ocaml.doc ""]
  | LA [@ocaml.doc ""]
  | KG [@ocaml.doc ""]
  | KW [@ocaml.doc ""]
  | KR [@ocaml.doc ""]
  | KI [@ocaml.doc ""]
  | KE [@ocaml.doc ""]
  | KZ [@ocaml.doc ""]
  | JO [@ocaml.doc ""]
  | JE [@ocaml.doc ""]
  | JP [@ocaml.doc ""]
  | JM [@ocaml.doc ""]
  | IT [@ocaml.doc ""]
  | IL [@ocaml.doc ""]
  | IM [@ocaml.doc ""]
  | IE [@ocaml.doc ""]
  | IQ [@ocaml.doc ""]
  | IR [@ocaml.doc ""]
  | ID [@ocaml.doc ""]
  | IN [@ocaml.doc ""]
  | IS [@ocaml.doc ""]
  | HU [@ocaml.doc ""]
  | HK [@ocaml.doc ""]
  | HN [@ocaml.doc ""]
  | VA [@ocaml.doc ""]
  | HM [@ocaml.doc ""]
  | HT [@ocaml.doc ""]
  | GY [@ocaml.doc ""]
  | GW [@ocaml.doc ""]
  | GN [@ocaml.doc ""]
  | GG [@ocaml.doc ""]
  | GT [@ocaml.doc ""]
  | GU [@ocaml.doc ""]
  | GP [@ocaml.doc ""]
  | GD [@ocaml.doc ""]
  | GL [@ocaml.doc ""]
  | GR [@ocaml.doc ""]
  | GI [@ocaml.doc ""]
  | GH [@ocaml.doc ""]
  | DE [@ocaml.doc ""]
  | GE [@ocaml.doc ""]
  | GM [@ocaml.doc ""]
  | GA [@ocaml.doc ""]
  | TF [@ocaml.doc ""]
  | PF [@ocaml.doc ""]
  | GF [@ocaml.doc ""]
  | FR [@ocaml.doc ""]
  | FI [@ocaml.doc ""]
  | FJ [@ocaml.doc ""]
  | FO [@ocaml.doc ""]
  | FK [@ocaml.doc ""]
  | ET [@ocaml.doc ""]
  | EE [@ocaml.doc ""]
  | ER [@ocaml.doc ""]
  | GQ [@ocaml.doc ""]
  | SV [@ocaml.doc ""]
  | EG [@ocaml.doc ""]
  | EC [@ocaml.doc ""]
  | DO [@ocaml.doc ""]
  | DM [@ocaml.doc ""]
  | DJ [@ocaml.doc ""]
  | DK [@ocaml.doc ""]
  | CD [@ocaml.doc ""]
  | CZ [@ocaml.doc ""]
  | CY [@ocaml.doc ""]
  | CW [@ocaml.doc ""]
  | CU [@ocaml.doc ""]
  | HR [@ocaml.doc ""]
  | CI [@ocaml.doc ""]
  | CR [@ocaml.doc ""]
  | CK [@ocaml.doc ""]
  | CG [@ocaml.doc ""]
  | KM [@ocaml.doc ""]
  | CO [@ocaml.doc ""]
  | CC [@ocaml.doc ""]
  | CX [@ocaml.doc ""]
  | CN [@ocaml.doc ""]
  | CL [@ocaml.doc ""]
  | TD [@ocaml.doc ""]
  | CF [@ocaml.doc ""]
  | KY [@ocaml.doc ""]
  | CV [@ocaml.doc ""]
  | CA [@ocaml.doc ""]
  | CM [@ocaml.doc ""]
  | KH [@ocaml.doc ""]
  | BI [@ocaml.doc ""]
  | BF [@ocaml.doc ""]
  | BG [@ocaml.doc ""]
  | BN [@ocaml.doc ""]
  | IO [@ocaml.doc ""]
  | BR [@ocaml.doc ""]
  | BV [@ocaml.doc ""]
  | BW [@ocaml.doc ""]
  | BA [@ocaml.doc ""]
  | BQ [@ocaml.doc ""]
  | BO [@ocaml.doc ""]
  | BT [@ocaml.doc ""]
  | BM [@ocaml.doc ""]
  | BJ [@ocaml.doc ""]
  | BZ [@ocaml.doc ""]
  | BE [@ocaml.doc ""]
  | BY [@ocaml.doc ""]
  | BB [@ocaml.doc ""]
  | BD [@ocaml.doc ""]
  | BH [@ocaml.doc ""]
  | BS [@ocaml.doc ""]
  | AZ [@ocaml.doc ""]
  | AT [@ocaml.doc ""]
  | AU [@ocaml.doc ""]
  | AW [@ocaml.doc ""]
  | AM [@ocaml.doc ""]
  | AR [@ocaml.doc ""]
  | AG [@ocaml.doc ""]
  | AQ [@ocaml.doc ""]
  | AI [@ocaml.doc ""]
  | AO [@ocaml.doc ""]
  | AD [@ocaml.doc ""]
  | AS [@ocaml.doc ""]
  | DZ [@ocaml.doc ""]
  | AL [@ocaml.doc ""]
  | AX [@ocaml.doc ""]
  | AF [@ocaml.doc ""]
  | US [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec address = {
  street_address : address_part option;
      [@ocaml.doc
        "Specifies the end [Customer]'s street address associated with the [Opportunity].\n"]
  country_code : country_code option;
      [@ocaml.doc "Specifies the end [Customer]'s country associated with the [Opportunity].\n"]
  state_or_region : address_part option;
      [@ocaml.doc
        "Specifies the end [Customer]'s state or region associated with the [Opportunity].\n\n\
        \ Valid values: [Alabama | Alaska | American Samoa | Arizona | Arkansas | California | \
         Colorado | Connecticut | Delaware | Dist. of Columbia | Federated States of Micronesia | \
         Florida | Georgia | Guam | Hawaii | Idaho | Illinois | Indiana | Iowa | Kansas | Kentucky \
         | Louisiana | Maine | Marshall Islands | Maryland | Massachusetts | Michigan | Minnesota \
         | Mississippi | Missouri | Montana | Nebraska | Nevada | New Hampshire | New Jersey | New \
         Mexico | New York | North Carolina | North Dakota | Northern Mariana Islands | Ohio | \
         Oklahoma | Oregon | Palau | Pennsylvania | Puerto Rico | Rhode Island | South Carolina | \
         South Dakota | Tennessee | Texas | Utah | Vermont | Virginia | Virgin Islands | \
         Washington | West Virginia | Wisconsin | Wyoming | APO/AE | AFO/FPO | FPO, AP] \n\
        \ "]
  postal_code : address_part option;
      [@ocaml.doc "Specifies the end [Customer]'s postal code associated with the [Opportunity].\n"]
  city : address_part option;
      [@ocaml.doc "Specifies the end [Customer]'s city associated with the [Opportunity].\n"]
}
[@@ocaml.doc "Specifies the end [Customer]'s address details associated with the [Opportunity].\n"]

type nonrec duns_number = string [@@ocaml.doc ""]

type nonrec account = {
  duns : duns_number option; [@ocaml.doc "Indicates the [Customer] DUNS number, if available.\n"]
  address : address option;
      [@ocaml.doc
        "Specifies the end [Customer]'s address details associated with the [Opportunity].\n"]
  aws_account_id : aws_account option;
      [@ocaml.doc
        "Specifies the [Customer] Amazon Web Services account ID associated with the [Opportunity].\n"]
  website_url : website_url option;
      [@ocaml.doc
        "Specifies the end customer's company website URL associated with the [Opportunity]. This \
         value is crucial to map the customer within the Amazon Web Services CRM system. This \
         field is required in all cases except when the opportunity is related to national \
         security.\n"]
  company_name : name;
      [@ocaml.doc
        "Specifies the end [Customer]'s company name associated with the [Opportunity].\n"]
  other_industry : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Specifies the end [Customer]'s industry associated with the [Opportunity], when the \
         selected value in the [Industry] field is [Other].\n"]
  industry : industry option;
      [@ocaml.doc
        "Specifies the industry the end [Customer] belongs to that's associated with the \
         [Opportunity]. It refers to the category or sector where the customer's business \
         operates. This is a required field.\n"]
}
[@@ocaml.doc "Specifies the [Customer]'s account details associated with the [Opportunity].\n"]

type nonrec email = string [@@ocaml.doc ""]

type nonrec job_title = string [@@ocaml.doc ""]

type nonrec phone_number = string [@@ocaml.doc ""]

type nonrec contact = {
  phone : phone_number option;
      [@ocaml.doc "The contact's phone number associated with the [Opportunity].\n"]
  business_title : job_title option;
      [@ocaml.doc
        "The partner contact's title (job title or role) associated with the [Opportunity]. \
         [BusinessTitle] supports either [PartnerAccountManager] or [OpportunityOwner].\n"]
  last_name : name option;
      [@ocaml.doc "The contact's last name associated with the [Opportunity].\n"]
  first_name : name option;
      [@ocaml.doc "The contact's first name associated with the [Opportunity].\n"]
  email : email option;
      [@ocaml.doc "The contact's email address associated with the [Opportunity].\n"]
}
[@@ocaml.doc "An object that contains a [Customer Partner]'s contact details.\n"]

type nonrec customer_contacts_list = contact list [@@ocaml.doc ""]

type nonrec customer = {
  contacts : customer_contacts_list option;
      [@ocaml.doc
        "Represents the contact details for individuals associated with the customer of the \
         [Opportunity]. This field captures relevant contacts, including decision-makers, \
         influencers, and technical stakeholders within the customer organization. These contacts \
         are key to progressing the opportunity.\n"]
  account : account option; [@ocaml.doc "An object that contains the customer's account details.\n"]
}
[@@ocaml.doc "An object that contains the customer's [Account] and [Contact].\n"]

type nonrec delivery_model =
  | OTHER [@ocaml.doc ""]
  | RESELL [@ocaml.doc ""]
  | PROFESSIONAL_SERVICES [@ocaml.doc ""]
  | MANAGED_SERVICES [@ocaml.doc ""]
  | BYOL_OR_AMI [@ocaml.doc ""]
  | SAAS_OR_PAAS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec delivery_models = delivery_model list [@@ocaml.doc ""]

type nonrec amount = string [@@ocaml.doc ""]

type nonrec currency_code =
  | ZWL [@ocaml.doc ""]
  | ZMW [@ocaml.doc ""]
  | ZAR [@ocaml.doc ""]
  | YER [@ocaml.doc ""]
  | XUA [@ocaml.doc ""]
  | XSU [@ocaml.doc ""]
  | XPF [@ocaml.doc ""]
  | XOF [@ocaml.doc ""]
  | XDR [@ocaml.doc ""]
  | XCD [@ocaml.doc ""]
  | XAF [@ocaml.doc ""]
  | WST [@ocaml.doc ""]
  | VUV [@ocaml.doc ""]
  | VND [@ocaml.doc ""]
  | VEF [@ocaml.doc ""]
  | UZS [@ocaml.doc ""]
  | UYU [@ocaml.doc ""]
  | UYI [@ocaml.doc ""]
  | USN [@ocaml.doc ""]
  | UGX [@ocaml.doc ""]
  | UAH [@ocaml.doc ""]
  | TZS [@ocaml.doc ""]
  | TWD [@ocaml.doc ""]
  | TTD [@ocaml.doc ""]
  | TRY [@ocaml.doc ""]
  | TOP [@ocaml.doc ""]
  | TND [@ocaml.doc ""]
  | TMT [@ocaml.doc ""]
  | TJS [@ocaml.doc ""]
  | THB [@ocaml.doc ""]
  | SZL [@ocaml.doc ""]
  | SYP [@ocaml.doc ""]
  | SVC [@ocaml.doc ""]
  | STN [@ocaml.doc ""]
  | SSP [@ocaml.doc ""]
  | SRD [@ocaml.doc ""]
  | SOS [@ocaml.doc ""]
  | SLL [@ocaml.doc ""]
  | SHP [@ocaml.doc ""]
  | SGD [@ocaml.doc ""]
  | SDG [@ocaml.doc ""]
  | SCR [@ocaml.doc ""]
  | SBD [@ocaml.doc ""]
  | SAR [@ocaml.doc ""]
  | RWF [@ocaml.doc ""]
  | RUB [@ocaml.doc ""]
  | RSD [@ocaml.doc ""]
  | RON [@ocaml.doc ""]
  | QAR [@ocaml.doc ""]
  | PYG [@ocaml.doc ""]
  | PLN [@ocaml.doc ""]
  | PKR [@ocaml.doc ""]
  | PHP [@ocaml.doc ""]
  | PGK [@ocaml.doc ""]
  | PEN [@ocaml.doc ""]
  | PAB [@ocaml.doc ""]
  | OMR [@ocaml.doc ""]
  | NPR [@ocaml.doc ""]
  | NOK [@ocaml.doc ""]
  | NIO [@ocaml.doc ""]
  | NGN [@ocaml.doc ""]
  | NAD [@ocaml.doc ""]
  | MZN [@ocaml.doc ""]
  | MYR [@ocaml.doc ""]
  | MXV [@ocaml.doc ""]
  | MXN [@ocaml.doc ""]
  | MWK [@ocaml.doc ""]
  | MVR [@ocaml.doc ""]
  | MUR [@ocaml.doc ""]
  | MRU [@ocaml.doc ""]
  | MOP [@ocaml.doc ""]
  | MNT [@ocaml.doc ""]
  | MMK [@ocaml.doc ""]
  | MKD [@ocaml.doc ""]
  | MGA [@ocaml.doc ""]
  | MDL [@ocaml.doc ""]
  | MAD [@ocaml.doc ""]
  | LYD [@ocaml.doc ""]
  | LSL [@ocaml.doc ""]
  | LRD [@ocaml.doc ""]
  | LKR [@ocaml.doc ""]
  | LBP [@ocaml.doc ""]
  | LAK [@ocaml.doc ""]
  | KZT [@ocaml.doc ""]
  | KYD [@ocaml.doc ""]
  | KWD [@ocaml.doc ""]
  | KRW [@ocaml.doc ""]
  | KPW [@ocaml.doc ""]
  | KMF [@ocaml.doc ""]
  | KHR [@ocaml.doc ""]
  | KGS [@ocaml.doc ""]
  | KES [@ocaml.doc ""]
  | JOD [@ocaml.doc ""]
  | JMD [@ocaml.doc ""]
  | ISK [@ocaml.doc ""]
  | IRR [@ocaml.doc ""]
  | IQD [@ocaml.doc ""]
  | ILS [@ocaml.doc ""]
  | IDR [@ocaml.doc ""]
  | HUF [@ocaml.doc ""]
  | HTG [@ocaml.doc ""]
  | HRK [@ocaml.doc ""]
  | HNL [@ocaml.doc ""]
  | HKD [@ocaml.doc ""]
  | GYD [@ocaml.doc ""]
  | GTQ [@ocaml.doc ""]
  | GNF [@ocaml.doc ""]
  | GMD [@ocaml.doc ""]
  | GIP [@ocaml.doc ""]
  | GHS [@ocaml.doc ""]
  | GEL [@ocaml.doc ""]
  | FKP [@ocaml.doc ""]
  | FJD [@ocaml.doc ""]
  | ETB [@ocaml.doc ""]
  | ERN [@ocaml.doc ""]
  | EGP [@ocaml.doc ""]
  | DZD [@ocaml.doc ""]
  | DOP [@ocaml.doc ""]
  | DKK [@ocaml.doc ""]
  | DJF [@ocaml.doc ""]
  | CZK [@ocaml.doc ""]
  | CVE [@ocaml.doc ""]
  | CUP [@ocaml.doc ""]
  | CUC [@ocaml.doc ""]
  | CRC [@ocaml.doc ""]
  | COU [@ocaml.doc ""]
  | COP [@ocaml.doc ""]
  | CLP [@ocaml.doc ""]
  | CLF [@ocaml.doc ""]
  | CHW [@ocaml.doc ""]
  | CHE [@ocaml.doc ""]
  | CDF [@ocaml.doc ""]
  | BZD [@ocaml.doc ""]
  | BYN [@ocaml.doc ""]
  | BWP [@ocaml.doc ""]
  | BTN [@ocaml.doc ""]
  | BSD [@ocaml.doc ""]
  | BRL [@ocaml.doc ""]
  | BOV [@ocaml.doc ""]
  | BOB [@ocaml.doc ""]
  | BND [@ocaml.doc ""]
  | BMD [@ocaml.doc ""]
  | BIF [@ocaml.doc ""]
  | BHD [@ocaml.doc ""]
  | BGN [@ocaml.doc ""]
  | BDT [@ocaml.doc ""]
  | BBD [@ocaml.doc ""]
  | BAM [@ocaml.doc ""]
  | AZN [@ocaml.doc ""]
  | AWG [@ocaml.doc ""]
  | ARS [@ocaml.doc ""]
  | AOA [@ocaml.doc ""]
  | ANG [@ocaml.doc ""]
  | AMD [@ocaml.doc ""]
  | ALL [@ocaml.doc ""]
  | AFN [@ocaml.doc ""]
  | AED [@ocaml.doc ""]
  | SEK [@ocaml.doc ""]
  | CHF [@ocaml.doc ""]
  | JPY [@ocaml.doc ""]
  | INR [@ocaml.doc ""]
  | NZD [@ocaml.doc ""]
  | CNY [@ocaml.doc ""]
  | CAD [@ocaml.doc ""]
  | AUD [@ocaml.doc ""]
  | GBP [@ocaml.doc ""]
  | EUR [@ocaml.doc ""]
  | USD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec payment_frequency = MONTHLY [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec estimation_url = string [@@ocaml.doc ""]

type nonrec expected_customer_spend = {
  estimation_url : estimation_url option;
      [@ocaml.doc "A URL providing additional information or context about the spend estimation.\n"]
  target_company : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "Specifies the entity associated with this spend entry. Use [AWS] for the \
         system\226\128\153s AWS Monthly Recurring Revenue (MRR) estimate. Use [Self] for the \
         partner\226\128\153s own deal value entry when providing Total Contract Value (TCV) for \
         automatic MRR conversion. When [ExpectedContractDuration] is present on the Project, only \
         [AWS] and [Self] are accepted. When [ExpectedContractDuration] is not present, only [AWS] \
         is accepted and any other value will be automatically set to [AWS].\n"]
  frequency : payment_frequency;
      [@ocaml.doc
        "Indicates how frequently the customer is expected to spend the projected amount. Use \
         [Monthly] for recurring monthly spend (required for [TargetCompany: \"AWS\"] entries). \
         Use [None] for one-time deal value entries (required for [TargetCompany: \"Self\"] \
         entries when providing Total Contract Value).\n"]
  currency_code : currency_code;
      [@ocaml.doc
        "Indicates the currency in which the revenue estimate is provided. This helps in \
         understanding the financial impact across different markets. Accepted values are [USD] \
         (US Dollars) and [EUR] (Euros). If the AWS Partition is [aws-eusc] (AWS European \
         Sovereign Cloud), the currency code must be [EUR].\n"]
  amount : amount option;
      [@ocaml.doc
        "Represents the estimated monthly revenue that the partner expects to earn from the \
         opportunity. This helps in forecasting financial returns.\n"]
}
[@@ocaml.doc
  "Provides an estimate of the revenue that the partner is expected to generate from the \
   opportunity. This information helps partners assess the financial value of the project.\n"]

type nonrec expected_customer_spend_list = expected_customer_spend list [@@ocaml.doc ""]

type nonrec expected_contract_duration_term = MONTHS [@ocaml.doc ""]
[@@ocaml.doc
  "The unit of measurement for the contract duration value. Currently accepts only [Months].\n"]

type nonrec expected_contract_duration = {
  value : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "A String representation of the contract duration as an integer, expressed in the unit \
         defined by [Term]. Valid values range from [1] to [144].\n"]
  term : expected_contract_duration_term;
      [@ocaml.doc
        "The unit of measurement for the contract duration value. Currently accepts only [Months].\n"]
}
[@@ocaml.doc
  "The expected duration of a partner's contract with the customer. Used to convert Total Contract \
   Value (TCV) to Monthly Recurring Revenue (MRR) for opportunity dealsizing calculations.\n"]

type nonrec pii_string = string [@@ocaml.doc ""]

type nonrec apn_programs = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec sales_activity =
  | SOW_SIGNED [@ocaml.doc ""]
  | FINALIZED_DEPLOYMENT_NEEDS [@ocaml.doc ""]
  | COMPLETED_ACTION_PLAN [@ocaml.doc ""]
  | AGREED_ON_SOLUTION_TO_BUSINESS_PROBLEM [@ocaml.doc ""]
  | IN_EVALUATION_PLANNING_STAGE [@ocaml.doc ""]
  | CONDUCTED_POC_DEMO [@ocaml.doc ""]
  | CUSTOMER_HAS_SHOWN_INTEREST [@ocaml.doc ""]
  | INITIALIZED_DISCUSSIONS_WITH_CUSTOMER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sales_activities = sales_activity list [@@ocaml.doc ""]

type nonrec competitor_name =
  | OTHER [@ocaml.doc ""]
  | NO_COMPETITION [@ocaml.doc ""]
  | OTHER_COST_OPTIMIZATION [@ocaml.doc ""]
  | MICROSOFT_AZURE [@ocaml.doc ""]
  | IBM_SOFTLAYER [@ocaml.doc ""]
  | GOOGLE_CLOUD_PLATFORM [@ocaml.doc ""]
  | ALICLOUD [@ocaml.doc ""]
  | AKAMAI [@ocaml.doc ""]
  | CO_LOCATION [@ocaml.doc ""]
  | ON_PREM [@ocaml.doc ""]
  | ORACLE_CLOUD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec aws_partition = AWS_EUSC [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec project = {
  aws_partition : aws_partition option;
      [@ocaml.doc
        "AWS partition where the opportunity will be deployed. Possible values: [aws-eusc] for AWS \
         European Sovereign Cloud, [null] for all other partitions.\n"]
  additional_comments : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Captures additional comments or information for the [Opportunity] that weren't captured \
         in other fields.\n"]
  other_solution_description : pii_string option;
      [@ocaml.doc
        "Specifies the offered solution for the customer's business problem when the [ \
         RelatedEntityIdentifiers.Solutions] field value is [Other].\n"]
  other_competitor_names : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Only allowed when [CompetitorNames] has [Other] selected.\n"]
  competitor_name : competitor_name option;
      [@ocaml.doc
        "Name of the [Opportunity]'s competitor (if any). Use [Other] to submit a value not in the \
         picklist.\n"]
  sales_activities : sales_activities option;
      [@ocaml.doc
        "Specifies the [Opportunity]'s sales activities conducted with the end customer. These \
         activities help drive Amazon Web Services assignment priority.\n\n\
        \ Valid values:\n\
        \ \n\
        \  {ul\n\
        \        {-  Initialized discussions with customer: Initial conversations with the \
         customer to understand their needs and introduce your solution.\n\
        \            \n\
        \             }\n\
        \        {-  Customer has shown interest in solution: After initial discussions, the \
         customer is interested in your solution.\n\
        \            \n\
        \             }\n\
        \        {-  Conducted POC/demo: You conducted a proof of concept (POC) or demonstration \
         of the solution for the customer.\n\
        \            \n\
        \             }\n\
        \        {-  In evaluation/planning stage: The customer is evaluating the solution and \
         planning potential implementation.\n\
        \            \n\
        \             }\n\
        \        {-  Agreed on solution to Business Problem: Both parties agree on how the \
         solution addresses the customer's business problem.\n\
        \            \n\
        \             }\n\
        \        {-  Completed Action Plan: A detailed action plan is complete and outlines the \
         steps for implementation.\n\
        \            \n\
        \             }\n\
        \        {-  Finalized Deployment Need: Both parties agree with and finalized the \
         deployment needs.\n\
        \            \n\
        \             }\n\
        \        {-  SOW Signed: Both parties signed a statement of work (SOW), and formalize the \
         agreement and detail the project scope and deliverables.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  related_opportunity_identifier : opportunity_identifier option;
      [@ocaml.doc "Specifies the current opportunity's parent opportunity identifier.\n"]
  customer_use_case : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Specifies the proposed solution focus or type of workload for the Opportunity. This field \
         captures the primary use case or objective of the proposed solution, and provides context \
         and clarity to the addressed workload.\n\n\
        \ Valid values: [AI Machine Learning and Analytics | Archiving | Big Data: Data \
         Warehouse/Data Integration/ETL/Data Lake/BI | Blockchain | Business Applications: \
         Mainframe Modernization | Business Applications & Contact Center | Business Applications \
         & SAP Production | Centralized Operations Management | Cloud Management Tools | Cloud \
         Management Tools & DevOps with Continuous Integration & Continuous Delivery (CICD) | \
         Configuration, Compliance & Auditing | Connected Services | Containers & Serverless | \
         Content Delivery & Edge Services | Database | Edge Computing/End User Computing | Energy \
         | Enterprise Governance & Controls | Enterprise Resource Planning | Financial Services | \
         Healthcare and Life Sciences | High Performance Computing | Hybrid Application Platform | \
         Industrial Software | IOT | Manufacturing, Supply Chain and Operations | Media & High \
         performance computing (HPC) | Migration/Database Migration | Monitoring, logging and \
         performance | Monitoring & Observability | Networking | Outpost | SAP | Security & \
         Compliance | Storage & Backup | Training | VMC | VMWare | Web development & DevOps] \n\
        \ "]
  customer_business_problem : pii_string option;
      [@ocaml.doc
        "Describes the problem the end customer has, and how the partner is helping. Utilize this \
         field to provide a concise narrative that outlines the customer's business challenge or \
         issue. Elaborate on how the partner's solution or offerings align to resolve the \
         customer's business problem. Include relevant information about the partner's value \
         proposition, unique selling points, and expertise to tackle the issue. Offer insights on \
         how the proposed solution meets the customer's needs and provides value. Use concise \
         language and precise descriptions to convey the context and significance of the \
         [Opportunity]. The content in this field helps Amazon Web Services understand the nature \
         of the [Opportunity] and the strategic fit of the partner's solution.\n"]
  apn_programs : apn_programs option;
      [@ocaml.doc
        "Specifies the Amazon Partner Network (APN) program that influenced the [Opportunity]. APN \
         programs refer to specific partner programs or initiatives that can impact the \
         [Opportunity].\n\n\
        \ Valid values: [APN Immersion Days | APN Solution Space | ATO (Authority to Operate) | \
         AWS Marketplace Campaign | IS Immersion Day SFID Program | ISV Workload Migration | \
         Migration Acceleration Program | P3 | Partner Launch Initiative | Partner Opportunity \
         Acceleration Funded | The Next Smart | VMware Cloud on AWS | Well-Architected | Windows | \
         Workspaces/AppStream Accelerator Program | WWPS NDPP] \n\
        \ "]
  title : pii_string option; [@ocaml.doc "Specifies the [Opportunity]'s title or name.\n"]
  expected_contract_duration : expected_contract_duration option;
      [@ocaml.doc
        "Optional. The expected duration of the contract associated with this opportunity. \
         Partners use this value alongside expected customer spend to convert Total Contract Value \
         (TCV) into Monthly Recurring Revenue (MRR).\n"]
  expected_customer_spend : expected_customer_spend_list option;
      [@ocaml.doc
        "Represents the estimated amount that the customer is expected to spend on AWS services \
         related to the opportunity. This helps in evaluating the potential financial value of the \
         opportunity for AWS.\n"]
  delivery_models : delivery_models option;
      [@ocaml.doc
        "Specifies the deployment or consumption model for your solution or service in the \
         [Opportunity]'s context. You can select multiple options.\n\n\
        \ Options' descriptions from the [Delivery Model] field are:\n\
        \ \n\
        \  {ul\n\
        \        {-  SaaS or PaaS: Your Amazon Web Services based solution deployed as SaaS or \
         PaaS in your Amazon Web Services environment.\n\
        \            \n\
        \             }\n\
        \        {-  BYOL or AMI: Your Amazon Web Services based solution deployed as BYOL or AMI \
         in the end customer's Amazon Web Services environment.\n\
        \            \n\
        \             }\n\
        \        {-  Managed Services: The end customer's Amazon Web Services business management \
         (For example: Consulting, design, implementation, billing support, cost optimization, \
         technical support).\n\
        \            \n\
        \             }\n\
        \        {-  Professional Services: Offerings to help enterprise end customers achieve \
         specific business outcomes for enterprise cloud adoption (For example: Advisory or \
         transformation planning).\n\
        \            \n\
        \             }\n\
        \        {-  Resell: Amazon Web Services accounts and billing management for your customers.\n\
        \            \n\
        \             }\n\
        \        {-  Other: Delivery model not described above.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc "An object that contains the [Opportunity]'s project details.\n"]

type nonrec opportunity_type =
  | EXPANSION [@ocaml.doc ""]
  | FLAT_RENEWAL [@ocaml.doc ""]
  | NET_NEW_BUSINESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec marketing_source = NONE [@ocaml.doc ""] | MARKETING_ACTIVITY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec channel =
  | VIRTUAL_EVENT [@ocaml.doc ""]
  | VIDEO [@ocaml.doc ""]
  | TV [@ocaml.doc ""]
  | TELEMARKETING [@ocaml.doc ""]
  | SOCIAL [@ocaml.doc ""]
  | SEARCH [@ocaml.doc ""]
  | PRINT [@ocaml.doc ""]
  | OUT_OF_HOME [@ocaml.doc ""]
  | LIVE_EVENT [@ocaml.doc ""]
  | EMAIL [@ocaml.doc ""]
  | DISPLAY [@ocaml.doc ""]
  | CONTENT_SYNDICATION [@ocaml.doc ""]
  | AWS_MARKETING_CENTRAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec channels = channel list [@@ocaml.doc ""]

type nonrec aws_funding_used = NO [@ocaml.doc ""] | YES [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec marketing = {
  aws_funding_used : aws_funding_used option;
      [@ocaml.doc
        "Indicates if the [Opportunity] is a marketing development fund (MDF) funded activity.\n"]
  channels : channels option;
      [@ocaml.doc
        "Specifies the [Opportunity]'s channel that the marketing activity is associated with or \
         was contacted through. This field provides information about the specific marketing \
         channel that contributed to the generation of the lead or contact.\n"]
  use_cases : use_cases option;
      [@ocaml.doc
        "Specifies the marketing activity use case or purpose that led to the [Opportunity]'s \
         creation or contact. This field captures the context or marketing activity's execution's \
         intention and the direct correlation to the generated opportunity or contact. Must be \
         empty when [Marketing.AWSFundingUsed = No].\n\n\
        \ Valid values: [AI/ML | Analytics | Application Integration | Blockchain | Business \
         Applications | Cloud Financial Management | Compute | Containers | Customer Engagement | \
         Databases | Developer Tools | End User Computing | Front End Web & Mobile | Game Tech | \
         IoT | Management & Governance | Media Services | Migration & Transfer | Networking & \
         Content Delivery | Quantum Technologies | Robotics | Satellite | Security | Serverless | \
         Storage | VR & AR] \n\
        \ "]
  source : marketing_source option;
      [@ocaml.doc
        "Indicates if the [Opportunity] was sourced from an Amazon Web Services marketing \
         activity. Use the value [Marketing Activity]. Use [None] if it's not associated with an \
         Amazon Web Services marketing activity. This field helps Amazon Web Services track the \
         return on marketing investments and enables better distribution of marketing budgets \
         among partners.\n"]
  campaign_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Specifies the [Opportunity] marketing campaign code. The Amazon Web Services campaign \
         code is a reference to specific marketing initiatives, promotions, or activities. This \
         field captures the identifier used to track and categorize the [Opportunity] within \
         marketing campaigns. If you don't have a campaign code, contact your Amazon Web Services \
         point of contact to obtain one.\n"]
}
[@@ocaml.doc "An object that contains marketing details for the [Opportunity].\n"]

type nonrec revenue_model =
  | SUBSCRIPTION [@ocaml.doc ""]
  | PAY_AS_YOU_GO [@ocaml.doc ""]
  | CONTRACT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec monetary_value = {
  currency_code : currency_code;
      [@ocaml.doc
        "Specifies the payment currency. Accepted values are [USD] (US Dollars) and [EUR] (Euros). \
         If the AWS Partition is [aws-eusc] (AWS European Sovereign Cloud), the currency code must \
         be [EUR].\n"]
  amount : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "Specifies the payment amount.\n"]
}
[@@ocaml.doc "Specifies payments details.\n"]

type nonrec date = string [@@ocaml.doc ""]

type nonrec software_revenue = {
  expiration_date : date option;
      [@ocaml.doc
        "Specifies the expiration date for the contract between the customer and Amazon Web \
         Services partner. It signifies the termination date of the agreed-upon engagement period \
         between both parties.\n"]
  effective_date : date option;
      [@ocaml.doc
        "Specifies the [Opportunity]'s customer engagement start date for the contract's \
         effectiveness.\n"]
  value : monetary_value option; [@ocaml.doc "Specifies the payment value (amount and currency).\n"]
  delivery_model : revenue_model option;
      [@ocaml.doc
        "Specifies the customer's intended payment type agreement or procurement method to acquire \
         the solution or service outlined in the [Opportunity].\n"]
}
[@@ocaml.doc
  "Specifies a customer's procurement terms details. Required only for partners in eligible \
   programs.\n"]

type nonrec stage =
  | CLOSED_LOST [@ocaml.doc ""]
  | LAUNCHED [@ocaml.doc ""]
  | COMMITTED [@ocaml.doc ""]
  | BUSINESS_VALIDATION [@ocaml.doc ""]
  | TECHNICAL_VALIDATION [@ocaml.doc ""]
  | QUALIFIED [@ocaml.doc ""]
  | PROSPECT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec closed_lost_reason =
  | FINANCIALCOMMERCIAL [@ocaml.doc ""]
  | PRODUCTTECHNOLOGY [@ocaml.doc ""]
  | PEOPLERELATIONSHIPGOVERNANCE [@ocaml.doc ""]
  | OTHER [@ocaml.doc ""]
  | CUSTOMER_EXPERIENCE [@ocaml.doc ""]
  | TECHNICAL_LIMITATIONS [@ocaml.doc ""]
  | SECURITY_COMPLIANCE [@ocaml.doc ""]
  | PRICE [@ocaml.doc ""]
  | PARTNER_GAP [@ocaml.doc ""]
  | ON_PREMISES_DEPLOYMENT [@ocaml.doc ""]
  | NO_OPPORTUNITY [@ocaml.doc ""]
  | LOST_TO_COMPETITOR_OTHER [@ocaml.doc ""]
  | LOST_TO_COMPETITOR_VMWARE [@ocaml.doc ""]
  | LOST_TO_COMPETITOR_SOFTLAYER [@ocaml.doc ""]
  | LOST_TO_COMPETITOR_MICROSOFT [@ocaml.doc ""]
  | LOST_TO_COMPETITOR_GOOGLE [@ocaml.doc ""]
  | LEGAL_TAX_REGULATORY [@ocaml.doc ""]
  | DELAY_CANCELLATION_OF_PROJECT [@ocaml.doc ""]
  | CUSTOMER_DEFICIENCY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec review_status =
  | ACTION_REQUIRED [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
  | APPROVED [@ocaml.doc ""]
  | IN_REVIEW [@ocaml.doc ""]
  | SUBMITTED [@ocaml.doc ""]
  | PENDING_SUBMISSION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec next_steps_history = {
  time : date_time; [@ocaml.doc "Indicates the step execution time.\n"]
  value : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Indicates the step's execution details.\n"]
}
[@@ocaml.doc "Read-only; shows the last 50 values and change dates for the [NextSteps] field.\n"]

type nonrec next_steps_histories = next_steps_history list [@@ocaml.doc ""]

type nonrec life_cycle = {
  next_steps_history : next_steps_histories option;
      [@ocaml.doc
        "Captures a chronological record of the next steps or actions planned or taken for the \
         current opportunity, along with the timestamp.\n"]
  review_status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Code indicating the validation decision during the Amazon Web Services opportunity \
         review. Applies when status is [Rejected] or [Action Required]. Used to document \
         validation results for AWS Partner Referrals and indicate when additional information is \
         needed from partners as part of the APN Customer Engagement (ACE) program.\n"]
  review_comments : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Contains detailed feedback from Amazon Web Services when requesting additional \
         information from partners. Provides specific guidance on what partners need to provide or \
         clarify for opportunity validation, complementing the [ReviewStatusReason] field.\n"]
  review_status : review_status option;
      [@ocaml.doc
        "Indicates the review status of an opportunity referred by a partner. This field is \
         read-only and only applicable for partner referrals. The possible values are:\n\n\
        \ {ul\n\
        \       {-  Pending Submission: Not submitted for validation (editable).\n\
        \           \n\
        \            }\n\
        \       {-  Submitted: Submitted for validation, and Amazon Web Services hasn't reviewed \
         it (read-only).\n\
        \           \n\
        \            }\n\
        \       {-  In Review: Amazon Web Services is validating (read-only).\n\
        \           \n\
        \            }\n\
        \       {-  Action Required: Issues that Amazon Web Services highlights need to be \
         addressed. Partners should use the [UpdateOpportunity] API action to update the \
         opportunity and helps to ensure that all required changes are made. Only the following \
         fields are editable when the [Lifecycle.ReviewStatus] is [Action Required]:\n\
        \           \n\
        \            {ul\n\
        \                  {-  Customer.Account.Address.City\n\
        \                      \n\
        \                       }\n\
        \                  {-  Customer.Account.Address.CountryCode\n\
        \                      \n\
        \                       }\n\
        \                  {-  Customer.Account.Address.PostalCode\n\
        \                      \n\
        \                       }\n\
        \                  {-  Customer.Account.Address.StateOrRegion\n\
        \                      \n\
        \                       }\n\
        \                  {-  Customer.Account.Address.StreetAddress\n\
        \                      \n\
        \                       }\n\
        \                  {-  Customer.Account.WebsiteUrl\n\
        \                      \n\
        \                       }\n\
        \                  {-  LifeCycle.TargetCloseDate\n\
        \                      \n\
        \                       }\n\
        \                  {-  Project.ExpectedMonthlyAWSRevenue.Amount\n\
        \                      \n\
        \                       }\n\
        \                  {-  Project.ExpectedMonthlyAWSRevenue.CurrencyCode\n\
        \                      \n\
        \                       }\n\
        \                  {-  Project.CustomerBusinessProblem\n\
        \                      \n\
        \                       }\n\
        \                  {-  PartnerOpportunityIdentifier\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         After updates, the opportunity re-enters the validation phase. This process \
         repeats until all issues are resolved, and the opportunity's [Lifecycle.ReviewStatus] is \
         set to [Approved] or [Rejected].\n\
        \         \n\
        \          }\n\
        \       {-  Approved: Validated and converted into the Amazon Web Services seller's \
         pipeline (editable).\n\
        \           \n\
        \            }\n\
        \       {-  Rejected: Disqualified (read-only).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  target_close_date : date option;
      [@ocaml.doc
        "Specifies the date when Amazon Web Services expects to start significant billing, when \
         the project finishes, and when it moves into production. This field informs the Amazon \
         Web Services seller about when the opportunity launches and starts to incur Amazon Web \
         Services usage.\n\n\
        \ Ensure the [Target Close Date] isn't in the past.\n\
        \ "]
  next_steps : pii_string option;
      [@ocaml.doc
        "Specifies the upcoming actions or tasks for the [Opportunity]. Use this field to \
         communicate with Amazon Web Services about the next actions required for the \
         [Opportunity].\n"]
  closed_lost_reason : closed_lost_reason option;
      [@ocaml.doc
        "Specifies the reason code when an opportunity is marked as {i Closed Lost}. When you \
         select an appropriate reason code, you communicate the context for closing the \
         [Opportunity], and aid in accurate reports and analysis of opportunity outcomes. The \
         possible values are:\n\n\
        \ {ul\n\
        \       {-  Customer Deficiency: The customer lacked necessary resources or capabilities.\n\
        \           \n\
        \            }\n\
        \       {-  Delay/Cancellation of Project: The project was delayed or canceled.\n\
        \           \n\
        \            }\n\
        \       {-  Legal/Tax/Regulatory: Legal, tax, or regulatory issues prevented progress.\n\
        \           \n\
        \            }\n\
        \       {-  Lost to Competitor\226\128\148Google: The opportunity was lost to Google.\n\
        \           \n\
        \            }\n\
        \       {-  Lost to Competitor\226\128\148Microsoft: The opportunity was lost to Microsoft.\n\
        \           \n\
        \            }\n\
        \       {-  Lost to Competitor\226\128\148SoftLayer: The opportunity was lost to SoftLayer.\n\
        \           \n\
        \            }\n\
        \       {-  Lost to Competitor\226\128\148VMWare: The opportunity was lost to VMWare.\n\
        \           \n\
        \            }\n\
        \       {-  Lost to Competitor\226\128\148Other: The opportunity was lost to a competitor \
         not listed above.\n\
        \           \n\
        \            }\n\
        \       {-  No Opportunity: There was no opportunity to pursue.\n\
        \           \n\
        \            }\n\
        \       {-  On Premises Deployment: The customer chose an on-premises solution.\n\
        \           \n\
        \            }\n\
        \       {-  Partner Gap: The partner lacked necessary resources or capabilities.\n\
        \           \n\
        \            }\n\
        \       {-  Price: The price was not competitive or acceptable to the customer.\n\
        \           \n\
        \            }\n\
        \       {-  Security/Compliance: Security or compliance issues prevented progress.\n\
        \           \n\
        \            }\n\
        \       {-  Technical Limitations: Technical limitations prevented progress.\n\
        \           \n\
        \            }\n\
        \       {-  Customer Experience: Issues related to the customer's experience impacted the \
         decision.\n\
        \           \n\
        \            }\n\
        \       {-  Other: Any reason not covered by the other values.\n\
        \           \n\
        \            }\n\
        \       {-  People/Relationship/Governance: Issues related to people, relationships, or \
         governance.\n\
        \           \n\
        \            }\n\
        \       {-  Product/Technology: Issues related to the product or technology.\n\
        \           \n\
        \            }\n\
        \       {-  Financial/Commercial: Financial or commercial issues impacted the decision.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  stage : stage option;
      [@ocaml.doc
        "Specifies the current stage of the [Opportunity]'s lifecycle as it maps to Amazon Web \
         Services stages from the current stage in the partner CRM. This field provides a \
         translated value of the stage, and offers insight into the [Opportunity]'s progression in \
         the sales cycle, according to Amazon Web Services definitions.\n\n\
        \  A lead and a prospect must be further matured to a [Qualified] opportunity before \
         submission. Opportunities that were closed/lost before submission aren't suitable for \
         submission.\n\
        \  \n\
        \    The descriptions of each sales stage are:\n\
        \    \n\
        \     {ul\n\
        \           {-  Prospect: Amazon Web Services identifies the opportunity. It can be active \
         (Comes directly from the end customer through a lead) or latent (Your account team \
         believes it exists based on research, account plans, sales plays).\n\
        \               \n\
        \                }\n\
        \           {-  Qualified: Your account team engaged with the customer to discuss \
         viability and requirements. The customer agreed that the opportunity is real, of \
         interest, and may solve business/technical needs.\n\
        \               \n\
        \                }\n\
        \           {-  Technical Validation: All parties understand the implementation plan.\n\
        \               \n\
        \                }\n\
        \           {-  Business Validation: Pricing was proposed, and all parties agree to the \
         steps to close.\n\
        \               \n\
        \                }\n\
        \           {-  Committed: The customer signed the contract, but Amazon Web Services \
         hasn't started billing.\n\
        \               \n\
        \                }\n\
        \           {-  Launched: The workload is complete, and Amazon Web Services has started \
         billing.\n\
        \               \n\
        \                }\n\
        \           {-  Closed Lost: The opportunity is lost, and there are no steps to move \
         forward.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \  "]
}
[@@ocaml.doc "An object that contains the [Opportunity] lifecycle's details.\n"]

type nonrec update_opportunity_request = {
  life_cycle : life_cycle option;
      [@ocaml.doc "An object that contains lifecycle details for the [Opportunity].\n"]
  identifier : opportunity_identifier;
      [@ocaml.doc "Read-only, system generated [Opportunity] unique identifier.\n"]
  last_modified_date : date_time;
      [@ocaml.doc " [DateTime] when the opportunity was last modified.\n"]
  software_revenue : software_revenue option;
      [@ocaml.doc
        "Specifies details of a customer's procurement terms. Required only for partners in \
         eligible programs.\n"]
  marketing : marketing option;
      [@ocaml.doc "An object that contains marketing details for the [Opportunity].\n"]
  opportunity_type : opportunity_type option;
      [@ocaml.doc
        "Specifies the opportunity type as a renewal, new, or expansion.\n\n\
        \ Opportunity types:\n\
        \ \n\
        \  {ul\n\
        \        {-  New opportunity: Represents a new business opportunity with a potential \
         customer that's not previously engaged with your solutions or services.\n\
        \            \n\
        \             }\n\
        \        {-  Renewal opportunity: Represents an opportunity to renew an existing contract \
         or subscription with a current customer, ensuring continuity of service.\n\
        \            \n\
        \             }\n\
        \        {-  Expansion opportunity: Represents an opportunity to expand the scope of an \
         existing contract or subscription, either by adding new services or increasing the volume \
         of existing services for a current customer.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  project : project option;
      [@ocaml.doc "An object that contains project details summary for the [Opportunity].\n"]
  customer : customer option;
      [@ocaml.doc "Specifies details of the customer associated with the [Opportunity].\n"]
  partner_opportunity_identifier : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Specifies the opportunity's unique identifier in the partner's CRM system. This value is \
         essential to track and reconcile because it's included in the outbound payload sent back \
         to the partner.\n"]
  national_security : national_security option;
      [@ocaml.doc
        "Specifies if the opportunity is associated with national security concerns. This flag is \
         only applicable when the industry is [Government]. For national-security-related \
         opportunities, validation and compliance rules may apply, impacting the opportunity's \
         visibility and processing.\n"]
  primary_needs_from_aws : primary_needs_from_aws option;
      [@ocaml.doc
        "Identifies the type of support the partner needs from Amazon Web Services.\n\n\
        \ Valid values:\n\
        \ \n\
        \  {ul\n\
        \        {-  Cosell\226\128\148Architectural Validation: Confirmation from Amazon Web \
         Services that the partner's proposed solution architecture is aligned with Amazon Web \
         Services best practices and poses minimal architectural risks.\n\
        \            \n\
        \             }\n\
        \        {-  Cosell\226\128\148Business Presentation: Request Amazon Web Services seller's \
         participation in a joint customer presentation.\n\
        \            \n\
        \             }\n\
        \        {-  Cosell\226\128\148Competitive Information: Access to Amazon Web Services \
         competitive resources and support for the partner's proposed solution.\n\
        \            \n\
        \             }\n\
        \        {-  Cosell\226\128\148Pricing Assistance: Connect with an AWS seller for support \
         situations where a partner may be receiving an upfront discount on a service (for \
         example: EDP deals).\n\
        \            \n\
        \             }\n\
        \        {-  Cosell\226\128\148Technical Consultation: Connection with an Amazon Web \
         Services Solutions Architect to address the partner's questions about the proposed \
         solution.\n\
        \            \n\
        \             }\n\
        \        {-  Cosell\226\128\148Total Cost of Ownership Evaluation: Assistance with quoting \
         different cost savings of proposed solutions on Amazon Web Services versus on-premises or \
         a traditional hosting environment.\n\
        \            \n\
        \             }\n\
        \        {-  Cosell\226\128\148Deal Support: Request Amazon Web Services seller's support \
         to progress the opportunity (for example: joint customer call, strategic positioning).\n\
        \            \n\
        \             }\n\
        \        {-  Cosell\226\128\148Support for Public Tender/RFx: Opportunity related to the \
         public sector where the partner needs RFx support from Amazon Web Services.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog associated with the request. This field takes a string value from a \
         predefined list: [AWS] or [Sandbox]. The catalog determines which environment the \
         opportunity is updated in. Use [AWS] to update real opportunities in the production \
         environment, and [Sandbox] for testing in secure, isolated environments. When you use the \
         [Sandbox] catalog, it allows you to simulate and validate your interactions with Amazon \
         Web Services services without affecting live data or operations.\n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "This error occurs when there are too many requests sent. Review the provided quotas and adapt \
   your usage to avoid throttling.\n\n\
  \ This error occurs when there are too many requests sent. Review the provided \
   {{:https://docs.aws.amazon.com/partner-central/latest/selling-api/quotas.html}Quotas} and retry \
   after the provided delay.\n\
  \ "]

type nonrec resource_not_found_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "This error occurs when the specified resource can't be found. The resource might not exist, or \
   isn't visible with the current credentials.\n\n\
  \ Suggested action: Verify that the resource ID is correct and the resource is in the expected \
   AWS region. Check IAM permissions for accessing the resource.\n\
  \ "]

type nonrec internal_server_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "This error occurs when the specified resource can\226\128\153t be found or doesn't exist. \
   Resource ID and type might be incorrect.\n\n\
  \ Suggested action: This is usually a transient error. Retry after the provided retry delay or a \
   short interval. If the problem persists, contact AWS support.\n\
  \ "]

type nonrec conflict_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "This error occurs when the request can\226\128\153t be processed due to a conflict with the \
   target resource's current state, which could result from updating or deleting the resource.\n\n\
  \ Suggested action: Fetch the latest state of the resource, verify the state, and retry the \
   request.\n\
  \ "]

type nonrec access_denied_exception_error_code =
  | INCOMPATIBLE_BENEFIT_AWS_PARTNER_STATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec access_denied_exception = {
  reason : access_denied_exception_error_code option;
      [@ocaml.doc "The reason why access was denied for the requested operation.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "This error occurs when you don't have permission to perform the requested action.\n\n\
  \ You don\226\128\153t have access to this action or resource. Review IAM policies or contact \
   your AWS administrator for assistance.\n\
  \ "]

type nonrec lead_qualification_status = string [@@ocaml.doc ""]

type nonrec company_name = string [@@ocaml.doc ""]

type nonrec company_website_url = string [@@ocaml.doc ""]

type nonrec address_summary = {
  country_code : country_code option;
      [@ocaml.doc "Specifies the end [Customer]'s country associated with the [Opportunity].\n"]
  state_or_region : address_part option;
      [@ocaml.doc
        "Specifies the end [Customer]'s state or region associated with the [Opportunity].\n\n\
        \ Valid values: [Alabama | Alaska | American Samoa | Arizona | Arkansas | California | \
         Colorado | Connecticut | Delaware | Dist. of Columbia | Federated States of Micronesia | \
         Florida | Georgia | Guam | Hawaii | Idaho | Illinois | Indiana | Iowa | Kansas | Kentucky \
         | Louisiana | Maine | Marshall Islands | Maryland | Massachusetts | Michigan | Minnesota \
         | Mississippi | Missouri | Montana | Nebraska | Nevada | New Hampshire | New Jersey | New \
         Mexico | New York | North Carolina | North Dakota | Northern Mariana Islands | Ohio | \
         Oklahoma | Oregon | Palau | Pennsylvania | Puerto Rico | Rhode Island | South Carolina | \
         South Dakota | Tennessee | Texas | Utah | Vermont | Virginia | Virgin Islands | \
         Washington | West Virginia | Wisconsin | Wyoming | APO/AE | AFO/FPO | FPO, AP] \n\
        \ "]
  postal_code : address_part option;
      [@ocaml.doc "Specifies the end [Customer]'s postal code associated with the [Opportunity].\n"]
  city : address_part option;
      [@ocaml.doc "Specifies the end [Customer]'s city associated with the [Opportunity].\n"]
}
[@@ocaml.doc "An object that contains an [Address] object's subset of fields.\n"]

type nonrec aws_maturity = string [@@ocaml.doc ""]

type nonrec market_segment =
  | MICRO [@ocaml.doc ""]
  | SMALL [@ocaml.doc ""]
  | MEDIUM [@ocaml.doc ""]
  | LARGE [@ocaml.doc ""]
  | ENTERPRISE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec lead_customer = {
  market_segment : market_segment option;
      [@ocaml.doc
        "Specifies the market segment classification of the lead customer, such as enterprise, \
         mid-market, or small business. This segmentation helps in targeting appropriate solutions \
         and engagement strategies.\n"]
  aws_maturity : aws_maturity option;
      [@ocaml.doc
        "Indicates the customer's level of experience and adoption with AWS services. This \
         assessment helps determine the appropriate engagement approach and solution complexity.\n"]
  address : address_summary; [@ocaml.doc ""]
  website_url : company_website_url option;
      [@ocaml.doc
        "The website URL of the lead customer's company. This provides additional context about \
         the customer organization and helps verify company legitimacy and size.\n"]
  company_name : company_name;
      [@ocaml.doc
        "The name of the lead customer's company. This field is essential for identifying and \
         tracking the customer organization associated with the lead.\n"]
  industry : industry option;
      [@ocaml.doc
        "Specifies the industry sector to which the lead customer's company belongs. This \
         categorization helps in understanding the customer's business context and tailoring \
         appropriate solutions.\n"]
}
[@@ocaml.doc
  "Contains detailed information about the customer associated with the lead, including company \
   details, industry classification, and AWS maturity level. This information helps qualify and \
   categorize the lead for appropriate engagement strategies.\n"]

type nonrec lead_source_type = string [@@ocaml.doc ""]

type nonrec lead_source_id = string [@@ocaml.doc ""]

type nonrec lead_source_name = string [@@ocaml.doc ""]

type nonrec engagement_use_case = string [@@ocaml.doc ""]

type nonrec customer_action = string [@@ocaml.doc ""]

type nonrec engagement_customer_business_problem = string [@@ocaml.doc ""]

type nonrec lead_contact = {
  phone : phone_number option;
      [@ocaml.doc "The lead contact's phone number associated with the engagement.\n"]
  last_name : name; [@ocaml.doc "The lead contact's last name associated with the engagement.\n"]
  first_name : name; [@ocaml.doc "The lead contact's first name associated with the engagement.\n"]
  email : email; [@ocaml.doc "The lead contact's email address associated with the engagement.\n"]
  business_title : job_title;
      [@ocaml.doc "The lead contact's business title or job role associated with the engagement.\n"]
}
[@@ocaml.doc
  "An object that contains a lead contact's details associated with the engagement. This provides \
   contact information for individuals involved in lead-related activities.\n"]

type nonrec lead_interaction = {
  contact : lead_contact;
      [@ocaml.doc
        "Contains contact information for the customer representative involved in the lead \
         interaction, including their name, title, and contact details.\n"]
  business_problem : engagement_customer_business_problem option;
      [@ocaml.doc
        "Describes the business problem or challenge that the customer discussed during the \
         interaction. This information helps qualify the lead and identify appropriate solutions.\n"]
  customer_action : customer_action;
      [@ocaml.doc
        "Describes the action taken by the customer during or as a result of the interaction, such \
         as requesting information, scheduling a meeting, or expressing interest in a solution.\n"]
  interaction_date : date_time option;
      [@ocaml.doc
        "The date and time when the lead interaction occurred, in ISO 8601 format (UTC). This \
         timestamp helps track the chronology of lead engagement activities.\n"]
  usecase : engagement_use_case option;
      [@ocaml.doc
        "Describes the specific use case or business scenario discussed during the lead \
         interaction. This helps categorize the customer's interests and potential solutions.\n"]
  source_name : lead_source_name;
      [@ocaml.doc
        "The descriptive name of the source that generated the lead interaction, providing a \
         human-readable identifier for the lead generation channel or activity.\n"]
  source_id : lead_source_id;
      [@ocaml.doc
        "The unique identifier of the specific source that generated the lead interaction. This ID \
         provides traceability back to the original lead generation activity.\n"]
  source_type : lead_source_type;
      [@ocaml.doc
        "Specifies the type of source that generated the lead interaction, such as \"Event\", \
         \"Website\", \"Referral\", or \"Campaign\". This categorization helps track lead \
         generation effectiveness across different channels.\n"]
}
[@@ocaml.doc
  "Represents a specific interaction or touchpoint with a lead customer. This structure captures \
   details about communications, meetings, or other engagement activities that help track the \
   lead's progression and engagement history.\n"]

type nonrec lead_insights = {
  lead_readiness_score : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A score that indicates the lead's readiness for engagement. Valid values are [Low], \
         [Medium], and [High]. Use this score to prioritize leads based on their likelihood of \
         conversion.\n"]
}
[@@ocaml.doc
  "Contains insights that AI generates for a lead. These insights provide automated analysis to \
   help partners evaluate the lead quality and prioritize engagement efforts.\n"]

type nonrec update_lead_context = {
  insights : lead_insights option;
      [@ocaml.doc
        "Insights that AI generates and associates with the lead. These insights provide automated \
         analysis to help partners assess the lead quality and readiness.\n"]
  interaction : lead_interaction option;
      [@ocaml.doc "Updated interaction details for the lead context.\n"]
  customer : lead_customer; [@ocaml.doc "Updated customer information associated with the lead.\n"]
  qualification_status : lead_qualification_status option;
      [@ocaml.doc "The updated qualification status of the lead.\n"]
}
[@@ocaml.doc
  "Updates the context information for a lead with qualification status, customer details, and \
   interaction data.\n"]

type nonrec engagement_identifier = string [@@ocaml.doc ""]

type nonrec engagement_arn = string [@@ocaml.doc ""]

type nonrec engagement_context_identifier = string [@@ocaml.doc ""]

type nonrec update_engagement_context_response = {
  context_id : engagement_context_identifier;
      [@ocaml.doc "The unique identifier of the engagement context that was updated.\n"]
  engagement_last_modified_at : date_time;
      [@ocaml.doc "The timestamp when the engagement context was last modified.\n"]
  engagement_arn : engagement_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the updated engagement.\n"]
  engagement_id : engagement_identifier;
      [@ocaml.doc "The unique identifier of the engagement that was updated.\n"]
}
[@@ocaml.doc ""]

type nonrec engagement_arn_or_identifier = string [@@ocaml.doc ""]

type nonrec engagement_context_type =
  | PROSPECTING_RESULT [@ocaml.doc ""]
  | LEAD [@ocaml.doc ""]
  | CUSTOMER_PROJECT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec engagement_customer = {
  country_code : country_code;
      [@ocaml.doc
        "Indicates the country in which the customer\226\128\153s company operates. This field is \
         useful for understanding regional requirements or compliance needs.\n"]
  website_url : company_website_url;
      [@ocaml.doc
        "Provides the website URL of the customer\226\128\153s company. This field helps partners \
         verify the legitimacy and size of the customer organization.\n"]
  company_name : company_name;
      [@ocaml.doc
        "Represents the name of the customer\226\128\153s company associated with the Engagement \
         Invitation. This field is used to identify the customer.\n"]
  industry : industry;
      [@ocaml.doc
        "Specifies the industry to which the customer\226\128\153s company belongs. This field \
         helps categorize the opportunity based on the customer\226\128\153s business sector.\n"]
}
[@@ocaml.doc
  "Contains details about the customer associated with the Engagement Invitation, including \
   company information and industry.\n"]

type nonrec engagement_customer_project_title = string [@@ocaml.doc ""]

type nonrec engagement_customer_project_details = {
  target_completion_date : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The target completion date for the customer's project.\n"]
  business_problem : engagement_customer_business_problem;
      [@ocaml.doc "A description of the business problem the project aims to solve.\n"]
  title : engagement_customer_project_title; [@ocaml.doc "The title of the project.\n"]
}
[@@ocaml.doc
  "Provides comprehensive details about a customer project associated with an Engagement. This may \
   include information such as project goals, timelines, and specific customer requirements. \n"]

type nonrec customer_projects_context = {
  project : engagement_customer_project_details option;
      [@ocaml.doc "Information about the customer project associated with the Engagement.\n"]
  customer : engagement_customer option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The CustomerProjects structure in Engagements offers a flexible framework for managing \
   customer-project relationships. It supports multiple customers per Engagement and multiple \
   projects per customer, while also allowing for customers without projects and projects without \
   specific customers. \n\n\
  \ All Engagement members have full visibility of customers and their associated projects, \
   enabling the capture of relevant context even when project details are not fully defined. This \
   structure also facilitates targeted invitations, allowing partners to focus on specific \
   customers and their business problems when sending Engagement invitations. \n\
  \ "]

type nonrec prospecting_task_identifier = string [@@ocaml.doc ""]

type nonrec task_arn = string [@@ocaml.doc ""]

type nonrec task_name = string [@@ocaml.doc ""]

type nonrec prospecting_account_name = string [@@ocaml.doc ""]

type nonrec prospecting_geo = string [@@ocaml.doc ""]

type nonrec prospecting_region = string [@@ocaml.doc ""]

type nonrec prospecting_sub_region = string [@@ocaml.doc ""]

type nonrec prospecting_sub_industry = string [@@ocaml.doc ""]

type nonrec prospecting_segment = string [@@ocaml.doc ""]

type nonrec prospecting_company_size = string [@@ocaml.doc ""]

type nonrec eligible_programs_list = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec prospecting_public_profile_summary = string [@@ocaml.doc ""]

type nonrec prospecting_result_customer = {
  public_profile_summary : prospecting_public_profile_summary option;
      [@ocaml.doc
        "A summary of publicly available information about the prospected customer. The system \
         uses this summary to generate customer insights and inform engagement strategies.\n"]
  eligible_programs : eligible_programs_list option;
      [@ocaml.doc
        "A list of AWS Greenfield programs that the prospected customer is eligible for. Use this \
         list to identify relevant go-to-market opportunities.\n"]
  company_size : prospecting_company_size option;
      [@ocaml.doc "The company size classification of the prospected customer account.\n"]
  segment : prospecting_segment option;
      [@ocaml.doc "The market segment classification of the prospected customer account.\n"]
  sub_industry : prospecting_sub_industry option;
      [@ocaml.doc
        "The sub-industry classification of the prospected customer account. This provides more \
         granular categorization within the primary industry.\n"]
  industry : industry option;
      [@ocaml.doc "The industry classification of the prospected customer account.\n"]
  country : country_code option;
      [@ocaml.doc "The country code of the prospected customer account.\n"]
  sub_region : prospecting_sub_region option;
      [@ocaml.doc "The subregion classification of the prospected customer account.\n"]
  region : prospecting_region option;
      [@ocaml.doc "The specific region of the prospected customer account.\n"]
  geo : prospecting_geo option;
      [@ocaml.doc "The geographic region classification of the prospected customer account.\n"]
  account_name : prospecting_account_name option;
      [@ocaml.doc "The name of the prospected customer account.\n"]
}
[@@ocaml.doc
  "Contains detailed information about the prospected customer account, including company \
   identifiers, geographic classification, industry segmentation, and program eligibility.\n"]

type nonrec engagement_score_level = string [@@ocaml.doc ""]

type nonrec prospecting_insights = {
  solution_sub_category : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The solution sub-category classification for the prospected customer. This provides more \
         granular categorization of the recommended solution type.\n"]
  solution_category : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The primary solution category classification for the prospected customer. This indicates \
         the type of solution that best addresses their needs.\n"]
  solution_score : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A score that indicates how well the partner's solution fits the prospected customer's \
         needs.\n"]
  marketplace_engagement_score : engagement_score_level option;
      [@ocaml.doc
        "A score that indicates the prospected customer's level of engagement with AWS \
         Marketplace. Valid values are [High], [Medium], and [Low].\n"]
}
[@@ocaml.doc
  "Contains insights that AI generates from the prospecting analysis. These insights include \
   marketplace engagement scoring, solution fit assessments, and solution categorization for the \
   prospected customer.\n"]

type nonrec prospecting_result_aws = {
  insights : prospecting_insights option;
      [@ocaml.doc
        "Insights that AI generates from the prospecting analysis. These insights include \
         engagement scores and solution fit assessments for the prospected customer.\n"]
  customer : prospecting_result_customer option;
      [@ocaml.doc
        "Contains details about the prospected customer account, including geographic, industry, \
         and segment classifications.\n"]
  task_name : task_name option;
      [@ocaml.doc
        "The name that the user provides for the prospecting task that generates this result.\n"]
  task_arn : task_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the prospecting task. Use this ARN to track and manage \
         the task within AWS.\n"]
  task_id : prospecting_task_identifier option;
      [@ocaml.doc "The unique identifier of the prospecting task that generates this result.\n"]
  end_time : date_time option;
      [@ocaml.doc
        "The timestamp when the prospecting task completed processing. The format is ISO 8601 (UTC).\n"]
  start_time : date_time option;
      [@ocaml.doc
        "The timestamp when the prospecting result context was created. The format is ISO 8601 \
         (UTC).\n"]
}
[@@ocaml.doc
  "Contains the prospecting data that AWS sources. This includes task execution details, customer \
   account information, and insights that AI generates from the prospecting analysis.\n"]

type nonrec prospecting_result = {
  aws : prospecting_result_aws option;
      [@ocaml.doc
        "Prospecting data and insights that AWS provides during the prospecting job. This includes \
         customer details, task information, and scoring that AI generates.\n"]
}
[@@ocaml.doc
  "Contains the results of an autonomous prospecting job. This includes data and insights that AWS \
   provides about a prospected customer account.\n"]

type nonrec update_engagement_context_payload =
  | ProspectingResult of prospecting_result
      [@ocaml.doc
        "Contains updated prospecting result data when the context type is \"ProspectingResult\". \
         This field includes enriched data and insights that the system generates when a partner \
         runs an autonomous prospecting job on leads.\n"]
  | CustomerProject of customer_projects_context [@ocaml.doc ""]
  | Lead of update_lead_context
      [@ocaml.doc
        "Contains updated information about a lead when the context type is \"Lead\". This field \
         is present only when updating a lead context within the engagement.\n"]
[@@ocaml.doc
  "Represents the updated payload of an engagement context. The structure of this payload varies \
   based on the context type being updated.\n"]

type nonrec update_engagement_context_request = {
  payload : update_engagement_context_payload;
      [@ocaml.doc
        "Contains the updated contextual information for the engagement. The structure of this \
         payload varies based on the context type specified in the Type field.\n"]
  type_ : engagement_context_type;
      [@ocaml.doc
        "Specifies the type of context being updated within the engagement. This field determines \
         the structure and content of the context payload being modified.\n"]
  engagement_last_modified_at : date_time;
      [@ocaml.doc
        "The timestamp when the engagement was last modified, used for optimistic concurrency \
         control. This helps prevent conflicts when multiple users attempt to update the same \
         engagement simultaneously.\n"]
  context_identifier : engagement_context_identifier;
      [@ocaml.doc
        "The unique identifier of the specific engagement context to be updated. This ensures that \
         the correct context within the engagement is modified.\n"]
  engagement_identifier : engagement_arn_or_identifier;
      [@ocaml.doc
        "The unique identifier of the [Engagement] containing the context to be updated. This \
         parameter ensures the context update is applied to the correct engagement.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog associated with the engagement context update request. This field \
         takes a string value from a predefined list: [AWS] or [Sandbox]. The catalog determines \
         which environment the engagement context is updated in.\n"]
}
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "This error occurs when the request would cause a service quota to be exceeded. Service quotas \
   represent the maximum allowed use of a specific resource, and this error indicates that the \
   request would surpass that limit.\n\n\
  \ Suggested action: Review the \
   {{:https://docs.aws.amazon.com/partner-central/latest/selling-api/quotas.html}Quotas} for the \
   resource, and either reduce usage or request a quota increase.\n\
  \ "]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec taggable_resource_arn = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list;
      [@ocaml.doc
        "The keys of the key-value pairs for the tag or tags you want to remove from the specified \
         resource.\n"]
  resource_arn : taggable_resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource that you want to untag.\n"]
}
[@@ocaml.doc ""]

type nonrec task_status =
  | FAILED [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec task_statuses = task_status list [@@ocaml.doc ""]

type nonrec task_name_list = task_name list [@@ocaml.doc ""]

type nonrec task_arn_or_identifier = string [@@ocaml.doc ""]

type nonrec task_identifiers = task_arn_or_identifier list [@@ocaml.doc ""]

type nonrec task_identifier_list = prospecting_task_identifier list [@@ocaml.doc ""]

type nonrec task_identifier = string [@@ocaml.doc ""]

type nonrec target_close_date_filter = {
  before_target_close_date : date option;
      [@ocaml.doc
        "Filters opportunities with a target close date before this date. Use the [YYYY-MM-DD] \
         format.\n"]
  after_target_close_date : date option;
      [@ocaml.doc
        "Filters opportunities with a target close date after this date. Use the [YYYY-MM-DD] \
         format.\n"]
}
[@@ocaml.doc "Filters opportunities based on their target close date.\n"]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value; [@ocaml.doc "The value in the tag.\n"]
  key : tag_key; [@ocaml.doc "The key in the tag.\n"]
}
[@@ocaml.doc "The key-value pair assigned to a specified resource.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tag_list; [@ocaml.doc "A map of the key-value pairs of the tag or tags to assign.\n"]
  resource_arn : taggable_resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource that you want to tag.\n"]
}
[@@ocaml.doc ""]

type nonrec sales_involvement_type = CO_SELL [@ocaml.doc ""] | FOR_VISIBILITY_ONLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec submit_opportunity_request = {
  visibility : visibility option;
      [@ocaml.doc
        "Determines whether to restrict visibility of the opportunity from AWS sales. Default \
         value is Full. Valid values:\n\n\
        \ {ul\n\
        \       {-   [Full]: The opportunity is fully visible to AWS sales.\n\
        \           \n\
        \            }\n\
        \       {-   [Limited]: The opportunity has restricted visibility to AWS sales.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  involvement_type : sales_involvement_type;
      [@ocaml.doc
        "Specifies the level of AWS sellers' involvement on the opportunity. Valid values:\n\n\
        \ {ul\n\
        \       {-   [Co-sell]: Indicates the user wants to co-sell with AWS. Share the \
         opportunity with AWS to receive deal assistance and support.\n\
        \           \n\
        \            }\n\
        \       {-   [For Visibility Only]: Indicates that the user does not need support from AWS \
         Sales Rep. Share this opportunity with AWS for visibility only, you will not receive deal \
         assistance and support.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  identifier : opportunity_identifier;
      [@ocaml.doc
        "The identifier of the Opportunity previously created by partner and needs to be submitted.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog related to the request. Valid values are:\n\n\
        \ {ul\n\
        \       {-  AWS: Submits the opportunity request from the production AWS environment.\n\
        \           \n\
        \            }\n\
        \       {-  Sandbox: Submits the opportunity request from a sandbox environment used for \
         testing or development purposes.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec string_list = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec resource_snapshot_job_identifier = string [@@ocaml.doc ""]

type nonrec stop_resource_snapshot_job_request = {
  resource_snapshot_job_identifier : resource_snapshot_job_identifier;
      [@ocaml.doc "The identifier of the job to stop.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog related to the request. Valid values are:\n\n\
        \ {ul\n\
        \       {-  AWS: Stops the request from the production AWS environment.\n\
        \           \n\
        \            }\n\
        \       {-  Sandbox: Stops the request from a sandbox environment used for testing or \
         development purposes.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec start_resource_snapshot_job_request = {
  resource_snapshot_job_identifier : resource_snapshot_job_identifier;
      [@ocaml.doc "The identifier of the resource snapshot job to start.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog related to the request. Valid values are:\n\n\
        \ {ul\n\
        \       {-  AWS: Starts the request from the production AWS environment.\n\
        \           \n\
        \            }\n\
        \       {-  Sandbox: Starts the request from a sandbox environment used for testing or \
         development purposes.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec engagement_identifier_list = engagement_identifier list [@@ocaml.doc ""]

type nonrec prospecting_task_arn = string [@@ocaml.doc ""]

type nonrec prospecting_task_status =
  | FAILED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc
  "The current execution state of a prospecting task. A task transitions from [PENDING] to \
   [IN_PROGRESS] when processing begins, and then to either [COMPLETED] or [FAILED] when \
   processing ends.\n"]

type nonrec start_prospecting_from_engagement_task_response = {
  task_status : prospecting_task_status;
      [@ocaml.doc
        "The current status of the task. Possible values: [PENDING] (waiting to run), \
         [IN_PROGRESS] (actively processing), [COMPLETED] (successfully processed), and [FAILED] \
         (unrecoverable error).\n"]
  task_arn : prospecting_task_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the task. The ARN uniquely identifies the task across \
         AWS and can be used for resource-level IAM policies.\n"]
  task_id : prospecting_task_identifier option;
      [@ocaml.doc
        "The unique identifier assigned to this task. Use this identifier with \
         [GetProspectingFromEngagementTask] to retrieve task details and check status.\n"]
  start_time : date_time;
      [@ocaml.doc
        "The timestamp indicating when the task was initiated. The format follows ISO 8601 \
         date-time notation.\n"]
  reason_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "An enumerated code identifying the reason for task failure. This field is only populated \
         when the task has failed. Use the corresponding [Message] field for a human-readable \
         description of the failure.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A message providing additional context about the task's current state. When the task \
         fails, this field contains a detailed description of the failure and suggested recovery \
         steps. This field is only populated for tasks in a failed state.\n"]
  task_name : task_name; [@ocaml.doc "The task name from the request.\n"]
  identifiers : engagement_identifier_list;
      [@ocaml.doc
        "The list of engagement identifiers that were accepted into the task queue for processing. \
         This list matches the identifiers provided in the request.\n"]
}
[@@ocaml.doc
  "Represents the response structure returned when a prospecting task is successfully submitted. \
   Contains the task identifier, ARN, and initial status. Uses [TaskId] with \
   [GetProspectingFromEngagementTask] to poll for completion.\n"]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec start_prospecting_from_engagement_task_request = {
  client_token : client_token;
      [@ocaml.doc
        "A unique, case-sensitive identifier provided by the client to ensure idempotency. Making \
         the same request with the same [ClientToken] returns the same response without creating a \
         duplicate task.\n"]
  task_name : task_name;
      [@ocaml.doc
        "A descriptive name for the task. This name helps identify the task in list and get \
         operations. The name must contain 1 to 128 characters.\n"]
  identifiers : engagement_identifier_list;
      [@ocaml.doc
        "The list of engagement identifiers to include in this prospecting task. Each identifier \
         must correspond to an existing engagement in the specified catalog. Maximum of 100 \
         identifiers per task.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog in which the task is initiated. Specify [AWS] for production \
         environments and [Sandbox] for testing and development purposes.\n"]
}
[@@ocaml.doc
  "Represents the request structure for starting a prospecting task. Includes up to 100 engagement \
   identifiers and a task name. Uses [ClientToken] to ensure idempotency.\n"]

type nonrec reason_code =
  | DISQUALIFIED_LEAD_NOT_PERMITTED [@ocaml.doc ""]
  | CUSTOMER_PROJECT_CONTEXT_NOT_PERMITTED [@ocaml.doc ""]
  | CONTEXT_NOT_FOUND [@ocaml.doc ""]
  | REQUEST_THROTTLED [@ocaml.doc ""]
  | SERVICE_QUOTA_EXCEEDED [@ocaml.doc ""]
  | RESOURCE_SNAPSHOT_CONFLICT [@ocaml.doc ""]
  | RESOURCE_SNAPSHOT_VALIDATION_FAILED [@ocaml.doc ""]
  | RESOURCE_SNAPSHOT_ACCESS_DENIED [@ocaml.doc ""]
  | OPPORTUNITY_CONFLICT [@ocaml.doc ""]
  | OPPORTUNITY_VALIDATION_FAILED [@ocaml.doc ""]
  | INTERNAL_ERROR [@ocaml.doc ""]
  | ENGAGEMENT_INVITATION_CONFLICT [@ocaml.doc ""]
  | OPPORTUNITY_SUBMISSION_FAILED [@ocaml.doc ""]
  | ENGAGEMENT_CONFLICT [@ocaml.doc ""]
  | ENGAGEMENT_VALIDATION_FAILED [@ocaml.doc ""]
  | RESOURCE_SNAPSHOT_JOB_CONFLICT [@ocaml.doc ""]
  | RESOURCE_SNAPSHOT_JOB_VALIDATION_FAILED [@ocaml.doc ""]
  | RESOURCE_SNAPSHOT_JOB_ACCESS_DENIED [@ocaml.doc ""]
  | OPPORTUNITY_ACCESS_DENIED [@ocaml.doc ""]
  | ENGAGEMENT_ACCESS_DENIED [@ocaml.doc ""]
  | INVITATION_VALIDATION_FAILED [@ocaml.doc ""]
  | INVITATION_ACCESS_DENIED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec context_identifier = string [@@ocaml.doc ""]

type nonrec start_opportunity_from_engagement_task_response = {
  context_id : context_identifier option;
      [@ocaml.doc
        "The unique identifier of the engagement context used to create the opportunity.\n"]
  engagement_id : engagement_identifier option;
      [@ocaml.doc
        "The unique identifier of the engagement from which the opportunity was created.\n"]
  resource_snapshot_job_id : resource_snapshot_job_identifier option;
      [@ocaml.doc
        "The identifier of the resource snapshot job created as part of the opportunity creation \
         process.\n"]
  opportunity_id : opportunity_identifier option;
      [@ocaml.doc
        "The unique identifier of the opportunity created as a result of the task. This field is \
         populated when the task is completed successfully.\n"]
  reason_code : reason_code option;
      [@ocaml.doc "Indicates the reason for task failure using an enumerated code.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "If the task fails, this field contains a detailed message describing the failure and \
         possible recovery steps.\n"]
  task_status : task_status option; [@ocaml.doc "Indicates the current status of the task.\n"]
  start_time : date_time option;
      [@ocaml.doc
        "The timestamp indicating when the task was initiated. The format follows RFC 3339 section \
         5.6.\n"]
  task_arn : task_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the task, used for tracking and managing the task \
         within AWS.\n"]
  task_id : task_identifier option;
      [@ocaml.doc "The unique identifier of the task, used to track the task's progress.\n"]
}
[@@ocaml.doc ""]

type nonrec start_opportunity_from_engagement_task_request = {
  tags : tag_list option;
      [@ocaml.doc "A map of the key-value pairs of the tag or tags to assign.\n"]
  context_identifier : context_identifier;
      [@ocaml.doc
        "The unique identifier of the engagement context from which to create the opportunity. \
         This specifies the specific contextual information within the engagement that will be \
         used for opportunity creation.\n"]
  identifier : engagement_arn_or_identifier;
      [@ocaml.doc
        "The unique identifier of the engagement from which the opportunity creation task is to be \
         initiated. This helps ensure that the task is applied to the correct engagement.\n"]
  client_token : client_token;
      [@ocaml.doc
        "A unique token provided by the client to help ensure the idempotency of the request. It \
         helps prevent the same task from being performed multiple times.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog in which the opportunity creation task is executed. Acceptable \
         values include [AWS] for production and [Sandbox] for testing environments.\n"]
}
[@@ocaml.doc ""]

type nonrec engagement_invitation_identifier = string [@@ocaml.doc ""]

type nonrec start_engagement_from_opportunity_task_response = {
  engagement_invitation_id : engagement_invitation_identifier option;
      [@ocaml.doc
        "The identifier of the new Engagement invitation. Only populated if TaskStatus is COMPLETE.\n"]
  engagement_id : engagement_identifier option;
      [@ocaml.doc
        "The identifier of the newly created Engagement. Only populated if TaskStatus is COMPLETE.\n"]
  resource_snapshot_job_id : resource_snapshot_job_identifier option;
      [@ocaml.doc
        "The identifier of the resource snapshot job created to add the opportunity resource \
         snapshot to the Engagement. Only populated if TaskStatus is COMPLETE\n"]
  opportunity_id : opportunity_identifier option;
      [@ocaml.doc
        "Returns the original opportunity identifier passed in the request, which is the unique \
         identifier for the opportunity created in the partner\226\128\153s system.\n"]
  reason_code : reason_code option;
      [@ocaml.doc "Indicates the reason for task failure using an enumerated code.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "If the task fails, this field contains a detailed message describing the failure and \
         possible recovery steps.\n"]
  task_status : task_status option;
      [@ocaml.doc
        "Indicates the current status of the task. Valid values include [IN_PROGRESS], [COMPLETE], \
         and [FAILED].\n"]
  start_time : date_time option;
      [@ocaml.doc
        "The timestamp indicating when the task was initiated. The format follows RFC 3339 section \
         5.6.\n"]
  task_arn : task_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the task, used for tracking and managing the task \
         within AWS.\n"]
  task_id : task_identifier option;
      [@ocaml.doc
        "The unique identifier of the task, used to track the task\226\128\153s progress. This \
         value follows a specific pattern: [^oit-\\[0-9a-z\\]{13}$].\n"]
}
[@@ocaml.doc ""]

type nonrec aws_submission = {
  visibility : visibility option;
      [@ocaml.doc
        "Determines who can view AWS involvement in the opportunity. Typically, this field is set \
         to [Full] for most cases, but it may be restricted based on special program requirements \
         or confidentiality needs.\n"]
  involvement_type : sales_involvement_type;
      [@ocaml.doc
        "Specifies the type of AWS involvement in the opportunity, such as coselling, deal \
         support, or technical consultation. This helps categorize the nature of AWS participation.\n"]
}
[@@ocaml.doc
  "Indicates the level of AWS involvement in the opportunity. This field helps track AWS \
   participation throughout the engagement, such as providing technical support, deal assistance, \
   and sales support.\n"]

type nonrec start_engagement_from_opportunity_task_request = {
  tags : tag_list option;
      [@ocaml.doc "A map of the key-value pairs of the tag or tags to assign.\n"]
  aws_submission : aws_submission; [@ocaml.doc ""]
  identifier : opportunity_identifier;
      [@ocaml.doc
        "The unique identifier of the opportunity from which the engagement task is to be \
         initiated. This helps ensure that the task is applied to the correct opportunity.\n"]
  client_token : client_token;
      [@ocaml.doc
        "A unique token provided by the client to help ensure the idempotency of the request. It \
         helps prevent the same task from being performed multiple times.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog in which the engagement is tracked. Acceptable values include [AWS] \
         for production and [Sandbox] for testing environments.\n"]
}
[@@ocaml.doc ""]

type nonrec start_engagement_by_accepting_invitation_task_response = {
  engagement_invitation_id : engagement_invitation_identifier option;
      [@ocaml.doc
        "Returns the identifier of the engagement invitation that was accepted and used to create \
         the opportunity.\n"]
  resource_snapshot_job_id : resource_snapshot_job_identifier option;
      [@ocaml.doc "The identifier of the Resource Snapshot Job created as part of this task.\n"]
  opportunity_id : opportunity_identifier option;
      [@ocaml.doc
        "Returns the original opportunity identifier passed in the request. This is the unique \
         identifier for the opportunity.\n"]
  reason_code : reason_code option;
      [@ocaml.doc "Indicates the reason for task failure using an enumerated code.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "If the task fails, this field contains a detailed message describing the failure and \
         possible recovery steps.\n"]
  task_status : task_status option; [@ocaml.doc "Indicates the current status of the task.\n"]
  start_time : date_time option;
      [@ocaml.doc
        "The timestamp indicating when the task was initiated. The format follows RFC 3339 section \
         5.6.\n"]
  task_arn : task_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the task, used for tracking and managing the task \
         within AWS.\n"]
  task_id : task_identifier option;
      [@ocaml.doc
        "The unique identifier of the task, used to track the task\226\128\153s progress.\n"]
}
[@@ocaml.doc ""]

type nonrec engagement_invitation_arn_or_identifier = string [@@ocaml.doc ""]

type nonrec start_engagement_by_accepting_invitation_task_request = {
  tags : tag_list option;
      [@ocaml.doc "A map of the key-value pairs of the tag or tags to assign.\n"]
  identifier : engagement_invitation_arn_or_identifier;
      [@ocaml.doc
        "Specifies the unique identifier of the [EngagementInvitation] to be accepted. Providing \
         the correct identifier helps ensure that the correct engagement is processed.\n"]
  client_token : client_token;
      [@ocaml.doc
        "A unique, case-sensitive identifier provided by the client that helps to ensure the \
         idempotency of the request. This can be a random or meaningful string but must be unique \
         for each request.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog related to the task. Use [AWS] for production engagements and \
         [Sandbox] for testing scenarios.\n"]
}
[@@ocaml.doc ""]

type nonrec sort_order = DESCENDING [@ocaml.doc ""] | ASCENDING [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec sort_by = CREATED_DATE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec sort_object = {
  sort_order : sort_order option;
      [@ocaml.doc " Determines the order in which the sorted results are presented. \n"]
  sort_by : sort_by option;
      [@ocaml.doc " Specifies the field by which to sort the resource snapshot jobs. \n"]
}
[@@ocaml.doc
  " Defines the sorting parameters for listing resource snapshot jobs. This structure allows you \
   to specify the field to sort by and the order of sorting. \n"]

type nonrec solution_status =
  | DRAFT [@ocaml.doc ""]
  | INACTIVE [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec solution_sort_name =
  | CREATEDDATE [@ocaml.doc ""]
  | CATEGORY [@ocaml.doc ""]
  | STATUS [@ocaml.doc ""]
  | NAME [@ocaml.doc ""]
  | IDENTIFIER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec solution_sort = {
  sort_by : solution_sort_name;
      [@ocaml.doc
        "Specifies the attribute to sort by, such as [Name], [CreatedDate], or [Status].\n"]
  sort_order : sort_order;
      [@ocaml.doc
        "Specifies the sorting order, either [Ascending] or [Descending]. The default is \
         [Descending].\n"]
}
[@@ocaml.doc
  "Configures the solutions' response sorting that enables partners to order solutions based on \
   specified attributes.\n"]

type nonrec solution_identifier = string [@@ocaml.doc ""]

type nonrec solution_arn = string [@@ocaml.doc ""]

type nonrec aws_marketplace_solution_arn = string [@@ocaml.doc ""]

type nonrec solution_base = {
  aws_marketplace_solution_arn : aws_marketplace_solution_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the AWS Marketplace solution associated with this \
         partner solution.\n"]
  created_date : date_time;
      [@ocaml.doc "Indicates the solution creation date. This is useful to track and audit.\n"]
  category : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "Specifies the solution category, which helps to categorize and organize the solutions \
         partners offer. Valid values: [Software Product] | [Consulting Service] | [Hardware \
         Product] | [Communications Product] | [Professional Service] | [Managed Service] | \
         [Value-Added Resale Amazon Web Services Service] | [Distribution Service] | [Training \
         Service] | [Merger and Acquisition Advising Service].\n"]
  status : solution_status;
      [@ocaml.doc
        "Specifies the solution's current status, which indicates its state in the system. Valid \
         values: [Active] | [Inactive] | [Draft]. The status helps partners and Amazon Web \
         Services track the solution's lifecycle and availability. Filter for [Active] solutions \
         for association to an opportunity.\n"]
  name : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "Specifies the solution name.\n"]
  arn : solution_arn option;
      [@ocaml.doc " The SolutionBase structure provides essential information about a solution. \n"]
  id : solution_identifier;
      [@ocaml.doc "Enables the association of solutions (offerings) to opportunities.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog in which the solution is hosted, either [AWS] or [Sandbox]. This \
         helps partners differentiate between live solutions and those in testing environments.\n"]
}
[@@ocaml.doc
  "Specifies minimal information for the solution offered to solve the customer's business problem.\n"]

type nonrec solution_list = solution_base list [@@ocaml.doc ""]

type nonrec solution_identifiers = solution_identifier list [@@ocaml.doc ""]

type nonrec solution = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec sender_contact_email = string [@@ocaml.doc ""]

type nonrec sender_contact = {
  phone : phone_number option;
      [@ocaml.doc
        "The sender-provided contact's phone number associated with the [EngagementInvitation].\n"]
  business_title : job_title option;
      [@ocaml.doc
        "The sender-provided contact's title (job title or role) associated with the \
         [EngagementInvitation].\n"]
  last_name : name option;
      [@ocaml.doc
        "The sender-provided contact's first name associated with the [EngagementInvitation].\n"]
  first_name : name option;
      [@ocaml.doc
        "The sender-provided contact's last name associated with the [EngagementInvitation].\n"]
  email : sender_contact_email;
      [@ocaml.doc
        "The sender-provided contact's email address associated with the [EngagementInvitation].\n"]
}
[@@ocaml.doc
  "An object that contains the details of the sender-provided contact person for the \
   [EngagementInvitation].\n"]

type nonrec sender_contact_list = sender_contact list [@@ocaml.doc ""]

type nonrec resource_type = OPPORTUNITY [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec resource_template_name = string [@@ocaml.doc ""]

type nonrec resource_snapshot_arn = string [@@ocaml.doc ""]

type nonrec resource_snapshot_revision = int [@@ocaml.doc ""]

type nonrec resource_identifier = string [@@ocaml.doc ""]

type nonrec resource_snapshot_summary = {
  created_by : aws_account option;
      [@ocaml.doc
        "The AWS account ID of the entity that owns the resource from which the snapshot was \
         created.\n"]
  resource_snapshot_template_name : resource_template_name option;
      [@ocaml.doc "The name of the template used to create the snapshot.\n"]
  resource_id : resource_identifier option;
      [@ocaml.doc
        "The identifier of the specific resource snapshotted. The format might vary depending on \
         the ResourceType. \n"]
  resource_type : resource_type option; [@ocaml.doc "The type of resource snapshotted.\n"]
  revision : resource_snapshot_revision option;
      [@ocaml.doc
        "The revision number of the snapshot. This integer value is incremented each time the \
         snapshot is updated, allowing for version tracking of the resource snapshot. \n"]
  arn : resource_snapshot_arn option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the snapshot. This globally unique identifier can be \
         used for cross-service references and in IAM policies. \n"]
}
[@@ocaml.doc
  " Provides a concise summary of a resource snapshot, including its unique identifier and version \
   information. This structure is used to quickly reference and identify specific versions of \
   resource snapshots. \n"]

type nonrec resource_snapshot_summary_list = resource_snapshot_summary list [@@ocaml.doc ""]

type nonrec life_cycle_for_view = {
  next_steps : pii_string option;
      [@ocaml.doc " Describes the next steps for the opportunity shared through a snapshot. \n"]
  stage : stage option;
      [@ocaml.doc " Defines the current stage of the opportunity shared through a snapshot. \n"]
  review_status : review_status option;
      [@ocaml.doc " Defines the approval status of the opportunity shared through a snapshot. \n"]
  target_close_date : date option;
      [@ocaml.doc " The projected launch date of the opportunity shared through a snapshot. \n"]
}
[@@ocaml.doc
  " Provides the lifecycle view of an opportunity resource shared through a snapshot. \n"]

type nonrec partner_opportunity_team_members_list = contact list [@@ocaml.doc ""]

type nonrec project_view = {
  other_solution_description : pii_string option;
      [@ocaml.doc
        " Offers a description of other solutions if the standard solutions do not adequately \
         cover the project's scope. \n"]
  sales_activities : sales_activities option;
      [@ocaml.doc
        " Lists the pre-sales activities that have occurred with the end-customer related to the \
         opportunity. This field is conditionally mandatory when the project is qualified for \
         Co-Sell and helps drive assignment priority on the AWS side. It provides insight into the \
         engagement level with the customer. \n"]
  customer_use_case : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " Specifies the proposed solution focus or type of workload for the project. \n"]
  expected_contract_duration : expected_contract_duration option;
      [@ocaml.doc
        "Optional. The expected contract duration for this opportunity, representing the \
         anticipated length of the contract in the unit specified by [Term].\n"]
  expected_customer_spend : expected_customer_spend_list option;
      [@ocaml.doc
        " Provides information about the anticipated customer spend related to this project. This \
         may include details such as amount, frequency, and currency of expected expenditure. \n"]
  delivery_models : delivery_models option;
      [@ocaml.doc
        " Describes the deployment or consumption model for the partner solution or offering. This \
         field indicates how the project's solution will be delivered or implemented for the \
         customer. \n"]
}
[@@ocaml.doc " Provides the project view of an opportunity resource shared through a snapshot. \n"]

type nonrec aws_marketplace_offer_identifier = string [@@ocaml.doc ""]

type nonrec aws_marketplace_offer_identifiers = aws_marketplace_offer_identifier list
[@@ocaml.doc ""]

type nonrec aws_marketplace_offer_set_identifier = string [@@ocaml.doc ""]

type nonrec aws_marketplace_offer_set_identifiers = aws_marketplace_offer_set_identifier list
[@@ocaml.doc ""]

type nonrec aws_product_identifier = string [@@ocaml.doc ""]

type nonrec aws_product_identifiers = aws_product_identifier list [@@ocaml.doc ""]

type nonrec aws_marketplace_solution_identifier = string [@@ocaml.doc ""]

type nonrec aws_marketplace_solution_identifiers = aws_marketplace_solution_identifier list
[@@ocaml.doc ""]

type nonrec aws_marketplace_product_arn = string [@@ocaml.doc ""]

type nonrec aws_marketplace_product_identifiers = aws_marketplace_product_arn list [@@ocaml.doc ""]

type nonrec related_entity_identifiers = {
  aws_marketplace_products : aws_marketplace_product_identifiers option;
      [@ocaml.doc
        "Specifies the AWS Marketplace products to associate with the [Opportunity]. Each value is \
         an Amazon Resource Name (ARN) that identifies a product listing in AWS Marketplace.\n"]
  aws_marketplace_solutions : aws_marketplace_solution_identifiers option;
      [@ocaml.doc
        "Specifies the AWS Marketplace solutions to associate with the [Opportunity]. Each value \
         is an Amazon Resource Name (ARN) that identifies a solution listing in AWS Marketplace.\n"]
  aws_products : aws_product_identifiers option;
      [@ocaml.doc
        "Enables the association of specific Amazon Web Services products with the [Opportunity]. \
         Partners can indicate the relevant Amazon Web Services products for the [Opportunity]'s \
         solution and align with the customer's needs. Returns multiple values separated by \
         commas. For example, [\"AWSProducts\" : \\[\"AmazonRedshift\", \"AWSAppFabric\", \
         \"AWSCleanRooms\"\\]].\n\n\
        \ Use the file with the list of Amazon Web Services products hosted on GitHub: \
         {{:https://github.com/aws-samples/partner-crm-integration-samples/blob/main/resources/aws_products.json} \
         Amazon Web Services products}.\n\
        \ "]
  solutions : solution_identifiers option;
      [@ocaml.doc
        "Enables partner solutions or offerings' association with an opportunity. To associate a \
         solution, provide the solution's unique identifier, which you can obtain with the \
         [ListSolutions] operation.\n\n\
        \ If the specific solution identifier is not available, you can use the value [Other] and \
         provide details about the solution in the [otherSolutionOffered] field. But when the \
         opportunity reaches the [Committed] stage or beyond, the [Other] value cannot be used, \
         and a valid solution identifier must be provided.\n\
        \ \n\
        \  By associating the relevant solutions with the opportunity, you can communicate the \
         offerings that are being considered or implemented to address the customer's business \
         problem.\n\
        \  "]
  aws_marketplace_offer_sets : aws_marketplace_offer_set_identifiers option;
      [@ocaml.doc
        "Enables the association of AWS Marketplace offer sets with the [Opportunity]. Offer sets \
         allow grouping multiple related marketplace offers together for comprehensive solution \
         packaging. Each value is an Amazon Resource Name (ARN) in this format: \
         [arn:aws:aws-marketplace:us-east-1:999999999999:AWSMarketplace/OfferSet/offerset-sampleOfferSet32].\n"]
  aws_marketplace_offers : aws_marketplace_offer_identifiers option;
      [@ocaml.doc
        "Takes one value per opportunity. Each value is an Amazon Resource Name (ARN), in this \
         format: [\"offers\": \
         \\[\"arn:aws:aws-marketplace:us-east-1:999999999999:AWSMarketplace/Offer/offer-sampleOffer32\"\\]].\n\n\
        \ Use the \
         {{:https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/API_ListEntities.html}ListEntities} \
         action in the Marketplace Catalog APIs for a list of offers in the associated Marketplace \
         seller account.\n\
        \ "]
}
[@@ocaml.doc
  "This field provides the associations' information for other entities with the opportunity. \
   These entities include identifiers for [AWSProducts], [Partner Solutions], and \
   [AWSMarketplaceOffers].\n"]

type nonrec opportunity_summary_view = {
  related_entity_identifiers : related_entity_identifiers option; [@ocaml.doc ""]
  project : project_view option;
      [@ocaml.doc
        " Contains summary information about the project associated with the opportunity, \
         including project name, description, timeline, and other relevant details. \n"]
  customer : customer option; [@ocaml.doc ""]
  primary_needs_from_aws : primary_needs_from_aws option;
      [@ocaml.doc " Identifies the type of support the partner needs from AWS. \n"]
  opportunity_team : partner_opportunity_team_members_list option;
      [@ocaml.doc
        " Represents the internal team handling the opportunity. Specify the members involved in \
         collaborating on an opportunity within the partner's organization. \n"]
  lifecycle : life_cycle_for_view option;
      [@ocaml.doc
        " Contains information about the opportunity's lifecycle, including its current stage, \
         status, and important dates such as creation and last modification times. \n"]
  opportunity_type : opportunity_type option; [@ocaml.doc " Specifies the opportunity type. \n"]
}
[@@ocaml.doc
  " Provides a comprehensive view of an opportunity summary, including lifecycle information, team \
   details, opportunity type, primary needs from AWS, and associated project information. \n"]

type nonrec opportunity_origin = PARTNER_REFERRAL [@ocaml.doc ""] | AWS_REFERRAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec aws_closed_lost_reason =
  | TERM_SHEET_IMPASSE [@ocaml.doc ""]
  | TECHNICAL_LIMITATIONS [@ocaml.doc ""]
  | SELF_SERVICE [@ocaml.doc ""]
  | SECURITY_COMPLIANCE [@ocaml.doc ""]
  | PRODUCT_NOT_ON_AWS [@ocaml.doc ""]
  | PRODUCT_TECHNOLOGY [@ocaml.doc ""]
  | PRICE [@ocaml.doc ""]
  | PREFERENCE_FOR_COMPETITOR [@ocaml.doc ""]
  | PLATFORM_TECHNOLOGY_LIMITATION [@ocaml.doc ""]
  | PEOPLE_RELATIONSHIP_GOVERNANCE [@ocaml.doc ""]
  | PAST_DUE [@ocaml.doc ""]
  | PARTNER_GAP [@ocaml.doc ""]
  | OTHER_DETAILS_IN_DESCRIPTION [@ocaml.doc ""]
  | OTHER [@ocaml.doc ""]
  | ON_PREMISES_DEPLOYMENT [@ocaml.doc ""]
  | NO_UPDATE [@ocaml.doc ""]
  | NOT_COMMITTED_TO_AWS [@ocaml.doc ""]
  | NO_RESPONSE [@ocaml.doc ""]
  | NO_PERCEIVED_VALUE_OF_MP [@ocaml.doc ""]
  | NO_OPPORTUNITY [@ocaml.doc ""]
  | NO_INTEGRATION_RESOURCES [@ocaml.doc ""]
  | NO_CUSTOMER_REFERENCE [@ocaml.doc ""]
  | LOST_TO_COMPETITOR_VMWARE [@ocaml.doc ""]
  | LOST_TO_COMPETITOR_SOFTLAYER [@ocaml.doc ""]
  | LOST_TO_COMPETITOR_RACKSPACE [@ocaml.doc ""]
  | LOST_TO_COMPETITOR_OTHER [@ocaml.doc ""]
  | LOST_TO_COMPETITOR_MICROSOFT [@ocaml.doc ""]
  | LOST_TO_COMPETITOR_GOOGLE [@ocaml.doc ""]
  | LOST_TO_COMPETITOR [@ocaml.doc ""]
  | LEGAL_TERMS_AND_CONDITIONS [@ocaml.doc ""]
  | LEGAL_TAX_REGULATORY [@ocaml.doc ""]
  | INTERNATIONAL_CONSTRAINTS [@ocaml.doc ""]
  | INSUFFICIENT_AWS_VALUE [@ocaml.doc ""]
  | INSUFFICIENT_AMAZON_VALUE [@ocaml.doc ""]
  | FINANCIAL_COMMERCIAL [@ocaml.doc ""]
  | FEATURE_LIMITATION [@ocaml.doc ""]
  | FAILED_VETTING [@ocaml.doc ""]
  | EXECUTIVE_BLOCKER [@ocaml.doc ""]
  | DUPLICATE_OPPORTUNITY [@ocaml.doc ""]
  | DUPLICATE [@ocaml.doc ""]
  | DELAY_CANCELLATION_OF_PROJECT [@ocaml.doc ""]
  | CUSTOMER_EXPERIENCE [@ocaml.doc ""]
  | CUSTOMER_DEFICIENCY [@ocaml.doc ""]
  | CUSTOMER_DATA_REQUIREMENT [@ocaml.doc ""]
  | COMPETITIVE_OFFERING [@ocaml.doc ""]
  | COMPANY_ACQUIRED_DISSOLVED [@ocaml.doc ""]
  | BUSINESS_ASSOCIATE_AGREEMENT [@ocaml.doc ""]
  | ADMINISTRATIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec aws_opportunity_stage =
  | CLOSED_INCOMPLETE [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | CLOSED_LOST [@ocaml.doc ""]
  | DEFERRED_TO_PARTNER [@ocaml.doc ""]
  | LAUNCHED [@ocaml.doc ""]
  | COMMITTED [@ocaml.doc ""]
  | BUSINESS_VALIDATION [@ocaml.doc ""]
  | TECHNICAL_VALIDATION [@ocaml.doc ""]
  | ON_HOLD [@ocaml.doc ""]
  | QUALIFIED [@ocaml.doc ""]
  | BUILDING_INTEGRATION [@ocaml.doc ""]
  | ONBOARDING [@ocaml.doc ""]
  | CONTRACT_NEGOTIATION [@ocaml.doc ""]
  | TERM_SHEET_NEGOTIATION [@ocaml.doc ""]
  | SELLER_REGISTERED [@ocaml.doc ""]
  | EVALUATING [@ocaml.doc ""]
  | SELLER_ENGAGED [@ocaml.doc ""]
  | RESEARCH [@ocaml.doc ""]
  | QUALIFY [@ocaml.doc ""]
  | IDENTIFIED [@ocaml.doc ""]
  | ENGAGED [@ocaml.doc ""]
  | PROSPECT [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | NOT_STARTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec profile_next_steps_history = {
  time : date_time;
      [@ocaml.doc
        "Indicates the date and time when a particular next step was recorded or planned. This \
         helps in managing the timeline for the opportunity.\n"]
  value : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "Represents the details of the next step recorded, such as follow-up actions or decisions \
         made. This field helps in tracking progress and ensuring alignment with project goals.\n"]
}
[@@ocaml.doc
  "Tracks the history of next steps associated with the opportunity. This field captures the \
   actions planned for the future and their timeline.\n"]

type nonrec profile_next_steps_histories = profile_next_steps_history list [@@ocaml.doc ""]

type nonrec aws_opportunity_life_cycle = {
  next_steps_history : profile_next_steps_histories option;
      [@ocaml.doc
        "Provides a historical log of previous next steps that were taken to move the opportunity \
         forward. This helps in tracking the decision-making process and identifying any delays or \
         obstacles encountered.\n"]
  next_steps : pii_string option;
      [@ocaml.doc
        "Specifies the immediate next steps required to progress the opportunity. These steps are \
         based on AWS guidance and the current stage of the opportunity.\n"]
  stage : aws_opportunity_stage option;
      [@ocaml.doc
        "Represents the current stage of the opportunity in its lifecycle, such as \
         [Qualification], [Validation], or [Closed Won]. This helps in understanding the \
         opportunity's progress.\n"]
  closed_lost_reason : aws_closed_lost_reason option;
      [@ocaml.doc
        "Indicates the reason why an opportunity was marked as [Closed Lost]. This helps in \
         understanding the context behind the lost opportunity and aids in refining future \
         strategies.\n"]
  target_close_date : date option;
      [@ocaml.doc
        "Indicates the expected date by which the opportunity is projected to close. This field \
         helps in planning resources and timelines for both the partner and AWS.\n"]
}
[@@ocaml.doc
  "Tracks the lifecycle of the AWS opportunity, including stages such as qualification, \
   validation, and closure. This field helps partners understand the current status and \
   progression of the opportunity.\n"]

type nonrec aws_member_business_title =
  | ISVSM [@ocaml.doc ""]
  | PSM [@ocaml.doc ""]
  | PDM [@ocaml.doc ""]
  | WWPSPDM [@ocaml.doc ""]
  | AWS_ACCOUNT_OWNER [@ocaml.doc ""]
  | AWS_SALES_REP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec aws_team_member = {
  business_title : aws_member_business_title option;
      [@ocaml.doc
        "Specifies the Amazon Web Services team member's business title and indicates their \
         organizational role.\n"]
  last_name : name option;
      [@ocaml.doc "Provides the Amazon Web Services team member's last name.\n"]
  first_name : name option;
      [@ocaml.doc "Provides the Amazon Web Services team member's first name.\n"]
  email : email option;
      [@ocaml.doc "Provides the Amazon Web Services team member's email address.\n"]
}
[@@ocaml.doc
  "Represents an Amazon Web Services team member for the engagement. This structure includes \
   details such as name, email, and business title.\n"]

type nonrec aws_opportunity_team_members_list = aws_team_member list [@@ocaml.doc ""]

type nonrec engagement_score = LOW [@ocaml.doc ""] | MEDIUM [@ocaml.doc ""] | HIGH [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec monetary_amount = string [@@ocaml.doc ""]

type nonrec amount_map = (Smaws_Lib.Smithy_api.Types.string_ * monetary_amount) list
[@@ocaml.doc "Maps spend amounts to AWS programs and modernization pathways.\n"]

type nonrec aws_product_optimization = {
  savings_amount : monetary_amount;
      [@ocaml.doc "Quantified cost savings achievable by implementing this optimization.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Human-readable explanation of the optimization strategy.\n"]
}
[@@ocaml.doc "Specific optimization strategies partners can implement to reduce costs.\n"]

type nonrec aws_product_optimizations_list = aws_product_optimization list [@@ocaml.doc ""]

type nonrec aws_product_details = {
  optimizations : aws_product_optimizations_list;
      [@ocaml.doc "List of specific optimization recommendations for this product.\n"]
  potential_savings_amount : monetary_amount option;
      [@ocaml.doc "Service-specific cost reduction through optimizations.\n"]
  optimized_amount : monetary_amount option;
      [@ocaml.doc "Service cost after applying optimizations.\n"]
  amount : monetary_amount option; [@ocaml.doc "Baseline service cost before optimizations.\n"]
  categories : string_list;
      [@ocaml.doc "List of program and pathway categories this product is eligible for.\n"]
  service_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Pricing Calculator service code.\n"]
  product_code : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "AWS Partner Central product identifier used for opportunity association.\n"]
}
[@@ocaml.doc
  "List of AWS services with program eligibility indicators (MAP, modernization pathways), cost \
   estimates, and optimization recommendations.\n"]

type nonrec aws_products_list = aws_product_details list [@@ocaml.doc ""]

type nonrec aws_product_insights = {
  aws_products : aws_products_list;
      [@ocaml.doc "Product-level details including costs and optimization recommendations.\n"]
  total_amount_by_category : amount_map;
      [@ocaml.doc "Spend amounts mapped to AWS programs and modernization pathways.\n"]
  total_potential_savings_amount : monetary_amount option;
      [@ocaml.doc "Quantified savings achievable through implementing optimizations.\n"]
  total_optimized_amount : monetary_amount option;
      [@ocaml.doc "Total estimated spend after applying recommended optimizations.\n"]
  total_amount : monetary_amount option;
      [@ocaml.doc "Total estimated spend for this source before optimizations.\n"]
  frequency : payment_frequency; [@ocaml.doc "Time period for spend amounts.\n"]
  currency_code : currency_code;
      [@ocaml.doc
        "ISO 4217 currency code. Supported values are [USD] and [EUR]. Returns [EUR] when the \
         opportunity is in the [aws-eusc] (AWS European Sovereign Cloud) partition.\n"]
}
[@@ocaml.doc
  "Comprehensive spend analysis for a single source (AWS or Partner) including total amounts, \
   optimization savings, program category breakdowns, and detailed product-level insights.\n"]

type nonrec aws_products_spend_insights_by_source = {
  aw_s : aws_product_insights option;
      [@ocaml.doc "AI-generated insights including recommended products from AWS.\n"]
  partner : aws_product_insights option;
      [@ocaml.doc "Partner-sourced insights derived from Pricing Calculator URLs.\n"]
}
[@@ocaml.doc
  "Source-separated spend insights that provide independent analysis for AWS recommendations and \
   partner estimates.\n"]

type nonrec opportunity_quality = {
  trend : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Direction of score change since last scoring iteration. Known values: [Improving], \
         [Declining], [No Change].\n"]
  score : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Deal quality score based on opportunity content completeness and sales methodology \
         criteria. Values range from 0 to 100.\n"]
}
[@@ocaml.doc "Opportunity quality score and trend.\n"]

type nonrec recommendation_attribute_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.string_) list
[@@ocaml.doc ""]

type nonrec recommendation = {
  attributes : recommendation_attribute_map option;
      [@ocaml.doc "Source-specific metadata as key-value pairs.\n"]
  details : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Human-readable recommendation text from this source.\n"]
  type_ : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The recommendation source type. Known values: [OpportunityQuality], \
         [SolutionRecommendation], [SpecialistRecommendation].\n"]
}
[@@ocaml.doc "A recommendation from an agent-driven source.\n"]

type nonrec recommendation_list = recommendation list [@@ocaml.doc ""]

type nonrec aws_opportunity_insights = {
  recommendations : recommendation_list option;
      [@ocaml.doc "List of recommendations from various agent-driven sources.\n"]
  opportunity_quality : opportunity_quality option;
      [@ocaml.doc "Opportunity quality assessment. Null if not yet scored.\n"]
  aws_products_spend_insights_by_source : aws_products_spend_insights_by_source option;
      [@ocaml.doc
        "Source-separated spend insights that provide independent analysis for AWS recommendations \
         and partner estimates.\n"]
  engagement_score : engagement_score option;
      [@ocaml.doc
        "Represents a score assigned by AWS to indicate the level of engagement and potential \
         success for the opportunity. This score helps partners prioritize their efforts.\n"]
  next_best_actions : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Provides recommendations from AWS on the next best actions to take in order to move the \
         opportunity forward and increase the likelihood of success.\n"]
}
[@@ocaml.doc
  "Contains insights provided by AWS for the opportunity, offering recommendations and analysis \
   that can help the partner optimize their engagement and strategy.\n"]

type nonrec involvement_type_change_reason =
  | RISK_MITIGATION [@ocaml.doc ""]
  | TECHNICAL_COMPLEXITY [@ocaml.doc ""]
  | CUSTOMER_REQUESTED [@ocaml.doc ""]
  | CHANGE_IN_DEAL_INFORMATION [@ocaml.doc ""]
  | EXPANSION_OPPORTUNITY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec aws_opportunity_related_entities = {
  aws_marketplace_products : aws_marketplace_product_identifiers option;
      [@ocaml.doc "The AWS Marketplace product ARNs associated with this opportunity.\n"]
  aws_marketplace_solutions : aws_marketplace_solution_identifiers option;
      [@ocaml.doc "The AWS Marketplace solution ARNs associated with this opportunity.\n"]
  solutions : solution_identifiers option;
      [@ocaml.doc
        "Specifies the partner solutions related to the opportunity. These solutions represent the \
         partner's offerings that are being positioned as part of the overall AWS opportunity.\n"]
  aws_products : aws_product_identifiers option;
      [@ocaml.doc
        "Specifies the AWS products associated with the opportunity. This field helps track the \
         specific products that are part of the proposed solution.\n"]
}
[@@ocaml.doc
  "Represents other entities related to the AWS opportunity, such as AWS products, partner \
   solutions, and marketplace offers. These associations help build a complete picture of the \
   solution being sold.\n"]

type nonrec aws_opportunity_customer = {
  contacts : customer_contacts_list option;
      [@ocaml.doc
        "Provides a list of customer contacts involved in the opportunity. These contacts may \
         include decision makers, influencers, and other stakeholders within the customer's \
         organization.\n"]
}
[@@ocaml.doc
  "Represents the customer associated with the AWS opportunity. This field captures key details \
   about the customer that are necessary for managing the opportunity.\n"]

type nonrec aws_opportunity_project = {
  aws_partition : aws_partition option;
      [@ocaml.doc
        "AWS partition where the opportunity will be deployed. Possible values: [aws-eusc] for AWS \
         European Sovereign Cloud, [null] for all other partitions.\n"]
  expected_customer_spend : expected_customer_spend_list option;
      [@ocaml.doc
        "Indicates the expected spending by the customer over the course of the project. This \
         value helps partners and AWS estimate the financial impact of the opportunity. Use the \
         {{:https://calculator.aws/#/}AWS Pricing Calculator} to create an estimate of the \
         customer\226\128\153s total spend. If only annual recurring revenue (ARR) is available, \
         distribute it across 12 months to provide an average monthly value.\n"]
}
[@@ocaml.doc
  "Captures details about the project associated with the opportunity, including objectives, \
   scope, and customer requirements.\n"]

type nonrec aws_opportunity_summary_full_view = {
  cosell_motion : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Engagement classification for this opportunity. Read-only. Null before scoring. Known \
         values: [AWS Field-engaged], [Agent-engaged], [Partner-led].\n"]
  project : aws_opportunity_project option; [@ocaml.doc ""]
  customer : aws_opportunity_customer option; [@ocaml.doc ""]
  related_entity_ids : aws_opportunity_related_entities option; [@ocaml.doc ""]
  involvement_type_change_reason : involvement_type_change_reason option;
      [@ocaml.doc "Reason for changes in AWS involvement type for the opportunity.\n"]
  insights : aws_opportunity_insights option; [@ocaml.doc ""]
  opportunity_team : aws_opportunity_team_members_list option;
      [@ocaml.doc "AWS team members involved in the opportunity.\n"]
  life_cycle : aws_opportunity_life_cycle option; [@ocaml.doc ""]
  visibility : visibility option; [@ocaml.doc "Visibility level for the AWS opportunity.\n"]
  involvement_type : sales_involvement_type option;
      [@ocaml.doc "Type of AWS involvement in the opportunity.\n"]
  origin : opportunity_origin option; [@ocaml.doc "Source origin of the AWS opportunity.\n"]
  related_opportunity_id : opportunity_identifier option;
      [@ocaml.doc "Identifier of the related partner opportunity.\n"]
}
[@@ocaml.doc "Provides a comprehensive view of AwsOpportunitySummaryFullView template.\n"]

type nonrec resource_snapshot_payload =
  | AwsOpportunitySummaryFullView of aws_opportunity_summary_full_view
      [@ocaml.doc "Provides a comprehensive view of AwsOpportunitySummaryFullView template.\n"]
  | OpportunitySummary of opportunity_summary_view
      [@ocaml.doc " An object that contains an [opportunity]'s subset of fields. \n"]
[@@ocaml.doc
  " Represents the payload of a resource snapshot. This structure is designed to accommodate \
   different types of resource snapshots, currently supporting opportunity summaries. \n"]

type nonrec resource_snapshot_job_arn = string [@@ocaml.doc ""]

type nonrec resource_snapshot_job_status = STOPPED [@ocaml.doc ""] | RUNNING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_snapshot_job_summary = {
  status : resource_snapshot_job_status option;
      [@ocaml.doc
        "The current status of the snapshot job.\n\n\
        \ Valid values:\n\
        \ \n\
        \  {ul\n\
        \        {-   STOPPED: The job is not currently running. \n\
        \            \n\
        \             }\n\
        \        {-   RUNNING: The job is actively executing. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  engagement_id : engagement_identifier option;
      [@ocaml.doc "The unique identifier of the Engagement.\n"]
  arn : resource_snapshot_job_arn option;
      [@ocaml.doc " The Amazon Resource Name (ARN) for the resource snapshot job. \n"]
  id : resource_snapshot_job_identifier option;
      [@ocaml.doc
        " The unique identifier for the resource snapshot job within the AWS Partner Central \
         system. This ID is used for direct references to the job within the service. \n"]
}
[@@ocaml.doc " An object that contains a [Resource Snapshot Job]'s subset of fields. \n"]

type nonrec resource_snapshot_job_summary_list = resource_snapshot_job_summary list [@@ocaml.doc ""]

type nonrec resource_snapshot_job_role_identifier = string [@@ocaml.doc ""]

type nonrec resource_snapshot_job_role_arn = string [@@ocaml.doc ""]

type nonrec resource_snapshot_job = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec resource_snapshot = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec related_entity_type =
  | AWS_MARKETPLACE_PRODUCTS [@ocaml.doc ""]
  | AWS_MARKETPLACE_SOLUTIONS [@ocaml.doc ""]
  | AWS_MARKETPLACE_OFFER_SETS [@ocaml.doc ""]
  | AWS_MARKETPLACE_OFFERS [@ocaml.doc ""]
  | AWS_PRODUCTS [@ocaml.doc ""]
  | SOLUTIONS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rejection_reason_string = string [@@ocaml.doc ""]

type nonrec reject_engagement_invitation_request = {
  rejection_reason : rejection_reason_string option;
      [@ocaml.doc
        "This describes the reason for rejecting the engagement invitation, which helps AWS track \
         usage patterns. Acceptable values include the following:\n\n\
        \ {ul\n\
        \       {-   {i Customer problem unclear:} The customer's problem isn't understood.\n\
        \           \n\
        \            }\n\
        \       {-   {i Next steps unclear:} The next steps required to proceed aren't understood.\n\
        \           \n\
        \            }\n\
        \       {-   {i Unable to support:} The partner is unable to provide support due to \
         resource or capability constraints.\n\
        \           \n\
        \            }\n\
        \       {-   {i Duplicate of partner referral:} The opportunity is a duplicate of an \
         existing referral.\n\
        \           \n\
        \            }\n\
        \       {-   {i Other:} Any reason not covered by other values.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  identifier : engagement_invitation_arn_or_identifier;
      [@ocaml.doc
        "This is the unique identifier of the rejected [EngagementInvitation]. Providing the \
         correct identifier helps to ensure that the intended invitation is rejected.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "This is the catalog that's associated with the engagement invitation. Acceptable values \
         are [AWS] or [Sandbox], and these values determine the environment in which the \
         opportunity is managed.\n"]
}
[@@ocaml.doc ""]

type nonrec receiver_responsibility =
  | FACILITATOR [@ocaml.doc ""]
  | CO_SELL_FACILITATOR [@ocaml.doc ""]
  | TRAINING_PARTNER [@ocaml.doc ""]
  | SERVICES_PARTNER [@ocaml.doc ""]
  | SOFTWARE_PARTNER [@ocaml.doc ""]
  | MANAGED_SERVICE_PROVIDER [@ocaml.doc ""]
  | HARDWARE_PARTNER [@ocaml.doc ""]
  | RESELLER [@ocaml.doc ""]
  | DISTRIBUTOR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec receiver_responsibility_list = receiver_responsibility list [@@ocaml.doc ""]

type nonrec alias = string [@@ocaml.doc ""]

type nonrec account_receiver = {
  aws_account_id : aws_account;
      [@ocaml.doc
        "Indicates the AWS account ID of the partner who received the Engagement Invitation. This \
         is a unique identifier for managing engagements with specific AWS accounts.\n"]
  alias : alias option;
      [@ocaml.doc
        "Represents the alias of the partner account receiving the Engagement Invitation, making \
         it easier to identify and track the recipient in reports or logs.\n"]
}
[@@ocaml.doc
  "Contains the account details of the partner who received the Engagement Invitation, including \
   the AWS account ID and company name.\n"]

type nonrec receiver =
  | Account of account_receiver
      [@ocaml.doc
        "Specifies the AWS account of the partner who received the Engagement Invitation. This \
         field is used to track the invitation recipient within the AWS ecosystem.\n"]
[@@ocaml.doc
  "Represents the entity that received the Engagement Invitation, including account and company \
   details. This field is essential for tracking the partner who is being invited to collaborate.\n"]

type nonrec put_selling_system_settings_response = {
  resource_snapshot_job_role_arn : resource_snapshot_job_role_arn option;
      [@ocaml.doc "Specifies the ARN of the IAM Role used for resource snapshot job executions.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog in which the settings are defined. Acceptable values include [AWS] \
         for production and [Sandbox] for testing environments.\n"]
}
[@@ocaml.doc ""]

type nonrec put_selling_system_settings_request = {
  resource_snapshot_job_role_identifier : resource_snapshot_job_role_identifier option;
      [@ocaml.doc "Specifies the ARN of the IAM Role used for resource snapshot job executions.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog in which the settings will be updated. Acceptable values include \
         [AWS] for production and [Sandbox] for testing environments.\n"]
}
[@@ocaml.doc ""]

type nonrec prospecting_task_summary = {
  failed_engagement_count : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc
        "The number of engagements that failed to be converted. Retrieve the full task details \
         using [GetProspectingFromEngagementTask] for per-engagement error information.\n"]
  completed_engagement_count : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc
        "The number of engagements that have been successfully converted into prospecting leads.\n"]
  total_engagement_count : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc "The total number of engagements included in the task.\n"]
  end_time : date_time option;
      [@ocaml.doc
        "The timestamp indicating when the task finished processing. This field is absent if the \
         task is still in progress. The format follows ISO 8601 date-time notation.\n"]
  start_time : date_time;
      [@ocaml.doc
        "The timestamp indicating when the task was initiated. The format follows ISO 8601 \
         date-time notation.\n"]
  task_name : task_name;
      [@ocaml.doc "The descriptive name of the task provided when it was created.\n"]
  task_arn : prospecting_task_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the task.\n"]
  task_id : prospecting_task_identifier;
      [@ocaml.doc
        "The unique identifier of the task. Use this value with [GetProspectingFromEngagementTask] \
         to retrieve full task details.\n"]
}
[@@ocaml.doc
  "A summary of a single prospecting task, returned by [ListProspectingFromEngagementTasks]. \
   Contains key metrics and status information without the full per-engagement detail available \
   from [GetProspectingFromEngagementTask].\n"]

type nonrec prospecting_task_summary_list = prospecting_task_summary list [@@ocaml.doc ""]

type nonrec prospecting_from_engagement_task_sort_name =
  | FailedEngagementCount [@ocaml.doc ""]
  | TaskName [@ocaml.doc ""]
  | StartTime [@ocaml.doc ""]
[@@ocaml.doc
  "The fields available for sorting results from [ListProspectingFromEngagementTasks]. Valid \
   values are [StartTime], [TaskName], and [FailedEngagementCount].\n"]

type nonrec prospecting_from_engagement_task_sort = {
  sort_by : prospecting_from_engagement_task_sort_name;
      [@ocaml.doc
        "The field by which to sort the returned tasks. Valid values: [StartTime] (task creation \
         timestamp), [TaskName] (alphabetically by task name), and [FailedEngagementCount] (number \
         of failed engagements).\n"]
  sort_order : sort_order;
      [@ocaml.doc
        "The direction in which to sort the results. Use [ASCENDING] to return the smallest or \
         earliest values first, or [DESCENDING] to return the largest or most recent values first.\n"]
}
[@@ocaml.doc
  "Specifies the sort configuration for [ListProspectingFromEngagementTasks]. Contains the field \
   to sort by and the sort direction.\n"]

type nonrec prospecting_from_engagement_task = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec project_summary = {
  expected_contract_duration : expected_contract_duration option;
      [@ocaml.doc
        "Optional. The expected contract duration for this opportunity, representing the \
         anticipated length of the contract in the unit specified by [Term].\n"]
  expected_customer_spend : expected_customer_spend_list option;
      [@ocaml.doc
        "Provides a summary of the expected customer spend for the project, offering a high-level \
         view of the potential financial impact.\n"]
  delivery_models : delivery_models option;
      [@ocaml.doc
        "Specifies your solution or service's deployment or consumption model in the \
         [Opportunity]'s context. You can select multiple options.\n\n\
        \ Options' descriptions from the [Delivery Model] field are:\n\
        \ \n\
        \  {ul\n\
        \        {-  SaaS or PaaS: Your Amazon Web Services based solution deployed as SaaS or \
         PaaS in your Amazon Web Services environment.\n\
        \            \n\
        \             }\n\
        \        {-  BYOL or AMI: Your Amazon Web Services based solution deployed as BYOL or AMI \
         in the end customer's Amazon Web Services environment.\n\
        \            \n\
        \             }\n\
        \        {-  Managed Services: The end customer's Amazon Web Services business management \
         (For example: Consulting, design, implementation, billing support, cost optimization, \
         technical support).\n\
        \            \n\
        \             }\n\
        \        {-  Professional Services: Offerings to help enterprise end customers achieve \
         specific business outcomes for enterprise cloud adoption (For example: Advisory or \
         transformation planning).\n\
        \            \n\
        \             }\n\
        \        {-  Resell: Amazon Web Services accounts and billing management for your customers.\n\
        \            \n\
        \             }\n\
        \        {-  Other: Delivery model not described above.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc "An object that contains a [Project] object's subset of fields.\n"]

type nonrec project_details = {
  expected_customer_spend : expected_customer_spend_list;
      [@ocaml.doc
        "Contains revenue estimates for the partner related to the project. This field provides an \
         idea of the financial potential of the opportunity for the partner.\n"]
  target_completion_date : date;
      [@ocaml.doc
        "Specifies the estimated date of project completion. This field helps track the project \
         timeline and manage expectations.\n"]
  title : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "Specifies the title of the project. This title helps partners quickly identify and \
         understand the focus of the project.\n"]
  business_problem : engagement_customer_business_problem;
      [@ocaml.doc
        "Describes the business problem that the project aims to solve. This information is \
         crucial for understanding the project\226\128\153s goals and objectives.\n"]
}
[@@ocaml.doc
  "Contains details about the project associated with the Engagement Invitation, including the \
   business problem and expected outcomes.\n"]

type nonrec opportunity_invitation_payload = {
  project : project_details;
      [@ocaml.doc
        "Describes the project details associated with the opportunity, including the \
         customer\226\128\153s needs and the scope of work expected to be performed.\n"]
  customer : engagement_customer;
      [@ocaml.doc
        "Contains information about the customer related to the opportunity in the Engagement \
         Invitation. This data helps partners understand the customer\226\128\153s profile and \
         requirements.\n"]
  receiver_responsibilities : receiver_responsibility_list;
      [@ocaml.doc
        "Outlines the responsibilities or expectations of the receiver in the context of the \
         invitation.\n"]
  sender_contacts : sender_contact_list option;
      [@ocaml.doc
        "Represents the contact details of the AWS representatives involved in sending the \
         Engagement Invitation. These contacts are opportunity stakeholders.\n"]
}
[@@ocaml.doc
  "Represents the data payload of an Engagement Invitation for a specific opportunity. This \
   contains detailed information that partners use to evaluate the engagement.\n"]

type nonrec lead_invitation_customer = {
  market_segment : market_segment option;
      [@ocaml.doc
        "Specifies the market segment classification of the customer, such as enterprise, \
         mid-market, or small business. This segmentation helps partners determine the appropriate \
         solution complexity and engagement strategy.\n"]
  aws_maturity : aws_maturity option;
      [@ocaml.doc
        "Indicates the customer's level of experience and adoption with AWS services. This \
         assessment helps partners understand the customer's cloud maturity and tailor their \
         engagement approach accordingly.\n"]
  country_code : country_code;
      [@ocaml.doc
        "The country code indicating the geographic location of the customer company. This \
         information helps partners understand regional requirements and assess their ability to \
         serve the customer effectively.\n"]
  website_url : company_website_url option;
      [@ocaml.doc
        "The website URL of the customer company. This provides additional context about the \
         customer organization and helps partners verify company details and assess business size \
         and legitimacy.\n"]
  company_name : company_name;
      [@ocaml.doc
        "The name of the customer company associated with the lead invitation. This field \
         identifies the target organization for the lead engagement opportunity.\n"]
  industry : industry option;
      [@ocaml.doc
        "Specifies the industry sector of the customer company associated with the lead \
         invitation. This categorization helps partners understand the customer's business context \
         and assess solution fit.\n"]
}
[@@ocaml.doc
  "Contains customer information included in a lead invitation payload. This structure provides \
   essential details about the customer to help partners evaluate the lead opportunity and \
   determine their interest in engagement.\n"]

type nonrec lead_invitation_interaction = {
  contact_business_title : job_title;
      [@ocaml.doc
        "The business title or job role of the customer contact involved in the lead interaction. \
         This helps partners identify the decision-making level and engagement approach for the \
         lead.\n"]
  usecase : engagement_use_case option;
      [@ocaml.doc
        "Describes the specific use case or business scenario associated with the lead \
         interaction. This information helps partners understand the customer's interests and \
         potential solution requirements.\n"]
  source_name : lead_source_name;
      [@ocaml.doc
        "The descriptive name of the source that generated the lead interaction. This \
         human-readable identifier helps partners understand the specific lead generation channel \
         or campaign that created the opportunity.\n"]
  source_id : lead_source_id;
      [@ocaml.doc
        "The unique identifier of the specific source that generated the lead interaction. This \
         provides traceability to the original lead generation activity for reference and \
         follow-up purposes.\n"]
  source_type : lead_source_type;
      [@ocaml.doc
        "Specifies the type of source that generated the lead interaction, such as \"Event\", \
         \"Website\", or \"Campaign\". This helps partners understand the lead generation channel \
         and assess lead quality based on the source type.\n"]
}
[@@ocaml.doc
  "Represents interaction details included in a lead invitation payload. This structure provides \
   context about how the lead was generated and the customer's engagement history to help partners \
   assess the opportunity quality.\n"]

type nonrec lead_invitation_payload = {
  interaction : lead_invitation_interaction;
      [@ocaml.doc
        "Describes the interaction details associated with the lead, including the source of the \
         lead generation and customer engagement information. This context helps partners evaluate \
         the lead quality and engagement approach.\n"]
  customer : lead_invitation_customer;
      [@ocaml.doc
        "Contains information about the customer associated with the lead invitation. This data \
         helps partners understand the customer's profile, industry, and business context to \
         assess the lead opportunity.\n"]
}
[@@ocaml.doc
  "Represents the data payload of an engagement invitation for a lead opportunity. This contains \
   detailed information about the customer and interaction history that partners use to evaluate \
   whether to accept the lead engagement invitation.\n"]

type nonrec payload =
  | LeadInvitation of lead_invitation_payload
      [@ocaml.doc
        "Specifies the details of the lead invitation within the Engagement Invitation payload. \
         This data helps partners understand the lead context, customer information, and \
         interaction history for the lead opportunity from AWS.\n"]
  | OpportunityInvitation of opportunity_invitation_payload
      [@ocaml.doc
        "Specifies the details of the opportunity invitation within the Engagement Invitation \
         payload. This data helps partners understand the context, scope, and expected involvement \
         for the opportunity from AWS.\n"]
[@@ocaml.doc
  "Contains the data payload associated with the Engagement Invitation. This payload includes \
   essential details related to the AWS opportunity and is used by partners to evaluate whether to \
   accept or reject the engagement.\n"]

type nonrec participant_type = RECEIVER [@ocaml.doc ""] | SENDER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec page_size = int [@@ocaml.doc ""]

type nonrec opportunity_arn = string [@@ocaml.doc ""]

type nonrec life_cycle_summary = {
  review_status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Indicates the reason a specific decision was taken during the opportunity review process. \
         This field combines the reasons for both disqualified and action required statuses, and \
         provides clarity for why an opportunity was disqualified or required further action.\n"]
  review_comments : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Indicates why an opportunity was sent back for further details. Partners must take \
         corrective action based on the [ReviewComments].\n"]
  review_status : review_status option;
      [@ocaml.doc
        "Indicates the review status of a partner referred opportunity. This field is read-only \
         and only applicable for partner referrals. Valid values:\n\n\
        \ {ul\n\
        \       {-  Pending Submission: Not submitted for validation (editable).\n\
        \           \n\
        \            }\n\
        \       {-  Submitted: Submitted for validation and not yet Amazon Web Services reviewed \
         (read-only).\n\
        \           \n\
        \            }\n\
        \       {-  In Review: Undergoing Amazon Web Services validation (read-only).\n\
        \           \n\
        \            }\n\
        \       {-  Action Required: Address any issues Amazon Web Services highlights. Use the \
         [UpdateOpportunity] API action to update the opportunity, and ensure you make all \
         required changes. Only these fields are editable when the [Lifecycle.ReviewStatus] is \
         [Action Required]:\n\
        \           \n\
        \            {ul\n\
        \                  {-  Customer.Account.Address.City\n\
        \                      \n\
        \                       }\n\
        \                  {-  Customer.Account.Address.CountryCode\n\
        \                      \n\
        \                       }\n\
        \                  {-  Customer.Account.Address.PostalCode\n\
        \                      \n\
        \                       }\n\
        \                  {-  Customer.Account.Address.StateOrRegion\n\
        \                      \n\
        \                       }\n\
        \                  {-  Customer.Account.Address.StreetAddress\n\
        \                      \n\
        \                       }\n\
        \                  {-  Customer.Account.WebsiteUrl\n\
        \                      \n\
        \                       }\n\
        \                  {-  LifeCycle.TargetCloseDate\n\
        \                      \n\
        \                       }\n\
        \                  {-  Project.ExpectedCustomerSpend.Amount\n\
        \                      \n\
        \                       }\n\
        \                  {-  Project.ExpectedCustomerSpend.CurrencyCode\n\
        \                      \n\
        \                       }\n\
        \                  {-  Project.CustomerBusinessProblem\n\
        \                      \n\
        \                       }\n\
        \                  {-  PartnerOpportunityIdentifier\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         After updates, the opportunity re-enters the validation phase. This process \
         repeats until all issues are resolved, and the opportunity's [Lifecycle.ReviewStatus] is \
         set to [Approved] or [Rejected].\n\
        \         \n\
        \          }\n\
        \       {-  Approved: Validated and converted into the Amazon Web Services seller's \
         pipeline (editable).\n\
        \           \n\
        \            }\n\
        \       {-  Rejected: Disqualified (read-only).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  target_close_date : date option;
      [@ocaml.doc
        "Specifies the date when Amazon Web Services expects to start significant billing, when \
         the project finishes, and when it moves into production. This field informs the Amazon \
         Web Services seller about when the opportunity launches and starts to incur Amazon Web \
         Services usage.\n\n\
        \ Ensure the [Target Close Date] isn't in the past.\n\
        \ "]
  next_steps : pii_string option;
      [@ocaml.doc
        "Specifies the upcoming actions or tasks for the [Opportunity]. This field is utilized to \
         communicate to Amazon Web Services the next actions required for the [Opportunity].\n"]
  closed_lost_reason : closed_lost_reason option;
      [@ocaml.doc
        "Specifies the reason code when an opportunity is marked as {i Closed Lost}. When you \
         select an appropriate reason code, you communicate the context for closing the \
         [Opportunity], and aid in accurate reports and analysis of opportunity outcomes.\n"]
  stage : stage option;
      [@ocaml.doc
        "Specifies the current stage of the [Opportunity]'s lifecycle as it maps to Amazon Web \
         Services stages from the current stage in the partner CRM. This field provides a \
         translated value of the stage, and offers insight into the [Opportunity]'s progression in \
         the sales cycle, according to Amazon Web Services definitions.\n\n\
        \  A lead and a prospect must be further matured to a [Qualified] opportunity before \
         submission. Opportunities that were closed/lost before submission aren't suitable for \
         submission.\n\
        \  \n\
        \    The descriptions of each sales stage are:\n\
        \    \n\
        \     {ul\n\
        \           {-  Prospect: Amazon Web Services identifies the opportunity. It can be active \
         (Comes directly from the end customer through a lead) or latent (Your account team \
         believes it exists based on research, account plans, sales plays).\n\
        \               \n\
        \                }\n\
        \           {-  Qualified: Your account team engaged with the customer to discuss \
         viability and understand requirements. The customer agreed that the opportunity is real, \
         of interest, and may solve business/technical needs.\n\
        \               \n\
        \                }\n\
        \           {-  Technical Validation: All parties understand the implementation plan.\n\
        \               \n\
        \                }\n\
        \           {-  Business Validation: Pricing was proposed, and all parties agree to the \
         steps to close.\n\
        \               \n\
        \                }\n\
        \           {-  Committed: The customer signed the contract, but Amazon Web Services \
         hasn't started billing.\n\
        \               \n\
        \                }\n\
        \           {-  Launched: The workload is complete, and Amazon Web Services has started \
         billing.\n\
        \               \n\
        \                }\n\
        \           {-  Closed Lost: The opportunity is lost, and there are no steps to move \
         forward.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \  "]
}
[@@ocaml.doc "An object that contains a [LifeCycle] object's subset of fields.\n"]

type nonrec account_summary = {
  address : address_summary option;
      [@ocaml.doc
        "Specifies the end [Customer]'s address details associated with the [Opportunity].\n"]
  website_url : website_url option;
      [@ocaml.doc
        "Specifies the end customer's company website URL associated with the [Opportunity]. This \
         value is crucial to map the customer within the Amazon Web Services CRM system.\n"]
  company_name : name;
      [@ocaml.doc
        "Specifies the end [Customer]'s company name associated with the [Opportunity].\n"]
  other_industry : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Specifies the end [Customer]'s industry associated with the [ Opportunity], when the \
         selected value in the [Industry] field is [Other]. This field is relevant when the \
         customer's industry doesn't fall under the predefined picklist values and requires a \
         custom description.\n"]
  industry : industry option;
      [@ocaml.doc
        "Specifies which industry the end [Customer] belongs to associated with the [Opportunity]. \
         It refers to the category or sector that the customer's business operates in.\n\n\
        \ To submit a value outside the picklist, use [Other].\n\
        \ \n\
        \  Conditionally mandatory if [Other] is selected for Industry Vertical in LOVs.\n\
        \  "]
}
[@@ocaml.doc "An object that contains an [Account]'s subset of fields.\n"]

type nonrec customer_summary = {
  account : account_summary option;
      [@ocaml.doc "An object that contains a customer's account details.\n"]
}
[@@ocaml.doc "An object that contains a [Customer] object's subset of fields.\n"]

type nonrec opportunity_summary = {
  project : project_summary option;
      [@ocaml.doc "An object that contains the [Opportunity]'s project details summary.\n"]
  customer : customer_summary option;
      [@ocaml.doc "An object that contains the [Opportunity]'s customer details.\n"]
  life_cycle : life_cycle_summary option;
      [@ocaml.doc "An object that contains the [Opportunity]'s lifecycle details.\n"]
  created_date : date_time option;
      [@ocaml.doc " [DateTime] when the [Opportunity] was last created.\n"]
  last_modified_date : date_time option;
      [@ocaml.doc " [DateTime] when the [Opportunity] was last modified.\n"]
  opportunity_type : opportunity_type option;
      [@ocaml.doc
        "Specifies opportunity type as a renewal, new, or expansion.\n\n\
        \ Opportunity types:\n\
        \ \n\
        \  {ul\n\
        \        {-  New Opportunity: Represents a new business opportunity with a potential \
         customer that's not previously engaged with your solutions or services.\n\
        \            \n\
        \             }\n\
        \        {-  Renewal Opportunity: Represents an opportunity to renew an existing contract \
         or subscription with a current customer, ensuring continuity of service.\n\
        \            \n\
        \             }\n\
        \        {-  Expansion Opportunity: Represents an opportunity to expand the scope of an \
         existing contract or subscription, either by adding new services or increasing the volume \
         of existing services for a current customer.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  partner_opportunity_identifier : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Specifies the [Opportunity]'s unique identifier in the partner's CRM system. This value \
         is essential to track and reconcile because it's included in the outbound payload sent \
         back to the partner. It allows partners to link an opportunity to their CRM.\n"]
  arn : opportunity_arn option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) for the opportunity. This globally unique identifier can \
         be used for IAM policies and cross-service references. \n"]
  id : opportunity_identifier option;
      [@ocaml.doc "Read-only, system-generated [Opportunity] unique identifier.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog associated with the opportunity, either [AWS] or [Sandbox]. This \
         indicates the environment in which the opportunity is managed.\n"]
}
[@@ocaml.doc "An object that contains an [Opportunity]'s subset of fields.\n"]

type nonrec opportunity_summaries = opportunity_summary list [@@ocaml.doc ""]

type nonrec opportunity_sort_name =
  | TARGET_CLOSE_DATE [@ocaml.doc ""]
  | CREATED_DATE [@ocaml.doc ""]
  | CUSTOMER_COMPANY_NAME [@ocaml.doc ""]
  | IDENTIFIER [@ocaml.doc ""]
  | LAST_MODIFIEDDATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec opportunity_sort = {
  sort_by : opportunity_sort_name; [@ocaml.doc "Field name to sort by.\n"]
  sort_order : sort_order; [@ocaml.doc "Sort order.\n\n Default: [Descending] \n "]
}
[@@ocaml.doc "Object that configures response sorting.\n"]

type nonrec opportunity_identifiers = opportunity_identifier list [@@ocaml.doc ""]

type nonrec opportunity_from_engagement_task = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec opportunity_engagement_invitation_sort_name = INVITATION_DATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec opportunity_engagement_invitation_sort = {
  sort_by : opportunity_engagement_invitation_sort_name;
      [@ocaml.doc
        "Specifies the field by which the Engagement Invitations are sorted. Common values include \
         [InvitationDate] and [Status].\n"]
  sort_order : sort_order;
      [@ocaml.doc
        "Defines the order in which the Engagement Invitations are sorted. The values can be [ASC] \
         (ascending) or [DESC] (descending).\n"]
}
[@@ocaml.doc
  "Defines sorting options for retrieving Engagement Invitations. Sorting can be done based on \
   various criteria like the invitation date or status.\n"]

type nonrec opportunity = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec member_page_size = int [@@ocaml.doc ""]

type nonrec member_company_name = string [@@ocaml.doc ""]

type nonrec list_tasks_sort_name = START_TIME [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec list_tasks_sort_base = {
  sort_by : list_tasks_sort_name;
      [@ocaml.doc " Specifies the field by which the task list should be sorted. \n"]
  sort_order : sort_order;
      [@ocaml.doc " Determines the order in which the sorted results are presented. \n"]
}
[@@ocaml.doc
  " Defines the sorting parameters for listing tasks. This structure allows for specifying the \
   field to sort by and the order of sorting. \n"]

type nonrec list_tags_for_resource_response = {
  tags : tag_list;
      [@ocaml.doc
        "A map of the key-value pairs for the tag or tags assigned to the specified resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : taggable_resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource for which you want to retrieve tags.\n"]
}
[@@ocaml.doc ""]

type nonrec list_solutions_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A pagination token used to retrieve the next set of results in subsequent calls. This \
         token is included in the response only if there are additional result pages available.\n"]
  solution_summaries : solution_list;
      [@ocaml.doc "An array with minimal details for solutions matching the request criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec filter_status = solution_status list [@@ocaml.doc ""]

type nonrec aws_marketplace_solution_arn_list = aws_marketplace_solution_arn list [@@ocaml.doc ""]

type nonrec list_solutions_request = {
  aws_marketplace_solution_arn : aws_marketplace_solution_arn_list option;
      [@ocaml.doc
        "Filters results by AWS Marketplace solution ARN. You can provide up to 10 ARNs.\n"]
  category : string_list option;
      [@ocaml.doc
        "Filters the solutions based on the category to which they belong. This allows partners to \
         search for solutions within specific categories, such as [Software], [Consulting], or \
         [Managed Services].\n"]
  identifier : solution_identifiers option;
      [@ocaml.doc
        "Filters the solutions based on their unique identifier. Use this filter to retrieve \
         specific solutions by providing the solution's identifier for accurate results.\n"]
  status : filter_status option;
      [@ocaml.doc
        "Filters solutions based on their status. This filter helps partners manage their solution \
         portfolios effectively.\n"]
  sort : solution_sort option;
      [@ocaml.doc
        "Object that configures sorting done on the response. Default [Sort.SortBy] is [Identifier].\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A pagination token used to retrieve the next set of results in subsequent calls. This \
         token is included in the response only if there are additional result pages available.\n"]
  max_results : page_size option;
      [@ocaml.doc
        "The maximum number of results returned by a single call. This value must be provided in \
         the next call to retrieve the next set of results.\n\n\
        \ Default: 20\n\
        \ "]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog associated with the request. This field takes a string value from a \
         predefined list: [AWS] or [Sandbox]. The catalog determines which environment the \
         solutions are listed in. Use [AWS] to list solutions in the Amazon Web Services catalog, \
         and [Sandbox] to list solutions in a secure and isolated testing environment.\n"]
}
[@@ocaml.doc ""]

type nonrec list_resource_snapshots_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        " The token to retrieve the next set of results. If there are no additional results, this \
         value is null. \n"]
  resource_snapshot_summaries : resource_snapshot_summary_list;
      [@ocaml.doc " An array of resource snapshot summary objects. \n"]
}
[@@ocaml.doc ""]

type nonrec list_resource_snapshots_request = {
  created_by : aws_account option;
      [@ocaml.doc
        "Filters the response to include only snapshots of resources owned by the specified AWS \
         account. \n"]
  resource_snapshot_template_identifier : resource_template_name option;
      [@ocaml.doc
        "Filters the response to include only snapshots created using the specified template.\n"]
  resource_identifier : resource_identifier option;
      [@ocaml.doc " Filters the response to include only snapshots of the specified resource. \n"]
  resource_type : resource_type option;
      [@ocaml.doc
        " Filters the response to include only snapshots of the specified resource type. \n"]
  engagement_identifier : engagement_identifier;
      [@ocaml.doc " The unique identifier of the engagement associated with the snapshots. \n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The token for the next set of results. \n"]
  max_results : page_size option;
      [@ocaml.doc " The maximum number of results to return in a single call. \n"]
  catalog : catalog_identifier; [@ocaml.doc " Specifies the catalog related to the request. \n"]
}
[@@ocaml.doc ""]

type nonrec list_resource_snapshot_jobs_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        " The token to retrieve the next set of results. If there are no additional results, this \
         value is null. \n"]
  resource_snapshot_job_summaries : resource_snapshot_job_summary_list;
      [@ocaml.doc " An array of resource snapshot job summary objects. \n"]
}
[@@ocaml.doc ""]

type nonrec list_resource_snapshot_jobs_request = {
  sort : sort_object option;
      [@ocaml.doc
        " Configures the sorting of the response. If omitted, results are sorted by [CreatedDate] \
         in descending order. \n"]
  status : resource_snapshot_job_status option;
      [@ocaml.doc " The status of the jobs to filter the response. \n"]
  engagement_identifier : engagement_identifier option;
      [@ocaml.doc " The identifier of the engagement to filter the response. \n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The token for the next set of results. \n"]
  max_results : page_size option;
      [@ocaml.doc
        " The maximum number of results to return in a single call. If omitted, defaults to 50. \n"]
  catalog : catalog_identifier; [@ocaml.doc " Specifies the catalog related to the request. \n"]
}
[@@ocaml.doc ""]

type nonrec list_prospecting_from_engagement_tasks_response = {
  task_summaries : prospecting_task_summary_list;
      [@ocaml.doc
        "Prospecting task summaries matching the specified filters. Each summary includes the task \
         identifier, name, status counters, and timing information. If no tasks match the filter \
         criteria, the list is empty.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A pagination token used to retrieve the next page of results. If this field is present, \
         pass its value as [NextToken] in the next call. If absent or empty, there are no further \
         pages.\n"]
}
[@@ocaml.doc
  "Represents the response structure containing a paginated list of prospecting task summaries \
   matching the request filters. Indicates through [NextToken] when additional results are \
   available.\n"]

type nonrec list_prospecting_from_engagement_tasks_request = {
  sort : prospecting_from_engagement_task_sort option;
      [@ocaml.doc
        "Specifies the field and order used to sort the returned tasks. If omitted, tasks are \
         returned in the default sort order.\n"]
  start_before : date_time option;
      [@ocaml.doc
        "Filters tasks to include only those that started before the specified timestamp. Use this \
         with [StartAfter] to define a start-time range for your query. The format follows ISO \
         8601 date-time notation.\n"]
  start_after : date_time option;
      [@ocaml.doc
        "Filters tasks to include only those that started after the specified timestamp. Use this \
         with [StartBefore] to define a start-time range for your query. The format follows ISO \
         8601 date-time notation.\n"]
  task_name : task_name_list option;
      [@ocaml.doc
        "Filters the results to include only tasks with the specified names. Provide up to 10 task \
         names to narrow the list. If omitted, tasks are not filtered by name.\n"]
  task_identifier : task_identifier_list option;
      [@ocaml.doc
        "Filters the results to include only the tasks with the specified identifiers. Provide up \
         to 10 task IDs to narrow the list to specific tasks. If omitted, tasks are not filtered \
         by identifier.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The pagination token from a previous call to this API. Include this value to retrieve the \
         next page of results. If omitted, the first page is returned.\n"]
  max_results : page_size option;
      [@ocaml.doc
        "The maximum number of results to return in a single page. If additional results exist, \
         the response includes a [NextToken] value for retrieving the next page. If omitted, the \
         API uses a service-defined default page size.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog to list tasks from. Specify [AWS] for production environments and \
         [Sandbox] for testing and development purposes.\n"]
}
[@@ocaml.doc
  "Represents the request structure for listing prospecting tasks. All filter parameters are \
   optional. Results are paginated \226\128\148 uses [NextToken] from the response to retrieve \
   subsequent pages.\n"]

type nonrec list_opportunity_from_engagement_task_summary = {
  context_id : context_identifier option;
      [@ocaml.doc
        "The unique identifier of the engagement context associated with the opportunity creation \
         task. This links the task to specific contextual information within the engagement.\n"]
  engagement_id : engagement_identifier option;
      [@ocaml.doc
        "The unique identifier of the engagement from which the opportunity is being created. This \
         field helps track the source of the opportunity creation task.\n"]
  resource_snapshot_job_id : resource_snapshot_job_identifier option;
      [@ocaml.doc
        "The identifier of the resource snapshot job associated with this task, if a snapshot was \
         created as part of the opportunity creation process.\n"]
  opportunity_id : opportunity_identifier option;
      [@ocaml.doc
        "The unique identifier of the opportunity created as a result of the task. This field is \
         populated when the task is completed successfully.\n"]
  reason_code : reason_code option;
      [@ocaml.doc
        "A code indicating the specific reason for a task failure. This field is populated when \
         the task status is FAILED and provides a categorized reason for the failure.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A detailed message providing additional information about the task, especially useful in \
         case of failures. This field may contain error details or other relevant information \
         about the task's execution.\n"]
  task_status : task_status option;
      [@ocaml.doc
        "The current status of the task. Valid values are COMPLETE, INPROGRESS, or FAILED.\n"]
  start_time : date_time option;
      [@ocaml.doc "The timestamp indicating when the task was initiated, in RFC 3339 format.\n"]
  task_arn : task_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that uniquely identifies the task within AWS. This ARN can \
         be used for referencing the task in other AWS services or APIs.\n"]
  task_id : task_identifier option;
      [@ocaml.doc
        "The unique identifier of the task for creating an opportunity from an engagement.\n"]
}
[@@ocaml.doc
  "Provides a summary of a task related to creating an opportunity from an engagement. This \
   structure contains key information about the task's status, associated identifiers, and any \
   failure details for opportunity creation processes.\n"]

type nonrec list_opportunity_from_engagement_task_summaries =
  list_opportunity_from_engagement_task_summary list
[@@ocaml.doc ""]

type nonrec list_opportunity_from_engagement_tasks_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A token used for pagination to retrieve the next page of results. If there are more \
         results available, this field will contain a token that can be used in a subsequent API \
         call to retrieve the next page. If there are no more results, this field will be null or \
         an empty string.\n"]
  task_summaries : list_opportunity_from_engagement_task_summaries option;
      [@ocaml.doc
        "An array of [ListOpportunityFromEngagementTaskSummary] objects, each representing a task \
         that matches the specified filters. The array may be empty if no tasks match the criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec engagement_identifiers = engagement_arn_or_identifier list [@@ocaml.doc ""]

type nonrec context_identifiers = context_identifier list [@@ocaml.doc ""]

type nonrec list_opportunity_from_engagement_tasks_request = {
  context_identifier : context_identifiers option;
      [@ocaml.doc
        "Filters tasks by the identifiers of the engagement contexts associated with the \
         opportunity creation. Use this to find tasks related to specific contextual information \
         within engagements that are being converted to opportunities.\n"]
  engagement_identifier : engagement_identifiers option;
      [@ocaml.doc
        "Filters tasks by the identifiers of the engagements from which opportunities are being \
         created. Use this to find all opportunity creation tasks associated with a specific \
         engagement.\n"]
  opportunity_identifier : opportunity_identifiers option;
      [@ocaml.doc
        "Filters tasks by the identifiers of the opportunities they created or are associated \
         with. Use this to find tasks related to specific opportunity creation processes.\n"]
  task_identifier : task_identifiers option;
      [@ocaml.doc
        "Filters tasks by their unique identifiers. Use this when you want to retrieve information \
         about specific tasks. Provide the task ID to get details about a particular opportunity \
         creation task.\n"]
  task_status : task_statuses option;
      [@ocaml.doc
        "Filters the tasks based on their current status. This allows you to focus on tasks in \
         specific states. Valid values are [COMPLETE] for tasks that have finished successfully, \
         [INPROGRESS] for tasks that are currently running, and [FAILED] for tasks that have \
         encountered an error and failed to complete.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog related to the request. Valid values are [AWS] for production \
         environments and [Sandbox] for testing or development purposes. The catalog determines \
         which environment the task data is retrieved from.\n"]
  sort : list_tasks_sort_base option; [@ocaml.doc ""]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token for requesting the next page of results. This value is obtained from the \
         NextToken field in the response of a previous call to this API. Use this parameter for \
         pagination when the result set spans multiple pages.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Specifies the maximum number of results to return in a single page of the response. Use \
         this parameter to control the number of items returned in each request, which can be \
         useful for performance tuning and managing large result sets.\n"]
}
[@@ocaml.doc ""]

type nonrec list_opportunities_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A pagination token used to retrieve the next set of results in subsequent calls. This \
         token is included in the response only if there are additional result pages available.\n"]
  opportunity_summaries : opportunity_summaries;
      [@ocaml.doc
        "An array that contains minimal details for opportunities that match the request criteria. \
         This summary view provides a quick overview of relevant opportunities.\n"]
}
[@@ocaml.doc ""]

type nonrec last_modified_date = {
  before_last_modified_date : date_time option;
      [@ocaml.doc
        "Specifies the date before which the opportunities were modified. Use this filter to \
         retrieve only those opportunities that were modified before a given timestamp.\n"]
  after_last_modified_date : date_time option;
      [@ocaml.doc
        "Specifies the date after which the opportunities were modified. Use this filter to \
         retrieve only those opportunities that were modified after a given timestamp.\n"]
}
[@@ocaml.doc
  "Defines a filter to retrieve opportunities based on the last modified date. This filter is \
   useful for tracking changes or updates to opportunities over time.\n"]

type nonrec filter_identifier = opportunity_identifier list [@@ocaml.doc ""]

type nonrec filter_life_cycle_stage = stage list [@@ocaml.doc ""]

type nonrec filter_life_cycle_review_status = review_status list [@@ocaml.doc ""]

type nonrec created_date_filter = {
  before_created_date : date_time option;
      [@ocaml.doc "Filter opportunities created before this date.\n"]
  after_created_date : date_time option;
      [@ocaml.doc "Filter opportunities created after this date.\n"]
}
[@@ocaml.doc "Filter for opportunities based on creation date range.\n"]

type nonrec list_opportunities_request = {
  target_close_date : target_close_date_filter option;
      [@ocaml.doc
        "Filters opportunities based on their target close date. This filter helps retrieve \
         opportunities with an expected close date before or after a specified date.\n"]
  created_date : created_date_filter option;
      [@ocaml.doc "Filter opportunities by creation date criteria.\n"]
  customer_company_name : string_list option;
      [@ocaml.doc
        "Filters the opportunities based on the customer's company name. This allows partners to \
         search for opportunities associated with a specific customer by matching the provided \
         company name string.\n"]
  life_cycle_review_status : filter_life_cycle_review_status option;
      [@ocaml.doc
        "Filters the opportunities based on their current lifecycle approval status. Use this \
         filter to retrieve opportunities with statuses such as [Pending Submission], [In Review], \
         [Action Required], or [Approved].\n"]
  life_cycle_stage : filter_life_cycle_stage option;
      [@ocaml.doc
        "Filters the opportunities based on their lifecycle stage. This filter allows partners to \
         retrieve opportunities at various stages in the sales cycle, such as [Qualified], \
         [Technical Validation], [Business Validation], or [Closed Won].\n"]
  identifier : filter_identifier option;
      [@ocaml.doc
        "Filters the opportunities based on the opportunity identifier. This allows partners to \
         retrieve specific opportunities by providing their unique identifiers, ensuring precise \
         results.\n"]
  last_modified_date : last_modified_date option;
      [@ocaml.doc
        "Filters the opportunities based on their last modified date. This filter helps retrieve \
         opportunities that were updated after the specified date, allowing partners to track \
         recent changes or updates.\n"]
  sort : opportunity_sort option;
      [@ocaml.doc
        "An object that specifies how the response is sorted. The default [Sort.SortBy] value is \
         [LastModifiedDate].\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A pagination token used to retrieve the next set of results in subsequent calls. This \
         token is included in the response only if there are additional result pages available.\n"]
  max_results : page_size option;
      [@ocaml.doc
        "Specifies the maximum number of results to return in a single call. This limits the \
         number of opportunities returned in the response to avoid providing too many results at \
         once.\n\n\
        \ Default: 20\n\
        \ "]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog associated with the request. This field takes a string value from a \
         predefined list: [AWS] or [Sandbox]. The catalog determines which environment the \
         opportunities are listed in. Use [AWS] for listing real opportunities in the Amazon Web \
         Services catalog, and [Sandbox] for testing in secure, isolated environments.\n"]
}
[@@ocaml.doc ""]

type nonrec engagement_title = string [@@ocaml.doc ""]

type nonrec engagement_context_type_list = engagement_context_type list [@@ocaml.doc ""]

type nonrec engagement_summary = {
  context_types : engagement_context_type_list option;
      [@ocaml.doc
        "An array of context types associated with the engagement, such as \"CustomerProject\" or \
         \"Lead\". This provides a quick overview of the types of contexts included in the \
         engagement.\n"]
  modified_by : aws_account option;
      [@ocaml.doc
        "The AWS account ID of the user who last modified the engagement. This field helps track \
         who made the most recent changes to the engagement.\n"]
  modified_at : date_time option;
      [@ocaml.doc
        "The timestamp indicating when the engagement was last modified, in ISO 8601 format (UTC). \
         Example: \"2023-05-01T20:37:46Z\".\n"]
  member_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of members in the Engagement.\n"]
  created_by : aws_account option; [@ocaml.doc "The AWS Account ID of the Engagement creator.\n"]
  created_at : date_time option; [@ocaml.doc "The date and time when the Engagement was created.\n"]
  title : engagement_title option; [@ocaml.doc "The title of the Engagement.\n"]
  id : engagement_identifier option; [@ocaml.doc "The unique identifier for the Engagement.\n"]
  arn : engagement_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the created Engagement.\n"]
}
[@@ocaml.doc "An object that contains an [Engagement]'s subset of fields. \n"]

type nonrec engagement_summary_list = engagement_summary list [@@ocaml.doc ""]

type nonrec list_engagements_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token to retrieve the next set of results. This field will be null if there are no \
         more results. \n"]
  engagement_summary_list : engagement_summary_list;
      [@ocaml.doc "An array of engagement summary objects.\n"]
}
[@@ocaml.doc ""]

type nonrec aws_account_list = aws_account list [@@ocaml.doc ""]

type nonrec engagement_sort_name = CreatedDate [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec engagement_sort = {
  sort_by : engagement_sort_name; [@ocaml.doc "The field by which to sort the results.\n"]
  sort_order : sort_order; [@ocaml.doc "The order in which to sort the results.\n"]
}
[@@ocaml.doc "Specifies the sorting parameters for listing Engagements.\n"]

type nonrec engagement_page_size = int [@@ocaml.doc ""]

type nonrec list_engagements_request = {
  engagement_identifier : engagement_identifiers option;
      [@ocaml.doc "An array of strings representing engagement identifiers to retrieve.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token for the next set of results. This value is returned from a previous call.\n"]
  max_results : engagement_page_size option;
      [@ocaml.doc "The maximum number of results to return in a single call.\n"]
  sort : engagement_sort option; [@ocaml.doc ""]
  exclude_context_types : engagement_context_type_list option;
      [@ocaml.doc
        "Filters engagements to exclude those containing the specified context types. Use this to \
         find engagements that do not have certain types of contextual information, helping to \
         narrow results based on context exclusion criteria.\n"]
  context_types : engagement_context_type_list option;
      [@ocaml.doc
        "Filters engagements to include only those containing the specified context types, such as \
         \"CustomerProject\" or \"Lead\". Use this to find engagements that have specific types of \
         contextual information associated with them.\n"]
  exclude_created_by : aws_account_list option;
      [@ocaml.doc
        "An array of strings representing AWS Account IDs. Use this to exclude engagements created \
         by specific users. \n"]
  created_by : aws_account_list option;
      [@ocaml.doc
        " A list of AWS account IDs. When specified, the response includes engagements created by \
         these accounts. This filter is useful for finding engagements created by specific team \
         members. \n"]
  catalog : catalog_identifier; [@ocaml.doc " Specifies the catalog related to the request. \n"]
}
[@@ocaml.doc ""]

type nonrec engagement_resource_association_summary = {
  created_by : aws_account option;
      [@ocaml.doc
        "The AWS account ID of the entity that owns the resource. Identifies the account \
         responsible for or having primary control over the resource. \n"]
  resource_id : resource_identifier option;
      [@ocaml.doc
        " A unique identifier for the specific resource. Varies depending on the resource type. \n"]
  resource_type : resource_type option;
      [@ocaml.doc " Categorizes the type of resource associated with the engagement. \n"]
  engagement_id : engagement_identifier option;
      [@ocaml.doc " A unique identifier for the engagement associated with the resource. \n"]
  catalog : catalog_identifier;
      [@ocaml.doc " Indicates the environment in which the resource and engagement exist. \n"]
}
[@@ocaml.doc
  " This provide a streamlined view of the relationships between engagements and resources. These \
   summaries offer a crucial link between collaborative engagements and the specific resources \
   involved, such as opportunities.These summaries are particularly valuable for partners \
   navigating complex engagements with multiple resources. They enable quick insights into \
   resource distribution across engagements, support efficient resource management, and help \
   maintain a clear overview of collaborative activities. \n"]

type nonrec engagement_resource_association_summary_list =
  engagement_resource_association_summary list
[@@ocaml.doc ""]

type nonrec list_engagement_resource_associations_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        " A token to retrieve the next set of results. Use this token in a subsequent request to \
         retrieve additional results if the response was truncated. \n"]
  engagement_resource_association_summaries : engagement_resource_association_summary_list;
      [@ocaml.doc " A list of engagement-resource association summaries. \n"]
}
[@@ocaml.doc ""]

type nonrec list_engagement_resource_associations_request = {
  created_by : aws_account option;
      [@ocaml.doc
        "Filters the response to include only snapshots of resources owned by the specified AWS \
         account ID. Use this when you want to find associations related to resources owned by a \
         particular account. \n"]
  resource_identifier : resource_identifier option;
      [@ocaml.doc
        "Filters the results to include only associations with the specified resource. Varies \
         depending on the resource type. Use this when you want to find all engagements associated \
         with a specific resource.\n"]
  resource_type : resource_type option;
      [@ocaml.doc
        " Filters the results to include only associations with resources of the specified type. \n"]
  engagement_identifier : engagement_identifier option;
      [@ocaml.doc
        "Filters the results to include only associations related to the specified engagement. Use \
         this when you want to find all resources associated with a specific engagement.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A token used for pagination of results. Include this token in subsequent requests to \
         retrieve the next set of results.\n"]
  max_results : page_size option;
      [@ocaml.doc
        "Limits the number of results returned in a single call. Use this to control the number of \
         results returned, especially useful for pagination.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog in which to search for engagement-resource associations. Valid \
         Values: \"AWS\" or \"Sandbox\"\n\n\
        \ {ul\n\
        \       {-   [AWS] for production environments.\n\
        \           \n\
        \            }\n\
        \       {-   [Sandbox] for testing and development purposes.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec engagement_member = {
  account_id : aws_account option;
      [@ocaml.doc
        "This is the unique identifier for the AWS account associated with the member \
         organization. It's used for AWS-related operations and identity verification. \n"]
  website_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The URL of the member company's website. This offers a way to find more information about \
         the member organization and serves as an additional identifier. \n"]
  company_name : member_company_name option;
      [@ocaml.doc "The official name of the member's company or organization.\n"]
}
[@@ocaml.doc
  "Engagement members are the participants in an Engagement, which is likely a collaborative \
   project or business opportunity within the AWS partner network. Members can be different \
   partner organizations or AWS accounts that are working together on a specific engagement. \n\n\
  \ Each member is represented by their AWS Account ID, Company Name, and associated details. \
   Members have a status within the Engagement (PENDING, ACCEPTED, REJECTED, or WITHDRAWN), \
   indicating their current state of participation. Only existing members of an Engagement can \
   view the list of other members. This implies a level of privacy and access control within the \
   Engagement structure. \n\
  \ "]

type nonrec engagement_members = engagement_member list [@@ocaml.doc ""]

type nonrec list_engagement_members_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A pagination token used to retrieve the next set of results. If there are more results \
         available than can be returned in a single response, this token will be present. Use this \
         token in a subsequent request to retrieve the next page of results. If there are no more \
         results, this value will be null. \n"]
  engagement_member_list : engagement_members;
      [@ocaml.doc " Provides a list of engagement members. \n"]
}
[@@ocaml.doc ""]

type nonrec list_engagement_members_request = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The token for the next set of results.\n"]
  max_results : member_page_size option;
      [@ocaml.doc "The maximum number of results to return in a single call.\n"]
  identifier : engagement_arn_or_identifier;
      [@ocaml.doc "Identifier of the Engagement record to retrieve members from.\n"]
  catalog : catalog_identifier; [@ocaml.doc "The catalog related to the request.\n"]
}
[@@ocaml.doc ""]

type nonrec engagement_invitation_payload_type =
  | LEAD_INVITATION [@ocaml.doc ""]
  | OPPORTUNITY_INVITATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec invitation_status =
  | EXPIRED [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | ACCEPTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec engagement_invitation_summary = {
  participant_type : participant_type option;
      [@ocaml.doc "Identifies the role of the caller in the engagement invitation.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog in which the Engagement Invitation resides. This can be either the \
         [AWS] or [Sandbox] catalog, indicating whether the opportunity is live or being tested.\n"]
  receiver : receiver option;
      [@ocaml.doc
        "Specifies the partner company or individual that received the Engagement Invitation. This \
         field is important for tracking who the invitation was sent to within the partner \
         organization.\n"]
  sender_company_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Indicates the name of the company or AWS division that sent the Engagement Invitation. \
         This information is useful for partners to know which part of AWS is requesting \
         engagement.\n"]
  sender_aws_account_id : aws_account option;
      [@ocaml.doc
        "Specifies the AWS account ID of the sender who initiated the Engagement Invitation. This \
         allows the partner to identify the AWS entity or representative responsible for sharing \
         the opportunity.\n"]
  expiration_date : date_time option;
      [@ocaml.doc
        "Indicates the date and time when the Engagement Invitation will expire. After this date, \
         the invitation can no longer be accepted, and the opportunity will be unavailable to the \
         partner.\n"]
  invitation_date : date_time option;
      [@ocaml.doc
        "Indicates the date when the Engagement Invitation was sent to the partner. This provides \
         context for when the opportunity was shared and helps in tracking the timeline for \
         engagement.\n"]
  status : invitation_status option;
      [@ocaml.doc
        "Represents the current status of the Engagement Invitation, such as [Pending], \
         [Accepted], or [Rejected]. The status helps track the progress and response to the \
         invitation.\n"]
  engagement_title : engagement_title option;
      [@ocaml.doc
        "Provides a short title or description of the Engagement Invitation. This title helps \
         partners quickly identify and differentiate between multiple engagement opportunities.\n"]
  engagement_id : engagement_identifier option;
      [@ocaml.doc
        " The identifier of the Engagement associated with this invitation. This links the \
         invitation to its parent Engagement. \n"]
  id : engagement_invitation_arn_or_identifier;
      [@ocaml.doc
        "Represents the unique identifier of the Engagement Invitation. This identifier is used to \
         track the invitation and to manage responses like acceptance or rejection.\n"]
  payload_type : engagement_invitation_payload_type option;
      [@ocaml.doc
        "Describes the type of payload associated with the Engagement Invitation, such as \
         [Opportunity] or [MarketplaceOffer]. This helps partners understand the nature of the \
         engagement request from AWS.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Engagement Invitation. The ARN is a unique \
         identifier that allows partners to reference the invitation in their system and manage \
         its lifecycle.\n"]
}
[@@ocaml.doc
  "Provides a summarized view of the Engagement Invitation, including details like the identifier, \
   status, and sender. This summary helps partners track and manage AWS originated opportunities.\n"]

type nonrec engagement_invitation_summaries = engagement_invitation_summary list [@@ocaml.doc ""]

type nonrec list_engagement_invitations_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A pagination token returned when there are more results available than can be returned in \
         a single call. Use this token to retrieve additional pages of engagement invitation \
         summaries.\n"]
  engagement_invitation_summaries : engagement_invitation_summaries option;
      [@ocaml.doc
        "An array containing summaries of engagement invitations. Each summary includes \
         information such as the invitation title, invitation date, and the current status of the \
         invitation.\n"]
}
[@@ocaml.doc ""]

type nonrec engagement_invitations_payload_type = engagement_invitation_payload_type list
[@@ocaml.doc ""]

type nonrec invitation_status_list = invitation_status list [@@ocaml.doc ""]

type nonrec aws_account_id_or_alias_list = aws_account list [@@ocaml.doc ""]

type nonrec list_engagement_invitations_request = {
  sender_aws_account_id : aws_account_id_or_alias_list option;
      [@ocaml.doc " List of sender AWS account IDs to filter the invitations. \n"]
  engagement_identifier : engagement_identifiers option;
      [@ocaml.doc
        " Retrieves a list of engagement invitation summaries based on specified filters. The \
         ListEngagementInvitations operation allows you to view all invitations that you have sent \
         or received. You must specify the ParticipantType to filter invitations where you are \
         either the SENDER or the RECEIVER. Invitations will automatically expire if not accepted \
         within 15 days. \n"]
  status : invitation_status_list option;
      [@ocaml.doc " Status values to filter the invitations. \n"]
  participant_type : participant_type;
      [@ocaml.doc
        "Specifies the type of participant for which to list engagement invitations. Identifies \
         the role of the participant.\n"]
  payload_type : engagement_invitations_payload_type option;
      [@ocaml.doc
        "Defines the type of payload associated with the engagement invitations to be listed. The \
         attributes in this payload help decide on acceptance or rejection of the invitation.\n"]
  sort : opportunity_engagement_invitation_sort option;
      [@ocaml.doc
        "Specifies the sorting options for listing engagement invitations. Invitations can be \
         sorted by fields such as [InvitationDate] or [Status] to help partners view results in \
         their preferred order.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A pagination token used to retrieve additional pages of results when the response to a \
         previous request was truncated. Pass this token to continue listing invitations from \
         where the previous call left off.\n"]
  max_results : page_size option;
      [@ocaml.doc
        "Specifies the maximum number of engagement invitations to return in the response. If more \
         results are available, a pagination token will be provided.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog from which to list the engagement invitations. Use [AWS] for \
         production invitations or [Sandbox] for testing environments.\n"]
}
[@@ocaml.doc ""]

type nonrec list_engagement_from_opportunity_task_summary = {
  engagement_invitation_id : engagement_invitation_identifier option;
      [@ocaml.doc "The unique identifier of the Engagement Invitation.\n"]
  engagement_id : engagement_identifier option;
      [@ocaml.doc
        " The unique identifier of the engagement created as a result of the task. This field is \
         populated when the task is completed successfully. \n"]
  resource_snapshot_job_id : resource_snapshot_job_identifier option;
      [@ocaml.doc
        " The identifier of the resource snapshot job associated with this task, if a snapshot was \
         created as part of the Engagement creation process. \n"]
  opportunity_id : opportunity_identifier option;
      [@ocaml.doc
        " The unique identifier of the original Opportunity from which the Engagement is being \
         created. This field helps track the source of the Engagement creation task. \n"]
  reason_code : reason_code option;
      [@ocaml.doc
        " A code indicating the specific reason for a task failure. This field is populated when \
         the task status is FAILED and provides a categorized reason for the failure. \n"]
  message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        " A detailed message providing additional information about the task, especially useful in \
         case of failures. This field may contain error details or other relevant information \
         about the task's execution \n"]
  task_status : task_status option; [@ocaml.doc " The current status of the task. \n"]
  start_time : date_time option;
      [@ocaml.doc
        " The timestamp indicating when the task was initiated, in RFC 3339 5.6 date-time format. \n"]
  task_arn : task_arn option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) uniquely identifying this task within AWS. This ARN can \
         be used for referencing the task in other AWS services or APIs. \n"]
  task_id : task_identifier option; [@ocaml.doc " A unique identifier for a specific task. \n"]
}
[@@ocaml.doc
  " Provides a summary of a task related to creating an engagement from an opportunity. This \
   structure contains key information about the task's status, associated identifiers, and any \
   failure details. \n"]

type nonrec list_engagement_from_opportunity_task_summaries =
  list_engagement_from_opportunity_task_summary list
[@@ocaml.doc ""]

type nonrec list_engagement_from_opportunity_tasks_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        " A token used for pagination to retrieve the next page of results. If there are more \
         results available, this field will contain a token that can be used in a subsequent API \
         call to retrieve the next page. If there are no more results, this field will be null or \
         an empty string. \n"]
  task_summaries : list_engagement_from_opportunity_task_summaries option;
      [@ocaml.doc
        " TaskSummaries An array of TaskSummary objects containing details about each task. \n"]
}
[@@ocaml.doc ""]

type nonrec list_engagement_from_opportunity_tasks_request = {
  engagement_identifier : engagement_identifiers option;
      [@ocaml.doc
        " Filters tasks by the identifiers of the engagements they created or are associated with. \n"]
  opportunity_identifier : opportunity_identifiers option;
      [@ocaml.doc " The identifier of the original opportunity associated with this task. \n"]
  task_identifier : task_identifiers option;
      [@ocaml.doc
        " Filters tasks by their unique identifiers. Use this when you want to retrieve \
         information about specific tasks. \n"]
  task_status : task_statuses option;
      [@ocaml.doc
        " Filters the tasks based on their current status. This allows you to focus on tasks in \
         specific states. \n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        " Specifies the catalog related to the request. Valid values are: \n\n\
        \ {ul\n\
        \       {-   AWS: Retrieves the request from the production AWS environment. \n\
        \           \n\
        \            }\n\
        \       {-   Sandbox: Retrieves the request from a sandbox environment used for testing or \
         development purposes. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  sort : list_tasks_sort_base option;
      [@ocaml.doc
        " Specifies the sorting criteria for the returned results. This allows you to order the \
         tasks based on specific attributes. \n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        " The token for requesting the next page of results. This value is obtained from the \
         NextToken field in the response of a previous call to this API. Use this parameter for \
         pagination when the result set spans multiple pages. \n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        " Specifies the maximum number of results to return in a single page of the response.Use \
         this parameter to control the number of items returned in each request, which can be \
         useful for performance tuning and managing large result sets. \n"]
}
[@@ocaml.doc ""]

type nonrec list_engagement_by_accepting_invitation_task_summary = {
  engagement_invitation_id : engagement_invitation_identifier option;
      [@ocaml.doc " The unique identifier of the engagement invitation that was accepted. \n"]
  resource_snapshot_job_id : resource_snapshot_job_identifier option;
      [@ocaml.doc " Unique identifier of the resource snapshot job that was created. \n"]
  opportunity_id : opportunity_identifier option;
      [@ocaml.doc " Unique identifier of opportunity that was created. \n"]
  reason_code : reason_code option;
      [@ocaml.doc " A code pointing to the specific reason for the failure. \n"]
  message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " Detailed message describing the failure and possible recovery steps. \n"]
  task_status : task_status option; [@ocaml.doc " Status of the task. \n"]
  start_time : date_time option; [@ocaml.doc " Task start timestamp. \n"]
  task_arn : task_arn option;
      [@ocaml.doc " The Amazon Resource Name (ARN) that uniquely identifies the task. \n"]
  task_id : task_identifier option; [@ocaml.doc " Unique identifier of the task. \n"]
}
[@@ocaml.doc
  " Specifies a subset of fields associated with tasks related to accepting an engagement \
   invitation. \n"]

type nonrec list_engagement_by_accepting_invitation_task_summaries =
  list_engagement_by_accepting_invitation_task_summary list
[@@ocaml.doc ""]

type nonrec list_engagement_by_accepting_invitation_tasks_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        " A token used for pagination to retrieve the next page of results.If there are more \
         results available, this field will contain a token that can be used in a subsequent API \
         call to retrieve the next page. If there are no more results, this field will be null or \
         an empty string. \n"]
  task_summaries : list_engagement_by_accepting_invitation_task_summaries option;
      [@ocaml.doc
        " An array of [EngagementByAcceptingInvitationTaskSummary] objects, each representing a \
         task that matches the specified filters. The array may be empty if no tasks match the \
         criteria. \n"]
}
[@@ocaml.doc ""]

type nonrec engagement_invitation_identifiers = engagement_invitation_arn_or_identifier list
[@@ocaml.doc ""]

type nonrec list_engagement_by_accepting_invitation_tasks_request = {
  task_identifier : task_identifiers option;
      [@ocaml.doc
        " Filters tasks by their unique identifiers. Use this when you want to retrieve \
         information about specific tasks. \n"]
  engagement_invitation_identifier : engagement_invitation_identifiers option;
      [@ocaml.doc
        " Filters tasks by the identifiers of the engagement invitations they are processing. \n"]
  opportunity_identifier : opportunity_identifiers option;
      [@ocaml.doc
        " Filters tasks by the identifiers of the opportunities they created or are associated \
         with. \n"]
  task_status : task_statuses option;
      [@ocaml.doc
        " Filters the tasks based on their current status. This allows you to focus on tasks in \
         specific states. \n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        " Specifies the catalog related to the request. Valid values are: \n\n\
        \ {ul\n\
        \       {-   AWS: Retrieves the request from the production AWS environment. \n\
        \           \n\
        \            }\n\
        \       {-   Sandbox: Retrieves the request from a sandbox environment used for testing or \
         development purposes. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  sort : list_tasks_sort_base option;
      [@ocaml.doc
        " Specifies the sorting criteria for the returned results. This allows you to order the \
         tasks based on specific attributes. \n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        " Use this parameter for pagination when the result set spans multiple pages. This value \
         is obtained from the NextToken field in the response of a previous call to this API. \n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        " Use this parameter to control the number of items returned in each request, which can be \
         useful for performance tuning and managing large result sets. \n"]
}
[@@ocaml.doc ""]

type nonrec lead_interaction_list = lead_interaction list [@@ocaml.doc ""]

type nonrec lead_context = {
  interactions : lead_interaction_list;
      [@ocaml.doc
        "An array of interactions that have occurred with the lead, providing a history of \
         communications, meetings, and other engagement activities related to the lead.\n"]
  customer : lead_customer;
      [@ocaml.doc
        "Contains detailed information about the customer associated with the lead, including \
         company information, contact details, and other relevant customer data.\n"]
  qualification_status : lead_qualification_status option;
      [@ocaml.doc
        "Indicates the current qualification status of the lead, such as whether it has been \
         qualified, disqualified, or is still under evaluation. This helps track the lead's \
         progression through the qualification process.\n"]
  insights : lead_insights option;
      [@ocaml.doc
        "Insights that AI generates and associates with the lead. These insights provide automated \
         analysis such as lead readiness scoring to help partners assess the lead quality.\n"]
}
[@@ocaml.doc
  "Provides comprehensive details about a lead associated with an engagement. This structure \
   contains information about lead qualification status, customer details, and interaction history \
   to facilitate lead management and tracking within the engagement.\n"]

type nonrec invitation_message = string [@@ocaml.doc ""]

type nonrec invitation = {
  payload : payload; [@ocaml.doc ""]
  receiver : receiver; [@ocaml.doc ""]
  message : invitation_message; [@ocaml.doc " A message accompanying the invitation. \n"]
}
[@@ocaml.doc
  " The Invitation structure represents an invitation exchanged between partners and AWS. It \
   includes a message, receiver information, and a payload providing context for the invitation. \n"]

type nonrec get_selling_system_settings_response = {
  resource_snapshot_job_role_arn : resource_snapshot_job_role_arn option;
      [@ocaml.doc "Specifies the ARN of the IAM Role used for resource snapshot job executions.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog in which the settings are defined. Acceptable values include [AWS] \
         for production and [Sandbox] for testing environments.\n"]
}
[@@ocaml.doc ""]

type nonrec get_selling_system_settings_request = {
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog in which the settings are defined. Acceptable values include [AWS] \
         for production and [Sandbox] for testing environments.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_snapshot_response = {
  target_member_accounts : aws_account_id_or_alias_list option;
      [@ocaml.doc "Target member accounts associated with the resource snapshot.\n"]
  payload : resource_snapshot_payload option; [@ocaml.doc ""]
  revision : resource_snapshot_revision option;
      [@ocaml.doc
        "The revision number of this snapshot. This is a positive integer that is sequential and \
         unique within the context of a resource view.\n"]
  resource_snapshot_template_name : resource_template_name option;
      [@ocaml.doc
        "The name of the view used for this snapshot. This is the same as the template name.\n"]
  resource_id : resource_identifier option;
      [@ocaml.doc
        "The identifier of the specific resource that was snapshotted. Matches the \
         ResourceIdentifier specified in the request.\n"]
  resource_type : resource_type option;
      [@ocaml.doc
        "The type of the resource that was snapshotted. Matches the ResourceType specified in the \
         request.\n"]
  engagement_id : engagement_identifier option;
      [@ocaml.doc
        "The identifier of the engagement associated with this snapshot. Matches the \
         EngagementIdentifier specified in the request. \n"]
  created_at : date_time option;
      [@ocaml.doc
        "The timestamp when the snapshot was created, in ISO 8601 format (e.g., \
         \"2023-06-01T14:30:00Z\"). This allows for precise tracking of when the snapshot was \
         taken. \n"]
  created_by : aws_account option;
      [@ocaml.doc
        "The AWS account ID of the principal (user or role) who created the snapshot. This helps \
         in tracking the origin of the snapshot. \n"]
  arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that uniquely identifies the resource snapshot.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "The catalog in which the snapshot was created. Matches the Catalog specified in the \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_snapshot_request = {
  revision : resource_snapshot_revision option;
      [@ocaml.doc
        "Specifies which revision of the snapshot to retrieve. If omitted returns the latest \
         revision.\n"]
  resource_snapshot_template_identifier : resource_template_name;
      [@ocaml.doc
        "he name of the template that defines the schema for the snapshot. This template \
         determines which subset of the resource data is included in the snapshot and must \
         correspond to an existing and valid template for the specified [ResourceType].\n"]
  resource_identifier : resource_identifier;
      [@ocaml.doc
        "The unique identifier of the specific resource that was snapshotted. The format and \
         constraints of this identifier depend on the ResourceType specified. For [Opportunity] \
         type, it will be an [opportunity ID] \n"]
  resource_type : resource_type;
      [@ocaml.doc
        "Specifies the type of resource that was snapshotted. This field determines the structure \
         and content of the snapshot payload. Valid value includes:[Opportunity]: For \
         opportunity-related data. \n"]
  engagement_identifier : engagement_identifier;
      [@ocaml.doc
        "The unique identifier of the engagement associated with the snapshot. This field links \
         the snapshot to a specific engagement context.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog related to the request. Valid values are:\n\n\
        \ {ul\n\
        \       {-  AWS: Retrieves the snapshot from the production AWS environment.\n\
        \           \n\
        \            }\n\
        \       {-  Sandbox: Retrieves the snapshot from a sandbox environment used for testing or \
         development purposes.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_resource_snapshot_job_response = {
  last_failure : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "If the job has encountered any failures, this field contains the error message from the \
         most recent failure. This can be useful for troubleshooting issues with the job. \n"]
  last_successful_execution_date : date_time option;
      [@ocaml.doc
        "The date and time of the last successful execution of the job, in ISO 8601 format (UTC). \
         Example: \"2023-05-01T20:37:46Z\" \n"]
  status : resource_snapshot_job_status option;
      [@ocaml.doc
        "The current status of the snapshot job. Valid values:\n\n\
        \ {ul\n\
        \       {-  STOPPED: The job is not currently running.\n\
        \           \n\
        \            }\n\
        \       {-  RUNNING: The job is actively executing.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  created_at : date_time option;
      [@ocaml.doc
        "The date and time when the snapshot job was created in ISO 8601 format (UTC). Example: \
         \"2023-05-01T20:37:46Z\" \n"]
  resource_snapshot_template_name : resource_template_name option;
      [@ocaml.doc
        "The name of the template used for creating the snapshot. This is the same as the template \
         name. It defines the structure and content of the snapshot.\n"]
  resource_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource being snapshotted. This provides a \
         globally unique identifier for the resource across AWS. \n"]
  resource_id : resource_identifier option;
      [@ocaml.doc
        "The identifier of the specific resource being snapshotted. The format might vary \
         depending on the ResourceType. \n"]
  resource_type : resource_type option;
      [@ocaml.doc
        "The type of resource being snapshotted. This would have \"Opportunity\" as a value as it \
         is dependent on the supported resource type.\n"]
  engagement_id : engagement_identifier option;
      [@ocaml.doc
        "The identifier of the engagement associated with this snapshot job. This links the job to \
         a specific engagement context. \n"]
  arn : resource_snapshot_job_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the snapshot job. This globally unique identifier can \
         be used for resource-specific operations across AWS services. \n"]
  id : resource_snapshot_job_identifier option;
      [@ocaml.doc
        "The unique identifier of the snapshot job. This matches the ResourceSnapshotJobIdentifier \
         provided in the request. \n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "The catalog in which the snapshot job was created. This will match the Catalog specified \
         in the request. \n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_snapshot_job_request = {
  resource_snapshot_job_identifier : resource_snapshot_job_identifier;
      [@ocaml.doc
        "The unique identifier of the resource snapshot job to be retrieved. This identifier is \
         crucial for pinpointing the specific job you want to query. \n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog related to the request. Valid values are:\n\n\
        \ {ul\n\
        \       {-   AWS: Retrieves the snapshot job from the production AWS environment. \n\
        \           \n\
        \            }\n\
        \       {-   Sandbox: Retrieves the snapshot job from a sandbox environment used for \
         testing or development purposes. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec engagement_prospecting_result = {
  message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A human-readable description of the failure for this engagement, including suggested \
         recovery steps. This field is only populated when [Status] is [FAILED].\n"]
  reason_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "An enumerated code indicating the reason this engagement failed to process. This field is \
         only populated when [Status] is [FAILED].\n"]
  status : prospecting_task_status;
      [@ocaml.doc
        "The processing status of this specific engagement. Possible values are [PENDING], \
         [IN_PROGRESS], [COMPLETED], and [FAILED].\n"]
  engagement_context_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The identifier of the prospecting context created for this engagement. This field is only \
         populated when the engagement was processed successfully (status is [COMPLETED]). Use \
         this identifier to reference the prospecting context in subsequent operations.\n"]
  engagement_identifier : engagement_identifier;
      [@ocaml.doc "The unique identifier of the engagement that was processed.\n"]
}
[@@ocaml.doc
  "Contains the result of processing a single engagement within a prospecting task. Each \
   engagement is processed independently, so individual engagements can succeed or fail regardless \
   of other engagements in the same task.\n"]

type nonrec engagement_prospecting_result_list = engagement_prospecting_result list [@@ocaml.doc ""]

type nonrec get_prospecting_from_engagement_task_response = {
  engagements : engagement_prospecting_result_list;
      [@ocaml.doc
        "An array of [EngagementProspectingResult] entries for each engagement in the task. Each \
         entry contains the processing status. For successfully completed engagements, includes \
         the prospecting context identifier. For failed engagements, includes an error code and \
         message.\n"]
  end_time : date_time option;
      [@ocaml.doc
        "The timestamp indicating when the task finished processing. This field is absent if the \
         task is still in progress. The format follows ISO 8601 date-time notation.\n"]
  start_time : date_time;
      [@ocaml.doc
        "The timestamp indicating when the task was initiated. The format follows ISO 8601 \
         date-time notation.\n"]
  task_name : task_name;
      [@ocaml.doc "The descriptive name of the task that you provided when you created it.\n"]
  task_arn : prospecting_task_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the task.\n"]
  task_id : prospecting_task_identifier; [@ocaml.doc "The unique identifier of the task.\n"]
}
[@@ocaml.doc
  "Represents the response structure containing the full details of a prospecting task, including \
   per-engagement processing results. Includes the [Status] field of each \
   [EngagementProspectingResult] entry to determine individual outcomes.\n"]

type nonrec get_prospecting_from_engagement_task_request = {
  task_identifier : prospecting_task_identifier;
      [@ocaml.doc
        "The unique identifier of the prospecting task to retrieve. This value is returned in the \
         [TaskId] field of the [StartProspectingFromEngagementTask] response.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog associated with the task. Specify [AWS] for production environments \
         and [Sandbox] for testing and development purposes. The value must match the catalog used \
         when the task was created.\n"]
}
[@@ocaml.doc
  "Represents the request structure for retrieving the status and results of a prospecting task.\n"]

type nonrec get_opportunity_response = {
  opportunity_team : partner_opportunity_team_members_list option;
      [@ocaml.doc
        "Represents the internal team handling the opportunity. Specify the members involved in \
         collaborating on this opportunity within the partner's organization.\n"]
  life_cycle : life_cycle option;
      [@ocaml.doc "An object that contains lifecycle details for the [Opportunity].\n"]
  related_entity_identifiers : related_entity_identifiers;
      [@ocaml.doc
        "Provides information about the associations of other entities with the opportunity. These \
         entities include identifiers for [AWSProducts], [Partner Solutions], and \
         [AWSMarketplaceOffers].\n"]
  created_date : date_time; [@ocaml.doc " [DateTime] when the [Opportunity] was last created.\n"]
  last_modified_date : date_time;
      [@ocaml.doc " [DateTime] when the opportunity was last modified.\n"]
  arn : opportunity_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) that uniquely identifies the opportunity.\n"]
  id : opportunity_identifier;
      [@ocaml.doc "Read-only, system generated [Opportunity] unique identifier.\n"]
  software_revenue : software_revenue option;
      [@ocaml.doc
        "Specifies details of a customer's procurement terms. Required only for partners in \
         eligible programs.\n"]
  marketing : marketing option;
      [@ocaml.doc "An object that contains marketing details for the [Opportunity].\n"]
  opportunity_type : opportunity_type option;
      [@ocaml.doc
        "Specifies the opportunity type as renewal, new, or expansion.\n\n\
        \ Opportunity types:\n\
        \ \n\
        \  {ul\n\
        \        {-  New opportunity: Represents a new business opportunity with a potential \
         customer that's not previously engaged with your solutions or services.\n\
        \            \n\
        \             }\n\
        \        {-  Renewal opportunity: Represents an opportunity to renew an existing contract \
         or subscription with a current customer, which helps to ensure service continuity.\n\
        \            \n\
        \             }\n\
        \        {-  Expansion opportunity: Represents an opportunity to expand the scope of a \
         customer's contract or subscription, either by adding new services or increasing the \
         volume of existing services.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  project : project option;
      [@ocaml.doc "An object that contains project details summary for the [Opportunity].\n"]
  customer : customer option;
      [@ocaml.doc "Specifies details of the customer associated with the [Opportunity].\n"]
  partner_opportunity_identifier : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Specifies the opportunity's unique identifier in the partner's CRM system. This value is \
         essential to track and reconcile because it's included in the outbound payload sent back \
         to the partner.\n"]
  national_security : national_security option;
      [@ocaml.doc
        "Indicates whether the [Opportunity] pertains to a national security project. This field \
         must be set to [true] only when the customer's industry is {i Government}. Additional \
         privacy and security measures apply during the review and management process for \
         opportunities marked as [NationalSecurity].\n"]
  primary_needs_from_aws : primary_needs_from_aws option;
      [@ocaml.doc
        "Identifies the type of support the partner needs from Amazon Web Services.\n\n\
        \ Valid values:\n\
        \ \n\
        \  {ul\n\
        \        {-  Cosell\226\128\148Architectural Validation: Confirmation from Amazon Web \
         Services that the partner's proposed solution architecture is aligned with Amazon Web \
         Services best practices and poses minimal architectural risks.\n\
        \            \n\
        \             }\n\
        \        {-  Cosell\226\128\148Business Presentation: Request Amazon Web Services seller's \
         participation in a joint customer presentation.\n\
        \            \n\
        \             }\n\
        \        {-  Cosell\226\128\148Competitive Information: Access to Amazon Web Services \
         competitive resources and support for the partner's proposed solution.\n\
        \            \n\
        \             }\n\
        \        {-  Cosell\226\128\148Pricing Assistance: Connect with an Amazon Web Services \
         seller for support situations where a partner may be receiving an upfront discount on a \
         service (for example: EDP deals).\n\
        \            \n\
        \             }\n\
        \        {-  Cosell\226\128\148Technical Consultation: Connect with an Amazon Web Services \
         Solutions Architect to address the partner's questions about the proposed solution.\n\
        \            \n\
        \             }\n\
        \        {-  Cosell\226\128\148Total Cost of Ownership Evaluation: Assistance with quoting \
         different cost savings of proposed solutions on Amazon Web Services versus on-premises or \
         a traditional hosting environment.\n\
        \            \n\
        \             }\n\
        \        {-  Cosell\226\128\148Deal Support: Request Amazon Web Services seller's support \
         to progress the opportunity (for example: joint customer call, strategic positioning).\n\
        \            \n\
        \             }\n\
        \        {-  Cosell\226\128\148Support for Public Tender/RFx: Opportunity related to the \
         public sector where the partner needs Amazon Web Services RFx support.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog associated with the request. This field takes a string value from a \
         predefined list: [AWS] or [Sandbox]. The catalog determines which environment the \
         opportunity information is retrieved from. Use [AWS] to retrieve opportunities in the \
         Amazon Web Services catalog, and [Sandbox] to retrieve opportunities in a secure and \
         isolated testing environment.\n"]
}
[@@ocaml.doc ""]

type nonrec get_opportunity_request = {
  identifier : opportunity_identifier;
      [@ocaml.doc "Read-only, system generated [Opportunity] unique identifier.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog associated with the request. This field takes a string value from a \
         predefined list: [AWS] or [Sandbox]. The catalog determines which environment the \
         opportunity is fetched from. Use [AWS] to retrieve opportunities in the Amazon Web \
         Services catalog, and [Sandbox] to retrieve opportunities in a secure, isolated testing \
         environment.\n"]
}
[@@ocaml.doc ""]

type nonrec engagement_description = string [@@ocaml.doc ""]

type nonrec engagement_context_payload =
  | ProspectingResult of prospecting_result
      [@ocaml.doc
        "Contains prospecting result data with enriched insights. The system generates these \
         insights when a partner runs an autonomous prospecting job on leads. This field appears \
         only when the context type is \"ProspectingResult\".\n"]
  | Lead of lead_context
      [@ocaml.doc
        "Contains detailed information about a lead when the context type is \"Lead\". This field \
         is present only when the Type in EngagementContextDetails is set to \"Lead\".\n"]
  | CustomerProject of customer_projects_context
      [@ocaml.doc
        "Contains detailed information about a customer project when the context type is \
         \"CustomerProject\". This field is present only when the Type in EngagementContextDetails \
         is set to \"CustomerProject\". \n"]
[@@ocaml.doc
  "Represents the payload of an Engagement context. The structure of this payload varies based on \
   the context type specified in the EngagementContextDetails. \n"]

type nonrec engagement_context_details = {
  payload : engagement_context_payload option;
      [@ocaml.doc
        "Contains the specific details of the Engagement context. The structure of this payload \
         varies depending on the Type field. \n"]
  type_ : engagement_context_type;
      [@ocaml.doc
        "Specifies the type of Engagement context. Valid values are \"CustomerProject\" or \
         \"Document\", indicating whether the context relates to a customer project or a document \
         respectively. \n"]
  id : engagement_context_identifier option;
      [@ocaml.doc
        "The unique identifier of the engagement context. This ID is used to reference and manage \
         the specific context within the engagement.\n"]
}
[@@ocaml.doc
  "Provides detailed context information for an Engagement. This structure allows for specifying \
   the type of context and its associated payload. \n"]

type nonrec engagement_contexts = engagement_context_details list [@@ocaml.doc ""]

type nonrec get_engagement_response = {
  contexts : engagement_contexts option;
      [@ocaml.doc
        "A list of context objects associated with the engagement. Each context provides \
         additional information related to the Engagement, such as customer projects or documents.\n"]
  modified_by : aws_account option;
      [@ocaml.doc
        "The AWS account ID of the user who last modified the engagement. This field helps track \
         who made the most recent changes to the engagement.\n"]
  modified_at : date_time option;
      [@ocaml.doc
        "The timestamp indicating when the engagement was last modified, in ISO 8601 format (UTC). \
         Example: \"2023-05-01T20:37:46Z\". This helps track the most recent changes to the \
         engagement.\n"]
  member_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Specifies the current count of members participating in the Engagement. This count \
         includes all active members regardless of their roles or permissions within the \
         Engagement.\n"]
  created_by : aws_account option;
      [@ocaml.doc
        "The AWS account ID of the user who originally created the engagement. This field helps in \
         tracking the origin of the engagement.\n"]
  created_at : date_time option;
      [@ocaml.doc
        "The date and time when the Engagement was created, presented in ISO 8601 format (UTC). \
         For example: \"2023-05-01T20:37:46Z\". This timestamp helps track the lifecycle of the \
         Engagement.\n"]
  description : engagement_description option;
      [@ocaml.doc
        "A more detailed description of the engagement. This provides additional context or \
         information about the engagement's purpose or scope.\n"]
  title : engagement_title option;
      [@ocaml.doc
        "The title of the engagement. It provides a brief, descriptive name for the engagement \
         that is meaningful and easily recognizable.\n"]
  arn : engagement_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the engagement retrieved.\n"]
  id : engagement_identifier option;
      [@ocaml.doc "The unique resource identifier of the engagement retrieved.\n"]
}
[@@ocaml.doc ""]

type nonrec get_engagement_request = {
  identifier : engagement_arn_or_identifier;
      [@ocaml.doc "Specifies the identifier of the Engagement record to retrieve.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog related to the engagement request. Valid values are [AWS] and \
         [Sandbox].\n"]
}
[@@ocaml.doc ""]

type nonrec engagement_member_summary = {
  website_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The URL of the member company's website. This offers a way to find more information about \
         the member organization and serves as an additional identifier. \n"]
  company_name : member_company_name option;
      [@ocaml.doc "The official name of the member's company or organization.\n"]
}
[@@ocaml.doc
  "The EngagementMemberSummary provides a snapshot of essential information about participants in \
   an AWS Partner Central Engagement. This compact data structure encapsulates key details of each \
   member, facilitating efficient collaboration and management within the Engagement. \n"]

type nonrec engagement_member_summaries = engagement_member_summary list [@@ocaml.doc ""]

type nonrec get_engagement_invitation_response = {
  existing_members : engagement_member_summaries option;
      [@ocaml.doc
        "A list of active members currently part of the Engagement. This array contains a maximum \
         of 10 members, each represented by an object with the following properties.\n\n\
        \ {ul\n\
        \       {-  CompanyName: The name of the member's company.\n\
        \           \n\
        \            }\n\
        \       {-  WebsiteUrl: The website URL of the member's company.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  engagement_description : engagement_description option;
      [@ocaml.doc "The description of the engagement associated with this invitation.\n"]
  invitation_message : invitation_message option;
      [@ocaml.doc "The message sent to the invited partner when the invitation was created.\n"]
  payload : payload option;
      [@ocaml.doc
        "Details of the engagement invitation payload, including specific data relevant to the \
         invitation's contents, such as customer information and opportunity insights.\n"]
  rejection_reason : rejection_reason_string option;
      [@ocaml.doc
        "If the engagement invitation was rejected, this field specifies the reason provided by \
         the partner for the rejection.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Indicates the catalog from which the engagement invitation details are retrieved. This \
         field helps in identifying the appropriate catalog (e.g., [AWS] or [Sandbox]) used in the \
         request.\n"]
  receiver : receiver option;
      [@ocaml.doc
        "Information about the partner organization or team that received the engagement \
         invitation, including contact details and identifiers.\n"]
  sender_company_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the AWS organization or team that sent the engagement invitation.\n"]
  sender_aws_account_id : aws_account option;
      [@ocaml.doc
        "Specifies the AWS Account ID of the sender, which identifies the AWS team responsible for \
         sharing the engagement invitation.\n"]
  expiration_date : date_time option;
      [@ocaml.doc
        "Indicates the date on which the engagement invitation will expire if not accepted by the \
         partner.\n"]
  invitation_date : date_time option;
      [@ocaml.doc "The date when the engagement invitation was sent to the partner.\n"]
  status : invitation_status option;
      [@ocaml.doc "The current status of the engagement invitation.\n"]
  engagement_title : engagement_title option;
      [@ocaml.doc
        "The title of the engagement invitation, summarizing the purpose or objectives of the \
         opportunity shared by AWS.\n"]
  engagement_id : engagement_identifier option;
      [@ocaml.doc
        "The identifier of the engagement associated with this invitation.This ID links the \
         invitation to its corresponding engagement.\n"]
  id : engagement_invitation_arn_or_identifier;
      [@ocaml.doc "Unique identifier assigned to the engagement invitation being retrieved.\n"]
  payload_type : engagement_invitation_payload_type option;
      [@ocaml.doc
        "The type of payload contained in the engagement invitation, indicating what data or \
         context the payload covers.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) that identifies the engagement invitation.\n"]
}
[@@ocaml.doc ""]

type nonrec get_engagement_invitation_request = {
  identifier : engagement_invitation_arn_or_identifier;
      [@ocaml.doc "Specifies the unique identifier for the retrieved engagement invitation.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog associated with the request. The field accepts values from the \
         predefined set: [AWS] for live operations or [Sandbox] for testing environments.\n"]
}
[@@ocaml.doc ""]

type nonrec get_aws_opportunity_summary_response = {
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog in which the AWS Opportunity exists. This is the environment (e.g., \
         [AWS] or [Sandbox]) where the opportunity is being managed.\n"]
  cosell_motion : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Engagement classification for this opportunity. Read-only. Null before scoring. Known \
         values: [AWS Field-engaged], [Agent-engaged], [Partner-led].\n"]
  project : aws_opportunity_project option;
      [@ocaml.doc
        "Provides details about the project associated with the AWS Opportunity, including the \
         customer\226\128\153s business problem, expected outcomes, and project scope. This \
         information is crucial for understanding the broader context of the opportunity.\n"]
  customer : aws_opportunity_customer option;
      [@ocaml.doc
        "Provides details about the customer associated with the AWS Opportunity, including \
         account information, industry, and other customer data. These details help partners \
         understand the business context of the opportunity.\n"]
  related_entity_ids : aws_opportunity_related_entities option;
      [@ocaml.doc
        "Lists related entity identifiers, such as AWS products or partner solutions, associated \
         with the AWS Opportunity. These identifiers provide additional context and help partners \
         understand which AWS services are involved.\n"]
  involvement_type_change_reason : involvement_type_change_reason option;
      [@ocaml.doc
        "Provides a reason for any changes in the involvement type of AWS in the opportunity. This \
         field is used to track why the level of AWS engagement has changed from [For Visibility \
         Only] to [Co-sell] offering transparency into the partnership dynamics.\n"]
  insights : aws_opportunity_insights option;
      [@ocaml.doc
        "Provides insights into the AWS Opportunity, including engagement score and recommended \
         actions that AWS suggests for the partner.\n"]
  opportunity_team : aws_opportunity_team_members_list option;
      [@ocaml.doc
        "Details the AWS opportunity team, including members involved. This information helps \
         partners know who from AWS is engaged and what their role is.\n"]
  life_cycle : aws_opportunity_life_cycle option;
      [@ocaml.doc
        "Contains lifecycle information for the AWS Opportunity, including review status, stage, \
         and target close date. This field is crucial for partners to monitor the progression of \
         the opportunity.\n"]
  visibility : visibility option;
      [@ocaml.doc
        "Defines the visibility level for the AWS Opportunity. Use [Full] visibility for most \
         cases, while [Limited] visibility is reserved for special programs or sensitive \
         opportunities.\n"]
  involvement_type : sales_involvement_type option;
      [@ocaml.doc
        "Specifies the type of involvement AWS has in the opportunity, such as direct cosell or \
         advisory support. This field helps partners understand the role AWS plays in advancing \
         the opportunity.\n"]
  origin : opportunity_origin option;
      [@ocaml.doc
        "Specifies whether the AWS Opportunity originated from AWS or the partner. This helps \
         distinguish between opportunities that were sourced by AWS and those referred by the \
         partner.\n"]
  related_opportunity_id : opportunity_identifier option;
      [@ocaml.doc
        "Provides the unique identifier of the related partner opportunity, allowing partners to \
         link the AWS Opportunity to their corresponding opportunity in their CRM system.\n"]
}
[@@ocaml.doc ""]

type nonrec get_aws_opportunity_summary_request = {
  related_opportunity_identifier : opportunity_identifier;
      [@ocaml.doc
        "The unique identifier for the related partner opportunity. Use this field to correlate an \
         AWS opportunity with its corresponding partner opportunity.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog in which the AWS Opportunity is located. Accepted values include \
         [AWS] for production opportunities or [Sandbox] for testing purposes. The catalog \
         determines which environment the opportunity data is pulled from.\n"]
}
[@@ocaml.doc ""]

type nonrec engagement_invitation_arn = string [@@ocaml.doc ""]

type nonrec engagement_invitation = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec engagement_from_opportunity_task = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec engagement_by_accepting_invitation_task = Smaws_Lib.CoreTypes.Resource.t
[@@ocaml.doc ""]

type nonrec engagement = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec disassociate_opportunity_request = {
  related_entity_identifier : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The related entity's identifier that you want to disassociate from the opportunity. \
         Depending on the type of entity, this could be a simple identifier or an Amazon Resource \
         Name (ARN) for entities managed through Amazon Web Services Marketplace.\n\n\
        \ For Amazon Web Services Marketplace entities, use the Amazon Web Services Marketplace \
         API to obtain the necessary ARNs. For guidance on retrieving these ARNs, see \
         {{:https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/welcome.html} \
         Amazon Web Services MarketplaceUsing the Amazon Web Services Marketplace Catalog API}.\n\
        \ \n\
        \  Validation: Ensure the identifier or ARN is valid and corresponds to an existing \
         entity. An incorrect or invalid identifier results in an error.\n\
        \  "]
  related_entity_type : related_entity_type;
      [@ocaml.doc
        "The type of the entity that you're disassociating from the opportunity. When you specify \
         the entity type, it helps the system correctly process the disassociation request to \
         ensure that the right connections are removed.\n\n\
        \ Examples of entity types include Partner Solution, Amazon Web Services product, and \
         Amazon Web Services Marketplaceoffer. Ensure that the value matches one of the expected \
         entity types.\n\
        \ \n\
        \  Validation: Provide a valid entity type to help ensure successful disassociation. An \
         invalid or incorrect entity type results in an error.\n\
        \  "]
  opportunity_identifier : opportunity_identifier;
      [@ocaml.doc
        "The opportunity's unique identifier for when you want to disassociate it from related \
         entities. This identifier helps to ensure that the correct opportunity is updated.\n\n\
        \ Validation: Ensure that the provided identifier corresponds to an existing opportunity \
         in the Amazon Web Services system because incorrect identifiers result in an error and no \
         changes are made.\n\
        \ "]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog associated with the request. This field takes a string value from a \
         predefined list: [AWS] or [Sandbox]. The catalog determines which environment the \
         opportunity disassociation is made in. Use [AWS] to disassociate opportunities in the \
         Amazon Web Services catalog, and [Sandbox] for testing in secure, isolated environments.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_resource_snapshot_job_request = {
  resource_snapshot_job_identifier : resource_snapshot_job_identifier;
      [@ocaml.doc " The unique identifier of the resource snapshot job to be deleted. \n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        " Specifies the catalog from which to delete the snapshot job. Valid values are [AWS] and \
         [Sandbox]. \n"]
}
[@@ocaml.doc ""]

type nonrec create_resource_snapshot_response = {
  revision : resource_snapshot_revision option;
      [@ocaml.doc
        " Specifies the revision number of the created snapshot. This field provides important \
         information about the snapshot's place in the sequence of snapshots for the given \
         resource. \n"]
  arn : resource_arn option;
      [@ocaml.doc
        " Specifies the Amazon Resource Name (ARN) that uniquely identifies the snapshot created. \n"]
}
[@@ocaml.doc ""]

type nonrec create_resource_snapshot_request = {
  client_token : client_token;
      [@ocaml.doc
        " Specifies a unique, client-generated UUID to ensure that the request is handled exactly \
         once. This token helps prevent duplicate snapshot creations. \n"]
  resource_snapshot_template_identifier : resource_template_name;
      [@ocaml.doc
        " The name of the template that defines the schema for the snapshot. This template \
         determines which subset of the resource data will be included in the snapshot. Must \
         correspond to an existing and valid template for the specified [ResourceType]. \n"]
  resource_identifier : resource_identifier;
      [@ocaml.doc
        " The unique identifier of the specific resource to be snapshotted. The format and \
         constraints of this identifier depend on the [ResourceType] specified. For example: For \
         [Opportunity] type, it will be an opportunity ID. \n"]
  resource_type : resource_type;
      [@ocaml.doc
        " Specifies the type of resource for which the snapshot is being created. This field \
         determines the structure and content of the snapshot. Must be one of the supported \
         resource types, such as: [Opportunity]. \n"]
  engagement_identifier : engagement_identifier;
      [@ocaml.doc
        " The unique identifier of the engagement associated with this snapshot. This field links \
         the snapshot to a specific engagement context. \n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        " Specifies the catalog where the snapshot is created. Valid values are [AWS] and \
         [Sandbox]. \n"]
}
[@@ocaml.doc ""]

type nonrec create_resource_snapshot_job_response = {
  arn : resource_snapshot_job_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the created snapshot job.\n"]
  id : resource_snapshot_job_identifier option;
      [@ocaml.doc "The unique identifier for the created snapshot job.\n"]
}
[@@ocaml.doc ""]

type nonrec create_resource_snapshot_job_request = {
  tags : tag_list option;
      [@ocaml.doc "A map of the key-value pairs of the tag or tags to assign.\n"]
  resource_snapshot_template_identifier : resource_template_name;
      [@ocaml.doc "Specifies the name of the template that defines the schema for the snapshot.\n"]
  resource_identifier : resource_identifier;
      [@ocaml.doc
        "Specifies the identifier of the specific resource to be snapshotted. The format depends \
         on the [ ResourceType].\n"]
  resource_type : resource_type;
      [@ocaml.doc
        "The type of resource for which the snapshot job is being created. Must be one of the \
         supported resource types i.e. [Opportunity] \n"]
  engagement_identifier : engagement_identifier;
      [@ocaml.doc
        "Specifies the identifier of the engagement associated with the resource to be snapshotted.\n"]
  client_token : client_token;
      [@ocaml.doc
        "A client-generated UUID used for idempotency check. The token helps prevent duplicate job \
         creations.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog in which to create the snapshot job. Valid values are [AWS] and [ \
         Sandbox].\n"]
}
[@@ocaml.doc ""]

type nonrec create_opportunity_response = {
  last_modified_date : date_time option;
      [@ocaml.doc
        " [DateTime] when the opportunity was last modified. When the [Opportunity] is created, \
         its value is [CreatedDate].\n"]
  partner_opportunity_identifier : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Specifies the opportunity's unique identifier in the partner's CRM system. This value is \
         essential to track and reconcile because it's included in the outbound payload sent back \
         to the partner.\n"]
  id : opportunity_identifier;
      [@ocaml.doc
        "Read-only, system-generated [Opportunity] unique identifier. Amazon Web Services creates \
         this identifier, and it's used for all subsequent opportunity actions, such as updates, \
         associations, and submissions. It helps to ensure that each opportunity is accurately \
         tracked and managed.\n"]
}
[@@ocaml.doc ""]

type nonrec create_opportunity_request = {
  tags : tag_list option;
      [@ocaml.doc "A map of the key-value pairs of the tag or tags to assign.\n"]
  opportunity_team : partner_opportunity_team_members_list option;
      [@ocaml.doc
        "Represents the internal team handling the opportunity. Specify collaborating members of \
         this opportunity who are within the partner's organization.\n"]
  origin : opportunity_origin option;
      [@ocaml.doc
        "Specifies the origin of the opportunity, indicating if it was sourced from Amazon Web \
         Services or the partner. For all opportunities created with [Catalog: AWS], this field \
         must only be [Partner Referral]. However, when using [Catalog: Sandbox], you can set this \
         field to [AWS Referral] to simulate Amazon Web Services referral creation. This allows \
         Amazon Web Services-originated flows testing in the sandbox catalog.\n"]
  life_cycle : life_cycle option;
      [@ocaml.doc "An object that contains lifecycle details for the [Opportunity].\n"]
  client_token : client_token;
      [@ocaml.doc
        "Required to be unique, and should be unchanging, it can be randomly generated or a \
         meaningful string.\n\n\
        \ Default: None\n\
        \ \n\
        \  Best practice: To help ensure uniqueness and avoid conflicts, use a Universally Unique \
         Identifier (UUID) as the [ClientToken]. You can use standard libraries from most \
         programming languages to generate this. If you use the same client token, the API returns \
         the following error: \"Conflicting client token submitted for a new request body.\"\n\
        \  "]
  software_revenue : software_revenue option;
      [@ocaml.doc
        "Specifies details of a customer's procurement terms. This is required only for partners \
         in eligible programs.\n"]
  marketing : marketing option;
      [@ocaml.doc "This object contains marketing details and is optional for an opportunity.\n"]
  opportunity_type : opportunity_type option;
      [@ocaml.doc
        "Specifies the opportunity type as a renewal, new, or expansion.\n\n\
        \ Opportunity types:\n\
        \ \n\
        \  {ul\n\
        \        {-  New opportunity: Represents a new business opportunity with a potential \
         customer that's not previously engaged with your solutions or services.\n\
        \            \n\
        \             }\n\
        \        {-  Renewal opportunity: Represents an opportunity to renew an existing contract \
         or subscription with a current customer, ensuring continuity of service.\n\
        \            \n\
        \             }\n\
        \        {-  Expansion opportunity: Represents an opportunity to expand the scope of an \
         existing contract or subscription, either by adding new services or increasing the volume \
         of existing services for a current customer.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  project : project option;
      [@ocaml.doc "An object that contains project details for the [Opportunity].\n"]
  customer : customer option;
      [@ocaml.doc "Specifies customer details associated with the [Opportunity].\n"]
  partner_opportunity_identifier : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Specifies the opportunity's unique identifier in the partner's CRM system. This value is \
         essential to track and reconcile because it's included in the outbound payload to the \
         partner.\n\n\
        \ This field allows partners to link an opportunity to their CRM, which helps to ensure \
         seamless integration and accurate synchronization between the Partner Central API and the \
         partner's internal systems.\n\
        \ "]
  national_security : national_security option;
      [@ocaml.doc
        "Indicates whether the [Opportunity] pertains to a national security project. This field \
         must be set to [true] only when the customer's industry is {i Government}. Additional \
         privacy and security measures apply during the review and management process for \
         opportunities marked as [NationalSecurity].\n"]
  primary_needs_from_aws : primary_needs_from_aws option;
      [@ocaml.doc
        "Identifies the type of support the partner needs from Amazon Web Services.\n\n\
        \ Valid values:\n\
        \ \n\
        \  {ul\n\
        \        {-  Cosell\226\128\148Architectural Validation: Confirmation from Amazon Web \
         Services that the partner's proposed solution architecture is aligned with Amazon Web \
         Services best practices and poses minimal architectural risks.\n\
        \            \n\
        \             }\n\
        \        {-  Cosell\226\128\148Business Presentation: Request Amazon Web Services seller's \
         participation in a joint customer presentation.\n\
        \            \n\
        \             }\n\
        \        {-  Cosell\226\128\148Competitive Information: Access to Amazon Web Services \
         competitive resources and support for the partner's proposed solution.\n\
        \            \n\
        \             }\n\
        \        {-  Cosell\226\128\148Pricing Assistance: Connect with an Amazon Web Services \
         seller for support situations where a partner may be receiving an upfront discount on a \
         service (for example: EDP deals).\n\
        \            \n\
        \             }\n\
        \        {-  Cosell\226\128\148Technical Consultation: Connect with an Amazon Web Services \
         Solutions Architect to address the partner's questions about the proposed solution.\n\
        \            \n\
        \             }\n\
        \        {-  Cosell\226\128\148Total Cost of Ownership Evaluation: Assistance with quoting \
         different cost savings of proposed solutions on Amazon Web Services versus on-premises or \
         a traditional hosting environment.\n\
        \            \n\
        \             }\n\
        \        {-  Cosell\226\128\148Deal Support: Request Amazon Web Services seller's support \
         to progress the opportunity (for example: joint customer call, strategic positioning).\n\
        \            \n\
        \             }\n\
        \        {-  Cosell\226\128\148Support for Public Tender/RFx: Opportunity related to the \
         public sector where the partner needs Amazon Web Services RFx support.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog associated with the request. This field takes a string value from a \
         predefined list: [AWS] or [Sandbox]. The catalog determines which environment the \
         opportunity is created in. Use [AWS] to create opportunities in the Amazon Web Services \
         catalog, and [Sandbox] for testing in secure, isolated environments.\n"]
}
[@@ocaml.doc ""]

type nonrec create_engagement_response = {
  modified_at : date_time option;
      [@ocaml.doc
        "The timestamp indicating when the engagement was last modified, in ISO 8601 format (UTC). \
         For newly created engagements, this value matches the creation timestamp. Example: \
         \"2023-05-01T20:37:46Z\".\n"]
  arn : engagement_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) that identifies the engagement.\n"]
  id : engagement_identifier option;
      [@ocaml.doc "Unique identifier assigned to the newly created engagement.\n"]
}
[@@ocaml.doc ""]

type nonrec create_engagement_request = {
  contexts : engagement_contexts option;
      [@ocaml.doc
        "The [Contexts] field is a required array of objects, with a maximum of 5 contexts \
         allowed, specifying detailed information about customer projects associated with the \
         Engagement. Each context object contains a [Type] field indicating the context type, \
         which must be [CustomerProject] in this version, and a [Payload] field containing the \
         [CustomerProject] details. The [CustomerProject] object is composed of two main \
         components: [Customer] and [Project]. The [Customer] object includes information such as \
         [CompanyName], [WebsiteUrl], [Industry], and [CountryCode], providing essential details \
         about the customer. The [Project] object contains [Title], [BusinessProblem], and \
         [TargetCompletionDate], offering insights into the specific project associated with the \
         customer. This structure allows comprehensive context to be included within the \
         Engagement, facilitating effective collaboration between parties by providing relevant \
         customer and project information.\n"]
  description : engagement_description; [@ocaml.doc "Provides a description of the [Engagement].\n"]
  title : engagement_title; [@ocaml.doc "Specifies the title of the [Engagement].\n"]
  client_token : client_token;
      [@ocaml.doc
        "The [CreateEngagementRequest$ClientToken] parameter specifies a unique, case-sensitive \
         identifier to ensure that the request is handled exactly once. The value must not exceed \
         sixty-four alphanumeric characters.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "The [CreateEngagementRequest$Catalog] parameter specifies the catalog related to the \
         engagement. Accepted values are [AWS] and [Sandbox], which determine the environment in \
         which the engagement is managed.\n"]
}
[@@ocaml.doc ""]

type nonrec create_engagement_invitation_response = {
  arn : engagement_invitation_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) that uniquely identifies the engagement invitation. \n"]
  id : engagement_invitation_identifier;
      [@ocaml.doc " Unique identifier assigned to the newly created engagement invitation. \n"]
}
[@@ocaml.doc ""]

type nonrec create_engagement_invitation_request = {
  invitation : invitation;
      [@ocaml.doc
        " The [Invitation] object all information necessary to initiate an engagement invitation \
         to a partner. It contains a personalized message from the sender, the invitation's \
         receiver, and a payload. The [Payload] can be the [OpportunityInvitation], which includes \
         detailed structures for sender contacts, partner responsibilities, customer information, \
         and project details, or [LeadInvitation], which includes structures for customer \
         information and interaction details. \n"]
  engagement_identifier : engagement_identifier;
      [@ocaml.doc
        " The unique identifier of the [Engagement] associated with the invitation. This parameter \
         ensures the invitation is created within the correct [Engagement] context. \n"]
  client_token : client_token;
      [@ocaml.doc
        " Specifies a unique, client-generated UUID to ensure that the request is handled exactly \
         once. This token helps prevent duplicate invitation creations. \n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        " Specifies the catalog related to the engagement. Accepted values are [AWS] and \
         [Sandbox], which determine the environment in which the engagement is managed. \n"]
}
[@@ocaml.doc ""]

type nonrec create_engagement_context_response = {
  context_id : engagement_context_identifier option;
      [@ocaml.doc
        "The unique identifier assigned to the newly created engagement context. This ID can be \
         used to reference the specific context within the engagement for future operations.\n"]
  engagement_last_modified_at : date_time option;
      [@ocaml.doc
        "The timestamp indicating when the engagement was last modified as a result of adding the \
         context, in ISO 8601 format (UTC). Example: \"2023-05-01T20:37:46Z\".\n"]
  engagement_arn : engagement_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the engagement to which the context was added. This \
         globally unique identifier can be used for cross-service references and IAM policies.\n"]
  engagement_id : engagement_identifier option;
      [@ocaml.doc
        "The unique identifier of the engagement to which the context was added. This ID confirms \
         the successful association of the context with the specified engagement.\n"]
}
[@@ocaml.doc ""]

type nonrec create_engagement_context_request = {
  payload : engagement_context_payload; [@ocaml.doc ""]
  type_ : engagement_context_type;
      [@ocaml.doc
        "Specifies the type of context being created for the engagement. This field determines the \
         structure and content of the context payload. Valid values include [CustomerProject] for \
         customer project-related contexts. The type field ensures that the context is properly \
         categorized and processed according to its intended purpose.\n"]
  client_token : client_token;
      [@ocaml.doc
        "A unique, case-sensitive identifier provided by the client to ensure that the request is \
         handled exactly once. This token helps prevent duplicate context creations and must not \
         exceed sixty-four alphanumeric characters. Use a UUID or other unique string to ensure \
         idempotency.\n"]
  engagement_identifier : engagement_arn_or_identifier;
      [@ocaml.doc
        "The unique identifier of the [Engagement] for which the context is being created. This \
         parameter ensures the context is associated with the correct engagement and provides the \
         necessary linkage between the engagement and its contextual information.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog associated with the engagement context request. This field takes a \
         string value from a predefined list: [AWS] or [Sandbox]. The catalog determines which \
         environment the engagement context is created in. Use [AWS] to create contexts in the \
         production environment, and [Sandbox] for testing in secure, isolated environments.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_opportunity_request = {
  related_entity_identifier : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "Requires the related entity's unique identifier when you want to associate it with the [ \
         Opportunity]. For Amazon Web Services Marketplace entities, provide the Amazon Resource \
         Name (ARN). Use the \
         {{:https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/welcome.html} \
         Amazon Web Services Marketplace API} to obtain the ARN.\n"]
  related_entity_type : related_entity_type;
      [@ocaml.doc
        "Specifies the entity type that you're associating with the [ Opportunity]. This helps to \
         categorize and properly process the association.\n"]
  opportunity_identifier : opportunity_identifier;
      [@ocaml.doc
        "Requires the [Opportunity]'s unique identifier when you want to associate it with a \
         related entity. Provide the correct identifier so the intended opportunity is updated \
         with the association.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog associated with the request. This field takes a string value from a \
         predefined list: [AWS] or [Sandbox]. The catalog determines which environment the \
         opportunity association is made in. Use [AWS] to associate opportunities in the Amazon \
         Web Services catalog, and [Sandbox] for testing in secure, isolated environments.\n"]
}
[@@ocaml.doc ""]

type nonrec assignee_contact = {
  business_title : job_title;
      [@ocaml.doc
        "Specifies the business title of the assignee managing the opportunity. This helps clarify \
         the individual's role and responsibilities within the organization. Use the value \
         [PartnerAccountManager] to update details of the opportunity owner.\n"]
  phone : phone_number option;
      [@ocaml.doc
        "Specifies the contact phone number of the assignee responsible for the opportunity or \
         engagement. This field enables direct communication for time-sensitive matters and \
         facilitates coordination between AWS and partner teams.\n"]
  last_name : name;
      [@ocaml.doc
        "Specifies the last name of the assignee managing the opportunity. The system \
         automatically retrieves this value from the user profile by referencing the associated \
         email address.\n"]
  first_name : name;
      [@ocaml.doc
        "Specifies the first name of the assignee managing the opportunity. The system \
         automatically retrieves this value from the user profile by referencing the associated \
         email address.\n"]
  email : email;
      [@ocaml.doc
        "Provides the email address of the assignee. This email is used for communications and \
         notifications related to the opportunity.\n"]
}
[@@ocaml.doc
  "Represents the contact details of the individual assigned to manage the opportunity within the \
   partner organization. This helps to ensure that there is a point of contact for the \
   opportunity's progress.\n"]

type nonrec assign_opportunity_request = {
  assignee : assignee_contact;
      [@ocaml.doc
        "Specifies the user or team member responsible for managing the assigned opportunity. This \
         field identifies the {i Assignee} based on the partner's internal team structure. Ensure \
         that the email address is associated with a registered user in your Partner Central \
         account.\n"]
  identifier : opportunity_identifier;
      [@ocaml.doc
        "Requires the [Opportunity]'s unique identifier when you want to assign it to another \
         user. Provide the correct identifier so the intended opportunity is reassigned.\n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "Specifies the catalog associated with the request. This field takes a string value from a \
         predefined list: [AWS] or [Sandbox]. The catalog determines which environment the \
         opportunity is assigned in. Use [AWS] to assign real opportunities in the Amazon Web \
         Services catalog, and [Sandbox] for testing in secure, isolated environments.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_engagement_invitation_request = {
  identifier : engagement_invitation_arn_or_identifier;
      [@ocaml.doc
        " The [Identifier] parameter in the [AcceptEngagementInvitationRequest] specifies the \
         unique identifier of the [EngagementInvitation] to be accepted. Providing the correct \
         identifier ensures that the intended invitation is accepted. \n"]
  catalog : catalog_identifier;
      [@ocaml.doc
        "The [CatalogType] parameter specifies the catalog associated with the engagement \
         invitation. Accepted values are [AWS] and [Sandbox], which determine the environment in \
         which the engagement invitation is managed.\n"]
}
[@@ocaml.doc ""]
