class AlphaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for cross-referencing congressional trades with prediction markets"
  homepage "https://github.com/austron24/alpha-cli"
  url "https://files.pythonhosted.org/packages/b1/10/b10abfb1fe9a946ff2e3f964acd9925d83b980b10549dc5820f9a85d0153/alpha_cli-0.1.0.tar.gz"
  sha256 "06092b7db88498e7285690f1fb4a0d08d68c6efd98581f4b3e5eede194a22e97"
  license "MIT"

  depends_on "python@3.11"

  def install
    venv = virtualenv_create(libexec, "python3.11")
    venv.pip_install "alpha-cli==#{version}"
    bin.install_symlink libexec/"bin/alpha"
  end

  test do
    assert_match "alpha", shell_output("#{bin}/alpha --help")
  end
end
