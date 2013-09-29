# Project Phase 1, Q4
# You may modify this file for testing purposes,
# but your final q4.rb must be able to run with the original main.rb.
startTime = Time.now

load "utility.rb"
load "q4.rb"

names = []  # array of restaurant names read from unsorted_restaurant_names.csv

# modify the CSV file name here to change the source of restaurant names
read_file("CSV files/unsorted_restaurant_names1.csv").each{ |line|
  array = line.split(",")
  names << array[0].to_s
}

# perform sorting
qsort(names, 0, names.length-1)

# array = [523,1,13,63,214,6134,632]
# p "length: " + array.length.to_s
# qsort(array, 0, array.length - 1)
# p partition(array, 0, array.length - 1)

# for i in 0..array.length - 1
# 	p array[i]
# end

# print out the sorted names
for i in 0..names.length-1
  p i.to_s + " : " + names[i]
end

execTime = Time.now - startTime
puts "Execution time #{execTime} seconds."