class Srv42 < Formula
  VERSION = "v1.0.0".freeze

  # rubocop:disable Layout/HashAlignment
  SUMS = Hash[
    "darwin-amd64"  => "56def59fc9fb888591808d387909781add20dac7c61fd83b985178c9227fdc10",
    "darwin-arm64"  => "dc22fc5daa9f86b2628d5802d84cd0e76bdcab8d1350654cdb277ecc197bedad",
    "linux-amd64"   => "195378fb144df30fedb19ac3285b7bf7c9ed9a08c3f43bf420d4e94bb60bd370"
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
