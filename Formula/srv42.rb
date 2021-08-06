class Srv42 < Formula
  VERSION = "v1.3.1".freeze

  # rubocop:disable Layout/HashAlignment
  SUMS = Hash[
    "darwin-amd64" => "24b8006f1523b7920ca570aad7f21b6547dca0c3aee03d33216e406b22110362",
    "darwin-arm64" => "09c9625869cbaf3e9b9e845f10788a3688d37c9fde78167bfd289615036b74b1",
    "linux-amd64" => "ba56ad46b7a588eb1027735cf6daed30aff9e95441738337ccbf2e3d6a3fbed9",
    "linux-arm64" => "0443f2a1902946bca6db423c7fdd0a9c56030bf5d4af2626be41827078862f2d",
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
