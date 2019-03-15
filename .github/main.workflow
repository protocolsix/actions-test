workflow "PR handler" {
  on = "pull_request"
  resolves = ["Identify changed packages"]
}

action "Identify changed packages" {
  uses = "publisher/test-action/identify-changed-packages@test"
  secrets = ["GITHUB_TOKEN"]
}

action "Some action" {
  uses = "publisher/test-action/action-a@test"
  secrets = ["GITHUB_TOKEN"]
}

workflow "Check run handler" {
  on = "check_run"
  resolves = ["log check run"]
}

action "log check run" {
  uses = "publisher/test-action/action-b@test"
  secrets = ["GITHUB_TOKEN"]
}

workflow "Check suite handler" {
  on = "check_suite"
  resolves = ["log check suite"]
}

action "log check suite" {
  uses = "publisher/test-action/action-b@test"
  secrets = ["GITHUB_TOKEN"]
}

workflow "Push handler" {
  on = "push"
  resolves = [
    "Log push",
    "Calculate package hashes",
  ]
}

action "Log push" {
  uses = "publisher/test-action/action-b@test"
  secrets = ["GITHUB_TOKEN"]
}

action "Calculate package hashes" {
  uses = "publisher/test-action/calculate-package-hashes@test"
  secrets = ["GITHUB_TOKEN"]
}
