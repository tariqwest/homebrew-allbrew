class Pry < Formula
  desc "Pry is a runtime developer console and IRB alternative with powerful\nintrospection capabilities. Pry aims to be more than an IRB replacement. It is\nan attempt to bring REPL driven programming to the Ruby language.\n"
  homepage "http://pry.github.io"
  license "MIT"
  url "https://rubygems.org/gems/pry-0.16.0.gem"
  sha256 "d76c69065698ed1f85e717bd33d7942c38a50868f6b0673c636192b3d1b6054e"
  version "0.16.0"

  livecheck do
    url "https://rubygems.org/api/v1/gems/pry.json"
    regex(/"version"\s*:\s*"v?([^"\\]+)"/i)
  end

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "install", "pry", "--version", version.to_s, "--no-document", "--bindir", "#{bin}"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pry --version")
  end
end
