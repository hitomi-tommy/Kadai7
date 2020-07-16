require 'webrick'
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'index.html.erb')
server.mount('/index', WEBrick::HTTPServlet::ERBHandler, 'index.html.erb')
server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')
server.mount('/cute_goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'cute_goya.rb')
server.mount('/check.cgi', WEBrick::HTTPServlet::CGIHandler, 'check.rb')
server.start
