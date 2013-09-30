# q3.rb

#   Section : G3 (Mon)
#   Team ID : 21
#   Name of Team member 1: Pham Minh Khoa
#   Name of Team member 2: Nguyen Nhat Quang

# Instead of checking for equality at each stage (which improves the best case but
# slow down average and worst case because it carries out an equality check each time it loops),
# we move the equality check below the while loop so that it's only executed once
# def bsearch(a, k)
#   lower = -1
#   upper = a.length

#   while lower + 1 < upper
#     mid = (lower + upper)/2
#     if k < a[mid]
#       upper = mid
#     else
#       lower = mid
#     end
#   end
#   if k != a[lower]
#     return nil
#   else
#     return lower
#   end
# end

def bsearch(a, k)
  lower = 0
  upper = a.length-1

  while lower + 1< upper
    temp1 = a[upper][0]*37 - a[lower][0]*37 + a[upper][1] - a[lower][1]
    temp2 = k[0]*37 + k[1] - a[lower][0]*37 - a[lower][1]
    mid = 0

    if (temp2!=0 && temp1!=0)
      # Use interpolation search for the first two characters if the "lower" two characters
      # isn't coincident with the "upper" first two characters or the "mid" first two characters
      mid = lower + temp2 * (upper - lower) / temp1
    else
      mid = (lower+upper)/2
    end

    if k < a[mid]
      upper = mid
    else
      lower = mid
    end
  end

  if k != a[lower]
    return nil
  else
    return lower
  end
end