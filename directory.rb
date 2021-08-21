# first we get input to define the array of hashes for the students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #initialises student array
  students = []
  # gets the name from the user
  name = gets.chomp
  # whilst name is not empty, repeat this code
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students."
    # gets another name from the user
    name = gets.chomp
  end
  # returns students array
  students
end
# method to print the header
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
# method that goes through every element and prints the hashes correctly
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
# method that prints the footer, which contains the student count
def print_footer(students)
  puts "Overall we have #{students.count} great students"
end
# calls the methods in order
students = input_students
print_header
print(students)
print_footer(students)
