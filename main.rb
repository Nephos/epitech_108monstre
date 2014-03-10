#!/usr/bin/env ruby
#encoding: utf-8

require 'gruff'

class Monstre
  def initialize a=2, nmax=2
    @a = a
    @n = nmax
  end

  def calc x
    y = 0
    (1..(@n + 1)).each do |k|
      y += Math.cos(@a**k * Math::PI * x) / (2 * k)
    end
    return y
  end
end

def main_get_gruff xmin, xmax, n, resolution='1200x800'
  g = Gruff::Bezier.new(resolution.to_s)
  g.title = 'Graph of the -42'

  xmax = xmax.to_i
  xmin = xmin.to_i

  xmax_ = (xmax - xmin) * n
  xmin_ = 0

  g.labels = {
    xmin_ => xmin.to_s,
    (xmax_ + xmin_) / 2 => '0',
    (xmax_ + xmin_) + 1 => xmax.to_s,
  }
  return g
end

def main(argv)
  a = ARGV[0].to_f
  n = ARGV[1].to_i.abs
  m = Monstre.new(a, n)
  rate = n / 1000.0
  g = main_get_gruff(-n, n, 1000)

  ylist = []
  x = -n
  while x <= n
    ylist << m.calc(x)
    x += rate
  end

  g.data :monstre, ylist
  g.write("out.png")
  `eog out.png`
end
