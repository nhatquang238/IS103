#   Section : G3 (Mon)
#   Team ID : 21
#   Name of Team member 1: Pham Minh Khoa
#   Name of Team member 2: Nguyen Nhat Quang

# inputs: a = array of strings to be sorted, lower and upper are the boundary markers
def qsort(a, lower, upper)
  if lower + 9 < upper
    mid = partition(a, lower, upper)
    qsort(a, lower, mid)
    qsort(a, mid+1, upper)
  end
  isort(a)
  return a
end

def partition(a, p, r)
  x = a[p]
  i = p - 1
  j = r + 1
  while true
    loop { j = j - 1; break if a[j] <= x }
    loop { i = i + 1; break if a[i] >= x }
    if i < j
      a[i], a[j] = a[j], a[i]  # perform swap
    else
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