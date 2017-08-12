# this is for develop


require 'catpix'
require 'rainbow'
require 'terminal-table'
require 'artii'
require 'colorize'

jokes = [
  {joke: "Not everything in programming is #000 and #fff", rating: 0},
  {joke: "Haha funny joke here", rating: 0},
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
  {pun: "Why did the programmer quit his job? He didn't get arrays.", rating: 0},
  {pun: "Puntastic", rating: 0},
  {pun: "pun1", rating: 0},
  {pun: "pun2", rating: 0},
  {pun: "pun3", rating: 0},
  {pun: "pun4", rating: 0},
  {pun: "pun5", rating: 0},
  {pun: "pun6", rating: 0},
  {pun: "pun7", rating: 0},
  {pun: "pun8", rating: 0}
]

images = [
  {image: "1.jpg", rating: 0},
  {image: "2.jpg", rating: 0}
]

#########CLASSES#########


class Audience
  def initialize(audience_type)
    @audience_type = audience_type
  end

  def list_humour(jokes, puns, images)
    choice = "n"
    i = 0
    while choice == "n" do
      case @audience_type
      when "w"
        puts puns[i].first[1]
        puts
      when "s"
        puts jokes[i].first[1]
        puts
      when "m"
        puts images[i].first[1]
        Catpix::print_image "#{images[i].first[1]}",
          :limit_x => 1.0,
          :limit_y => 1.0,
          :center_x => true,
          :center_y => true,
          :bg => "white",
          :bg_fill => true
      end
      i = i + 1
      puts "Press (n) for the next joke or (q) to quit"
      choice = gets.chomp.downcase
      puts
    end
  end


end

class Humour
  def initialize(type_of_humour)
    @type_of_humour = type_of_humour  #joke, pun, image
  end

  def shuffle(array, key)
    #code here to shuffle array of jokes / puns / images
    array.shuffle!.find { |hash|
      hash.keys.include?(key)
    }.values.first
  end

  def select_humour_type(jokes, puns, images)

    humour_type = " "

    rating_array = []
    list_jokes = []
    until humour_type == "q" do
      puts "Select: joke (j), pun (p), image (i), or quit (q)\n"

      humour_type = gets.chomp.downcase

      _jokes = jokes
      _puns = puns
      _images = images


      case humour_type
      when "j"
          x = shuffle(_jokes, :joke)
          puts x.colorize(:color => :white, :background => :black)
          puts "\n"
          list_jokes << x
      when "p"
          x = shuffle(_puns, :pun)
          puts x.colorize(:color => :white, :background => :black)
          puts "\n"
          list_jokes << x
      when "i"
          image_name = shuffle(_images, :image)

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

      puts "\nHow did you find this joke? Please enter a rating from 1 - 5 ?"
      rating = gets.chomp.to_i
      rating_array << rating

    end

    rating_array.sort
    rows = []
    rows << [list_jokes[0], rating_array[0]]
    rows << [list_jokes[1], rating_array[1]]
    rows << [list_jokes[2], rating_array[2]]
    rows << [list_jokes[3], rating_array[3]]
    table = Terminal::Table.new :title => "My Favourite Humour", :headings => ['Joke / Pun', 'Rating'], :rows => rows
    puts "Here are the top jokes and puns: "
    puts table

    the_user = User_copy.new("Bianca")

    puts Rainbow("Ps we've saved this for you for backup under favourite_jokes.txt ;)").orange

    the_user.save_to_text(table)


  end

end

class User_copy
  def initialize(user_name)
    @user_name = user_name
  end

  attr_accessor :user_name

  def save_to_text(table)
    #save user's favourite humour (highest rated during session) to a .txt file
    File.open("favourite_jokes.txt", "w") { |file| file.write("Hi #{user_name}!
    Here are your jokes \n #{table}") }
  end


end

#########METHOD#########

def animation
  i = 1
  while i < 12
    print "\033[2J"
    File.foreach("ascii_animation/#{i}.rb") { |f| puts f }
    sleep(0.3)
    i += 1
  end
end

#########PROGRAM#########

# animation

a = Artii::Base.new :font => 'slant'
puts a.asciify('WELCOME TO')

b = Artii::Base.new :font => 'slant'
puts b.asciify('CODE JOKER')

puts Rainbow("\nHey there coder! What's your name?").green

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


  puts Rainbow("\nHi #{coder_name}, what's your audience? Select: work collegues (w), students (s), or meetup peeps (m) ").blue

  audience = gets.chomp.downcase
  puts
  funny_joke = Humour.new("funny")
  audience1 = Audience.new(audience)

  puts "Do you want a list all available humour in the given category? Select: yes (y) or no (n)"
  answer = gets.chomp.downcase
  puts
  if answer == "y"
    audience1.list_humour(jokes, puns, images)
  else
    if audience == "w"

      puts Rainbow("\nFor work collegues I'd suggest a pun. Enter (l) to list all puns or
      feel free to make your own selection.").red

      funny_joke.select_humour_type(jokes, puns, images)

    elsif audience == "s"

      puts Rainbow("\nFor students I'd suggest a joke. Feel free to make your own selection though.").red
      funny_joke.select_humour_type(jokes, puns, images)

    elsif audience == "m"

      puts Rainbow("\nFor meetups I'd suggest an image. Feel free to make your own selection though.").red
      funny_joke.select_humour_type(jokes, puns, images)

    else

      puts "\nSorry, that's not valid. Just select a type of instead."
      funny_joke.select_humour_type(jokes, puns, images)

    end
  end
end
