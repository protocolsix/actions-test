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
