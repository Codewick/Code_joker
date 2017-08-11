require 'catpix'
require 'terminal-table'

###METHODS###
def jokes
  jokes = [
    {joke: "Not everything in programming is #000 and #fff", rating: 0},
    {joke: "Haha funny joke here", rating: 0}
  ]
end

def puns
  puns = [
    {pun: "Why did the programmer quit his job? He didn't get arrays.", rating: 0},
    {pun: "Puntastic", rating: 0}
  ]
end

def images
  images = [
    {image: "1.jpg", rating: 0},
    {image: "2.jpg", rating: 0}
  ]
end

def select_humour_type
  humour_type = " "
  if humour_type != "q"
    puts "Select: joke (j), pun (p), image (i), or quit (q)"

    humour_type = gets.chomp.downcase

    case humour_type
    when "j"
        jokes.shuffle!
        jokes.pop
        puts jokes.find { |hash| hash.keys.include?(:joke)}.values.first
    when "p"
        puns.shuffle!
        puns.pop
        puts puns.find { |hash| hash.keys.include?(:pun)}.values.first
    when "i"
        images.shuffle!
        images.pop
        image_name = images.find { |hash| hash.keys.include?(:image)}.values.first

        Catpix::print_image "#{image_name}",
          :limit_x => 1.0,
          :limit_y => 1.0,
          :center_x => true,
          :center_y => true,
          :bg => "white",
          :bg_fill => true

    else
        puts "thats not valid try again"
    end

  else
    abort

  end

end

def enter_rating
  puts "How did you find this joke? Please enter a rating from 1 - 5 ?"
  rating = gets.chomp.to_i
  @rating_array << rating
end

def display_rating
  @rating_array.sort
  rows = []
  rows << ["joke1", @rating_array[0]]
  rows << ["joke1", 2]
  table = Terminal::Table.new :rows => rows
  puts table
end


####PROGRAM####

puts "Hey there coder! What's your name?"

coder_name = gets.chomp.downcase

if coder_name == "trent"
  Catpix::print_image "rick_astley.jpg",
    :limit_x => 1.0,
    :limit_y => 1.0,
    :center_x => true,
    :center_y => true,
    :bg => "white",
    :bg_fill => true

  `say "You have been rick rolled"`

  `afplay -t 35 /Users/bianca/Desktop/code_joker_files/audio/rick_astley.mp3`
else


  puts "Hi #{coder_name}, what's your audience? Select: work collegues (w), students (s), or meetup peeps (m) "

  audience = gets.chomp.downcase

  if audience == "w"
    puts "For work collegues I'd suggest a pun. Feel free to make your own selection though."

    select_humour_type

  elsif audience == "s"

    puts "For students I'd suggest a joke. Feel free to make your own selection though."

    select_humour_type

  elsif audience == "m"

    puts "For meetups I'd suggest an image. Feel free to make your own selection though."

    select_humour_type

  else

    puts "Sorry, that's not valid. Just select a type of instead."

    select_humour_type

  end

end
