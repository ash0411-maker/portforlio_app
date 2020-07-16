# -*- encoding: utf-8 -*-
# stub: aws-sdk-resources 2.11.545 ruby lib

Gem::Specification.new do |s|
  s.name = "aws-sdk-resources".freeze
  s.version = "2.11.545"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Amazon Web Services".freeze]
  s.date = "2020-07-09"
  s.description = "AWS SDK For Ruby V2 has been marked as deprecated. Please upgrade to AWS SDK For Ruby V3.Provides resource oriented interfaces and other higher-level abstractions for many AWS services. This gem is part of the official AWS SDK for Ruby.".freeze
  s.email = ["trevrowe@amazon.com".freeze]
  s.homepage = "http://github.com/aws/aws-sdk-ruby".freeze
  s.licenses = ["Apache 2.0".freeze]
  s.post_install_message = "AWS SDK For Ruby V2 has been marked as deprecated. Please upgrade to AWS SDK For Ruby V3.".freeze
  s.rubygems_version = "3.0.3".freeze
  s.summary = "AWS SDK for Ruby - Resources".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<aws-sdk-core>.freeze, ["= 2.11.545"])
    else
      s.add_dependency(%q<aws-sdk-core>.freeze, ["= 2.11.545"])
    end
  else
    s.add_dependency(%q<aws-sdk-core>.freeze, ["= 2.11.545"])
  end
end
