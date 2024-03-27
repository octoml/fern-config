update-asset-lake-schema:
	cp ../cheese-pizza/python/asset-lake/asset-lake-api-openapi-3.1.0.json fern/apis/asset-lake/openapi/openapi.json

generate-python-sdk-local:
	fern generate --group python-sdk-local --api api
	rsync -aP generated/octoai-python-sdk-fern/ ../octoai-python-sdk-fern/src/octoai

.PHONY: update-asset-lake-schema generate-python-sdk-local