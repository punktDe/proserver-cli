# ansible-init.rb
class AnsibleInit < Formula
  desc "A bash script originally written by @fnkr that lets you connect to Punkt.de Proservers"
  homepage "https://punkt.de"

  head "https://github.com/punktDe/proserver-cli", :using => :git, :tag => "main"

  url "https://github.com/punktDe/proserver-cli", :using => :git, :tag => "1.0.0"

  def install
    bin.install "proserver"
    bin.install "proserver" => "vpro"
  end

end

