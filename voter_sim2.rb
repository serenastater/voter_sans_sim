# Class for politicians.............................................
class Politician
  attr_accessor :name, :party
  def initialize name, party
    @name = name
    @party = party
  end
end

# Class for voters..................................................
class Voter
  attr_accessor :name, :party
  def initialize name, party
    @name = name
    @party = party
  end
end

# Class for politicians.............................................
require "./voter_classes.rb"

# Arrays for storing instances.......................................
@list_of_politicians = []
@list_of_voters = []

# Method to start game..............................................
def menu
  puts "You've made it to the the voter database! Would you like to"
  puts "(C)reate, (L)ist, (U)pdate, or (D)elete a voter or politician?"
  response = gets.chomp.downcase
  case response
  when "c" then create_either
  when "l" then list_menu
  when "u" then update_either
  when "d" then delete_either
  else
    error
    menu
  end
end

# Create method....................................................
def create_either
  puts "Would you like to create a (P)olitician or (V)oter?"
  response = gets.chomp.downcase
  case response
  when "p" then create_politician
  when "v" then create_voter
  else
    error
    create_either
  end
end

# Method to create politician.....................................
def create_politician
  puts "What is the politician's name?"
  @politician = gets.chomp.downcase
  political_party
end

# Method for adding politicians to array...........................
def add_politician(politician)
  @list_of_politicians << [politician.name, politician.party]
  create_another_politician
end

# Method to add politician's party affiliation....................
def political_party
  puts "What is the politician's party affiliation?"
  puts "(D)emocrat or (R)epublican?"
  response = gets.chomp.downcase
  case response
  when "d" then politician = Politician.new @politician, "democrat"
    add_politician(politician)
  when "r" then politician = Politician.new @politician, "republican"
    add_politician(politician)
  else
    error
    political_party
  end
end

# Method to create another politician...............................
def create_another_politician
  puts "Would you like to create another Politician? (Y) or (N)?"
  response = gets.chomp.downcase
  case response
  when "y" then create_politician
  when "n" then menu
  else
    error
    create_another_politician
  end
end

# Method for creating voters.......................................
def create_voter
 puts "What is the voter's name?"
 @voter = gets.chomp.downcase
 voter_party
end

#Method for adding voters..........................................
def add_voter(voter)
  @list_of_voters << [voter.name, voter.party]
  create_another_voter
end

# Method for establishing voter affiliation........................
def voter_party
 puts "What is the voter's party affiliation?"
 puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral?"
 response = gets.chomp.downcase
  case response
  when "l" then voter = Voter.new @voter, "liberal"
    add_voter(voter)
  when "c" then voter = Voter.new @voter, "conservative"
    add_voter(voter)
  when "t" then voter = Voter.new @voter, "tea party"
    add_voter(voter)
  when "s" then voter = Voter.new @voter, "socialist"
    add_voter(voter)
  when "n" then voter = Voter.new @voter, "neutral"
    add_voter(voter)
  else
    error
    voter_party
  end
  menu
end

# Method to create additional voters.................................
def create_another_voter
  puts "Would you like to create another voter? (Y) or (N)?"
  response = gets.chomp.downcase
  case response
  when "y" then create_voter
  when "n" then menu
  else
    error
    create_another_voter
  end
end

# List method that returns to menu..................................
def list_menu
  puts "Politicians:"
    @list_of_politicians.each {|i| puts "#{i[0]}, #{i[1]}"}
  puts "Voters:"
    @list_of_voters.each {|i| puts "#{i[0]}, #{i[1]}"}
  menu
end

# List method that does not return to menu.......................
def list_refer
  puts "Politicians:"
    @list_of_politicians.each {|i| puts "#{i[0]}, #{i[1]}"}
  puts "Voters:"
    @list_of_voters.each {|i| puts "#{i[0]}, #{i[1]}"}
end

# Method to update lists............................................
def update_either
  list_refer
  if @list_of_politicans == nil && @list_of_voters == nil
    puts "There is nothing to update!"
    menu
  end
  puts "Would you like to update a (P)olitican or (V)oter?"
  response = gets.chomp.downcase
    case response
    when "p" then update_politician
    when "v" then update_voter
    else
      error
      update_either
    end
end

# Method to update politician...............................
def update_politician
  list_refer
  puts "Who would you like to update?"
  politician = gets.chomp.downcase
  @list_of_politicians.each do |i|
    if i.include? politician
      puts "Enter the politician's current name"
      current_name = gets.chomp.downcase
      i[0] = current_name
      update_politician_party
    end
  end
    error
    update_politician
end

# Method to update politician's party..................................
def update_politician_party
  @list_of_politicians.each do |i|
  puts "Would you like to update the politician's party? (Y) or (N)?"
  response = gets.chomp.downcase
    if response == "y"
      puts "Is the new party (R)epublican or (D)emocrat?"
      new_party = gets.chomp.downcase
      case new_party
      when "r" then new_party = "Republican"
        i[1] = new_party
        menu
      when "d" then new_party = "Democrat"
        i[1] = new_party
        menu
      else
        error
        update_politician_party
      end
    elsif response == "n"
      menu
    else
      error
      update_politician_party
    end
  end
end

# Method to update voter....................................
def update_voter
  list_refer
  puts "Who would you like to update?"
  voter = gets.chomp.downcase
  @list_of_voters.each do |i|
    if i.include? voter
      puts "Enter the voter's current name"
      current_name = gets.chomp.downcase
      i[0] = current_name
      update_voter_aff
    end
  end
    error
    update_voter
end

# Method to update voter affiliation..................................
def update_voter_aff
  @list_of_voters.each do |i|
    puts "Would you like to update the voter's affiliation?"
    response = gets.chomp.downcase
    if response == "y"
      puts "What is the voter's new affiliation?"
      puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral?"
      new_aff = gets.chomp.downcase
      case new_aff
      when "l" then new_aff = "liberal"
        i[1] = new_aff
        menu
      when "c" then new_aff = "conservative"
        i[1] = new_aff
        menu
      when "t" then new_aff = "tea party"
        i[1] = new_aff
        menu
      when "s" then new_aff = "socialist"
        i[1] = new_aff
        menu
      when "n" then new_aff = "neutral"
        i[1] = new_aff
        menu
      else
        error
        update_voter_aff
      end
    elsif response == "n"; menu
    else
      error
      update_voter_aff
    end
  end
end

# Delete method.......................................................
def delete_either
  list_refer
  if @list_of_politicans == nil && @list_of_voters == nil
    puts "There is nothing to delete!"
    menu
  end
  puts "Would you like to delete a (P)olitican or (V)oter?"
  response = gets.chomp.downcase
    case response
    when "p" then delete_politician
    when "v" then delete_voter
    else
      error
      delete_either
    end
end

# Method to delete politician.........................................
def delete_politician
  list_refer
  puts "Which politician would you like to delete?"
  politician = gets.chomp.downcase
  @list_of_politicians.each do |i|
    if i.include? politician
      puts "#{i[0]}, #{i[1]} is being removed from the list."
      i.delete(politician)
      menu
    end
  end
   error
   delete_politician
end

# Method to delete voter.............................................
def delete_voter
  list_refer
  puts "Which voter would you like to delete?"
  voter = gets.chomp.downcase
  @list_of_voters.each do |i|
    if i.include? voter
      puts "#{i[0]}, #{i[1]} is being removed from the list."
      i.delete(voter)
      menu
    end
  end
    error
    delete_voter
end

# Error method......................................................
def error
  puts "Incorrect response. Please choose again!"
end

menu
