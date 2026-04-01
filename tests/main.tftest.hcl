test {
  parallel = true
}

mock_provider "aws" {}

# デフォルト変数値 — 各runブロックでは差分のみ上書き
variables {
  user_pool_name = "my-app"
}

################################################################################
# User Pool
################################################################################

run "user_pool_default_settings" {
  command = apply

  assert {
    condition     = aws_cognito_user_pool.main.name == "my-app"
    error_message = "User Pool名はuser_pool_name変数の値と一致する必要があります"
  }

  assert {
    condition     = aws_cognito_user_pool.main.deletion_protection == "INACTIVE"
    error_message = "deletion_protectionのデフォルトはINACTIVEである必要があります"
  }

  assert {
    condition     = aws_cognito_user_pool.main.mfa_configuration == "OPTIONAL"
    error_message = "mfa_configurationのデフォルトはOPTIONALである必要があります"
  }

  assert {
    condition     = one(aws_cognito_user_pool.main.admin_create_user_config).allow_admin_create_user_only == true
    error_message = "allow_admin_create_user_onlyのデフォルトはtrueである必要があります"
  }
}

run "user_pool_deletion_protection_active" {
  command = apply

  variables {
    deletion_protection = "ACTIVE"
  }

  assert {
    condition     = aws_cognito_user_pool.main.deletion_protection == "ACTIVE"
    error_message = "deletion_protectionにACTIVEを指定した場合、ACTIVEが設定される必要があります"
  }
}

run "user_pool_mfa_on" {
  command = apply

  variables {
    mfa_configuration = "ON"
  }

  assert {
    condition     = aws_cognito_user_pool.main.mfa_configuration == "ON"
    error_message = "mfa_configurationにONを指定した場合、ONが設定される必要があります"
  }
}

run "user_pool_mfa_off" {
  command = apply

  variables {
    mfa_configuration = "OFF"
  }

  assert {
    condition     = aws_cognito_user_pool.main.mfa_configuration == "OFF"
    error_message = "mfa_configurationにOFFを指定した場合、OFFが設定される必要があります"
  }
}

run "user_pool_allow_self_signup" {
  command = apply

  variables {
    allow_admin_create_user_only = false
  }

  assert {
    condition     = one(aws_cognito_user_pool.main.admin_create_user_config).allow_admin_create_user_only == false
    error_message = "allow_admin_create_user_onlyにfalseを指定した場合、セルフサインアップが有効になる必要があります"
  }
}

################################################################################
# User Pool Client
################################################################################

run "user_pool_client_settings" {
  command = apply

  assert {
    condition     = aws_cognito_user_pool_client.main.name == "my-app-client"
    error_message = "Client名は「{user_pool_name}-client」の形式である必要があります"
  }

  assert {
    condition     = aws_cognito_user_pool_client.main.user_pool_id == aws_cognito_user_pool.main.id
    error_message = "ClientはUser Poolに紐づいている必要があります"
  }
}
