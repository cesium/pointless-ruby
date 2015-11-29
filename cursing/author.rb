module Cursing
  class Author
    attr_accessor :username, :url, :avatar
    attr_reader :commits

    def initialize(data)
      @username = data["login"]
      @url = data["html_url"]
      @avatar = data["avatar_url"]
      @commits = []
    end

    def add_commit(c)
      @commits << c
    end

    def <=>(a)
      curse_count <=> a.curse_count
    end

    def curse_count
      @commits.inject(0) { |s, c| s + c.curse_count }
    end
  end
end
