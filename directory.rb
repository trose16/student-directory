#first we print the list of students
puts "The students of Villains Academy"
puts "-------------"

students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

students.each do |student|
  puts student
end
# finally, we print the total number of students
print "Overall, we have #{students.count} great students"
# it's important that print() doesn't add new line characters
puts " great students"
