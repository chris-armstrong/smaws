type nonrec x12_version =
  | VERSION_5010_HIPAA [@ocaml.doc ""]
  | VERSION_5010 [@ocaml.doc ""]
  | VERSION_4060 [@ocaml.doc ""]
  | VERSION_4050 [@ocaml.doc ""]
  | VERSION_4030 [@ocaml.doc ""]
  | VERSION_4010 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec element_id = string [@@ocaml.doc ""]

type nonrec code_list = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec x12_code_list_validation_rule = {
  codes_to_remove : code_list option;
      [@ocaml.doc
        "Specifies a list of code values to remove from the element's allowed values. These codes \
         will be considered invalid for the specified element, even if they are part of the \
         standard codes defined by the X12 specification.\n"]
  codes_to_add : code_list option;
      [@ocaml.doc
        "Specifies a list of code values to add to the element's allowed values. These codes will \
         be considered valid for the specified element in addition to the standard codes defined \
         by the X12 specification.\n"]
  element_id : element_id;
      [@ocaml.doc
        "Specifies the four-digit element ID to which the code list modifications apply. This \
         identifies which X12 element will have its allowed code values modified.\n"]
}
[@@ocaml.doc
  "Defines a validation rule that modifies the allowed code values for a specific X12 element. \
   This rule allows you to add or remove valid codes from an element's standard code list, \
   providing flexibility to accommodate trading partner-specific requirements or industry \
   variations. You can specify codes to add to expand the allowed values beyond the X12 standard, \
   or codes to remove to restrict the allowed values for stricter validation.\n"]

type nonrec x12_element_length_validation_rule = {
  min_length : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc
        "Specifies the minimum required length for the identified element. This value must be \
         between 1 and 200 characters and defines the lower limit for the element's content length.\n"]
  max_length : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc
        "Specifies the maximum allowed length for the identified element. This value must be \
         between 1 and 200 characters and defines the upper limit for the element's content length.\n"]
  element_id : element_id;
      [@ocaml.doc
        "Specifies the four-digit element ID to which the length constraints will be applied. This \
         identifies which X12 element will have its length requirements modified.\n"]
}
[@@ocaml.doc
  "Defines a validation rule that specifies custom length constraints for a specific X12 element. \
   This rule allows you to override the standard minimum and maximum length requirements for an \
   element, enabling validation of trading partner-specific length requirements that may differ \
   from the X12 specification. Both minimum and maximum length values must be specified and must \
   be between 1 and 200 characters.\n"]

type nonrec element_position = string [@@ocaml.doc ""]

type nonrec element_requirement = MANDATORY [@ocaml.doc ""] | OPTIONAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec x12_element_requirement_validation_rule = {
  requirement : element_requirement;
      [@ocaml.doc
        "Specifies the requirement status for the element at the specified position. Valid values \
         are OPTIONAL (the element may be omitted) or MANDATORY (the element must be present).\n"]
  element_position : element_position;
      [@ocaml.doc
        "Specifies the position of the element within an X12 segment for which the requirement \
         status will be modified. The format follows the pattern of segment identifier followed by \
         element position (e.g., \"ST-01\" for the first element of the ST segment).\n"]
}
[@@ocaml.doc
  "Defines a validation rule that modifies the requirement status of a specific X12 element within \
   a segment. This rule allows you to make optional elements mandatory or mandatory elements \
   optional, providing flexibility to accommodate different trading partner requirements and \
   business rules. The rule targets a specific element position within a segment and sets its \
   requirement status to either OPTIONAL or MANDATORY.\n"]

type nonrec x12_validation_rule =
  | ElementRequirementValidationRule of x12_element_requirement_validation_rule
      [@ocaml.doc
        "Specifies an element requirement validation rule that modifies whether a specific X12 \
         element is required or optional within a segment. This rule provides flexibility to \
         accommodate different trading partner requirements for element presence.\n"]
  | ElementLengthValidationRule of x12_element_length_validation_rule
      [@ocaml.doc
        "Specifies an element length validation rule that defines custom length constraints for a \
         specific X12 element. This rule allows you to enforce minimum and maximum length \
         requirements that may differ from the standard X12 specification.\n"]
  | CodeListValidationRule of x12_code_list_validation_rule
      [@ocaml.doc
        "Specifies a code list validation rule that modifies the allowed code values for a \
         specific X12 element. This rule enables you to customize which codes are considered valid \
         for an element, allowing for trading partner-specific code requirements.\n"]
[@@ocaml.doc
  "Represents a single validation rule that can be applied during X12 EDI processing. This is a \
   union type that can contain one of several specific validation rule types: code list validation \
   rules for modifying allowed element codes, element length validation rules for enforcing custom \
   length constraints, or element requirement validation rules for changing mandatory/optional \
   status. Each validation rule targets specific aspects of EDI document validation to ensure \
   compliance with trading partner requirements and business rules.\n"]

type nonrec x12_validation_rules = x12_validation_rule list [@@ocaml.doc ""]

type nonrec x12_validation_options = {
  validation_rules : x12_validation_rules option;
      [@ocaml.doc
        "Specifies a list of validation rules to apply during EDI document processing. These rules \
         can include code list modifications, element length constraints, and element requirement \
         changes.\n"]
}
[@@ocaml.doc
  "Contains configuration options for X12 EDI validation. This structure allows you to specify \
   custom validation rules that will be applied during EDI document processing, including element \
   length constraints, code list modifications, and element requirement changes. These validation \
   options provide flexibility to accommodate trading partner-specific requirements while \
   maintaining EDI compliance. The validation rules are applied in addition to standard X12 \
   validation to ensure documents meet both standard and custom requirements.\n"]

type nonrec x12_validate_edi = bool [@@ocaml.doc ""]

type nonrec x12_usage_indicator_code = string [@@ocaml.doc ""]

type nonrec x12_transaction_set =
  | X12_999_X231 [@ocaml.doc ""]
  | X12_837_X298 [@ocaml.doc ""]
  | X12_837_X292 [@ocaml.doc ""]
  | X12_837_X291 [@ocaml.doc ""]
  | X12_837_X224 [@ocaml.doc ""]
  | X12_837_X223 [@ocaml.doc ""]
  | X12_837_X222 [@ocaml.doc ""]
  | X12_835_X221 [@ocaml.doc ""]
  | X12_834_X318 [@ocaml.doc ""]
  | X12_834_X307 [@ocaml.doc ""]
  | X12_834_X220 [@ocaml.doc ""]
  | X12_824_X186 [@ocaml.doc ""]
  | X12_820_X306 [@ocaml.doc ""]
  | X12_820_X218 [@ocaml.doc ""]
  | X12_278_X217 [@ocaml.doc ""]
  | X12_277_X364 [@ocaml.doc ""]
  | X12_277_X214 [@ocaml.doc ""]
  | X12_277_X212 [@ocaml.doc ""]
  | X12_276_X212 [@ocaml.doc ""]
  | X12_275_X211 [@ocaml.doc ""]
  | X12_275_X210 [@ocaml.doc ""]
  | X12_271_X279 [@ocaml.doc ""]
  | X12_270_X279 [@ocaml.doc ""]
  | X12_999 [@ocaml.doc ""]
  | X12_998 [@ocaml.doc ""]
  | X12_997 [@ocaml.doc ""]
  | X12_996 [@ocaml.doc ""]
  | X12_993 [@ocaml.doc ""]
  | X12_990 [@ocaml.doc ""]
  | X12_980 [@ocaml.doc ""]
  | X12_947 [@ocaml.doc ""]
  | X12_945 [@ocaml.doc ""]
  | X12_944 [@ocaml.doc ""]
  | X12_943 [@ocaml.doc ""]
  | X12_940 [@ocaml.doc ""]
  | X12_928 [@ocaml.doc ""]
  | X12_926 [@ocaml.doc ""]
  | X12_925 [@ocaml.doc ""]
  | X12_924 [@ocaml.doc ""]
  | X12_920 [@ocaml.doc ""]
  | X12_896 [@ocaml.doc ""]
  | X12_895 [@ocaml.doc ""]
  | X12_894 [@ocaml.doc ""]
  | X12_893 [@ocaml.doc ""]
  | X12_891 [@ocaml.doc ""]
  | X12_889 [@ocaml.doc ""]
  | X12_888 [@ocaml.doc ""]
  | X12_887 [@ocaml.doc ""]
  | X12_886 [@ocaml.doc ""]
  | X12_885 [@ocaml.doc ""]
  | X12_884 [@ocaml.doc ""]
  | X12_883 [@ocaml.doc ""]
  | X12_882 [@ocaml.doc ""]
  | X12_881 [@ocaml.doc ""]
  | X12_880 [@ocaml.doc ""]
  | X12_879 [@ocaml.doc ""]
  | X12_878 [@ocaml.doc ""]
  | X12_877 [@ocaml.doc ""]
  | X12_876 [@ocaml.doc ""]
  | X12_875 [@ocaml.doc ""]
  | X12_874 [@ocaml.doc ""]
  | X12_873 [@ocaml.doc ""]
  | X12_872 [@ocaml.doc ""]
  | X12_871 [@ocaml.doc ""]
  | X12_870 [@ocaml.doc ""]
  | X12_869 [@ocaml.doc ""]
  | X12_868 [@ocaml.doc ""]
  | X12_867 [@ocaml.doc ""]
  | X12_866 [@ocaml.doc ""]
  | X12_865 [@ocaml.doc ""]
  | X12_864 [@ocaml.doc ""]
  | X12_863 [@ocaml.doc ""]
  | X12_862 [@ocaml.doc ""]
  | X12_861 [@ocaml.doc ""]
  | X12_860 [@ocaml.doc ""]
  | X12_859 [@ocaml.doc ""]
  | X12_858 [@ocaml.doc ""]
  | X12_857 [@ocaml.doc ""]
  | X12_856 [@ocaml.doc ""]
  | X12_855 [@ocaml.doc ""]
  | X12_854 [@ocaml.doc ""]
  | X12_853 [@ocaml.doc ""]
  | X12_852 [@ocaml.doc ""]
  | X12_851 [@ocaml.doc ""]
  | X12_850 [@ocaml.doc ""]
  | X12_849 [@ocaml.doc ""]
  | X12_848 [@ocaml.doc ""]
  | X12_847 [@ocaml.doc ""]
  | X12_846 [@ocaml.doc ""]
  | X12_845 [@ocaml.doc ""]
  | X12_844 [@ocaml.doc ""]
  | X12_843 [@ocaml.doc ""]
  | X12_842 [@ocaml.doc ""]
  | X12_841 [@ocaml.doc ""]
  | X12_840 [@ocaml.doc ""]
  | X12_839 [@ocaml.doc ""]
  | X12_838 [@ocaml.doc ""]
  | X12_837 [@ocaml.doc ""]
  | X12_836 [@ocaml.doc ""]
  | X12_835 [@ocaml.doc ""]
  | X12_834 [@ocaml.doc ""]
  | X12_833 [@ocaml.doc ""]
  | X12_832 [@ocaml.doc ""]
  | X12_831 [@ocaml.doc ""]
  | X12_830 [@ocaml.doc ""]
  | X12_829 [@ocaml.doc ""]
  | X12_828 [@ocaml.doc ""]
  | X12_827 [@ocaml.doc ""]
  | X12_826 [@ocaml.doc ""]
  | X12_824 [@ocaml.doc ""]
  | X12_823 [@ocaml.doc ""]
  | X12_822 [@ocaml.doc ""]
  | X12_821 [@ocaml.doc ""]
  | X12_820 [@ocaml.doc ""]
  | X12_819 [@ocaml.doc ""]
  | X12_818 [@ocaml.doc ""]
  | X12_816 [@ocaml.doc ""]
  | X12_815 [@ocaml.doc ""]
  | X12_814 [@ocaml.doc ""]
  | X12_813 [@ocaml.doc ""]
  | X12_812 [@ocaml.doc ""]
  | X12_811 [@ocaml.doc ""]
  | X12_810 [@ocaml.doc ""]
  | X12_806 [@ocaml.doc ""]
  | X12_805 [@ocaml.doc ""]
  | X12_754 [@ocaml.doc ""]
  | X12_753 [@ocaml.doc ""]
  | X12_715 [@ocaml.doc ""]
  | X12_650 [@ocaml.doc ""]
  | X12_625 [@ocaml.doc ""]
  | X12_620 [@ocaml.doc ""]
  | X12_602 [@ocaml.doc ""]
  | X12_601 [@ocaml.doc ""]
  | X12_568 [@ocaml.doc ""]
  | X12_567 [@ocaml.doc ""]
  | X12_561 [@ocaml.doc ""]
  | X12_540 [@ocaml.doc ""]
  | X12_536 [@ocaml.doc ""]
  | X12_527 [@ocaml.doc ""]
  | X12_521 [@ocaml.doc ""]
  | X12_517 [@ocaml.doc ""]
  | X12_511 [@ocaml.doc ""]
  | X12_504 [@ocaml.doc ""]
  | X12_503 [@ocaml.doc ""]
  | X12_501 [@ocaml.doc ""]
  | X12_500 [@ocaml.doc ""]
  | X12_494 [@ocaml.doc ""]
  | X12_492 [@ocaml.doc ""]
  | X12_490 [@ocaml.doc ""]
  | X12_486 [@ocaml.doc ""]
  | X12_485 [@ocaml.doc ""]
  | X12_475 [@ocaml.doc ""]
  | X12_470 [@ocaml.doc ""]
  | X12_468 [@ocaml.doc ""]
  | X12_466 [@ocaml.doc ""]
  | X12_463 [@ocaml.doc ""]
  | X12_460 [@ocaml.doc ""]
  | X12_456 [@ocaml.doc ""]
  | X12_455 [@ocaml.doc ""]
  | X12_453 [@ocaml.doc ""]
  | X12_452 [@ocaml.doc ""]
  | X12_451 [@ocaml.doc ""]
  | X12_440 [@ocaml.doc ""]
  | X12_437 [@ocaml.doc ""]
  | X12_436 [@ocaml.doc ""]
  | X12_435 [@ocaml.doc ""]
  | X12_434 [@ocaml.doc ""]
  | X12_433 [@ocaml.doc ""]
  | X12_432 [@ocaml.doc ""]
  | X12_431 [@ocaml.doc ""]
  | X12_429 [@ocaml.doc ""]
  | X12_426 [@ocaml.doc ""]
  | X12_425 [@ocaml.doc ""]
  | X12_424 [@ocaml.doc ""]
  | X12_423 [@ocaml.doc ""]
  | X12_422 [@ocaml.doc ""]
  | X12_421 [@ocaml.doc ""]
  | X12_420 [@ocaml.doc ""]
  | X12_419 [@ocaml.doc ""]
  | X12_418 [@ocaml.doc ""]
  | X12_417 [@ocaml.doc ""]
  | X12_414 [@ocaml.doc ""]
  | X12_412 [@ocaml.doc ""]
  | X12_410 [@ocaml.doc ""]
  | X12_404 [@ocaml.doc ""]
  | X12_362 [@ocaml.doc ""]
  | X12_361 [@ocaml.doc ""]
  | X12_358 [@ocaml.doc ""]
  | X12_357 [@ocaml.doc ""]
  | X12_356 [@ocaml.doc ""]
  | X12_355 [@ocaml.doc ""]
  | X12_354 [@ocaml.doc ""]
  | X12_353 [@ocaml.doc ""]
  | X12_352 [@ocaml.doc ""]
  | X12_350 [@ocaml.doc ""]
  | X12_326 [@ocaml.doc ""]
  | X12_325 [@ocaml.doc ""]
  | X12_324 [@ocaml.doc ""]
  | X12_323 [@ocaml.doc ""]
  | X12_322 [@ocaml.doc ""]
  | X12_319 [@ocaml.doc ""]
  | X12_317 [@ocaml.doc ""]
  | X12_315 [@ocaml.doc ""]
  | X12_313 [@ocaml.doc ""]
  | X12_312 [@ocaml.doc ""]
  | X12_311 [@ocaml.doc ""]
  | X12_310 [@ocaml.doc ""]
  | X12_309 [@ocaml.doc ""]
  | X12_304 [@ocaml.doc ""]
  | X12_303 [@ocaml.doc ""]
  | X12_301 [@ocaml.doc ""]
  | X12_300 [@ocaml.doc ""]
  | X12_290 [@ocaml.doc ""]
  | X12_288 [@ocaml.doc ""]
  | X12_286 [@ocaml.doc ""]
  | X12_285 [@ocaml.doc ""]
  | X12_284 [@ocaml.doc ""]
  | X12_283 [@ocaml.doc ""]
  | X12_280 [@ocaml.doc ""]
  | X12_278 [@ocaml.doc ""]
  | X12_277 [@ocaml.doc ""]
  | X12_276 [@ocaml.doc ""]
  | X12_275 [@ocaml.doc ""]
  | X12_274 [@ocaml.doc ""]
  | X12_273 [@ocaml.doc ""]
  | X12_272 [@ocaml.doc ""]
  | X12_271 [@ocaml.doc ""]
  | X12_270 [@ocaml.doc ""]
  | X12_269 [@ocaml.doc ""]
  | X12_268 [@ocaml.doc ""]
  | X12_267 [@ocaml.doc ""]
  | X12_266 [@ocaml.doc ""]
  | X12_265 [@ocaml.doc ""]
  | X12_264 [@ocaml.doc ""]
  | X12_263 [@ocaml.doc ""]
  | X12_262 [@ocaml.doc ""]
  | X12_261 [@ocaml.doc ""]
  | X12_260 [@ocaml.doc ""]
  | X12_259 [@ocaml.doc ""]
  | X12_256 [@ocaml.doc ""]
  | X12_255 [@ocaml.doc ""]
  | X12_252 [@ocaml.doc ""]
  | X12_251 [@ocaml.doc ""]
  | X12_250 [@ocaml.doc ""]
  | X12_249 [@ocaml.doc ""]
  | X12_248 [@ocaml.doc ""]
  | X12_245 [@ocaml.doc ""]
  | X12_244 [@ocaml.doc ""]
  | X12_242 [@ocaml.doc ""]
  | X12_240 [@ocaml.doc ""]
  | X12_228 [@ocaml.doc ""]
  | X12_227 [@ocaml.doc ""]
  | X12_225 [@ocaml.doc ""]
  | X12_224 [@ocaml.doc ""]
  | X12_223 [@ocaml.doc ""]
  | X12_222 [@ocaml.doc ""]
  | X12_220 [@ocaml.doc ""]
  | X12_219 [@ocaml.doc ""]
  | X12_218 [@ocaml.doc ""]
  | X12_217 [@ocaml.doc ""]
  | X12_216 [@ocaml.doc ""]
  | X12_215 [@ocaml.doc ""]
  | X12_214 [@ocaml.doc ""]
  | X12_213 [@ocaml.doc ""]
  | X12_212 [@ocaml.doc ""]
  | X12_211 [@ocaml.doc ""]
  | X12_210 [@ocaml.doc ""]
  | X12_206 [@ocaml.doc ""]
  | X12_205 [@ocaml.doc ""]
  | X12_204 [@ocaml.doc ""]
  | X12_203 [@ocaml.doc ""]
  | X12_202 [@ocaml.doc ""]
  | X12_201 [@ocaml.doc ""]
  | X12_200 [@ocaml.doc ""]
  | X12_199 [@ocaml.doc ""]
  | X12_198 [@ocaml.doc ""]
  | X12_197 [@ocaml.doc ""]
  | X12_196 [@ocaml.doc ""]
  | X12_195 [@ocaml.doc ""]
  | X12_194 [@ocaml.doc ""]
  | X12_191 [@ocaml.doc ""]
  | X12_190 [@ocaml.doc ""]
  | X12_189 [@ocaml.doc ""]
  | X12_188 [@ocaml.doc ""]
  | X12_187 [@ocaml.doc ""]
  | X12_186 [@ocaml.doc ""]
  | X12_185 [@ocaml.doc ""]
  | X12_180 [@ocaml.doc ""]
  | X12_179 [@ocaml.doc ""]
  | X12_176 [@ocaml.doc ""]
  | X12_175 [@ocaml.doc ""]
  | X12_170 [@ocaml.doc ""]
  | X12_163 [@ocaml.doc ""]
  | X12_161 [@ocaml.doc ""]
  | X12_160 [@ocaml.doc ""]
  | X12_159 [@ocaml.doc ""]
  | X12_158 [@ocaml.doc ""]
  | X12_157 [@ocaml.doc ""]
  | X12_155 [@ocaml.doc ""]
  | X12_154 [@ocaml.doc ""]
  | X12_153 [@ocaml.doc ""]
  | X12_152 [@ocaml.doc ""]
  | X12_151 [@ocaml.doc ""]
  | X12_150 [@ocaml.doc ""]
  | X12_149 [@ocaml.doc ""]
  | X12_148 [@ocaml.doc ""]
  | X12_147 [@ocaml.doc ""]
  | X12_146 [@ocaml.doc ""]
  | X12_144 [@ocaml.doc ""]
  | X12_143 [@ocaml.doc ""]
  | X12_142 [@ocaml.doc ""]
  | X12_141 [@ocaml.doc ""]
  | X12_140 [@ocaml.doc ""]
  | X12_139 [@ocaml.doc ""]
  | X12_138 [@ocaml.doc ""]
  | X12_135 [@ocaml.doc ""]
  | X12_133 [@ocaml.doc ""]
  | X12_132 [@ocaml.doc ""]
  | X12_131 [@ocaml.doc ""]
  | X12_130 [@ocaml.doc ""]
  | X12_129 [@ocaml.doc ""]
  | X12_128 [@ocaml.doc ""]
  | X12_127 [@ocaml.doc ""]
  | X12_126 [@ocaml.doc ""]
  | X12_125 [@ocaml.doc ""]
  | X12_124 [@ocaml.doc ""]
  | X12_121 [@ocaml.doc ""]
  | X12_120 [@ocaml.doc ""]
  | X12_113 [@ocaml.doc ""]
  | X12_112 [@ocaml.doc ""]
  | X12_111 [@ocaml.doc ""]
  | X12_110 [@ocaml.doc ""]
  | X12_109 [@ocaml.doc ""]
  | X12_108 [@ocaml.doc ""]
  | X12_107 [@ocaml.doc ""]
  | X12_106 [@ocaml.doc ""]
  | X12_105 [@ocaml.doc ""]
  | X12_104 [@ocaml.doc ""]
  | X12_103 [@ocaml.doc ""]
  | X12_102 [@ocaml.doc ""]
  | X12_101 [@ocaml.doc ""]
  | X12_100 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec x12_technical_acknowledgment =
  | GENERATE_ALL_SEGMENTS [@ocaml.doc ""]
  | DO_NOT_GENERATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec x12_split_by = TRANSACTION [@ocaml.doc ""] | NONE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec x12_split_options = {
  split_by : x12_split_by;
      [@ocaml.doc
        "Specifies the method used to split X12 EDI files. Valid values include [TRANSACTION] \
         (split by individual transaction sets), or [NONE] (no splitting).\n"]
}
[@@ocaml.doc
  "Contains options for splitting X12 EDI files into smaller units. This is useful for processing \
   large EDI files more efficiently.\n"]

type nonrec x12_sender_id = string [@@ocaml.doc ""]

type nonrec x12_segment_terminator = string [@@ocaml.doc ""]

type nonrec x12_responsible_agency_code = string [@@ocaml.doc ""]

type nonrec x12_repetition_separator = string [@@ocaml.doc ""]

type nonrec x12_receiver_id = string [@@ocaml.doc ""]

type nonrec x12_id_qualifier = string [@@ocaml.doc ""]

type nonrec x12_acknowledgment_requested_code = string [@@ocaml.doc ""]

type nonrec x12_interchange_control_headers = {
  usage_indicator_code : x12_usage_indicator_code option;
      [@ocaml.doc
        "Located at position ISA-15 in the header. Specifies how this interchange is being used:\n\n\
        \ {ul\n\
        \       {-   [T] indicates this interchange is for testing.\n\
        \           \n\
        \            }\n\
        \       {-   [P] indicates this interchange is for production.\n\
        \           \n\
        \            }\n\
        \       {-   [I] indicates this interchange is informational.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  acknowledgment_requested_code : x12_acknowledgment_requested_code option;
      [@ocaml.doc
        "Located at position ISA-14 in the header. The value \"1\" indicates that the sender is \
         requesting an interchange acknowledgment at receipt of the interchange. The value \"0\" \
         is used otherwise.\n"]
  repetition_separator : x12_repetition_separator option;
      [@ocaml.doc
        "Located at position ISA-11 in the header. This string makes it easier when you need to \
         group similar adjacent element values together without using extra segments.\n\n\
        \  This parameter is only honored for version greater than 401 ([VERSION_4010] and higher).\n\
        \  \n\
        \   For versions less than 401, this field is called \
         {{:https://www.stedi.com/edi/x12-004010/segment/ISA#ISA-11}StandardsId}, in which case \
         our service sets the value to [U].\n\
        \   \n\
        \    "]
  receiver_id : x12_receiver_id option;
      [@ocaml.doc
        "Located at position ISA-08 in the header. This value (along with the \
         [receiverIdQualifier]) identifies the intended recipient of the interchange. \n"]
  receiver_id_qualifier : x12_id_qualifier option;
      [@ocaml.doc
        "Located at position ISA-07 in the header. Qualifier for the receiver ID. Together, the ID \
         and qualifier uniquely identify the receiving trading partner.\n"]
  sender_id : x12_sender_id option;
      [@ocaml.doc
        "Located at position ISA-06 in the header. This value (along with the [senderIdQualifier]) \
         identifies the sender of the interchange. \n"]
  sender_id_qualifier : x12_id_qualifier option;
      [@ocaml.doc
        "Located at position ISA-05 in the header. Qualifier for the sender ID. Together, the ID \
         and qualifier uniquely identify the sending trading partner.\n"]
}
[@@ocaml.doc
  "In X12, the Interchange Control Header is the first segment of an EDI document and is part of \
   the Interchange Envelope. It contains information about the sender and receiver, the date and \
   time of transmission, and the X12 version being used. It also includes delivery information, \
   such as the sender and receiver IDs.\n"]

type nonrec x12_application_sender_code = string [@@ocaml.doc ""]

type nonrec x12_application_receiver_code = string [@@ocaml.doc ""]

type nonrec x12_functional_group_headers = {
  responsible_agency_code : x12_responsible_agency_code option;
      [@ocaml.doc "A code that identifies the issuer of the standard, at position GS-07.\n"]
  application_receiver_code : x12_application_receiver_code option;
      [@ocaml.doc
        "A value representing the code used to identify the party receiving a message, at position \
         GS-03.\n"]
  application_sender_code : x12_application_sender_code option;
      [@ocaml.doc
        "A value representing the code used to identify the party transmitting a message, at \
         position GS-02.\n"]
}
[@@ocaml.doc
  "Part of the X12 message structure. These are the functional group headers for the X12 EDI object.\n"]

type nonrec x12_component_separator = string [@@ocaml.doc ""]

type nonrec x12_data_element_separator = string [@@ocaml.doc ""]

type nonrec x12_delimiters = {
  segment_terminator : x12_segment_terminator option;
      [@ocaml.doc "The segment terminator. The default value is [~] (tilde).\n"]
  data_element_separator : x12_data_element_separator option;
      [@ocaml.doc "The data element separator. The default value is [*] (asterisk).\n"]
  component_separator : x12_component_separator option;
      [@ocaml.doc "The component, or sub-element, separator. The default value is [:] (colon).\n"]
}
[@@ocaml.doc
  "In X12 EDI messages, delimiters are used to mark the end of segments or elements, and are \
   defined in the interchange control header. The delimiters are part of the message's syntax and \
   divide up its different elements.\n"]

type nonrec starting_interchange_control_number = int [@@ocaml.doc ""]

type nonrec starting_functional_group_control_number = int [@@ocaml.doc ""]

type nonrec starting_transaction_set_control_number = int [@@ocaml.doc ""]

type nonrec x12_control_numbers = {
  starting_transaction_set_control_number : starting_transaction_set_control_number option;
      [@ocaml.doc
        "Specifies the starting transaction set control number (ST02) to use for X12 EDI \
         generation. This number is incremented for each new transaction set.\n"]
  starting_functional_group_control_number : starting_functional_group_control_number option;
      [@ocaml.doc
        "Specifies the starting functional group control number (GS06) to use for X12 EDI \
         generation. This number is incremented for each new functional group. For the GS \
         (functional group) envelope, Amazon Web Services B2B Data Interchange generates a \
         functional group control number that is unique to the sender ID, receiver ID, and \
         functional identifier code combination. \n"]
  starting_interchange_control_number : starting_interchange_control_number option;
      [@ocaml.doc
        "Specifies the starting interchange control number (ISA13) to use for X12 EDI generation. \
         This number is incremented for each new interchange. For the ISA (interchange) envelope, \
         Amazon Web Services B2B Data Interchange generates an interchange control number that is \
         unique for the ISA05 and ISA06 (sender) & ISA07 and ISA08 (receiver) combination. \n"]
}
[@@ocaml.doc
  "Contains configuration for X12 control numbers used in X12 EDI generation. Control numbers are \
   used to uniquely identify interchanges, functional groups, and transaction sets.\n"]

type nonrec x12gs05_time_format =
  | HHMMSSDD [@ocaml.doc ""]
  | HHMMSS [@ocaml.doc ""]
  | HHMM [@ocaml.doc ""]
[@@ocaml.doc
  "Specifies the time format in the GS05 element (time) of the functional group header. The \
   following formats use 24-hour clock time:\n\n\
  \ {ul\n\
  \       {-   [HHMM] - Hours and minutes\n\
  \           \n\
  \            }\n\
  \       {-   [HHMMSS] - Hours, minutes, and seconds\n\
  \           \n\
  \            }\n\
  \       {-   [HHMMSSDD] - Hours, minutes, seconds, and decimal seconds\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   Where:\n\
  \   \n\
  \    {ul\n\
  \          {-   [HH] - Hours (00-23)\n\
  \              \n\
  \               }\n\
  \          {-   [MM] - Minutes (00-59)\n\
  \              \n\
  \               }\n\
  \          {-   [SS] - Seconds (00-59)\n\
  \              \n\
  \               }\n\
  \          {-   [DD] - Hundredths of seconds (00-99)\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

type nonrec x12_outbound_edi_headers = {
  gs05_time_format : x12gs05_time_format option; [@ocaml.doc ""]
  control_numbers : x12_control_numbers option;
      [@ocaml.doc
        "Specifies control number configuration for outbound X12 EDI headers. These settings \
         determine the starting values for interchange, functional group, and transaction set \
         control numbers.\n"]
  validate_edi : x12_validate_edi option;
      [@ocaml.doc
        "Specifies whether or not to validate the EDI for this X12 object: [TRUE] or [FALSE]. When \
         enabled, this performs both standard EDI validation and applies any configured custom \
         validation rules including element length constraints, code list validations, and element \
         requirement checks. Validation results are returned in the response validation messages.\n"]
  delimiters : x12_delimiters option;
      [@ocaml.doc
        "The delimiters, for example semicolon ([;]), that separates sections of the headers for \
         the X12 object.\n"]
  functional_group_headers : x12_functional_group_headers option;
      [@ocaml.doc "The functional group headers for the X12 object.\n"]
  interchange_control_headers : x12_interchange_control_headers option;
      [@ocaml.doc
        "In X12 EDI messages, delimiters are used to mark the end of segments or elements, and are \
         defined in the interchange control header.\n"]
}
[@@ocaml.doc "A structure containing the details for an outbound EDI object.\n"]

type nonrec x12_functional_acknowledgment =
  | GENERATE_WITHOUT_TRANSACTION_SET_RESPONSE_LOOP [@ocaml.doc ""]
  | GENERATE_ALL_SEGMENTS [@ocaml.doc ""]
  | DO_NOT_GENERATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec x12_acknowledgment_options = {
  technical_acknowledgment : x12_technical_acknowledgment;
      [@ocaml.doc
        "Specifies whether technical acknowledgments (TA1) should be generated for incoming X12 \
         interchanges. Valid values are [DO_NOT_GENERATE] and [GENERATE_ALL_SEGMENTS] and.\n"]
  functional_acknowledgment : x12_functional_acknowledgment;
      [@ocaml.doc
        "Specifies whether functional acknowledgments (997/999) should be generated for incoming \
         X12 transactions. Valid values are [DO_NOT_GENERATE], [GENERATE_ALL_SEGMENTS] and \
         [GENERATE_WITHOUT_TRANSACTION_SET_RESPONSE_LOOP].\n\n\
        \ If you choose [GENERATE_WITHOUT_TRANSACTION_SET_RESPONSE_LOOP], Amazon Web Services B2B \
         Data Interchange skips the AK2_Loop when generating an acknowledgment document.\n\
        \ "]
}
[@@ocaml.doc
  "Contains options for configuring X12 acknowledgments. These options control how functional and \
   technical acknowledgments are handled.\n"]

type nonrec x12_inbound_edi_options = {
  acknowledgment_options : x12_acknowledgment_options option;
      [@ocaml.doc
        "Specifies acknowledgment options for inbound X12 EDI files. These options control how \
         functional and technical acknowledgments are handled.\n"]
}
[@@ocaml.doc "Contains options specific to processing inbound X12 EDI files.\n"]

type nonrec wrap_format =
  | LINE_LENGTH [@ocaml.doc ""]
  | ONE_LINE [@ocaml.doc ""]
  | SEGMENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec line_terminator = CR [@ocaml.doc ""] | LF [@ocaml.doc ""] | CRLF [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec line_length = int [@@ocaml.doc ""]

type nonrec wrap_options = {
  line_length : line_length option;
      [@ocaml.doc
        "Specifies the maximum length of a line before wrapping occurs. This value is used when \
         [wrapBy] is set to [LINE_LENGTH].\n"]
  line_terminator : line_terminator option;
      [@ocaml.doc
        "Specifies the character sequence used to terminate lines when wrapping. Valid values:\n\n\
        \ {ul\n\
        \       {-   [CRLF]: carriage return and line feed\n\
        \           \n\
        \            }\n\
        \       {-   [LF]: line feed)\n\
        \           \n\
        \            }\n\
        \       {-   [CR]: carriage return\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  wrap_by : wrap_format;
      [@ocaml.doc
        "Specifies the method used for wrapping lines in the EDI output. Valid values:\n\n\
        \ {ul\n\
        \       {-   [SEGMENT]: Wraps by segment.\n\
        \           \n\
        \            }\n\
        \       {-   [ONE_LINE]: Indicates that the entire content is on a single line.\n\
        \           \n\
        \             When you specify [ONE_LINE], do not provide either the line length nor the \
         line terminator value.\n\
        \             \n\
        \               }\n\
        \       {-   [LINE_LENGTH]: Wraps by character count, as specified by [lineLength] value.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Contains options for wrapping (line folding) in X12 EDI files. Wrapping controls how long lines \
   are handled in the EDI output.\n"]

type nonrec x12_envelope = {
  wrap_options : wrap_options option; [@ocaml.doc ""]
  common : x12_outbound_edi_headers option;
      [@ocaml.doc "A container for the X12 outbound EDI headers.\n"]
}
[@@ocaml.doc
  "A wrapper structure for an X12 definition object.\n\n\
  \ the X12 envelope ensures the integrity of the data and the efficiency of the information \
   exchange. The X12 message structure has hierarchical levels. From highest to the lowest, they \
   are:\n\
  \ \n\
  \  {ul\n\
  \        {-  Interchange Envelope\n\
  \            \n\
  \             }\n\
  \        {-  Functional Group\n\
  \            \n\
  \             }\n\
  \        {-  Transaction Set\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec x12_details = {
  version : x12_version option;
      [@ocaml.doc "Returns the version to use for the specified X12 transaction set.\n"]
  transaction_set : x12_transaction_set option;
      [@ocaml.doc
        "Returns an enumerated type where each value identifies an X12 transaction set. \
         Transaction sets are maintained by the X12 Accredited Standards Committee.\n"]
}
[@@ocaml.doc
  "A structure that contains the X12 transaction set and version. The X12 structure is used when \
   the system transforms an EDI (electronic data interchange) file.\n\n\
  \  If an EDI input file contains more than one transaction, each transaction must have the same \
   transaction set and version, for example 214/4010. If not, the transformer cannot parse the \
   file.\n\
  \  \n\
  \   "]

type nonrec x12_advanced_options = {
  validation_options : x12_validation_options option;
      [@ocaml.doc
        "Specifies validation options for X12 EDI processing. These options control how validation \
         rules are applied during EDI document processing, including custom validation rules for \
         element length constraints, code list validations, and element requirement checks.\n"]
  split_options : x12_split_options option;
      [@ocaml.doc
        "Specifies options for splitting X12 EDI files. These options control how large X12 files \
         are divided into smaller, more manageable units.\n"]
}
[@@ocaml.doc
  "Contains advanced options specific to X12 EDI processing, such as splitting large X12 files \
   into smaller units.\n"]

type nonrec validation_messages = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec validation_exception = { message : error_message [@ocaml.doc ""] }
[@@ocaml.doc
  "Occurs when a B2BI object cannot be validated against a request from another object. This \
   exception can be thrown during standard EDI validation or when custom validation rules fail, \
   such as when element length constraints are violated, invalid codes are used in code list \
   validations, or required elements are missing based on configured element requirement rules.\n"]

type nonrec transformer_id = string [@@ocaml.doc ""]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec transformer_name = string [@@ocaml.doc ""]

type nonrec transformer_status = INACTIVE [@ocaml.doc ""] | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec created_date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec modified_date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec file_format = NOT_USED [@ocaml.doc ""] | JSON [@ocaml.doc ""] | XML [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec mapping_template = string [@@ocaml.doc ""]

type nonrec edi_type =
  | X12Details of x12_details
      [@ocaml.doc
        "Returns the details for the EDI standard that is being used for the transformer. \
         Currently, only X12 is supported. X12 is a set of standards and corresponding messages \
         that define specific business documents.\n"]
[@@ocaml.doc
  "Specifies the details for the EDI standard that is being used for the transformer. Currently, \
   only X12 is supported. X12 is a set of standards and corresponding messages that define \
   specific business documents.\n"]

type nonrec file_location = string [@@ocaml.doc ""]

type nonrec from_format = X12 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec format_options = X12 of x12_details [@ocaml.doc ""]
[@@ocaml.doc "A structure that contains the X12 transaction set and version.\n"]

type nonrec advanced_options = {
  x12 : x12_advanced_options option;
      [@ocaml.doc
        "A structure that contains X12-specific advanced options, such as split options for \
         processing X12 EDI files.\n"]
}
[@@ocaml.doc
  "A structure that contains advanced options for EDI processing. Currently, only X12 advanced \
   options are supported.\n"]

type nonrec input_conversion = {
  advanced_options : advanced_options option;
      [@ocaml.doc
        "Specifies advanced options for the input conversion process. These options provide \
         additional control over how EDI files are processed during transformation.\n"]
  format_options : format_options option;
      [@ocaml.doc "A structure that contains the formatting options for an inbound transformer.\n"]
  from_format : from_format;
      [@ocaml.doc "The format for the transformer input: currently on [X12] is supported.\n"]
}
[@@ocaml.doc
  "Contains the input formatting options for an inbound transformer (takes an X12-formatted EDI \
   document as input and converts it to JSON or XML.\n"]

type nonrec mapping_template_language = JSONATA [@ocaml.doc ""] | XSLT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec mapping = {
  template : mapping_template option;
      [@ocaml.doc
        "A string that represents the mapping template, in the transformation language specified \
         in [templateLanguage].\n"]
  template_language : mapping_template_language;
      [@ocaml.doc "The transformation language for the template, either XSLT or JSONATA.\n"]
}
[@@ocaml.doc
  "Specifies the mapping template for the transformer. This template is used to map the parsed EDI \
   file using JSONata or XSLT.\n"]

type nonrec to_format = X12 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec output_conversion = {
  advanced_options : advanced_options option; [@ocaml.doc ""]
  format_options : format_options option;
      [@ocaml.doc
        "A structure that contains the X12 transaction set and version for the transformer output.\n"]
  to_format : to_format;
      [@ocaml.doc
        "The format for the output from an outbound transformer: only X12 is currently supported.\n"]
}
[@@ocaml.doc
  "Contains the formatting options for an outbound transformer (takes JSON or XML as input and \
   converts it to an EDI document (currently only X12 format is supported).\n"]

type nonrec bucket_name = string [@@ocaml.doc ""]

type nonrec s3_key = string [@@ocaml.doc ""]

type nonrec sample_document_keys = {
  output : s3_key option; [@ocaml.doc "An array of keys for your output sample documents.\n"]
  input : s3_key option; [@ocaml.doc "An array of keys for your input sample documents.\n"]
}
[@@ocaml.doc
  "An array of the Amazon S3 keys used to identify the location for your sample documents.\n"]

type nonrec key_list = sample_document_keys list [@@ocaml.doc ""]

type nonrec sample_documents = {
  keys : key_list;
      [@ocaml.doc
        "Contains an array of the Amazon S3 keys used to identify the location for your sample \
         documents.\n"]
  bucket_name : bucket_name;
      [@ocaml.doc "Contains the Amazon S3 bucket that is used to hold your sample documents.\n"]
}
[@@ocaml.doc
  "Describes a structure that contains the Amazon S3 bucket and an array of the corresponding keys \
   used to identify the location for your sample documents.\n"]

type nonrec update_transformer_response = {
  sample_documents : sample_documents option;
      [@ocaml.doc
        "Returns a structure that contains the Amazon S3 bucket and an array of the corresponding \
         keys used to identify the location for your sample documents.\n"]
  output_conversion : output_conversion option;
      [@ocaml.doc
        "Returns the [OutputConversion] object, which contains the format options for the outbound \
         transformation.\n"]
  mapping : mapping option;
      [@ocaml.doc
        "Returns the structure that contains the mapping template and its language (either XSLT or \
         JSONATA).\n"]
  input_conversion : input_conversion option;
      [@ocaml.doc
        "Returns the [InputConversion] object, which contains the format options for the inbound \
         transformation.\n"]
  sample_document : file_location option;
      [@ocaml.doc
        "Returns a sample EDI document that is used by a transformer as a guide for processing the \
         EDI data.\n"]
  edi_type : edi_type option;
      [@ocaml.doc
        "Returns the details for the EDI standard that is being used for the transformer. \
         Currently, only X12 is supported. X12 is a set of standards and corresponding messages \
         that define specific business documents.\n"]
  mapping_template : mapping_template option;
      [@ocaml.doc
        "Returns the mapping template for the transformer. This template is used to map the parsed \
         EDI file using JSONata or XSLT.\n"]
  file_format : file_format option;
      [@ocaml.doc
        "Returns that the currently supported file formats for EDI transformations are [JSON] and \
         [XML].\n"]
  modified_at : modified_date;
      [@ocaml.doc "Returns a timestamp for last time the transformer was modified.\n"]
  created_at : created_date;
      [@ocaml.doc "Returns a timestamp for creation date and time of the transformer.\n"]
  status : transformer_status;
      [@ocaml.doc
        "Returns the state of the newly created transformer. The transformer can be either \
         [active] or [inactive]. For the transformer to be used in a capability, its status must \
         [active].\n"]
  name : transformer_name; [@ocaml.doc "Returns the name of the transformer.\n"]
  transformer_arn : resource_arn;
      [@ocaml.doc
        "Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such \
         as a capability, partnership, profile, or transformer.\n"]
  transformer_id : transformer_id;
      [@ocaml.doc "Returns the system-assigned unique identifier for the transformer.\n"]
}
[@@ocaml.doc ""]

type nonrec update_transformer_request = {
  sample_documents : sample_documents option;
      [@ocaml.doc
        "Specify a structure that contains the Amazon S3 bucket and an array of the corresponding \
         keys used to identify the location for your sample documents.\n"]
  output_conversion : output_conversion option;
      [@ocaml.doc
        "To update, specify the [OutputConversion] object, which contains the format options for \
         the outbound transformation.\n"]
  mapping : mapping option;
      [@ocaml.doc
        "Specify the structure that contains the mapping template and its language (either XSLT or \
         JSONATA).\n"]
  input_conversion : input_conversion option;
      [@ocaml.doc
        "To update, specify the [InputConversion] object, which contains the format options for \
         the inbound transformation.\n"]
  sample_document : file_location option;
      [@ocaml.doc
        "Specifies a sample EDI document that is used by a transformer as a guide for processing \
         the EDI data.\n"]
  edi_type : edi_type option;
      [@ocaml.doc
        "Specifies the details for the EDI standard that is being used for the transformer. \
         Currently, only X12 is supported. X12 is a set of standards and corresponding messages \
         that define specific business documents.\n"]
  mapping_template : mapping_template option;
      [@ocaml.doc
        "Specifies the mapping template for the transformer. This template is used to map the \
         parsed EDI file using JSONata or XSLT.\n\n\
        \  This parameter is available for backwards compatibility. Use the \
         {{:https://docs.aws.amazon.com/b2bi/latest/APIReference/API_Mapping.html}Mapping} data \
         type instead.\n\
        \  \n\
        \   "]
  file_format : file_format option;
      [@ocaml.doc
        "Specifies that the currently supported file formats for EDI transformations are [JSON] \
         and [XML].\n"]
  status : transformer_status option;
      [@ocaml.doc
        "Specifies the transformer's status. You can update the state of the transformer from \
         [inactive] to [active].\n"]
  name : transformer_name option;
      [@ocaml.doc "Specify a new name for the transformer, if you want to update it.\n"]
  transformer_id : transformer_id;
      [@ocaml.doc "Specifies the system-assigned unique identifier for the transformer.\n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = {
  retry_after_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The server attempts to retry a command that was throttled.\n"]
  message : error_message; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was denied due to throttling: the data speed and rendering may be limited depending \
   on various parameters and conditions.\n"]

type nonrec service_quota_exceeded_exception = {
  quota_code : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The quota that was exceeded, which caused the exception.\n"]
  service_code : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The code responsible for exceeding the quota, which caused the exception.\n"]
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The resource type (profile, partnership, transformer, or capability) that exceeded the \
         quota, which caused the exception.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The ID for the resource that exceeded the quota, which caused the exception.\n"]
  message : error_message; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Occurs when the calling command attempts to exceed one of the service quotas, for example \
   trying to create a capability when you already have the maximum number of capabilities allowed.\n"]

type nonrec resource_not_found_exception = { message : error_message [@ocaml.doc ""] }
[@@ocaml.doc
  "Occurs when the requested resource does not exist, or cannot be found. In some cases, the \
   resource exists in a region other than the region specified in the API call.\n"]

type nonrec internal_server_exception = {
  retry_after_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The server attempts to retry a failed command.\n"]
  message : error_message; [@ocaml.doc ""]
}
[@@ocaml.doc
  "This exception is thrown when an error occurs in the Amazon Web Services B2B Data Interchange \
   service.\n"]

type nonrec conflict_exception = { message : error_message [@ocaml.doc ""] }
[@@ocaml.doc
  "A conflict exception is thrown when you attempt to delete a resource (such as a profile or a \
   capability) that is being used by other resources.\n"]

type nonrec access_denied_exception = { message : error_message [@ocaml.doc ""] }
[@@ocaml.doc "You do not have sufficient access to perform this action.\n"]

type nonrec profile_id = string [@@ocaml.doc ""]

type nonrec profile_name = string [@@ocaml.doc ""]

type nonrec email = string [@@ocaml.doc ""]

type nonrec phone = string [@@ocaml.doc ""]

type nonrec business_name = string [@@ocaml.doc ""]

type nonrec logging = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec log_group_name = string [@@ocaml.doc ""]

type nonrec update_profile_response = {
  modified_at : modified_date option;
      [@ocaml.doc "Returns a timestamp for last time the profile was modified.\n"]
  created_at : created_date;
      [@ocaml.doc "Returns a timestamp for creation date and time of the profile.\n"]
  log_group_name : log_group_name option; [@ocaml.doc "Returns the name of the logging group.\n"]
  logging : logging option;
      [@ocaml.doc "Specifies whether or not logging is enabled for this profile.\n"]
  business_name : business_name;
      [@ocaml.doc "Returns the name for the business associated with this profile.\n"]
  phone : phone; [@ocaml.doc "Returns the phone number associated with the profile.\n"]
  email : email option;
      [@ocaml.doc "Returns the email address associated with this customer profile.\n"]
  name : profile_name; [@ocaml.doc "Returns the name of the profile.\n"]
  profile_arn : resource_arn;
      [@ocaml.doc "Returns an Amazon Resource Name (ARN) for the profile.\n"]
  profile_id : profile_id;
      [@ocaml.doc "Returns the unique, system-generated identifier for the profile.\n"]
}
[@@ocaml.doc ""]

type nonrec update_profile_request = {
  business_name : business_name option;
      [@ocaml.doc "Specifies the name for the business associated with this profile.\n"]
  phone : phone option; [@ocaml.doc "Specifies the phone number associated with the profile.\n"]
  email : email option;
      [@ocaml.doc "Specifies the email address associated with this customer profile.\n"]
  name : profile_name option; [@ocaml.doc "The name of the profile, used to identify it.\n"]
  profile_id : profile_id;
      [@ocaml.doc "Specifies the unique, system-generated identifier for the profile.\n"]
}
[@@ocaml.doc ""]

type nonrec partnership_id = string [@@ocaml.doc ""]

type nonrec partner_name = string [@@ocaml.doc ""]

type nonrec capability_id = string [@@ocaml.doc ""]

type nonrec partnership_capabilities = capability_id list [@@ocaml.doc ""]

type nonrec outbound_edi_options =
  | X12 of x12_envelope [@ocaml.doc "A structure that contains an X12 envelope structure.\n"]
[@@ocaml.doc "A container for outbound EDI options.\n"]

type nonrec inbound_edi_options = {
  x12 : x12_inbound_edi_options option;
      [@ocaml.doc
        "A structure that contains X12-specific options for processing inbound X12 EDI files.\n"]
}
[@@ocaml.doc
  "Contains options for processing inbound EDI files. These options allow for customizing how \
   incoming EDI documents are processed.\n"]

type nonrec capability_options = {
  inbound_edi : inbound_edi_options option;
      [@ocaml.doc "A structure that contains the inbound EDI options for the capability.\n"]
  outbound_edi : outbound_edi_options option;
      [@ocaml.doc "A structure that contains the outbound EDI options.\n"]
}
[@@ocaml.doc "Contains the details for an Outbound EDI capability.\n"]

type nonrec trading_partner_id = string [@@ocaml.doc ""]

type nonrec update_partnership_response = {
  modified_at : modified_date option;
      [@ocaml.doc
        "Returns a timestamp that identifies the most recent date and time that the partnership \
         was modified.\n"]
  created_at : created_date;
      [@ocaml.doc
        "Returns a timestamp that identifies the most recent date and time that the partnership \
         was modified.\n"]
  trading_partner_id : trading_partner_id option;
      [@ocaml.doc "Returns the unique, system-generated identifier for a trading partner.\n"]
  capability_options : capability_options option;
      [@ocaml.doc
        "Returns the structure that contains the details for the associated capabilities.\n"]
  capabilities : partnership_capabilities option;
      [@ocaml.doc "Returns one or more capabilities associated with this partnership.\n"]
  phone : phone option; [@ocaml.doc "Returns the phone number associated with the partnership.\n"]
  email : email option;
      [@ocaml.doc "Returns the email address associated with this trading partner.\n"]
  name : partner_name option; [@ocaml.doc "The name of the partnership, used to identify it.\n"]
  partnership_arn : resource_arn;
      [@ocaml.doc
        "Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such \
         as a capability, partnership, profile, or transformer.\n"]
  partnership_id : partnership_id;
      [@ocaml.doc "Returns the unique, system-generated identifier for a partnership.\n"]
  profile_id : profile_id;
      [@ocaml.doc
        "Returns the unique, system-generated identifier for the profile connected to this \
         partnership.\n"]
}
[@@ocaml.doc ""]

type nonrec update_partnership_request = {
  capability_options : capability_options option;
      [@ocaml.doc
        "To update, specify the structure that contains the details for the associated capabilities.\n"]
  capabilities : partnership_capabilities option;
      [@ocaml.doc "List of the capabilities associated with this partnership.\n"]
  name : partner_name option; [@ocaml.doc "The name of the partnership, used to identify it.\n"]
  partnership_id : partnership_id;
      [@ocaml.doc "Specifies the unique, system-generated identifier for a partnership.\n"]
}
[@@ocaml.doc ""]

type nonrec capability_name = string [@@ocaml.doc ""]

type nonrec capability_type = EDI [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec capability_direction = OUTBOUND [@ocaml.doc ""] | INBOUND [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_location = {
  key : s3_key option; [@ocaml.doc "Specifies the Amazon S3 key for the file location.\n"]
  bucket_name : bucket_name option; [@ocaml.doc "Specifies the name of the Amazon S3 bucket.\n"]
}
[@@ocaml.doc
  "Specifies the details for the Amazon S3 file location that is being used with Amazon Web \
   Services B2B Data Interchange. File locations in Amazon S3 are identified using a combination \
   of the bucket and key.\n"]

type nonrec edi_configuration = {
  transformer_id : transformer_id;
      [@ocaml.doc "Returns the system-assigned unique identifier for the transformer.\n"]
  output_location : s3_location;
      [@ocaml.doc
        "Contains the Amazon S3 bucket and prefix for the location of the output file, which is \
         contained in an [S3Location] object.\n"]
  input_location : s3_location;
      [@ocaml.doc
        "Contains the Amazon S3 bucket and prefix for the location of the input file, which is \
         contained in an [S3Location] object.\n"]
  type_ : edi_type;
      [@ocaml.doc "Returns the type of the capability. Currently, only [edi] is supported.\n"]
  capability_direction : capability_direction option;
      [@ocaml.doc
        "Specifies whether this is capability is for inbound or outbound transformations.\n"]
}
[@@ocaml.doc "Specifies the details for the EDI (electronic data interchange) transformation.\n"]

type nonrec capability_configuration =
  | Edi of edi_configuration
      [@ocaml.doc "An EDI (electronic data interchange) configuration object.\n"]
[@@ocaml.doc
  "A capability object. Currently, only EDI (electronic data interchange) capabilities are \
   supported. A trading capability contains the information required to transform incoming EDI \
   documents into JSON or XML outputs.\n"]

type nonrec instructions_documents = s3_location list [@@ocaml.doc ""]

type nonrec update_capability_response = {
  modified_at : modified_date option;
      [@ocaml.doc "Returns a timestamp for last time the capability was modified.\n"]
  created_at : created_date;
      [@ocaml.doc "Returns a timestamp for creation date and time of the capability.\n"]
  instructions_documents : instructions_documents option;
      [@ocaml.doc
        "Returns one or more locations in Amazon S3, each specifying an EDI document that can be \
         used with this capability. Each item contains the name of the bucket and the key, to \
         identify the document's location.\n"]
  configuration : capability_configuration;
      [@ocaml.doc "Returns a structure that contains the details for a capability.\n"]
  type_ : capability_type;
      [@ocaml.doc "Returns the type of the capability. Currently, only [edi] is supported.\n"]
  name : capability_name; [@ocaml.doc "Returns the name of the capability, used to identify it.\n"]
  capability_arn : resource_arn;
      [@ocaml.doc
        "Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such \
         as a capability, partnership, profile, or transformer.\n"]
  capability_id : capability_id;
      [@ocaml.doc "Returns a system-assigned unique identifier for the capability.\n"]
}
[@@ocaml.doc ""]

type nonrec update_capability_request = {
  instructions_documents : instructions_documents option;
      [@ocaml.doc
        "Specifies one or more locations in Amazon S3, each specifying an EDI document that can be \
         used with this capability. Each item contains the name of the bucket and the key, to \
         identify the document's location.\n"]
  configuration : capability_configuration option;
      [@ocaml.doc "Specifies a structure that contains the details for a capability.\n"]
  name : capability_name option;
      [@ocaml.doc "Specifies a new name for the capability, to replace the existing name.\n"]
  capability_id : capability_id;
      [@ocaml.doc "Specifies a system-assigned unique identifier for the capability.\n"]
}
[@@ocaml.doc ""]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list;
      [@ocaml.doc
        "Specifies the key-value pairs assigned to ARNs that you can use to group and search for \
         resources by type. You can attach this metadata to resources (capabilities, partnerships, \
         and so on) for any purpose.\n"]
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "Specifies an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such \
         as a capability, partnership, profile, or transformer.\n"]
}
[@@ocaml.doc ""]

type nonrec transformer_summary = {
  sample_documents : sample_documents option;
      [@ocaml.doc
        "Returns a structure that contains the Amazon S3 bucket and an array of the corresponding \
         keys used to identify the location for your sample documents.\n"]
  output_conversion : output_conversion option;
      [@ocaml.doc
        "Returns the [OutputConversion] object, which contains the format options for the outbound \
         transformation.\n"]
  mapping : mapping option;
      [@ocaml.doc
        "Returns the structure that contains the mapping template and its language (either XSLT or \
         JSONATA).\n"]
  input_conversion : input_conversion option;
      [@ocaml.doc "Returns a structure that contains the format options for the transformation.\n"]
  sample_document : file_location option;
      [@ocaml.doc
        "Returns a sample EDI document that is used by a transformer as a guide for processing the \
         EDI data.\n"]
  edi_type : edi_type option;
      [@ocaml.doc
        "Returns the details for the EDI standard that is being used for the transformer. \
         Currently, only X12 is supported. X12 is a set of standards and corresponding messages \
         that define specific business documents.\n"]
  mapping_template : mapping_template option;
      [@ocaml.doc
        "Returns the mapping template for the transformer. This template is used to map the parsed \
         EDI file using JSONata or XSLT.\n"]
  file_format : file_format option;
      [@ocaml.doc
        "Returns that the currently supported file formats for EDI transformations are [JSON] and \
         [XML].\n"]
  modified_at : modified_date option;
      [@ocaml.doc
        "Returns a timestamp representing the date and time for the most recent change for the \
         transformer object.\n"]
  created_at : created_date;
      [@ocaml.doc
        "Returns a timestamp indicating when the transformer was created. For example, \
         [2023-07-20T19:58:44.624Z].\n"]
  status : transformer_status;
      [@ocaml.doc
        "Returns the state of the newly created transformer. The transformer can be either \
         [active] or [inactive]. For the transformer to be used in a capability, its status must \
         [active].\n"]
  name : transformer_name; [@ocaml.doc "Returns the descriptive name for the transformer.\n"]
  transformer_id : transformer_id;
      [@ocaml.doc "Returns the system-assigned unique identifier for the transformer.\n"]
}
[@@ocaml.doc
  "Contains the details for a transformer object. A transformer can take an EDI file as input and \
   transform it into a JSON-or XML-formatted document. Alternatively, a transformer can take a \
   JSON-or XML-formatted document as input and transform it into an EDI file.\n"]

type nonrec transformer_list = transformer_summary list [@@ocaml.doc ""]

type nonrec transformer_job_status =
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec transformer_job_id = string [@@ocaml.doc ""]

type nonrec transformer = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec parsed_split_file_contents_list = Smaws_Lib.Smithy_api.Types.string_ list
[@@ocaml.doc ""]

type nonrec test_parsing_response = {
  validation_messages : validation_messages option;
      [@ocaml.doc
        "Returns an array of validation messages generated during EDI validation. These messages \
         provide detailed information about validation errors, warnings, or confirmations based on \
         the configured X12 validation rules such as element length constraints, code list \
         validations, and element requirement checks. This field is populated when the \
         [TestParsing] API validates EDI documents.\n"]
  parsed_split_file_contents : parsed_split_file_contents_list option;
      [@ocaml.doc
        "Returns an array of parsed file contents when the input file is split according to the \
         specified split options. Each element in the array represents a separate split file's \
         parsed content.\n"]
  parsed_file_content : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "Returns the contents of the input file being tested, parsed according to the specified \
         EDI (electronic data interchange) type.\n"]
}
[@@ocaml.doc ""]

type nonrec test_parsing_request = {
  advanced_options : advanced_options option;
      [@ocaml.doc
        "Specifies advanced options for parsing the input EDI file. These options allow for more \
         granular control over the parsing process, including split options for X12 files.\n"]
  edi_type : edi_type;
      [@ocaml.doc
        "Specifies the details for the EDI standard that is being used for the transformer. \
         Currently, only X12 is supported. X12 is a set of standards and corresponding messages \
         that define specific business documents.\n"]
  file_format : file_format;
      [@ocaml.doc
        "Specifies that the currently supported file formats for EDI transformations are [JSON] \
         and [XML].\n"]
  input_file : s3_location;
      [@ocaml.doc
        "Specifies an [S3Location] object, which contains the Amazon S3 bucket and prefix for the \
         location of the input file.\n"]
}
[@@ocaml.doc ""]

type nonrec test_mapping_response = {
  mapped_file_content : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "Returns a string for the mapping that can be used to identify the mapping. Similar to a \
         fingerprint\n"]
}
[@@ocaml.doc ""]

type nonrec test_mapping_input_file_content = string [@@ocaml.doc ""]

type nonrec test_mapping_request = {
  file_format : file_format;
      [@ocaml.doc
        "Specifies that the currently supported file formats for EDI transformations are [JSON] \
         and [XML].\n"]
  mapping_template : mapping_template;
      [@ocaml.doc
        "Specifies the mapping template for the transformer. This template is used to map the \
         parsed EDI file using JSONata or XSLT.\n\n\
        \  This parameter is available for backwards compatibility. Use the \
         {{:https://docs.aws.amazon.com/b2bi/latest/APIReference/API_Mapping.html}Mapping} data \
         type instead.\n\
        \  \n\
        \   "]
  input_file_content : test_mapping_input_file_content;
      [@ocaml.doc
        "Specify the contents of the EDI (electronic data interchange) XML or JSON file that is \
         used as input for the transform.\n"]
}
[@@ocaml.doc ""]

type nonrec test_conversion_response = {
  validation_messages : validation_messages option;
      [@ocaml.doc
        "Returns an array of validation messages that Amazon Web Services B2B Data Interchange \
         generates during the conversion process. These messages include both standard EDI \
         validation results and custom validation messages when custom validation rules are \
         configured. Custom validation messages provide detailed feedback on element length \
         constraints, code list validations, and element requirement checks applied during the \
         outbound EDI generation process.\n"]
  converted_file_content : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Returns the converted file content.\n"]
}
[@@ocaml.doc ""]

type nonrec conversion_source_format = XML [@ocaml.doc ""] | JSON [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec input_file_source =
  | FileContent of Smaws_Lib.Smithy_api.Types.string_
      [@ocaml.doc
        "Specify the input contents, as a string, for the source of an outbound transformation.\n"]
[@@ocaml.doc "The input file to use for an outbound transformation.\n"]

type nonrec conversion_source = {
  input_file : input_file_source; [@ocaml.doc "File to be converted"]
  file_format : conversion_source_format;
      [@ocaml.doc "The format for the input file: either JSON or XML.\n"]
}
[@@ocaml.doc "Describes the input for an outbound transformation. \n"]

type nonrec conversion_target_format = X12 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec conversion_target_format_details = X12 of x12_details [@ocaml.doc ""]
[@@ocaml.doc "Contains a structure describing the X12 details for the conversion target.\n"]

type nonrec output_sample_file_source = FileLocation of s3_location [@ocaml.doc ""]
[@@ocaml.doc "Container for the location of a sample file used for outbound transformations.\n"]

type nonrec conversion_target = {
  advanced_options : advanced_options option; [@ocaml.doc ""]
  output_sample_file : output_sample_file_source option;
      [@ocaml.doc
        "Customer uses this to provide a sample on what should file look like after conversion X12 \
         EDI use case around this would be discovering the file syntax"]
  format_details : conversion_target_format_details option;
      [@ocaml.doc "A structure that contains the formatting details for the conversion target.\n"]
  file_format : conversion_target_format; [@ocaml.doc "Currently, only X12 format is supported.\n"]
}
[@@ocaml.doc "Provide a sample of what the output of the transformation should look like.\n"]

type nonrec test_conversion_request = {
  target : conversion_target;
      [@ocaml.doc
        "Specify the format (X12 is the only currently supported format), and other details for \
         the conversion target.\n"]
  source : conversion_source; [@ocaml.doc "Specify the source file for an outbound EDI request.\n"]
}
[@@ocaml.doc ""]

type nonrec template_details = X12 of x12_details [@ocaml.doc ""]
[@@ocaml.doc
  "A data structure that contains the information to use when generating a mapping template.\n"]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value;
      [@ocaml.doc
        "Contains one or more values that you assigned to the key name that you create.\n"]
  key : tag_key; [@ocaml.doc "Specifies the name assigned to the tag that you create.\n"]
}
[@@ocaml.doc
  "Creates a key-value pair for a specific resource. Tags are metadata that you can use to search \
   for and group a resource for various purposes. You can apply tags to capabilities, \
   partnerships, profiles and transformers. A tag key can take more than one value. For example, \
   to group capabilities for accounting purposes, you might create a tag called [Group] and assign \
   the values [Research] and [Accounting] to that group.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tag_list;
      [@ocaml.doc
        "Specifies the key-value pairs assigned to ARNs that you can use to group and search for \
         resources by type. You can attach this metadata to resources (capabilities, partnerships, \
         and so on) for any purpose.\n"]
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "Specifies an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such \
         as a capability, partnership, profile, or transformer.\n"]
}
[@@ocaml.doc ""]

type nonrec start_transformer_job_response = {
  transformer_job_id : transformer_job_id;
      [@ocaml.doc "Returns the unique, system-generated identifier for a transformer run.\n"]
}
[@@ocaml.doc ""]

type nonrec start_transformer_job_request = {
  client_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Reserved for future use.\n"]
  transformer_id : transformer_id;
      [@ocaml.doc "Specifies the system-assigned unique identifier for the transformer.\n"]
  output_location : s3_location;
      [@ocaml.doc
        "Specifies the location of the output file for the transformation. The location consists \
         of an Amazon S3 bucket and prefix.\n"]
  input_file : s3_location;
      [@ocaml.doc
        "Specifies the location of the input file for the transformation. The location consists of \
         an Amazon S3 bucket and prefix.\n"]
}
[@@ocaml.doc ""]

type nonrec s3_location_list = s3_location list [@@ocaml.doc ""]

type nonrec profile_summary = {
  modified_at : modified_date option;
      [@ocaml.doc
        "Returns the timestamp that identifies the most recent date and time that the profile was \
         modified.\n"]
  created_at : created_date;
      [@ocaml.doc "Returns the timestamp for creation date and time of the profile.\n"]
  log_group_name : log_group_name option; [@ocaml.doc "Returns the name of the logging group.\n"]
  logging : logging option;
      [@ocaml.doc "Specifies whether or not logging is enabled for this profile.\n"]
  business_name : business_name;
      [@ocaml.doc "Returns the name for the business associated with this profile.\n"]
  name : profile_name; [@ocaml.doc "Returns the display name for profile.\n"]
  profile_id : profile_id;
      [@ocaml.doc "Returns the unique, system-generated identifier for the profile.\n"]
}
[@@ocaml.doc
  "Contains the details for a profile. A profile is the mechanism used to create the concept of a \
   private network.\n"]

type nonrec profile_list = profile_summary list [@@ocaml.doc ""]

type nonrec profile = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec partnership_summary = {
  modified_at : modified_date option;
      [@ocaml.doc
        "Returns a timestamp that identifies the most recent date and time that the partnership \
         was modified.\n"]
  created_at : created_date;
      [@ocaml.doc "Returns a timestamp for creation date and time of the partnership.\n"]
  trading_partner_id : trading_partner_id option;
      [@ocaml.doc "Returns the unique, system-generated identifier for a trading partner.\n"]
  capability_options : capability_options option; [@ocaml.doc ""]
  capabilities : partnership_capabilities option;
      [@ocaml.doc "Returns one or more capabilities associated with this partnership.\n"]
  name : partner_name option; [@ocaml.doc "Returns the name of the partnership.\n"]
  partnership_id : partnership_id;
      [@ocaml.doc "Returns the unique, system-generated identifier for a partnership.\n"]
  profile_id : profile_id;
      [@ocaml.doc
        "Returns the unique, system-generated identifier for the profile connected to this \
         partnership.\n"]
}
[@@ocaml.doc
  "A structure that contains the details for a partnership. A partnership represents the \
   connection between you and your trading partner. It ties together a profile and one or more \
   trading capabilities.\n"]

type nonrec partnership_list = partnership_summary list [@@ocaml.doc ""]

type nonrec partnership = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec page_token = string [@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec mapping_type = XSLT [@ocaml.doc ""] | JSONATA [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec list_transformers_response = {
  next_token : page_token option;
      [@ocaml.doc
        "When additional results are obtained from the command, a [NextToken] parameter is \
         returned in the output. You can then pass the [NextToken] parameter in a subsequent \
         command to continue listing additional resources.\n"]
  transformers : transformer_list;
      [@ocaml.doc
        "Returns an array of one or more transformer objects.\n\n\
        \ For each transformer, a [TransformerSummary] object is returned. The \
         [TransformerSummary] contains all the details for a specific transformer.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_transformers_request = {
  max_results : max_results option;
      [@ocaml.doc "Specifies the number of items to return for the API response.\n"]
  next_token : page_token option;
      [@ocaml.doc
        "When additional results are obtained from the command, a [NextToken] parameter is \
         returned in the output. You can then pass the [NextToken] parameter in a subsequent \
         command to continue listing additional resources.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option;
      [@ocaml.doc
        "Returns the key-value pairs assigned to ARNs that you can use to group and search for \
         resources by type. You can attach this metadata to resources (capabilities, partnerships, \
         and so on) for any purpose.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "Requests the tags associated with a particular Amazon Resource Name (ARN). An ARN is an \
         identifier for a specific Amazon Web Services resource, such as a capability, \
         partnership, profile, or transformer.\n"]
}
[@@ocaml.doc ""]

type nonrec list_profiles_response = {
  next_token : page_token option;
      [@ocaml.doc
        "When additional results are obtained from the command, a [NextToken] parameter is \
         returned in the output. You can then pass the [NextToken] parameter in a subsequent \
         command to continue listing additional resources.\n"]
  profiles : profile_list; [@ocaml.doc "Returns an array of [ProfileSummary] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec list_profiles_request = {
  max_results : max_results option;
      [@ocaml.doc "Specifies the maximum number of profiles to return.\n"]
  next_token : page_token option;
      [@ocaml.doc
        "When additional results are obtained from the command, a [NextToken] parameter is \
         returned in the output. You can then pass the [NextToken] parameter in a subsequent \
         command to continue listing additional resources.\n"]
}
[@@ocaml.doc ""]

type nonrec list_partnerships_response = {
  next_token : page_token option;
      [@ocaml.doc
        "When additional results are obtained from the command, a [NextToken] parameter is \
         returned in the output. You can then pass the [NextToken] parameter in a subsequent \
         command to continue listing additional resources.\n"]
  partnerships : partnership_list; [@ocaml.doc "Specifies a list of your partnerships.\n"]
}
[@@ocaml.doc ""]

type nonrec list_partnerships_request = {
  max_results : max_results option;
      [@ocaml.doc "Specifies the maximum number of capabilities to return.\n"]
  next_token : page_token option;
      [@ocaml.doc
        "When additional results are obtained from the command, a [NextToken] parameter is \
         returned in the output. You can then pass the [NextToken] parameter in a subsequent \
         command to continue listing additional resources.\n"]
  profile_id : profile_id option;
      [@ocaml.doc
        "Specifies the unique, system-generated identifier for the profile connected to this \
         partnership.\n"]
}
[@@ocaml.doc ""]

type nonrec capability_summary = {
  modified_at : modified_date option;
      [@ocaml.doc
        "Returns a timestamp that identifies the most recent date and time that the capability was \
         modified.\n"]
  created_at : created_date;
      [@ocaml.doc "Returns a timestamp for creation date and time of the capability.\n"]
  type_ : capability_type;
      [@ocaml.doc "Returns the type of the capability. Currently, only [edi] is supported.\n"]
  name : capability_name; [@ocaml.doc "The display name of the capability.\n"]
  capability_id : capability_id;
      [@ocaml.doc "Returns a system-assigned unique identifier for the capability.\n"]
}
[@@ocaml.doc
  "Returns the capability summary details. A trading capability contains the information required \
   to transform incoming EDI documents into JSON or XML outputs.\n"]

type nonrec capability_list = capability_summary list [@@ocaml.doc ""]

type nonrec list_capabilities_response = {
  next_token : page_token option;
      [@ocaml.doc
        "When additional results are obtained from the command, a [NextToken] parameter is \
         returned in the output. You can then pass the [NextToken] parameter in a subsequent \
         command to continue listing additional resources.\n"]
  capabilities : capability_list;
      [@ocaml.doc "Returns one or more capabilities associated with this partnership.\n"]
}
[@@ocaml.doc ""]

type nonrec list_capabilities_request = {
  max_results : max_results option;
      [@ocaml.doc "Specifies the maximum number of capabilities to return.\n"]
  next_token : page_token option;
      [@ocaml.doc
        "When additional results are obtained from the command, a [NextToken] parameter is \
         returned in the output. You can then pass the [NextToken] parameter in a subsequent \
         command to continue listing additional resources.\n"]
}
[@@ocaml.doc ""]

type nonrec get_transformer_response = {
  sample_documents : sample_documents option;
      [@ocaml.doc
        "Returns a structure that contains the Amazon S3 bucket and an array of the corresponding \
         keys used to identify the location for your sample documents.\n"]
  output_conversion : output_conversion option;
      [@ocaml.doc
        "Returns the [OutputConversion] object, which contains the format options for the outbound \
         transformation.\n"]
  mapping : mapping option;
      [@ocaml.doc
        "Returns the structure that contains the mapping template and its language (either XSLT or \
         JSONATA).\n"]
  input_conversion : input_conversion option;
      [@ocaml.doc
        "Returns the [InputConversion] object, which contains the format options for the inbound \
         transformation.\n"]
  sample_document : file_location option;
      [@ocaml.doc
        "Returns a sample EDI document that is used by a transformer as a guide for processing the \
         EDI data.\n"]
  edi_type : edi_type option;
      [@ocaml.doc
        "Returns the details for the EDI standard that is being used for the transformer. \
         Currently, only X12 is supported. X12 is a set of standards and corresponding messages \
         that define specific business documents.\n"]
  mapping_template : mapping_template option;
      [@ocaml.doc
        "Returns the mapping template for the transformer. This template is used to map the parsed \
         EDI file using JSONata or XSLT.\n"]
  file_format : file_format option;
      [@ocaml.doc
        "Returns that the currently supported file formats for EDI transformations are [JSON] and \
         [XML].\n"]
  modified_at : modified_date option;
      [@ocaml.doc "Returns a timestamp for last time the transformer was modified.\n"]
  created_at : created_date;
      [@ocaml.doc "Returns a timestamp for creation date and time of the transformer.\n"]
  status : transformer_status;
      [@ocaml.doc
        "Returns the state of the newly created transformer. The transformer can be either \
         [active] or [inactive]. For the transformer to be used in a capability, its status must \
         [active].\n"]
  name : transformer_name;
      [@ocaml.doc "Returns the name of the transformer, used to identify it.\n"]
  transformer_arn : resource_arn;
      [@ocaml.doc
        "Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such \
         as a capability, partnership, profile, or transformer.\n"]
  transformer_id : transformer_id;
      [@ocaml.doc "Returns the system-assigned unique identifier for the transformer.\n"]
}
[@@ocaml.doc ""]

type nonrec get_transformer_request = {
  transformer_id : transformer_id;
      [@ocaml.doc "Specifies the system-assigned unique identifier for the transformer.\n"]
}
[@@ocaml.doc ""]

type nonrec get_transformer_job_response = {
  message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Returns an optional error message, which gets populated when the job is not run \
         successfully.\n"]
  output_files : s3_location_list option;
      [@ocaml.doc
        "Returns the location for the output files. If the caller specified a directory for the \
         output, then this contains the full path to the output file, including the file name \
         generated by the service.\n"]
  status : transformer_job_status;
      [@ocaml.doc
        "Returns the current state of the transformer job, either [running], [succeeded], or \
         [failed].\n"]
}
[@@ocaml.doc ""]

type nonrec get_transformer_job_request = {
  transformer_id : transformer_id;
      [@ocaml.doc "Specifies the system-assigned unique identifier for the transformer.\n"]
  transformer_job_id : transformer_job_id;
      [@ocaml.doc "Specifies the unique, system-generated identifier for a transformer run.\n"]
}
[@@ocaml.doc ""]

type nonrec get_profile_response = {
  modified_at : modified_date option;
      [@ocaml.doc "Returns a timestamp for last time the profile was modified.\n"]
  created_at : created_date;
      [@ocaml.doc "Returns a timestamp for creation date and time of the transformer.\n"]
  log_group_name : log_group_name option; [@ocaml.doc "Returns the name of the logging group.\n"]
  logging : logging option;
      [@ocaml.doc "Returns whether or not logging is enabled for this profile.\n"]
  business_name : business_name;
      [@ocaml.doc "Returns the name for the business associated with this profile.\n"]
  phone : phone; [@ocaml.doc "Returns the phone number associated with the profile.\n"]
  email : email option;
      [@ocaml.doc "Returns the email address associated with this customer profile.\n"]
  name : profile_name; [@ocaml.doc "Returns the name of the profile, used to identify it.\n"]
  profile_arn : resource_arn;
      [@ocaml.doc
        "Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such \
         as a capability, partnership, profile, or transformer.\n"]
  profile_id : profile_id;
      [@ocaml.doc "Returns the unique, system-generated identifier for the profile.\n"]
}
[@@ocaml.doc ""]

type nonrec get_profile_request = {
  profile_id : profile_id;
      [@ocaml.doc "Specifies the unique, system-generated identifier for the profile.\n"]
}
[@@ocaml.doc ""]

type nonrec get_partnership_response = {
  modified_at : modified_date option;
      [@ocaml.doc
        "Returns a timestamp that identifies the most recent date and time that the partnership \
         was modified.\n"]
  created_at : created_date;
      [@ocaml.doc "Returns a timestamp for creation date and time of the partnership.\n"]
  trading_partner_id : trading_partner_id option;
      [@ocaml.doc "Returns the unique identifier for the partner for this partnership.\n"]
  capability_options : capability_options option; [@ocaml.doc ""]
  capabilities : partnership_capabilities option;
      [@ocaml.doc "Returns one or more capabilities associated with this partnership.\n"]
  phone : phone option; [@ocaml.doc "Returns the phone number associated with the partnership.\n"]
  email : email option;
      [@ocaml.doc "Returns the email address associated with this trading partner.\n"]
  name : partner_name option; [@ocaml.doc "Returns the display name of the partnership\n"]
  partnership_arn : resource_arn;
      [@ocaml.doc
        "Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such \
         as a capability, partnership, profile, or transformer.\n"]
  partnership_id : partnership_id;
      [@ocaml.doc "Returns the unique, system-generated identifier for a partnership.\n"]
  profile_id : profile_id;
      [@ocaml.doc
        "Returns the unique, system-generated identifier for the profile connected to this \
         partnership.\n"]
}
[@@ocaml.doc ""]

type nonrec get_partnership_request = {
  partnership_id : partnership_id;
      [@ocaml.doc "Specifies the unique, system-generated identifier for a partnership.\n"]
}
[@@ocaml.doc ""]

type nonrec get_capability_response = {
  modified_at : modified_date option;
      [@ocaml.doc "Returns a timestamp for last time the capability was modified.\n"]
  created_at : created_date;
      [@ocaml.doc "Returns a timestamp for creation date and time of the capability.\n"]
  instructions_documents : instructions_documents option;
      [@ocaml.doc
        "Returns one or more locations in Amazon S3, each specifying an EDI document that can be \
         used with this capability. Each item contains the name of the bucket and the key, to \
         identify the document's location.\n"]
  configuration : capability_configuration;
      [@ocaml.doc "Returns a structure that contains the details for a capability.\n"]
  type_ : capability_type;
      [@ocaml.doc "Returns the type of the capability. Currently, only [edi] is supported.\n"]
  name : capability_name; [@ocaml.doc "Returns the name of the capability, used to identify it.\n"]
  capability_arn : resource_arn;
      [@ocaml.doc
        "Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such \
         as a capability, partnership, profile, or transformer.\n"]
  capability_id : capability_id;
      [@ocaml.doc "Returns a system-assigned unique identifier for the capability.\n"]
}
[@@ocaml.doc ""]

type nonrec get_capability_request = {
  capability_id : capability_id;
      [@ocaml.doc "Specifies a system-assigned unique identifier for the capability.\n"]
}
[@@ocaml.doc ""]

type nonrec generate_mapping_response = {
  mapping_accuracy : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc "Returns a percentage that estimates the accuracy of the generated mapping.\n"]
  mapping_template : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Returns a mapping template based on your inputs.\n"]
}
[@@ocaml.doc ""]

type nonrec generate_mapping_input_file_content = string [@@ocaml.doc ""]

type nonrec generate_mapping_output_file_content = string [@@ocaml.doc ""]

type nonrec generate_mapping_request = {
  mapping_type : mapping_type;
      [@ocaml.doc "Specify the mapping type: either [JSONATA] or [XSLT.] \n"]
  output_file_content : generate_mapping_output_file_content;
      [@ocaml.doc
        "Provide the contents of a sample X12 EDI file, either in JSON or XML format, to use as a \
         target for the mapping.\n"]
  input_file_content : generate_mapping_input_file_content;
      [@ocaml.doc
        "Provide the contents of a sample X12 EDI file, either in JSON or XML format, to use as a \
         starting point for the mapping.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_transformer_request = {
  transformer_id : transformer_id;
      [@ocaml.doc "Specifies the system-assigned unique identifier for the transformer.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_profile_request = {
  profile_id : profile_id;
      [@ocaml.doc "Specifies the unique, system-generated identifier for the profile.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_partnership_request = {
  partnership_id : partnership_id;
      [@ocaml.doc "Specifies the unique, system-generated identifier for a partnership.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_capability_request = {
  capability_id : capability_id;
      [@ocaml.doc "Specifies a system-assigned unique identifier for the capability.\n"]
}
[@@ocaml.doc ""]

type nonrec create_transformer_response = {
  sample_documents : sample_documents option;
      [@ocaml.doc
        "Returns a structure that contains the Amazon S3 bucket and an array of the corresponding \
         keys used to identify the location for your sample documents.\n"]
  output_conversion : output_conversion option;
      [@ocaml.doc
        "Returns the [OutputConversion] object, which contains the format options for the outbound \
         transformation.\n"]
  mapping : mapping option;
      [@ocaml.doc
        "Returns the structure that contains the mapping template and its language (either XSLT or \
         JSONATA).\n"]
  input_conversion : input_conversion option;
      [@ocaml.doc
        "Returns the [InputConversion] object, which contains the format options for the inbound \
         transformation.\n"]
  sample_document : file_location option;
      [@ocaml.doc
        "Returns a sample EDI document that is used by a transformer as a guide for processing the \
         EDI data.\n"]
  edi_type : edi_type option;
      [@ocaml.doc
        "Returns the details for the EDI standard that is being used for the transformer. \
         Currently, only X12 is supported. X12 is a set of standards and corresponding messages \
         that define specific business documents.\n"]
  mapping_template : mapping_template option;
      [@ocaml.doc
        "Returns the mapping template for the transformer. This template is used to map the parsed \
         EDI file using JSONata or XSLT.\n"]
  file_format : file_format option;
      [@ocaml.doc
        "Returns that the currently supported file formats for EDI transformations are [JSON] and \
         [XML].\n"]
  created_at : created_date;
      [@ocaml.doc "Returns a timestamp for creation date and time of the transformer.\n"]
  status : transformer_status;
      [@ocaml.doc
        "Returns the state of the newly created transformer. The transformer can be either \
         [active] or [inactive]. For the transformer to be used in a capability, its status must \
         [active].\n"]
  name : transformer_name;
      [@ocaml.doc "Returns the name of the transformer, used to identify it.\n"]
  transformer_arn : resource_arn;
      [@ocaml.doc
        "Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such \
         as a capability, partnership, profile, or transformer.\n"]
  transformer_id : transformer_id;
      [@ocaml.doc "Returns the system-assigned unique identifier for the transformer.\n"]
}
[@@ocaml.doc ""]

type nonrec create_transformer_request = {
  sample_documents : sample_documents option;
      [@ocaml.doc
        "Specify a structure that contains the Amazon S3 bucket and an array of the corresponding \
         keys used to identify the location for your sample documents.\n"]
  output_conversion : output_conversion option;
      [@ocaml.doc
        "A structure that contains the [OutputConversion] object, which contains the format \
         options for the outbound transformation.\n"]
  mapping : mapping option;
      [@ocaml.doc
        "Specify the structure that contains the mapping template and its language (either XSLT or \
         JSONATA).\n"]
  input_conversion : input_conversion option;
      [@ocaml.doc
        "Specify the [InputConversion] object, which contains the format options for the inbound \
         transformation.\n"]
  sample_document : file_location option;
      [@ocaml.doc
        "Specifies a sample EDI document that is used by a transformer as a guide for processing \
         the EDI data.\n"]
  edi_type : edi_type option;
      [@ocaml.doc
        "Specifies the details for the EDI standard that is being used for the transformer. \
         Currently, only X12 is supported. X12 is a set of standards and corresponding messages \
         that define specific business documents.\n"]
  mapping_template : mapping_template option;
      [@ocaml.doc
        "Specifies the mapping template for the transformer. This template is used to map the \
         parsed EDI file using JSONata or XSLT.\n\n\
        \  This parameter is available for backwards compatibility. Use the \
         {{:https://docs.aws.amazon.com/b2bi/latest/APIReference/API_Mapping.html}Mapping} data \
         type instead.\n\
        \  \n\
        \   "]
  file_format : file_format option;
      [@ocaml.doc
        "Specifies that the currently supported file formats for EDI transformations are [JSON] \
         and [XML].\n"]
  tags : tag_list option;
      [@ocaml.doc
        "Specifies the key-value pairs assigned to ARNs that you can use to group and search for \
         resources by type. You can attach this metadata to resources (capabilities, partnerships, \
         and so on) for any purpose.\n"]
  client_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Reserved for future use.\n"]
  name : transformer_name;
      [@ocaml.doc "Specifies the name of the transformer, used to identify it.\n"]
}
[@@ocaml.doc ""]

type nonrec create_starter_mapping_template_response = {
  mapping_template : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "Returns a string that represents the mapping template.\n"]
}
[@@ocaml.doc ""]

type nonrec create_starter_mapping_template_request = {
  template_details : template_details;
      [@ocaml.doc
        " Describes the details needed for generating the template. Specify the X12 transaction \
         set and version for which the template is used: currently, we only support X12. \n"]
  mapping_type : mapping_type;
      [@ocaml.doc "Specify the format for the mapping template: either JSONATA or XSLT.\n"]
  output_sample_location : s3_location option;
      [@ocaml.doc
        "Specify the location of the sample EDI file that is used to generate the mapping template.\n"]
}
[@@ocaml.doc ""]

type nonrec create_profile_response = {
  created_at : created_date;
      [@ocaml.doc "Returns a timestamp representing the time the profile was created.\n"]
  log_group_name : log_group_name option; [@ocaml.doc "Returns the name of the logging group.\n"]
  logging : logging option;
      [@ocaml.doc "Returns whether or not logging is turned on for this profile.\n"]
  email : email option;
      [@ocaml.doc "Returns the email address associated with this customer profile.\n"]
  phone : phone; [@ocaml.doc "Returns the phone number associated with the profile.\n"]
  business_name : business_name;
      [@ocaml.doc "Returns the name for the business associated with this profile.\n"]
  name : profile_name; [@ocaml.doc "Returns the name of the profile, used to identify it.\n"]
  profile_arn : resource_arn;
      [@ocaml.doc "Returns an Amazon Resource Name (ARN) for the profile.\n"]
  profile_id : profile_id;
      [@ocaml.doc "Returns the unique, system-generated identifier for the profile.\n"]
}
[@@ocaml.doc ""]

type nonrec create_profile_request = {
  tags : tag_list option;
      [@ocaml.doc
        "Specifies the key-value pairs assigned to ARNs that you can use to group and search for \
         resources by type. You can attach this metadata to resources (capabilities, partnerships, \
         and so on) for any purpose.\n"]
  client_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Reserved for future use.\n"]
  logging : logging; [@ocaml.doc "Specifies whether or not logging is enabled for this profile.\n"]
  business_name : business_name;
      [@ocaml.doc "Specifies the name for the business associated with this profile.\n"]
  phone : phone; [@ocaml.doc "Specifies the phone number associated with the profile.\n"]
  email : email option;
      [@ocaml.doc "Specifies the email address associated with this customer profile.\n"]
  name : profile_name; [@ocaml.doc "Specifies the name of the profile.\n"]
}
[@@ocaml.doc ""]

type nonrec create_partnership_response = {
  created_at : created_date;
      [@ocaml.doc "Returns a timestamp for creation date and time of the partnership.\n"]
  trading_partner_id : trading_partner_id option;
      [@ocaml.doc "Returns the unique, system-generated identifier for a trading partner.\n"]
  capability_options : capability_options option;
      [@ocaml.doc
        "Returns the structure that contains the details for the associated capabilities.\n"]
  capabilities : partnership_capabilities option;
      [@ocaml.doc "Returns one or more capabilities associated with this partnership.\n"]
  phone : phone option; [@ocaml.doc "Returns the phone number associated with the partnership.\n"]
  email : email option;
      [@ocaml.doc "Returns the email address associated with this trading partner.\n"]
  name : partner_name option; [@ocaml.doc "Returns a descriptive name for the partnership.\n"]
  partnership_arn : resource_arn;
      [@ocaml.doc
        "Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such \
         as a capability, partnership, profile, or transformer.\n"]
  partnership_id : partnership_id;
      [@ocaml.doc "Returns the unique, system-generated identifier for a partnership.\n"]
  profile_id : profile_id;
      [@ocaml.doc
        "Returns the unique, system-generated identifier for the profile connected to this \
         partnership.\n"]
}
[@@ocaml.doc ""]

type nonrec create_partnership_request = {
  tags : tag_list option;
      [@ocaml.doc
        "Specifies the key-value pairs assigned to ARNs that you can use to group and search for \
         resources by type. You can attach this metadata to resources (capabilities, partnerships, \
         and so on) for any purpose.\n"]
  client_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Reserved for future use.\n"]
  capability_options : capability_options option;
      [@ocaml.doc
        "Specify the structure that contains the details for the associated capabilities.\n"]
  capabilities : partnership_capabilities;
      [@ocaml.doc "Specifies a list of the capabilities associated with this partnership.\n"]
  phone : phone option; [@ocaml.doc "Specifies the phone number associated with the partnership.\n"]
  email : email; [@ocaml.doc "Specifies the email address associated with this trading partner.\n"]
  name : partner_name; [@ocaml.doc "Specifies a descriptive name for the partnership.\n"]
  profile_id : profile_id;
      [@ocaml.doc
        "Specifies the unique, system-generated identifier for the profile connected to this \
         partnership.\n"]
}
[@@ocaml.doc ""]

type nonrec create_capability_response = {
  created_at : created_date;
      [@ocaml.doc "Returns a timestamp for creation date and time of the capability.\n"]
  instructions_documents : instructions_documents option;
      [@ocaml.doc
        "Returns one or more locations in Amazon S3, each specifying an EDI document that can be \
         used with this capability. Each item contains the name of the bucket and the key, to \
         identify the document's location.\n"]
  configuration : capability_configuration;
      [@ocaml.doc "Returns a structure that contains the details for a capability.\n"]
  type_ : capability_type;
      [@ocaml.doc "Returns the type of the capability. Currently, only [edi] is supported.\n"]
  name : capability_name; [@ocaml.doc "Returns the name of the capability used to identify it.\n"]
  capability_arn : resource_arn;
      [@ocaml.doc
        "Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such \
         as a capability, partnership, profile, or transformer.\n"]
  capability_id : capability_id;
      [@ocaml.doc "Returns a system-assigned unique identifier for the capability.\n"]
}
[@@ocaml.doc ""]

type nonrec create_capability_request = {
  tags : tag_list option;
      [@ocaml.doc
        "Specifies the key-value pairs assigned to ARNs that you can use to group and search for \
         resources by type. You can attach this metadata to resources (capabilities, partnerships, \
         and so on) for any purpose.\n"]
  client_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Reserved for future use.\n"]
  instructions_documents : instructions_documents option;
      [@ocaml.doc
        "Specifies one or more locations in Amazon S3, each specifying an EDI document that can be \
         used with this capability. Each item contains the name of the bucket and the key, to \
         identify the document's location.\n"]
  configuration : capability_configuration;
      [@ocaml.doc "Specifies a structure that contains the details for a capability.\n"]
  type_ : capability_type;
      [@ocaml.doc "Specifies the type of the capability. Currently, only [edi] is supported.\n"]
  name : capability_name; [@ocaml.doc "Specifies the name of the capability, used to identify it.\n"]
}
[@@ocaml.doc ""]

type nonrec capability = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]
