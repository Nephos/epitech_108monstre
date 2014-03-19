#!/usr/bin/env ruby
#encoding: utf-8

require 'myerror'
require_relative 'interactif.rb'
require_relative 'main.rb'

if ARGV.select{|s| s.to_s.match /(^\-h)|(^\-\-help)/}.size > 0
  exec("man ./108monstre.man")
elsif ARGV.size == 1
  MyError::Error.call "Not enough arguments"
elsif ARGV.size == 0
  interactive
else
  main(ARGV)
end
