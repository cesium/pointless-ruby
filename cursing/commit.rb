module Cursing
  class Commit
    attr_accessor :message, :url

    def initialize(event, actor_data)
      @message = event["message"]
      @url = event["url"]
      @actor = actor_data
      @curse_count = curse_count
    end

    def author_data
      @actor
    end

    def contains_curse?
      @curse_count > 0
    end

    def curse_count
      @message.scan(/shit/).count
    end
  end
end
