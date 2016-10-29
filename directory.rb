def interactive_menu
  # 1. print the menu and ask the user what to do
  # 2. read the input and save it into a variable
  # 3. do what the user has asked
  # 4. repeat from step 1
end

# get user to input student names
def input_students
  puts "Please enter the name, cohort, birth country, and hobbies of each student".center(10)
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chop
  puts "Enter cohort do not abbreviate the month"
  cohort = gets.chop.to_sym
    if
      cohort.empty?
      cohort = nil
    else
      cohort
    end
  puts "Enter student birth country:"
  birth_country = gets.chop
  puts "Enter student hobbies"
  hobbies = gets.chop
  # while the name is not empty, repeat this code block
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort, birth: birth_country, hobbies: hobbies}
    puts "Now we have #{students.count} students".center(30)
    # get another name from the user
    puts "Enter student name:"
    name = gets.chop
    puts "Enter student cohort"
    cohort = gets.chop
    puts "Enter student birth country:"
    birth_country = gets.chop
    puts "Enter student hobbies"
    hobbies = gets.chop
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(30)
  puts "-------------".center(30)
end

def print(students)
  if students.count >= 1
    students.each do |student|
      puts "#{student[:name]} (#{student [:cohort]} cohort #{student [:birth]} #{student [:hobbies]})".center(20)
    end
  else
    puts "Sorry we don't have any students to report quite yet!"
  end
end

def cohort_sort(students)
  if students.count >= 1
    sort = students.map { |student| student[:cohort] }
    puts "Here are our current cohort months:"
    puts sort
    puts "Enter the one you’d like to view:"
    view = gets.chop.to_sym
    students.each do |student|
      if student[:cohort] == view
        puts "#{student[:cohort]} cohort, student #{student[:name]}"
      end
    end
  else
    puts nil
  end
end

def print_footer(students)
  if students.count > 2
    puts "Overall, we have #{students.count} great student!"
  elsif students.count == 1
    puts "I know we have #{students.count} great student!"
  else
    puts nil
  end
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
cohort_sort(students)
