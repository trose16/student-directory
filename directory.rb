@students = [] # an empty array accessible to all methods

def print_menu
  # 1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we will be adding more items
  # 2. read the input and save it into a variable
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again please"
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

# get user to input student names
def input_students
  puts "Please enter the name, cohort, birth country, and hobbies of each student".center(10)
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = STDIN.gets.chomp
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
    @students << {name: name, cohort: cohort, birth: birth_country, hobbies: hobbies}
    puts "Now we have #{@students.count} students".center(30)
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

def print_students_list
  if @students.count >= 1
    @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort #{student[:birth]} #{student[:hobbies]})"
    end
  else
    puts "Sorry we don't have any students to report quite yet!"
  end
end

def cohort_sort
  if @students.count >= 1
    sort = @students.map { |student| student[:cohort] }
    puts "Here are our current cohort months:"
    puts sort
    puts "Enter the one you’d like to view:"
    view = gets.chop.to_sym
    students.each do |student|
      if @student[:cohort] == view
        puts "#{@student[:cohort]} cohort, student #{@student[:name]}"
      end
    end
  else
    puts nil
  end
end

def print_footer
  if @students.count > 2
    puts "Overall, we have #{@students.count} great student!"
  elsif @students.count == 1
    puts "I know we have #{@students.count} great student!"
  else
    puts nil
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

# nothing happens until we call the methods
interactive_menu
students = input_students
print_header
print_students_list
print_footer
cohort_sort
