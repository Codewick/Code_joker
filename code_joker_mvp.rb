# this is for develop

#########RUBY GEMS#########

require 'catpix'
require 'rainbow'
require 'terminal-table'
require 'artii'
require 'colorize'


#########ARRAYS#########

jokes = [
  {joke: "Not everything in programming is #000 and #fff", rating: 0},
  {joke: "If you give someone a program, you will frustrate them for a day; if you teach them how to program, you will frustrate them for a lifetime.", rating: 0},
  {joke: "Q: How many programmers does it take to change a light bulb?\nA: None – It’s a hardware problem", rating: 0},
  {joke: "Q: What do you call it when a programmer throws up at IHOP?\nA: A stack overflow.", rating: 0},
  {joke: "Q: Why did the functions stop calling each other?\nA: Because they had constant arguments", rating: 0},
  {joke: "['hip','hip']\n(hip hip array!)", rating: 0},
  {joke: "Q: What is the most used language in programming?\nA: Profanity.", rating: 0},
  {joke: "Q: Why is it that women find C to be more attractive than Java?\nA: Because C doesn’t treat them like objects.", rating: 0},
  {joke: "Q: What do you call a collection that has no methods and doesn’t do anything?\nA: A listless list", rating: 0}
]

puns = [
  {pun: "Why did the programmer quit his job? He didn't get arrays.", rating: 0},
  {pun: "Never blow bubbles and ask a programmer to sort them, they will end up popping every one", rating: 0},
  {pun: "To understand what recursion is, you must first understand recursion", rating: 0},
  {pun: "ASCII stupid question, get a stupid ANSI", rating: 0},
  {pun: "Technically speaking a programmer's favourite subject with his boss is usually arrays.", rating: 0},
  {pun: "A foo walks into a bar, takes a look around and says: 'Hello world!'", rating: 0},
  {pun: "There are no shortcuts in life, unless you right click and find one...", rating: 0},
  {pun: "Q: How many bits of bait does a programmer need to go fishing?\nA: At least 8, or else the fish won’t byte", rating: 0},
  {pun: "Programmer.\nA person who fixed a problem that you don't know you have, in a way you don't understand", rating: 0}

]

images = [
  {image: "images/1.jpg", rating: 0},
  {image: "images/2.jpg", rating: 0},
  {image: "images/3.jpg", rating: 0},
  {image: "images/4.jpg", rating: 0},
  {image: "images/5.jpg", rating: 0},
  {image: "images/6.jpg", rating: 0},
  {image: "images/7.jpg", rating: 0},
  {image: "images/8.jpg", rating: 0},
  {image: "images/9.jpg", rating: 0},
  {image: "images/10.jpg", rating: 0},
  {image: "images/11.jpg", rating: 0}
]


#########CLASSES#########

class Audience
  def initialize(audience_type)
    @audience_type = audience_type
  end

  def list_humour(jokes, puns, images)
    choice = "n"
    i = 0
    while choice == "n" && i < 9 do         #FIXME: i < length of array (needs to work for both puns and jokes arrays)
      case @audience_type
      when "w"
        puts puns[i].first[1].colorize(:color => :white, :background => :black)
        puts
      when "s"
        puts jokes[i].first[1].colorize(:color => :white, :background => :black)
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

  def select_humour_type(jokes, puns, images, coder_name)

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

      # Only put text-based humour into table & favourite_jokes.txt
      if humour_type != "i"
        rating_array << rating
      end

    end

    rating_array.sort
    rows = []
    rows << [list_jokes[0], rating_array[0]]
    rows << [list_jokes[1], rating_array[1]]
    rows << [list_jokes[2], rating_array[2]]
    rows << [list_jokes[3], rating_array[3]]
    rows << [list_jokes[4], rating_array[4]]
    rows << [list_jokes[5], rating_array[5]]
    rows << [list_jokes[6], rating_array[6]]
    table = Terminal::Table.new :title => "My Favourite Humour", :headings => ['Joke / Pun', 'Rating'], :rows => rows
    puts "Here are the jokes and puns you've seen: "
    puts table

    the_user = User.new("#{coder_name}")

    puts Rainbow("Ps we've saved this for you for backup under favourite_jokes.txt ;)").orange

    the_user.save_to_text(table)


  end

end

class User
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

# Prints animation
animation

# Prints welcome message
a = Artii::Base.new :font => 'slant'
puts a.asciify('WELCOME TO')

b = Artii::Base.new :font => 'slant'
puts b.asciify('CODE JOKER')

# Asks for and stores user's name
puts Rainbow("\nHey there coder! What's your name?").green

coder_name = gets.chomp.downcase

# If user is "Trent", activates Easter Egg
if coder_name == "trent"
  Catpix::print_image "rick_astley.jpg",
    :limit_x => 1.0,
    :limit_y => 1.0,
    :center_x => true,
    :center_y => true,
    :bg => "white",
    :bg_fill => true

  `say "You have been rick rolled"`

  `afplay -t 35 /Users/bianca/Desktop/code_joker/audio/rick_astley.mp3`

# Main program
else

  coder_name = coder_name.capitalize

  # Asks user to choose a target audience
  puts Rainbow("\nHi #{coder_name}, what's your audience? Select: work collegues (w), students (s), or meetup peeps (m) ").blue

  audience = gets.chomp.downcase
  puts
  funny_joke = Humour.new("funny")
  audience1 = Audience.new(audience)

  # User can choose between listing all available humour recommended for category or going to main menu
  puts "Do you want a list all available humour in the given category? Select: yes (y) or no (n)"
  answer = gets.chomp.downcase
  puts

  if answer == "y"
    # Lists all available humour recommended for chosen audience, one by one (press "n" to get next)
    audience1.list_humour(jokes, puns, images)

  else
    # Suggests a type of humour for each audience type

    if audience == "w"

      puts Rainbow("\nFor work collegues I'd suggest a pun. Feel free to make your own selection though.").red

      funny_joke.select_humour_type(jokes, puns, images, coder_name)

    elsif audience == "s"

      puts Rainbow("\nFor students I'd suggest a joke. Feel free to make your own selection though.").red
      funny_joke.select_humour_type(jokes, puns, images, coder_name)

    elsif audience == "m"

      puts Rainbow("\nFor meetups I'd suggest an image. Feel free to make your own selection though.").red
      funny_joke.select_humour_type(jokes, puns, images, coder_name)

    else

      puts "\nSorry, that's not valid. Just select a type of instead."
      funny_joke.select_humour_type(jokes, puns, images, coder_name)

    end
  end
end
