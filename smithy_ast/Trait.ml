open Base

type serviceDetails = {
  sdkId : string;
  arnNamespace : string option;
  cloudFormationName : string option;
  cloudTrailEventSource : string option;
  endpointPrefix : string option;
}
[@@deriving show, equal]

type enumPair = { name : string option; value : string } [@@deriving show, equal]
type errorTraitType = Server | Client [@@deriving show, equal]

type arnReferenceDetails = {
  type_ : string option;
  service : string option;
  resource : string option;
}
[@@deriving show, equal]

type reference = { resource : string; service : string option } [@@deriving show, equal]
type httpTrait = { method_ : string; uri : string; code : int option } [@@deriving show, equal]
type endpointTrait = { hostPrefix : string } [@@deriving show, equal]
type xmlNamespaceConfig = { uri : string; prefix : string option } [@@deriving show, equal]

type restXmlConfig = { http : string list; eventStreamHttp : string list; noErrorWrapping : bool }
[@@deriving show, equal]

type clientEndpointDiscoveryDetails = { operation : string; error : string }
[@@deriving show, equal]

type awsQueryErrorDetails = { code : string; httpResponseCode : int option }
[@@deriving show, equal]

type externalDocumentationType = (string * string) list [@@deriving show, equal]

type staticContextParamValue =
  | StaticContextStringValue of string
  | StaticContextBooleanValue of bool
  | StaticContextStringListValue of string list
[@@deriving show, equal]

type staticContextParams = (string * staticContextParamValue) list [@@deriving show, equal]
type operationContextParam = { path : string } [@@deriving show, equal]
type operationContextParams = (string * operationContextParam) list [@@deriving show, equal]

type timestampFormat =
  | TimestampFormatDateTime
  | TimestampFormatEpochSeconds
  | TimestampFormatHttpDate
[@@deriving show, equal]

type httpRequestTest = {
  id : string;
  protocol : string;
  method_ : string;
  uri : string;
  host : string option;
  resolvedHost : string option;
  authScheme : string option;
  queryParams : string list option;
  forbidQueryParams : string list option;
  headers : (string * string) list option;
  forbidHeaders : string list option;
  body : string option;
  bodyMediaType : string option;
  params : Yojson.Safe.t option;
  vendorParams : Yojson.Safe.t option;
  vendorParamsShape : string option;
  documentation : string option;
  tags : string list option;
  appliesTo : [ `Client | `Server ] option;
}
[@@deriving show, equal]

type httpResponseTest = {
  id : string;
  protocol : string;
  code : int;
  headers : (string * string) list option;
  forbidHeaders : string list option;
  body : string option;
  bodyMediaType : string option;
  params : Yojson.Safe.t option;
  vendorParams : Yojson.Safe.t option;
  vendorParamsShape : string option;
  documentation : string option;
  tags : string list option;
  appliesTo : [ `Client | `Server ] option;
}
[@@deriving show, equal]

type t =
  | ApiTitleTrait of string
  | ApiXmlNamespaceTrait of xmlNamespaceConfig
  | AuthTrait
  | AwsApiArnReferenceTrait of arnReferenceDetails
  | AwsApiClientDiscoveredEndpointTrait
  | AwsApiClientEndpointDiscoveryTrait of clientEndpointDiscoveryDetails
  | AwsApiControlPlaneTrait
  | AwsApiDataPlaneTrait
  | AwsAuthSigV4Trait of string
  | AwsAuthUnsignedPayloadTrait
  | AwsCloudFormationCfnExcludePropertyTrait
  | AwsCloudFormationCfnMutabilityTrait
  | AwsCustomizationsS3UnwrappedXmlOutputTrait
  | AwsIamActionPermissionDescriptionTrait
  | AwsIamConditionKeysTrait
  | AwsIamDefineConditionKeysTrait
  | AwsIamRequiredActionsTrait
  | AwsProtocolAwsJson1_0Trait
  | AwsProtocolAwsJson1_1Trait
  | AwsProtocolAwsQueryCompatibleTrait
  | AwsProtocolAwsQueryErrorTrait of awsQueryErrorDetails
  | AwsProtocolAwsQueryTrait
  | AwsProtocolEc2QueryNameTrait of string
  | AwsProtocolEc2QueryTrait
  | AwsProtocolRestJson1Trait
  | AwsProtocolRestXmlTrait of restXmlConfig
  | AwsProtocolsHttpChecksumTrait
  | BoxTrait
  | CorsTrait
  | DefaultTrait
  | DeprecatedTrait
  | DocumentationTrait of string
  | EndpointTrait of endpointTrait
  | EnumTrait of enumPair list
  | EnumValueTrait of [ `String of string | `Int of int ]
  | ErrorTrait of errorTraitType
  | EventPayloadTrait
  | ExamplesTrait
  | ExternalDocumentationTrait of externalDocumentationType
  | HostLabelTrait
  | HttpChecksumRequiredTrait
  | HttpErrorTrait of int
  | HttpHeaderTrait of string
  | HttpLabelTrait
  | HttpPayloadTrait
  | HttpPrefixHeadersTrait of string
  | HttpQueryParams
  | HttpQueryTrait of string
  | HttpResponseCodeTrait
  | HttpTrait of httpTrait
  | IdempotencyTokenTrait
  | IdempotentTrait
  | InputTrait
  | InternalTrait
  | JsonNameTrait of string
  | LengthTrait of int option * int option
  | MediaTypeTrait of string
  | OptionalAuthTrait
  | OutputTrait
  | PaginatedTrait
  | PatternTrait of string
  | RangeTrait of float option * float option
  | ReadonlyTrait
  | ReferencesTrait of reference list
  | RequiredTrait
  | RequiresLengthTrait
  | RequestCompressionTrait of string list
  | RetryableTrait
  | RulesEndpointRuleSetTrait
  | RulesEndpointTests
  | RulesContextParam of string
  | RulesStaticContextParams of staticContextParams
  | RulesOperationContextParams of operationContextParams
  | SensitiveTrait
  | ServiceTrait of serviceDetails
  | SparseTrait
  | StreamingTrait
  | SuppressTrait
  | TagsTrait of string list
  | TimestampFormatTrait of timestampFormat
  | TestSmokeTests
  | TestHttpResponseTests of httpResponseTest list
  | WaitableTrait
  | XmlAttributeTrait
  | XmlFlattenedTrait
  | XmlNameTrait of string
  | PrivateTrait
  | TestHttpRequestTests of httpRequestTest list
  | IdRefTrait of {
      failWhenMissing : bool option;
      selector : string option;
      errorMessage : string option;
    }
  | UnspecifiedTrait of string * Yojson.Safe.t
[@@deriving show, equal]

let isEnumTrait trait = match trait with EnumTrait _ -> true | _ -> false
let isRequiredTrait trait = match trait with RequiredTrait -> true | _ -> false
let isSparseTrait trait = match trait with SparseTrait -> true | _ -> false
let isErrorTrait trait = match trait with ErrorTrait _ -> true | _ -> false
let isAwsApiServiceTrait trait = match trait with ServiceTrait _ -> true | _ -> false
let isTimestampFormatTrait trait = match trait with TimestampFormatTrait _ -> true | _ -> false
let isIdempotencyTokenTrait trait = match trait with IdempotencyTokenTrait -> true | _ -> false

(* A stable per-constructor key used by [Smaws_parse.Smithy.resolve_mixins] to
   dedup mixin traits against a consuming shape's own traits (own wins). Two
   traits with the same [type_key] occupy the same "slot", so a mixin's
   [@xmlNamespace] is dropped when the consuming shape already declares one.
   Nullary constructors share a single key; [UnspecifiedTrait] uses the trait
   id (e.g. "smithy.api#mixin") so two unspecified traits with different ids are
   distinct slots. *)
let type_key (trait : t) : string =
  match trait with
  | ApiTitleTrait _ -> "ApiTitleTrait"
  | ApiXmlNamespaceTrait _ -> "ApiXmlNamespaceTrait"
  | AuthTrait -> "AuthTrait"
  | AwsApiArnReferenceTrait _ -> "AwsApiArnReferenceTrait"
  | AwsApiClientDiscoveredEndpointTrait -> "AwsApiClientDiscoveredEndpointTrait"
  | AwsApiClientEndpointDiscoveryTrait _ -> "AwsApiClientEndpointDiscoveryTrait"
  | AwsApiControlPlaneTrait -> "AwsApiControlPlaneTrait"
  | AwsApiDataPlaneTrait -> "AwsApiDataPlaneTrait"
  | AwsAuthSigV4Trait _ -> "AwsAuthSigV4Trait"
  | AwsAuthUnsignedPayloadTrait -> "AwsAuthUnsignedPayloadTrait"
  | AwsCloudFormationCfnExcludePropertyTrait -> "AwsCloudFormationCfnExcludePropertyTrait"
  | AwsCloudFormationCfnMutabilityTrait -> "AwsCloudFormationCfnMutabilityTrait"
  | AwsCustomizationsS3UnwrappedXmlOutputTrait -> "AwsCustomizationsS3UnwrappedXmlOutputTrait"
  | AwsIamActionPermissionDescriptionTrait -> "AwsIamActionPermissionDescriptionTrait"
  | AwsIamConditionKeysTrait -> "AwsIamConditionKeysTrait"
  | AwsIamDefineConditionKeysTrait -> "AwsIamDefineConditionKeysTrait"
  | AwsIamRequiredActionsTrait -> "AwsIamRequiredActionsTrait"
  | AwsProtocolAwsJson1_0Trait -> "AwsProtocolAwsJson1_0Trait"
  | AwsProtocolAwsJson1_1Trait -> "AwsProtocolAwsJson1_1Trait"
  | AwsProtocolAwsQueryCompatibleTrait -> "AwsProtocolAwsQueryCompatibleTrait"
  | AwsProtocolAwsQueryErrorTrait _ -> "AwsProtocolAwsQueryErrorTrait"
  | AwsProtocolAwsQueryTrait -> "AwsProtocolAwsQueryTrait"
  | AwsProtocolEc2QueryNameTrait _ -> "AwsProtocolEc2QueryNameTrait"
  | AwsProtocolEc2QueryTrait -> "AwsProtocolEc2QueryTrait"
  | AwsProtocolRestJson1Trait -> "AwsProtocolRestJson1Trait"
  | AwsProtocolRestXmlTrait _ -> "AwsProtocolRestXmlTrait"
  | AwsProtocolsHttpChecksumTrait -> "AwsProtocolsHttpChecksumTrait"
  | BoxTrait -> "BoxTrait"
  | CorsTrait -> "CorsTrait"
  | DefaultTrait -> "DefaultTrait"
  | DeprecatedTrait -> "DeprecatedTrait"
  | DocumentationTrait _ -> "DocumentationTrait"
  | EndpointTrait _ -> "EndpointTrait"
  | EnumTrait _ -> "EnumTrait"
  | EnumValueTrait _ -> "EnumValueTrait"
  | ErrorTrait _ -> "ErrorTrait"
  | EventPayloadTrait -> "EventPayloadTrait"
  | ExamplesTrait -> "ExamplesTrait"
  | ExternalDocumentationTrait _ -> "ExternalDocumentationTrait"
  | HostLabelTrait -> "HostLabelTrait"
  | HttpChecksumRequiredTrait -> "HttpChecksumRequiredTrait"
  | HttpErrorTrait _ -> "HttpErrorTrait"
  | HttpHeaderTrait _ -> "HttpHeaderTrait"
  | HttpLabelTrait -> "HttpLabelTrait"
  | HttpPayloadTrait -> "HttpPayloadTrait"
  | HttpPrefixHeadersTrait _ -> "HttpPrefixHeadersTrait"
  | HttpQueryParams -> "HttpQueryParams"
  | HttpQueryTrait _ -> "HttpQueryTrait"
  | HttpResponseCodeTrait -> "HttpResponseCodeTrait"
  | HttpTrait _ -> "HttpTrait"
  | IdempotencyTokenTrait -> "IdempotencyTokenTrait"
  | IdempotentTrait -> "IdempotentTrait"
  | InputTrait -> "InputTrait"
  | InternalTrait -> "InternalTrait"
  | JsonNameTrait _ -> "JsonNameTrait"
  | LengthTrait _ -> "LengthTrait"
  | MediaTypeTrait _ -> "MediaTypeTrait"
  | OptionalAuthTrait -> "OptionalAuthTrait"
  | OutputTrait -> "OutputTrait"
  | PaginatedTrait -> "PaginatedTrait"
  | PatternTrait _ -> "PatternTrait"
  | RangeTrait _ -> "RangeTrait"
  | ReadonlyTrait -> "ReadonlyTrait"
  | ReferencesTrait _ -> "ReferencesTrait"
  | RequiredTrait -> "RequiredTrait"
  | RequiresLengthTrait -> "RequiresLengthTrait"
  | RequestCompressionTrait _ -> "RequestCompressionTrait"
  | RetryableTrait -> "RetryableTrait"
  | RulesEndpointRuleSetTrait -> "RulesEndpointRuleSetTrait"
  | RulesEndpointTests -> "RulesEndpointTests"
  | RulesContextParam _ -> "RulesContextParam"
  | RulesStaticContextParams _ -> "RulesStaticContextParams"
  | RulesOperationContextParams _ -> "RulesOperationContextParams"
  | SensitiveTrait -> "SensitiveTrait"
  | ServiceTrait _ -> "ServiceTrait"
  | SparseTrait -> "SparseTrait"
  | StreamingTrait -> "StreamingTrait"
  | SuppressTrait -> "SuppressTrait"
  | TagsTrait _ -> "TagsTrait"
  | TimestampFormatTrait _ -> "TimestampFormatTrait"
  | TestSmokeTests -> "TestSmokeTests"
  | TestHttpResponseTests _ -> "TestHttpResponseTests"
  | WaitableTrait -> "WaitableTrait"
  | XmlAttributeTrait -> "XmlAttributeTrait"
  | XmlFlattenedTrait -> "XmlFlattenedTrait"
  | XmlNameTrait _ -> "XmlNameTrait"
  | PrivateTrait -> "PrivateTrait"
  | TestHttpRequestTests _ -> "TestHttpRequestTests"
  | IdRefTrait _ -> "IdRefTrait"
  | UnspecifiedTrait (name, _) -> "UnspecifiedTrait(" ^ name ^ ")"

let hasTrait traitsOption traitTest =
  Option.value ~default:false
    (Option.map
       ~f:(fun traits -> List.exists ~f:(fun trait -> traitTest trait) traits)
       traitsOption)

let findTrait traits traitsTest = traits |> List.find ~f:traitsTest

let extractTrait extractor traits =
  List.find_map_exn (traits |> Option.value ~default:[]) ~f:extractor

let extractServiceTrait = extractTrait (function ServiceTrait x -> Some x | _ -> None)
let extractDocumentationTrait = extractTrait (function DocumentationTrait x -> Some x | _ -> None)
