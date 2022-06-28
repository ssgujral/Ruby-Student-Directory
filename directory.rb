

@students = [] #empty student array stored as instance variable for passing to multiple methods


#also storing an example list of student names and their months of enrollment (cohorts) as a hash table

student_list = [

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

    selection = gets.chomp
    
    case selection
    when "1"
      @students = input_students
    when "2"
      print_option_two
    when "9"
      exit
    else
      print_menu_error_message
    end
  end
end

#method to print the initial menu text
def print_menu_text
  puts "Please select from one of the following options! Enter the number only."
  puts "1. Add students to the directory"
  puts "2. List students in the directory"
  puts "9. Exit"
end

#method to print the menu output under option 2

def print_option_two
  puts print_student_header
  puts print_list_of_students(@students)
  puts print_enrollment_count(@students)
end

def print_menu_error_message
  puts ""
  puts "That is not a valid command."
  puts "Please enter a number (no punctuation!) and try again" 
  puts ""
end



#lets the user input names of enrolled students and their months of enrollment (cohorts)

def input_students
  puts "Enter the names of all newly enrolled students."
  puts ""
  puts "To finish entering students, hit return twice."
  puts ""
  puts "Enter the new student's name:"

  #create a blank array
  students = []
  #get the first student name
  name = gets.chomp

  puts "Enter the new student's cohort (month of enrollment):"
  cohort_month = gets.chomp
  
  while !name.empty? do

    if cohort_month.empty?
      students << {name: name, cohort: :Unspecified}

    else

      students << {name: name, cohort: cohort_month.to_sym}
    
    end

    puts ""
    puts "There are a now a total of #{students.count} enrolled students in the directory."
    puts ""
    puts "Press return twice to stop adding new students."
    puts "Otherwise, please enter the next new student's name:"
    name = gets.chomp
    puts ""
    puts "Enter the new student's cohort (month of enrollment):"
    cohort_month = gets.chomp
  end

  

  #return the updated array of new students
  students

end





#method prints student directory header
def print_student_header
  puts "Students enrolled at Evil Academy"
  puts "**********"
  puts ""
end




#methods prints out the names of all enrolled student from array using a do loop

def print_list_of_students(list)

  list.each_with_index do |student, index|

    puts "#{index+1}. #{student[:name]}"
    puts "(#{student[:cohort]} cohort)"
    puts ""
  end
  
  puts ""

end



#methods prints the total number of students enrolled using the count method on the array

def print_enrollment_count (list)
  puts "In total, there are #{list.count} evil students."
end

interactive_menu


