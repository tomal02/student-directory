# first we get input to define the array of hashes for the students
def input_students
  t = Time.now
  current_month = t.strftime("%B") # gets the current month in text form

  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #initialises student array
  students = []
  # gets the name from the user
  name = gets.chomp
  # whilst name is not empty, repeat this code
  while !name.empty? do
    puts "Please input their cohort"
    cohort = gets.chomp
    if !cohort.empty?
      students << {name: name, cohort: cohort}
    else
      students << {name: name, cohort: current_month}
    end
    puts "Now we have #{students.count} student(s)."
    # gets another name from the user
    name = gets.chomp
  end
  # returns students array
  students
end

def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we want room to add more items
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # terminates program
    else
      puts "I don't know what you mean, please try again." # displays error
    end
  end
end

  # method to print the header
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
# method that goes through every element and prints the hashes correctly
def print(students)
  if students.empty?
    puts "No students currently enrolled :("
    exit
  else
    students.each_with_index do |student, i|
      puts "#{i+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end

  students.map
end
# method that prints the footer, which contains the student count
def print_footer(students)
  puts "Overall we have #{students.count} great students"
end
# calls the interactive_menu method
interactive_menu