# terraform-aws-cognito

Cognito User Pool・User Pool Client を作成する Terraform モジュール。

## Usage

```hcl
module "cognito" {
  source = "git::https://github.com/hiro1202/terraform-aws-cognito.git"

  user_pool_name = "my-app"
}
```

## Development

| Command          | Description                              |
|------------------|------------------------------------------|
| `make init`      | `terraform init -backend=false` を実行   |
| `make fmt`       | `terraform fmt -recursive -diff` を実行  |
| `make validate`  | `make init` 後に `terraform validate` を実行 |
| `make test`      | `make init` 後に `terraform test` を実行 |
| `make tflint`    | `tflint --init && tflint --recursive` を実行 |
| `make trivy`     | `trivy config .` を実行                  |
| `make ci`        | すべてのチェックを実行（fmt / validate / test / tflint / trivy） |

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.31.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.38.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cognito_user_pool.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool) | resource |
| [aws_cognito_user_pool_client.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_client) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_user_pool_name"></a> [user\_pool\_name](#input\_user\_pool\_name) | Cognito User Pool名 | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## License

MIT Licensed. See [LICENSE](LICENSE) for full details.
