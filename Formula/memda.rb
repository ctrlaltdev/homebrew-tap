class Memda < Formula
  VERSION = "v1.1.1".freeze

  SUMS = Hash[
    "darwin-amd64" => "7e1ea3d8d499081e01fb98a9d5ef3862b95926910f386a9fcc4e0c753ae6a1c0",
    "linux-amd64" => "172acc385347afb73c276625070cc2881d918c9ac8a3a352660cb783484d3c55",
    "linux-386" => "723319ca7c77662a6a5154de3a70d0b9d73a6dacea08b17f9c19ec4c9dff81ab"
  ].freeze
  RAW_OS = `uname -s`.freeze
  RAW_ARCH = `uname -m`.freeze
  
  OS = RAW_OS == "Darwin\n" ? "darwin" : "linux"
  ARCH = RAW_ARCH == "x86_64\n" ? "amd64" : "386"
  
  SHA256 = SUMS["#{OS}-#{ARCH}"]

  desc "AWS Lambda Memory Usage Checker"
  homepage "https://ctrlalt.dev/memda"
  url "https://github.com/ctrlaltdev/memda/releases/download/#{VERSION}/memda-#{OS}-#{ARCH}.tar.gz"
  version "#{VERSION}"
  sha256 "#{SHA256}"
  license "MPL-2.0"

  def install
    bin.install "memda-#{OS}-#{ARCH}" => "memda"
  end

  test do
    system "#{bin}/memda"
  end
end
