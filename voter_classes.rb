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
