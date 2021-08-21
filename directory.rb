# first we define the array of students
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
# method to print the header
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
# method that prints every element in the array
def print(names)
  names.each do |name|
    puts name
  end
end
# method that prints the footer, which contains the student count
def print_footer(names)
  puts "Overall we have #{names.count} great students"
end
# calls the methods in order
print_header
print(students)
print_footer(students)
