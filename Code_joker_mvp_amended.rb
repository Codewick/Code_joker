# this is for develop


require 'catpix'
# require 'rainbow'
require 'terminal-table'

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
  {pun: "Puntastic", rating: 0}
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

  def list_humour_by_audience_type
    #this method allows the user to list all available humour recommended for their audience type
      #this results in listing:
        # all PUNS for WORK COLLEAGUES
        # all JOKES for STUDENTS
        # all IMAGES for MEETUPS
    # I think this method should just list the jokes / puns / images one by one, and instructs the user to e.g. "Press "n" for the next joke or "m" to go back to the main menu"
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

  def rating
    #code here to deal with ratings

  end

  def select_humour_type(jokes, puns, images)

    humour_type = " "

    rating_array = []



    until humour_type == "q" do
      puts "Select: joke (j), pun (p), image (i), or quit (q)\n"

      humour_type = gets.chomp.downcase

      _jokes = jokes
      _puns = puns
      _images = images


      case humour_type
      when "j"
          x = shuffle(_jokes, :joke)
          puts x
          puts "\n"
      when "p"
          x = shuffle(_puns, :pun)
          puts x
          puts "\n"
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
    rows << [x, rating_array[2]]
    rows << [x, rating_array[3]]
    table = Terminal::Table.new :title => "My Favourite Humour", :headings => ['Joke / Pun', 'Rating'], :rows => rows
    puts "Here are the top jokes and puns: "
    puts table

    the_user = User_copy.new("Bianca")

    puts "Ps we've saved this for you for backup under favourite_jokes.txt ;)"

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

#########PROGRAM#########

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

  funny_joke = Humour.new("funny")

  if audience == "w"
    puts ("For work collegues I'd suggest a pun. Feel free to make your own selection though.")

    funny_joke.select_humour_type(jokes, puns, images)

  elsif audience == "s"

    puts ("For students I'd suggest a joke. Feel free to make your own selection though.")

    funny_joke.select_humour_type(jokes, puns, images)

  elsif audience == "m"

    puts ("For meetups I'd suggest an image. Feel free to make your own selection though.")

    funny_joke.select_humour_type(jokes, puns, images)

  else

    puts "Sorry, that's not valid. Just select a type of instead."

    funny_joke.select_humour_type(jokes, puns, images)

  end

end
