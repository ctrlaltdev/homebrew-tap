class Srv42 < Formula
  VERSION = "v1.3.0".freeze

  # rubocop:disable Layout/HashAlignment
  SUMS = Hash[
    "darwin-amd64" => "f4147d266ba08ec150349baa26b67e451cbe54a79add13a64e2f4894a4c7bf9d",
    "darwin-arm64" => "3ea8e654c4dab5589fcbbe968493bb1302255f63e6da7c841cd1ed19cff8a286",
    "linux-amd64" => "b898ce461dfe8cd0a4d95a0e9771f5154912d45e969d473ff647ae01630c8bc6",
    "linux-arm64" => "06fda09889bfbc8b6584cf51c595caf2a029055cff12bf885e7d0ae235903b9f",
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
