
#first, store all students as an array

student_list = [

  ["Mike Myers", :December],
  ["Kim Jon Il", :December],
  ["The Grim Reaper", :January],
  ["Evil Clown from It!", :February],
  ["Joseph (Joe) Vissarionovich Stalin", :February]

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
    puts "#{student[0]}"
    puts "(#{student[1]} cohort)"
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