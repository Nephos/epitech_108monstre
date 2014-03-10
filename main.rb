#!/usr/bin/env ruby
#encoding: utf-8

require 'myerror'
require 'gruff'
require_relative 'monstre.class'
require_relative 'options'

def main_get_gruff xmin, xmax, n, resolution='1200x800'
  g = Gruff::Bezier.new(resolution.to_s)
  g.title = 'Graph of the -42'

  xmax = xmax.to_i
  xmin = xmin.to_i

  xmax_ = (xmax - xmin) * (n / 2)
  xmin_ = 0

  g.labels = {
    xmin_ => xmin.to_s,
    (xmax_ + xmin) / 2  => '0',
    (xmax_ + xmin_) - 1 => xmax.to_s,
  }
  return g
end

def main(argv)
  options = main_read_options(argv)
  a = options[:a]
  n = options[:n]
  export = options[:export]
  accuracy = options[:accuracy] + 1
  display = options[:display]
  fitness = options[:fitness]

  MyError::Error.call "No n specified" if n == nil
  MyError::Error.call "No a specified" if a == nil

  m = Monstre.new(a, n)
  rate = (n.to_f / fitness).round(accuracy)
  g = main_get_gruff(-n, n, fitness.to_i)

  list = m.do_list(accuracy, rate, n, export)
  g.data :monstre, list[:y]
  g.write("out.png")
  list_to_txt(list[:x], list[:y], "out.txt") if export == true
  `eog out.png` if display == true
end
