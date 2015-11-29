module Cursing
  class Event
    def initialize(data)
      @type = data["type"]
      data_commits = data["payload"]["commits"]
      @commits = if data_commits.nil?
                   []
                 else
                   data_commits.map { |c| Commit.new c, data["actor"]  }
                 end
    end

    def each_commit(&block)
      @commits.each(&block)
    end

    def push?
      @type == "PushEvent"
    end
  end
end
