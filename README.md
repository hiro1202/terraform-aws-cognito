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
| <a name="input_allow_admin_create_user_only"></a> [allow\_admin\_create\_user\_only](#input\_allow\_admin\_create\_user\_only) | trueの場合、管理者のみがユーザーを作成可能（セルフサインアップ無効） | `bool` | `true` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | User Poolの削除保護（本番環境ではACTIVEを推奨） | `string` | `"INACTIVE"` | no |
| <a name="input_mfa_configuration"></a> [mfa\_configuration](#input\_mfa\_configuration) | MFA設定（OFF: 無効, OPTIONAL: 任意, ON: 必須） | `string` | `"OPTIONAL"` | no |
| <a name="input_user_pool_name"></a> [user\_pool\_name](#input\_user\_pool\_name) | Cognito User Pool名 | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_user_pool_arn"></a> [user\_pool\_arn](#output\_user\_pool\_arn) | User PoolのARN |
| <a name="output_user_pool_client_id"></a> [user\_pool\_client\_id](#output\_user\_pool\_client\_id) | User Pool ClientのID |
| <a name="output_user_pool_endpoint"></a> [user\_pool\_endpoint](#output\_user\_pool\_endpoint) | User Poolのエンドポイント（JWT検証のissuer URL等で使用） |
| <a name="output_user_pool_id"></a> [user\_pool\_id](#output\_user\_pool\_id) | User PoolのID |
<!-- END_TF_DOCS -->

## License

MIT Licensed. See [LICENSE](LICENSE) for full details.
