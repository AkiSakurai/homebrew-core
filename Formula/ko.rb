class Ko < Formula
  desc "Build and deploy Go applications on Kubernetes"
  homepage "https://github.com/google/ko"
  url "https://github.com/google/ko/archive/v0.12.0.tar.gz"
  sha256 "cc42e9cde0b4d3380b680cf100c9be9acac67948f3dcfe65d71b87e2da797600"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "1ca6a8771a290689c23a9830ecfbd5723ff41dca9f7c53b08914ee6d0a26de37"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "cb8d9890896a0bc104bd3381379464c4b5f16052380fea21b68a953444b60c52"
    sha256 cellar: :any_skip_relocation, monterey:       "462972c0504fa68f9fe3a73ef4ad4283909889ed22e9b4ffcdc703c1e8d80bbe"
    sha256 cellar: :any_skip_relocation, big_sur:        "637db99d7c50a4b0c50eec8c9717e77433c1c58da8aa31429f958d0dedcf6330"
    sha256 cellar: :any_skip_relocation, catalina:       "848c517e5fce09ca85d667f5597763122eaac99b96f947c68ae96721be6067d9"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "2cc59404b63b754d2a8f099413daab00bc9fdb140c73aadb5ad4ae2e1cd38fcb"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/google/ko/pkg/commands.Version=#{version}")

    bash_output = Utils.safe_popen_read(bin/"ko", "completion", "bash")
    (bash_completion/"ko").write bash_output

    zsh_output = Utils.safe_popen_read(bin/"ko", "completion", "zsh")
    (zsh_completion/"_ko").write zsh_output

    fish_output = Utils.safe_popen_read(bin/"ko", "completion", "fish")
    (fish_completion/"ko.fish").write fish_output
  end

  test do
    output = shell_output("#{bin}/ko login reg.example.com -u brew -p test 2>&1")
    assert_match "logged in via #{testpath}/.docker/config.json", output
  end
end
