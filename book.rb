require './rental'

class Book
  attr_reader :rentals
  attr_accessor :title, :author

  def initialize(title, author)
    @rentals = []
    @title = title
    @author = author
  end

  def add_rental(date, person)
    Rental.new(person, date, self)
  end
end
