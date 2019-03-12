workflow "Test workflow" {
  on = "check_run"
  resolves = ["Test action"]
}

action "Test action" {
  uses = "publisher/test-action/action-a@test"
  secrets = ["GITHUB_TOKEN"]
}
