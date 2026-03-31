variable "user_pool_name" {
  description = "Cognito User Pool名"
  type        = string
}

variable "deletion_protection" {
  description = "User Poolの削除保護（本番環境ではACTIVEを推奨）"
  type        = string
  default     = "INACTIVE"

  validation {
    condition     = contains(["ACTIVE", "INACTIVE"], var.deletion_protection)
    error_message = "deletion_protectionはACTIVEまたはINACTIVEで指定してください"
  }
}

variable "mfa_configuration" {
  description = "MFA設定（OFF: 無効, OPTIONAL: 任意, ON: 必須）"
  type        = string
  default     = "OPTIONAL"

  validation {
    condition     = contains(["OFF", "OPTIONAL", "ON"], var.mfa_configuration)
    error_message = "mfa_configurationはOFF、OPTIONAL、ONのいずれかで指定してください"
  }
}

variable "allow_admin_create_user_only" {
  description = "trueの場合、管理者のみがユーザーを作成可能（セルフサインアップ無効）"
  type        = bool
  default     = true
}
