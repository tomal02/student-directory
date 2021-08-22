# initialises the student array as an instance variable
@students = []

# first we get input to define the array of hashes for the students
def input_students
  t = Time.now
  current_month = t.strftime("%B") # gets the current month in text form
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # gets the name from the user
  name = STDIN.gets.chomp
  # whilst name is not empty, repeat this code
  while !name.empty? do
    puts "Please input their cohort"
    cohort = STDIN.gets.chomp
    if !cohort.empty?
      @students << {name: name, cohort: cohort}
    else
      @students << {name: name, cohort: current_month}
    end
    puts "Now we have #{@students.count} student(s)."
    # gets another name from the user
    name = STDIN.gets.chomp
  end
end

# tries to load the file provided as a command line argument
def try_load_file
  filename = ARGV.first # gets the first element from the ARGV array
  return if filename.nil?
  if File.exist?(filename) # if the file given exists, then...
    load_file(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} does not exist."
    exit
  end
end

# loads a list of students from a file
def load_file(filename = "students.csv")
  file = File.open(filename, "r") # opens the file using the "r" argument (read)
  file.readlines.each do |line| # iterates through each line being read from the file
    name, cohort = line.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

# saves the list of students to a file
def save_students
  file = File.open("students.csv", "w") # opens the file in "w" (write) mode
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line # puts the csv_line to the file
  end
  file.close
end

# runs the main UI for the program
def interactive_menu
  loop do # infinite loop until user exits program
    print_menu
    selection = STDIN.gets.chomp
    process(selection)
  end
end

# prints the menu
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students to students.csv"
  puts "4. Load the list of students from students.csv"
  puts "9. Exit" # 9 because we want room to add more items
end

# calls methods to list the students
def show_students
  print_header
  print_student_list
  print_footer
end

# method to print the header
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# method to process the user's selection for what to do
def process(selection)
  case selection # uses switch statement instead of if as is more appropriate
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_file
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

try_load_file
interactive_menu