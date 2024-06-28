
generate-python-sdk-local:
	fern generate --group python-sdk-local --api api
	rsync -aP generated/octoai-python-sdk-fern/ ../octoai-python-sdk-fern/src/octoai

refresh-openapi:
	cp ../nimbus/python/asset-lake/asset-library-api-openapi-3.1.0.json fern/apis/asset-library/openapi/openapi.json
	cp ../nimbus/python/fine-tuning/fine-tuning-api-openapi-3.1.0.json fern/apis/fine-tuning/openapi/openapi.json
	cp ../nimbus/python/image-gen/image-gen-api-openapi.json fern/apis/image-gen/openapi/openapi.json
	cp ../nimbus/python/ollm/ollm-api-openapi-3.1.0.json fern/apis/text-gen/openapi/openapi.json

.PHONY: refresh-openapi generate-python-sdk-local
