#!/usr/bin/env ruby
#encoding: utf-8

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
  help = options[:help]
  export = options[:export]
  accuracy = options[:accuracy]
  display = options[:display]

  m = Monstre.new(a, n)
  rate = (n / 1000.0).round(accuracy)
  g = main_get_gruff(-n, n, 1000)

  ylist = []
  xlist = []
  x = -n

  #opti the loops
  if export == true
    while x <= n
      xlist << x
      ylist << m.calc(x).round(accuracy)
      x = (x + rate).round(accuracy)
    end
  else
    while x <= n
      ylist << m.calc(x).round(accuracy)
      x = (x + rate).round(accuracy)
    end
  end

  g.data :monstre, ylist
  g.write("out.png")
  list_to_txt(xlist, ylist, "out.txt") if export == true
  `eog out.png` if display == true
end
