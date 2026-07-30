class ChatSharedConversationToFile < Formula
  desc "CLI to convert public ChatGPT/Gemini/Grok/Claude share links into Markdown and HTML transcripts"
  homepage "https://github.com/Dicklesworthstone/chat_shared_conversation_to_file"
  license "NOASSERTION"
  version "0.4.5"

  on_macos do
    on_arm do
      url "https://github.com/Dicklesworthstone/chat_shared_conversation_to_file/releases/download/v#{version}/csctf-macos-arm64"
      sha256 "d5d88aeb20c13bded9e186b89a3c0d7f00705fbc658ee5a41766a84f7da90e7c"
    end
    on_intel do
      url "https://github.com/Dicklesworthstone/chat_shared_conversation_to_file/releases/download/v#{version}/csctf-macos-x64"
      sha256 "42075d7ef82c3b17a6419a4033b7a219478ce162fb605668f0048843b06a5265"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Dicklesworthstone/chat_shared_conversation_to_file/releases/download/v#{version}/csctf-linux-arm64"
      sha256 "3dc185dd7eb466fc6c6f77d388fd6e76628a1e1ddd3248869ae9b6792df76875"
    end
    on_intel do
      url "https://github.com/Dicklesworthstone/chat_shared_conversation_to_file/releases/download/v#{version}/csctf-linux-x64"
      sha256 "bb58bbd35de1d408b5fede47c61a7ff89038983043d8f735888d72a095b7fef3"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin_path = Dir["*"].find { |f| File.file?(f) && File.executable?(f) }
    bin_path ||= Dir["*"].find { |f| File.file?(f) && !f.end_with?(".txt", ".sha256", ".sig", ".asc") }
    odie "No binary found in download" unless bin_path
    bin.install bin_path => "csctf"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/csctf --version")
  end
end
