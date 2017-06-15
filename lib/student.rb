require 'pry'

class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]

  attr_accessor :name, :grade
  attr_reader :id

  # def db_connection
  #   db_connection = DB[:conn]
  # end
  def initialize(name, grade)
    @name = name
    @grade = grade
    @id = 1
  end

  def self.create_table
    db_connection = DB[:conn]
    sql = ("CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    name text,
    grade text);")
    db_connection.execute(sql)
  end

  def self.drop_table
    db_connection = DB[:conn]
    sql = "DROP TABLE students;"
    db_connection.execute(sql)
  end

  def save
    db_connection = DB[:conn]
    sql = "INSERT INTO students (name, grade) VALUES (?, ?);"
    db_connection.execute(sql, self.name, self.grade)
  end

  def self.create(student_hash)

    new_student = Student.new(name = student_hash[:name], grade = student_hash[:grade])

    new_student.save

    new_student
  end



end
