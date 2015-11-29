require './alien'

class Neptunian < Alien
  attr_accessor :personality
  PLANET = "Neptune"
  @@count = 0

  def initialize(name, personality)
    super(name, PLANET)
    @personality = personality
    @@count += 1
  end

  def speak
    puts "Hi I'm #{super.name}"
    puts super.speak
  end

  def self.count
    @@count
  end
end
