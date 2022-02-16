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
  return arr if !arr.instance_of?(Array)
  i = 0
  while i < arr.length
    new_arr << (deep_dup(arr[i]))
    i += 1
  end
  return new_arr
end

def fib(n)
  return [1] if n == 1
  return [1,1] if n == 2
  prev = fib(n-1)
  last = prev[-1]
  second_last = prev[-2]
  prev << last+ second_last
  return prev
end

def bin_search(arr, target)
  return nil if target != arr[arr.length / 2] && arr.length == 1
  if target == arr[arr.length / 2]
    return arr.length / 2 
  elsif target > arr[arr.length / 2]
    bin_search(arr[arr.length / 2 + 1...arr.length], target) 
  else
    bin_search(arr[0...arr.length / 2], target)
  end
  # return nil
end

def merge_sort(arr)
  middle =arr.length/2
  left = arr[0...middle]
  right = arr[middle...arr.length]
  return [] if arr.length == 0
  return [arr[0]] if arr.length == 1
  sorted_left = merge_sort(left)
  sorted_right = merge_sort(right)
  merge(sorted_left,sorted_right)
end

def merge(left, right)
  sorted = []
  while left.length > 0 && right.length > 0
    if left[0] > right[0]
      sorted << right[0]
      right.shift
    else
      sorted << left[0]
      left.shift
    end
  end
  if left.length == 0
    sorted.concat(right)
  else
    sorted.concat(left)
  end
  return sorted
end

def subsets(arr)
  return [] if arr.empty? 
end