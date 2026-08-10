class Mcphub < Formula
  desc "A unified hub for centrally managing and dynamically orchestrating multiple MCP servers/APIs into separate endpoints with flexible routing strategies."
  homepage "https://www.mcphub.app"
  url "https://registry.npmjs.org/@samanhappy/mcphub/-/mcphub-1.0.28.tgz"
  sha256 "fd96ba55da96e5df87395b8e6125b384dccbb11956aefc282f53c3ec3431476b"
  license "ISC"

  livecheck do
    url "https://registry.npmjs.org/%40samanhappy%2Fmcphub/latest"
    regex(/"version"\s*:\s*"v?([^"\\]+)"/i)
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args, "--min-release-age=0"
    bin.install_symlink libexec.glob("bin/*")

    return unless OS.mac?

    mach_o = Utils.safe_popen_read(
      "/usr/bin/find", libexec.to_s, "-type", "f", "-perm", "+111", "-print0"
    ).split("\0").reject(&:empty?).select do |path|
      Utils.safe_popen_read("/usr/bin/file", "-b", path).include?("Mach-O")
    rescue
      false
    end

    mach_o.each do |path|
      system "/usr/bin/xattr", "-cr", path
      system "/usr/bin/codesign", "--force", "--sign", "-", path
    end
  end

  service do
    run [opt_bin/"mcphub", "servers", "add", "fetch", "--type", "stdio", "--command", "uvx", "--arg", "mcp-server-fetch"]
    keep_alive true
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcphub --version")
  end
end
