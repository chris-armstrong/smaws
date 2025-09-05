#!/bin/sh

for dir in *
do
	if [ -d "${dir}" ] # && [ ! -f "${dir}/dune" ]
	then
		service_short_name=$(basename $dir)
		# service_long_name=$(grep "cloudFormationName" ../awssdkjsv3/codegen/sdk-codegen/aws-models/${service_short_name}.json | sed -E -e 's/.*"cloudFormationName": "(.*)".*/\1/')
		model_file=$(ls ../api-models-aws/models/${service_short_name}/service/*/*.json)
		service_long_name=$(grep "sdkId" "$model_file" | sed -E -e 's/.*"sdkId": "(.*)".*/\1/' -e 's/ //g')
		if [ -z "${service_long_name}" ]; then
			echo "Unable to generate for $service_short_name!"
			exit 1
		fi
		echo "Generating "${dir}/dune" for \"$service_short_name\" \"$service_long_name\""
		cat service-dune-template | sed \
			-e "s/%%service-short-name%%/${service_short_name}/g"  \
			-e "s/%%service-full-name%%/${service_long_name}/g"  \
			-e "s!%%model-file%%!../${model_file}!g"  \
			> "${dir}/dune"
	fi
done
