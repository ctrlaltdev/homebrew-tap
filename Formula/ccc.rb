class Ccc < Formula
  VERSION = "v1.0.0-alpha".freeze

  # rubocop:disable Layout/HashAlignment
  SUMS = Hash[
    "darwin-amd64" => "dd761637e24d2117c0d2047ba28841e98e9b15c0fd3955c3a86250ce20c32964",
    "darwin-arm64" => "c9d0942811465245d59687f62ecd6d09439397e232c4eff19c4d0f396e64e9ce",
    "linux-amd64" => "1cc595ec7fb6a6fd5d78f922628ae979780c21401d4e014cecd1ba5f4aa49084",
    "linux-arm64" => "23ca65c9fe95af5465abdd235ddfd45856f641efebc7df2c29c4c11f65df45db"
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

  desc "Conventional Commit Checker"
  homepage "https://ctrlalt.dev/ccc"
  url "https://github.com/ctrlaltdev/ccc/releases/download/#{VERSION}/ccc-#{OS}-#{ARCH}.tar.gz"
  version VERSION
  sha256 SHA256
  license "MPL-2.0"

  def install
    bin.install "ccc" => "ccc"
  end

  test do
    system "#{bin}/ccc"
  end
end
