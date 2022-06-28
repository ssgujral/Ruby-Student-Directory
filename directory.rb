
#stores all student names and their months of enrollment (cohorts) as a hash table

student_list = [

  {name: "Mike Myers", cohort: :December},
  {name: "Kim Jon Il", cohort: :December},
  {name: "The Grim Reaper", cohort: :January},
  {name: "Evil Clown from It!", cohort: :February},
  {name: "Joseph (Joe) Vissarionovich Stalin", cohort: :February}

]

#interactive_menu

def interactive_menu
  students = []
  loop do

    puts "1. Add students to the directory"
    puts "2. List students in the directory"
    puts "9. Exit"

    selection = gets.chomp
    
    case selection
    when "1"
      students = input_students
    when "2"
      puts print_student_header
      puts print(students)
      puts print_enrollment_count(students)
    when "9"
      exit
    else
      puts "I do not understand that command. Please try again."
      puts ""
    end
  end
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

def print(list)

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


