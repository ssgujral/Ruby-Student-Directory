
#first, store all students and cohort a has

student_list = [

  {name: "Mike Myers", cohort: :December},
  {name: "Kim Jon Il", cohort: :December},
  {name: "The Grim Reaper", cohort: :January},
  {name: "Evil Clown from It!", cohort: :February},
  {name: "Joseph (Joe) Vissarionovich Stalin", cohort: :February}

]

#method prints student directory header
def print_student_header
  puts "Students enrolled at Evil Academy"
  puts "**********"
  puts ""
end

#methods prints out the names of all enrolled student from array using a do loop

def print(list)

  list.each do |student|
    puts "#{student[:name]}"
    puts "(#{student[:cohort]} cohort)"
    puts ""
  end
  
  puts ""

end



#methods prints the total number of students enrolled using the count method on the array

def print_enrollment_count (list)
  puts "In total, there are #{list.count} evil students."
end

puts print_student_header
puts print (student_list)
puts print_enrollment_count (student_list)