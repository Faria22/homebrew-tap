class Aliasmgr < Formula
  desc "CLI alias manager, written in Rust"
  homepage "https://github.com/Faria22/aliasmgr"
  url "https://github.com/Faria22/aliasmgr/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "189c0e5aef8fb8d78849ba2ad2d2b01f76b9c29374a66ef3c76801a72d3e3386"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"aliasmgr", "init", "bash"
    system bin/"aliasmgr", "add", "alias", "ll", "ls -la"
    assert_match 'll = "ls -la"', File.read(testpath/".config/aliasmgr/aliases.toml")
  end
end
