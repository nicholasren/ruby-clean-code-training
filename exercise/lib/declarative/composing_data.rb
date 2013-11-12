class Student
  attr_reader :assignments, :name

  def initialize(name)
    @name = name
    @assignments = []
  end

  def assign(course, grade)
    assignments << Assignment.new(course, grade)
  end
end

class Assignment
  def initialize(course, grade)
    @course = course
    @grade = grade
  end
end

class Course
  attr_reader :grade
  def initialize grade
    @grade = grade
  end
end

class Calculator
  def total_average(students)
    0
  end

  def course_average(students, course)
    0
  end
end
