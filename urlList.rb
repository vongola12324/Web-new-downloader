#!/usr/bin/env ruby

require 'cgi'

require 'setting'

cgi = CGI.new

if cgi.key?("url")
  url = cgi["url"]
end
