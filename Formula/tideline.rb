class Tideline < Formula
  desc "Upload and manage private game builds with Tideline"
  homepage "https://www.npmjs.com/package/@neonwavestudios/tideline"
  url "https://registry.npmjs.org/@neonwavestudios/tideline/-/tideline-0.1.7.tgz"
  sha256 "27fa8dd38d43b3708a58cff97c6c7fbd4e6f894eee1c78abaea2e15d952231ae"
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
