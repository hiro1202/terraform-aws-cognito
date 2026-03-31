# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

AWS Cognito User Pool・User Pool Client を作成する再利用可能な Terraform モジュール。
姉妹モジュール [terraform-aws-network](https://github.com/hiro1202/terraform-aws-network) と設計方針を統一している。

## Commands

```bash
make ci        # 全チェック一括実行（fmt / validate / test / tflint / trivy）
make fmt       # terraform fmt -recursive -diff
make validate  # terraform init + validate
make test      # terraform init + test
make tflint    # tflint --init && tflint --recursive
make trivy     # trivy config .
```

## Architecture

Terraform 標準モジュール構成（main.tf / variables.tf / outputs.tf / versions.tf）に従う。

- `main.tf` — User Pool と User Pool Client の2リソースを定義。セクション区切りは `####...####` スタイル
- `variables.tf` — 変数化は必要最小限に絞る。環境差異やセキュリティポリシーに直結する値のみ変数にする
- `outputs.tf` — 他モジュールから実際に参照される値のみ定義する（不要な出力は可読性を下げる）
- `tests/` — mock_provider を使った terraform test。機能テスト（apply）とバリデーションテスト（plan + expect_failures）を分離

## Conventions

- セキュリティスキャンは **trivy** を使用（checkov ではない）
- 命名規則はスネークケース（tflint で強制）
- variable には必ず `description`、`type`、適切な `validation` を付ける
- README のドキュメントは `terraform-docs` で自動生成（手動編集しない）
- コード変更後は `make ci` で全チェック通過を確認してからコミットする

## CI

GitHub Actions（`.github/workflows/test.yml`）が PR 時に自動実行。
結果は PR コメントにテーブル形式で投稿される。
チェック順: fmt → tflint → trivy → validate → test
