# Both methods are taken from your textbook
# "Explorations in Computing" by John S Connery (2011), Chapter 5, p.124

# inputs: a = array of strings to be sorted, lower and upper are the boundary markers
def qsort(a, lower, upper)
  if lower < upper
    mid = partition(a, lower, upper)
    qsort(a, lower, mid)
    qsort(a, mid+1, upper)
  end
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
