class Aliasmgr < Formula
  desc "CLI alias manager, written in Rust"
  homepage "https://github.com/Faria22/aliasmgr"
  url "https://github.com/Faria22/aliasmgr/archive/refs/tags/v2.0.2.tar.gz"
  sha256 "86217ee7c7e742dd01b3844a9e970d0fd48f4feebca316ad993c0244a0441110"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"aliasmgr", "init", "bash"
    system bin/"aliasmgr", "add", "ll", "ls -la"
    assert_match 'll = "ls -la"', File.read(testpath/".config/aliasmgr/aliases.toml")
  end
end
