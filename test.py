#!/usr/bin/env python
import SimpleHTTPServer
import SocketServer

PORT = 8085

Handler = SimpleHTTPServer.SimpleHTTPRequestHandler
httpd = SocketServer.TCPServer(("", PORT), Handler)

print "serving HTTP on port", PORT
httpd.serve_forever()
