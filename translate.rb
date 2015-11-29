str = "Je n'ais pas d'épouse. Je n'ais pais d'es enfants."

dictionary = {
  "Je n'ais pas d'épouse" => "I don't have a wife",
  "Je n'ais pais d'es enfants" => "I don't have kids"
}

dictionary.each do |key, value|
  puts str.gsub! key, value
end

