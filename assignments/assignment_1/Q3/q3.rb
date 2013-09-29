# q3.rb

#   Section : G3 (Mon)
#   Team ID : 21
#   Name of Team member 1: Pham Minh Khoa
#   Name of Team member 2: Nguyen Nhat Quang

# Instead of checking for equality at each stage (which improves the best case but
# slow down average and worst case because it carries out an equality check each time it loops),
# we move the equality check below the while loop so that it's only executed once
def bsearch(a, k)
  lower = -1
  upper = a.length

  while lower + 1< upper
    mid = (lower + upper)/2
    if k < a[mid]
      upper = mid
    else
      lower = mid
    end
  end
  return lower if k == a[lower]
  return nil if k != a[lower]
end