workflow "on push, run conform" {
  on       = "pull_request"

  resolves = [
    "conform"
  ]
}

action "conform" {
  uses    = "docker://andrewrynhard/conform:4447684-dirty"

  secrets = [
    "GITHUB_TOKEN"
  ]
}
