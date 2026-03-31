# Variable Validation

test {
  parallel = true
}

mock_provider "aws" {}

variables {
  user_pool_name = "test"
}

################################################################################
# deletion_protection
################################################################################

run "validation_invalid_deletion_protection" {
  command = plan

  variables {
    deletion_protection = "ENABLED"
  }

  expect_failures = [
    var.deletion_protection,
  ]
}

################################################################################
# mfa_configuration
################################################################################

run "validation_invalid_mfa_configuration" {
  command = plan

  variables {
    mfa_configuration = "REQUIRED"
  }

  expect_failures = [
    var.mfa_configuration,
  ]
}
