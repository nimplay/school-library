require './person'
class Student < Person
  def initialize(name = 'Unknown', age, classroom, parent_permission: true, id = nil)
    super(age, name, parent_permission: parent_permission, id: id)
    @classroom = classroom
  end
  def play_hooky
    'H¯\(ツ)/¯'
  end
end
