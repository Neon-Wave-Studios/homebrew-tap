class Tideline < Formula
  desc "Upload and manage private game builds with Tideline"
  homepage "https://www.npmjs.com/package/@neonwavestudios/tideline"
  url "https://registry.npmjs.org/@neonwavestudios/tideline/-/tideline-0.1.5.tgz"
  sha256 "11ccdcc354894bc073b25f2d4bb139c913e12f989a33a51f7890d098165ee124"
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
