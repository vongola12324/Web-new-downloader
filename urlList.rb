#!/usr/bin/env ruby

require 'cgi'

require_relative 'setting'

conf = Setting.new("config.yml")

cgi = CGI.new

if cgi.key?("url")
  url = CGI.unescape(cgi["url"])
  if url.match(%r!^http://www.ktxp.com/[\w/=?+&]*!)
	conf['url'].push url
  else
  	puts cgi.headers
  	puts <<EOF 
  	<html>
  	<head>
  	   <script language="JavaScript" src="redirect.js"></script>
  	</head>
EOF
  end
end


