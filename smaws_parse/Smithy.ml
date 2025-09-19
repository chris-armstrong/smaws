open Base
open Smithy_ast
open Json.Decode
open Json.ResultHelpers

type nonrec ('a, 'b) dual = Primary of 'a | Secondary of 'b

let fallback value parse1 parse2 =
  match parse1 value with
  | Ok parsed -> Ok (Primary parsed)
  | Error error -> (
      match error with
      | WrongType _ -> (
          match parse2 value with Ok parsed -> Ok (Secondary parsed) | Error error -> Error error)
      | _ -> Error error)

exception UnknownTrait of string

let extractTargetSpec target = target |> parseObject |> field "target" |> parseString

let parseServiceTrait traitResult =
  let value = parseObject traitResult in
  let sdkId_ = value |> field "sdkId" |> parseString in
  let arnNamespace_ = optional (value |> field "arnNamespace") |> mapOptional parseString in
  let cloudFormationName_ =
    optional (value |> field "cloudFormationName") |> mapOptional parseString
  in
  let cloudTrailEventSource_ =
    optional (value |> field "cloudTrailEventSource") |> mapOptional parseString
  in
  let endpointPrefix_ = optional (value |> field "endpointPrefix") |> mapOptional parseString in
  map5 sdkId_ arnNamespace_ cloudFormationName_ cloudTrailEventSource_ endpointPrefix_
    (fun sdkId arnNamespace cloudFormationName cloudTrailEventSource endpointPrefix ->
      Trait.ServiceTrait
        { sdkId; arnNamespace; cloudFormationName; cloudTrailEventSource; endpointPrefix })

let parseEnumNameValue enum : (Trait.enumPair, jsonParseError) Result.t =
  let obj_ = parseObject enum in
  let name_ = optional (obj_ |> field "name") |> mapOptional parseString in
  let value_ = obj_ |> field "value" |> parseString in
  map2 name_ value_ (fun name value ->
      let open Trait in
      { name; value })

let parseArnReferenceTrait value : (Trait.t, jsonParseError) Result.t =
  let record = parseObject value in
  let type__ = optional (record |> field "type") |> mapOptional parseString in
  let service_ = optional (record |> field "service") |> mapOptional parseString in
  let resource_ = optional (record |> field "resource") |> mapOptional parseString in
  map3 type__ service_ resource_ (fun type_ service resource ->
      Trait.AwsApiArnReferenceTrait { type_; service; resource })

let parseReference value : (Trait.reference, jsonParseError) Result.t =
  let object_ = value |> parseObject in
  let resource = object_ |> field "resource" |> parseString in
  let service = object_ |> field "service" |> optional |> mapOptional parseString in
  map2 resource service (fun resource service : Trait.reference -> { resource; service })

let parseStaticContextParamValue value =
  Result.bind value ~f:(fun { tree; path } ->
      match tree with
      | `String v -> Ok (Trait.StaticContextStringValue v)
      | `Bool v -> Ok (Trait.StaticContextBooleanValue v)
      | `List v ->
          value |> parseArray parseString
          |> Result.map ~f:(fun x -> Trait.StaticContextStringListValue x)
      | _ -> Error (WrongType ("string", path)))

let parseStaticContextParams value =
  let x =
    value
    |> parseRecord (fun name scf ->
           scf |> parseObject |> field "value" |> parseStaticContextParamValue
           |> Result.map ~f:(fun val_ -> (name, val_)))
  in
  Result.map x ~f:(fun x -> Trait.RulesStaticContextParams x)

let parseOperationContextParams value =
  let x =
    value
    |> parseRecord (fun name ocf ->
           ocf |> parseObject |> field "path" |> parseString
           |> Result.map ~f:(fun path -> (name, ({ path } : Trait.operationContextParam))))
  in
  Result.map x ~f:(fun x -> Trait.RulesOperationContextParams x)

let parseIdRef value =
  let object_ = value |> parseObject in
  let failWhenMissing = object_ |> field "failWhenMissing" |> parseBool |> optional in
  let selector = object_ |> field "selector" |> parseString |> optional in
  let errorMessage = object_ |> field "errorMessage" |> parseString |> optional in
  map3 failWhenMissing selector errorMessage (fun failWhenMissing selector errorMessage ->
      Trait.IdRefTrait { failWhenMissing; selector; errorMessage })

let parseEnumValue value =
  let value_ =
    value
    |> Result.bind ~f:(fun ({ tree; path } : jsonTreeRef) ->
           match tree with
           | `String x -> Ok (`String x)
           | `Int x -> Ok (`Int x)
           | _ -> Error (WrongType (path, "expected a string or integer")))
  in
  value_ |> Result.map ~f:(fun value_ -> Trait.EnumValueTrait value_)

let parseTestHttpRequestTests value =
  let ( let+ ) r f = Result.bind ~f r in
  let open Trait in
  let+ tests =
    parseArray
      (fun value ->
        let value = parseObject value in
        let+ id = value |> field "id" |> parseString in
        let+ protocol = value |> field "protocol" |> parseString in
        let+ method_ = value |> field "method" |> parseString in
        let+ uri = value |> field "uri" |> parseString in
        let+ host = optional (value |> field "host") |> mapOptional parseString in
        let+ resolvedHost = optional (value |> field "resolvedHost") |> mapOptional parseString in
        let+ authScheme = optional (value |> field "authScheme") |> mapOptional parseString in
        let+ queryParams =
          optional (value |> field "queryParams") |> mapOptional (parseArray parseString)
        in
        let+ forbidQueryParams =
          optional (value |> field "forbidQueryParams") |> mapOptional (parseArray parseString)
        in
        let+ headers =
          optional (value |> field "headers")
          |> mapOptional
               (parseRecord (fun name value_ ->
                    let value_ = value_ |> parseString in
                    map2 (Ok name) value_ (fun name value_ -> (name, value_))))
        in
        let+ forbidHeaders =
          optional (value |> field "forbidHeaders") |> mapOptional (parseArray parseString)
        in
        let+ body = optional (value |> field "body") |> mapOptional parseString in
        let+ bodyMediaType = optional (value |> field "bodyMediaType") |> mapOptional parseString in
        let+ params = optional (value |> field "params") |> mapOptional raw in
        let+ vendorParams = optional (value |> field "vendorParams") |> mapOptional raw in
        let+ vendorParamsShape =
          optional (value |> field "vendorParamsShape") |> mapOptional parseString
        in

        let+ documentation = optional (value |> field "documentation") |> mapOptional parseString in
        let+ tags = optional (value |> field "tags") |> mapOptional (parseArray parseString) in
        let+ appliesTo =
          optional (value |> field "appliesTo")
          |> mapOptional parseString
          |> Result.map ~f:(function
               | Some "server" -> Some `Server
               | Some "client" -> Some `Client
               | None -> None
               | _ -> failwith "unexpected value for appliesTo in HttpRequestTrait")
        in
        Ok
          {
            id;
            protocol;
            method_;
            uri;
            host;
            resolvedHost;
            authScheme;
            queryParams;
            forbidQueryParams;
            headers;
            forbidHeaders;
            body;
            bodyMediaType;
            params;
            vendorParams;
            vendorParamsShape;
            documentation;
            tags;
            appliesTo;
          })
      value
  in
  Ok (Trait.TestHttpRequestTests tests)

let parseTrait name (value : (jsonTreeRef, jsonParseError) Result.t) =
  let open Result in
  let traitValue =
    match name with
    | "aws.api#service" -> parseServiceTrait value
    | "smithy.api#documentation" ->
        value |> parseString
        |> Result.map ~f:(fun documentation -> Trait.DocumentationTrait documentation)
    | "smithy.api#required" -> Ok RequiredTrait
    | "smithy.api#xmlFlattened" -> Ok XmlFlattenedTrait
    | "smithy.api#xmlName" -> value |> parseString >>| fun xmlName -> Trait.XmlNameTrait xmlName
    | "smithy.api#error" -> (
        value |> parseString >>| fun error ->
        match error with "server" -> Trait.ErrorTrait Server | _ -> ErrorTrait Client)
    | "smithy.api#httpError" -> value |> parseInteger >>| fun error -> Trait.HttpErrorTrait error
    | "smithy.api#title" -> value |> parseString >>| fun title -> Trait.ApiTitleTrait title
    | "smithy.api#xmlNamespace" ->
        value |> parseObject |> field "uri" |> parseString >>| fun uri ->
        Trait.ApiXmlNamespaceTrait uri
    | "smithy.api#enum" ->
        value |> parseArray parseEnumNameValue >>| fun enumPairs -> Trait.EnumTrait enumPairs
    | "aws.auth#sigv4" ->
        value |> parseObject |> field "name" |> parseString >>| fun name ->
        Trait.AwsAuthSigV4Trait name
    | "aws.protocols#awsQuery" -> Ok Trait.AwsProtocolAwsQueryTrait
    | "smithy.api#paginated" -> Ok Trait.PaginatedTrait
    | "smithy.api#pattern" -> value |> parseString >>| fun pattern -> Trait.PatternTrait pattern
    | "smithy.api#cors" -> Ok CorsTrait
    | "aws.protocols#restJson1" -> Ok Trait.AwsProtocolRestJson1Trait
    | "smithy.api#idempotencyToken" -> Ok Trait.IdempotencyTokenTrait
    | "smithy.api#httpLabel" -> Ok Trait.HttpLabelTrait
    | "smithy.api#httpQuery" -> Ok Trait.HttpQueryTrait
    | "smithy.api#httpHeader" -> Ok Trait.HttpHeaderTrait
    | "smithy.api#retryable" -> Ok Trait.RetryableTrait
    | "smithy.api#timestampFormat" -> (
        value |> parseString >>| function
        | "date-time" -> Trait.TimestampFormatTrait TimestampFormatDateTime
        | "epoch-seconds" -> Trait.TimestampFormatTrait TimestampFormatEpochSeconds
        | "http-date" -> Trait.TimestampFormatTrait TimestampFormatHttpDate
        | x -> failwith (Fmt.str "unknown timestamp format value %s" x))
    | "smithy.api#range" ->
        let obj = value |> parseObject in
        let min = optional (obj |> field "min") |> mapOptional parseNumber in
        let max = optional (obj |> field "max") |> mapOptional parseNumber in
        map2 min max (fun min max -> Trait.RangeTrait (min, max))
    | "smithy.api#length" ->
        let record = value |> parseObject in
        map2
          (optional (record |> field "min") |> mapOptional parseInteger)
          (optional (record |> field "max") |> mapOptional parseInteger)
          (fun min max -> Trait.LengthTrait (min, max))
    | "aws.protocols#awsJson1_0" -> Ok Trait.AwsProtocolAwsJson1_0Trait
    | "aws.protocols#awsJson1_1" -> Ok Trait.AwsProtocolAwsJson1_1Trait
    | "smithy.api#box" -> Ok Trait.BoxTrait
    | "smithy.api#sensitive" -> Ok Trait.SensitiveTrait
    | "aws.api#arnReference" -> parseArnReferenceTrait value >>| fun arnNamespace -> arnNamespace
    | "smithy.api#references" ->
        value |> parseArray parseReference >>| fun references -> Trait.ReferencesTrait references
    | "smithy.api#jsonName" -> parseString value >>| fun jsonName -> Trait.JsonNameTrait jsonName
    | "smithy.api#httpPayload" -> Ok Trait.HttpPayloadTrait
    | "smithy.api#httpQueryParams" -> Ok Trait.HttpQueryParams
    | "smithy.api#tags" -> value |> parseArray parseString >>| fun tags -> Trait.TagsTrait tags
    | "smithy.api#deprecated" -> Ok Trait.DeprecatedTrait
    | "smithy.api#mediaType" ->
        parseString value >>| fun mediaType -> Trait.MediaTypeTrait mediaType
    | "aws.protocols#restXml" -> Ok Trait.AwsProtocolRestXmlTrait
    | "aws.api#clientEndpointDiscovery" ->
        let obj = parseObject value in
        let operation = obj |> field "operation" |> parseString in
        let error = obj |> field "error" |> parseString in
        map2 operation error (fun operation error ->
            Trait.AwsApiClientEndpointDiscoveryTrait { operation; error })
    | "aws.protocols#ec2QueryName" ->
        value |> parseString >>| fun queryName -> Trait.AwsProtocolEc2QueryNameTrait queryName
    | "aws.protocols#ec2Query" -> Ok Trait.AwsProtocolEc2QueryTrait
    | "smithy.api#httpResponseCode" -> Ok Trait.HttpResponseCodeTrait
    | "smithy.api#streaming" -> Ok Trait.StreamingTrait
    | "smithy.api#hostLabel" -> Ok Trait.HostLabelTrait
    | "smithy.api#httpPrefixHeaders" ->
        value |> parseString >>| fun httpPrefixHeader ->
        Trait.HttpPrefixHeadersTrait httpPrefixHeader
    | "smithy.api#xmlAttribute" -> Ok Trait.XmlAttributeTrait
    | "smithy.api#externalDocumentation" -> (
        let documentation = value |> parseObject |> field "Documentation" in
        let specification = value |> parseObject |> field "Specification" in
        match (documentation, specification) with
        | Ok link, _ ->
            Ok link |> parseString >>| fun link ->
            Trait.ExternalDocumentationTrait (Trait.DocumentationLink link)
        | _, Ok link ->
            Ok link |> parseString >>| fun link ->
            Trait.ExternalDocumentationTrait (Trait.SpecificationLink link)
        | Error x, Error _ -> Error x)
    | "smithy.api#eventPayload" -> Ok Trait.EventPayloadTrait
    | "smithy.api#http" -> Ok Trait.HttpTrait
    | "smithy.api#idempotent" -> Ok Trait.IdempotentTrait
    | "smithy.api#readonly" -> Ok Trait.ReadonlyTrait
    | "smithy.waiters#waitable" -> Ok Trait.WaitableTrait
    | "smithy.api#endpoint" -> Ok Trait.EndpointTrait
    | "smithy.api#auth" -> Ok Trait.AuthTrait
    | "smithy.api#optionalAuth" -> Ok Trait.OptionalAuthTrait
    | "smithy.api#suppress" -> Ok Trait.SuppressTrait
    | "aws.auth#unsignedPayload" -> Ok Trait.AwsAuthUnsignedPayloadTrait
    | "smithy.api#requiresLength" -> Ok Trait.RequiresLengthTrait
    | "smithy.api#requestCompression" ->
        value |> parseObject |> field "encodings" |> parseArray parseString >>| fun encodings ->
        Trait.RequestCompressionTrait encodings
    | "smithy.api#sparse" -> Ok Trait.SparseTrait
    | "smithy.api#httpChecksumRequired" -> Ok Trait.HttpChecksumRequiredTrait
    | "aws.api#clientDiscoveredEndpoint" -> Ok Trait.AwsApiClientDiscoveredEndpointTrait
    | "aws.protocols#awsQueryError" -> Ok Trait.AwsProtocolAwsQueryErrorTrait
    | "aws.cloudformation#cfnExcludeProperty" -> Ok Trait.AwsCloudFormationCfnExcludePropertyTrait
    | "aws.cloudformation#cfnMutability" -> Ok Trait.AwsCloudFormationCfnMutabilityTrait
    | "aws.iam#requiredActions" -> Ok Trait.AwsIamRequiredActionsTrait
    | "aws.api#dataPlane" -> Ok Trait.AwsApiDataPlaneTrait
    | "aws.iam#defineConditionKeys" -> Ok Trait.AwsIamDefineConditionKeysTrait
    | "smithy.api#examples" -> Ok Trait.ExamplesTrait
    | "aws.api#controlPlane" -> Ok Trait.AwsApiControlPlaneTrait
    | "aws.iam#actionPermissionDescription" -> Ok Trait.AwsIamActionPermissionDescriptionTrait
    | "aws.iam#conditionKeys" -> Ok Trait.AwsIamConditionKeysTrait
    | "aws.protocols#httpChecksum" -> Ok Trait.AwsProtocolsHttpChecksumTrait
    | "aws.customizations#s3UnwrappedXmlOutput" ->
        Ok Trait.AwsCustomizationsS3UnwrappedXmlOutputTrait
    | "smithy.api#input" -> Ok Trait.InputTrait
    | "smithy.api#output" -> Ok Trait.OutputTrait
    | "aws.protocols#awsQueryCompatible" -> Ok Trait.AwsProtocolAwsQueryCompatibleTrait
    | "smithy.rules#endpointRuleSet" -> Ok Trait.RulesEndpointRuleSetTrait
    | "smithy.rules#endpointTests" -> Ok Trait.RulesEndpointTests
    | "smithy.rules#contextParam" ->
        value |> parseObject |> field "name" |> parseString
        |> map ~f:(fun contextParam -> Trait.RulesContextParam contextParam)
    | "smithy.rules#staticContextParams" -> value |> parseStaticContextParams
    | "smithy.rules#operationContextParams" -> value |> parseOperationContextParams
    | "smithy.api#default" -> Ok Trait.DefaultTrait
    | "smithy.api#enumValue" -> value |> parseEnumValue
    | "smithy.test#smokeTests" -> Ok Trait.TestSmokeTests
    | "smithy.api#private" -> Ok Trait.PrivateTrait
    | "smithy.api#idRef" -> value |> parseIdRef
    | "smithy.test#httpRequestTests" -> value |> parseTestHttpRequestTests
    | unknownTrait -> Ok (Trait.UnspecifiedTrait (unknownTrait, value |> Json.Decode.raw_exn))
  in
  traitValue

let parseListShape shape =
  let target_ = shape |> field "member" |> extractTargetSpec in
  let traitParser = parseRecord parseTrait in
  let traits_ = optional (shape |> field "traits" |> traitParser) in
  map2 target_ traits_ (fun target traits -> Shape.ListShape { target; traits })

let parseMember name value =
  let member = parseObject value in
  let target_ = member |> field "target" |> parseString in
  let traits_ = optional (parseRecord parseTrait (member |> field "traits")) in
  map2 target_ traits_ (fun target traits ->
      let open Shape in
      ({ name; target; traits } : member))

let parseMembers value = parseRecord parseMember value

let parseStructureShape value =
  let members = value |> field "members" |> parseMembers in
  let traits = optional (value |> field "traits" |> parseRecord parseTrait) in
  map2 members traits (fun members traits -> Shape.StructureShape { members; traits })

let parseOperationShape shape =
  let inputTarget = optional (shape |> field "input" |> extractTargetSpec) in
  let outputTarget = optional (shape |> field "output" |> extractTargetSpec) in
  let errors = optional (shape |> field "errors" |> parseArray extractTargetSpec) in
  let traits = optional (shape |> field "traits" |> parseRecord parseTrait) in
  let documentation =
    optional
      (shape |> field "traits" |> parseObject |> field "smithy.api#documentation" |> parseString)
  in
  map5 inputTarget outputTarget errors documentation traits
    (fun inputValue outputValue errorsValue documentationValue traits ->
      Shape.OperationShape
        {
          input = inputValue;
          output = outputValue;
          errors = errorsValue;
          documentation = documentationValue;
          traits;
        })

let parseServiceShape shapeDict =
  let version_ = shapeDict |> field "version" |> parseString in
  let operations_ =
    optional (shapeDict |> field "operations")
    |> mapOptional (fun operations -> parseArray extractTargetSpec operations)
  in
  let traits_ =
    optional (shapeDict |> field "traits")
    |> mapOptional (fun traits -> traits |> parseRecord parseTrait)
  in
  map3 version_ operations_ traits_ (fun version operations traits ->
      Shape.ServiceShape { version; operations; traits })

let parseStringShape shapeDict =
  let traits_ =
    shapeDict |> field "traits" |> optional
    |> mapOptional (fun traits -> parseRecord parseTrait traits)
  in
  Result.map traits_ ~f:(fun traits ->
      let traits = Option.value ~default:[] traits in
      match List.find_map ~f:(function Trait.EnumTrait x -> Some x | _ -> None) traits with
      | Some enumPairs ->
          Shape.EnumShape
            {
              traits = None;
              members =
                List.map enumPairs ~f:(fun enumPair ->
                    Shape.
                      {
                        name = Option.value ~default:enumPair.value enumPair.name;
                        target = "smithy.api#Unit";
                        traits = Some [ Trait.EnumValueTrait (`String enumPair.value) ];
                      });
            }
      | None -> Shape.StringShape { traits = Some traits })

let parseMapKey value =
  let mapValue = value |> parseObject in
  let target_ = mapValue |> field "target" |> parseString in
  let traits_ =
    optional (mapValue |> field "traits")
    |> mapOptional (fun traits -> parseRecord parseTrait traits)
  in
  map2 target_ traits_ (fun target traits ->
      let open Shape in
      { target; traits })

let parseMapShape shapeDict =
  let key_ = parseMapKey (shapeDict |> field "key") in
  let value_ = parseMapKey (shapeDict |> field "value") in
  let traits_ =
    optional (shapeDict |> field "traits")
    |> mapOptional (fun traits -> traits |> parseRecord parseTrait)
  in
  map3 key_ value_ traits_ (fun key value traits ->
      Shape.MapShape { mapKey = key; mapValue = value; traits })

let parseUnionShape value =
  let members = value |> field "members" |> parseMembers in
  let traits = optional (value |> field "traits" |> parseRecord parseTrait) in
  map2 members traits (fun members traits -> Shape.UnionShape { members; traits })

let parsePrimitive shapeDict =
  let traits_ =
    optional (shapeDict |> field "traits")
    |> mapOptional (fun traits -> traits |> parseRecord parseTrait)
  in
  Result.map traits_ ~f:(fun traits : Shape.primitiveShapeDetails -> { traits })

let parseEnumShape value =
  let members = value |> field "members" |> parseMembers in
  let traits = optional (value |> field "traits" |> parseRecord parseTrait) in
  map2 members traits (fun members traits -> Shape.EnumShape { members; traits })

let parseResourceShape _ = Ok Shape.ResourceShape

let parseSetShape shapeDict =
  let target = shapeDict |> field "member" |> parseObject |> field "target" |> parseString in
  let traits =
    optional (shapeDict |> field "traits")
    |> mapOptional (fun traits -> traits |> parseRecord parseTrait)
  in
  map2 target traits (fun target traits -> Shape.SetShape { target; traits })

let parseTimestampShape shapeDict =
  let traits_ =
    optional (shapeDict |> field "traits")
    |> mapOptional (fun traits -> traits |> parseRecord parseTrait)
  in
  Result.map traits_ ~f:(fun traits -> Shape.TimestampShape { traits })

let parseDocumentShape shapeDict =
  let traits_ =
    optional (shapeDict |> field "traits")
    |> mapOptional (fun traits -> traits |> parseRecord parseTrait)
  in
  Result.map traits_ ~f:(fun traits -> Shape.DocumentShape)

let parseShape name shape =
  let open Result in
  let shapeDict = parseObject shape in
  let typeDiscriminator = shapeDict |> field "type" |> parseString in
  Result.bind typeDiscriminator ~f:(fun typeValue ->
      let descriptor_ =
        match typeValue with
        | "list" -> parseListShape shapeDict
        | "operation" -> parseOperationShape shapeDict
        | "structure" -> parseStructureShape shapeDict
        | "service" -> parseServiceShape shapeDict
        | "blob" -> parsePrimitive shapeDict >>| fun primitive -> Shape.BlobShape primitive
        | "boolean" -> parsePrimitive shapeDict >>| fun primitive -> Shape.BooleanShape primitive
        | "integer" -> parsePrimitive shapeDict >>| fun primitive -> Shape.IntegerShape primitive
        | "short" -> parsePrimitive shapeDict >>| fun primitive -> Shape.ShortShape primitive
        | "byte" -> parsePrimitive shapeDict >>| fun primitive -> Shape.ByteShape primitive
        | "string" -> parseStringShape shapeDict
        | "map" -> parseMapShape shapeDict
        | "union" -> parseUnionShape shapeDict
        | "resource" -> parseResourceShape shapeDict
        | "timestamp" -> parseTimestampShape shapeDict
        | "long" -> parsePrimitive shapeDict >>| fun primitive -> Shape.LongShape primitive
        | "double" -> parsePrimitive shapeDict >>| fun primitive -> Shape.DoubleShape primitive
        | "float" -> parsePrimitive shapeDict >>| fun primitive -> Shape.FloatShape primitive
        | "set" -> parseSetShape shapeDict
        (* TODO: these are technically different but they have the same shape and as long as the model is well-formed, this should give the right result *)
        | "intEnum" | "enum" -> parseEnumShape shapeDict
        | "document" -> parseDocumentShape shapeDict
        | _ -> Error (CustomError ("unknown shape type: " ^ typeValue))
      in

      Result.map descriptor_ ~f:(fun descriptor ->
          let open Shape in
          { name; descriptor }))

let parseShapes shapesModel = parseRecord parseShape shapesModel
let parseModel baseModel = baseModel |> parseObject |> field "shapes" |> parseShapes
