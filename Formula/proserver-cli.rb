# proserver-cli.rb
class ProserverCli < Formula
  desc "A bash script originally written by @fnkr that lets you connect to Punkt.de Proservers"
  homepage "https://punkt.de"

  head "https://github.com/punktDe/proserver-cli", :using => :git, :branch => "main"

  url "https://github.com/punktDe/proserver-cli", :using => :git, :tag => "1.0.1"

  def install
    bin.install "proserver"
    bin.install_symlink bin/"proserver" => "vpro"
  end

end
