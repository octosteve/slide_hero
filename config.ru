use Rack::Static, 
  :urls => ["/images", "/js", "/css", "/lib", "/plugin"],
  :root => ".tmp"

run lambda { |env|
  [
    200, 
    {
      'Content-Type'  => 'text/html', 
      'Cache-Control' => 'public, max-age=86400' 
    },
    File.open('.tmp/index.html', File::RDONLY)
  ]
}
