@students = []

# first we get input to define the array of hashes for the students
def input_students
  t = Time.now
  current_month = t.strftime("%B") # gets the current month in text form

  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # gets the name from the user
  name = gets.chomp
  # whilst name is not empty, repeat this code
  while !name.empty? do
    puts "Please input their cohort"
    cohort = gets.chomp
    if !cohort.empty?
      @students << {name: name, cohort: cohort}
    else
      @students << {name: name, cohort: current_month}
    end
    puts "Now we have #{@students.count} student(s)."
    # gets another name from the user
    name = gets.chomp
  end
end

def save_students
  file = File.open("students.csv", "w")

  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def interactive_menu
  loop do # infinite loop until user exits program
    print_menu
    selection = gets.chomp
    process(selection)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students to students.csv"
  puts "9. Exit" # 9 because we want room to add more items
end

def show_students # calls methods to list the students
  print_header
  print_student_list
  print_footer
end

  # method to print the header
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit # terminates program
  else
    puts "I don't know what you mean, please try again." # displays error
  end
end

# method that goes through every element and prints the hashes correctly
def print_student_list
  if @students.empty?
    puts "No students currently enrolled :("
    exit
  else
    @students.each_with_index do |student, i|
      puts "#{i+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end
# method that prints the footer, which contains the student count
def print_footer
  puts "Overall we have #{@students.count} great student(s)"
  puts ""
end
# calls the interactive_menu method
interactive_menu