# Both methods are taken from your textbook
# "Explorations in Computing" by John S Connery (2011), Chapter 5, p.124

# inputs: a = array of strings to be sorted, lower and upper are the boundary markers
def qsort(a, lower, upper)
  if (lower + 9 >= upper)
    isort(a)
    return a
  end
  order = Array.new(2)
  order[0] = lower
  order[1] = upper
  count = 1
  while (order.any?)
    r = order[count]
    l = order[count-1]
    next if (r <= l) 
    mid = partition(a, l, r)
    if (count+3>order.size)
      temp = Array.new(order.size*2)
      for i in 0..(count-2)
        temp[i] = order[i]
      end
      order = temp
    end
    
    if (mid-l > r-mid)
      order[count-1]=l
      order[count]=mid-1
      order[count+1]=mid+1
      order[count+2]=r
    else 
      order[count-1]=mid+1
      order[count]=r
      order[count+1]=l
      order[count+2]=mid-1
    end 
    count += 2
  end
  return a
end

def partition(a, p, r)
  x = a[p]
  i = p
  j = r + 1
  while true
    loop { j = j - 1; break if a[j] <= x }
    loop { i = i + 1; break if a[i] > x }
    if i < j
      a[i], a[j] = a[j], a[i]  # perform swap
    else
      a[p], a[j] = a[j], a[p] # perform swap with partitioning item
      return j
    end
  end

end

def isort(a)
  for i in 1..a.length-1
    key = a[i]
    j = i
    while j > 0 and a[j - 1] > key
      a[j] = a[j - 1]
      j = j - 1
    end
    a[j] = key
  end
end