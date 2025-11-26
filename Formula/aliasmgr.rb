class Aliasmgr < Formula
  desc "CLI alias manager, written in Rust"
  homepage "https://github.com/Faria22/aliasmgr"
  url "https://github.com/Faria22/aliasmgr/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "978e09614445dccf091fdb595589e02f90590a58bf71a207a8f638280a7b670e"
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
