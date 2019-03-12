workflow "Main" {
  on = "check_run"
  resolves = ["Test action"]
}

action "Test action" {
  uses = "publisher/test-action/action-a@test"
  secrets = ["GITHUB_TOKEN"]
}

workflow "New workflow" {
  on = "check_suite"
  resolves = ["Some action"]
}

action "Some action" {
  uses = "publisher/test-action/action-a@test"
  secrets = ["GITHUB_TOKEN"]
}
