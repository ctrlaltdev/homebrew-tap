class Memda < Formula
  VERSION = "v1.1.1".freeze

  desc "Installs Memda from GitHub"
  homepage "https://ctrlalt.dev/memda"
  url "https://github.com/ctrlaltdev/memda/releases/download/#{VERSION}/memda-darwin-amd64.tar.gz"
  version #{VERSION}
  sha256 '7e1ea3d8d499081e01fb98a9d5ef3862b95926910f386a9fcc4e0c753ae6a1c0'

  def install
    bin.install 'memda'
  end

  test do
   system "#{bin}/memda"
  end
end
