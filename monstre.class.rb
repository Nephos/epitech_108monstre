#!/usr/bin/env ruby
#encoding: utf-8

class Monstre
  def initialize a=2, nmax=2
    @a = a
    @n = nmax
  end

  def calc x
    y = 0
    (0..(@n)).each do |k|
      y += Math.cos(@a**k * Math::PI * x) / (2**k)
    end
    return y
  end

  def do_list accuracy, rate, n, export=false
    ylist = []
    xlist = []
    x = -n
    #opti the loops
    if export == true
      while x <= n
        xlist << x
        ylist << calc(x).round(accuracy)
        x = (x + rate).round(accuracy)
      end
    else
      while x <= n
        ylist << calc(x).round(accuracy)
        x = (x + rate).round(accuracy)
      end
    end
    return {x: xlist, y: ylist}
  end
end
