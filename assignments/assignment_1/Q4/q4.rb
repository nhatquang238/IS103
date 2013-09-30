#   Section : G3 (Mon)
#   Team ID : 21
#   Name of Team member 1: Pham Minh Khoa
#   Name of Team member 2: Nguyen Nhat Quang

# inputs: a = array of strings to be sorted, lower and upper are the boundary markers
def qsort(a, lower, upper)
  order = Array.new(2)
  order[0] = lower
  order[1] = upper
  count = 1
  while (order.any?)
    r = order[count]
    l = order[count-1]

    if (r <= l+9) 
      if (r>l) then isort(a,l,r) end
      order[count] = nil
      order[count-1] = nil
      count-=2
      next
    end
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
    loop { j = j - 1; break if a[j] <= x || j == p }
    loop { i = i + 1; break if a[i] > x || i == r }
    if i < j
      a[i], a[j] = a[j], a[i]  # perform swap
    else
      a[p], a[j] = a[j], a[p] # perform swap with partitioning item
      return j
    end
  end

end

def isort(a,lower,upper)
  for i in lower+1..upper
    key = a[i]
    j = i
    while j > 0 and a[j - 1] > key
      a[j] = a[j - 1]
      j = j - 1
    end
    a[j] = key
  end
end