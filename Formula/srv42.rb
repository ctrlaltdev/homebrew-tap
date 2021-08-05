class Srv42 < Formula
  VERSION = "v1.2.0".freeze

  # rubocop:disable Layout/HashAlignment
  SUMS = Hash[
    "darwin-amd64" => "d5e92a2339ea705feb71d6472d7fc9bbf4d5a3f92732aa49fab668225c18dcb3",
    "darwin-arm64" => "df0383b2eb4a4ea175b2edadce23a47e4ff24bcc97e12cb1d1a0d5f4d11e12a7",
    "linux-amd64" => "27019822f9128b1485b25098e739c0a76e2d2dbdb9d1bfb643c2233fd8226f83",
    "linux-arm64" => "0ed932264310e86cc842adfbf512e92b7e61a75b31c78af790d68c184e54e12b",
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
