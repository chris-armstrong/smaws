#!/bin/sh

# Generate a `dune` file for every service directory that lacks one (or all, when
# FORCE=1). The serializer/deserializer module names depend on the service's
# wire protocol: AwsQuery services use `query_serializers`/`query_deserializers`
# while AwsJson services use `json_serializers`/`json_deserializers`, so the
# service shape's protocol trait is inspected rather than grepping the whole
# file (which would be fooled by test shapes and the `awsQueryCompatible` trait).

for dir in *
do
	if [ -d "${dir}" ] && { [ ! -f "${dir}/dune" ] || [ -n "${FORCE}" ]; }
	then
		service_short_name=$(basename $dir)
		model_file=$(ls ../api-models-aws/models/${service_short_name}/service/*/*.json)
		# Extract the service shape's sdkId and protocol trait in one pass.
		eval "$(python3 - "$model_file" <<'PY'
import json, sys
m = json.load(open(sys.argv[1]))
for sid, shape in m.get("shapes", {}).items():
    if shape.get("type") == "service":
        svc = shape.get("traits", {}).get("aws.api#service", {})
        sdkid = (svc or {}).get("sdkId", "")
        protos = [k for k in shape.get("traits", {}) if k.startswith("aws.protocols#")]
        # The parser's parseRecord prepends to its accumulator, so the trait list
        # ends up in REVERSE document order, and SmithyHelpers.protocol_of_traits'
        # List.find_map returns the first supported protocol trait it sees. Mirror
        # that here so the dune file names match what the generator emits.
        proto = None
        for p in reversed(protos):
            if p == "aws.protocols#awsQuery":
                proto = "Query"; break
            if p in ("aws.protocols#awsJson1_0", "aws.protocols#awsJson1_1"):
                proto = "Json"; break
            if p in ("aws.protocols#restJson1", "aws.protocols#restXml",
                     "aws.protocols#ec2Query"):
                raise SystemExit(f"unsupported protocol {p}")
        if proto is None:
            proto = "Json"
        # ocamlformat-safe: only alnum
        print(f"service_long_name={sdkid!r}")
        print(f"protocol={proto}")
        break
PY
)"
		# match AwsGenerator.ml, which applies Base.String.capitalize to the sdkId
		service_long_name=$(printf '%s' "${service_long_name}" | tr -d ' ' | awk '{ print toupper(substr($0,1,1)) substr($0,2) }')
		if [ -z "${service_long_name}" ]; then
			echo "Unable to generate for $service_short_name!"
			exit 1
		fi
		if [ "${protocol}" = "Query" ]; then
			ser=query_serializers
			deser=query_deserializers
		else
			ser=json_serializers
			deser=json_deserializers
		fi
		echo "Generating \"${dir}/dune\" for \"$service_short_name\" \"$service_long_name\" (${protocol})"
		cat service-dune-template | sed \
			-e "s/%%service-short-name%%/${service_short_name}/g"  \
			-e "s/%%service-full-name%%/${service_long_name}/g"  \
			-e "s!%%model-file%%!../${model_file}!g"  \
			-e "s/%%serializer-module%%/${ser}/g"  \
			-e "s/%%deserializer-module%%/${deser}/g"  \
			> "${dir}/dune"
	fi
done