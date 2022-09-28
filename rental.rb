class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(book, person, date)
    @person = person
    @date = date
    book.rentals.push(self)
    person.rentals.push(self)
  end

  def rentals
    "#{@book.title}: #{@person.name} #{@date}"
  end
end
