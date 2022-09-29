require './app'
require './book'
require './rental'
require './teacher'
require './student'

class Main
  include App

  def initialize
    @books = []
    @person = []
    @rentals = []
  end

  def main
    puts "\n\n\nSCHOOL LIBRARY APP!"
    puts "====================\n\n\n"

    puts "WELCOME \n\n\n"

    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts "7 - Exit\n\n"
    user_choice = gets.chomp
    display(user_choice)
  end

  def display(user_choice)
    case user_choice
    when '1'
      list_books(@books)
      main
    when '2'
      list_people(@person)
      main
    when '6'
      filter_rental
      main
    when '7'
      puts 'Thanks for using the SCHOOL LIBRARY APP!'
      puts 'Exiting...'
    else
      add(user_choice)
    end
  end

  def add(user_choice)
    case user_choice
    when '3'
      add_person
      main
    when '4'
      add_book
      main
    when '5'
      rental_add
      main
    end
  end

  def filter_rental
    if @person.empty? || @rentals.empty?
      puts 'NO RENTALS TO DISPLAY'
      puts 'Please add a person and a book to rent'
    else
      puts 'Select a person id'
      @person.each_with_index { |person, index| puts "#{index}: #{person.name}" }
      id = gets.chomp.to_i
      list_rentals(@rentals, @person[id].name)
    end
  end

  def add_person
    puts 'Do you want to add a new Student (1) or Teacher (2) :'
    add_person_choice = gets.chomp
    case add_person_choice
    when '1'
      student_add
    when '2'
      teacher_add
    end
  end

  def student_add
    puts 'Adding New Student...'
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Parent Permission [Y/N]: '
    permission = gets.chomp
    print 'Classroom: '
    classroom = gets.chomp
    parent_permission = get_permission(permission)
    create_people(@person, Student.new(classroom, age, name, parent_permission: parent_permission))
    puts "===Student has been adding sucessfully!=== \n\n"
  end

  def teacher_add
    puts 'Adding Teacher...'
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    create_people(@person, Teacher.new(specialization, age, name))
    puts "Teacher has been adding sucessfully! \n\n"
  end

  def add_book
    puts 'Adding Book...'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    create_book(@books, Book.new(title, author))
    puts "Book has been sucessfully created! \n\n"
  end

  def rental_add
    puts 'Adding Book Rental...'
    if @books.empty?
      puts "\nNO BOOKS TO RENT!!!!\n"
      puts 'Please add a book first'
    elsif @person.empty?
      puts "\nNO PEOPLE TO RENT!!!!\n"
    else
      puts 'Select a Book: '
      @books.each_with_index { |book, index| puts "#{index}: #{book.title} (#{book.author}) " }
      rent_book_id = gets.chomp.to_i
      @person.each_with_index { |people, index| puts "#{index}: #{people.name}" }
      rental_people_id = gets.chomp.to_i
      create_rental(@rentals, Rental.new(@books[rent_book_id], @person[rental_people_id]))
      puts "Rental has been sucessfully created! \n\n"
    end
  end

  def get_permission(permission)
    return true if permission.upcase == 'Y'

    false
  end
end

main = Main.new

main.main
