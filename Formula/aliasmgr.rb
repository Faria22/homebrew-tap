class Aliasmgr < Formula
  desc "CLI alias manager, written in Rust"
  homepage "https://github.com/Faria22/aliasmgr"
  url "https://github.com/Faria22/aliasmgr/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "8209606abf9c4cc11ba270b629de247e021a743d94943d630420ead12a47bff2"
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
