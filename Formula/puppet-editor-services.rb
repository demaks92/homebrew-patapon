class PuppetEditorServices < Formula
  homepage "https://github.com/elky92/puppet-editor-services"
  url "https://github.com/elky92/puppet-editor-services/archive/refs/tags/1.4.0.tar.gz"
  sha256 "71dd0e9d4fcdd1c550bcd8e55736af034a6568e9ede846902d0cbd6b11a1f9e5"

  def install
   resources.each do |r|
      r.stage(buildpath/r.name)
    end

    ENV["GEM_HOME"] = buildpath/"gem_home"
    cd buildpath do
      system "bundle", "install"
      system "bundle", "exec", "rake", "gem_revendor"
    end

    bin.install "bin/puppet-debugserver"
    bin.install "bin/puppet-languageserver"
    bin.install "bin/puppet-languageserver-sidecar"

    %w[dsp lsp puppet-debugserver puppet-languageserver puppet-languageserver-sidecar puppet_debugserver.rb puppet_editor_services puppet_editor_services.rb puppet_languageserver.rb puppet_languageserver_sidecar.rb vendor].each do |file|
      (lib/"puppet-editor-services").install "lib/#{file}"
    end
  end

  test do
    ENV.prepend_path "PATH", gem_home/"bin"
    system "ruby", "puppet-languageserver"
  end
end