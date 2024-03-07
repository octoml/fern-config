# Octo Fern Configuration

This repository contains your Fern Configuration: 
  - OpenAPI specs
    - [Asset Lake OpenAPI Spec](./fern/apis/asset-lake/openapi/openapi.json)
    - [Fine Tuning OpenAPI Spec](./fern/apis/fine-tuning/openapi/openapi.json)
    - [Image Gen OpenAPI Spec](./fern/apis/image-gen/openapi/openapi.json)
    - [Text Gen OpenAPI Spec](./fern/apis/text-gen/openapi/openapi.json)
  - [Generators config](./fern/apis/api/generators.yml)
  
## Validating your API Definition

To validate your API, run: 
```sh
npm install -g fern-api # only required once
fern check
```
## Updating your SDKs

To update your SDKs, simply tag a release with `<language>@<version>`
e.g. `python@<version>` or `node@<version>` on the repository. Under the hood, 
this leverages the Fern CLI: 

```sh
npm install -g fern-api # only required once
fern generate --group python-sdk --api api
```
