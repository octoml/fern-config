# Octo Fern Configuration

This repository contains Fern configurations.

- [Fern Documentation](https://buildwithfern.com/learn/home)
- OpenAPI specs
  - [Asset Lake OpenAPI Spec](./fern/apis/asset-lake/openapi/openapi.json)
  - [Fine Tuning OpenAPI Spec](./fern/apis/fine-tuning/openapi/openapi.json)
  - [Image Gen OpenAPI Spec](./fern/apis/image-gen/openapi/openapi.json)
  - [Text Gen OpenAPI Spec](./fern/apis/text-gen/openapi/openapi.json)
- [Generators config](./fern/apis/api/generators.yml)
- Generated SDKs
  - Python
    - [Repository](https://github.com/octoml/octoai-python-sdk-fern)
    - [NPM Package](https://pypi.org/project/octoai/)
  - Typescript
    - [Repository](https://github.com/octoml/octoai-typescript-sdk-fern)
    - [NPM Package](https://www.npmjs.com/package/@octoai/sdk)

## Getting Started

To install the Fern CLI run:

```sh
npm install -g fern-api
```

To validate your API, run:

```sh
fern check
```

## Updating your SDKs

To update your SDKs, simply tag a release with `<language>@<version>`
e.g. `python@<version>` or `node@<version>` on the repository.  *Note, we intend to keep all language versions in-sync.*

Under the hood this leverages the Fern CLI:

```sh
fern generate --group python-sdk --api api
```

You can also trigger a release by running git actions manually.

- [Python release action](https://github.com/octoml/fern-config/actions/workflows/python-sdk.yml)
- [Typescript release action](https://github.com/octoml/fern-config/actions/workflows/ts-sdk.yml)

## Custom Code

Sometimes we need to augment fern generated code.  We currently do this for two reasons:

- Orchestration of complex operations.  An example of this is asset upload, where we wish to call a series of endpoints from a single SDK operation.
- Adding functionality not supported by Open API.  For example, compute uses wildcard routes for inferencing, which is not support by Open API.

In order to author custom code, you'll need to add files to `.fernignore` in the corresponding language repository.  In cases where you need to mix generated
and custom code in a single release, you'll need to configure fern to make a pull request instead of immediately releasing code.  

Update the `generators.yml` configuration file.  Each generator contains a `github` section, which you can add a `mode: pull-request` to.

```yaml
groups:
  python-sdk:
    generators:
      - name: fernapi/fern-python-sdk
        version: 1.2.0-rc2
        output:
          location: pypi
          package-name: "octoai"
          token: ${PYPI_TOKEN}
        github:
          repository: octoml/octoai-python-sdk-fern
          mode: pull-request
```
