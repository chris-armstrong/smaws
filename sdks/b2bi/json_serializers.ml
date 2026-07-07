open Smaws_Lib.Json.SerializeHelpers
open Types

let x12_version_to_yojson (x : x12_version) =
  match x with
  | VERSION_5010_HIPAA -> `String "VERSION_5010_HIPAA"
  | VERSION_5010 -> `String "VERSION_5010"
  | VERSION_4060 -> `String "VERSION_4060"
  | VERSION_4050 -> `String "VERSION_4050"
  | VERSION_4030 -> `String "VERSION_4030"
  | VERSION_4010 -> `String "VERSION_4010"

let element_id_to_yojson = string_to_yojson

let code_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let x12_code_list_validation_rule_to_yojson (x : x12_code_list_validation_rule) =
  assoc_to_yojson
    [
      ("codesToRemove", option_to_yojson code_list_to_yojson x.codes_to_remove);
      ("codesToAdd", option_to_yojson code_list_to_yojson x.codes_to_add);
      ("elementId", Some (element_id_to_yojson x.element_id));
    ]

let x12_element_length_validation_rule_to_yojson (x : x12_element_length_validation_rule) =
  assoc_to_yojson
    [
      ("minLength", Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.min_length));
      ("maxLength", Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_length));
      ("elementId", Some (element_id_to_yojson x.element_id));
    ]

let element_position_to_yojson = string_to_yojson

let element_requirement_to_yojson (x : element_requirement) =
  match x with MANDATORY -> `String "MANDATORY" | OPTIONAL -> `String "OPTIONAL"

let x12_element_requirement_validation_rule_to_yojson (x : x12_element_requirement_validation_rule)
    =
  assoc_to_yojson
    [
      ("requirement", Some (element_requirement_to_yojson x.requirement));
      ("elementPosition", Some (element_position_to_yojson x.element_position));
    ]

let x12_validation_rule_to_yojson (x : x12_validation_rule) =
  match x with
  | ElementRequirementValidationRule arg ->
      assoc_to_yojson
        [
          ( "elementRequirementValidationRule",
            Some (x12_element_requirement_validation_rule_to_yojson arg) );
        ]
  | ElementLengthValidationRule arg ->
      assoc_to_yojson
        [ ("elementLengthValidationRule", Some (x12_element_length_validation_rule_to_yojson arg)) ]
  | CodeListValidationRule arg ->
      assoc_to_yojson
        [ ("codeListValidationRule", Some (x12_code_list_validation_rule_to_yojson arg)) ]

let x12_validation_rules_to_yojson tree = list_to_yojson x12_validation_rule_to_yojson tree

let x12_validation_options_to_yojson (x : x12_validation_options) =
  assoc_to_yojson
    [ ("validationRules", option_to_yojson x12_validation_rules_to_yojson x.validation_rules) ]

let x12_validate_edi_to_yojson = bool_to_yojson
let x12_usage_indicator_code_to_yojson = string_to_yojson

let x12_transaction_set_to_yojson (x : x12_transaction_set) =
  match x with
  | X12_999_X231 -> `String "X12_999_X231"
  | X12_837_X298 -> `String "X12_837_X298"
  | X12_837_X292 -> `String "X12_837_X292"
  | X12_837_X291 -> `String "X12_837_X291"
  | X12_837_X224 -> `String "X12_837_X224"
  | X12_837_X223 -> `String "X12_837_X223"
  | X12_837_X222 -> `String "X12_837_X222"
  | X12_835_X221 -> `String "X12_835_X221"
  | X12_834_X318 -> `String "X12_834_X318"
  | X12_834_X307 -> `String "X12_834_X307"
  | X12_834_X220 -> `String "X12_834_X220"
  | X12_824_X186 -> `String "X12_824_X186"
  | X12_820_X306 -> `String "X12_820_X306"
  | X12_820_X218 -> `String "X12_820_X218"
  | X12_278_X217 -> `String "X12_278_X217"
  | X12_277_X364 -> `String "X12_277_X364"
  | X12_277_X214 -> `String "X12_277_X214"
  | X12_277_X212 -> `String "X12_277_X212"
  | X12_276_X212 -> `String "X12_276_X212"
  | X12_275_X211 -> `String "X12_275_X211"
  | X12_275_X210 -> `String "X12_275_X210"
  | X12_271_X279 -> `String "X12_271_X279"
  | X12_270_X279 -> `String "X12_270_X279"
  | X12_999 -> `String "X12_999"
  | X12_998 -> `String "X12_998"
  | X12_997 -> `String "X12_997"
  | X12_996 -> `String "X12_996"
  | X12_993 -> `String "X12_993"
  | X12_990 -> `String "X12_990"
  | X12_980 -> `String "X12_980"
  | X12_947 -> `String "X12_947"
  | X12_945 -> `String "X12_945"
  | X12_944 -> `String "X12_944"
  | X12_943 -> `String "X12_943"
  | X12_940 -> `String "X12_940"
  | X12_928 -> `String "X12_928"
  | X12_926 -> `String "X12_926"
  | X12_925 -> `String "X12_925"
  | X12_924 -> `String "X12_924"
  | X12_920 -> `String "X12_920"
  | X12_896 -> `String "X12_896"
  | X12_895 -> `String "X12_895"
  | X12_894 -> `String "X12_894"
  | X12_893 -> `String "X12_893"
  | X12_891 -> `String "X12_891"
  | X12_889 -> `String "X12_889"
  | X12_888 -> `String "X12_888"
  | X12_887 -> `String "X12_887"
  | X12_886 -> `String "X12_886"
  | X12_885 -> `String "X12_885"
  | X12_884 -> `String "X12_884"
  | X12_883 -> `String "X12_883"
  | X12_882 -> `String "X12_882"
  | X12_881 -> `String "X12_881"
  | X12_880 -> `String "X12_880"
  | X12_879 -> `String "X12_879"
  | X12_878 -> `String "X12_878"
  | X12_877 -> `String "X12_877"
  | X12_876 -> `String "X12_876"
  | X12_875 -> `String "X12_875"
  | X12_874 -> `String "X12_874"
  | X12_873 -> `String "X12_873"
  | X12_872 -> `String "X12_872"
  | X12_871 -> `String "X12_871"
  | X12_870 -> `String "X12_870"
  | X12_869 -> `String "X12_869"
  | X12_868 -> `String "X12_868"
  | X12_867 -> `String "X12_867"
  | X12_866 -> `String "X12_866"
  | X12_865 -> `String "X12_865"
  | X12_864 -> `String "X12_864"
  | X12_863 -> `String "X12_863"
  | X12_862 -> `String "X12_862"
  | X12_861 -> `String "X12_861"
  | X12_860 -> `String "X12_860"
  | X12_859 -> `String "X12_859"
  | X12_858 -> `String "X12_858"
  | X12_857 -> `String "X12_857"
  | X12_856 -> `String "X12_856"
  | X12_855 -> `String "X12_855"
  | X12_854 -> `String "X12_854"
  | X12_853 -> `String "X12_853"
  | X12_852 -> `String "X12_852"
  | X12_851 -> `String "X12_851"
  | X12_850 -> `String "X12_850"
  | X12_849 -> `String "X12_849"
  | X12_848 -> `String "X12_848"
  | X12_847 -> `String "X12_847"
  | X12_846 -> `String "X12_846"
  | X12_845 -> `String "X12_845"
  | X12_844 -> `String "X12_844"
  | X12_843 -> `String "X12_843"
  | X12_842 -> `String "X12_842"
  | X12_841 -> `String "X12_841"
  | X12_840 -> `String "X12_840"
  | X12_839 -> `String "X12_839"
  | X12_838 -> `String "X12_838"
  | X12_837 -> `String "X12_837"
  | X12_836 -> `String "X12_836"
  | X12_835 -> `String "X12_835"
  | X12_834 -> `String "X12_834"
  | X12_833 -> `String "X12_833"
  | X12_832 -> `String "X12_832"
  | X12_831 -> `String "X12_831"
  | X12_830 -> `String "X12_830"
  | X12_829 -> `String "X12_829"
  | X12_828 -> `String "X12_828"
  | X12_827 -> `String "X12_827"
  | X12_826 -> `String "X12_826"
  | X12_824 -> `String "X12_824"
  | X12_823 -> `String "X12_823"
  | X12_822 -> `String "X12_822"
  | X12_821 -> `String "X12_821"
  | X12_820 -> `String "X12_820"
  | X12_819 -> `String "X12_819"
  | X12_818 -> `String "X12_818"
  | X12_816 -> `String "X12_816"
  | X12_815 -> `String "X12_815"
  | X12_814 -> `String "X12_814"
  | X12_813 -> `String "X12_813"
  | X12_812 -> `String "X12_812"
  | X12_811 -> `String "X12_811"
  | X12_810 -> `String "X12_810"
  | X12_806 -> `String "X12_806"
  | X12_805 -> `String "X12_805"
  | X12_754 -> `String "X12_754"
  | X12_753 -> `String "X12_753"
  | X12_715 -> `String "X12_715"
  | X12_650 -> `String "X12_650"
  | X12_625 -> `String "X12_625"
  | X12_620 -> `String "X12_620"
  | X12_602 -> `String "X12_602"
  | X12_601 -> `String "X12_601"
  | X12_568 -> `String "X12_568"
  | X12_567 -> `String "X12_567"
  | X12_561 -> `String "X12_561"
  | X12_540 -> `String "X12_540"
  | X12_536 -> `String "X12_536"
  | X12_527 -> `String "X12_527"
  | X12_521 -> `String "X12_521"
  | X12_517 -> `String "X12_517"
  | X12_511 -> `String "X12_511"
  | X12_504 -> `String "X12_504"
  | X12_503 -> `String "X12_503"
  | X12_501 -> `String "X12_501"
  | X12_500 -> `String "X12_500"
  | X12_494 -> `String "X12_494"
  | X12_492 -> `String "X12_492"
  | X12_490 -> `String "X12_490"
  | X12_486 -> `String "X12_486"
  | X12_485 -> `String "X12_485"
  | X12_475 -> `String "X12_475"
  | X12_470 -> `String "X12_470"
  | X12_468 -> `String "X12_468"
  | X12_466 -> `String "X12_466"
  | X12_463 -> `String "X12_463"
  | X12_460 -> `String "X12_460"
  | X12_456 -> `String "X12_456"
  | X12_455 -> `String "X12_455"
  | X12_453 -> `String "X12_453"
  | X12_452 -> `String "X12_452"
  | X12_451 -> `String "X12_451"
  | X12_440 -> `String "X12_440"
  | X12_437 -> `String "X12_437"
  | X12_436 -> `String "X12_436"
  | X12_435 -> `String "X12_435"
  | X12_434 -> `String "X12_434"
  | X12_433 -> `String "X12_433"
  | X12_432 -> `String "X12_432"
  | X12_431 -> `String "X12_431"
  | X12_429 -> `String "X12_429"
  | X12_426 -> `String "X12_426"
  | X12_425 -> `String "X12_425"
  | X12_424 -> `String "X12_424"
  | X12_423 -> `String "X12_423"
  | X12_422 -> `String "X12_422"
  | X12_421 -> `String "X12_421"
  | X12_420 -> `String "X12_420"
  | X12_419 -> `String "X12_419"
  | X12_418 -> `String "X12_418"
  | X12_417 -> `String "X12_417"
  | X12_414 -> `String "X12_414"
  | X12_412 -> `String "X12_412"
  | X12_410 -> `String "X12_410"
  | X12_404 -> `String "X12_404"
  | X12_362 -> `String "X12_362"
  | X12_361 -> `String "X12_361"
  | X12_358 -> `String "X12_358"
  | X12_357 -> `String "X12_357"
  | X12_356 -> `String "X12_356"
  | X12_355 -> `String "X12_355"
  | X12_354 -> `String "X12_354"
  | X12_353 -> `String "X12_353"
  | X12_352 -> `String "X12_352"
  | X12_350 -> `String "X12_350"
  | X12_326 -> `String "X12_326"
  | X12_325 -> `String "X12_325"
  | X12_324 -> `String "X12_324"
  | X12_323 -> `String "X12_323"
  | X12_322 -> `String "X12_322"
  | X12_319 -> `String "X12_319"
  | X12_317 -> `String "X12_317"
  | X12_315 -> `String "X12_315"
  | X12_313 -> `String "X12_313"
  | X12_312 -> `String "X12_312"
  | X12_311 -> `String "X12_311"
  | X12_310 -> `String "X12_310"
  | X12_309 -> `String "X12_309"
  | X12_304 -> `String "X12_304"
  | X12_303 -> `String "X12_303"
  | X12_301 -> `String "X12_301"
  | X12_300 -> `String "X12_300"
  | X12_290 -> `String "X12_290"
  | X12_288 -> `String "X12_288"
  | X12_286 -> `String "X12_286"
  | X12_285 -> `String "X12_285"
  | X12_284 -> `String "X12_284"
  | X12_283 -> `String "X12_283"
  | X12_280 -> `String "X12_280"
  | X12_278 -> `String "X12_278"
  | X12_277 -> `String "X12_277"
  | X12_276 -> `String "X12_276"
  | X12_275 -> `String "X12_275"
  | X12_274 -> `String "X12_274"
  | X12_273 -> `String "X12_273"
  | X12_272 -> `String "X12_272"
  | X12_271 -> `String "X12_271"
  | X12_270 -> `String "X12_270"
  | X12_269 -> `String "X12_269"
  | X12_268 -> `String "X12_268"
  | X12_267 -> `String "X12_267"
  | X12_266 -> `String "X12_266"
  | X12_265 -> `String "X12_265"
  | X12_264 -> `String "X12_264"
  | X12_263 -> `String "X12_263"
  | X12_262 -> `String "X12_262"
  | X12_261 -> `String "X12_261"
  | X12_260 -> `String "X12_260"
  | X12_259 -> `String "X12_259"
  | X12_256 -> `String "X12_256"
  | X12_255 -> `String "X12_255"
  | X12_252 -> `String "X12_252"
  | X12_251 -> `String "X12_251"
  | X12_250 -> `String "X12_250"
  | X12_249 -> `String "X12_249"
  | X12_248 -> `String "X12_248"
  | X12_245 -> `String "X12_245"
  | X12_244 -> `String "X12_244"
  | X12_242 -> `String "X12_242"
  | X12_240 -> `String "X12_240"
  | X12_228 -> `String "X12_228"
  | X12_227 -> `String "X12_227"
  | X12_225 -> `String "X12_225"
  | X12_224 -> `String "X12_224"
  | X12_223 -> `String "X12_223"
  | X12_222 -> `String "X12_222"
  | X12_220 -> `String "X12_220"
  | X12_219 -> `String "X12_219"
  | X12_218 -> `String "X12_218"
  | X12_217 -> `String "X12_217"
  | X12_216 -> `String "X12_216"
  | X12_215 -> `String "X12_215"
  | X12_214 -> `String "X12_214"
  | X12_213 -> `String "X12_213"
  | X12_212 -> `String "X12_212"
  | X12_211 -> `String "X12_211"
  | X12_210 -> `String "X12_210"
  | X12_206 -> `String "X12_206"
  | X12_205 -> `String "X12_205"
  | X12_204 -> `String "X12_204"
  | X12_203 -> `String "X12_203"
  | X12_202 -> `String "X12_202"
  | X12_201 -> `String "X12_201"
  | X12_200 -> `String "X12_200"
  | X12_199 -> `String "X12_199"
  | X12_198 -> `String "X12_198"
  | X12_197 -> `String "X12_197"
  | X12_196 -> `String "X12_196"
  | X12_195 -> `String "X12_195"
  | X12_194 -> `String "X12_194"
  | X12_191 -> `String "X12_191"
  | X12_190 -> `String "X12_190"
  | X12_189 -> `String "X12_189"
  | X12_188 -> `String "X12_188"
  | X12_187 -> `String "X12_187"
  | X12_186 -> `String "X12_186"
  | X12_185 -> `String "X12_185"
  | X12_180 -> `String "X12_180"
  | X12_179 -> `String "X12_179"
  | X12_176 -> `String "X12_176"
  | X12_175 -> `String "X12_175"
  | X12_170 -> `String "X12_170"
  | X12_163 -> `String "X12_163"
  | X12_161 -> `String "X12_161"
  | X12_160 -> `String "X12_160"
  | X12_159 -> `String "X12_159"
  | X12_158 -> `String "X12_158"
  | X12_157 -> `String "X12_157"
  | X12_155 -> `String "X12_155"
  | X12_154 -> `String "X12_154"
  | X12_153 -> `String "X12_153"
  | X12_152 -> `String "X12_152"
  | X12_151 -> `String "X12_151"
  | X12_150 -> `String "X12_150"
  | X12_149 -> `String "X12_149"
  | X12_148 -> `String "X12_148"
  | X12_147 -> `String "X12_147"
  | X12_146 -> `String "X12_146"
  | X12_144 -> `String "X12_144"
  | X12_143 -> `String "X12_143"
  | X12_142 -> `String "X12_142"
  | X12_141 -> `String "X12_141"
  | X12_140 -> `String "X12_140"
  | X12_139 -> `String "X12_139"
  | X12_138 -> `String "X12_138"
  | X12_135 -> `String "X12_135"
  | X12_133 -> `String "X12_133"
  | X12_132 -> `String "X12_132"
  | X12_131 -> `String "X12_131"
  | X12_130 -> `String "X12_130"
  | X12_129 -> `String "X12_129"
  | X12_128 -> `String "X12_128"
  | X12_127 -> `String "X12_127"
  | X12_126 -> `String "X12_126"
  | X12_125 -> `String "X12_125"
  | X12_124 -> `String "X12_124"
  | X12_121 -> `String "X12_121"
  | X12_120 -> `String "X12_120"
  | X12_113 -> `String "X12_113"
  | X12_112 -> `String "X12_112"
  | X12_111 -> `String "X12_111"
  | X12_110 -> `String "X12_110"
  | X12_109 -> `String "X12_109"
  | X12_108 -> `String "X12_108"
  | X12_107 -> `String "X12_107"
  | X12_106 -> `String "X12_106"
  | X12_105 -> `String "X12_105"
  | X12_104 -> `String "X12_104"
  | X12_103 -> `String "X12_103"
  | X12_102 -> `String "X12_102"
  | X12_101 -> `String "X12_101"
  | X12_100 -> `String "X12_100"

let x12_technical_acknowledgment_to_yojson (x : x12_technical_acknowledgment) =
  match x with
  | GENERATE_ALL_SEGMENTS -> `String "GENERATE_ALL_SEGMENTS"
  | DO_NOT_GENERATE -> `String "DO_NOT_GENERATE"

let x12_split_by_to_yojson (x : x12_split_by) =
  match x with TRANSACTION -> `String "TRANSACTION" | NONE -> `String "NONE"

let x12_split_options_to_yojson (x : x12_split_options) =
  assoc_to_yojson [ ("splitBy", Some (x12_split_by_to_yojson x.split_by)) ]

let x12_sender_id_to_yojson = string_to_yojson
let x12_segment_terminator_to_yojson = string_to_yojson
let x12_responsible_agency_code_to_yojson = string_to_yojson
let x12_repetition_separator_to_yojson = string_to_yojson
let x12_receiver_id_to_yojson = string_to_yojson
let x12_id_qualifier_to_yojson = string_to_yojson
let x12_acknowledgment_requested_code_to_yojson = string_to_yojson

let x12_interchange_control_headers_to_yojson (x : x12_interchange_control_headers) =
  assoc_to_yojson
    [
      ( "usageIndicatorCode",
        option_to_yojson x12_usage_indicator_code_to_yojson x.usage_indicator_code );
      ( "acknowledgmentRequestedCode",
        option_to_yojson x12_acknowledgment_requested_code_to_yojson x.acknowledgment_requested_code
      );
      ( "repetitionSeparator",
        option_to_yojson x12_repetition_separator_to_yojson x.repetition_separator );
      ("receiverId", option_to_yojson x12_receiver_id_to_yojson x.receiver_id);
      ("receiverIdQualifier", option_to_yojson x12_id_qualifier_to_yojson x.receiver_id_qualifier);
      ("senderId", option_to_yojson x12_sender_id_to_yojson x.sender_id);
      ("senderIdQualifier", option_to_yojson x12_id_qualifier_to_yojson x.sender_id_qualifier);
    ]

let x12_application_sender_code_to_yojson = string_to_yojson
let x12_application_receiver_code_to_yojson = string_to_yojson

let x12_functional_group_headers_to_yojson (x : x12_functional_group_headers) =
  assoc_to_yojson
    [
      ( "responsibleAgencyCode",
        option_to_yojson x12_responsible_agency_code_to_yojson x.responsible_agency_code );
      ( "applicationReceiverCode",
        option_to_yojson x12_application_receiver_code_to_yojson x.application_receiver_code );
      ( "applicationSenderCode",
        option_to_yojson x12_application_sender_code_to_yojson x.application_sender_code );
    ]

let x12_component_separator_to_yojson = string_to_yojson
let x12_data_element_separator_to_yojson = string_to_yojson

let x12_delimiters_to_yojson (x : x12_delimiters) =
  assoc_to_yojson
    [
      ("segmentTerminator", option_to_yojson x12_segment_terminator_to_yojson x.segment_terminator);
      ( "dataElementSeparator",
        option_to_yojson x12_data_element_separator_to_yojson x.data_element_separator );
      ( "componentSeparator",
        option_to_yojson x12_component_separator_to_yojson x.component_separator );
    ]

let starting_interchange_control_number_to_yojson = int_to_yojson
let starting_functional_group_control_number_to_yojson = int_to_yojson
let starting_transaction_set_control_number_to_yojson = int_to_yojson

let x12_control_numbers_to_yojson (x : x12_control_numbers) =
  assoc_to_yojson
    [
      ( "startingTransactionSetControlNumber",
        option_to_yojson starting_transaction_set_control_number_to_yojson
          x.starting_transaction_set_control_number );
      ( "startingFunctionalGroupControlNumber",
        option_to_yojson starting_functional_group_control_number_to_yojson
          x.starting_functional_group_control_number );
      ( "startingInterchangeControlNumber",
        option_to_yojson starting_interchange_control_number_to_yojson
          x.starting_interchange_control_number );
    ]

let x12gs05_time_format_to_yojson (x : x12gs05_time_format) =
  match x with
  | HHMMSSDD -> `String "HHMMSSDD"
  | HHMMSS -> `String "HHMMSS"
  | HHMM -> `String "HHMM"

let x12_outbound_edi_headers_to_yojson (x : x12_outbound_edi_headers) =
  assoc_to_yojson
    [
      ("gs05TimeFormat", option_to_yojson x12gs05_time_format_to_yojson x.gs05_time_format);
      ("controlNumbers", option_to_yojson x12_control_numbers_to_yojson x.control_numbers);
      ("validateEdi", option_to_yojson x12_validate_edi_to_yojson x.validate_edi);
      ("delimiters", option_to_yojson x12_delimiters_to_yojson x.delimiters);
      ( "functionalGroupHeaders",
        option_to_yojson x12_functional_group_headers_to_yojson x.functional_group_headers );
      ( "interchangeControlHeaders",
        option_to_yojson x12_interchange_control_headers_to_yojson x.interchange_control_headers );
    ]

let x12_functional_acknowledgment_to_yojson (x : x12_functional_acknowledgment) =
  match x with
  | GENERATE_WITHOUT_TRANSACTION_SET_RESPONSE_LOOP ->
      `String "GENERATE_WITHOUT_TRANSACTION_SET_RESPONSE_LOOP"
  | GENERATE_ALL_SEGMENTS -> `String "GENERATE_ALL_SEGMENTS"
  | DO_NOT_GENERATE -> `String "DO_NOT_GENERATE"

let x12_acknowledgment_options_to_yojson (x : x12_acknowledgment_options) =
  assoc_to_yojson
    [
      ( "technicalAcknowledgment",
        Some (x12_technical_acknowledgment_to_yojson x.technical_acknowledgment) );
      ( "functionalAcknowledgment",
        Some (x12_functional_acknowledgment_to_yojson x.functional_acknowledgment) );
    ]

let x12_inbound_edi_options_to_yojson (x : x12_inbound_edi_options) =
  assoc_to_yojson
    [
      ( "acknowledgmentOptions",
        option_to_yojson x12_acknowledgment_options_to_yojson x.acknowledgment_options );
    ]

let wrap_format_to_yojson (x : wrap_format) =
  match x with
  | LINE_LENGTH -> `String "LINE_LENGTH"
  | ONE_LINE -> `String "ONE_LINE"
  | SEGMENT -> `String "SEGMENT"

let line_terminator_to_yojson (x : line_terminator) =
  match x with CR -> `String "CR" | LF -> `String "LF" | CRLF -> `String "CRLF"

let line_length_to_yojson = int_to_yojson

let wrap_options_to_yojson (x : wrap_options) =
  assoc_to_yojson
    [
      ("lineLength", option_to_yojson line_length_to_yojson x.line_length);
      ("lineTerminator", option_to_yojson line_terminator_to_yojson x.line_terminator);
      ("wrapBy", Some (wrap_format_to_yojson x.wrap_by));
    ]

let x12_envelope_to_yojson (x : x12_envelope) =
  assoc_to_yojson
    [
      ("wrapOptions", option_to_yojson wrap_options_to_yojson x.wrap_options);
      ("common", option_to_yojson x12_outbound_edi_headers_to_yojson x.common);
    ]

let x12_details_to_yojson (x : x12_details) =
  assoc_to_yojson
    [
      ("version", option_to_yojson x12_version_to_yojson x.version);
      ("transactionSet", option_to_yojson x12_transaction_set_to_yojson x.transaction_set);
    ]

let x12_advanced_options_to_yojson (x : x12_advanced_options) =
  assoc_to_yojson
    [
      ("validationOptions", option_to_yojson x12_validation_options_to_yojson x.validation_options);
      ("splitOptions", option_to_yojson x12_split_options_to_yojson x.split_options);
    ]

let validation_messages_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let error_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", Some (error_message_to_yojson x.message)) ]

let transformer_id_to_yojson = string_to_yojson
let resource_arn_to_yojson = string_to_yojson
let transformer_name_to_yojson = string_to_yojson

let transformer_status_to_yojson (x : transformer_status) =
  match x with INACTIVE -> `String "inactive" | ACTIVE -> `String "active"

let created_date_to_yojson = timestamp_iso_8601_to_yojson
let modified_date_to_yojson = timestamp_iso_8601_to_yojson

let file_format_to_yojson (x : file_format) =
  match x with NOT_USED -> `String "NOT_USED" | JSON -> `String "JSON" | XML -> `String "XML"

let mapping_template_to_yojson = string_to_yojson

let edi_type_to_yojson (x : edi_type) =
  match x with
  | X12Details arg -> assoc_to_yojson [ ("x12Details", Some (x12_details_to_yojson arg)) ]

let file_location_to_yojson = string_to_yojson
let from_format_to_yojson (x : from_format) = match x with X12 -> `String "X12"

let format_options_to_yojson (x : format_options) =
  match x with X12 arg -> assoc_to_yojson [ ("x12", Some (x12_details_to_yojson arg)) ]

let advanced_options_to_yojson (x : advanced_options) =
  assoc_to_yojson [ ("x12", option_to_yojson x12_advanced_options_to_yojson x.x12) ]

let input_conversion_to_yojson (x : input_conversion) =
  assoc_to_yojson
    [
      ("advancedOptions", option_to_yojson advanced_options_to_yojson x.advanced_options);
      ("formatOptions", option_to_yojson format_options_to_yojson x.format_options);
      ("fromFormat", Some (from_format_to_yojson x.from_format));
    ]

let mapping_template_language_to_yojson (x : mapping_template_language) =
  match x with JSONATA -> `String "JSONATA" | XSLT -> `String "XSLT"

let mapping_to_yojson (x : mapping) =
  assoc_to_yojson
    [
      ("template", option_to_yojson mapping_template_to_yojson x.template);
      ("templateLanguage", Some (mapping_template_language_to_yojson x.template_language));
    ]

let to_format_to_yojson (x : to_format) = match x with X12 -> `String "X12"

let output_conversion_to_yojson (x : output_conversion) =
  assoc_to_yojson
    [
      ("advancedOptions", option_to_yojson advanced_options_to_yojson x.advanced_options);
      ("formatOptions", option_to_yojson format_options_to_yojson x.format_options);
      ("toFormat", Some (to_format_to_yojson x.to_format));
    ]

let bucket_name_to_yojson = string_to_yojson
let s3_key_to_yojson = string_to_yojson

let sample_document_keys_to_yojson (x : sample_document_keys) =
  assoc_to_yojson
    [
      ("output", option_to_yojson s3_key_to_yojson x.output);
      ("input", option_to_yojson s3_key_to_yojson x.input);
    ]

let key_list_to_yojson tree = list_to_yojson sample_document_keys_to_yojson tree

let sample_documents_to_yojson (x : sample_documents) =
  assoc_to_yojson
    [
      ("keys", Some (key_list_to_yojson x.keys));
      ("bucketName", Some (bucket_name_to_yojson x.bucket_name));
    ]

let update_transformer_response_to_yojson (x : update_transformer_response) =
  assoc_to_yojson
    [
      ("sampleDocuments", option_to_yojson sample_documents_to_yojson x.sample_documents);
      ("outputConversion", option_to_yojson output_conversion_to_yojson x.output_conversion);
      ("mapping", option_to_yojson mapping_to_yojson x.mapping);
      ("inputConversion", option_to_yojson input_conversion_to_yojson x.input_conversion);
      ("sampleDocument", option_to_yojson file_location_to_yojson x.sample_document);
      ("ediType", option_to_yojson edi_type_to_yojson x.edi_type);
      ("mappingTemplate", option_to_yojson mapping_template_to_yojson x.mapping_template);
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ("modifiedAt", Some (modified_date_to_yojson x.modified_at));
      ("createdAt", Some (created_date_to_yojson x.created_at));
      ("status", Some (transformer_status_to_yojson x.status));
      ("name", Some (transformer_name_to_yojson x.name));
      ("transformerArn", Some (resource_arn_to_yojson x.transformer_arn));
      ("transformerId", Some (transformer_id_to_yojson x.transformer_id));
    ]

let update_transformer_request_to_yojson (x : update_transformer_request) =
  assoc_to_yojson
    [
      ("sampleDocuments", option_to_yojson sample_documents_to_yojson x.sample_documents);
      ("outputConversion", option_to_yojson output_conversion_to_yojson x.output_conversion);
      ("mapping", option_to_yojson mapping_to_yojson x.mapping);
      ("inputConversion", option_to_yojson input_conversion_to_yojson x.input_conversion);
      ("sampleDocument", option_to_yojson file_location_to_yojson x.sample_document);
      ("ediType", option_to_yojson edi_type_to_yojson x.edi_type);
      ("mappingTemplate", option_to_yojson mapping_template_to_yojson x.mapping_template);
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ("status", option_to_yojson transformer_status_to_yojson x.status);
      ("name", option_to_yojson transformer_name_to_yojson x.name);
      ("transformerId", Some (transformer_id_to_yojson x.transformer_id));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ( "retryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
      ("message", Some (error_message_to_yojson x.message));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("quotaCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code));
      ("serviceCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code));
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("message", Some (error_message_to_yojson x.message));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", Some (error_message_to_yojson x.message)) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ( "retryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
      ("message", Some (error_message_to_yojson x.message));
    ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("message", Some (error_message_to_yojson x.message)) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", Some (error_message_to_yojson x.message)) ]

let profile_id_to_yojson = string_to_yojson
let profile_name_to_yojson = string_to_yojson
let email_to_yojson = string_to_yojson
let phone_to_yojson = string_to_yojson
let business_name_to_yojson = string_to_yojson

let logging_to_yojson (x : logging) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let log_group_name_to_yojson = string_to_yojson

let update_profile_response_to_yojson (x : update_profile_response) =
  assoc_to_yojson
    [
      ("modifiedAt", option_to_yojson modified_date_to_yojson x.modified_at);
      ("createdAt", Some (created_date_to_yojson x.created_at));
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("logging", option_to_yojson logging_to_yojson x.logging);
      ("businessName", Some (business_name_to_yojson x.business_name));
      ("phone", Some (phone_to_yojson x.phone));
      ("email", option_to_yojson email_to_yojson x.email);
      ("name", Some (profile_name_to_yojson x.name));
      ("profileArn", Some (resource_arn_to_yojson x.profile_arn));
      ("profileId", Some (profile_id_to_yojson x.profile_id));
    ]

let update_profile_request_to_yojson (x : update_profile_request) =
  assoc_to_yojson
    [
      ("businessName", option_to_yojson business_name_to_yojson x.business_name);
      ("phone", option_to_yojson phone_to_yojson x.phone);
      ("email", option_to_yojson email_to_yojson x.email);
      ("name", option_to_yojson profile_name_to_yojson x.name);
      ("profileId", Some (profile_id_to_yojson x.profile_id));
    ]

let partnership_id_to_yojson = string_to_yojson
let partner_name_to_yojson = string_to_yojson
let capability_id_to_yojson = string_to_yojson
let partnership_capabilities_to_yojson tree = list_to_yojson capability_id_to_yojson tree

let outbound_edi_options_to_yojson (x : outbound_edi_options) =
  match x with X12 arg -> assoc_to_yojson [ ("x12", Some (x12_envelope_to_yojson arg)) ]

let inbound_edi_options_to_yojson (x : inbound_edi_options) =
  assoc_to_yojson [ ("x12", option_to_yojson x12_inbound_edi_options_to_yojson x.x12) ]

let capability_options_to_yojson (x : capability_options) =
  assoc_to_yojson
    [
      ("inboundEdi", option_to_yojson inbound_edi_options_to_yojson x.inbound_edi);
      ("outboundEdi", option_to_yojson outbound_edi_options_to_yojson x.outbound_edi);
    ]

let trading_partner_id_to_yojson = string_to_yojson

let update_partnership_response_to_yojson (x : update_partnership_response) =
  assoc_to_yojson
    [
      ("modifiedAt", option_to_yojson modified_date_to_yojson x.modified_at);
      ("createdAt", Some (created_date_to_yojson x.created_at));
      ("tradingPartnerId", option_to_yojson trading_partner_id_to_yojson x.trading_partner_id);
      ("capabilityOptions", option_to_yojson capability_options_to_yojson x.capability_options);
      ("capabilities", option_to_yojson partnership_capabilities_to_yojson x.capabilities);
      ("phone", option_to_yojson phone_to_yojson x.phone);
      ("email", option_to_yojson email_to_yojson x.email);
      ("name", option_to_yojson partner_name_to_yojson x.name);
      ("partnershipArn", Some (resource_arn_to_yojson x.partnership_arn));
      ("partnershipId", Some (partnership_id_to_yojson x.partnership_id));
      ("profileId", Some (profile_id_to_yojson x.profile_id));
    ]

let update_partnership_request_to_yojson (x : update_partnership_request) =
  assoc_to_yojson
    [
      ("capabilityOptions", option_to_yojson capability_options_to_yojson x.capability_options);
      ("capabilities", option_to_yojson partnership_capabilities_to_yojson x.capabilities);
      ("name", option_to_yojson partner_name_to_yojson x.name);
      ("partnershipId", Some (partnership_id_to_yojson x.partnership_id));
    ]

let capability_name_to_yojson = string_to_yojson
let capability_type_to_yojson (x : capability_type) = match x with EDI -> `String "edi"

let capability_direction_to_yojson (x : capability_direction) =
  match x with OUTBOUND -> `String "OUTBOUND" | INBOUND -> `String "INBOUND"

let s3_location_to_yojson (x : s3_location) =
  assoc_to_yojson
    [
      ("key", option_to_yojson s3_key_to_yojson x.key);
      ("bucketName", option_to_yojson bucket_name_to_yojson x.bucket_name);
    ]

let edi_configuration_to_yojson (x : edi_configuration) =
  assoc_to_yojson
    [
      ("transformerId", Some (transformer_id_to_yojson x.transformer_id));
      ("outputLocation", Some (s3_location_to_yojson x.output_location));
      ("inputLocation", Some (s3_location_to_yojson x.input_location));
      ("type", Some (edi_type_to_yojson x.type_));
      ("capabilityDirection", option_to_yojson capability_direction_to_yojson x.capability_direction);
    ]

let capability_configuration_to_yojson (x : capability_configuration) =
  match x with Edi arg -> assoc_to_yojson [ ("edi", Some (edi_configuration_to_yojson arg)) ]

let instructions_documents_to_yojson tree = list_to_yojson s3_location_to_yojson tree

let update_capability_response_to_yojson (x : update_capability_response) =
  assoc_to_yojson
    [
      ("modifiedAt", option_to_yojson modified_date_to_yojson x.modified_at);
      ("createdAt", Some (created_date_to_yojson x.created_at));
      ( "instructionsDocuments",
        option_to_yojson instructions_documents_to_yojson x.instructions_documents );
      ("configuration", Some (capability_configuration_to_yojson x.configuration));
      ("type", Some (capability_type_to_yojson x.type_));
      ("name", Some (capability_name_to_yojson x.name));
      ("capabilityArn", Some (resource_arn_to_yojson x.capability_arn));
      ("capabilityId", Some (capability_id_to_yojson x.capability_id));
    ]

let update_capability_request_to_yojson (x : update_capability_request) =
  assoc_to_yojson
    [
      ( "instructionsDocuments",
        option_to_yojson instructions_documents_to_yojson x.instructions_documents );
      ("configuration", option_to_yojson capability_configuration_to_yojson x.configuration);
      ("name", option_to_yojson capability_name_to_yojson x.name);
      ("capabilityId", Some (capability_id_to_yojson x.capability_id));
    ]

let amazon_resource_name_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let transformer_summary_to_yojson (x : transformer_summary) =
  assoc_to_yojson
    [
      ("sampleDocuments", option_to_yojson sample_documents_to_yojson x.sample_documents);
      ("outputConversion", option_to_yojson output_conversion_to_yojson x.output_conversion);
      ("mapping", option_to_yojson mapping_to_yojson x.mapping);
      ("inputConversion", option_to_yojson input_conversion_to_yojson x.input_conversion);
      ("sampleDocument", option_to_yojson file_location_to_yojson x.sample_document);
      ("ediType", option_to_yojson edi_type_to_yojson x.edi_type);
      ("mappingTemplate", option_to_yojson mapping_template_to_yojson x.mapping_template);
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ("modifiedAt", option_to_yojson modified_date_to_yojson x.modified_at);
      ("createdAt", Some (created_date_to_yojson x.created_at));
      ("status", Some (transformer_status_to_yojson x.status));
      ("name", Some (transformer_name_to_yojson x.name));
      ("transformerId", Some (transformer_id_to_yojson x.transformer_id));
    ]

let transformer_list_to_yojson tree = list_to_yojson transformer_summary_to_yojson tree

let transformer_job_status_to_yojson (x : transformer_job_status) =
  match x with
  | FAILED -> `String "failed"
  | SUCCEEDED -> `String "succeeded"
  | RUNNING -> `String "running"

let transformer_job_id_to_yojson = string_to_yojson

let parsed_split_file_contents_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let test_parsing_response_to_yojson (x : test_parsing_response) =
  assoc_to_yojson
    [
      ("validationMessages", option_to_yojson validation_messages_to_yojson x.validation_messages);
      ( "parsedSplitFileContents",
        option_to_yojson parsed_split_file_contents_list_to_yojson x.parsed_split_file_contents );
      ( "parsedFileContent",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.parsed_file_content) );
    ]

let test_parsing_request_to_yojson (x : test_parsing_request) =
  assoc_to_yojson
    [
      ("advancedOptions", option_to_yojson advanced_options_to_yojson x.advanced_options);
      ("ediType", Some (edi_type_to_yojson x.edi_type));
      ("fileFormat", Some (file_format_to_yojson x.file_format));
      ("inputFile", Some (s3_location_to_yojson x.input_file));
    ]

let test_mapping_response_to_yojson (x : test_mapping_response) =
  assoc_to_yojson
    [
      ( "mappedFileContent",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.mapped_file_content) );
    ]

let test_mapping_input_file_content_to_yojson = string_to_yojson

let test_mapping_request_to_yojson (x : test_mapping_request) =
  assoc_to_yojson
    [
      ("fileFormat", Some (file_format_to_yojson x.file_format));
      ("mappingTemplate", Some (mapping_template_to_yojson x.mapping_template));
      ("inputFileContent", Some (test_mapping_input_file_content_to_yojson x.input_file_content));
    ]

let test_conversion_response_to_yojson (x : test_conversion_response) =
  assoc_to_yojson
    [
      ("validationMessages", option_to_yojson validation_messages_to_yojson x.validation_messages);
      ( "convertedFileContent",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.converted_file_content) );
    ]

let conversion_source_format_to_yojson (x : conversion_source_format) =
  match x with XML -> `String "XML" | JSON -> `String "JSON"

let input_file_source_to_yojson (x : input_file_source) =
  match x with
  | FileContent arg ->
      assoc_to_yojson
        [ ("fileContent", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]

let conversion_source_to_yojson (x : conversion_source) =
  assoc_to_yojson
    [
      ("inputFile", Some (input_file_source_to_yojson x.input_file));
      ("fileFormat", Some (conversion_source_format_to_yojson x.file_format));
    ]

let conversion_target_format_to_yojson (x : conversion_target_format) =
  match x with X12 -> `String "X12"

let conversion_target_format_details_to_yojson (x : conversion_target_format_details) =
  match x with X12 arg -> assoc_to_yojson [ ("x12", Some (x12_details_to_yojson arg)) ]

let output_sample_file_source_to_yojson (x : output_sample_file_source) =
  match x with
  | FileLocation arg -> assoc_to_yojson [ ("fileLocation", Some (s3_location_to_yojson arg)) ]

let conversion_target_to_yojson (x : conversion_target) =
  assoc_to_yojson
    [
      ("advancedOptions", option_to_yojson advanced_options_to_yojson x.advanced_options);
      ("outputSampleFile", option_to_yojson output_sample_file_source_to_yojson x.output_sample_file);
      ("formatDetails", option_to_yojson conversion_target_format_details_to_yojson x.format_details);
      ("fileFormat", Some (conversion_target_format_to_yojson x.file_format));
    ]

let test_conversion_request_to_yojson (x : test_conversion_request) =
  assoc_to_yojson
    [
      ("target", Some (conversion_target_to_yojson x.target));
      ("source", Some (conversion_source_to_yojson x.source));
    ]

let template_details_to_yojson (x : template_details) =
  match x with X12 arg -> assoc_to_yojson [ ("x12", Some (x12_details_to_yojson arg)) ]

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let start_transformer_job_response_to_yojson (x : start_transformer_job_response) =
  assoc_to_yojson [ ("transformerJobId", Some (transformer_job_id_to_yojson x.transformer_job_id)) ]

let start_transformer_job_request_to_yojson (x : start_transformer_job_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("transformerId", Some (transformer_id_to_yojson x.transformer_id));
      ("outputLocation", Some (s3_location_to_yojson x.output_location));
      ("inputFile", Some (s3_location_to_yojson x.input_file));
    ]

let s3_location_list_to_yojson tree = list_to_yojson s3_location_to_yojson tree

let profile_summary_to_yojson (x : profile_summary) =
  assoc_to_yojson
    [
      ("modifiedAt", option_to_yojson modified_date_to_yojson x.modified_at);
      ("createdAt", Some (created_date_to_yojson x.created_at));
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("logging", option_to_yojson logging_to_yojson x.logging);
      ("businessName", Some (business_name_to_yojson x.business_name));
      ("name", Some (profile_name_to_yojson x.name));
      ("profileId", Some (profile_id_to_yojson x.profile_id));
    ]

let profile_list_to_yojson tree = list_to_yojson profile_summary_to_yojson tree

let partnership_summary_to_yojson (x : partnership_summary) =
  assoc_to_yojson
    [
      ("modifiedAt", option_to_yojson modified_date_to_yojson x.modified_at);
      ("createdAt", Some (created_date_to_yojson x.created_at));
      ("tradingPartnerId", option_to_yojson trading_partner_id_to_yojson x.trading_partner_id);
      ("capabilityOptions", option_to_yojson capability_options_to_yojson x.capability_options);
      ("capabilities", option_to_yojson partnership_capabilities_to_yojson x.capabilities);
      ("name", option_to_yojson partner_name_to_yojson x.name);
      ("partnershipId", Some (partnership_id_to_yojson x.partnership_id));
      ("profileId", Some (profile_id_to_yojson x.profile_id));
    ]

let partnership_list_to_yojson tree = list_to_yojson partnership_summary_to_yojson tree
let page_token_to_yojson = string_to_yojson
let max_results_to_yojson = int_to_yojson

let mapping_type_to_yojson (x : mapping_type) =
  match x with XSLT -> `String "XSLT" | JSONATA -> `String "JSONATA"

let list_transformers_response_to_yojson (x : list_transformers_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
      ("transformers", Some (transformer_list_to_yojson x.transformers));
    ]

let list_transformers_request_to_yojson (x : list_transformers_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let list_profiles_response_to_yojson (x : list_profiles_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
      ("profiles", Some (profile_list_to_yojson x.profiles));
    ]

let list_profiles_request_to_yojson (x : list_profiles_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
    ]

let list_partnerships_response_to_yojson (x : list_partnerships_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
      ("partnerships", Some (partnership_list_to_yojson x.partnerships));
    ]

let list_partnerships_request_to_yojson (x : list_partnerships_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
      ("profileId", option_to_yojson profile_id_to_yojson x.profile_id);
    ]

let capability_summary_to_yojson (x : capability_summary) =
  assoc_to_yojson
    [
      ("modifiedAt", option_to_yojson modified_date_to_yojson x.modified_at);
      ("createdAt", Some (created_date_to_yojson x.created_at));
      ("type", Some (capability_type_to_yojson x.type_));
      ("name", Some (capability_name_to_yojson x.name));
      ("capabilityId", Some (capability_id_to_yojson x.capability_id));
    ]

let capability_list_to_yojson tree = list_to_yojson capability_summary_to_yojson tree

let list_capabilities_response_to_yojson (x : list_capabilities_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
      ("capabilities", Some (capability_list_to_yojson x.capabilities));
    ]

let list_capabilities_request_to_yojson (x : list_capabilities_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
    ]

let get_transformer_response_to_yojson (x : get_transformer_response) =
  assoc_to_yojson
    [
      ("sampleDocuments", option_to_yojson sample_documents_to_yojson x.sample_documents);
      ("outputConversion", option_to_yojson output_conversion_to_yojson x.output_conversion);
      ("mapping", option_to_yojson mapping_to_yojson x.mapping);
      ("inputConversion", option_to_yojson input_conversion_to_yojson x.input_conversion);
      ("sampleDocument", option_to_yojson file_location_to_yojson x.sample_document);
      ("ediType", option_to_yojson edi_type_to_yojson x.edi_type);
      ("mappingTemplate", option_to_yojson mapping_template_to_yojson x.mapping_template);
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ("modifiedAt", option_to_yojson modified_date_to_yojson x.modified_at);
      ("createdAt", Some (created_date_to_yojson x.created_at));
      ("status", Some (transformer_status_to_yojson x.status));
      ("name", Some (transformer_name_to_yojson x.name));
      ("transformerArn", Some (resource_arn_to_yojson x.transformer_arn));
      ("transformerId", Some (transformer_id_to_yojson x.transformer_id));
    ]

let get_transformer_request_to_yojson (x : get_transformer_request) =
  assoc_to_yojson [ ("transformerId", Some (transformer_id_to_yojson x.transformer_id)) ]

let get_transformer_job_response_to_yojson (x : get_transformer_job_response) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("outputFiles", option_to_yojson s3_location_list_to_yojson x.output_files);
      ("status", Some (transformer_job_status_to_yojson x.status));
    ]

let get_transformer_job_request_to_yojson (x : get_transformer_job_request) =
  assoc_to_yojson
    [
      ("transformerId", Some (transformer_id_to_yojson x.transformer_id));
      ("transformerJobId", Some (transformer_job_id_to_yojson x.transformer_job_id));
    ]

let get_profile_response_to_yojson (x : get_profile_response) =
  assoc_to_yojson
    [
      ("modifiedAt", option_to_yojson modified_date_to_yojson x.modified_at);
      ("createdAt", Some (created_date_to_yojson x.created_at));
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("logging", option_to_yojson logging_to_yojson x.logging);
      ("businessName", Some (business_name_to_yojson x.business_name));
      ("phone", Some (phone_to_yojson x.phone));
      ("email", option_to_yojson email_to_yojson x.email);
      ("name", Some (profile_name_to_yojson x.name));
      ("profileArn", Some (resource_arn_to_yojson x.profile_arn));
      ("profileId", Some (profile_id_to_yojson x.profile_id));
    ]

let get_profile_request_to_yojson (x : get_profile_request) =
  assoc_to_yojson [ ("profileId", Some (profile_id_to_yojson x.profile_id)) ]

let get_partnership_response_to_yojson (x : get_partnership_response) =
  assoc_to_yojson
    [
      ("modifiedAt", option_to_yojson modified_date_to_yojson x.modified_at);
      ("createdAt", Some (created_date_to_yojson x.created_at));
      ("tradingPartnerId", option_to_yojson trading_partner_id_to_yojson x.trading_partner_id);
      ("capabilityOptions", option_to_yojson capability_options_to_yojson x.capability_options);
      ("capabilities", option_to_yojson partnership_capabilities_to_yojson x.capabilities);
      ("phone", option_to_yojson phone_to_yojson x.phone);
      ("email", option_to_yojson email_to_yojson x.email);
      ("name", option_to_yojson partner_name_to_yojson x.name);
      ("partnershipArn", Some (resource_arn_to_yojson x.partnership_arn));
      ("partnershipId", Some (partnership_id_to_yojson x.partnership_id));
      ("profileId", Some (profile_id_to_yojson x.profile_id));
    ]

let get_partnership_request_to_yojson (x : get_partnership_request) =
  assoc_to_yojson [ ("partnershipId", Some (partnership_id_to_yojson x.partnership_id)) ]

let get_capability_response_to_yojson (x : get_capability_response) =
  assoc_to_yojson
    [
      ("modifiedAt", option_to_yojson modified_date_to_yojson x.modified_at);
      ("createdAt", Some (created_date_to_yojson x.created_at));
      ( "instructionsDocuments",
        option_to_yojson instructions_documents_to_yojson x.instructions_documents );
      ("configuration", Some (capability_configuration_to_yojson x.configuration));
      ("type", Some (capability_type_to_yojson x.type_));
      ("name", Some (capability_name_to_yojson x.name));
      ("capabilityArn", Some (resource_arn_to_yojson x.capability_arn));
      ("capabilityId", Some (capability_id_to_yojson x.capability_id));
    ]

let get_capability_request_to_yojson (x : get_capability_request) =
  assoc_to_yojson [ ("capabilityId", Some (capability_id_to_yojson x.capability_id)) ]

let generate_mapping_response_to_yojson (x : generate_mapping_response) =
  assoc_to_yojson
    [
      ( "mappingAccuracy",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.mapping_accuracy
      );
      ( "mappingTemplate",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.mapping_template) );
    ]

let generate_mapping_input_file_content_to_yojson = string_to_yojson
let generate_mapping_output_file_content_to_yojson = string_to_yojson

let generate_mapping_request_to_yojson (x : generate_mapping_request) =
  assoc_to_yojson
    [
      ("mappingType", Some (mapping_type_to_yojson x.mapping_type));
      ( "outputFileContent",
        Some (generate_mapping_output_file_content_to_yojson x.output_file_content) );
      ("inputFileContent", Some (generate_mapping_input_file_content_to_yojson x.input_file_content));
    ]

let delete_transformer_request_to_yojson (x : delete_transformer_request) =
  assoc_to_yojson [ ("transformerId", Some (transformer_id_to_yojson x.transformer_id)) ]

let delete_profile_request_to_yojson (x : delete_profile_request) =
  assoc_to_yojson [ ("profileId", Some (profile_id_to_yojson x.profile_id)) ]

let delete_partnership_request_to_yojson (x : delete_partnership_request) =
  assoc_to_yojson [ ("partnershipId", Some (partnership_id_to_yojson x.partnership_id)) ]

let delete_capability_request_to_yojson (x : delete_capability_request) =
  assoc_to_yojson [ ("capabilityId", Some (capability_id_to_yojson x.capability_id)) ]

let create_transformer_response_to_yojson (x : create_transformer_response) =
  assoc_to_yojson
    [
      ("sampleDocuments", option_to_yojson sample_documents_to_yojson x.sample_documents);
      ("outputConversion", option_to_yojson output_conversion_to_yojson x.output_conversion);
      ("mapping", option_to_yojson mapping_to_yojson x.mapping);
      ("inputConversion", option_to_yojson input_conversion_to_yojson x.input_conversion);
      ("sampleDocument", option_to_yojson file_location_to_yojson x.sample_document);
      ("ediType", option_to_yojson edi_type_to_yojson x.edi_type);
      ("mappingTemplate", option_to_yojson mapping_template_to_yojson x.mapping_template);
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ("createdAt", Some (created_date_to_yojson x.created_at));
      ("status", Some (transformer_status_to_yojson x.status));
      ("name", Some (transformer_name_to_yojson x.name));
      ("transformerArn", Some (resource_arn_to_yojson x.transformer_arn));
      ("transformerId", Some (transformer_id_to_yojson x.transformer_id));
    ]

let create_transformer_request_to_yojson (x : create_transformer_request) =
  assoc_to_yojson
    [
      ("sampleDocuments", option_to_yojson sample_documents_to_yojson x.sample_documents);
      ("outputConversion", option_to_yojson output_conversion_to_yojson x.output_conversion);
      ("mapping", option_to_yojson mapping_to_yojson x.mapping);
      ("inputConversion", option_to_yojson input_conversion_to_yojson x.input_conversion);
      ("sampleDocument", option_to_yojson file_location_to_yojson x.sample_document);
      ("ediType", option_to_yojson edi_type_to_yojson x.edi_type);
      ("mappingTemplate", option_to_yojson mapping_template_to_yojson x.mapping_template);
      ("fileFormat", option_to_yojson file_format_to_yojson x.file_format);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "clientToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("name", Some (transformer_name_to_yojson x.name));
    ]

let create_starter_mapping_template_response_to_yojson
    (x : create_starter_mapping_template_response) =
  assoc_to_yojson
    [
      ( "mappingTemplate",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.mapping_template) );
    ]

let create_starter_mapping_template_request_to_yojson (x : create_starter_mapping_template_request)
    =
  assoc_to_yojson
    [
      ("templateDetails", Some (template_details_to_yojson x.template_details));
      ("mappingType", Some (mapping_type_to_yojson x.mapping_type));
      ("outputSampleLocation", option_to_yojson s3_location_to_yojson x.output_sample_location);
    ]

let create_profile_response_to_yojson (x : create_profile_response) =
  assoc_to_yojson
    [
      ("createdAt", Some (created_date_to_yojson x.created_at));
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("logging", option_to_yojson logging_to_yojson x.logging);
      ("email", option_to_yojson email_to_yojson x.email);
      ("phone", Some (phone_to_yojson x.phone));
      ("businessName", Some (business_name_to_yojson x.business_name));
      ("name", Some (profile_name_to_yojson x.name));
      ("profileArn", Some (resource_arn_to_yojson x.profile_arn));
      ("profileId", Some (profile_id_to_yojson x.profile_id));
    ]

let create_profile_request_to_yojson (x : create_profile_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "clientToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("logging", Some (logging_to_yojson x.logging));
      ("businessName", Some (business_name_to_yojson x.business_name));
      ("phone", Some (phone_to_yojson x.phone));
      ("email", option_to_yojson email_to_yojson x.email);
      ("name", Some (profile_name_to_yojson x.name));
    ]

let create_partnership_response_to_yojson (x : create_partnership_response) =
  assoc_to_yojson
    [
      ("createdAt", Some (created_date_to_yojson x.created_at));
      ("tradingPartnerId", option_to_yojson trading_partner_id_to_yojson x.trading_partner_id);
      ("capabilityOptions", option_to_yojson capability_options_to_yojson x.capability_options);
      ("capabilities", option_to_yojson partnership_capabilities_to_yojson x.capabilities);
      ("phone", option_to_yojson phone_to_yojson x.phone);
      ("email", option_to_yojson email_to_yojson x.email);
      ("name", option_to_yojson partner_name_to_yojson x.name);
      ("partnershipArn", Some (resource_arn_to_yojson x.partnership_arn));
      ("partnershipId", Some (partnership_id_to_yojson x.partnership_id));
      ("profileId", Some (profile_id_to_yojson x.profile_id));
    ]

let create_partnership_request_to_yojson (x : create_partnership_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "clientToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("capabilityOptions", option_to_yojson capability_options_to_yojson x.capability_options);
      ("capabilities", Some (partnership_capabilities_to_yojson x.capabilities));
      ("phone", option_to_yojson phone_to_yojson x.phone);
      ("email", Some (email_to_yojson x.email));
      ("name", Some (partner_name_to_yojson x.name));
      ("profileId", Some (profile_id_to_yojson x.profile_id));
    ]

let create_capability_response_to_yojson (x : create_capability_response) =
  assoc_to_yojson
    [
      ("createdAt", Some (created_date_to_yojson x.created_at));
      ( "instructionsDocuments",
        option_to_yojson instructions_documents_to_yojson x.instructions_documents );
      ("configuration", Some (capability_configuration_to_yojson x.configuration));
      ("type", Some (capability_type_to_yojson x.type_));
      ("name", Some (capability_name_to_yojson x.name));
      ("capabilityArn", Some (resource_arn_to_yojson x.capability_arn));
      ("capabilityId", Some (capability_id_to_yojson x.capability_id));
    ]

let create_capability_request_to_yojson (x : create_capability_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "clientToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "instructionsDocuments",
        option_to_yojson instructions_documents_to_yojson x.instructions_documents );
      ("configuration", Some (capability_configuration_to_yojson x.configuration));
      ("type", Some (capability_type_to_yojson x.type_));
      ("name", Some (capability_name_to_yojson x.name));
    ]
