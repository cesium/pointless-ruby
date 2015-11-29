require 'open-uri'
require 'zlib'
require 'yajl'
require './commit'
require './author'
require './event'

module Cursing
  class App
    def initialize
      @curses = {}
    end

    def parse(h)
      Yajl::Parser.parse(read_json h) do |e|
        yield Event.new(e)
      end
    end

    def run
      (0..23).each do |h|
        parse(h) do |event|
          event.each_commit { |c| parse_commit(c) } if event.push?
        end
      end

      self.print
    end

    protected

    def read_json(h)
      data = open("http://data.githubarchive.org/2015-08-03-#{h}.json.gz")
      Zlib::GzipReader.new(data).read
    end

    def parse_commit(c)
      add_author(c) if c.contains_curse?
    end

    def add_author(c)
      a = Author.new(c.author_data)
      u = @curses[a.username] || a
      u.add_commit(c)
      @curses[u.username] = u
    end

    def print
      @curses.values.sort { |x, y| y <=> x }.each do |u|
        puts "#{u.username}: #{u.curse_count}"
      end
    end
  end
end

Cursing::App.new.run if __FILE__ == $0
