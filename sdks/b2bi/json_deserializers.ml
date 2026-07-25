open Smaws_Lib.Json.DeserializeHelpers
open Types

let error_message_of_yojson = string_of_yojson

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "message" _list path }
    : access_denied_exception)

let element_requirement_of_yojson (tree : t) path =
  ((match tree with
    | `String "OPTIONAL" -> OPTIONAL
    | `String "MANDATORY" -> MANDATORY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ElementRequirement" value)
    | _ -> raise (deserialize_wrong_type_error path "ElementRequirement")
     : element_requirement)
    : element_requirement)

let element_position_of_yojson = string_of_yojson

let x12_element_requirement_validation_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     element_position = value_for_key element_position_of_yojson "elementPosition" _list path;
     requirement = value_for_key element_requirement_of_yojson "requirement" _list path;
   }
    : x12_element_requirement_validation_rule)

let element_id_of_yojson = string_of_yojson

let x12_element_length_validation_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     element_id = value_for_key element_id_of_yojson "elementId" _list path;
     max_length =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxLength" _list
         path;
     min_length =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "minLength" _list
         path;
   }
    : x12_element_length_validation_rule)

let code_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let x12_code_list_validation_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     element_id = value_for_key element_id_of_yojson "elementId" _list path;
     codes_to_add = option_of_yojson (value_for_key code_list_of_yojson "codesToAdd") _list path;
     codes_to_remove =
       option_of_yojson (value_for_key code_list_of_yojson "codesToRemove") _list path;
   }
    : x12_code_list_validation_rule)

let x12_validation_rule_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "codeListValidationRule" ->
       CodeListValidationRule (x12_code_list_validation_rule_of_yojson value_ path)
   | "elementLengthValidationRule" ->
       ElementLengthValidationRule (x12_element_length_validation_rule_of_yojson value_ path)
   | "elementRequirementValidationRule" ->
       ElementRequirementValidationRule
         (x12_element_requirement_validation_rule_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "X12ValidationRule" unknown)
    : x12_validation_rule)

let x12_validation_rules_of_yojson tree path =
  list_of_yojson x12_validation_rule_of_yojson tree path

let x12_validation_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     validation_rules =
       option_of_yojson (value_for_key x12_validation_rules_of_yojson "validationRules") _list path;
   }
    : x12_validation_options)

let x12_split_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "TRANSACTION" -> TRANSACTION
    | `String value -> raise (deserialize_unknown_enum_value_error path "X12SplitBy" value)
    | _ -> raise (deserialize_wrong_type_error path "X12SplitBy")
     : x12_split_by)
    : x12_split_by)

let x12_split_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ split_by = value_for_key x12_split_by_of_yojson "splitBy" _list path } : x12_split_options)

let x12_advanced_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     split_options =
       option_of_yojson (value_for_key x12_split_options_of_yojson "splitOptions") _list path;
     validation_options =
       option_of_yojson
         (value_for_key x12_validation_options_of_yojson "validationOptions")
         _list path;
   }
    : x12_advanced_options)

let advanced_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ x12 = option_of_yojson (value_for_key x12_advanced_options_of_yojson "x12") _list path }
    : advanced_options)

let amazon_resource_name_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "Message" _list path } : validation_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "message" _list path }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key error_message_of_yojson "message" _list path;
     retry_after_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "retryAfterSeconds")
         _list path;
   }
    : internal_server_exception)

let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key error_message_of_yojson "message" _list path;
     retry_after_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "retryAfterSeconds")
         _list path;
   }
    : throttling_exception)

let validation_messages_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let parsed_split_file_contents_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let test_parsing_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parsed_file_content =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "parsedFileContent"
         _list path;
     parsed_split_file_contents =
       option_of_yojson
         (value_for_key parsed_split_file_contents_list_of_yojson "parsedSplitFileContents")
         _list path;
     validation_messages =
       option_of_yojson
         (value_for_key validation_messages_of_yojson "validationMessages")
         _list path;
   }
    : test_parsing_response)

let x12_version_of_yojson (tree : t) path =
  ((match tree with
    | `String "VERSION_4010" -> VERSION_4010
    | `String "VERSION_4030" -> VERSION_4030
    | `String "VERSION_4050" -> VERSION_4050
    | `String "VERSION_4060" -> VERSION_4060
    | `String "VERSION_5010" -> VERSION_5010
    | `String "VERSION_5010_HIPAA" -> VERSION_5010_HIPAA
    | `String value -> raise (deserialize_unknown_enum_value_error path "X12Version" value)
    | _ -> raise (deserialize_wrong_type_error path "X12Version")
     : x12_version)
    : x12_version)

let x12_transaction_set_of_yojson (tree : t) path =
  ((match tree with
    | `String "X12_100" -> X12_100
    | `String "X12_101" -> X12_101
    | `String "X12_102" -> X12_102
    | `String "X12_103" -> X12_103
    | `String "X12_104" -> X12_104
    | `String "X12_105" -> X12_105
    | `String "X12_106" -> X12_106
    | `String "X12_107" -> X12_107
    | `String "X12_108" -> X12_108
    | `String "X12_109" -> X12_109
    | `String "X12_110" -> X12_110
    | `String "X12_111" -> X12_111
    | `String "X12_112" -> X12_112
    | `String "X12_113" -> X12_113
    | `String "X12_120" -> X12_120
    | `String "X12_121" -> X12_121
    | `String "X12_124" -> X12_124
    | `String "X12_125" -> X12_125
    | `String "X12_126" -> X12_126
    | `String "X12_127" -> X12_127
    | `String "X12_128" -> X12_128
    | `String "X12_129" -> X12_129
    | `String "X12_130" -> X12_130
    | `String "X12_131" -> X12_131
    | `String "X12_132" -> X12_132
    | `String "X12_133" -> X12_133
    | `String "X12_135" -> X12_135
    | `String "X12_138" -> X12_138
    | `String "X12_139" -> X12_139
    | `String "X12_140" -> X12_140
    | `String "X12_141" -> X12_141
    | `String "X12_142" -> X12_142
    | `String "X12_143" -> X12_143
    | `String "X12_144" -> X12_144
    | `String "X12_146" -> X12_146
    | `String "X12_147" -> X12_147
    | `String "X12_148" -> X12_148
    | `String "X12_149" -> X12_149
    | `String "X12_150" -> X12_150
    | `String "X12_151" -> X12_151
    | `String "X12_152" -> X12_152
    | `String "X12_153" -> X12_153
    | `String "X12_154" -> X12_154
    | `String "X12_155" -> X12_155
    | `String "X12_157" -> X12_157
    | `String "X12_158" -> X12_158
    | `String "X12_159" -> X12_159
    | `String "X12_160" -> X12_160
    | `String "X12_161" -> X12_161
    | `String "X12_163" -> X12_163
    | `String "X12_170" -> X12_170
    | `String "X12_175" -> X12_175
    | `String "X12_176" -> X12_176
    | `String "X12_179" -> X12_179
    | `String "X12_180" -> X12_180
    | `String "X12_185" -> X12_185
    | `String "X12_186" -> X12_186
    | `String "X12_187" -> X12_187
    | `String "X12_188" -> X12_188
    | `String "X12_189" -> X12_189
    | `String "X12_190" -> X12_190
    | `String "X12_191" -> X12_191
    | `String "X12_194" -> X12_194
    | `String "X12_195" -> X12_195
    | `String "X12_196" -> X12_196
    | `String "X12_197" -> X12_197
    | `String "X12_198" -> X12_198
    | `String "X12_199" -> X12_199
    | `String "X12_200" -> X12_200
    | `String "X12_201" -> X12_201
    | `String "X12_202" -> X12_202
    | `String "X12_203" -> X12_203
    | `String "X12_204" -> X12_204
    | `String "X12_205" -> X12_205
    | `String "X12_206" -> X12_206
    | `String "X12_210" -> X12_210
    | `String "X12_211" -> X12_211
    | `String "X12_212" -> X12_212
    | `String "X12_213" -> X12_213
    | `String "X12_214" -> X12_214
    | `String "X12_215" -> X12_215
    | `String "X12_216" -> X12_216
    | `String "X12_217" -> X12_217
    | `String "X12_218" -> X12_218
    | `String "X12_219" -> X12_219
    | `String "X12_220" -> X12_220
    | `String "X12_222" -> X12_222
    | `String "X12_223" -> X12_223
    | `String "X12_224" -> X12_224
    | `String "X12_225" -> X12_225
    | `String "X12_227" -> X12_227
    | `String "X12_228" -> X12_228
    | `String "X12_240" -> X12_240
    | `String "X12_242" -> X12_242
    | `String "X12_244" -> X12_244
    | `String "X12_245" -> X12_245
    | `String "X12_248" -> X12_248
    | `String "X12_249" -> X12_249
    | `String "X12_250" -> X12_250
    | `String "X12_251" -> X12_251
    | `String "X12_252" -> X12_252
    | `String "X12_255" -> X12_255
    | `String "X12_256" -> X12_256
    | `String "X12_259" -> X12_259
    | `String "X12_260" -> X12_260
    | `String "X12_261" -> X12_261
    | `String "X12_262" -> X12_262
    | `String "X12_263" -> X12_263
    | `String "X12_264" -> X12_264
    | `String "X12_265" -> X12_265
    | `String "X12_266" -> X12_266
    | `String "X12_267" -> X12_267
    | `String "X12_268" -> X12_268
    | `String "X12_269" -> X12_269
    | `String "X12_270" -> X12_270
    | `String "X12_271" -> X12_271
    | `String "X12_272" -> X12_272
    | `String "X12_273" -> X12_273
    | `String "X12_274" -> X12_274
    | `String "X12_275" -> X12_275
    | `String "X12_276" -> X12_276
    | `String "X12_277" -> X12_277
    | `String "X12_278" -> X12_278
    | `String "X12_280" -> X12_280
    | `String "X12_283" -> X12_283
    | `String "X12_284" -> X12_284
    | `String "X12_285" -> X12_285
    | `String "X12_286" -> X12_286
    | `String "X12_288" -> X12_288
    | `String "X12_290" -> X12_290
    | `String "X12_300" -> X12_300
    | `String "X12_301" -> X12_301
    | `String "X12_303" -> X12_303
    | `String "X12_304" -> X12_304
    | `String "X12_309" -> X12_309
    | `String "X12_310" -> X12_310
    | `String "X12_311" -> X12_311
    | `String "X12_312" -> X12_312
    | `String "X12_313" -> X12_313
    | `String "X12_315" -> X12_315
    | `String "X12_317" -> X12_317
    | `String "X12_319" -> X12_319
    | `String "X12_322" -> X12_322
    | `String "X12_323" -> X12_323
    | `String "X12_324" -> X12_324
    | `String "X12_325" -> X12_325
    | `String "X12_326" -> X12_326
    | `String "X12_350" -> X12_350
    | `String "X12_352" -> X12_352
    | `String "X12_353" -> X12_353
    | `String "X12_354" -> X12_354
    | `String "X12_355" -> X12_355
    | `String "X12_356" -> X12_356
    | `String "X12_357" -> X12_357
    | `String "X12_358" -> X12_358
    | `String "X12_361" -> X12_361
    | `String "X12_362" -> X12_362
    | `String "X12_404" -> X12_404
    | `String "X12_410" -> X12_410
    | `String "X12_412" -> X12_412
    | `String "X12_414" -> X12_414
    | `String "X12_417" -> X12_417
    | `String "X12_418" -> X12_418
    | `String "X12_419" -> X12_419
    | `String "X12_420" -> X12_420
    | `String "X12_421" -> X12_421
    | `String "X12_422" -> X12_422
    | `String "X12_423" -> X12_423
    | `String "X12_424" -> X12_424
    | `String "X12_425" -> X12_425
    | `String "X12_426" -> X12_426
    | `String "X12_429" -> X12_429
    | `String "X12_431" -> X12_431
    | `String "X12_432" -> X12_432
    | `String "X12_433" -> X12_433
    | `String "X12_434" -> X12_434
    | `String "X12_435" -> X12_435
    | `String "X12_436" -> X12_436
    | `String "X12_437" -> X12_437
    | `String "X12_440" -> X12_440
    | `String "X12_451" -> X12_451
    | `String "X12_452" -> X12_452
    | `String "X12_453" -> X12_453
    | `String "X12_455" -> X12_455
    | `String "X12_456" -> X12_456
    | `String "X12_460" -> X12_460
    | `String "X12_463" -> X12_463
    | `String "X12_466" -> X12_466
    | `String "X12_468" -> X12_468
    | `String "X12_470" -> X12_470
    | `String "X12_475" -> X12_475
    | `String "X12_485" -> X12_485
    | `String "X12_486" -> X12_486
    | `String "X12_490" -> X12_490
    | `String "X12_492" -> X12_492
    | `String "X12_494" -> X12_494
    | `String "X12_500" -> X12_500
    | `String "X12_501" -> X12_501
    | `String "X12_503" -> X12_503
    | `String "X12_504" -> X12_504
    | `String "X12_511" -> X12_511
    | `String "X12_517" -> X12_517
    | `String "X12_521" -> X12_521
    | `String "X12_527" -> X12_527
    | `String "X12_536" -> X12_536
    | `String "X12_540" -> X12_540
    | `String "X12_561" -> X12_561
    | `String "X12_567" -> X12_567
    | `String "X12_568" -> X12_568
    | `String "X12_601" -> X12_601
    | `String "X12_602" -> X12_602
    | `String "X12_620" -> X12_620
    | `String "X12_625" -> X12_625
    | `String "X12_650" -> X12_650
    | `String "X12_715" -> X12_715
    | `String "X12_753" -> X12_753
    | `String "X12_754" -> X12_754
    | `String "X12_805" -> X12_805
    | `String "X12_806" -> X12_806
    | `String "X12_810" -> X12_810
    | `String "X12_811" -> X12_811
    | `String "X12_812" -> X12_812
    | `String "X12_813" -> X12_813
    | `String "X12_814" -> X12_814
    | `String "X12_815" -> X12_815
    | `String "X12_816" -> X12_816
    | `String "X12_818" -> X12_818
    | `String "X12_819" -> X12_819
    | `String "X12_820" -> X12_820
    | `String "X12_821" -> X12_821
    | `String "X12_822" -> X12_822
    | `String "X12_823" -> X12_823
    | `String "X12_824" -> X12_824
    | `String "X12_826" -> X12_826
    | `String "X12_827" -> X12_827
    | `String "X12_828" -> X12_828
    | `String "X12_829" -> X12_829
    | `String "X12_830" -> X12_830
    | `String "X12_831" -> X12_831
    | `String "X12_832" -> X12_832
    | `String "X12_833" -> X12_833
    | `String "X12_834" -> X12_834
    | `String "X12_835" -> X12_835
    | `String "X12_836" -> X12_836
    | `String "X12_837" -> X12_837
    | `String "X12_838" -> X12_838
    | `String "X12_839" -> X12_839
    | `String "X12_840" -> X12_840
    | `String "X12_841" -> X12_841
    | `String "X12_842" -> X12_842
    | `String "X12_843" -> X12_843
    | `String "X12_844" -> X12_844
    | `String "X12_845" -> X12_845
    | `String "X12_846" -> X12_846
    | `String "X12_847" -> X12_847
    | `String "X12_848" -> X12_848
    | `String "X12_849" -> X12_849
    | `String "X12_850" -> X12_850
    | `String "X12_851" -> X12_851
    | `String "X12_852" -> X12_852
    | `String "X12_853" -> X12_853
    | `String "X12_854" -> X12_854
    | `String "X12_855" -> X12_855
    | `String "X12_856" -> X12_856
    | `String "X12_857" -> X12_857
    | `String "X12_858" -> X12_858
    | `String "X12_859" -> X12_859
    | `String "X12_860" -> X12_860
    | `String "X12_861" -> X12_861
    | `String "X12_862" -> X12_862
    | `String "X12_863" -> X12_863
    | `String "X12_864" -> X12_864
    | `String "X12_865" -> X12_865
    | `String "X12_866" -> X12_866
    | `String "X12_867" -> X12_867
    | `String "X12_868" -> X12_868
    | `String "X12_869" -> X12_869
    | `String "X12_870" -> X12_870
    | `String "X12_871" -> X12_871
    | `String "X12_872" -> X12_872
    | `String "X12_873" -> X12_873
    | `String "X12_874" -> X12_874
    | `String "X12_875" -> X12_875
    | `String "X12_876" -> X12_876
    | `String "X12_877" -> X12_877
    | `String "X12_878" -> X12_878
    | `String "X12_879" -> X12_879
    | `String "X12_880" -> X12_880
    | `String "X12_881" -> X12_881
    | `String "X12_882" -> X12_882
    | `String "X12_883" -> X12_883
    | `String "X12_884" -> X12_884
    | `String "X12_885" -> X12_885
    | `String "X12_886" -> X12_886
    | `String "X12_887" -> X12_887
    | `String "X12_888" -> X12_888
    | `String "X12_889" -> X12_889
    | `String "X12_891" -> X12_891
    | `String "X12_893" -> X12_893
    | `String "X12_894" -> X12_894
    | `String "X12_895" -> X12_895
    | `String "X12_896" -> X12_896
    | `String "X12_920" -> X12_920
    | `String "X12_924" -> X12_924
    | `String "X12_925" -> X12_925
    | `String "X12_926" -> X12_926
    | `String "X12_928" -> X12_928
    | `String "X12_940" -> X12_940
    | `String "X12_943" -> X12_943
    | `String "X12_944" -> X12_944
    | `String "X12_945" -> X12_945
    | `String "X12_947" -> X12_947
    | `String "X12_980" -> X12_980
    | `String "X12_990" -> X12_990
    | `String "X12_993" -> X12_993
    | `String "X12_996" -> X12_996
    | `String "X12_997" -> X12_997
    | `String "X12_998" -> X12_998
    | `String "X12_999" -> X12_999
    | `String "X12_270_X279" -> X12_270_X279
    | `String "X12_271_X279" -> X12_271_X279
    | `String "X12_275_X210" -> X12_275_X210
    | `String "X12_275_X211" -> X12_275_X211
    | `String "X12_276_X212" -> X12_276_X212
    | `String "X12_277_X212" -> X12_277_X212
    | `String "X12_277_X214" -> X12_277_X214
    | `String "X12_277_X364" -> X12_277_X364
    | `String "X12_278_X217" -> X12_278_X217
    | `String "X12_820_X218" -> X12_820_X218
    | `String "X12_820_X306" -> X12_820_X306
    | `String "X12_824_X186" -> X12_824_X186
    | `String "X12_834_X220" -> X12_834_X220
    | `String "X12_834_X307" -> X12_834_X307
    | `String "X12_834_X318" -> X12_834_X318
    | `String "X12_835_X221" -> X12_835_X221
    | `String "X12_837_X222" -> X12_837_X222
    | `String "X12_837_X223" -> X12_837_X223
    | `String "X12_837_X224" -> X12_837_X224
    | `String "X12_837_X291" -> X12_837_X291
    | `String "X12_837_X292" -> X12_837_X292
    | `String "X12_837_X298" -> X12_837_X298
    | `String "X12_999_X231" -> X12_999_X231
    | `String value -> raise (deserialize_unknown_enum_value_error path "X12TransactionSet" value)
    | _ -> raise (deserialize_wrong_type_error path "X12TransactionSet")
     : x12_transaction_set)
    : x12_transaction_set)

let x12_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transaction_set =
       option_of_yojson (value_for_key x12_transaction_set_of_yojson "transactionSet") _list path;
     version = option_of_yojson (value_for_key x12_version_of_yojson "version") _list path;
   }
    : x12_details)

let edi_type_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "x12Details" -> X12Details (x12_details_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "EdiType" unknown)
    : edi_type)

let file_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "XML" -> XML
    | `String "JSON" -> JSON
    | `String "NOT_USED" -> NOT_USED
    | `String value -> raise (deserialize_unknown_enum_value_error path "FileFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "FileFormat")
     : file_format)
    : file_format)

let s3_key_of_yojson = string_of_yojson
let bucket_name_of_yojson = string_of_yojson

let s3_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket_name = option_of_yojson (value_for_key bucket_name_of_yojson "bucketName") _list path;
     key = option_of_yojson (value_for_key s3_key_of_yojson "key") _list path;
   }
    : s3_location)

let test_parsing_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_file = value_for_key s3_location_of_yojson "inputFile" _list path;
     file_format = value_for_key file_format_of_yojson "fileFormat" _list path;
     edi_type = value_for_key edi_type_of_yojson "ediType" _list path;
     advanced_options =
       option_of_yojson (value_for_key advanced_options_of_yojson "advancedOptions") _list path;
   }
    : test_parsing_request)

let test_mapping_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mapped_file_content =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "mappedFileContent"
         _list path;
   }
    : test_mapping_response)

let mapping_template_of_yojson = string_of_yojson
let test_mapping_input_file_content_of_yojson = string_of_yojson

let test_mapping_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_file_content =
       value_for_key test_mapping_input_file_content_of_yojson "inputFileContent" _list path;
     mapping_template = value_for_key mapping_template_of_yojson "mappingTemplate" _list path;
     file_format = value_for_key file_format_of_yojson "fileFormat" _list path;
   }
    : test_mapping_request)

let test_conversion_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     converted_file_content =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "convertedFileContent" _list path;
     validation_messages =
       option_of_yojson
         (value_for_key validation_messages_of_yojson "validationMessages")
         _list path;
   }
    : test_conversion_response)

let output_sample_file_source_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "fileLocation" -> FileLocation (s3_location_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "OutputSampleFileSource" unknown)
    : output_sample_file_source)

let conversion_target_format_details_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "x12" -> X12 (x12_details_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "ConversionTargetFormatDetails" unknown)
    : conversion_target_format_details)

let conversion_target_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "X12" -> X12
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConversionTargetFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "ConversionTargetFormat")
     : conversion_target_format)
    : conversion_target_format)

let conversion_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_format = value_for_key conversion_target_format_of_yojson "fileFormat" _list path;
     format_details =
       option_of_yojson
         (value_for_key conversion_target_format_details_of_yojson "formatDetails")
         _list path;
     output_sample_file =
       option_of_yojson
         (value_for_key output_sample_file_source_of_yojson "outputSampleFile")
         _list path;
     advanced_options =
       option_of_yojson (value_for_key advanced_options_of_yojson "advancedOptions") _list path;
   }
    : conversion_target)

let input_file_source_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "fileContent" ->
       FileContent (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "InputFileSource" unknown)
    : input_file_source)

let conversion_source_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "JSON" -> JSON
    | `String "XML" -> XML
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConversionSourceFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "ConversionSourceFormat")
     : conversion_source_format)
    : conversion_source_format)

let conversion_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_format = value_for_key conversion_source_format_of_yojson "fileFormat" _list path;
     input_file = value_for_key input_file_source_of_yojson "inputFile" _list path;
   }
    : conversion_source)

let test_conversion_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source = value_for_key conversion_source_of_yojson "source" _list path;
     target = value_for_key conversion_target_of_yojson "target" _list path;
   }
    : test_conversion_request)

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
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "message" _list path } : conflict_exception)

let transformer_job_id_of_yojson = string_of_yojson

let start_transformer_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ transformer_job_id = value_for_key transformer_job_id_of_yojson "transformerJobId" _list path }
    : start_transformer_job_response)

let transformer_id_of_yojson = string_of_yojson

let start_transformer_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_file = value_for_key s3_location_of_yojson "inputFile" _list path;
     output_location = value_for_key s3_location_of_yojson "outputLocation" _list path;
     transformer_id = value_for_key transformer_id_of_yojson "transformerId" _list path;
     client_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "clientToken")
         _list path;
   }
    : start_transformer_job_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path }
    : list_tags_for_resource_request)

let s3_location_list_of_yojson tree path = list_of_yojson s3_location_of_yojson tree path

let transformer_job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "running" -> RUNNING
    | `String "succeeded" -> SUCCEEDED
    | `String "failed" -> FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TransformerJobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TransformerJobStatus")
     : transformer_job_status)
    : transformer_job_status)

let get_transformer_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = value_for_key transformer_job_status_of_yojson "status" _list path;
     output_files =
       option_of_yojson (value_for_key s3_location_list_of_yojson "outputFiles") _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : get_transformer_job_response)

let get_transformer_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transformer_job_id = value_for_key transformer_job_id_of_yojson "transformerJobId" _list path;
     transformer_id = value_for_key transformer_id_of_yojson "transformerId" _list path;
   }
    : get_transformer_job_request)

let generate_mapping_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mapping_template =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "mappingTemplate"
         _list path;
     mapping_accuracy =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "mappingAccuracy")
         _list path;
   }
    : generate_mapping_response)

let mapping_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "JSONATA" -> JSONATA
    | `String "XSLT" -> XSLT
    | `String value -> raise (deserialize_unknown_enum_value_error path "MappingType" value)
    | _ -> raise (deserialize_wrong_type_error path "MappingType")
     : mapping_type)
    : mapping_type)

let generate_mapping_output_file_content_of_yojson = string_of_yojson
let generate_mapping_input_file_content_of_yojson = string_of_yojson

let generate_mapping_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_file_content =
       value_for_key generate_mapping_input_file_content_of_yojson "inputFileContent" _list path;
     output_file_content =
       value_for_key generate_mapping_output_file_content_of_yojson "outputFileContent" _list path;
     mapping_type = value_for_key mapping_type_of_yojson "mappingType" _list path;
   }
    : generate_mapping_request)

let create_starter_mapping_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mapping_template =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "mappingTemplate"
         _list path;
   }
    : create_starter_mapping_template_response)

let template_details_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "x12" -> X12 (x12_details_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "TemplateDetails" unknown)
    : template_details)

let create_starter_mapping_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_sample_location =
       option_of_yojson (value_for_key s3_location_of_yojson "outputSampleLocation") _list path;
     mapping_type = value_for_key mapping_type_of_yojson "mappingType" _list path;
     template_details = value_for_key template_details_of_yojson "templateDetails" _list path;
   }
    : create_starter_mapping_template_request)

let business_name_of_yojson = string_of_yojson

let capability_direction_of_yojson (tree : t) path =
  ((match tree with
    | `String "INBOUND" -> INBOUND
    | `String "OUTBOUND" -> OUTBOUND
    | `String value -> raise (deserialize_unknown_enum_value_error path "CapabilityDirection" value)
    | _ -> raise (deserialize_wrong_type_error path "CapabilityDirection")
     : capability_direction)
    : capability_direction)

let edi_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capability_direction =
       option_of_yojson
         (value_for_key capability_direction_of_yojson "capabilityDirection")
         _list path;
     type_ = value_for_key edi_type_of_yojson "type" _list path;
     input_location = value_for_key s3_location_of_yojson "inputLocation" _list path;
     output_location = value_for_key s3_location_of_yojson "outputLocation" _list path;
     transformer_id = value_for_key transformer_id_of_yojson "transformerId" _list path;
   }
    : edi_configuration)

let capability_configuration_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "edi" -> Edi (edi_configuration_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "CapabilityConfiguration" unknown)
    : capability_configuration)

let capability_id_of_yojson = string_of_yojson
let modified_date_of_yojson = timestamp_iso_8601_of_yojson
let created_date_of_yojson = timestamp_iso_8601_of_yojson

let capability_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "edi" -> EDI
    | `String value -> raise (deserialize_unknown_enum_value_error path "CapabilityType" value)
    | _ -> raise (deserialize_wrong_type_error path "CapabilityType")
     : capability_type)
    : capability_type)

let capability_name_of_yojson = string_of_yojson

let capability_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capability_id = value_for_key capability_id_of_yojson "capabilityId" _list path;
     name = value_for_key capability_name_of_yojson "name" _list path;
     type_ = value_for_key capability_type_of_yojson "type" _list path;
     created_at = value_for_key created_date_of_yojson "createdAt" _list path;
     modified_at = option_of_yojson (value_for_key modified_date_of_yojson "modifiedAt") _list path;
   }
    : capability_summary)

let capability_list_of_yojson tree path = list_of_yojson capability_summary_of_yojson tree path

let x12_technical_acknowledgment_of_yojson (tree : t) path =
  ((match tree with
    | `String "DO_NOT_GENERATE" -> DO_NOT_GENERATE
    | `String "GENERATE_ALL_SEGMENTS" -> GENERATE_ALL_SEGMENTS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "X12TechnicalAcknowledgment" value)
    | _ -> raise (deserialize_wrong_type_error path "X12TechnicalAcknowledgment")
     : x12_technical_acknowledgment)
    : x12_technical_acknowledgment)

let x12_functional_acknowledgment_of_yojson (tree : t) path =
  ((match tree with
    | `String "DO_NOT_GENERATE" -> DO_NOT_GENERATE
    | `String "GENERATE_ALL_SEGMENTS" -> GENERATE_ALL_SEGMENTS
    | `String "GENERATE_WITHOUT_TRANSACTION_SET_RESPONSE_LOOP" ->
        GENERATE_WITHOUT_TRANSACTION_SET_RESPONSE_LOOP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "X12FunctionalAcknowledgment" value)
    | _ -> raise (deserialize_wrong_type_error path "X12FunctionalAcknowledgment")
     : x12_functional_acknowledgment)
    : x12_functional_acknowledgment)

let x12_acknowledgment_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     functional_acknowledgment =
       value_for_key x12_functional_acknowledgment_of_yojson "functionalAcknowledgment" _list path;
     technical_acknowledgment =
       value_for_key x12_technical_acknowledgment_of_yojson "technicalAcknowledgment" _list path;
   }
    : x12_acknowledgment_options)

let x12_inbound_edi_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acknowledgment_options =
       option_of_yojson
         (value_for_key x12_acknowledgment_options_of_yojson "acknowledgmentOptions")
         _list path;
   }
    : x12_inbound_edi_options)

let inbound_edi_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ x12 = option_of_yojson (value_for_key x12_inbound_edi_options_of_yojson "x12") _list path }
    : inbound_edi_options)

let line_length_of_yojson = int_of_yojson

let line_terminator_of_yojson (tree : t) path =
  ((match tree with
    | `String "CRLF" -> CRLF
    | `String "LF" -> LF
    | `String "CR" -> CR
    | `String value -> raise (deserialize_unknown_enum_value_error path "LineTerminator" value)
    | _ -> raise (deserialize_wrong_type_error path "LineTerminator")
     : line_terminator)
    : line_terminator)

let wrap_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "SEGMENT" -> SEGMENT
    | `String "ONE_LINE" -> ONE_LINE
    | `String "LINE_LENGTH" -> LINE_LENGTH
    | `String value -> raise (deserialize_unknown_enum_value_error path "WrapFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "WrapFormat")
     : wrap_format)
    : wrap_format)

let wrap_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     wrap_by = value_for_key wrap_format_of_yojson "wrapBy" _list path;
     line_terminator =
       option_of_yojson (value_for_key line_terminator_of_yojson "lineTerminator") _list path;
     line_length = option_of_yojson (value_for_key line_length_of_yojson "lineLength") _list path;
   }
    : wrap_options)

let x12gs05_time_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "HHMM" -> HHMM
    | `String "HHMMSS" -> HHMMSS
    | `String "HHMMSSDD" -> HHMMSSDD
    | `String value -> raise (deserialize_unknown_enum_value_error path "X12GS05TimeFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "X12GS05TimeFormat")
     : x12gs05_time_format)
    : x12gs05_time_format)

let starting_transaction_set_control_number_of_yojson = int_of_yojson
let starting_functional_group_control_number_of_yojson = int_of_yojson
let starting_interchange_control_number_of_yojson = int_of_yojson

let x12_control_numbers_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     starting_interchange_control_number =
       option_of_yojson
         (value_for_key starting_interchange_control_number_of_yojson
            "startingInterchangeControlNumber")
         _list path;
     starting_functional_group_control_number =
       option_of_yojson
         (value_for_key starting_functional_group_control_number_of_yojson
            "startingFunctionalGroupControlNumber")
         _list path;
     starting_transaction_set_control_number =
       option_of_yojson
         (value_for_key starting_transaction_set_control_number_of_yojson
            "startingTransactionSetControlNumber")
         _list path;
   }
    : x12_control_numbers)

let x12_validate_edi_of_yojson = bool_of_yojson
let x12_segment_terminator_of_yojson = string_of_yojson
let x12_data_element_separator_of_yojson = string_of_yojson
let x12_component_separator_of_yojson = string_of_yojson

let x12_delimiters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     component_separator =
       option_of_yojson
         (value_for_key x12_component_separator_of_yojson "componentSeparator")
         _list path;
     data_element_separator =
       option_of_yojson
         (value_for_key x12_data_element_separator_of_yojson "dataElementSeparator")
         _list path;
     segment_terminator =
       option_of_yojson
         (value_for_key x12_segment_terminator_of_yojson "segmentTerminator")
         _list path;
   }
    : x12_delimiters)

let x12_responsible_agency_code_of_yojson = string_of_yojson
let x12_application_receiver_code_of_yojson = string_of_yojson
let x12_application_sender_code_of_yojson = string_of_yojson

let x12_functional_group_headers_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_sender_code =
       option_of_yojson
         (value_for_key x12_application_sender_code_of_yojson "applicationSenderCode")
         _list path;
     application_receiver_code =
       option_of_yojson
         (value_for_key x12_application_receiver_code_of_yojson "applicationReceiverCode")
         _list path;
     responsible_agency_code =
       option_of_yojson
         (value_for_key x12_responsible_agency_code_of_yojson "responsibleAgencyCode")
         _list path;
   }
    : x12_functional_group_headers)

let x12_usage_indicator_code_of_yojson = string_of_yojson
let x12_acknowledgment_requested_code_of_yojson = string_of_yojson
let x12_repetition_separator_of_yojson = string_of_yojson
let x12_receiver_id_of_yojson = string_of_yojson
let x12_id_qualifier_of_yojson = string_of_yojson
let x12_sender_id_of_yojson = string_of_yojson

let x12_interchange_control_headers_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sender_id_qualifier =
       option_of_yojson (value_for_key x12_id_qualifier_of_yojson "senderIdQualifier") _list path;
     sender_id = option_of_yojson (value_for_key x12_sender_id_of_yojson "senderId") _list path;
     receiver_id_qualifier =
       option_of_yojson (value_for_key x12_id_qualifier_of_yojson "receiverIdQualifier") _list path;
     receiver_id =
       option_of_yojson (value_for_key x12_receiver_id_of_yojson "receiverId") _list path;
     repetition_separator =
       option_of_yojson
         (value_for_key x12_repetition_separator_of_yojson "repetitionSeparator")
         _list path;
     acknowledgment_requested_code =
       option_of_yojson
         (value_for_key x12_acknowledgment_requested_code_of_yojson "acknowledgmentRequestedCode")
         _list path;
     usage_indicator_code =
       option_of_yojson
         (value_for_key x12_usage_indicator_code_of_yojson "usageIndicatorCode")
         _list path;
   }
    : x12_interchange_control_headers)

let x12_outbound_edi_headers_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     interchange_control_headers =
       option_of_yojson
         (value_for_key x12_interchange_control_headers_of_yojson "interchangeControlHeaders")
         _list path;
     functional_group_headers =
       option_of_yojson
         (value_for_key x12_functional_group_headers_of_yojson "functionalGroupHeaders")
         _list path;
     delimiters = option_of_yojson (value_for_key x12_delimiters_of_yojson "delimiters") _list path;
     validate_edi =
       option_of_yojson (value_for_key x12_validate_edi_of_yojson "validateEdi") _list path;
     control_numbers =
       option_of_yojson (value_for_key x12_control_numbers_of_yojson "controlNumbers") _list path;
     gs05_time_format =
       option_of_yojson (value_for_key x12gs05_time_format_of_yojson "gs05TimeFormat") _list path;
   }
    : x12_outbound_edi_headers)

let x12_envelope_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     common =
       option_of_yojson (value_for_key x12_outbound_edi_headers_of_yojson "common") _list path;
     wrap_options = option_of_yojson (value_for_key wrap_options_of_yojson "wrapOptions") _list path;
   }
    : x12_envelope)

let outbound_edi_options_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "x12" -> X12 (x12_envelope_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "OutboundEdiOptions" unknown)
    : outbound_edi_options)

let capability_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     outbound_edi =
       option_of_yojson (value_for_key outbound_edi_options_of_yojson "outboundEdi") _list path;
     inbound_edi =
       option_of_yojson (value_for_key inbound_edi_options_of_yojson "inboundEdi") _list path;
   }
    : capability_options)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key error_message_of_yojson "message" _list path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceId" _list
         path;
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceType" _list
         path;
     service_code =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "serviceCode" _list
         path;
     quota_code =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "quotaCode" _list
         path;
   }
    : service_quota_exceeded_exception)

let instructions_documents_of_yojson tree path = list_of_yojson s3_location_of_yojson tree path
let resource_arn_of_yojson = string_of_yojson

let create_capability_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capability_id = value_for_key capability_id_of_yojson "capabilityId" _list path;
     capability_arn = value_for_key resource_arn_of_yojson "capabilityArn" _list path;
     name = value_for_key capability_name_of_yojson "name" _list path;
     type_ = value_for_key capability_type_of_yojson "type" _list path;
     configuration = value_for_key capability_configuration_of_yojson "configuration" _list path;
     instructions_documents =
       option_of_yojson
         (value_for_key instructions_documents_of_yojson "instructionsDocuments")
         _list path;
     created_at = value_for_key created_date_of_yojson "createdAt" _list path;
   }
    : create_capability_response)

let create_capability_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key capability_name_of_yojson "name" _list path;
     type_ = value_for_key capability_type_of_yojson "type" _list path;
     configuration = value_for_key capability_configuration_of_yojson "configuration" _list path;
     instructions_documents =
       option_of_yojson
         (value_for_key instructions_documents_of_yojson "instructionsDocuments")
         _list path;
     client_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "clientToken")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_capability_request)

let trading_partner_id_of_yojson = string_of_yojson
let partnership_capabilities_of_yojson tree path = list_of_yojson capability_id_of_yojson tree path
let phone_of_yojson = string_of_yojson
let email_of_yojson = string_of_yojson
let partner_name_of_yojson = string_of_yojson
let partnership_id_of_yojson = string_of_yojson
let profile_id_of_yojson = string_of_yojson

let create_partnership_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profile_id = value_for_key profile_id_of_yojson "profileId" _list path;
     partnership_id = value_for_key partnership_id_of_yojson "partnershipId" _list path;
     partnership_arn = value_for_key resource_arn_of_yojson "partnershipArn" _list path;
     name = option_of_yojson (value_for_key partner_name_of_yojson "name") _list path;
     email = option_of_yojson (value_for_key email_of_yojson "email") _list path;
     phone = option_of_yojson (value_for_key phone_of_yojson "phone") _list path;
     capabilities =
       option_of_yojson (value_for_key partnership_capabilities_of_yojson "capabilities") _list path;
     capability_options =
       option_of_yojson (value_for_key capability_options_of_yojson "capabilityOptions") _list path;
     trading_partner_id =
       option_of_yojson (value_for_key trading_partner_id_of_yojson "tradingPartnerId") _list path;
     created_at = value_for_key created_date_of_yojson "createdAt" _list path;
   }
    : create_partnership_response)

let create_partnership_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profile_id = value_for_key profile_id_of_yojson "profileId" _list path;
     name = value_for_key partner_name_of_yojson "name" _list path;
     email = value_for_key email_of_yojson "email" _list path;
     phone = option_of_yojson (value_for_key phone_of_yojson "phone") _list path;
     capabilities = value_for_key partnership_capabilities_of_yojson "capabilities" _list path;
     capability_options =
       option_of_yojson (value_for_key capability_options_of_yojson "capabilityOptions") _list path;
     client_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "clientToken")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_partnership_request)

let log_group_name_of_yojson = string_of_yojson

let logging_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "Logging" value)
    | _ -> raise (deserialize_wrong_type_error path "Logging")
     : logging)
    : logging)

let profile_name_of_yojson = string_of_yojson

let create_profile_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profile_id = value_for_key profile_id_of_yojson "profileId" _list path;
     profile_arn = value_for_key resource_arn_of_yojson "profileArn" _list path;
     name = value_for_key profile_name_of_yojson "name" _list path;
     business_name = value_for_key business_name_of_yojson "businessName" _list path;
     phone = value_for_key phone_of_yojson "phone" _list path;
     email = option_of_yojson (value_for_key email_of_yojson "email") _list path;
     logging = option_of_yojson (value_for_key logging_of_yojson "logging") _list path;
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "logGroupName") _list path;
     created_at = value_for_key created_date_of_yojson "createdAt" _list path;
   }
    : create_profile_response)

let create_profile_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key profile_name_of_yojson "name" _list path;
     email = option_of_yojson (value_for_key email_of_yojson "email") _list path;
     phone = value_for_key phone_of_yojson "phone" _list path;
     business_name = value_for_key business_name_of_yojson "businessName" _list path;
     logging = value_for_key logging_of_yojson "logging" _list path;
     client_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "clientToken")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_profile_request)

let sample_document_keys_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input = option_of_yojson (value_for_key s3_key_of_yojson "input") _list path;
     output = option_of_yojson (value_for_key s3_key_of_yojson "output") _list path;
   }
    : sample_document_keys)

let key_list_of_yojson tree path = list_of_yojson sample_document_keys_of_yojson tree path

let sample_documents_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket_name = value_for_key bucket_name_of_yojson "bucketName" _list path;
     keys = value_for_key key_list_of_yojson "keys" _list path;
   }
    : sample_documents)

let format_options_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "x12" -> X12 (x12_details_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "FormatOptions" unknown)
    : format_options)

let to_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "X12" -> X12
    | `String value -> raise (deserialize_unknown_enum_value_error path "ToFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "ToFormat")
     : to_format)
    : to_format)

let output_conversion_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     to_format = value_for_key to_format_of_yojson "toFormat" _list path;
     format_options =
       option_of_yojson (value_for_key format_options_of_yojson "formatOptions") _list path;
     advanced_options =
       option_of_yojson (value_for_key advanced_options_of_yojson "advancedOptions") _list path;
   }
    : output_conversion)

let mapping_template_language_of_yojson (tree : t) path =
  ((match tree with
    | `String "XSLT" -> XSLT
    | `String "JSONATA" -> JSONATA
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MappingTemplateLanguage" value)
    | _ -> raise (deserialize_wrong_type_error path "MappingTemplateLanguage")
     : mapping_template_language)
    : mapping_template_language)

let mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     template_language =
       value_for_key mapping_template_language_of_yojson "templateLanguage" _list path;
     template = option_of_yojson (value_for_key mapping_template_of_yojson "template") _list path;
   }
    : mapping)

let from_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "X12" -> X12
    | `String value -> raise (deserialize_unknown_enum_value_error path "FromFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "FromFormat")
     : from_format)
    : from_format)

let input_conversion_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     from_format = value_for_key from_format_of_yojson "fromFormat" _list path;
     format_options =
       option_of_yojson (value_for_key format_options_of_yojson "formatOptions") _list path;
     advanced_options =
       option_of_yojson (value_for_key advanced_options_of_yojson "advancedOptions") _list path;
   }
    : input_conversion)

let file_location_of_yojson = string_of_yojson

let transformer_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "active" -> ACTIVE
    | `String "inactive" -> INACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "TransformerStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TransformerStatus")
     : transformer_status)
    : transformer_status)

let transformer_name_of_yojson = string_of_yojson

let create_transformer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transformer_id = value_for_key transformer_id_of_yojson "transformerId" _list path;
     transformer_arn = value_for_key resource_arn_of_yojson "transformerArn" _list path;
     name = value_for_key transformer_name_of_yojson "name" _list path;
     status = value_for_key transformer_status_of_yojson "status" _list path;
     created_at = value_for_key created_date_of_yojson "createdAt" _list path;
     file_format = option_of_yojson (value_for_key file_format_of_yojson "fileFormat") _list path;
     mapping_template =
       option_of_yojson (value_for_key mapping_template_of_yojson "mappingTemplate") _list path;
     edi_type = option_of_yojson (value_for_key edi_type_of_yojson "ediType") _list path;
     sample_document =
       option_of_yojson (value_for_key file_location_of_yojson "sampleDocument") _list path;
     input_conversion =
       option_of_yojson (value_for_key input_conversion_of_yojson "inputConversion") _list path;
     mapping = option_of_yojson (value_for_key mapping_of_yojson "mapping") _list path;
     output_conversion =
       option_of_yojson (value_for_key output_conversion_of_yojson "outputConversion") _list path;
     sample_documents =
       option_of_yojson (value_for_key sample_documents_of_yojson "sampleDocuments") _list path;
   }
    : create_transformer_response)

let create_transformer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key transformer_name_of_yojson "name" _list path;
     client_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "clientToken")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     file_format = option_of_yojson (value_for_key file_format_of_yojson "fileFormat") _list path;
     mapping_template =
       option_of_yojson (value_for_key mapping_template_of_yojson "mappingTemplate") _list path;
     edi_type = option_of_yojson (value_for_key edi_type_of_yojson "ediType") _list path;
     sample_document =
       option_of_yojson (value_for_key file_location_of_yojson "sampleDocument") _list path;
     input_conversion =
       option_of_yojson (value_for_key input_conversion_of_yojson "inputConversion") _list path;
     mapping = option_of_yojson (value_for_key mapping_of_yojson "mapping") _list path;
     output_conversion =
       option_of_yojson (value_for_key output_conversion_of_yojson "outputConversion") _list path;
     sample_documents =
       option_of_yojson (value_for_key sample_documents_of_yojson "sampleDocuments") _list path;
   }
    : create_transformer_request)

let delete_capability_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ capability_id = value_for_key capability_id_of_yojson "capabilityId" _list path }
    : delete_capability_request)

let delete_partnership_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ partnership_id = value_for_key partnership_id_of_yojson "partnershipId" _list path }
    : delete_partnership_request)

let delete_profile_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ profile_id = value_for_key profile_id_of_yojson "profileId" _list path }
    : delete_profile_request)

let delete_transformer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ transformer_id = value_for_key transformer_id_of_yojson "transformerId" _list path }
    : delete_transformer_request)

let get_capability_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capability_id = value_for_key capability_id_of_yojson "capabilityId" _list path;
     capability_arn = value_for_key resource_arn_of_yojson "capabilityArn" _list path;
     name = value_for_key capability_name_of_yojson "name" _list path;
     type_ = value_for_key capability_type_of_yojson "type" _list path;
     configuration = value_for_key capability_configuration_of_yojson "configuration" _list path;
     instructions_documents =
       option_of_yojson
         (value_for_key instructions_documents_of_yojson "instructionsDocuments")
         _list path;
     created_at = value_for_key created_date_of_yojson "createdAt" _list path;
     modified_at = option_of_yojson (value_for_key modified_date_of_yojson "modifiedAt") _list path;
   }
    : get_capability_response)

let get_capability_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ capability_id = value_for_key capability_id_of_yojson "capabilityId" _list path }
    : get_capability_request)

let get_partnership_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profile_id = value_for_key profile_id_of_yojson "profileId" _list path;
     partnership_id = value_for_key partnership_id_of_yojson "partnershipId" _list path;
     partnership_arn = value_for_key resource_arn_of_yojson "partnershipArn" _list path;
     name = option_of_yojson (value_for_key partner_name_of_yojson "name") _list path;
     email = option_of_yojson (value_for_key email_of_yojson "email") _list path;
     phone = option_of_yojson (value_for_key phone_of_yojson "phone") _list path;
     capabilities =
       option_of_yojson (value_for_key partnership_capabilities_of_yojson "capabilities") _list path;
     capability_options =
       option_of_yojson (value_for_key capability_options_of_yojson "capabilityOptions") _list path;
     trading_partner_id =
       option_of_yojson (value_for_key trading_partner_id_of_yojson "tradingPartnerId") _list path;
     created_at = value_for_key created_date_of_yojson "createdAt" _list path;
     modified_at = option_of_yojson (value_for_key modified_date_of_yojson "modifiedAt") _list path;
   }
    : get_partnership_response)

let get_partnership_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ partnership_id = value_for_key partnership_id_of_yojson "partnershipId" _list path }
    : get_partnership_request)

let get_profile_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profile_id = value_for_key profile_id_of_yojson "profileId" _list path;
     profile_arn = value_for_key resource_arn_of_yojson "profileArn" _list path;
     name = value_for_key profile_name_of_yojson "name" _list path;
     email = option_of_yojson (value_for_key email_of_yojson "email") _list path;
     phone = value_for_key phone_of_yojson "phone" _list path;
     business_name = value_for_key business_name_of_yojson "businessName" _list path;
     logging = option_of_yojson (value_for_key logging_of_yojson "logging") _list path;
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "logGroupName") _list path;
     created_at = value_for_key created_date_of_yojson "createdAt" _list path;
     modified_at = option_of_yojson (value_for_key modified_date_of_yojson "modifiedAt") _list path;
   }
    : get_profile_response)

let get_profile_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ profile_id = value_for_key profile_id_of_yojson "profileId" _list path } : get_profile_request)

let get_transformer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transformer_id = value_for_key transformer_id_of_yojson "transformerId" _list path;
     transformer_arn = value_for_key resource_arn_of_yojson "transformerArn" _list path;
     name = value_for_key transformer_name_of_yojson "name" _list path;
     status = value_for_key transformer_status_of_yojson "status" _list path;
     created_at = value_for_key created_date_of_yojson "createdAt" _list path;
     modified_at = option_of_yojson (value_for_key modified_date_of_yojson "modifiedAt") _list path;
     file_format = option_of_yojson (value_for_key file_format_of_yojson "fileFormat") _list path;
     mapping_template =
       option_of_yojson (value_for_key mapping_template_of_yojson "mappingTemplate") _list path;
     edi_type = option_of_yojson (value_for_key edi_type_of_yojson "ediType") _list path;
     sample_document =
       option_of_yojson (value_for_key file_location_of_yojson "sampleDocument") _list path;
     input_conversion =
       option_of_yojson (value_for_key input_conversion_of_yojson "inputConversion") _list path;
     mapping = option_of_yojson (value_for_key mapping_of_yojson "mapping") _list path;
     output_conversion =
       option_of_yojson (value_for_key output_conversion_of_yojson "outputConversion") _list path;
     sample_documents =
       option_of_yojson (value_for_key sample_documents_of_yojson "sampleDocuments") _list path;
   }
    : get_transformer_response)

let get_transformer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ transformer_id = value_for_key transformer_id_of_yojson "transformerId" _list path }
    : get_transformer_request)

let page_token_of_yojson = string_of_yojson

let list_capabilities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capabilities = value_for_key capability_list_of_yojson "capabilities" _list path;
     next_token = option_of_yojson (value_for_key page_token_of_yojson "nextToken") _list path;
   }
    : list_capabilities_response)

let max_results_of_yojson = int_of_yojson

let list_capabilities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key page_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_capabilities_request)

let partnership_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profile_id = value_for_key profile_id_of_yojson "profileId" _list path;
     partnership_id = value_for_key partnership_id_of_yojson "partnershipId" _list path;
     name = option_of_yojson (value_for_key partner_name_of_yojson "name") _list path;
     capabilities =
       option_of_yojson (value_for_key partnership_capabilities_of_yojson "capabilities") _list path;
     capability_options =
       option_of_yojson (value_for_key capability_options_of_yojson "capabilityOptions") _list path;
     trading_partner_id =
       option_of_yojson (value_for_key trading_partner_id_of_yojson "tradingPartnerId") _list path;
     created_at = value_for_key created_date_of_yojson "createdAt" _list path;
     modified_at = option_of_yojson (value_for_key modified_date_of_yojson "modifiedAt") _list path;
   }
    : partnership_summary)

let partnership_list_of_yojson tree path = list_of_yojson partnership_summary_of_yojson tree path

let list_partnerships_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     partnerships = value_for_key partnership_list_of_yojson "partnerships" _list path;
     next_token = option_of_yojson (value_for_key page_token_of_yojson "nextToken") _list path;
   }
    : list_partnerships_response)

let list_partnerships_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profile_id = option_of_yojson (value_for_key profile_id_of_yojson "profileId") _list path;
     next_token = option_of_yojson (value_for_key page_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_partnerships_request)

let profile_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profile_id = value_for_key profile_id_of_yojson "profileId" _list path;
     name = value_for_key profile_name_of_yojson "name" _list path;
     business_name = value_for_key business_name_of_yojson "businessName" _list path;
     logging = option_of_yojson (value_for_key logging_of_yojson "logging") _list path;
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "logGroupName") _list path;
     created_at = value_for_key created_date_of_yojson "createdAt" _list path;
     modified_at = option_of_yojson (value_for_key modified_date_of_yojson "modifiedAt") _list path;
   }
    : profile_summary)

let profile_list_of_yojson tree path = list_of_yojson profile_summary_of_yojson tree path

let list_profiles_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profiles = value_for_key profile_list_of_yojson "profiles" _list path;
     next_token = option_of_yojson (value_for_key page_token_of_yojson "nextToken") _list path;
   }
    : list_profiles_response)

let list_profiles_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key page_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_profiles_request)

let transformer_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transformer_id = value_for_key transformer_id_of_yojson "transformerId" _list path;
     name = value_for_key transformer_name_of_yojson "name" _list path;
     status = value_for_key transformer_status_of_yojson "status" _list path;
     created_at = value_for_key created_date_of_yojson "createdAt" _list path;
     modified_at = option_of_yojson (value_for_key modified_date_of_yojson "modifiedAt") _list path;
     file_format = option_of_yojson (value_for_key file_format_of_yojson "fileFormat") _list path;
     mapping_template =
       option_of_yojson (value_for_key mapping_template_of_yojson "mappingTemplate") _list path;
     edi_type = option_of_yojson (value_for_key edi_type_of_yojson "ediType") _list path;
     sample_document =
       option_of_yojson (value_for_key file_location_of_yojson "sampleDocument") _list path;
     input_conversion =
       option_of_yojson (value_for_key input_conversion_of_yojson "inputConversion") _list path;
     mapping = option_of_yojson (value_for_key mapping_of_yojson "mapping") _list path;
     output_conversion =
       option_of_yojson (value_for_key output_conversion_of_yojson "outputConversion") _list path;
     sample_documents =
       option_of_yojson (value_for_key sample_documents_of_yojson "sampleDocuments") _list path;
   }
    : transformer_summary)

let transformer_list_of_yojson tree path = list_of_yojson transformer_summary_of_yojson tree path

let list_transformers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transformers = value_for_key transformer_list_of_yojson "transformers" _list path;
     next_token = option_of_yojson (value_for_key page_token_of_yojson "nextToken") _list path;
   }
    : list_transformers_response)

let list_transformers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key page_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_transformers_request)

let update_capability_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capability_id = value_for_key capability_id_of_yojson "capabilityId" _list path;
     capability_arn = value_for_key resource_arn_of_yojson "capabilityArn" _list path;
     name = value_for_key capability_name_of_yojson "name" _list path;
     type_ = value_for_key capability_type_of_yojson "type" _list path;
     configuration = value_for_key capability_configuration_of_yojson "configuration" _list path;
     instructions_documents =
       option_of_yojson
         (value_for_key instructions_documents_of_yojson "instructionsDocuments")
         _list path;
     created_at = value_for_key created_date_of_yojson "createdAt" _list path;
     modified_at = option_of_yojson (value_for_key modified_date_of_yojson "modifiedAt") _list path;
   }
    : update_capability_response)

let update_capability_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capability_id = value_for_key capability_id_of_yojson "capabilityId" _list path;
     name = option_of_yojson (value_for_key capability_name_of_yojson "name") _list path;
     configuration =
       option_of_yojson
         (value_for_key capability_configuration_of_yojson "configuration")
         _list path;
     instructions_documents =
       option_of_yojson
         (value_for_key instructions_documents_of_yojson "instructionsDocuments")
         _list path;
   }
    : update_capability_request)

let update_partnership_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profile_id = value_for_key profile_id_of_yojson "profileId" _list path;
     partnership_id = value_for_key partnership_id_of_yojson "partnershipId" _list path;
     partnership_arn = value_for_key resource_arn_of_yojson "partnershipArn" _list path;
     name = option_of_yojson (value_for_key partner_name_of_yojson "name") _list path;
     email = option_of_yojson (value_for_key email_of_yojson "email") _list path;
     phone = option_of_yojson (value_for_key phone_of_yojson "phone") _list path;
     capabilities =
       option_of_yojson (value_for_key partnership_capabilities_of_yojson "capabilities") _list path;
     capability_options =
       option_of_yojson (value_for_key capability_options_of_yojson "capabilityOptions") _list path;
     trading_partner_id =
       option_of_yojson (value_for_key trading_partner_id_of_yojson "tradingPartnerId") _list path;
     created_at = value_for_key created_date_of_yojson "createdAt" _list path;
     modified_at = option_of_yojson (value_for_key modified_date_of_yojson "modifiedAt") _list path;
   }
    : update_partnership_response)

let update_partnership_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     partnership_id = value_for_key partnership_id_of_yojson "partnershipId" _list path;
     name = option_of_yojson (value_for_key partner_name_of_yojson "name") _list path;
     capabilities =
       option_of_yojson (value_for_key partnership_capabilities_of_yojson "capabilities") _list path;
     capability_options =
       option_of_yojson (value_for_key capability_options_of_yojson "capabilityOptions") _list path;
   }
    : update_partnership_request)

let update_profile_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profile_id = value_for_key profile_id_of_yojson "profileId" _list path;
     profile_arn = value_for_key resource_arn_of_yojson "profileArn" _list path;
     name = value_for_key profile_name_of_yojson "name" _list path;
     email = option_of_yojson (value_for_key email_of_yojson "email") _list path;
     phone = value_for_key phone_of_yojson "phone" _list path;
     business_name = value_for_key business_name_of_yojson "businessName" _list path;
     logging = option_of_yojson (value_for_key logging_of_yojson "logging") _list path;
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "logGroupName") _list path;
     created_at = value_for_key created_date_of_yojson "createdAt" _list path;
     modified_at = option_of_yojson (value_for_key modified_date_of_yojson "modifiedAt") _list path;
   }
    : update_profile_response)

let update_profile_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profile_id = value_for_key profile_id_of_yojson "profileId" _list path;
     name = option_of_yojson (value_for_key profile_name_of_yojson "name") _list path;
     email = option_of_yojson (value_for_key email_of_yojson "email") _list path;
     phone = option_of_yojson (value_for_key phone_of_yojson "phone") _list path;
     business_name =
       option_of_yojson (value_for_key business_name_of_yojson "businessName") _list path;
   }
    : update_profile_request)

let update_transformer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transformer_id = value_for_key transformer_id_of_yojson "transformerId" _list path;
     transformer_arn = value_for_key resource_arn_of_yojson "transformerArn" _list path;
     name = value_for_key transformer_name_of_yojson "name" _list path;
     status = value_for_key transformer_status_of_yojson "status" _list path;
     created_at = value_for_key created_date_of_yojson "createdAt" _list path;
     modified_at = value_for_key modified_date_of_yojson "modifiedAt" _list path;
     file_format = option_of_yojson (value_for_key file_format_of_yojson "fileFormat") _list path;
     mapping_template =
       option_of_yojson (value_for_key mapping_template_of_yojson "mappingTemplate") _list path;
     edi_type = option_of_yojson (value_for_key edi_type_of_yojson "ediType") _list path;
     sample_document =
       option_of_yojson (value_for_key file_location_of_yojson "sampleDocument") _list path;
     input_conversion =
       option_of_yojson (value_for_key input_conversion_of_yojson "inputConversion") _list path;
     mapping = option_of_yojson (value_for_key mapping_of_yojson "mapping") _list path;
     output_conversion =
       option_of_yojson (value_for_key output_conversion_of_yojson "outputConversion") _list path;
     sample_documents =
       option_of_yojson (value_for_key sample_documents_of_yojson "sampleDocuments") _list path;
   }
    : update_transformer_response)

let update_transformer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transformer_id = value_for_key transformer_id_of_yojson "transformerId" _list path;
     name = option_of_yojson (value_for_key transformer_name_of_yojson "name") _list path;
     status = option_of_yojson (value_for_key transformer_status_of_yojson "status") _list path;
     file_format = option_of_yojson (value_for_key file_format_of_yojson "fileFormat") _list path;
     mapping_template =
       option_of_yojson (value_for_key mapping_template_of_yojson "mappingTemplate") _list path;
     edi_type = option_of_yojson (value_for_key edi_type_of_yojson "ediType") _list path;
     sample_document =
       option_of_yojson (value_for_key file_location_of_yojson "sampleDocument") _list path;
     input_conversion =
       option_of_yojson (value_for_key input_conversion_of_yojson "inputConversion") _list path;
     mapping = option_of_yojson (value_for_key mapping_of_yojson "mapping") _list path;
     output_conversion =
       option_of_yojson (value_for_key output_conversion_of_yojson "outputConversion") _list path;
     sample_documents =
       option_of_yojson (value_for_key sample_documents_of_yojson "sampleDocuments") _list path;
   }
    : update_transformer_request)
