#!/usr/bin/env ruby

require 'yaml'
require 'cgi'

cgi = CGI.new

if cgi.key?("url")
  url = cgi["url"]
end
