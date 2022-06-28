
#initializes a hash table with a starting student directory (names and months of enrollment (cohorts))
@students = [
  {name: "Mike Myers", cohort: :December},
  {name: "Kim Jon Il", cohort: :December},
  {name: "The Grim Reaper", cohort: :January},
  {name: "Evil Clown from It!", cohort: :February},
  {name: "Joseph (Joe) Vissarionovich Stalin", cohort: :February}
] 



#interactive_menu method
def interactive_menu
  loop do
    print_menu_text
    process(STDIN.gets.chomp)
  end
end

#method to print the initial menu text
def print_menu_text
  puts "Please select from one of the following options! Enter the number only."
  puts "1. Add students to the directory"
  puts "2. List students in the directory"
  puts "3. Save directory to studentlist.csv (in the application folder)"
  puts "4. Load directory from studentlist.csv (in the application folder)"
  puts "9. Exit"
end

#method parses user input to select menu option
def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      print_student_list_and_enrollment_count
    when "3"
      save_and_output_students_to_csv
    when "4"
      load_directory_from_csv
    when "9"
      exit
    else
      print_menu_error_message
  end
end

#method lets the user input names of enrolled students and their months of enrollment (cohorts)
def input_students
  puts "Enter the names of all newly enrolled students."
  puts ""
  puts "To finish entering students, hit return twice."
  puts ""
  puts "Enter the new student's name:"

  #get the first student name
  name = STDIN.gets.chomp

  puts "Enter the new student's cohort (month of enrollment):"
  cohort_month = STDIN.gets.chomp
  
  while !name.empty? do

    if cohort_month.empty?
      @students << {name: name, cohort: :Unspecified}
    else
      @students << {name: name, cohort: cohort_month.to_sym}
    end
    puts ""
    puts "There are a now a total of #{@students.count} enrolled students in the directory."
    puts ""
    puts "Press return twice to stop adding new students."
    puts "Otherwise, please enter the next new student's name:"
    name = STDIN.gets.chomp
    puts ""
    puts "Enter the new student's cohort (month of enrollment):"
    cohort_month = STDIN.gets.chomp
  end
end

#method to print the menu output under option 2
def print_student_list_and_enrollment_count
  puts print_student_header
  puts print_list_of_students
  puts print_enrollment_count
end

#method prints student directory header
def print_student_header
  puts "Students enrolled at Evil Academy"
  puts "**********"
  puts ""
end

#method prints out the names of all enrolled student from array using a do loop
def print_list_of_students
  @students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]}"
    puts "(#{student[:cohort]} cohort)"
    puts ""
  end
  puts ""
end

#method prints total number of students enrolled using the count method on the array
def print_enrollment_count
  puts "In total, there are #{@students.count} evil students."
end

#method exports current student list to csv
def save_and_output_students_to_csv
  file = File.open("studentlist.csv", "w")
  
  @students.each do |student_entry|
    student_data_array = [student_entry[:name], student_entry[:cohort]]
    csv_text = student_data_array.join(",")
    file.puts csv_text
  end
    file.close
    puts ""
    puts "Student directory successfully exported to studentlist.csv!"
    puts ""
end

#method to import student directory from csv
def load_directory_from_csv(filename="studentlist.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
      @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
  puts ""
    puts "Student directory successfully imported from studentlist.csv!"
    puts ""
end

def try_to_load_csv
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_directory_from_csv(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

#method to print error message when user enters invalid main menu command
def print_menu_error_message
  puts ""
  puts "That is not a valid command."
  puts "Please enter a number (with no punctuation!) and try again" 
  puts ""
end

try_to_load_csv
interactive_menu


