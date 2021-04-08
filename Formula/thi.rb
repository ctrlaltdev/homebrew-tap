class Thi < Formula
  VERSION = "v1.0.0-beta1".freeze

  # rubocop:disable Layout/HashAlignment
  SUMS = Hash[
    "darwin-amd64"  => "d5be9e74d97e6271d9887dcd48d1bd5a17e3a294c2592e364072ae995a735cdc",
    "darwin-arm64"  => "6409aa4609552b3c53d3dc820d8273dda69bfc38bb8c5842f81e0ff50d200c9a",
    "linux-amd64"   => "7ce4d563be2175c31e37c7b01d6b5fcc6094aa0e40a1507abf7b299e3c72277a",
    "linux-arm64"   => "855577be28b9809e39edb10b1ab4231c8b81c37df2dea36f13845f7ac70d5f08",
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
