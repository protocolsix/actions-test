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
  on = "check_run"
  resolves = ["publisher/test-action/action-b@test"]
}

action "publisher/test-action/action-b@test" {
  uses = "publisher/test-action/action-b@test"
  secrets = ["GITHUB_TOKEN"]
}
