class Diyddns < Formula
  VERSION = "v2.1.0".freeze

  # rubocop:disable Layout/HashAlignment
  SUMS = Hash[
    "darwin-amd64" => "96fa331054b1e23864cf59bf31e1e5c2a58a2eb3885b3e03ba563dee13c512fd",
    "darwin-arm64" => "dc19e9f4ddeb1f03b604c7bcd66978e34400ad3777fb392310a96b77c3d9de0e",
    "linux-amd64"  => "8f638a5ec585507419d3b12d7a9957e723e2a26099093ce93c949c2b2ad81507",
    "linux-arm64"  => "c604a8a733cdde243a9d40566987793f56db643d7c78db4083f26b05ad35a40f"
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

  desc "DIY Script for Dynamic DNS"
  homepage "https://ctrlalt.dev/DIYDDNS"
  url "https://github.com/ctrlaltdev/DIYDDNS/releases/download/#{VERSION}/DIYDDNS-#{OS}-#{ARCH}.tar.gz"
  version VERSION
  sha256 SHA256
  license "MPL-2.0"

  def install
    bin.install "DIYDDNS" => "DIYDDNS"
  end

  test do
    system "#{bin}/DIYDDNS"
  end
end
