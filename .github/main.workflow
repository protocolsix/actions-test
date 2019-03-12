workflow "Main" {
  resolves = ["Test action"]
  on = "pull_request"
}

action "Test action" {
  uses = "publisher/test-action/action-a@test"
  secrets = ["GITHUB_TOKEN"]
}

action "Some action" {
  uses = "publisher/test-action/action-a@test"
  secrets = ["GITHUB_TOKEN"]
}

workflow "Check run" {
  resolves = ["publisher/test-action/action-b@test"]
  on = "check_suite"
}

action "publisher/test-action/action-b@test" {
  uses = "publisher/test-action/action-b@test"
  secrets = ["GITHUB_TOKEN"]
}

workflow "check suite" {
  on = "check_suite"
  resolves = ["publisher/test-action/action-b@test-1"]
}

action "publisher/test-action/action-b@test-1" {
  uses = "publisher/test-action/action-b@test"
  secrets = ["GITHUB_TOKEN"]
}
