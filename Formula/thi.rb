class Thi < Formula
  VERSION = "v1.0.0".freeze

  # rubocop:disable Layout/HashAlignment
  SUMS = Hash[
    "linux-amd64"  => "df6a7c9c27510e1730303a431edbb90ce517f9462afeec4b43a41529bc3b5654",
    "linux-arm64"  => "6d38ca5a09c31658844b1483267d2c2682e2edcc4aaf2381b8f6ec2051cbf5c7",
    "darwin-amd64" => "981d69d0157d070bcfb7e41e3ab57a12dbb08e020f214008eb659828b1f1e5a7",
    "darwin-arm64" => "e6394dade1a0528dedec487ddcdd47e5fb85526a71aca01ec2e8e9a1f8507e80",
  ].freeze
  # rubocop:enable Layout/HashAlignment
  RAW_OS = `uname -s`.freeze
  RAW_ARCH = `uname -m`.freeze

  unless RAW_OS == "Darwin\n" || RAW_OS == "Linux\n"
    raise 'Unsupported OS - please check release page'
  end
  
  unless RAW_ARCH == "x86_64\n" || RAW_ARCH == "arm64\n"
    raise 'Unsupported architecture - please check release page'
  end

  OS = (RAW_OS == "Darwin\n" ? "darwin" : "linux").freeze
  ARCH = (RAW_ARCH == "x86_64\n" ? "amd64" : "arm64").freeze

  SHA256 = SUMS["#{OS}-#{ARCH}"].freeze

  desc "Terminal Harvest Interface"
  homepage "https://ctrlalt.dev/thi"
  url "https://github.com/ctrlaltdev/thi/releases/download/#{VERSION}/thi-#{OS}-#{ARCH}.tar.gz"
  version VERSION
  sha256 SHA256
  license "MPL-2.0"

  def install
    bin.install "thi" => "thi"
  end

  test do
    system "#{bin}/thi"
  end
end
