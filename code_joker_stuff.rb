
=begin
#EXAMPLE array of hashes
jokes = [
  {joke: "Not everything in programming is #000 and #fff", rating: 0},
  {joke: "Haha funny joke here", rating: 0}
]
=end

class HumourType
  def initialize(type)
    @type = type
  end

  attr_accessor :type

  def jokes
    jokes = [
      {joke: "Not everything in programming is #000 and #fff", rating: 0},
      {joke: "Haha funny joke here", rating: 0}
    ]

    #randomly select an item (hash) from the array and puts the key
    case answer
    when 1
        jokes.shuffle!
        jokes.pop
        jokes.find { |hash| hash.keys.include?(:joke)}.values.first

    when 2
        puns.shuffle!
        puns.pop
        puns.find { |hash| hash.keys.include?(:joke)}.values.first
    when 3
        images.shuffle!
        images.pop
        images.find { |hash| hash.keys.include?(:joke)}.values.first
    else
        puts "thats not valid try again"
    end

  end

  def puns
    #same format as jokes method
  end

  def images
    #same format as jokes method
  end

  def select_humour_type
    puts "Select: joke (j), pun (p), or image (i) "

    humour_type = gets.chomp.downcase

    if humour_type == "j"
      #calls jokes method
      funny = HumourType.new("funny_thing")
      funny.jokes

      # funny_thing = HumourType.new("haha")

      # puts funny_thing.jokes

    elsif humour_type == "p"
      #call puns method
    elsif humour_type == "i"
      #call image method
    else
      #error handler
    end
  end
end

class Audience
  def initialize(people_type)
    @people_type = people_type
  end

  attr_accessor :people_type

  def work_collegues
    puts "For work collegues I'd suggest a pun. Feel free to make your own selection though."

    funny = HumourType.new(funny)

    funny.select_humour_type #call this method from HumourType class
  end

  def students
    puts "For students I'd suggest a joke. Feel free to make your own selection though."

    select_humour_type #call this method from HumourType class
  end

  def meetups
    puts "For meetups I'd suggest an image. Feel free to make your own selection though."

    select_humour_type #call this method from HumourType class
  end

end



###########PROGRAM###########
puts "Hey there coder! What's your audience? Select: work collegues (w), students (s), or meetup peeps (m) "

audience = gets.chomp.downcase

# need to create an instance of Audience class
people = Audience.new(people)

if audience == "w"
  #call work_collegues method from Audience class
  people.work_collegues
elsif audience == "s"
  #call students method from Audience class
elsif audience == "m"
  #call meetups method from Audience class
else
  #error handler
end

puts "How'd they like it???"

rate_it #call this method from Rating class

# display table of rated humour
