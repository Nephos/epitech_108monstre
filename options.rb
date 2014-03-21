#!/usr/bin/env ruby
#encoding: utf-8

REGEX_FLOAT = /^[-+]?([0-9]*\.[0-9]+|[0-9]+)/

def list_to_txt xlist, ylist, name
  f = File.open(name.to_s, "w")
  puts "Write the list to #{name}"

  size = [xlist.size, ylist.size].max
  size.times do |i|
    f << "#{xlist[i]};#{ylist[i]}\n"
  end

  f.close
end

def main_read_options(argv)
  options = {
    a: nil,
    n: nil,
    export: nil,
    accuracy: 4,
    display: true,
    fitness: 1000.0,
    out: "png",
    title: "Graph of the -42"
  }

  max = ARGV.size
  i = 0
  while i < max do
    arg = ARGV[i].to_s
    arg2 = ARGV[i + 1].to_s

    if arg.match /(^(\-)([a-z])*e[a-z]*)|(^\-\-export)/
      puts "Option export"
      options[:export] = true
    end

    if arg.match /(^\-\-nodisplay)/
      puts "Option no display"
      options[:display] = false
    end

    if arg.match /(^(\-)([a-z])*a)|(^\-\-accuracy)/ and arg2.match(REGEX_FLOAT)
      puts "Option accuracy"
      options[:accuracy] = arg2.to_i
      i += 1
    end

    if arg.match /(^(\-)([a-z])*t)|(^\-\-title)/ # check if arg2 exists
      puts "Option title"
      options[:title] = arg2.to_s
      i += 1
    end

    if arg.match /(^(\-)([a-z])*f)|(^\-\-fitness)/ and arg2.match(REGEX_FLOAT)
      puts "Option fitness"
      options[:fitness] = arg2.to_f
      i += 1
    end

    if arg.match /(^(\-)([a-z])*o)|(^\-\-out)|(^\-\-output)/ and arg2.match(/(pdf)|(png)|(jpg)/)
      puts "Option format #{arg2}"
      options[:out] = arg2
      i += 1
    end

    if arg.match(REGEX_FLOAT)
      if options[:a] == nil
        options[:a] = arg.to_f
        puts "a = #{options[:a]}"
      elsif options[:n] == nil
        options[:n] = arg.to_i.abs
        puts "n = #{options[:n]}"
      end
    end

    i += 1

  end
  return options
end
