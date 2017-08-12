require 'catpix'
require 'rainbow'
require 'terminal-table'

jokes = [
  {joke: Rainbow("Not everything in programming is #000 and #fff").blue, rating: 0},
  {joke: Rainbow("Haha funny joke here").blue, rating: 0},
  {joke: Rainbow("joke1").blue, rating: 0},
  {joke: Rainbow("joke2").blue, rating: 0},
  {joke: Rainbow("joke3").blue, rating: 0},
  {joke: Rainbow("joke4").blue, rating: 0},
  {joke: Rainbow("joke5").blue, rating: 0},
  {joke: Rainbow("joke6").blue, rating: 0},
  {joke: Rainbow("joke7").blue, rating: 0},
  {joke: Rainbow("joke8").blue, rating: 0}
]

puns = [
  {pun: Rainbow("Why did the programmer quit his job? He didn't get arrays.").green, rating: 0},
  {pun: Rainbow("Puntastic").green, rating: 0}
]

images = [
  {image: "1.jpg", rating: 0},
  {image: "2.jpg", rating: 0}
]

###METHODS###

def select_humour_type(jokes, puns, images)

  humour_type = " "

  rating_array = []

  _jokes = jokes
  _puns = puns
  _images = images

  until humour_type == "q" do
    puts "Select: joke (j), pun (p), image (i), or quit (q)\n"

    humour_type = gets.chomp.downcase

    case humour_type
    when "j"
        _jokes.shuffle!
        x = _jokes.find { |hash|
          hash.keys.include?(:joke)
        }.values.first
        puts x
        puts "\n"
    when "p"
        _puns.shuffle!
        x = _puns.find { |hash|
          hash.keys.include?(:pun)
        }.values.first
        puts y
        puts "\n"
    when "i"
        _images.shuffle!
        puts _images.find { |hash|
          hash.keys.include?(:image)
        }.values.first

        Catpix::print_image "#{image_name}",
          :limit_x => 1.0,
          :limit_y => 1.0,
          :center_x => true,
          :center_y => true,
          :bg => "white",
          :bg_fill => true

    when "q"
      puts "\n"
      puts "Bye!"
      puts "\n"
      break

    else
        puts "thats not valid try again"
    end

    puts "\n"
    puts "How did you find this joke? Please enter a rating from 1 - 5 ?"
    puts "\n"
    rating = gets.chomp.to_i
    rating_array << rating

  end

  rating_array.sort
  rows = []
  rows << [x, rating_array[0]]
  rows << [x, rating_array[1]]
  rows << [y, rating_array[2]]
  rows << [y, rating_array[3]]
  table = Terminal::Table.new :rows => rows
  puts "Here are the top jokes and puns: "
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
    puts Rainbow("For work collegues I'd suggest a pun. Feel free to make your own selection though.").red

    select_humour_type(jokes, puns, images)

  elsif audience == "s"

    puts Rainbow("For students I'd suggest a joke. Feel free to make your own selection though.").red

    select_humour_type(jokes, puns, images)

  elsif audience == "m"

    puts Rainbow("For meetups I'd suggest an image. Feel free to make your own selection though.").red

    select_humour_type(jokes, puns, images)

  else

    puts "Sorry, that's not valid. Just select a type of instead."

    select_humour_type(jokes, puns, images)

  end

end
