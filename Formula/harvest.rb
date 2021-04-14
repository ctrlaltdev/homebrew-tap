class Harvest < Formula
  VERSION = "v1.2.0".freeze

  # rubocop:disable Layout/HashAlignment
  SUMS = Hash[
    "linux-amd64"  => "17da2b0c8c2614a016988e1e59939702f0cfbf111a54d9b8fd32920363a8f9c6",
    "linux-arm64"  => "abc02577f873438a7963ea69e18a8fa47802267a283acc5c08ebda8ef5edfa2b",
    "darwin-amd64" => "fede8ad9532ba8a845c0a234140d6cb149d9bd5898589b789b1945ca0f6f7eb5",
    "darwin-arm64" => "3c7aad5fbe1fcd59046f852d5254631e97620f9fd82498a9a7f81b498574a644",
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
  homepage "https://ctrlalt.dev/harvest"
  url "https://github.com/ctrlaltdev/harvest-cli/releases/download/#{VERSION}/harvest-#{OS}-#{ARCH}.tar.gz"
  version VERSION
  sha256 SHA256
  license "MPL-2.0"

  def install
    bin.install "harvest" => "harvest"
  end

  test do
    system "#{bin}/harvest"
  end
end
