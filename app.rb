module App
  def list_books(books)
    if books.empty?
      puts 'The books list is empty!'
    else
      books.each do |book|
        puts "Title: #{book.title}"
        puts "Author #{book.author}"
      end
    end
  end

  def list_people(people)
    if people.empty?
      puts "People's list is empty!"
    else
      people.each do |person|
        puts "Name:  #{person.name}"
        puts "Age: #{person.age}"
        puts "ID: #{person.id}"
      end
    end
  end

  def list_rentals(rentals, name)
    if rentals.empty?
      puts "#{name} does not have rental registration !"
    else
      puts 'Registered Rentals: '
      rentals.each do |rental|
        next if rental.person.name != name

        puts "Date: #{rental.date}"
        puts rental.rentals
      end
    end
  end

  def create_people(people, person)
    people.push(person)
  end

  def create_book(books, book)
    books.push(book)
  end

  def create_rental(rentals, rental)
    rentals.push(rental)
  end
end
