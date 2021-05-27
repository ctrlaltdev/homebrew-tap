class Ccc < Formula
  VERSION = "v1.0.0-alpha.1".freeze

  # rubocop:disable Layout/HashAlignment
  SUMS = Hash[
    "darwin-amd64" => "de9acc3593a51ebbcc2b487839c185dfee046c119f2cabf48d017757a8389db0",
    "darwin-arm64" => "ed1bdbc058c3102e067d3b83631da1f92e021f5ad9a8806d4a52f0f7c6540c7c",
    "linux-amd64"  => "bd495a35cecda867e8e65c42d9b5e83e12c0bf4751e361d138e87fa4c2b11ef6",
    "linux-arm64"  => "ab2663b7a7aa5f364e688b6b349f2381e7870f42075376ad03ac3f4532a20636"
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
