#!/usr/bin/env ruby
#encoding: utf-8

require 'myerror'
require_relative 'main.rb'

MyError::Error.call "Not enough arguments" if ARGV.size < 2
main(ARGV)
