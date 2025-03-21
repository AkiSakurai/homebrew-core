class Gitleaks < Formula
  desc "Audit git repos for secrets"
  homepage "https://github.com/zricethezav/gitleaks"
  url "https://github.com/zricethezav/gitleaks/archive/v8.11.2.tar.gz"
  sha256 "408e4b90f5a451a6f37a2a33553ed9f913c6b6b4ebf8db4c68ddb85cb0a5cb0d"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "40b12d7a8f324a41097f17517842a7199e8972adb9d6e13cc13ff98c69370ecb"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "9f6954982840e56eca1951fbee6bf521d01ba670258004efbebf0f88bf51e2bd"
    sha256 cellar: :any_skip_relocation, monterey:       "3aa4753109f8a444ad43785782e748512de0c912bc6ea10133b67a0fde57272a"
    sha256 cellar: :any_skip_relocation, big_sur:        "e447a686d53f5a4c40884c8dfa9ef90f9551152d813bdf6fbeeb2534b94962e5"
    sha256 cellar: :any_skip_relocation, catalina:       "9319f301253e635c5246cf78d7adfdd9dddc8b689cfcacd551a0077d7aded643"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "83dd6236b2579e843d5aa3bdbb28582b8320c7fddbde6ebf3d593d4697fa0816"
  end

  depends_on "go" => :build

  def install
    ldflags = "-X github.com/zricethezav/gitleaks/v#{version.major}/cmd.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags)

    bash_output = Utils.safe_popen_read(bin/"gitleaks", "completion", "bash")
    (bash_completion/"gitleaks").write bash_output

    zsh_output = Utils.safe_popen_read(bin/"gitleaks", "completion", "zsh")
    (zsh_completion/"_gitleaks").write zsh_output

    fish_output = Utils.safe_popen_read(bin/"gitleaks", "completion", "fish")
    (fish_completion/"gitleaks.fish").write fish_output
  end

  test do
    (testpath/"README").write "ghp_deadbeefdeadbeefdeadbeefdeadbeefdeadbeef"
    system "git", "init"
    system "git", "add", "README"
    system "git", "commit", "-m", "Initial commit"
    assert_match(/WRN\S* leaks found: [1-9]/, shell_output("#{bin}/gitleaks detect 2>&1", 1))
    assert_equal version.to_s, shell_output("#{bin}/gitleaks version").strip
  end
end
