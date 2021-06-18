class Srv42 < Formula
  VERSION = "v1..0".freeze

  # rubocop:disable Layout/HashAlignment
  SUMS = Hash[
    "darwin-amd64" => "014b86b4a05f68f1a4098df0e46b5dbe7a493c808364d64159f0d77eceb03df4",
    "darwin-arm64" => "a090928ca600309fd376b640ad66d3b848e21ed41dfd8523d6d0a767d7a09405",
    "linux-amd64"  => "0213bcf3097c7e78244fb6bbcdb7893f2e1f29488c28c21146cdb42397e13c19",
    "linux-arm64"  => "dbb67aa6bd1fef00a6c6ec23159fa44f6dbfdb233b92bdff85a2f0ac804ba274",
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

  desc "Catch All Test HTTP Server"
  homepage "https://ctrlalt.dev/srv42"
  url "https://github.com/ctrlaltdev/srv42/releases/download/#{VERSION}/srv42-#{OS}-#{ARCH}.tar.gz"
  version VERSION
  sha256 SHA256
  license "MPL-2.0"

  def install
    bin.install "srv42-#{OS}-#{ARCH}" => "srv42"
  end

  test do
    system "#{bin}/srv42"
  end
end
