require "refile/s3"

aws = {
  access_key_id: "ENV['access_key']",
  secret_access_key: "ENV['secret_access']",
  region: "ap-northeast-1",
  bucket: "fantra",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)