class ChatSharedConversationToFile < Formula
  desc "CLI to convert public ChatGPT/Gemini/Grok/Claude share links into Markdown and HTML transcripts"
  homepage "https://github.com/Dicklesworthstone/chat_shared_conversation_to_file"
  license "NOASSERTION"
  url "https://api.github.com/repos/Dicklesworthstone/chat_shared_conversation_to_file/tarball/v0.4.5"
  sha256 "0ed7879a526b56aee65cb680d4ce3ea140084be4144a8d0da4e53af41c60c4d2"
  head "https://github.com/Dicklesworthstone/chat_shared_conversation_to_file.git", branch: "main"

  livecheck do
    url :head
    strategy :github_latest
  end

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/csctf --version")
  end
end
