class Memda < Formula
  VERSION = "v1.2.0".freeze

  # rubocop:disable Layout/HashAlignment
  SUMS = Hash[
    "darwin-amd64"  => "cf8ef4f5343fb3a878b16ce7b444ee8dccea49f7c1a2b5f9ad1e507552fffe2d",
    "linux-amd64"   => "62a681f53b031bc20a6319575595e754b6d84a8c12154763cd159f72c712eec3",
    "linux-386"     => "85626780a5018dd91ab4496e844fa282e71f805cc1bdd54ba6d96e3a729c7a94"
  ].freeze
  # rubocop:enable Layout/HashAlignment
  RAW_OS = `uname -s`.freeze
  RAW_ARCH = `uname -m`.freeze

  OS = (RAW_OS == "Darwin\n" ? "darwin" : "linux").freeze
  ARCH = (RAW_ARCH == "x86_64\n" ? "amd64" : "386").freeze

  SHA256 = SUMS["#{OS}-#{ARCH}"].freeze

  desc "AWS Lambda Memory Usage Checker"
  homepage "https://ctrlalt.dev/memda"
  url "https://github.com/ctrlaltdev/memda/releases/download/#{VERSION}/memda-#{OS}-#{ARCH}.tar.gz"
  version VERSION
  sha256 SHA256
  license "MPL-2.0"

  def install
    bin.install "memda-#{OS}-#{ARCH}" => "memda"
  end

  test do
    system "#{bin}/memda"
  end
end
