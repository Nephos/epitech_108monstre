#!/usr/bin/env ruby
#encoding: utf-8

require 'myerror'
require_relative 'main.rb'

if ARGV[0].to_s.match /(^\-h)|(^\-\-help)/
  exec("man ./108monstre.man")
else
  MyError::Error.call "Not enough arguments" if ARGV.size < 2
  main(ARGV)
end
