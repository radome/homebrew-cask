#Template generated on 2018-11-19 17:11:02 +0000
#Do not edit this file. Modify the relevant config and regenerate

require 'digest'

class WebBase < Formula
  url 'file://'+File.expand_path(__FILE__)
  desc 'Dependencies for the WebBase formula'
  sha256 Digest::SHA256.file(File.expand_path(__FILE__)).hexdigest
  version '5'

  depends_on 'gcc'
  depends_on 'ensembl/web/perl'
  depends_on 'python'
  depends_on 'jdk@8'
  depends_on 'git'
  depends_on 'cmake' => ["without-docs"]
  depends_on 'fontconfig' => ["without-docs"]
  depends_on 'cpanm'
  depends_on 'ensembl/web/nginx-full' => ["set-misc-module"]

  def install
    File.open('web-base', 'w') { |file|
      file.write '#!/bin/sh'+"\n"
      deps.each do | dep |
        f = dep.to_formula
        file.write "echo "+[f.full_name, f.version, f.prefix].join("\t")+"\n"
      end
    }
    bin.install 'web-base'
  end
end
    