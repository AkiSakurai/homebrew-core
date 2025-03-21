class Salt < Formula
  include Language::Python::Virtualenv

  desc "Dynamic infrastructure communication bus"
  homepage "https://saltproject.io/"
  url "https://files.pythonhosted.org/packages/c1/8b/f21efb024adbb6929cba84040882bf9fd6427fd786dd0596e7e23a9cf717/salt-3005.tar.gz"
  sha256 "1d200c45b88046178ea56fb5a75726dc620cc5e51411076a04df80ff52f79cd4"
  license "Apache-2.0"
  head "https://github.com/saltstack/salt.git", branch: "master"

  bottle do
    sha256 cellar: :any,                 arm64_monterey: "0c7f9a99c5f9fa4cbae848a7cc0f2de827b765bd4a8816863039376959a8b855"
    sha256 cellar: :any,                 arm64_big_sur:  "bc9fae87f6cca4db694466d6f6bb8f99f63ee2bff034d3cfcb55acc1174001d8"
    sha256 cellar: :any,                 monterey:       "fa2e55d86096e4c447757d2fef0668ba54b8b038736621080f22cc4bc110cbcd"
    sha256 cellar: :any,                 big_sur:        "7b25ebe778cf393f7309d7e9934c7181064ea5f917cadb2ae00372dbee4399fe"
    sha256 cellar: :any,                 catalina:       "33b45c832116f43a69569f64a5cb580c8923fb358792786e8c749bf22a47ec06"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "b334d56d14d398e44e8874962bc12f342424677ac0023cd67385c3983743ff04"
  end

  depends_on "swig" => :build
  depends_on "libgit2"
  depends_on "libyaml"
  depends_on "openssl@1.1"
  depends_on "python@3.10"
  depends_on "six"
  depends_on "zeromq"

  uses_from_macos "libffi"

  on_linux do
    depends_on "pkg-config" => :build
    depends_on "gmp"
    depends_on "pcre"
  end

  # Homebrew installs optional dependencies: pycryptodome, pygit2

  resource "apache-libcloud" do
    url "https://files.pythonhosted.org/packages/b6/a0/707142df518a602a2e36f9aa4f6dcc2cc9981843ffb7ba1207f7a084819d/apache-libcloud-2.5.0.tar.gz"
    sha256 "8f133038710257d39f9092ccaea694e31f7f4fe02c11d7fcc2674bc60a9448b6"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/07/10/75277f313d13a2b74fc56e29239d5c840c2bf09f17bf25c02b35558812c6/certifi-2022.5.18.1.tar.gz"
    sha256 "9c5705e395cd70084351dd8ad5c41e65655e08ce46f2ec9cf6c2c08390f71eb7"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/2e/92/87bb61538d7e60da8a7ec247dc048f7671afe17016cd0008b3b710012804/cffi-1.14.6.tar.gz"
    sha256 "c9a875ce9d7fe32887784274dd533c57909b7b1dcadcc128a2ac21331a9765dd"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz"
    sha256 "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
  end

  resource "cheroot" do
    url "https://files.pythonhosted.org/packages/0e/77/0f823e39f78d97706b11cefc4b95829a2ca237a3021a37a6b7ec361b2113/cheroot-8.5.2.tar.gz"
    sha256 "f137d03fd5155b1364bea557a7c98168665c239f6c8cedd8f80e81cdfac01567"
  end

  resource "CherryPy" do
    url "https://files.pythonhosted.org/packages/c6/0d/f6acfd12f098b9f05b9146b79b5a3fad02f4047a7831b5f5c9ee3fe54d56/CherryPy-18.6.1.tar.gz"
    sha256 "f33e87286e7b3e309e04e7225d8e49382d9d7773e6092241d7f613893c563495"
  end

  resource "contextvars" do
    url "https://files.pythonhosted.org/packages/83/96/55b82d9f13763be9d672622e1b8106c85acb83edd7cc2fa5bc67cd9877e9/contextvars-2.4.tar.gz"
    sha256 "f38c908aaa59c14335eeea12abea5f443646216c4e29380d7bf34d2018e2c39e"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/d4/85/38715448253404186029c575d559879912eb8a1c5d16ad9f25d35f7c4f4c/cryptography-3.3.2.tar.gz"
    sha256 "5a60d3780149e13b7a6ff7ad6526b38846354d11a15e21068e57073e29e19bed"
  end

  resource "distro" do
    url "https://files.pythonhosted.org/packages/a6/a4/75064c334d8ae433445a20816b788700db1651f21bdb0af33db2aab142fe/distro-1.5.0.tar.gz"
    sha256 "0e58756ae38fbd8fc3020d54badb8eae17c5b9dcbed388b17bb55b8a5928df92"
  end

  resource "gitdb" do
    url "https://files.pythonhosted.org/packages/d1/05/eaf2ac564344030d8b3ce870b116d7bb559020163e80d9aa4a3d75f3e820/gitdb-4.0.5.tar.gz"
    sha256 "c9e1f2d0db7ddb9a704c2a0217be31214e91a4fe1dea1efad19ae42ba0c285c9"
  end

  resource "GitPython" do
    url "https://files.pythonhosted.org/packages/ec/4d/e6553122c85ec7c4c3e702142cc0f5ed02e5cf1b4d7ecea86a07e45725a0/GitPython-3.1.12.tar.gz"
    sha256 "42dbefd8d9e2576c496ed0059f3103dcef7125b9ce16f9d5f9c834aed44a1dac"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/ad/13/eb56951b6f7950cadb579ca166e448ba77f9d24efc03edd7e55fa57d04b7/idna-2.8.tar.gz"
    sha256 "c357b3f628cf53ae2c4c05627ecc484553142ca23264e593d327bcde5e9c3407"
  end

  resource "immutables" do
    url "https://files.pythonhosted.org/packages/d5/33/1187e0fcc0a521a72234b011e06cff99f8a204e1125ea791c190bd780de7/immutables-0.15.tar.gz"
    sha256 "3713ab1ebbb6946b7ce1387bb9d1d7f5e09c45add58c2a2ee65f963c171e746b"
  end

  resource "jaraco.classes" do
    url "https://files.pythonhosted.org/packages/7b/de/28a640c17a80f5e0fab5c494679e2e66b36d7fd20622e27718bea8be34b8/jaraco.classes-3.2.1.tar.gz"
    sha256 "ed54b728af1937dc16b7236fbaf34ba561ba1ace572b03fffa5486ed363ecf34"
  end

  resource "jaraco.collections" do
    url "https://files.pythonhosted.org/packages/d9/f8/da1c43345aa1ce0a98391497719cfc80d9664727431554a6aab5328481eb/jaraco.collections-3.4.0.tar.gz"
    sha256 "344d14769d716e7496af879ac71b3c6ebdd46abc64bd9ec21d15248365aa3ac9"
  end

  resource "jaraco.functools" do
    url "https://files.pythonhosted.org/packages/a9/1e/44f6a5cffef147a3ffd37a748b8f4c2ded9b07ca20a15f17cd9874158f24/jaraco.functools-2.0.tar.gz"
    sha256 "35ba944f52b1a7beee8843a5aa6752d1d5b79893eeb7770ea98be6b637bf9345"
  end

  resource "jaraco.text" do
    url "https://files.pythonhosted.org/packages/53/d2/40ff557369eccee312b2d3ff4cb97373e8ffb25afb92294ff650a1e45795/jaraco.text-3.5.1.tar.gz"
    sha256 "ede4e9103443b62b3d1d193257dfb85aab7c69a6cef78a0887d64bb307a03bc3"
  end

  resource "Jinja2" do
    url "https://files.pythonhosted.org/packages/1f/93/99a76d0fa1a8fc14442a6421abee323f8d15964979336eabd2a1834e9118/Jinja2-3.1.0.tar.gz"
    sha256 "a2f09a92f358b96b5f6ca6ecb4502669c4acb55d8733bbb2b2c9c4af5564c605"
  end

  resource "linode-python" do
    url "https://files.pythonhosted.org/packages/4b/74/e488eb310b266e679e9e5095563be08185f2923802fb87be8f5cad652b74/linode-python-1.1.1.tar.gz"
    sha256 "5078aae54a5f6f325ac8cd47c3baa2582546d51b7060a0f9f6ad851027817bc0"
  end

  resource "Mako" do
    url "https://files.pythonhosted.org/packages/5c/db/2d2d88b924aa4674a080aae83b59ea19d593250bfe5ed789947c21736785/Mako-1.1.4.tar.gz"
    sha256 "17831f0b7087c313c0ffae2bcbbd3c1d5ba9eeac9c38f2eb7b50e8c99fe9d5ab"
  end

  resource "MarkupSafe" do
    url "https://files.pythonhosted.org/packages/bf/10/ff66fea6d1788c458663a84d88787bae15d45daa16f6b3ef33322a51fc7e/MarkupSafe-2.0.1.tar.gz"
    sha256 "594c67807fb16238b30c44bdf74f36c02cdf22d1c8cda91ef8a0ed8dabf5620a"
  end

  resource "more-itertools" do
    url "https://files.pythonhosted.org/packages/a0/47/6ff6d07d84c67e3462c50fa33bf649cda859a8773b53dc73842e84455c05/more-itertools-8.2.0.tar.gz"
    sha256 "b1ddb932186d8a6ac451e1d95844b382f55e12686d51ca0c68b6f61f2ab7a507"
  end

  resource "msgpack" do
    url "https://files.pythonhosted.org/packages/59/04/87fc6708659c2ed3b0b6d4954f270b6e931def707b227c4554f99bd5401e/msgpack-1.0.2.tar.gz"
    sha256 "fae04496f5bc150eefad4e9571d1a76c55d021325dcd484ce45065ebbdd00984"
  end

  resource "portend" do
    url "https://files.pythonhosted.org/packages/04/98/997f8668b11292f13d3e69fc626232c497228306c764523c5a3a3b59c775/portend-2.6.tar.gz"
    sha256 "600dd54175e17e9347e5f3d4217aa8bcf4bf4fa5ffbc4df034e5ec1ba7cdaff5"
  end

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/e1/b0/7276de53321c12981717490516b7e612364f2cb372ee8901bd4a66a000d7/psutil-5.8.0.tar.gz"
    sha256 "0c9ccb99ab76025f2f0bbecf341d4656e9c1351db8cc8a03ccd62e318ab4b5c6"
  end

  resource "pyasn1" do
    url "https://files.pythonhosted.org/packages/a4/db/fffec68299e6d7bad3d504147f9094830b704527a7fc098b721d38cc7fa7/pyasn1-0.4.8.tar.gz"
    sha256 "aef77c9fb94a3ac588e87841208bdec464471d9871bd5050a287cc9a475cd0ba"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/5e/0b/95d387f5f4433cb0f53ff7ad859bd2c6051051cebbb564f139a999ab46de/pycparser-2.21.tar.gz"
    sha256 "e644fdec12f7872f86c58ff790da456218b10f863970249516d60a5eaca77206"
  end

  resource "pycryptodome" do
    url "https://files.pythonhosted.org/packages/11/e4/a8e8056a59c39f8c9ddd11d3bc3e1a67493abe746df727e531f66ecede9e/pycryptodome-3.15.0.tar.gz"
    sha256 "9135dddad504592bcc18b0d2d95ce86c3a5ea87ec6447ef25cfedea12d6018b8"
  end

  resource "pycryptodomex" do
    url "https://files.pythonhosted.org/packages/f5/79/9d9206688385d1e7a5ff925e7aab1d685636256e34a409037aa7adbbe611/pycryptodomex-3.9.8.tar.gz"
    sha256 "48cc2cfc251f04a6142badeb666d1ff49ca6fdfc303fd72579f62b768aaa52b9"
  end

  resource "pygit2" do
    url "https://files.pythonhosted.org/packages/e7/8a/e52a1c8b9878e9d9743089393f8289bb9c8a81eaab722df22df46a38b9e9/pygit2-1.10.0.tar.gz"
    sha256 "7c751eee88c731b922e4e487ee287e2e40906b2bd32d0bfd2105947f63e867de"
  end

  resource "pyOpenSSL" do
    url "https://files.pythonhosted.org/packages/40/d0/8efd61531f338a89b4efa48fcf1972d870d2b67a7aea9dcf70783c8464dc/pyOpenSSL-19.0.0.tar.gz"
    sha256 "aeca66338f6de19d1aa46ed634c3b9ae519a64b458f8468aec688e7e3c20f200"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/ad/99/5b2e99737edeb28c71bcbec5b5dda19d0d9ef3ca3e92e3e925e7c0bb364c/python-dateutil-2.8.0.tar.gz"
    sha256 "c89805f6f4d64db21ed966fda138f8a5ed7a4fdbc1a8ee329ce1b74e3c74da9e"
  end

  resource "python-gnupg" do
    url "https://files.pythonhosted.org/packages/b1/90/75e15ead9693028c05fc7abd25c756c0d1da27bf04a27d6f5c4139d8ee10/python-gnupg-0.4.8.tar.gz"
    sha256 "b64de1ae5cedf872b437201a566fa2c62ce0c95ea2e30177eb53aee1258507d7"
  end

  resource "pytz" do
    url "https://files.pythonhosted.org/packages/2f/5f/a0f653311adff905bbcaa6d3dfaf97edcf4d26138393c6ccd37a484851fb/pytz-2022.1.tar.gz"
    sha256 "1e760e2fe6a8163bc0b3d9a19c4f84342afa0a2affebfaa84b01b978a02ecaa7"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/a0/a4/d63f2d7597e1a4b55aa3b4d6c5b029991d3b824b5bd331af8d4ab1ed687d/PyYAML-5.4.1.tar.gz"
    sha256 "607774cbba28732bfa802b54baa7484215f530991055bb562efbed5b2f20a45e"
  end

  resource "pyzmq" do
    url "https://files.pythonhosted.org/packages/36/80/50962c33a3ad813b086fe2bf023bb8b79cb232f8e15b1b54a4d5b05b62ff/pyzmq-23.2.0.tar.gz"
    sha256 "a51f12a8719aad9dcfb55d456022f16b90abc8dde7d3ca93ce3120b40e3fa169"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/6b/47/c14abc08432ab22dc18b9892252efaf005ab44066de871e72a38d6af464b/requests-2.25.1.tar.gz"
    sha256 "27973dd4a904a4f13b263a19c866c13b92a39ed1c964655f025f3f8d3d75b804"
  end

  resource "setproctitle" do
    url "https://files.pythonhosted.org/packages/5a/0d/dc0d2234aacba6cf1a729964383e3452c52096dc695581248b548786f2b3/setproctitle-1.1.10.tar.gz"
    sha256 "6283b7a58477dd8478fbb9e76defb37968ee4ba47b05ec1c053cb39638bd7398"
  end

  resource "smmap" do
    url "https://files.pythonhosted.org/packages/89/2f/8902ee436e7e24e059973f9d7cbc1a433df10c93239f59c1d8539a86a6a5/smmap-3.0.2.tar.gz"
    sha256 "b46d3fc69ba5f367df96d91f8271e8ad667a198d5a28e215a6c3d9acd133a911"
  end

  resource "tempora" do
    url "https://files.pythonhosted.org/packages/9e/38/69361106501ab8ca3bede11cff867ce86545461de55e65c14034c57be596/tempora-4.1.1.tar.gz"
    sha256 "c54da0f05405f04eb67abbb1dff4448fd91428b58cb00f0f645ea36f6a927950"
  end

  resource "timelib" do
    url "https://files.pythonhosted.org/packages/05/5d/fb7fb8f50c85913ee3a2b10bf21c6f85b4195223ddbe36da064932a17e9b/timelib-0.2.5.zip"
    sha256 "6ac9f79b09b63bbc07db88525c1f62de1f6d50b0fd9937a0cb05e3d38ce0af45"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/4f/5a/597ef5911cb8919efe4d86206aa8b2658616d676a7088f0825ca08bd7cb8/urllib3-1.26.6.tar.gz"
    sha256 "f57b4c16c62fa2760b7e3d97c35b255512fb6b59a259730f36ba32ce9f8e342f"
  end

  resource "vultr" do
    url "https://files.pythonhosted.org/packages/ea/87/abe6e282bb4797f37fba197f0bd61f8d05f4f0b1158931124837e5ea1cff/vultr-1.0.1.tar.gz"
    sha256 "3f38849d267808c02fb2b2d9d2e394cb0be5b2d5b422b34bda01c4544060de1b"
  end

  resource "zc.lockfile" do
    url "https://files.pythonhosted.org/packages/11/98/f21922d501ab29d62665e7460c94f5ed485fd9d8348c126697947643a881/zc.lockfile-2.0.tar.gz"
    sha256 "307ad78227e48be260e64896ec8886edc7eae22d8ec53e4d528ab5537a83203b"
  end

  def install
    ENV["SWIG_FEATURES"]="-I#{Formula["openssl@1.1"].opt_include}"

    virtualenv_install_with_resources

    prefix.install libexec/"share" # man pages
    (etc/"saltstack").install (buildpath/"conf").children # sample config files
  end

  def caveats
    <<~EOS
      Sample configuration files have been placed in #{etc}/saltstack.
      Saltstack will not use these by default.
    EOS
  end

  service do
    run [opt_bin/"salt-minion", "--config-dir=#{etc}/saltstack", "--pid-file=#{var}/run/salt-minion.pid"]
    log_path var/"log/salt-minion.log"
    error_log_path var/"log/salt-minion.log"
  end

  test do
    output = shell_output("#{bin}/salt --config-dir=#{testpath} --log-file=/dev/null --versions")
    assert_match "Salt: #{version}", output
    assert_match "Python: #{Formula["python@3.10"].version}", output
    assert_match "libgit2: #{Formula["libgit2"].version}", output
    assert_match "M2Crypto: Not Installed", output
  end
end
