class Flyctl < Formula
  desc "Command-line tools for fly.io services"
  homepage "https://fly.io"
  url "https://github.com/superfly/flyctl.git",
      tag:      "v0.1.141",
      revision: "e01eaaa3bfce175252caa354bbb2a0f5558d618f"
  license "Apache-2.0"
  head "https://github.com/superfly/flyctl.git", branch: "master"

  # Upstream tags versions like `v0.1.92` and `v2023.9.8` but, as of writing,
  # they only create releases for the former and those are the versions we use
  # in this formula. We could omit the date-based versions using a regex but
  # this uses the `GithubLatest` strategy, as the upstream repository also
  # contains over a thousand tags (and growing).
  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "9fc90189fc4e2964843dd32a946ddc35b9f0e6db9946d2790f33133cc71d39d3"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "9fc90189fc4e2964843dd32a946ddc35b9f0e6db9946d2790f33133cc71d39d3"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "9fc90189fc4e2964843dd32a946ddc35b9f0e6db9946d2790f33133cc71d39d3"
    sha256 cellar: :any_skip_relocation, sonoma:         "695d30b7835b7a0a5437ac0dbceed4208b7cfbc148779c0a11f0d4f5a9fe3c39"
    sha256 cellar: :any_skip_relocation, ventura:        "695d30b7835b7a0a5437ac0dbceed4208b7cfbc148779c0a11f0d4f5a9fe3c39"
    sha256 cellar: :any_skip_relocation, monterey:       "695d30b7835b7a0a5437ac0dbceed4208b7cfbc148779c0a11f0d4f5a9fe3c39"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "0f9b271567ae2cc2b48a317f1d6179b42278a7ef1b866e4fa4025b98a798418d"
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = %W[
      -s -w
      -X github.com/superfly/flyctl/internal/buildinfo.buildDate=#{time.iso8601}
      -X github.com/superfly/flyctl/internal/buildinfo.buildVersion=#{version}
      -X github.com/superfly/flyctl/internal/buildinfo.commit=#{Utils.git_short_head}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "-tags", "production"

    bin.install_symlink "flyctl" => "fly"

    generate_completions_from_executable(bin/"flyctl", "completion")
  end

  test do
    assert_match "flyctl v#{version}", shell_output("#{bin}/flyctl version")

    flyctl_status = shell_output("#{bin}/flyctl status 2>&1", 1)
    assert_match "Error: No access token available. Please login with 'flyctl auth login'", flyctl_status
  end
end
