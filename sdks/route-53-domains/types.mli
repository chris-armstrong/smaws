type nonrec zip_code = string [@@ocaml.doc ""]

type nonrec page_marker = string [@@ocaml.doc ""]

type nonrec domain_name = string [@@ocaml.doc ""]

type nonrec operation_type =
  | RESTORE_DOMAIN [@ocaml.doc ""]
  | TRANSFER_ON_RENEW [@ocaml.doc ""]
  | RELEASE_TO_GANDI [@ocaml.doc ""]
  | INTERNAL_TRANSFER_IN_DOMAIN [@ocaml.doc ""]
  | INTERNAL_TRANSFER_OUT_DOMAIN [@ocaml.doc ""]
  | PUSH_DOMAIN [@ocaml.doc ""]
  | RENEW_DOMAIN [@ocaml.doc ""]
  | CHANGE_DOMAIN_OWNER [@ocaml.doc ""]
  | TRANSFER_OUT_DOMAIN [@ocaml.doc ""]
  | EXPIRE_DOMAIN [@ocaml.doc ""]
  | REMOVE_DNSSEC [@ocaml.doc ""]
  | ADD_DNSSEC [@ocaml.doc ""]
  | DISABLE_AUTORENEW [@ocaml.doc ""]
  | ENABLE_AUTORENEW [@ocaml.doc ""]
  | DOMAIN_LOCK [@ocaml.doc ""]
  | CHANGE_PRIVACY_PROTECTION [@ocaml.doc ""]
  | UPDATE_NAMESERVER [@ocaml.doc ""]
  | UPDATE_DOMAIN_CONTACT [@ocaml.doc ""]
  | TRANSFER_IN_DOMAIN [@ocaml.doc ""]
  | DELETE_DOMAIN [@ocaml.doc ""]
  | REGISTER_DOMAIN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec invoice_id = string [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec price = float [@@ocaml.doc ""]

type nonrec billing_record = {
  price : price option;
      [@ocaml.doc
        "The price that you were charged for the operation, in US dollars.\n\n\
        \ Example value: 12.0\n\
        \ "]
  bill_date : timestamp option;
      [@ocaml.doc "The date that the operation was billed, in Unix format.\n"]
  invoice_id : invoice_id option;
      [@ocaml.doc
        "Deprecated property. This field is retained in report structure for backwards \
         compatibility, but will appear blank.\n"]
  operation : operation_type option; [@ocaml.doc "The operation that you were charged for.\n"]
  domain_name : domain_name option;
      [@ocaml.doc
        "The name of the domain that the billing record applies to. If the domain name contains \
         characters other than a-z, 0-9, and - (hyphen), such as an internationalized domain name, \
         then this value is in Punycode. For more information, see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DomainNameFormat.html}DNS \
         Domain Name Format} in the {i Amazon Route 53 Developer Guide}.\n"]
}
[@@ocaml.doc "Information for one billing record.\n"]

type nonrec billing_records = billing_record list [@@ocaml.doc ""]

type nonrec view_billing_response = {
  billing_records : billing_records option; [@ocaml.doc "A summary of billing records.\n"]
  next_page_marker : page_marker option;
      [@ocaml.doc
        "If there are more billing records than you specified for [MaxItems] in the request, \
         submit another request and include the value of [NextPageMarker] in the value of [Marker].\n"]
}
[@@ocaml.doc "The ViewBilling response includes the following elements.\n"]

type nonrec page_max_items = int [@@ocaml.doc ""]

type nonrec view_billing_request = {
  max_items : page_max_items option;
      [@ocaml.doc "The number of billing records to be returned.\n\n Default: 20\n "]
  marker : page_marker option;
      [@ocaml.doc
        "For an initial request for a list of billing records, omit this element. If the number of \
         billing records that are associated with the current Amazon Web Services account during \
         the specified period is greater than the value that you specified for [MaxItems], you can \
         use [Marker] to return additional billing records. Get the value of [NextPageMarker] from \
         the previous response, and submit another request that includes the value of \
         [NextPageMarker] in the [Marker] element. \n\n\
        \ Constraints: The marker must match the value of [NextPageMarker] that was returned in \
         the previous response.\n\
        \ "]
  end_ : timestamp option;
      [@ocaml.doc
        "The end date and time for the time period for which you want a list of billing records. \
         Specify the date and time in Unix time format and Coordinated Universal time (UTC).\n"]
  start : timestamp option;
      [@ocaml.doc
        "The beginning date and time for the time period for which you want a list of billing \
         records. Specify the date and time in Unix time format and Coordinated Universal time \
         (UTC).\n"]
}
[@@ocaml.doc "The ViewBilling request includes the following elements.\n"]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec invalid_input = {
  message : error_message option;
      [@ocaml.doc
        "The requested item is not acceptable. For example, for an OperationId it might refer to \
         the ID of an operation that is already completed. For a domain name, it might not be a \
         valid domain name or belong to the requester account.\n"]
}
[@@ocaml.doc
  "The requested item is not acceptable. For example, for APIs that accept a domain name, the \
   request might specify a domain name that doesn't belong to the account that submitted the \
   request. For [AcceptDomainTransferFromAnotherAwsAccount], the password might be invalid.\n"]

type nonrec value = string [@@ocaml.doc ""]

type nonrec values = value list [@@ocaml.doc ""]

type nonrec update_tags_for_domain_response = unit [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value option;
      [@ocaml.doc
        "The value of a tag.\n\n\
        \ Valid values: A-Z, a-z, 0-9, space, \".:/=+\\-\\@\"\n\
        \ \n\
        \  Constraints: Each value can be 0-256 characters long.\n\
        \  "]
  key : tag_key option;
      [@ocaml.doc
        "The key (name) of a tag.\n\n\
        \ Valid values: A-Z, a-z, 0-9, space, \".:/=+\\-\\@\"\n\
        \ \n\
        \  Constraints: Each key can be 1-128 characters long.\n\
        \  "]
}
[@@ocaml.doc "Each tag includes the following elements.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec update_tags_for_domain_request = {
  tags_to_update : tag_list option;
      [@ocaml.doc
        "A list of the tag keys and values that you want to add or update. If you specify a key \
         that already exists, the corresponding value will be replaced.\n"]
  domain_name : domain_name; [@ocaml.doc "The domain for which you want to add or update tags.\n"]
}
[@@ocaml.doc "The UpdateTagsForDomainRequest includes the following elements.\n"]

type nonrec unsupported_tl_d = {
  message : error_message option;
      [@ocaml.doc "Amazon Route 53 does not support this top-level domain (TLD).\n"]
}
[@@ocaml.doc "Amazon Route 53 does not support this top-level domain (TLD).\n"]

type nonrec operation_limit_exceeded = {
  message : error_message option;
      [@ocaml.doc
        "The number of operations or jobs running exceeded the allowed threshold for the account.\n"]
}
[@@ocaml.doc
  "The number of operations or jobs running exceeded the allowed threshold for the account.\n"]

type nonrec operation_id = string [@@ocaml.doc ""]

type nonrec update_domain_nameservers_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "Identifier for tracking the progress of the request. To query the operation status, use \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html}GetOperationDetail}.\n"]
}
[@@ocaml.doc "The UpdateDomainNameservers response includes the following element.\n"]

type nonrec fi_auth_key = string [@@ocaml.doc ""]

type nonrec host_name = string [@@ocaml.doc ""]

type nonrec glue_ip = string [@@ocaml.doc ""]

type nonrec glue_ip_list = glue_ip list [@@ocaml.doc ""]

type nonrec nameserver = {
  glue_ips : glue_ip_list option;
      [@ocaml.doc
        "Glue IP address of a name server entry. Glue IP addresses are required only when the name \
         of the name server is a subdomain of the domain. For example, if your domain is \
         example.com and the name server for the domain is ns.example.com, you need to specify the \
         IP address for ns.example.com.\n\n\
        \ Constraints: The list can contain only one IPv4 and one IPv6 address.\n\
        \ "]
  name : host_name;
      [@ocaml.doc
        "The fully qualified host name of the name server.\n\n\
        \ Constraint: Maximum 255 characters\n\
        \ "]
}
[@@ocaml.doc "Name server includes the following elements.\n"]

type nonrec nameserver_list = nameserver list [@@ocaml.doc ""]

type nonrec update_domain_nameservers_request = {
  nameservers : nameserver_list; [@ocaml.doc "A list of new name servers for the domain.\n"]
  fi_auth_key : fi_auth_key option; [@ocaml.doc "The authorization key for .fi domains\n"]
  domain_name : domain_name;
      [@ocaml.doc "The name of the domain that you want to change name servers for.\n"]
}
[@@ocaml.doc
  "Replaces the current set of name servers for the domain with the specified set of name servers. \
   If you use Amazon Route 53 as your DNS service, specify the four name servers in the delegation \
   set for the hosted zone for the domain.\n\n\
  \ If successful, this operation returns an operation ID that you can use to track the progress \
   and completion of the action. If the request is not completed successfully, the domain \
   registrant will be notified by email. \n\
  \ "]

type nonrec tld_rules_violation = {
  message : error_message option;
      [@ocaml.doc "The top-level domain does not support this operation.\n"]
}
[@@ocaml.doc "The top-level domain does not support this operation.\n"]

type nonrec request_id = string [@@ocaml.doc ""]

type nonrec duplicate_request = {
  message : error_message option;
      [@ocaml.doc "The request is already in progress for the domain.\n"]
  request_id : request_id option; [@ocaml.doc "ID of the request operation.\n"]
}
[@@ocaml.doc "The request is already in progress for the domain.\n"]

type nonrec update_domain_contact_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "Identifier for tracking the progress of the request. To query the operation status, use \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html}GetOperationDetail}.\n"]
}
[@@ocaml.doc "The UpdateDomainContact response includes the following element.\n"]

type nonrec contact_name = string [@@ocaml.doc ""]

type nonrec contact_type =
  | RESELLER [@ocaml.doc ""]
  | PUBLIC_BODY [@ocaml.doc ""]
  | ASSOCIATION [@ocaml.doc ""]
  | COMPANY [@ocaml.doc ""]
  | PERSON [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec address_line = string [@@ocaml.doc ""]

type nonrec city = string [@@ocaml.doc ""]

type nonrec state = string [@@ocaml.doc ""]

type nonrec country_code =
  | ZW [@ocaml.doc ""]
  | ZM [@ocaml.doc ""]
  | ZA [@ocaml.doc ""]
  | YT [@ocaml.doc ""]
  | YE [@ocaml.doc ""]
  | WS [@ocaml.doc ""]
  | WF [@ocaml.doc ""]
  | VU [@ocaml.doc ""]
  | VN [@ocaml.doc ""]
  | VI [@ocaml.doc ""]
  | VG [@ocaml.doc ""]
  | VE [@ocaml.doc ""]
  | VC [@ocaml.doc ""]
  | VA [@ocaml.doc ""]
  | UZ [@ocaml.doc ""]
  | UY [@ocaml.doc ""]
  | US [@ocaml.doc ""]
  | UG [@ocaml.doc ""]
  | UA [@ocaml.doc ""]
  | TZ [@ocaml.doc ""]
  | TW [@ocaml.doc ""]
  | TV [@ocaml.doc ""]
  | TT [@ocaml.doc ""]
  | TR [@ocaml.doc ""]
  | TP [@ocaml.doc ""]
  | TO [@ocaml.doc ""]
  | TN [@ocaml.doc ""]
  | TM [@ocaml.doc ""]
  | TL [@ocaml.doc ""]
  | TK [@ocaml.doc ""]
  | TJ [@ocaml.doc ""]
  | TH [@ocaml.doc ""]
  | TG [@ocaml.doc ""]
  | TF [@ocaml.doc ""]
  | TD [@ocaml.doc ""]
  | TC [@ocaml.doc ""]
  | SZ [@ocaml.doc ""]
  | SY [@ocaml.doc ""]
  | SX [@ocaml.doc ""]
  | SV [@ocaml.doc ""]
  | ST [@ocaml.doc ""]
  | SS [@ocaml.doc ""]
  | SR [@ocaml.doc ""]
  | SO [@ocaml.doc ""]
  | SN [@ocaml.doc ""]
  | SM [@ocaml.doc ""]
  | SL [@ocaml.doc ""]
  | SK [@ocaml.doc ""]
  | SJ [@ocaml.doc ""]
  | SI [@ocaml.doc ""]
  | SH [@ocaml.doc ""]
  | SG [@ocaml.doc ""]
  | SE [@ocaml.doc ""]
  | SD [@ocaml.doc ""]
  | SC [@ocaml.doc ""]
  | SB [@ocaml.doc ""]
  | SA [@ocaml.doc ""]
  | RW [@ocaml.doc ""]
  | RU [@ocaml.doc ""]
  | RS [@ocaml.doc ""]
  | RO [@ocaml.doc ""]
  | RE [@ocaml.doc ""]
  | QA [@ocaml.doc ""]
  | PY [@ocaml.doc ""]
  | PW [@ocaml.doc ""]
  | PT [@ocaml.doc ""]
  | PS [@ocaml.doc ""]
  | PR [@ocaml.doc ""]
  | PN [@ocaml.doc ""]
  | PM [@ocaml.doc ""]
  | PL [@ocaml.doc ""]
  | PK [@ocaml.doc ""]
  | PH [@ocaml.doc ""]
  | PG [@ocaml.doc ""]
  | PF [@ocaml.doc ""]
  | PE [@ocaml.doc ""]
  | PA [@ocaml.doc ""]
  | OM [@ocaml.doc ""]
  | NZ [@ocaml.doc ""]
  | NU [@ocaml.doc ""]
  | NR [@ocaml.doc ""]
  | NP [@ocaml.doc ""]
  | NO [@ocaml.doc ""]
  | NL [@ocaml.doc ""]
  | NI [@ocaml.doc ""]
  | NG [@ocaml.doc ""]
  | NF [@ocaml.doc ""]
  | NE [@ocaml.doc ""]
  | NC [@ocaml.doc ""]
  | NA [@ocaml.doc ""]
  | MZ [@ocaml.doc ""]
  | MY [@ocaml.doc ""]
  | MX [@ocaml.doc ""]
  | MW [@ocaml.doc ""]
  | MV [@ocaml.doc ""]
  | MU [@ocaml.doc ""]
  | MT [@ocaml.doc ""]
  | MS [@ocaml.doc ""]
  | MR [@ocaml.doc ""]
  | MQ [@ocaml.doc ""]
  | MP [@ocaml.doc ""]
  | MO [@ocaml.doc ""]
  | MN [@ocaml.doc ""]
  | MM [@ocaml.doc ""]
  | ML [@ocaml.doc ""]
  | MK [@ocaml.doc ""]
  | MH [@ocaml.doc ""]
  | MG [@ocaml.doc ""]
  | MF [@ocaml.doc ""]
  | ME [@ocaml.doc ""]
  | MD [@ocaml.doc ""]
  | MC [@ocaml.doc ""]
  | MA [@ocaml.doc ""]
  | LY [@ocaml.doc ""]
  | LV [@ocaml.doc ""]
  | LU [@ocaml.doc ""]
  | LT [@ocaml.doc ""]
  | LS [@ocaml.doc ""]
  | LR [@ocaml.doc ""]
  | LK [@ocaml.doc ""]
  | LI [@ocaml.doc ""]
  | LC [@ocaml.doc ""]
  | LB [@ocaml.doc ""]
  | LA [@ocaml.doc ""]
  | KZ [@ocaml.doc ""]
  | KY [@ocaml.doc ""]
  | KW [@ocaml.doc ""]
  | KR [@ocaml.doc ""]
  | KP [@ocaml.doc ""]
  | KN [@ocaml.doc ""]
  | KM [@ocaml.doc ""]
  | KI [@ocaml.doc ""]
  | KH [@ocaml.doc ""]
  | KG [@ocaml.doc ""]
  | KE [@ocaml.doc ""]
  | JP [@ocaml.doc ""]
  | JO [@ocaml.doc ""]
  | JM [@ocaml.doc ""]
  | JE [@ocaml.doc ""]
  | IT [@ocaml.doc ""]
  | IS [@ocaml.doc ""]
  | IR [@ocaml.doc ""]
  | IQ [@ocaml.doc ""]
  | IO [@ocaml.doc ""]
  | IN [@ocaml.doc ""]
  | IM [@ocaml.doc ""]
  | IL [@ocaml.doc ""]
  | IE [@ocaml.doc ""]
  | ID [@ocaml.doc ""]
  | HU [@ocaml.doc ""]
  | HT [@ocaml.doc ""]
  | HR [@ocaml.doc ""]
  | HN [@ocaml.doc ""]
  | HM [@ocaml.doc ""]
  | HK [@ocaml.doc ""]
  | GY [@ocaml.doc ""]
  | GW [@ocaml.doc ""]
  | GU [@ocaml.doc ""]
  | GT [@ocaml.doc ""]
  | GS [@ocaml.doc ""]
  | GR [@ocaml.doc ""]
  | GQ [@ocaml.doc ""]
  | GP [@ocaml.doc ""]
  | GN [@ocaml.doc ""]
  | GM [@ocaml.doc ""]
  | GL [@ocaml.doc ""]
  | GI [@ocaml.doc ""]
  | GH [@ocaml.doc ""]
  | GG [@ocaml.doc ""]
  | GF [@ocaml.doc ""]
  | GE [@ocaml.doc ""]
  | GD [@ocaml.doc ""]
  | GB [@ocaml.doc ""]
  | GA [@ocaml.doc ""]
  | FR [@ocaml.doc ""]
  | FO [@ocaml.doc ""]
  | FM [@ocaml.doc ""]
  | FK [@ocaml.doc ""]
  | FJ [@ocaml.doc ""]
  | FI [@ocaml.doc ""]
  | ET [@ocaml.doc ""]
  | ES [@ocaml.doc ""]
  | ER [@ocaml.doc ""]
  | EH [@ocaml.doc ""]
  | EG [@ocaml.doc ""]
  | EE [@ocaml.doc ""]
  | EC [@ocaml.doc ""]
  | DZ [@ocaml.doc ""]
  | DO [@ocaml.doc ""]
  | DM [@ocaml.doc ""]
  | DK [@ocaml.doc ""]
  | DJ [@ocaml.doc ""]
  | DE [@ocaml.doc ""]
  | CZ [@ocaml.doc ""]
  | CY [@ocaml.doc ""]
  | CX [@ocaml.doc ""]
  | CW [@ocaml.doc ""]
  | CV [@ocaml.doc ""]
  | CU [@ocaml.doc ""]
  | CR [@ocaml.doc ""]
  | CO [@ocaml.doc ""]
  | CN [@ocaml.doc ""]
  | CM [@ocaml.doc ""]
  | CL [@ocaml.doc ""]
  | CK [@ocaml.doc ""]
  | CI [@ocaml.doc ""]
  | CH [@ocaml.doc ""]
  | CG [@ocaml.doc ""]
  | CF [@ocaml.doc ""]
  | CD [@ocaml.doc ""]
  | CC [@ocaml.doc ""]
  | CA [@ocaml.doc ""]
  | BZ [@ocaml.doc ""]
  | BY [@ocaml.doc ""]
  | BW [@ocaml.doc ""]
  | BV [@ocaml.doc ""]
  | BT [@ocaml.doc ""]
  | BS [@ocaml.doc ""]
  | BR [@ocaml.doc ""]
  | BQ [@ocaml.doc ""]
  | BO [@ocaml.doc ""]
  | BN [@ocaml.doc ""]
  | BM [@ocaml.doc ""]
  | BL [@ocaml.doc ""]
  | BJ [@ocaml.doc ""]
  | BI [@ocaml.doc ""]
  | BH [@ocaml.doc ""]
  | BG [@ocaml.doc ""]
  | BF [@ocaml.doc ""]
  | BE [@ocaml.doc ""]
  | BD [@ocaml.doc ""]
  | BB [@ocaml.doc ""]
  | BA [@ocaml.doc ""]
  | AZ [@ocaml.doc ""]
  | AX [@ocaml.doc ""]
  | AW [@ocaml.doc ""]
  | AU [@ocaml.doc ""]
  | AT [@ocaml.doc ""]
  | AS [@ocaml.doc ""]
  | AR [@ocaml.doc ""]
  | AQ [@ocaml.doc ""]
  | AO [@ocaml.doc ""]
  | AN [@ocaml.doc ""]
  | AM [@ocaml.doc ""]
  | AL [@ocaml.doc ""]
  | AI [@ocaml.doc ""]
  | AG [@ocaml.doc ""]
  | AF [@ocaml.doc ""]
  | AE [@ocaml.doc ""]
  | AD [@ocaml.doc ""]
  | AC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec contact_number = string [@@ocaml.doc ""]

type nonrec email = string [@@ocaml.doc ""]

type nonrec extra_param_name =
  | AU_REGISTRANT_NAME [@ocaml.doc ""]
  | AU_POLICY_REASON [@ocaml.doc ""]
  | AU_ELIGIBILITY_TYPE [@ocaml.doc ""]
  | AU_PRIORITY_TOKEN [@ocaml.doc ""]
  | EU_COUNTRY_OF_CITIZENSHIP [@ocaml.doc ""]
  | UK_COMPANY_NUMBER [@ocaml.doc ""]
  | UK_CONTACT_TYPE [@ocaml.doc ""]
  | VAT_NUMBER [@ocaml.doc ""]
  | SG_ID_NUMBER [@ocaml.doc ""]
  | SE_ID_NUMBER [@ocaml.doc ""]
  | RU_PASSPORT_DATA [@ocaml.doc ""]
  | IT_REGISTRANT_ENTITY_TYPE [@ocaml.doc ""]
  | IT_PIN [@ocaml.doc ""]
  | IT_NATIONALITY [@ocaml.doc ""]
  | FI_ORGANIZATION_TYPE [@ocaml.doc ""]
  | FI_NATIONALITY [@ocaml.doc ""]
  | ONWER_FI_ID_NUMBER [@ocaml.doc ""]
  | FI_BUSINESS_NUMBER [@ocaml.doc ""]
  | ES_LEGAL_FORM [@ocaml.doc ""]
  | ES_IDENTIFICATION_TYPE [@ocaml.doc ""]
  | ES_IDENTIFICATION [@ocaml.doc ""]
  | CA_LEGAL_REPRESENTATIVE_CAPACITY [@ocaml.doc ""]
  | CA_LEGAL_REPRESENTATIVE [@ocaml.doc ""]
  | CA_BUSINESS_ENTITY_TYPE [@ocaml.doc ""]
  | CA_LEGAL_TYPE [@ocaml.doc ""]
  | AU_ID_TYPE [@ocaml.doc ""]
  | AU_ID_NUMBER [@ocaml.doc ""]
  | DOCUMENT_NUMBER [@ocaml.doc ""]
  | BIRTH_CITY [@ocaml.doc ""]
  | BIRTH_COUNTRY [@ocaml.doc ""]
  | BIRTH_DATE_IN_YYYY_MM_DD [@ocaml.doc ""]
  | BIRTH_DEPARTMENT [@ocaml.doc ""]
  | BRAND_NUMBER [@ocaml.doc ""]
  | DUNS_NUMBER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec extra_param_value = string [@@ocaml.doc ""]

type nonrec extra_param = {
  value : extra_param_value;
      [@ocaml.doc "The value that corresponds with the name of an extra parameter.\n"]
  name : extra_param_name;
      [@ocaml.doc
        "The name of an additional parameter that is required by a top-level domain. Here are the \
         top-level domains that require additional parameters and the names of the parameters that \
         they require:\n\n\
        \  .au, .com.au, and .net.au  {ul\n\
        \                                   {-   [AU_REGISTRANT_NAME] \n\
        \                                       \n\
        \                                        }\n\
        \                                   {-   [AU_ID_NUMBER] \n\
        \                                       \n\
        \                                        }\n\
        \                                   {-   [AU_ID_TYPE] \n\
        \                                       \n\
        \                                        Valid values include the following:\n\
        \                                        \n\
        \                                         {ul\n\
        \                                               {-   [ABN] (Australian business number)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-   [ACN] (Australian company number)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-   [TM] (Trademark number)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               \n\
        \                                    }\n\
        \                                     }\n\
        \                                   {-   [AU_ELIGIBILITY_TYPE] \n\
        \                                       \n\
        \                                        Valid values include the following:\n\
        \                                        \n\
        \                                         {ul\n\
        \                                               {-  CHARITABLE_TRUST (Charitable trust)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  CHARITY (Charity)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  CHILD_CARE_CENTRE (Child care centre)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  CLUB (Club)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  COMMERCIAL_STATUTORY_BODY (Commercial \
         statutory body)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  COMMONWEALTH_ENTITY (Commonwealth \
         entity)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  COMPANY (Company)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  COMPANY_LIMITED_BY_GUARANTEE (Company \
         limited by guarantee)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  EDUCATIONAL_INSTITUTION (Educational \
         institution)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  GOVERNMENT_SCHOOL (Government school)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  HIGHER_EDUCATION_INSTITUTION (Higher \
         education institution)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  INCORPORATED_ASSOCIATION (Incorporated \
         association)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  INDIGENOUS_CORPORATION (Indigenous \
         corporation)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  INDUSTRY_BODY (Industry body)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  INDUSTRY_ORGANISATION (Industry \
         association)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  NATIONAL_BODY (National body)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  NON_DISTRIBUTING_COOPERATIVE \
         (Non-distributing cooperative)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  NON_GOVERNMENT_SCHOOL (Non-government \
         school)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  NON_PROFIT_ORGANISATION (Non-profit \
         organisation)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  NON_TRADING_COOPERATIVE (Non-trading \
         cooperative)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  NOT_FOR_PROFIT_COMMUNITY_GROUP \
         (Not-for-profit community group)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  PARTNERSHIP (Partnership)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  PEAK_STATE_TERRITORY_BODY (Peak \
         state/territory body)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  PENDING_TM_OWNER (Pending TM owner)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  POLITICAL_PARTY (Political party)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  PRESCHOOL (Pre-school)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  PUBLIC_PRIVATE_ANCILLARY_FUND \
         (Public/private ancillary fund)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  REGISTERED_BUSINESS (Registered \
         business)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  REGISTERED_ORGANISATION (Registered \
         organisation)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  REGISTRABLE_BODY (Registrable body)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  RESEARCH_ORGANISATION (Research \
         organisation)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  STATUTORY_BODY (Statutory body)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  TRADE_UNION (Trade union)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  TRADEMARK_OWNER (Trademark owner)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  TRADING_COOPERATIVE (Trading \
         cooperative)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  TRAINING_ORGANISATION (Training \
         organisation)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  TRUST (Trust)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  UNINCORPORATED_ASSOCIATION \
         (Unincorporated association)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  EDUCATION_AND_CARE_SERVICES_CHILDCARE \
         (Education and care services (child care))\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  GOVERNMENT_BODY (Government body)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  PROVIDER_OF_NON_ACCREDITED_TRAINING \
         (Provider of non-accredited training)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  RELIGIOUS_CHURCH_GROUP \
         (Religious/church group)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               {-  SOLE_TRADER (Sole trader)\n\
        \                                                   \n\
        \                                                    }\n\
        \                                               \n\
        \                                    }\n\
        \                                     }\n\
        \                                   {-   [AU_POLICY_REASON] \n\
        \                                       \n\
        \                                        Valid values include the following:\n\
        \                                        \n\
        \                                         {ul\n\
        \                                               {-   [POLICY_REASON_1] \n\
        \                                                   \n\
        \                                                     [POLICY_REASON_2] \n\
        \                                                    \n\
        \                                                     }\n\
        \                                               \n\
        \                                    }\n\
        \                                     }\n\
        \                                   }\n\
        \    .ca  {ul\n\
        \               {-   [BRAND_NUMBER] \n\
        \                   \n\
        \                    }\n\
        \               {-   [CA_BUSINESS_ENTITY_TYPE] \n\
        \                   \n\
        \                    Valid values include the following:\n\
        \                    \n\
        \                     {ul\n\
        \                           {-   [BANK] (Bank)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [COMMERCIAL_COMPANY] (Commercial company)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [COMPANY] (Company)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [COOPERATION] (Cooperation)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [COOPERATIVE] (Cooperative)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [COOPRIX] (Cooprix)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [CORP] (Corporation)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [CREDIT_UNION] (Credit union)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [FOMIA] (Federation of mutual insurance associations)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [INC] (Incorporated)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [LTD] (Limited)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [LTEE] (Limit\195\169e)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [LLC] (Limited liability corporation)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [LLP] (Limited liability partnership)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [LTE] (Lte.)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [MBA] (Mutual benefit association)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [MIC] (Mutual insurance company)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [NFP] (Not-for-profit corporation)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [SA] (S.A.)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [SAVINGS_COMPANY] (Savings company)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [SAVINGS_UNION] (Savings union)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [SARL] (Soci\195\169t\195\169 \195\160 \
         responsabilit\195\169 limit\195\169e)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [TRUST] (Trust)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [ULC] (Unlimited liability corporation)\n\
        \                               \n\
        \                                }\n\
        \                           \n\
        \                }\n\
        \                 }\n\
        \               {-   [CA_LEGAL_TYPE] \n\
        \                   \n\
        \                    When [ContactType] is [PERSON], valid values include the following:\n\
        \                    \n\
        \                     {ul\n\
        \                           {-   [ABO] (Aboriginal Peoples indigenous to Canada)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [CCT] (Canadian citizen)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [LGR] (Legal Representative of a Canadian Citizen or \
         Permanent Resident)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [RES] (Permanent resident of Canada)\n\
        \                               \n\
        \                                }\n\
        \                           \n\
        \                }\n\
        \                 When [ContactType] is a value other than [PERSON], valid values include \
         the following:\n\
        \                 \n\
        \                  {ul\n\
        \                        {-   [ASS] (Canadian unincorporated association)\n\
        \                            \n\
        \                             }\n\
        \                        {-   [CCO] (Canadian corporation)\n\
        \                            \n\
        \                             }\n\
        \                        {-   [EDU] (Canadian educational institution)\n\
        \                            \n\
        \                             }\n\
        \                        {-   [GOV] (Government or government entity in Canada)\n\
        \                            \n\
        \                             }\n\
        \                        {-   [HOP] (Canadian Hospital)\n\
        \                            \n\
        \                             }\n\
        \                        {-   [INB] (Indian Band recognized by the Indian Act of Canada)\n\
        \                            \n\
        \                             }\n\
        \                        {-   [LAM] (Canadian Library, Archive, or Museum)\n\
        \                            \n\
        \                             }\n\
        \                        {-   [MAJ] (Her/His Majesty the Queen/King)\n\
        \                            \n\
        \                             }\n\
        \                        {-   [OMK] (Official mark registered in Canada)\n\
        \                            \n\
        \                             }\n\
        \                        {-   [PLT] (Canadian Political Party)\n\
        \                            \n\
        \                             }\n\
        \                        {-   [PRT] (Partnership Registered in Canada)\n\
        \                            \n\
        \                             }\n\
        \                        {-   [TDM] (Trademark registered in Canada)\n\
        \                            \n\
        \                             }\n\
        \                        {-   [TRD] (Canadian Trade Union)\n\
        \                            \n\
        \                             }\n\
        \                        {-   [TRS] (Trust established in Canada)\n\
        \                            \n\
        \                             }\n\
        \                        \n\
        \                }\n\
        \                 }\n\
        \               }\n\
        \    .es  {ul\n\
        \               {-   [ES_IDENTIFICATION] \n\
        \                   \n\
        \                    The value of [ES_IDENTIFICATION] depends on the following values:\n\
        \                    \n\
        \                     {ul\n\
        \                           {-  The value of [ES_LEGAL_FORM] \n\
        \                               \n\
        \                                }\n\
        \                           {-  The value of [ES_IDENTIFICATION_TYPE] \n\
        \                               \n\
        \                                }\n\
        \                           \n\
        \                }\n\
        \                  {b If [ES_LEGAL_FORM] is any value other than [INDIVIDUAL]:} \n\
        \                 \n\
        \                  {ul\n\
        \                        {-  Specify 1 letter + 8 numbers (CIF \\[Certificado de \
         Identificaci\195\179n Fiscal\\])\n\
        \                            \n\
        \                             }\n\
        \                        {-  Example: B12345678\n\
        \                            \n\
        \                             }\n\
        \                        \n\
        \                }\n\
        \                  {b If [ES_LEGAL_FORM] is [INDIVIDUAL], the value that you specify for \
         [ES_IDENTIFICATION] depends on the value of [ES_IDENTIFICATION_TYPE]:} \n\
        \                 \n\
        \                  {ul\n\
        \                        {-  If [ES_IDENTIFICATION_TYPE] is [DNI_AND_NIF] (for Spanish \
         contacts):\n\
        \                            \n\
        \                             {ul\n\
        \                                   {-  Specify 8 numbers + 1 letter (DNI \\[Documento \
         Nacional de Identidad\\], NIF \\[N\195\186mero de Identificaci\195\179n Fiscal\\])\n\
        \                                       \n\
        \                                        }\n\
        \                                   {-  Example: 12345678M\n\
        \                                       \n\
        \                                        }\n\
        \                                   \n\
        \                         }\n\
        \                          }\n\
        \                        {-  If [ES_IDENTIFICATION_TYPE] is [NIE] (for foreigners with \
         legal residence):\n\
        \                            \n\
        \                             {ul\n\
        \                                   {-  Specify 1 letter + 7 numbers + 1 letter ( NIE \
         \\[N\195\186mero de Identidad de Extranjero\\])\n\
        \                                       \n\
        \                                        }\n\
        \                                   {-  Example: Y1234567X\n\
        \                                       \n\
        \                                        }\n\
        \                                   \n\
        \                         }\n\
        \                          }\n\
        \                        {-  If [ES_IDENTIFICATION_TYPE] is [OTHER] (for contacts outside \
         of Spain):\n\
        \                            \n\
        \                             {ul\n\
        \                                   {-  Specify a passport number, drivers license number, \
         or national identity card number\n\
        \                                       \n\
        \                                        }\n\
        \                                   \n\
        \                         }\n\
        \                          }\n\
        \                        \n\
        \                }\n\
        \                 }\n\
        \               {-   [ES_IDENTIFICATION_TYPE] \n\
        \                   \n\
        \                    Valid values include the following:\n\
        \                    \n\
        \                     {ul\n\
        \                           {-   [DNI_AND_NIF] (For Spanish contacts)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [NIE] (For foreigners with legal residence)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [OTHER] (For contacts outside of Spain)\n\
        \                               \n\
        \                                }\n\
        \                           \n\
        \                }\n\
        \                 }\n\
        \               {-   [ES_LEGAL_FORM] \n\
        \                   \n\
        \                    Valid values include the following:\n\
        \                    \n\
        \                     {ul\n\
        \                           {-   [ASSOCIATION] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [CENTRAL_GOVERNMENT_BODY] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [CIVIL_SOCIETY] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [COMMUNITY_OF_OWNERS] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [COMMUNITY_PROPERTY] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [CONSULATE] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [COOPERATIVE] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [DESIGNATION_OF_ORIGIN_SUPERVISORY_COUNCIL] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [ECONOMIC_INTEREST_GROUP] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [EMBASSY] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [ENTITY_MANAGING_NATURAL_AREAS] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [FARM_PARTNERSHIP] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [FOUNDATION] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [GENERAL_AND_LIMITED_PARTNERSHIP] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [GENERAL_PARTNERSHIP] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [INDIVIDUAL] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [LIMITED_COMPANY] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [LOCAL_AUTHORITY] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [LOCAL_PUBLIC_ENTITY] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [MUTUAL_INSURANCE_COMPANY] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [NATIONAL_PUBLIC_ENTITY] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [ORDER_OR_RELIGIOUS_INSTITUTION] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [OTHERS (Only for contacts outside of\n\
         \t\t\t\t\t\t\t\t\t\tSpain)] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [POLITICAL_PARTY] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [PROFESSIONAL_ASSOCIATION] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [PUBLIC_LAW_ASSOCIATION] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [PUBLIC_LIMITED_COMPANY] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [REGIONAL_GOVERNMENT_BODY] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [REGIONAL_PUBLIC_ENTITY] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [SAVINGS_BANK] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [SPANISH_OFFICE] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [SPORTS_ASSOCIATION] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [SPORTS_FEDERATION] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [SPORTS_LIMITED_COMPANY] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [TEMPORARY_ALLIANCE_OF_ENTERPRISES] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [TRADE_UNION] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [WORKER_OWNED_COMPANY] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [WORKER_OWNED_LIMITED_COMPANY] \n\
        \                               \n\
        \                                }\n\
        \                           \n\
        \                }\n\
        \                 }\n\
        \               }  .eu  {ul\n\
        \                             {-   [ EU_COUNTRY_OF_CITIZENSHIP] \n\
        \                                 \n\
        \                                  }\n\
        \                             }\n\
        \    .fi  {ul\n\
        \               {-   [BIRTH_DATE_IN_YYYY_MM_DD] \n\
        \                   \n\
        \                    }\n\
        \               {-   [FI_BUSINESS_NUMBER] \n\
        \                   \n\
        \                    }\n\
        \               {-   [FI_ID_NUMBER] \n\
        \                   \n\
        \                    }\n\
        \               {-   [FI_NATIONALITY] \n\
        \                   \n\
        \                    Valid values include the following:\n\
        \                    \n\
        \                     {ul\n\
        \                           {-   [FINNISH] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [NOT_FINNISH] \n\
        \                               \n\
        \                                }\n\
        \                           \n\
        \                }\n\
        \                 }\n\
        \               {-   [FI_ORGANIZATION_TYPE] \n\
        \                   \n\
        \                    Valid values include the following:\n\
        \                    \n\
        \                     {ul\n\
        \                           {-   [COMPANY] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [CORPORATION] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [GOVERNMENT] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [INSTITUTION] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [POLITICAL_PARTY] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [PUBLIC_COMMUNITY] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [TOWNSHIP] \n\
        \                               \n\
        \                                }\n\
        \                           \n\
        \                }\n\
        \                 }\n\
        \               }\n\
        \    .it  {ul\n\
        \               {-   [IT_NATIONALITY] \n\
        \                   \n\
        \                    }\n\
        \               {-   [IT_PIN] \n\
        \                   \n\
        \                    }\n\
        \               {-   [IT_REGISTRANT_ENTITY_TYPE] \n\
        \                   \n\
        \                    Valid values include the following:\n\
        \                    \n\
        \                     {ul\n\
        \                           {-   [FOREIGNERS] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [FREELANCE_WORKERS] (Freelance workers and professionals)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [ITALIAN_COMPANIES] (Italian companies and one-person \
         companies)\n\
        \                               \n\
        \                                }\n\
        \                           {-   [NON_PROFIT_ORGANIZATIONS] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [OTHER_SUBJECTS] \n\
        \                               \n\
        \                                }\n\
        \                           {-   [PUBLIC_ORGANIZATIONS] \n\
        \                               \n\
        \                                }\n\
        \                           \n\
        \                }\n\
        \                 }\n\
        \               }  .ru  {ul\n\
        \                             {-   [BIRTH_DATE_IN_YYYY_MM_DD] \n\
        \                                 \n\
        \                                  }\n\
        \                             {-   [RU_PASSPORT_DATA] \n\
        \                                 \n\
        \                                  }\n\
        \                             }  .se  {ul\n\
        \                                           {-   [BIRTH_COUNTRY] \n\
        \                                               \n\
        \                                                }\n\
        \                                           {-   [SE_ID_NUMBER] \n\
        \                                               \n\
        \                                                }\n\
        \                                           }  .sg  {ul\n\
        \                                                         {-   [SG_ID_NUMBER] \n\
        \                                                             \n\
        \                                                              }\n\
        \                                                         }\n\
        \    .uk, .co.uk, .me.uk, and .org.uk  {ul\n\
        \                                            {-   [UK_CONTACT_TYPE] \n\
        \                                                \n\
        \                                                 Valid values include the following:\n\
        \                                                 \n\
        \                                                  {ul\n\
        \                                                        {-   [CRC] (UK Corporation by \
         Royal Charter)\n\
        \                                                            \n\
        \                                                             }\n\
        \                                                        {-   [FCORP] (Non-UK Corporation)\n\
        \                                                            \n\
        \                                                             }\n\
        \                                                        {-   [FIND] (Non-UK Individual, \
         representing self)\n\
        \                                                            \n\
        \                                                             }\n\
        \                                                        {-   [FOTHER] (Non-UK Entity that \
         does not fit into any other category)\n\
        \                                                            \n\
        \                                                             }\n\
        \                                                        {-   [GOV] (UK Government Body)\n\
        \                                                            \n\
        \                                                             }\n\
        \                                                        {-   [IND] (UK Individual \
         (representing self))\n\
        \                                                            \n\
        \                                                             }\n\
        \                                                        {-   [IP] (UK \
         Industrial/Provident Registered Company)\n\
        \                                                            \n\
        \                                                             }\n\
        \                                                        {-   [LLP] (UK Limited Liability \
         Partnership)\n\
        \                                                            \n\
        \                                                             }\n\
        \                                                        {-   [LTD] (UK Limited Company)\n\
        \                                                            \n\
        \                                                             }\n\
        \                                                        {-   [OTHER] (UK Entity that does \
         not fit into any other category)\n\
        \                                                            \n\
        \                                                             }\n\
        \                                                        {-   [PLC] (UK Public Limited \
         Company)\n\
        \                                                            \n\
        \                                                             }\n\
        \                                                        {-   [PTNR] (UK Partnership)\n\
        \                                                            \n\
        \                                                             }\n\
        \                                                        {-   [RCHAR] (UK Registered \
         Charity)\n\
        \                                                            \n\
        \                                                             }\n\
        \                                                        {-   [SCH] (UK School)\n\
        \                                                            \n\
        \                                                             }\n\
        \                                                        {-   [STAT] (UK Statutory Body)\n\
        \                                                            \n\
        \                                                             }\n\
        \                                                        {-   [STRA] (UK Sole Trader)\n\
        \                                                            \n\
        \                                                             }\n\
        \                                                        \n\
        \                                             }\n\
        \                                              }\n\
        \                                            {-   [UK_COMPANY_NUMBER] \n\
        \                                                \n\
        \                                                 }\n\
        \                                            }\n\
        \     In addition, many TLDs require a [VAT_NUMBER].\n\
        \     "]
}
[@@ocaml.doc "ExtraParam includes the following elements.\n"]

type nonrec extra_param_list = extra_param list [@@ocaml.doc ""]

type nonrec contact_detail = {
  extra_params : extra_param_list option;
      [@ocaml.doc
        "A list of name-value pairs for parameters required by certain top-level domains.\n"]
  fax : contact_number option;
      [@ocaml.doc
        "Fax number of the contact.\n\n\
        \ Constraints: Phone number must be specified in the format \"+\\[country dialing \
         code\\].\\[number including any area code\\]\". For example, a US phone number might \
         appear as [\"+1.1234567890\"].\n\
        \ "]
  email : email option; [@ocaml.doc "Email address of the contact.\n"]
  phone_number : contact_number option;
      [@ocaml.doc
        "The phone number of the contact.\n\n\
        \ Constraints: Phone number must be specified in the format \"+\\[country dialing \
         code\\].\\[number including any area code>\\]\". For example, a US phone number might \
         appear as [\"+1.1234567890\"].\n\
        \ "]
  zip_code : zip_code option; [@ocaml.doc "The zip or postal code of the contact's address.\n"]
  country_code : country_code option;
      [@ocaml.doc "Code for the country of the contact's address.\n"]
  state : state option; [@ocaml.doc "The state or province of the contact's city.\n"]
  city : city option; [@ocaml.doc "The city of the contact's address.\n"]
  address_line2 : address_line option; [@ocaml.doc "Second line of contact's address, if any.\n"]
  address_line1 : address_line option; [@ocaml.doc "First line of the contact's address.\n"]
  organization_name : contact_name option;
      [@ocaml.doc "Name of the organization for contact types other than [PERSON].\n"]
  contact_type : contact_type option;
      [@ocaml.doc
        "Indicates whether the contact is a person, company, association, or public organization. \
         Note the following:\n\n\
        \ {ul\n\
        \       {-  If you specify a value other than [PERSON], you must also specify a value for \
         [OrganizationName].\n\
        \           \n\
        \            }\n\
        \       {-  For some TLDs, the privacy protection available depends on the value that you \
         specify for [Contact Type]. For the privacy protection settings for your TLD, see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html}Domains \
         that You Can Register with Amazon Route 53} in the {i Amazon Route 53 Developer Guide} \n\
        \           \n\
        \            }\n\
        \       {-  For .es domains, the value of [ContactType] must be [PERSON] for all three \
         contacts.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  last_name : contact_name option; [@ocaml.doc "Last name of contact.\n"]
  first_name : contact_name option; [@ocaml.doc "First name of contact.\n"]
}
[@@ocaml.doc "ContactDetail includes the following elements.\n"]

type nonrec currency = string [@@ocaml.doc ""]

type nonrec consent = {
  currency : currency; [@ocaml.doc " Currency for the [MaxPrice]. \n"]
  max_price : price; [@ocaml.doc " Maximum amount the customer agreed to accept. \n"]
}
[@@ocaml.doc " Customer's consent for the owner change request. \n"]

type nonrec update_domain_contact_request = {
  billing_contact : contact_detail option; [@ocaml.doc "Provides detailed contact information.\n"]
  consent : consent option;
      [@ocaml.doc
        " Customer's consent for the owner change request. Required if the domain is not free \
         (consent price is more than $0.00).\n"]
  tech_contact : contact_detail option; [@ocaml.doc "Provides detailed contact information.\n"]
  registrant_contact : contact_detail option;
      [@ocaml.doc "Provides detailed contact information.\n"]
  admin_contact : contact_detail option; [@ocaml.doc "Provides detailed contact information.\n"]
  domain_name : domain_name;
      [@ocaml.doc "The name of the domain that you want to update contact information for.\n"]
}
[@@ocaml.doc "The UpdateDomainContact request includes the following elements.\n"]

type nonrec update_domain_contact_privacy_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "Identifier for tracking the progress of the request. To use this ID to query the \
         operation status, use GetOperationDetail.\n"]
}
[@@ocaml.doc "The UpdateDomainContactPrivacy response includes the following element.\n"]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec update_domain_contact_privacy_request = {
  billing_privacy : boolean_ option;
      [@ocaml.doc
        " Whether you want to conceal contact information from WHOIS queries. If you specify \
         [true], WHOIS (\"who is\") queries return contact information either for Amazon Registrar \
         or for our registrar associate, Gandi. If you specify [false], WHOIS queries return the \
         information that you entered for the billing contact. \n\n\
        \  You must specify the same privacy setting for the administrative, billing, registrant, \
         and technical contacts.\n\
        \  \n\
        \   "]
  tech_privacy : boolean_ option;
      [@ocaml.doc
        "Whether you want to conceal contact information from WHOIS queries. If you specify \
         [true], WHOIS (\"who is\") queries return contact information either for Amazon Registrar \
         or for our registrar associate, Gandi. If you specify [false], WHOIS queries return the \
         information that you entered for the technical contact.\n\n\
        \  You must specify the same privacy setting for the administrative, billing, registrant, \
         and technical contacts.\n\
        \  \n\
        \   "]
  registrant_privacy : boolean_ option;
      [@ocaml.doc
        "Whether you want to conceal contact information from WHOIS queries. If you specify \
         [true], WHOIS (\"who is\") queries return contact information either for Amazon Registrar \
         or for our registrar associate, Gandi. If you specify [false], WHOIS queries return the \
         information that you entered for the registrant contact (domain owner).\n\n\
        \  You must specify the same privacy setting for the administrative, billing, registrant, \
         and technical contacts.\n\
        \  \n\
        \   "]
  admin_privacy : boolean_ option;
      [@ocaml.doc
        "Whether you want to conceal contact information from WHOIS queries. If you specify \
         [true], WHOIS (\"who is\") queries return contact information either for Amazon Registrar \
         or for our registrar associate, Gandi. If you specify [false], WHOIS queries return the \
         information that you entered for the admin contact.\n\n\
        \  You must specify the same privacy setting for the administrative, billing, registrant, \
         and technical contacts.\n\
        \  \n\
        \   "]
  domain_name : domain_name;
      [@ocaml.doc "The name of the domain that you want to update the privacy setting for.\n"]
}
[@@ocaml.doc "The UpdateDomainContactPrivacy request includes the following elements.\n"]

type nonrec transferable =
  | PREMIUM_DOMAIN [@ocaml.doc ""]
  | DOMAIN_IN_ANOTHER_ACCOUNT [@ocaml.doc ""]
  | DOMAIN_IN_OWN_ACCOUNT [@ocaml.doc ""]
  | DONT_KNOW [@ocaml.doc ""]
  | UNTRANSFERABLE [@ocaml.doc ""]
  | TRANSFERABLE [@ocaml.doc ""]
[@@ocaml.doc
  "Whether the domain name can be transferred to Route 53.\n\n\
  \  You can transfer only domains that have a value of [TRANSFERABLE] or [Transferable].\n\
  \  \n\
  \    Valid values:\n\
  \    \n\
  \      TRANSFERABLE  The domain name can be transferred to Route 53.\n\
  \                    \n\
  \                      UNTRANSFERRABLE  The domain name can't be transferred to Route 53.\n\
  \                                       \n\
  \                                         DONT_KNOW  The TLD registry didn't respond in time or \
   didn't provide a definitive answer about domain transferability, which can occur due to \
   registry maintenance or temporary delays.\n\
  \                                                    \n\
  \                                                      DOMAIN_IN_OWN_ACCOUNT  The domain already \
   exists in the current Amazon Web Services account.\n\
  \                                                                             \n\
  \                                                                               \
   DOMAIN_IN_ANOTHER_ACCOUNT  \n\
  \ The domain exists in another Amazon Web Services account.\n\n\
  \  PREMIUM_DOMAIN  Premium domain transfer is not supported.\n\
  \                  \n\
  \                    "]

type nonrec password = string [@@ocaml.doc ""]

type nonrec transfer_domain_to_another_aws_account_response = {
  password : password option;
      [@ocaml.doc
        "To finish transferring a domain to another Amazon Web Services account, the account that \
         the domain is being transferred to must submit an \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_AcceptDomainTransferFromAnotherAwsAccount.html}AcceptDomainTransferFromAnotherAwsAccount} \
         request. The request must include the value of the [Password] element that was returned \
         in the [TransferDomainToAnotherAwsAccount] response.\n"]
  operation_id : operation_id option;
      [@ocaml.doc
        "Identifier for tracking the progress of the request. To query the operation status, use \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html}GetOperationDetail}.\n"]
}
[@@ocaml.doc "The [TransferDomainToAnotherAwsAccount] response includes the following elements.\n"]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec transfer_domain_to_another_aws_account_request = {
  account_id : account_id;
      [@ocaml.doc
        "The account ID of the Amazon Web Services account that you want to transfer the domain \
         to, for example, [111122223333].\n"]
  domain_name : domain_name;
      [@ocaml.doc
        "The name of the domain that you want to transfer from the current Amazon Web Services \
         account to another account.\n"]
}
[@@ocaml.doc "The TransferDomainToAnotherAwsAccount request includes the following elements.\n"]

type nonrec transfer_domain_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "Identifier for tracking the progress of the request. To query the operation status, use \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html}GetOperationDetail}.\n"]
}
[@@ocaml.doc "The TransferDomain response includes the following element.\n"]

type nonrec lang_code = string [@@ocaml.doc ""]

type nonrec duration_in_years = int [@@ocaml.doc ""]

type nonrec domain_auth_code = string [@@ocaml.doc ""]

type nonrec transfer_domain_request = {
  privacy_protect_billing_contact : boolean_ option;
      [@ocaml.doc
        " Whether you want to conceal contact information from WHOIS queries. If you specify \
         [true], WHOIS (\"who is\") queries return contact information either for Amazon Registrar \
         or for our registrar associate, Gandi. If you specify [false], WHOIS queries return the \
         information that you entered for the billing contact. \n\n\
        \  You must specify the same privacy setting for the administrative, billing, registrant, \
         and technical contacts.\n\
        \  \n\
        \   "]
  billing_contact : contact_detail option; [@ocaml.doc "Provides detailed contact information.\n"]
  privacy_protect_tech_contact : boolean_ option;
      [@ocaml.doc
        "Whether you want to conceal contact information from WHOIS queries. If you specify \
         [true], WHOIS (\"who is\") queries return contact information either for Amazon Registrar \
         or for our registrar associate, Gandi. If you specify [false], WHOIS queries return the \
         information that you entered for the technical contact.\n\n\
        \  You must specify the same privacy setting for the administrative, billing, registrant, \
         and technical contacts.\n\
        \  \n\
        \    Default: [true] \n\
        \    "]
  privacy_protect_registrant_contact : boolean_ option;
      [@ocaml.doc
        "Whether you want to conceal contact information from WHOIS queries. If you specify \
         [true], WHOIS (\"who is\") queries return contact information either for Amazon Registrar \
         or for our registrar associate, Gandi. If you specify [false], WHOIS queries return the \
         information that you entered for the registrant contact (domain owner).\n\n\
        \  You must specify the same privacy setting for the administrative, billing, registrant, \
         and technical contacts.\n\
        \  \n\
        \    Default: [true] \n\
        \    "]
  privacy_protect_admin_contact : boolean_ option;
      [@ocaml.doc
        "Whether you want to conceal contact information from WHOIS queries. If you specify \
         [true], WHOIS (\"who is\") queries return contact information for the registrar, the \
         phrase \"REDACTED FOR PRIVACY\", or \"On behalf of  owner.\".\n\n\
        \  While some domains may allow different privacy settings per contact, we recommend \
         specifying the same privacy setting for all contacts.\n\
        \  \n\
        \    Default: [true] \n\
        \    "]
  tech_contact : contact_detail; [@ocaml.doc "Provides detailed contact information.\n"]
  registrant_contact : contact_detail; [@ocaml.doc "Provides detailed contact information.\n"]
  admin_contact : contact_detail; [@ocaml.doc "Provides detailed contact information.\n"]
  auto_renew : boolean_ option;
      [@ocaml.doc
        "Indicates whether the domain will be automatically renewed (true) or not (false). Auto \
         renewal only takes effect after the account is charged.\n\n\
        \ Default: true\n\
        \ "]
  auth_code : domain_auth_code option;
      [@ocaml.doc
        "The authorization code for the domain. You get this value from the current registrar.\n"]
  nameservers : nameserver_list option;
      [@ocaml.doc "Contains details for the host and glue IP addresses.\n"]
  duration_in_years : duration_in_years option;
      [@ocaml.doc
        "Reserved for future use.\n\n\
        \ Currently, the effect of a domain transfer on the registration period varies by TLD. For \
         information about how transferring a domain affects the expiration date, see the Transfer \
         Term column in the pricing information at \
         {{:http://aws.amazon.com/route53/pricing/}Amazon Route 53 Pricing}.\n\
        \ \n\
        \  Default: 1\n\
        \  "]
  idn_lang_code : lang_code option; [@ocaml.doc "Reserved for future use.\n"]
  domain_name : domain_name;
      [@ocaml.doc
        "The name of the domain that you want to transfer to Route 53. The top-level domain (TLD), \
         such as .com, must be a TLD that Route 53 supports. For a list of supported TLDs, see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html}Domains \
         that You Can Register with Amazon Route 53} in the {i Amazon Route 53 Developer Guide}.\n\n\
        \ The domain name can contain only the following characters:\n\
        \ \n\
        \  {ul\n\
        \        {-  Letters a through z. Domain names are not case sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Numbers 0 through 9.\n\
        \            \n\
        \             }\n\
        \        {-  Hyphen (-). You can't specify a hyphen at the beginning or end of a label. \n\
        \            \n\
        \             }\n\
        \        {-  Period (.) to separate the labels in the name, such as the [.] in \
         [example.com].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc "The TransferDomain request includes the following elements.\n"]

type nonrec domain_limit_exceeded = {
  message : error_message option;
      [@ocaml.doc "The number of domains has exceeded the allowed threshold for the account.\n"]
}
[@@ocaml.doc "The number of domains has exceeded the allowed threshold for the account.\n"]

type nonrec tld_name = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec tld_in_maintenance = {
  tld : tld_name option;
      [@ocaml.doc "The top-level domain that is currently undergoing maintenance.\n"]
  message : error_message option;
      [@ocaml.doc
        "The top-level domain is currently undergoing maintenance and the request cannot be \
         processed. Try again later.\n"]
}
[@@ocaml.doc
  "The top-level domain is currently undergoing maintenance and the request cannot be processed. \
   Try again later.\n"]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec status_flag =
  | PENDING_SUPPORT_CASE [@ocaml.doc ""]
  | PENDING_PAYMENT_VERIFICATION [@ocaml.doc ""]
  | PENDING_AUTHORIZATION [@ocaml.doc ""]
  | PENDING_CUSTOMER_ACTION [@ocaml.doc ""]
  | PENDING_ACCEPTANCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sort_order = DESC [@ocaml.doc ""] | ASC [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec list_domains_attribute_name = Expiry [@ocaml.doc ""] | DomainName [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sort_condition = {
  sort_order : sort_order;
      [@ocaml.doc
        "The sort order for a list of domains. Either ascending (ASC) or descending (DES).\n"]
  name : list_domains_attribute_name;
      [@ocaml.doc
        "Field to be used for sorting the list of domains. It can be either the name or the \
         expiration for a domain. Note that if [filterCondition] is used in the same \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains__ListDomains.html}ListDomains} \
         call, the field used for sorting has to be the same as the field used for filtering.\n"]
}
[@@ocaml.doc "Information for sorting a list of domains.\n"]

type nonrec retrieve_domain_auth_code_response = {
  auth_code : domain_auth_code option; [@ocaml.doc "The authorization code for the domain.\n"]
}
[@@ocaml.doc "The RetrieveDomainAuthCode response includes the following element.\n"]

type nonrec retrieve_domain_auth_code_request = {
  domain_name : domain_name;
      [@ocaml.doc "The name of the domain that you want to get an authorization code for.\n"]
}
[@@ocaml.doc
  "A request for the authorization code for the specified domain. To transfer a domain to another \
   registrar, you provide this value to the new registrar.\n"]

type nonrec resend_operation_authorization_request = {
  operation_id : operation_id; [@ocaml.doc " Operation ID. \n"]
}
[@@ocaml.doc ""]

type nonrec resend_contact_reachability_email_response = {
  is_already_verified : boolean_ option;
      [@ocaml.doc
        " [True] if the email address for the registrant contact has already been verified, and \
         [false] otherwise. If the email address has already been verified, we don't send another \
         confirmation email.\n"]
  email_address : email option;
      [@ocaml.doc
        "The email address for the registrant contact at the time that we sent the verification \
         email.\n"]
  domain_name : domain_name option;
      [@ocaml.doc "The domain name for which you requested a confirmation email.\n"]
}
[@@ocaml.doc ""]

type nonrec resend_contact_reachability_email_request = {
  domain_name : domain_name option;
      [@ocaml.doc
        "The name of the domain for which you want Route 53 to resend a confirmation email to the \
         registrant contact.\n"]
}
[@@ocaml.doc ""]

type nonrec renew_domain_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "Identifier for tracking the progress of the request. To query the operation status, use \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html}GetOperationDetail}.\n"]
}
[@@ocaml.doc ""]

type nonrec current_expiry_year = int [@@ocaml.doc ""]

type nonrec renew_domain_request = {
  current_expiry_year : current_expiry_year;
      [@ocaml.doc
        "The year when the registration for the domain is set to expire. This value must match the \
         current expiration date for the domain.\n"]
  duration_in_years : duration_in_years option;
      [@ocaml.doc
        "The number of years that you want to renew the domain for. The maximum number of years \
         depends on the top-level domain. For the range of valid values for your domain, see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html}Domains \
         that You Can Register with Amazon Route 53} in the {i Amazon Route 53 Developer Guide}.\n\n\
        \ Default: 1\n\
        \ "]
  domain_name : domain_name; [@ocaml.doc "The name of the domain that you want to renew.\n"]
}
[@@ocaml.doc
  "A [RenewDomain] request includes the number of years that you want to renew for and the current \
   expiration year.\n"]

type nonrec reject_domain_transfer_from_another_aws_account_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "The identifier that [TransferDomainToAnotherAwsAccount] returned to track the progress of \
         the request. Because the transfer request was rejected, the value is no longer valid, and \
         you can't use [GetOperationDetail] to query the operation status.\n"]
}
[@@ocaml.doc
  "The RejectDomainTransferFromAnotherAwsAccount response includes the following element.\n"]

type nonrec reject_domain_transfer_from_another_aws_account_request = {
  domain_name : domain_name;
      [@ocaml.doc
        "The name of the domain that was specified when another Amazon Web Services account \
         submitted a \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html}TransferDomainToAnotherAwsAccount} \
         request. \n"]
}
[@@ocaml.doc
  "The RejectDomainTransferFromAnotherAwsAccount request includes the following element.\n"]

type nonrec register_domain_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "Identifier for tracking the progress of the request. To query the operation status, use \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html}GetOperationDetail}.\n"]
}
[@@ocaml.doc "The RegisterDomain response includes the following element.\n"]

type nonrec register_domain_request = {
  privacy_protect_billing_contact : boolean_ option;
      [@ocaml.doc
        "Whether you want to conceal contact information from WHOIS queries. If you specify \
         [true], WHOIS (\"who is\") queries return contact information either for Amazon Registrar \
         or for our registrar associate, Gandi. If you specify [false], WHOIS queries return the \
         information that you entered for the billing contact.\n\n\
        \  You must specify the same privacy setting for the administrative, billing, registrant, \
         and technical contacts.\n\
        \  \n\
        \   "]
  billing_contact : contact_detail option;
      [@ocaml.doc
        "Provides detailed contact information. For information about the values that you specify \
         for each element, see \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ContactDetail.html}ContactDetail}.\n"]
  privacy_protect_tech_contact : boolean_ option;
      [@ocaml.doc
        "Whether you want to conceal contact information from WHOIS queries. If you specify \
         [true], WHOIS (\"who is\") queries return contact information either for Amazon Registrar \
         or for our registrar associate, Gandi. If you specify [false], WHOIS queries return the \
         information that you entered for the technical contact.\n\n\
        \  You must specify the same privacy setting for the administrative, billing, registrant, \
         and technical contacts.\n\
        \  \n\
        \    Default: [true] \n\
        \    "]
  privacy_protect_registrant_contact : boolean_ option;
      [@ocaml.doc
        "Whether you want to conceal contact information from WHOIS queries. If you specify \
         [true], WHOIS (\"who is\") queries return contact information either for Amazon Registrar \
         or for our registrar associate, Gandi. If you specify [false], WHOIS queries return the \
         information that you entered for the registrant contact (the domain owner).\n\n\
        \  You must specify the same privacy setting for the administrative, billing, registrant, \
         and technical contacts.\n\
        \  \n\
        \    Default: [true] \n\
        \    "]
  privacy_protect_admin_contact : boolean_ option;
      [@ocaml.doc
        "Whether you want to conceal contact information from WHOIS queries. If you specify \
         [true], WHOIS (\"who is\") queries return contact information either for Amazon Registrar \
         or for our registrar associate, Gandi. If you specify [false], WHOIS queries return the \
         information that you entered for the admin contact.\n\n\
        \  You must specify the same privacy setting for the administrative, billing, registrant, \
         and technical contacts.\n\
        \  \n\
        \    Default: [true] \n\
        \    "]
  tech_contact : contact_detail;
      [@ocaml.doc
        "Provides detailed contact information. For information about the values that you specify \
         for each element, see \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ContactDetail.html}ContactDetail}.\n"]
  registrant_contact : contact_detail;
      [@ocaml.doc
        "Provides detailed contact information. For information about the values that you specify \
         for each element, see \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ContactDetail.html}ContactDetail}.\n"]
  admin_contact : contact_detail;
      [@ocaml.doc
        "Provides detailed contact information. For information about the values that you specify \
         for each element, see \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ContactDetail.html}ContactDetail}.\n"]
  auto_renew : boolean_ option;
      [@ocaml.doc
        "Indicates whether the domain will be automatically renewed ([true]) or not ([false]). \
         Auto renewal only takes effect after the account is charged.\n\n\
        \ Default: [true] \n\
        \ "]
  duration_in_years : duration_in_years;
      [@ocaml.doc
        "The number of years that you want to register the domain for. Domains are registered for \
         a minimum of one year. The maximum period depends on the top-level domain. For the range \
         of valid values for your domain, see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html}Domains \
         that You Can Register with Amazon Route 53} in the {i Amazon Route 53 Developer Guide}.\n\n\
        \ Default: 1\n\
        \ "]
  idn_lang_code : lang_code option; [@ocaml.doc "Reserved for future use.\n"]
  domain_name : domain_name;
      [@ocaml.doc
        "The domain name that you want to register. The top-level domain (TLD), such as .com, must \
         be a TLD that Route 53 supports. For a list of supported TLDs, see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html}Domains \
         that You Can Register with Amazon Route 53} in the {i Amazon Route 53 Developer Guide}.\n\n\
        \ The domain name can contain only the following characters:\n\
        \ \n\
        \  {ul\n\
        \        {-  Letters a through z. Domain names are not case sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Numbers 0 through 9.\n\
        \            \n\
        \             }\n\
        \        {-  Hyphen (-). You can't specify a hyphen at the beginning or end of a label. \n\
        \            \n\
        \             }\n\
        \        {-  Period (.) to separate the labels in the name, such as the [.] in \
         [example.com].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Internationalized domain names are not supported for some top-level domains. To \
         determine whether the TLD that you want to use supports internationalized domain names, \
         see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html}Domains \
         that You Can Register with Amazon Route 53}. For more information, see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DomainNameFormat.html#domain-name-format-idns}Formatting \
         Internationalized Domain Names}. \n\
        \   "]
}
[@@ocaml.doc "The RegisterDomain request includes the following elements.\n"]

type nonrec label = string [@@ocaml.doc ""]

type nonrec push_domain_request = {
  target : label; [@ocaml.doc " New IPS tag for the domain. \n"]
  domain_name : domain_name; [@ocaml.doc " Name of the domain. \n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_domain_response = {
  tag_list : tag_list option;
      [@ocaml.doc "A list of the tags that are associated with the specified domain.\n"]
}
[@@ocaml.doc "The ListTagsForDomain response includes the following elements.\n"]

type nonrec list_tags_for_domain_request = {
  domain_name : domain_name; [@ocaml.doc "The domain for which you want to get a list of tags.\n"]
}
[@@ocaml.doc "The ListTagsForDomainRequest includes the following elements.\n"]

type nonrec domain_price_name = string [@@ocaml.doc ""]

type nonrec price_with_currency = {
  currency : currency; [@ocaml.doc "The currency specifier.\n"]
  price : price; [@ocaml.doc "The price of a domain, in a specific currency.\n"]
}
[@@ocaml.doc "Currency-specific price information.\n"]

type nonrec domain_price = {
  restoration_price : price_with_currency option;
      [@ocaml.doc "The price for restoring the domain with Route\194\16053.\n"]
  change_ownership_price : price_with_currency option;
      [@ocaml.doc "The price for changing domain ownership.\n"]
  renewal_price : price_with_currency option;
      [@ocaml.doc "The price for renewing domain registration with Route\194\16053.\n"]
  transfer_price : price_with_currency option;
      [@ocaml.doc "The price for transferring the domain registration to Route\194\16053.\n"]
  registration_price : price_with_currency option;
      [@ocaml.doc "The price for domain registration with Route\194\16053.\n"]
  name : domain_price_name option; [@ocaml.doc "The name of the TLD for which the prices apply.\n"]
}
[@@ocaml.doc "Information about the domain price associated with a TLD.\n"]

type nonrec domain_price_list = domain_price list [@@ocaml.doc ""]

type nonrec list_prices_response = {
  next_page_marker : page_marker option;
      [@ocaml.doc
        "If there are more prices than you specified for [MaxItems] in the request, submit another \
         request and include the value of [NextPageMarker] in the value of [Marker]. \n\n\
        \ Used only for all TLDs. If you specify a TLD, don't specify a [NextPageMarker].\n\
        \ "]
  prices : domain_price_list option;
      [@ocaml.doc
        "A complex type that includes all the pricing information. If you specify a TLD, this \
         array contains only the pricing for that TLD.\n"]
}
[@@ocaml.doc ""]

type nonrec list_prices_page_max_items = int [@@ocaml.doc ""]

type nonrec list_prices_request = {
  max_items : list_prices_page_max_items option;
      [@ocaml.doc
        "Number of [Prices] to be returned.\n\n\
        \ Used only for all TLDs. If you specify a TLD, don't specify a [MaxItems].\n\
        \ "]
  marker : page_marker option;
      [@ocaml.doc
        "For an initial request for a list of prices, omit this element. If the number of prices \
         that are not yet complete is greater than the value that you specified for [MaxItems], \
         you can use [Marker] to return additional prices. Get the value of [NextPageMarker] from \
         the previous response, and submit another request that includes the value of \
         [NextPageMarker] in the [Marker] element. \n\n\
        \ Used only for all TLDs. If you specify a TLD, don't specify a [Marker].\n\
        \ "]
  tld : tld_name option;
      [@ocaml.doc
        "The TLD for which you want to receive the pricing information. For example. [.net].\n\n\
        \ If a [Tld] value is not provided, a list of prices for all TLDs supported by \
         Route\194\16053 is returned.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec operation_status =
  | FAILED [@ocaml.doc ""]
  | SUCCESSFUL [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | SUBMITTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec operation_summary = {
  last_updated_date : timestamp option;
      [@ocaml.doc
        " The date when the last change was made in Unix time format and Coordinated Universal \
         Time (UTC). \n"]
  status_flag : status_flag option;
      [@ocaml.doc
        " Automatically checks whether there are no outstanding operations on domains that need \
         customer attention. \n\n\
        \  Valid values are:\n\
        \ \n\
        \  {ul\n\
        \        {-   [PENDING_ACCEPTANCE]: The operation is waiting for acceptance from the \
         account that is receiving the domain.\n\
        \            \n\
        \             }\n\
        \        {-   [PENDING_CUSTOMER_ACTION]: The operation is waiting for customer action, for \
         example, returning an email.\n\
        \            \n\
        \             }\n\
        \        {-   [PENDING_AUTHORIZATION]: The operation is waiting for the form of \
         authorization. For more information, see \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ResendOperationAuthorization.html}ResendOperationAuthorization}.\n\
        \            \n\
        \             }\n\
        \        {-   [PENDING_PAYMENT_VERIFICATION]: The operation is waiting for the payment \
         method to validate.\n\
        \            \n\
        \             }\n\
        \        {-   [PENDING_SUPPORT_CASE]: The operation includes a support case and is waiting \
         for its resolution.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  message : error_message option; [@ocaml.doc " Message about the operation. \n"]
  domain_name : domain_name option; [@ocaml.doc " Name of the domain. \n"]
  submitted_date : timestamp option; [@ocaml.doc "The date when the request was submitted.\n"]
  type_ : operation_type option; [@ocaml.doc "Type of the action requested.\n"]
  status : operation_status option;
      [@ocaml.doc "The current status of the requested operation in the system.\n"]
  operation_id : operation_id option;
      [@ocaml.doc "Identifier returned to track the requested action.\n"]
}
[@@ocaml.doc "OperationSummary includes the following elements.\n"]

type nonrec operation_summary_list = operation_summary list [@@ocaml.doc ""]

type nonrec list_operations_response = {
  next_page_marker : page_marker option;
      [@ocaml.doc
        "If there are more operations than you specified for [MaxItems] in the request, submit \
         another request and include the value of [NextPageMarker] in the value of [Marker].\n"]
  operations : operation_summary_list option; [@ocaml.doc "Lists summaries of the operations.\n"]
}
[@@ocaml.doc "The ListOperations response includes the following elements.\n"]

type nonrec operation_status_list = operation_status list [@@ocaml.doc ""]

type nonrec operation_type_list = operation_type list [@@ocaml.doc ""]

type nonrec list_operations_sort_attribute_name = SubmittedDate [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec list_operations_request = {
  sort_order : sort_order option;
      [@ocaml.doc " The sort order for returned values, either ascending or descending. \n"]
  sort_by : list_operations_sort_attribute_name option;
      [@ocaml.doc " The sort type for returned values. \n"]
  type_ : operation_type_list option; [@ocaml.doc " An arrays of the domains operation types. \n"]
  status : operation_status_list option; [@ocaml.doc " The status of the operations. \n"]
  max_items : page_max_items option;
      [@ocaml.doc "Number of domains to be returned.\n\n Default: 20\n "]
  marker : page_marker option;
      [@ocaml.doc
        "For an initial request for a list of operations, omit this element. If the number of \
         operations that are not yet complete is greater than the value that you specified for \
         [MaxItems], you can use [Marker] to return additional operations. Get the value of \
         [NextPageMarker] from the previous response, and submit another request that includes the \
         value of [NextPageMarker] in the [Marker] element.\n"]
  submitted_since : timestamp option;
      [@ocaml.doc
        "An optional parameter that lets you get information about all the operations that you \
         submitted after a specified date and time. Specify the date and time in Unix time format \
         and Coordinated Universal time (UTC).\n"]
}
[@@ocaml.doc "The ListOperations request includes the following elements.\n"]

type nonrec domain_summary = {
  expiry : timestamp option;
      [@ocaml.doc
        "Expiration date of the domain in Unix time format and Coordinated Universal Time (UTC).\n"]
  transfer_lock : boolean_ option;
      [@ocaml.doc
        "Indicates whether a domain is locked from unauthorized transfer to another party.\n"]
  auto_renew : boolean_ option;
      [@ocaml.doc "Indicates whether the domain is automatically renewed upon expiration.\n"]
  domain_name : domain_name option;
      [@ocaml.doc "The name of the domain that the summary information applies to.\n"]
}
[@@ocaml.doc "Summary information about one domain.\n"]

type nonrec domain_summary_list = domain_summary list [@@ocaml.doc ""]

type nonrec list_domains_response = {
  next_page_marker : page_marker option;
      [@ocaml.doc
        "If there are more domains than you specified for [MaxItems] in the request, submit \
         another request and include the value of [NextPageMarker] in the value of [Marker].\n"]
  domains : domain_summary_list option; [@ocaml.doc "A list of domains.\n"]
}
[@@ocaml.doc "The ListDomains response includes the following elements.\n"]

type nonrec operator = BEGINS_WITH [@ocaml.doc ""] | GE [@ocaml.doc ""] | LE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec filter_condition = {
  values : values;
      [@ocaml.doc
        " An array of strings presenting values to compare. Only 1 item in the list is currently \
         supported.\n"]
  operator : operator;
      [@ocaml.doc
        "The operator values for filtering domain names. The values can be:\n\n\
        \ {ul\n\
        \       {-   [LE]: Less than, or equal to\n\
        \           \n\
        \            }\n\
        \       {-   [GE]: Greater than, or equal to\n\
        \           \n\
        \            }\n\
        \       {-   [BEGINS_WITH]: Begins with\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  name : list_domains_attribute_name;
      [@ocaml.doc "Name of the field which should be used for filtering the list of domains.\n"]
}
[@@ocaml.doc
  "Information for the filtering of a list of domains returned by \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains__ListDomains.html}ListDomains}.\n"]

type nonrec filter_conditions = filter_condition list [@@ocaml.doc ""]

type nonrec list_domains_request = {
  max_items : page_max_items option;
      [@ocaml.doc "Number of domains to be returned.\n\n Default: 20\n "]
  marker : page_marker option;
      [@ocaml.doc
        "For an initial request for a list of domains, omit this element. If the number of domains \
         that are associated with the current Amazon Web Services account is greater than the \
         value that you specified for [MaxItems], you can use [Marker] to return additional \
         domains. Get the value of [NextPageMarker] from the previous response, and submit another \
         request that includes the value of [NextPageMarker] in the [Marker] element.\n\n\
        \ Constraints: The marker must match the value specified in the previous request.\n\
        \ "]
  sort_condition : sort_condition option;
      [@ocaml.doc
        "A complex type that contains information about the requested ordering of domains in the \
         returned list.\n"]
  filter_conditions : filter_conditions option;
      [@ocaml.doc
        "A complex type that contains information about the filters applied during the \
         [ListDomains] request. The filter conditions can include domain name and domain \
         expiration.\n"]
}
[@@ocaml.doc "The ListDomains request includes the following elements.\n"]

type nonrec get_operation_detail_response = {
  status_flag : status_flag option;
      [@ocaml.doc
        " Lists any outstanding operations that require customer action. Valid values are:\n\n\
        \ {ul\n\
        \       {-   [PENDING_ACCEPTANCE]: The operation is waiting for acceptance from the \
         account that is receiving the domain.\n\
        \           \n\
        \            }\n\
        \       {-   [PENDING_CUSTOMER_ACTION]: The operation is waiting for customer action, for \
         example, returning an email.\n\
        \           \n\
        \            }\n\
        \       {-   [PENDING_AUTHORIZATION]: The operation is waiting for the form of \
         authorization. For more information, see \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ResendOperationAuthorization.html}ResendOperationAuthorization}.\n\
        \           \n\
        \            }\n\
        \       {-   [PENDING_PAYMENT_VERIFICATION]: The operation is waiting for the payment \
         method to validate.\n\
        \           \n\
        \            }\n\
        \       {-   [PENDING_SUPPORT_CASE]: The operation includes a support case and is waiting \
         for its resolution.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  last_updated_date : timestamp option;
      [@ocaml.doc " The date when the operation was last updated. \n"]
  submitted_date : timestamp option; [@ocaml.doc "The date when the request was submitted.\n"]
  type_ : operation_type option; [@ocaml.doc "The type of operation that was requested.\n"]
  domain_name : domain_name option; [@ocaml.doc "The name of a domain.\n"]
  message : error_message option;
      [@ocaml.doc "Detailed information on the status including possible errors.\n"]
  status : operation_status option;
      [@ocaml.doc "The current status of the requested operation in the system.\n"]
  operation_id : operation_id option; [@ocaml.doc "The identifier for the operation.\n"]
}
[@@ocaml.doc "The GetOperationDetail response includes the following elements.\n"]

type nonrec get_operation_detail_request = {
  operation_id : operation_id;
      [@ocaml.doc
        "The identifier for the operation for which you want to get the status. Route 53 returned \
         the identifier in the response to the original request.\n"]
}
[@@ocaml.doc
  "The \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html}GetOperationDetail} \
   request includes the following element.\n"]

type nonrec domain_suggestion = {
  availability : string_ option;
      [@ocaml.doc
        "Whether the domain name is available for registering.\n\n\
        \  You can register only the domains that are designated as [AVAILABLE].\n\
        \  \n\
        \    Valid values:\n\
        \    \n\
        \      AVAILABLE  The domain name is available.\n\
        \                 \n\
        \                   AVAILABLE_RESERVED  The domain name is reserved under specific \
         conditions.\n\
        \                                       \n\
        \                                         AVAILABLE_PREORDER  The domain name is available \
         and can be preordered.\n\
        \                                                             \n\
        \                                                               DONT_KNOW  The TLD \
         registry didn't reply with a definitive answer about whether the domain name is \
         available. Route 53 can return this response for a variety of reasons, for example, the \
         registry is performing maintenance. Try again later.\n\
        \                                                                          \n\
        \                                                                            PENDING  \n\
         The TLD registry didn't return a response in the expected amount of time. When the \
         response is delayed, it usually takes just a few extra seconds. You can resubmit the \
         request immediately.\n\n\
        \  RESERVED  The domain name has been reserved for another person or organization.\n\
        \            \n\
        \              UNAVAILABLE  The domain name is not available.\n\
        \                           \n\
        \                             UNAVAILABLE_PREMIUM  The domain name is not available.\n\
        \                                                  \n\
        \                                                    UNAVAILABLE_RESTRICTED  The domain \
         name is forbidden.\n\
        \                                                                            \n\
        \                                                                              "]
  domain_name : domain_name option; [@ocaml.doc "A suggested domain name.\n"]
}
[@@ocaml.doc "Information about one suggested domain name.\n"]

type nonrec domain_suggestions_list = domain_suggestion list [@@ocaml.doc ""]

type nonrec get_domain_suggestions_response = {
  suggestions_list : domain_suggestions_list option;
      [@ocaml.doc
        "A list of possible domain names. If you specified [true] for [OnlyAvailable] in the \
         request, the list contains only domains that are available for registration.\n"]
}
[@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec get_domain_suggestions_request = {
  only_available : boolean_;
      [@ocaml.doc
        "If [OnlyAvailable] is [true], Route 53 returns only domain names that are available. If \
         [OnlyAvailable] is [false], Route 53 returns domain names without checking whether \
         they're available to be registered. To determine whether the domain is available, you can \
         call [checkDomainAvailability] for each suggestion.\n"]
  suggestion_count : integer;
      [@ocaml.doc
        "The number of suggested domain names that you want Route 53 to return. Specify a value \
         between 1 and 50. Note that fewer than the requested number might be returned.\n"]
  domain_name : domain_name;
      [@ocaml.doc
        "A domain name that you want to use as the basis for a list of possible domain names. The \
         top-level domain (TLD), such as .com, must be a TLD that Route 53 supports. For a list of \
         supported TLDs, see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html}Domains \
         that You Can Register with Amazon Route 53} in the {i Amazon Route 53 Developer Guide}.\n\n\
        \ The domain name can contain only the following characters:\n\
        \ \n\
        \  {ul\n\
        \        {-  Letters a through z. Domain names are not case sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Numbers 0 through 9.\n\
        \            \n\
        \             }\n\
        \        {-  Hyphen (-). You can't specify a hyphen at the beginning or end of a label. \n\
        \            \n\
        \             }\n\
        \        {-  Period (.) to separate the labels in the name, such as the [.] in \
         [example.com].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Internationalized domain names are not supported for some top-level domains. To \
         determine whether the TLD that you want to use supports internationalized domain names, \
         see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html}Domains \
         that You Can Register with Amazon Route 53}. \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec registrar_name = string [@@ocaml.doc ""]

type nonrec registrar_who_is_server = string [@@ocaml.doc ""]

type nonrec registrar_url = string [@@ocaml.doc ""]

type nonrec registry_domain_id = string [@@ocaml.doc ""]

type nonrec reseller = string [@@ocaml.doc ""]

type nonrec dns_sec = string [@@ocaml.doc ""]

type nonrec domain_status = string [@@ocaml.doc ""]

type nonrec domain_status_list = domain_status list [@@ocaml.doc ""]

type nonrec nullable_integer = int [@@ocaml.doc ""]

type nonrec dnssec_public_key = string [@@ocaml.doc ""]

type nonrec dnssec_key = {
  id : string_ option;
      [@ocaml.doc
        " An ID assigned to each DS record created by \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_AssociateDelegationSignerToDomain.html}AssociateDelegationSignerToDomain}. \n"]
  key_tag : nullable_integer option;
      [@ocaml.doc
        " A numeric identification of the DNSKEY record referred to by this DS record. \n"]
  digest : string_ option;
      [@ocaml.doc
        " The delegation signer digest.\n\n\
        \ Digest is calculated from the public key provided using specified digest algorithm and \
         this digest is the actual value returned from the registry nameservers as the value of DS \
         records. \n\
        \ "]
  digest_type : nullable_integer option;
      [@ocaml.doc
        " The number of the DS digest algorithm according to an IANA assignment.\n\n\
        \ For more information, see \
         {{:https://www.iana.org/assignments/ds-rr-types/ds-rr-types.xhtml}IANA} for DNSSEC \
         Delegation Signer (DS) Resource Record (RR) Type Digest Algorithms. \n\
        \ "]
  public_key : dnssec_public_key option;
      [@ocaml.doc
        "The base64-encoded public key part of the key pair that is passed to the registry .\n"]
  flags : nullable_integer option;
      [@ocaml.doc
        "Defines the type of key. It can be either a KSK (key-signing-key, value 257) or ZSK \
         (zone-signing-key, value 256). Using KSK is always encouraged. Only use ZSK if your DNS \
         provider isn't Route\194\16053 and you don\226\128\153t have KSK available.\n\n\
        \ If you have KSK and ZSK keys, always use KSK to create a delegations signer (DS) record. \
         If you have ZSK keys only \226\128\147 use ZSK to create a DS record.\n\
        \ "]
  algorithm : nullable_integer option;
      [@ocaml.doc
        "The number of the public key\226\128\153s cryptographic algorithm according to an \
         {{:https://www.iana.org/assignments/dns-sec-alg-numbers/dns-sec-alg-numbers.xml}IANA} \
         assignment. \n\n\
        \ If Route\194\16053 is your DNS service, set this to 13.\n\
        \ \n\
        \  For more information about enabling DNSSEC signing, see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-configuring-dnssec-enable-signing.html}Enabling \
         DNSSEC signing and establishing a chain of trust}.\n\
        \  "]
}
[@@ocaml.doc
  "Information about the DNSSEC key.\n\n\
  \ You get this from your DNS provider and then give it to Route\194\16053 (by using \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_AssociateDelegationSignerToDomain.html}AssociateDelegationSignerToDomain}) \
   to pass it to the registry to establish the chain of trust.\n\
  \ "]

type nonrec dnssec_key_list = dnssec_key list [@@ocaml.doc ""]

type nonrec get_domain_detail_response = {
  billing_privacy : boolean_ option;
      [@ocaml.doc
        "Specifies whether contact information is concealed from WHOIS queries. If the value is \
         [true], WHOIS (\"who is\") queries return contact information either for Amazon Registrar \
         or for our registrar associate, Gandi. If the value is [false], WHOIS queries return the \
         information that you entered for the billing contact.\n"]
  billing_contact : contact_detail option;
      [@ocaml.doc "Provides details about the domain billing contact.\n"]
  dnssec_keys : dnssec_key_list option;
      [@ocaml.doc "A complex type that contains information about the DNSSEC configuration.\n"]
  status_list : domain_status_list option;
      [@ocaml.doc
        "An array of domain name status codes, also known as Extensible Provisioning Protocol \
         (EPP) status codes.\n\n\
        \ ICANN, the organization that maintains a central database of domain names, has developed \
         a set of domain name status codes that tell you the status of a variety of operations on \
         a domain name, for example, registering a domain name, transferring a domain name to \
         another registrar, renewing the registration for a domain name, and so on. All registrars \
         use this same set of status codes.\n\
        \ \n\
        \  For a current list of domain name status codes and an explanation of what each code \
         means, go to the {{:https://www.icann.org/}ICANN website} and search for [epp status \
         codes]. (Search on the ICANN website; web searches sometimes return an old version of the \
         document.)\n\
        \  "]
  dns_sec : dns_sec option; [@ocaml.doc "Deprecated.\n"]
  reseller : reseller option; [@ocaml.doc "Reserved for future use.\n"]
  expiration_date : timestamp option;
      [@ocaml.doc
        "The date when the registration for the domain is set to expire. The date and time is in \
         Unix time format and Coordinated Universal time (UTC).\n"]
  updated_date : timestamp option;
      [@ocaml.doc
        "The last updated date of the domain as found in the response to a WHOIS query. The date \
         and time is in Unix time format and Coordinated Universal time (UTC).\n"]
  creation_date : timestamp option;
      [@ocaml.doc
        "The date when the domain was created as found in the response to a WHOIS query. The date \
         and time is in Unix time format and Coordinated Universal time (UTC).\n"]
  registry_domain_id : registry_domain_id option; [@ocaml.doc "Reserved for future use.\n"]
  abuse_contact_phone : contact_number option; [@ocaml.doc "Phone number for reporting abuse.\n"]
  abuse_contact_email : email option;
      [@ocaml.doc
        "Email address to contact to report incorrect contact information for a domain, to report \
         that the domain is being used to send spam, to report that someone is cybersquatting on a \
         domain name, or report some other type of abuse.\n"]
  registrar_url : registrar_url option; [@ocaml.doc "Web address of the registrar.\n"]
  who_is_server : registrar_who_is_server option;
      [@ocaml.doc
        "The fully qualified name of the WHOIS server that can answer the WHOIS query for the \
         domain.\n"]
  registrar_name : registrar_name option;
      [@ocaml.doc "Name of the registrar of the domain as identified in the registry. \n"]
  tech_privacy : boolean_ option;
      [@ocaml.doc
        "Specifies whether contact information is concealed from WHOIS queries. If the value is \
         [true], WHOIS (\"who is\") queries return contact information either for Amazon Registrar \
         or for our registrar associate, Gandi. If the value is [false], WHOIS queries return the \
         information that you entered for the technical contact.\n"]
  registrant_privacy : boolean_ option;
      [@ocaml.doc
        "Specifies whether contact information is concealed from WHOIS queries. If the value is \
         [true], WHOIS (\"who is\") queries return contact information either for Amazon Registrar \
         or for our registrar associate, Gandi. If the value is [false], WHOIS queries return the \
         information that you entered for the registrant contact (domain owner).\n"]
  admin_privacy : boolean_ option;
      [@ocaml.doc
        "Specifies whether contact information is concealed from WHOIS queries. If the value is \
         [true], WHOIS (\"who is\") queries return contact information either for Amazon Registrar \
         or for our registrar associate, Gandi. If the value is [false], WHOIS queries return the \
         information that you entered for the admin contact.\n"]
  tech_contact : contact_detail option;
      [@ocaml.doc "Provides details about the domain technical contact.\n"]
  registrant_contact : contact_detail option;
      [@ocaml.doc "Provides details about the domain registrant.\n"]
  admin_contact : contact_detail option;
      [@ocaml.doc "Provides details about the domain administrative contact.\n"]
  auto_renew : boolean_ option;
      [@ocaml.doc "Specifies whether the domain registration is set to renew automatically.\n"]
  nameservers : nameserver_list option; [@ocaml.doc "The name servers of the domain.\n"]
  domain_name : domain_name option; [@ocaml.doc "The name of a domain.\n"]
}
[@@ocaml.doc "The GetDomainDetail response includes the following elements.\n"]

type nonrec get_domain_detail_request = {
  domain_name : domain_name;
      [@ocaml.doc "The name of the domain that you want to get detailed information about.\n"]
}
[@@ocaml.doc "The GetDomainDetail request includes the following element.\n"]

type nonrec reachability_status =
  | EXPIRED [@ocaml.doc ""]
  | DONE [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_contact_reachability_status_response = {
  status : reachability_status option;
      [@ocaml.doc
        "Whether the registrant contact has responded. Values include the following:\n\n\
        \  PENDING  We sent the confirmation email and haven't received a response yet.\n\
        \           \n\
        \             DONE  We sent the email and got confirmation from the registrant contact.\n\
        \                   \n\
        \                     EXPIRED  The time limit expired before the registrant contact \
         responded.\n\
        \                              \n\
        \                                "]
  domain_name : domain_name option;
      [@ocaml.doc "The domain name for which you requested the reachability status.\n"]
}
[@@ocaml.doc ""]

type nonrec get_contact_reachability_status_request = {
  domain_name : domain_name option;
      [@ocaml.doc
        "The name of the domain for which you want to know whether the registrant contact has \
         confirmed that the email address is valid.\n"]
}
[@@ocaml.doc ""]

type nonrec enable_domain_transfer_lock_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "Identifier for tracking the progress of the request. To use this ID to query the \
         operation status, use GetOperationDetail.\n"]
}
[@@ocaml.doc "The EnableDomainTransferLock response includes the following elements.\n"]

type nonrec enable_domain_transfer_lock_request = {
  domain_name : domain_name;
      [@ocaml.doc "The name of the domain that you want to set the transfer lock for.\n"]
}
[@@ocaml.doc "A request to set the transfer lock for the specified domain.\n"]

type nonrec enable_domain_auto_renew_response = unit [@@ocaml.doc ""]

type nonrec enable_domain_auto_renew_request = {
  domain_name : domain_name;
      [@ocaml.doc "The name of the domain that you want to enable automatic renewal for.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_delegation_signer_from_domain_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "Identifier for tracking the progress of the request. To query the operation status, use \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html}GetOperationDetail}.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_delegation_signer_from_domain_request = {
  id : string_;
      [@ocaml.doc
        "An internal identification number assigned to each DS record after it\226\128\153s \
         created. You can retrieve it as part of DNSSEC information returned by \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetDomainDetail.html}GetDomainDetail}.\n"]
  domain_name : domain_name; [@ocaml.doc "Name of the domain.\n"]
}
[@@ocaml.doc ""]

type nonrec disable_domain_transfer_lock_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "Identifier for tracking the progress of the request. To query the operation status, use \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html}GetOperationDetail}.\n"]
}
[@@ocaml.doc "The DisableDomainTransferLock response includes the following element.\n"]

type nonrec disable_domain_transfer_lock_request = {
  domain_name : domain_name;
      [@ocaml.doc "The name of the domain that you want to remove the transfer lock for.\n"]
}
[@@ocaml.doc "The DisableDomainTransferLock request includes the following element.\n"]

type nonrec disable_domain_auto_renew_response = unit [@@ocaml.doc ""]

type nonrec disable_domain_auto_renew_request = {
  domain_name : domain_name;
      [@ocaml.doc "The name of the domain that you want to disable automatic renewal for.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_tags_for_domain_response = unit [@@ocaml.doc ""]

type nonrec delete_tags_for_domain_request = {
  tags_to_delete : tag_key_list; [@ocaml.doc "A list of tag keys to delete.\n"]
  domain_name : domain_name;
      [@ocaml.doc "The domain for which you want to delete one or more tags.\n"]
}
[@@ocaml.doc "The DeleteTagsForDomainRequest includes the following elements.\n"]

type nonrec delete_domain_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "Identifier for tracking the progress of the request. To query the operation status, use \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html}GetOperationDetail}.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_domain_request = {
  domain_name : domain_name; [@ocaml.doc "Name of the domain to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec domain_transferability = { transferable : transferable option [@ocaml.doc ""] }
[@@ocaml.doc
  "A complex type that contains information about whether the specified domain can be transferred \
   to Route 53.\n"]

type nonrec message = string [@@ocaml.doc ""]

type nonrec check_domain_transferability_response = {
  message : message option;
      [@ocaml.doc "Provides an explanation for when a domain can't be transferred.\n"]
  transferability : domain_transferability option;
      [@ocaml.doc
        "A complex type that contains information about whether the specified domain can be \
         transferred to Route 53.\n"]
}
[@@ocaml.doc "The CheckDomainTransferability response includes the following elements.\n"]

type nonrec check_domain_transferability_request = {
  auth_code : domain_auth_code option;
      [@ocaml.doc
        "If the registrar for the top-level domain (TLD) requires an authorization code to \
         transfer the domain, the code that you got from the current registrar for the domain.\n"]
  domain_name : domain_name;
      [@ocaml.doc
        "The name of the domain that you want to transfer to Route 53. The top-level domain (TLD), \
         such as .com, must be a TLD that Route 53 supports. For a list of supported TLDs, see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html}Domains \
         that You Can Register with Amazon Route 53} in the {i Amazon Route 53 Developer Guide}.\n\n\
        \ The domain name can contain only the following characters:\n\
        \ \n\
        \  {ul\n\
        \        {-  Letters a through z. Domain names are not case sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Numbers 0 through 9.\n\
        \            \n\
        \             }\n\
        \        {-  Hyphen (-). You can't specify a hyphen at the beginning or end of a label. \n\
        \            \n\
        \             }\n\
        \        {-  Period (.) to separate the labels in the name, such as the [.] in \
         [example.com].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc "The CheckDomainTransferability request contains the following elements.\n"]

type nonrec domain_availability =
  | PENDING [@ocaml.doc ""]
  | INVALID_NAME_FOR_TLD [@ocaml.doc ""]
  | DONT_KNOW [@ocaml.doc ""]
  | RESERVED [@ocaml.doc ""]
  | UNAVAILABLE_RESTRICTED [@ocaml.doc ""]
  | UNAVAILABLE_PREMIUM [@ocaml.doc ""]
  | UNAVAILABLE [@ocaml.doc ""]
  | AVAILABLE_PREORDER [@ocaml.doc ""]
  | AVAILABLE_RESERVED [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec check_domain_availability_response = {
  availability : domain_availability option;
      [@ocaml.doc
        "Whether the domain name is available for registering.\n\n\
        \  You can register only domains designated as [AVAILABLE].\n\
        \  \n\
        \    Valid values:\n\
        \    \n\
        \      AVAILABLE  The domain name is available.\n\
        \                 \n\
        \                   AVAILABLE_RESERVED  The domain name is reserved under specific \
         conditions.\n\
        \                                       \n\
        \                                         AVAILABLE_PREORDER  The domain name is available \
         and can be preordered.\n\
        \                                                             \n\
        \                                                               DONT_KNOW  The TLD \
         registry didn't reply with a definitive answer about whether the domain name is \
         available. Route 53 can return this response for a variety of reasons, for example, the \
         registry is performing maintenance. Try again later.\n\
        \                                                                          \n\
        \                                                                            \
         INVALID_NAME_FOR_TLD  \n\
         The TLD isn't valid. For example, it can contain characters that aren't allowed.\n\n\
        \  PENDING  The TLD registry didn't return a response in the expected amount of time. When \
         the response is delayed, it usually takes just a few extra seconds. You can resubmit the \
         request immediately.\n\
        \           \n\
        \             RESERVED  The domain name has been reserved for another person or \
         organization.\n\
        \                       \n\
        \                         UNAVAILABLE  The domain name is not available.\n\
        \                                      \n\
        \                                        UNAVAILABLE_PREMIUM  The domain name is not \
         available.\n\
        \                                                             \n\
        \                                                               UNAVAILABLE_RESTRICTED  \n\
         The domain name is forbidden.\n\n\
        \  "]
}
[@@ocaml.doc "The CheckDomainAvailability response includes the following elements.\n"]

type nonrec check_domain_availability_request = {
  idn_lang_code : lang_code option; [@ocaml.doc "Reserved for future use.\n"]
  domain_name : domain_name;
      [@ocaml.doc
        "The name of the domain that you want to get availability for. The top-level domain (TLD), \
         such as .com, must be a TLD that Route 53 supports. For a list of supported TLDs, see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html}Domains \
         that You Can Register with Amazon Route 53} in the {i Amazon Route 53 Developer Guide}.\n\n\
        \ The domain name can contain only the following characters:\n\
        \ \n\
        \  {ul\n\
        \        {-  Letters a through z. Domain names are not case sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Numbers 0 through 9.\n\
        \            \n\
        \             }\n\
        \        {-  Hyphen (-). You can't specify a hyphen at the beginning or end of a label. \n\
        \            \n\
        \             }\n\
        \        {-  Period (.) to separate the labels in the name, such as the [.] in \
         [example.com].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Internationalized domain names are not supported for some top-level domains. To \
         determine whether the TLD that you want to use supports internationalized domain names, \
         see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html}Domains \
         that You Can Register with Amazon Route 53}. For more information, see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DomainNameFormat.html#domain-name-format-idns}Formatting \
         Internationalized Domain Names}. \n\
        \   "]
}
[@@ocaml.doc "The CheckDomainAvailability request contains the following elements.\n"]

type nonrec cancel_domain_transfer_to_another_aws_account_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "The identifier that [TransferDomainToAnotherAwsAccount] returned to track the progress of \
         the request. Because the transfer request was canceled, the value is no longer valid, and \
         you can't use [GetOperationDetail] to query the operation status.\n"]
}
[@@ocaml.doc
  "The [CancelDomainTransferToAnotherAwsAccount] response includes the following element.\n"]

type nonrec cancel_domain_transfer_to_another_aws_account_request = {
  domain_name : domain_name;
      [@ocaml.doc
        "The name of the domain for which you want to cancel the transfer to another Amazon Web \
         Services account.\n"]
}
[@@ocaml.doc
  "The CancelDomainTransferToAnotherAwsAccount request includes the following element.\n"]

type nonrec dnssec_limit_exceeded = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  " This error is returned if you call [AssociateDelegationSignerToDomain] when the specified \
   domain has reached the maximum number of DS records. You can't add any additional DS records \
   unless you delete an existing one first. \n"]

type nonrec associate_delegation_signer_to_domain_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "The identifier for tracking the progress of the request. To query the operation status, \
         use \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html}GetOperationDetail}.\n"]
}
[@@ocaml.doc ""]

type nonrec dnssec_signing_attributes = {
  public_key : dnssec_public_key option;
      [@ocaml.doc
        " The base64-encoded public key part of the key pair that is passed to the registry. \n"]
  flags : nullable_integer option;
      [@ocaml.doc
        "Defines the type of key. It can be either a KSK (key-signing-key, value 257) or ZSK \
         (zone-signing-key, value 256). Using KSK is always encouraged. Only use ZSK if your DNS \
         provider isn't Route 53 and you don\226\128\153t have KSK available.\n\n\
        \ If you have KSK and ZSK keys, always use KSK to create a delegations signer (DS) record. \
         If you have ZSK keys only \226\128\147 use ZSK to create a DS record.\n\
        \ "]
  algorithm : nullable_integer option;
      [@ocaml.doc " Algorithm which was used to generate the digest from the public key. \n"]
}
[@@ocaml.doc
  "Information about a delegation signer (DS) record that was created in the registry by \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_AssociateDelegationSignerToDomain.html}AssociateDelegationSignerToDomain}. \n"]

type nonrec associate_delegation_signer_to_domain_request = {
  signing_attributes : dnssec_signing_attributes;
      [@ocaml.doc
        "The information about a key, including the algorithm, public key-value, and flags.\n"]
  domain_name : domain_name; [@ocaml.doc "The name of the domain.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_domain_transfer_from_another_aws_account_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "Identifier for tracking the progress of the request. To query the operation status, use \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html}GetOperationDetail}.\n"]
}
[@@ocaml.doc
  "The AcceptDomainTransferFromAnotherAwsAccount response includes the following element.\n"]

type nonrec accept_domain_transfer_from_another_aws_account_request = {
  password : password;
      [@ocaml.doc
        "The password that was returned by the \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html}TransferDomainToAnotherAwsAccount} \
         request. \n"]
  domain_name : domain_name;
      [@ocaml.doc
        "The name of the domain that was specified when another Amazon Web Services account \
         submitted a \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html}TransferDomainToAnotherAwsAccount} \
         request. \n"]
}
[@@ocaml.doc
  "The AcceptDomainTransferFromAnotherAwsAccount request includes the following elements.\n"]
