# typed: strict
# frozen_string_literal: true

# LocalSub builds the CLI from the immutable, checksummed release source archive.
class Localsub < Formula
  desc "Generate Japanese subtitles and captioned videos locally"
  homepage "https://github.com/byteflare-co/localsub"
  url "https://github.com/byteflare-co/localsub/releases/download/v0.1.0-alpha.1/localsub-v0.1.0-alpha.1-source.tar.gz"
  sha256 "76b004d3bf97b1bca04a89f62152c291ba8d89fd4ef7eb1094d03b8f4c9dca2d"
  license "Apache-2.0"

  depends_on xcode: ["26.0", :build]
  depends_on arch: :arm64
  depends_on macos: :tahoe

  def install
    # Homebrew already isolates the build; avoid an unsupported nested SwiftPM sandbox.
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "localsub"
    bin.install ".build/release/localsub"
  end

  def caveats
    <<~EOS
      Run `localsub doctor` before processing the first video.
      Apple Speech and Translation model assets are managed separately by macOS.
    EOS
  end

  test do
    ENV["LOCALSUB_NO_UPDATE_CHECK"] = "1"
    assert_match "localsub #{version}", shell_output("#{bin}/localsub --version")
  end
end
