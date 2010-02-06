rule /\.css$/ => [lambda do |css|
    File.join(File.dirname(css), "sass", File.basename(css).sub(/\.css$/, '.sass'))
end] do |t|
    sh "sass #{t.source} #{t.name}"
end
