#!/usr/bin/env ruby
#encoding: utf-8

require_relative "main.rb"
require_relative "options.rb"

trap("SIGINT"){print "\n> "}

def interactive
  options = {
    a: 2,
    n: 2,
    accuracy: 4,
    fitness: 1000.0,
    out: "png"
  }
  list = {x: [], y: []}

  print "> "
  loop do
    cmd = gets.to_s.chomp
    cmds = cmd.split

    if cmd.match /^export?/
      puts "Exporting in file out.txt..."
      list_to_txt(list[:x], list[:y], "out.txt") if export == true

    elsif cmd.match /^a(ccuracy)?/
      puts "Accuracy redefined : #{cmds[1].to_i}"
      options[:accuracy] = cmds[i].to_i

    elsif cmd.match /^f(itness)?/
      puts "Fitness redefined : #{cmds[1].to_f}"
      options[:fitness] = cmds[i].to_f

    elsif cmd.match /^o(utput)?/ and cmds[1].match(/(pdf)|(png)|(jpg)/)
      puts "Output file format : #{cmds[1]}"
      options[:out] = cmds[i]

    elsif cmd.match /^d(raw)?/
      main(nil, true, options)

    elsif cmd.match /^h(elp)?/
      puts "Commands :"
      puts "list"
      puts "add"
      puts "rm"
      puts "draw"
      puts "export"
      puts "help"
      puts "exit"

    elsif cmd.match /^m(an)?/
      exec("man ./108monstre.man")

    elsif cmd.match /(exit)|(quit)/
      exit

    elsif cmds.size > 0
      puts "'#{cmd}' : Command not found"
    end
    print "> "
  end
end
