
#first, store all students and cohort a has

student_list = [

  {name: "Mike Myers", cohort: :December},
  {name: "Kim Jon Il", cohort: :December},
  {name: "The Grim Reaper", cohort: :January},
  {name: "Evil Clown from It!", cohort: :February},
  {name: "Joseph (Joe) Vissarionovich Stalin", cohort: :February}

]

#method gets names of enrolled students from the user

def input_students
  puts "Enter the names of all newly enrolled students."
  puts ""
  puts "To finish entering students, hit return twice."
  puts ""
  puts "Enter student name:"

  #create a blank array
  students = []
  #get the first student name
  name = gets.chomp

  puts "Enter student's cohort (enrollment month:"
  cohort_month = gets.chomp
  
  while !name.empty? do

    if cohort_month.empty?
      students << {name: student, cohort: :NotSpecified}

    else

      students << {name: name, cohort: cohort_month.to_sym}
    
    end

    puts "There are a now a total of #{students.count} enrolled students."
    puts ""
    puts "To finish enterting students, push return twice."
    puts" Otherwise, please enter the next student's name:"
    puts ""
    name = gets.chomp
    puts ""
    puts "Enter their cohort (enrollment) month:"
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

students = input_students

puts print_student_header
puts print(students)

puts print_enrollment_count(students)