# elcli

This action is a wrapper around the edge-leap client (elcli) to provide a seamless usage of the client when using GitHub Actions.
When using this action, the user is able to generate a new module configuration and send it to the Azure IoT Hub without having to install any dependencies or having to worry about manifests
templates in the repository.

## Inputs
Please refer to the following table for the list of inputs and outputs available for this action.

| Input | Description |
| --- | --- |
| `token` | The Azure token to authenticate the client. |
| `hub` | The IoT Hub name where the module configuration will be deployed. |
| `id` | The module configuration id. Must be unique and in kebab-case. |
| `module-name` | The module name as it is shown in the iotedge list command. Must be unique and in camelCase. |
| `image` | The docker image url to be used the module, including the tag. |
| `target-condition` | The target condition for the module configuration. |
| `priority` | The priority of the module configuration. Must be a number between 1 and 100. |
| `create-options` | The create options for the module configuration. Must be a valid json string. |
| `runtime-env` | The runtime environment variables for the module configuration. A string with key-value pairs separated by commas and each pair separated by an equal sign. |

## Example

Consider the following example to use the `elcli` action:

```yaml
name: Send module configuration to IoT Hub
uses: unbrikd/actions/elcli@030d66be634c9f281ca74c3ffd9c090c0ac71a3d # Always use a commit hash from the master branch (stable) to ensure reproducibility.
with:
with:
  token: ${{ env.AZURE_TOKEN }}
  hub: "my-iot-hub"
  id: "my-module"
  image: "mycr.io/my-module:latest"
  module-name: "myModule"
  target-condition: "tags.application.${{ inputs.module_name }}='${{ inputs.version }}'"
  priority: 50
  create-options: '{"HostConfig": {"NetworkMode": "host"}}'
  runtime-env: "mykey1=myval1,mykey2=myval2"
```
