require './person'
class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', id: nil)
    super(age, name, parent_permission: true, id: id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
