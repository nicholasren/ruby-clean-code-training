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
  attr_reader :grade, :course
  def initialize(course, grade)
    @course = course
    @grade = grade
  end
end

class Course
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Calculator
  def total_average(students)
   students.map(&:assignments)
   .flatten
   .map(&:grade)
   .reduce(&:+) / students.size
  end

  def course_average(students, course)
   students.map(&:assignments)
   .flatten
   .select{|assignment| assignment.course.name.downcase == course }
   .map(&:grade)
   .reduce(&:+) / students.size
  end
end
