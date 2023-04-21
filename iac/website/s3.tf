resource "aws_s3_bucket" "codepipeline-artifacts" {
  bucket = "pipeline-artifactsgit"
  acl    = "private"
}

