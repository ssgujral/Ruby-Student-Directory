
#first, store all students as an array

student_list = [

  "Mike Myers",
  "Kim Jon Il",
  "The Grim Reaper",
  "Evil Clown from It!",
  "Joseph (Joe) Vissarionovich Stalin"

]

#then, print them out using a do loop on the array

puts "Students enrolled at Evil Academy"
puts "**********"
puts ""

student_list.each do |student|
  puts student
end

puts ""

#finally, print the total number of students using the count method on the array

puts "In total, there are #{student_list.count} evil students."