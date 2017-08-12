
require 'catpix'
require 'rainbow'
require 'terminal-table'

class Audience
  def initialize(audience_type)
    @audience_type = audience_type
  end

  attr_accessor :audience_type

  def display_humour

    case @audience_type
    when "w"
      puts "Test"
    when "s"

    when "m"

    end

  end
end

class Humour
  def initialize(humour_type)
    @humour_type = humour_type
  end

  attr_accessor :humour_type

  def display_humour
    case @humour_type
    when "p"

    when "j"

    when "i"

    end
  end
end



class Creator
  def initialize(humour_type)
    @humour_type = humour_type
  end

  attr_accessor :humour_type

  def provide_humour

    jokes = [
      {joke: "Not everything in programming is #000 and #fff" rating: 0},
      {joke: "Haha funny joke here".blue, rating: 0},
      {joke: "joke1", rating: 0},
      {joke: "joke2", rating: 0},
      {joke: "joke3", rating: 0},
      {joke: "joke4", rating: 0},
      {joke: "joke5", rating: 0},
      {joke: "joke6", rating: 0},
      {joke: "joke7", rating: 0},
      {joke: "joke8", rating: 0}
    ]
    puns = [
      {pun: Rainbow("Why did the programmer quit his job? He didn't get arrays.").green, rating: 0},
      {pun: Rainbow("Puntastic").green, rating: 0}
    ]

    images = [
      {image: "1.jpg", rating: 0},
      {image: "2.jpg", rating: 0}
    ]

    case @humour_type
    when "j"
        jokes.shuffle!
        x = jokes.find { |hash|
          hash.keys.include?(:joke)
        }.values.first
        return x
    when "p"
        puns.shuffle!
        x = puns.find { |hash|
          hash.keys.include?(:pun)
        }.values.first
        return x
    when "i"
        images.shuffle!
        x = images.find { |hash|
          hash.keys.include?(:image)
        }.values.first
        return x
        # Catpix::print_image "#{image_name}",
        #   :limit_x => 1.0,
        #   :limit_y => 1.0,
        #   :center_x => true,
        #   :center_y => true,
        #   :bg => "white",
        #   :bg_fill => true
      end
  end

end

puts "Hey there coder! What's your name?"
coder_name = gets.chomp.downcase

puts "Hi #{coder_name}, what's your audience? Select: work collegues (w), students (s), or meetup peeps (m) "
audience = gets.chomp.downcase

aud = Audience.new(audience)
aud.display_humour








#     >> puts array
# {"name"=>"Shakhi", "age"=>143}
# {}
# => nil
# >> pust array[0]
# NoMethodError: undefined method `pust' for main:Object
# Did you mean?  puts
# 	from (irb):6
# 	from /usr/local/bin/irb:11:in `<main>'
# >> puts array[0]
# {"name"=>"Shakhi", "age"=>143}
# => nil
# >> puts array[0]['name']
# Shakhi
