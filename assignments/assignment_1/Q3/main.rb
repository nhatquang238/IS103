# Project Phase 1, Q3
# You may modify this file for testing purposes,
# but your final q3.rb must be able to run with the original main.rb.
startTime = Time.now

load "utility.rb"
load "q3.rb"

names = []  # array of restaurant names read from sorted_restaurant_names.csv

# modify the CSV file name here to change the source of restaurant names
read_file("CSV files/sorted_restaurant_names1_v2.csv").each{ |line|
  array = line.split(",")
  names << array[0].to_s
}

# modify this statement to perform a search
# the index of the name should be printed out if the name is found
keyIndex = bsearch(names, "ZOUK\r")
p keyIndex
# p names
puts "key is found at " + keyIndex.to_s

execTime = Time.now - startTime
puts "Execution time #{execTime} seconds."