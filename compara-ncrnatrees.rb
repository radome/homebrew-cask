#Template generated on 2017-07-12 18:40:28 +0100
#Do not edit this file. Modify the relevant config and regenerate

require 'digest'

class ComparaNcrnatrees < Formula
  url 'file://'+File.expand_path(__FILE__)
  desc 'Dependencies for the ComparaNcrnatrees formula'
  sha256 Digest::SHA256.file(File.expand_path(__FILE__)).hexdigest
  version '0.1'

  depends_on 'homebrew/science/infernal'
  depends_on 'homebrew/science/mafft'
  depends_on 'ensembl/ensembl/treebest'
  depends_on 'homebrew/science/quicktree'
  depends_on 'ensembl/ensembl/ktreedist'
  depends_on 'ensembl/ensembl/fasttree'
  depends_on 'ensembl/ensembl/cafe'
  depends_on 'ensembl/ensembl/prank'
  depends_on 'ensembl/ensembl/r2r'
  depends_on 'ensembl/ensembl/parsimonator'

  def install
    File.open('compara-ncrnatrees', 'w') { |file|
      file.write '#!/bin/sh'+"\n"
      deps.each do | dep |
        f = dep.to_formula
        file.write "echo "+[f.full_name, f.version, f.prefix].join("\t")+"\n"
      end
    }
    bin.install 'compara-ncrnatrees'
  end
end
    