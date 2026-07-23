class Tideline < Formula
  desc "Upload and manage private game builds with Tideline"
  homepage "https://www.npmjs.com/package/@neonwavestudios/tideline"
  url "https://registry.npmjs.org/@neonwavestudios/tideline/-/tideline-0.1.1.tgz"
  sha256 "edb4f00c285bcedfa9b158cc69a8ce3751905283cd2d990b9200f00a0c4d7b42"
  license "AGPL-3.0-only"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/tideline"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tideline --version")
    assert_match(/\A[0-9a-f-]{36}\n\z/, shell_output("#{bin}/tideline build-id"))
  end
end
