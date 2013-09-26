# q3.rb

# Fill this up:
#   Section : G??? (Mon/Wed/Fri???)
#   Team ID : 
#   Name of Team member 1:
#   Name of Team member 2:


# this method takes in a sorted array of names (a) and a search key (k)
# it returns the position (index) if the k is found, nil otherwise
# code taken from p.108 of John S. Conery: Explorations in Computing (1st Ed)
# do NOT modify the method signature. You may modify the contents of the method though.
def bsearch(a, k)
  lower = -1
  upper = a.length
  
  while true
    mid = (lower + upper)/2
    
    return nil if upper == lower + 1
    return mid if k == a[mid]
    if k < a[mid]
      upper = mid
    else
      lower = mid
    end
  end
end
