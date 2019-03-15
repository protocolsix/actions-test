workflow "PR handler" {
  on = "pull_request"
  resolves = ["Log pull_request"]
}

action "Log pull_request" {
  uses = "publisher/test-action/action-b@test"
  secrets = ["GITHUB_TOKEN"]
}

action "Some action" {
  uses = "publisher/test-action/action-a@test"
  secrets = ["GITHUB_TOKEN"]
}

workflow "Check run handler" {
  on = "check_run"
  resolves = ["Log check run"]
}

action "Log check run" {
  uses = "publisher/test-action/action-b@test"
  secrets = ["GITHUB_TOKEN"]
}

workflow "Check suite handler" {
  on = "check_suite"
  resolves = ["Log check suite"]
}

action "Log check suite" {
  uses = "publisher/test-action/action-b@test"
  secrets = ["GITHUB_TOKEN"]
}

workflow "Push handler" {
  on = "push"
  resolves = [
    "Calculate package hashes",
  ]
}

action "Calculate package hashes" {
  uses = "publisher/test-action/calculate-package-hashes@test"
  secrets = ["GITHUB_TOKEN"]
}

workflow "Status handler" {
  on = "status"
  resolves = ["Log status"]
}

action "Log status" {
  uses = "publisher/test-action/action-b@test"
  secrets = ["GITHUB_TOKEN"]
}
