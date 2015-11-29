class Alien
  attr_accessor :name
  attr_reader :planet

  def initialize(name, planet)
    @name = name
    @planet = planet
  end

  def speak
    case @planet
    when "Neptune"
      "I'm so happy!"
    when "Mars"
      ":("
    else
      "lol"
    end
  end

end
