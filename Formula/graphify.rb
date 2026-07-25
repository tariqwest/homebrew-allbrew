class Graphify < Formula
  desc "Turn any codebase, with its docs, SQL schemas, configs, and PDFs, into a queryable knowledge graph. A /graphify skill for Claude Code, Cursor, Codex, and Gemini CLI: local deterministic AST parsing, every edge explained, no vector store."
  homepage "https://github.com/vercel-labs/skills\#readme"
  url "https://registry.npmjs.org/skills/-/skills-1.5.20.tgz"
  sha256 "359417194b4049eed6b5a80a3c3f57b82c75d48962d791a0efdf41b85cf52990"
  license "MIT"

  livecheck do
    url "https://registry.npmjs.org/skills/latest"
    regex(/"version"\s*:\s*"v?([^"\\]+)"/i)
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  service do
    run ["python3", "-m", "venv", ".venv", "&&", ".venv/bin/pip", "install", "graphifyy[mcp]"]
    keep_alive true
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skills --version")
  end
end
