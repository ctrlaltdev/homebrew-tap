class Thi < Formula
  VERSION = "v1.1.0".freeze

  # rubocop:disable Layout/HashAlignment
  SUMS = Hash[
    "darwin-amd64" => "1f08a5aced923bd9715dffcc89f247bcd92a1024e55eb5e5581e95a21e46c658",
    "darwin-arm64" => "0be6ed3a4aabc543831be524e562eef2b7a4fbf66b42be28f7dbfd33b95836cc",
    "linux-amd64"  => "dd6c4b602c4748149fad3784a295bc882944fddcf7f315404e93842920be120d",
    "linux-arm64"  => "c659fb60590548dfbb25f025b299880d6b6968156433b9343cd8f6b370657117",
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
