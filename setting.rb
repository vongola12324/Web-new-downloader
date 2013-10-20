#!/usr/bin/env ruby

require 'yaml'
require 'erb'

class Setting < Hash
  def initialize(fileOrHash = nil)
	case fileOrHash
	when nil
	  hash = {}
    when Hash
      self.replace fileOrHash
    else
	  fileContents = open(fileOrHash).read
      hash = fileContents.empty? ? {} : YAML.load(ERB.new(fileContents).result).to_hash
	end
	self.replace hash
  end
  def [](key)
    fetch(key.to_s, nil)
  end
  def []=(key, val)
	val = self.class.new(val, @section) if val.is_a? Hash
    store(key.to_s, val)
  end
  def save(name)
	File.write(name, Hash[self].to_yaml)
  end
private
  def missing_method(name, *args, &block)
  	if key? name.to_s
  	  fetch(name.to_s)
	else
	  super
	end
  end
end

