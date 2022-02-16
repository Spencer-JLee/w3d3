def range(start, last)
  return [] if last < start

  [start] if last == start

  [start] + range(start+1, last)
end

def range_iter(start, last)
  arr = []
  (start..last).each {|i| arr << i}
  return arr
end

def exp(base, n)
  return 1 if n == 0
  base*exp(base,n-1)
end

def expo(base,n)
  return 1 if n == 0
  return base if n == 1
  if n%2 == 0
    square = expo(base,n/2)
    return square * square
  else
    square =  expo(base,(n-1)/2)
    return base * square*square
  end
end

def deep_dup(arr)
  new_arr = Array.new()
  return Array.new(1, arr) if !arr.instance_of?(Array)
  i = 0
  while i < arr.length
    new_arr.concat(deep_dup(arr[i]))
    i += 1
  end
  return new_arr
end
a = [["a", ["b"], ["c", ["d"]]]]
b = deep_dup(a)
p a[1].object_id
p b[1].object_id
p a 
p b