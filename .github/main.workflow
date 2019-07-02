workflow "on push, run conform" {
  on       = "pull_request"

  resolves = [
    "conform"
  ]
}

action "checkout pull request" {
  uses    = "gr2m/git-checkout-pull-request-action@master"

  secrets = [
    "GITHUB_TOKEN"
  ] # Token needed for private repositories only
}

action "conform" {
  needs   = "checkout pull request"
  uses    = "docker://andrewrynhard/conform:4447684-dirty"

  secrets = [
    "GITHUB_TOKEN"
  ]
}
