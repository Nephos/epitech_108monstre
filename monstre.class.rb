#!/usr/bin/env ruby
#encoding: utf-8

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
