terraform {
  backend s3 {
    bucket  = "mush-fra-ops"
    key     = "states/windows"
    region  = "eu-central-1"
    encrypt = true
  }
}
