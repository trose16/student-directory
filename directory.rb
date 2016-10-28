# get user to input student names
def input_students
  puts "Please enter the name, cohort, birth country, and hobbies of each student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  puts "Enter student name:"
  name = gets.chomp
  puts "Enter student cohort"
	cohort = gets.chomp
  puts "Enter student birth country:"
	birth_country = gets.chomp
  puts "Enter student hobbies"
  hobbies = gets.chomp
  # while the name is not empty, repeat this code block
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort, birth: birth_country, hobbies: hobbies}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Enter student name:"
    name = gets.chomp
    puts "Enter student cohort"
    cohort = gets.chomp
    puts "Enter student birth country:"
    birth_country = gets.chomp
    puts "Enter student hobbies"
    hobbies = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
