# first we define the array of hashes for the students
students = [
{name: "Dr. Hannibal Lecter", cohort: :november},
{name: "Darth Vader", cohort: :november},
{name: "Nurse Ratched", cohort: :november},
{name: "Michael Corleone", cohort: :november},
{name: "Alex DeLarge", cohort: :november},
{name: "The Wicked Witch of the West", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Freddy Krueger", cohort: :november},
{name: "The Joker", cohort: :november},
{name: "Joffrey Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :november}
]
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
print_header
print(students)
print_footer(students)
