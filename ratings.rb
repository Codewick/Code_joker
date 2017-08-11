@rating_array = []

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

@rating_array = []
    enter_rating
    display_rating
