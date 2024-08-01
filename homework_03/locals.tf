locals {
  ssh-key = {
    default = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
}