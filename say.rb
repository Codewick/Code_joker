require 'catpix'

puts "Hi, what's your name? "

name = gets.chomp.downcase

if name == "trent"
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
  #this will be all our other code
  puts "Hi #{name}, have a nice day :)" #this is for illustration purposes only
end
