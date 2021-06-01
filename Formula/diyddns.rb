class Diyddns < Formula
  VERSION = "v2.0.0".freeze

  # rubocop:disable Layout/HashAlignment
  SUMS = Hash[
    "darwin-amd64" => "75ba86241b3cc1587a803c34cce74322223d961d989d8defdf766c9ce61d5762",
    "darwin-arm64" => "50d71a6a2cf3cb263c57cdbf55874eb980ec31535cfefd87bb165d8222e53dd2",
    "linux-amd64"  => "9f166e940c76862fe891da56c4bf845f72934f8e0dd6c05366d2200712c92ac2",
    "linux-arm64"  => "2374f9bb5eb70985eb64d4cf2bb61c428b9e3906eb710efe325621e8c4a61db7"
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
