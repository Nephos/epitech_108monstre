#!/usr/bin/env ruby
#encoding: utf-8

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
    help: false,
    export: nil,
    accuracy: 4,
    display: true
  }

  ARGV.each do |arg|
    if arg.match /(^(\-)([a-z])*h([a-z]*))|(\-\-help)/
      puts "Option help"
      options[:help] = true
    end

    if arg.match /(^(\-)([a-z])*e([a-z]*))|(\-\-export)/
      puts "Option export"
      options[:export] = true
    end

    if arg.match /[-+]?([0-9]*\.[0-9]+|[0-9]+)/
      if options[:a] == nil
        options[:a] = arg.to_f
        puts "a = #{options[:a]}"
      elsif options[:n] == nil
        options[:n] = arg.to_i.abs
        puts "n = #{options[:n]}"
      end
    end

  end
  return options
end
