workflow "on push, run conform" {
  on       = "pull_request"

  resolves = [
    "conform"
  ]
}

action "conform" {
  uses    = "docker://andrewrynhard/conform:6f73b02"

  secrets = [
    "GITHUB_TOKEN"
  ]
}
