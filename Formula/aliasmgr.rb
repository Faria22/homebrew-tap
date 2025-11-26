class Aliasmgr < Formula
  desc "CLI alias manager, written in Rust"
  homepage "https://github.com/Faria22/aliasmgr"
  url "https://github.com/Faria22/aliasmgr/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "81d1b7afdcfafa3cdfd95b548de49ae3136df814e5c0aed909faf3ba05a97a54"
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
