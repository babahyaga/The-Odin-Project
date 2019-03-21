=begin Algorythmn
1. take an array 
2. examin the index 0 of the array with index 1
2. if index 0 is > index 1 switch the positions and compare the next number
3. if index 0  is < than index 1 do not switch and move on to the next number
4. repeat process n-1 times or until there are no switches made
5. you don't need to check the mth element on the right after the mth pass through
=end
def bubble_sort(array) 
    remain_to_sort = array.length - 1
  (array.length - 1).times do
    i= 0
    remain_to_sort -= 1
    while i <= remain_to_sort
        if (array[i] <=> array[i+1]) == 1
            array[i], array[i+1] = array[i+1], array[i]
        end
        i += 1
    end
end
print array
end
   

a = [5,4,3,2,1]

bubble_sort(a)

=begin

def bubble_sort(arr)
    remain_to_sort = arr.length - 1
    swaps_done = 1
    (arr.length - 1).times do
      i = 0
      remain_to_sort -= 1
      break if swaps_done == 0
      swaps_done = 0
      while i <= remain_to_sort
        if (arr[i] <=> arr[i+1]) == 1
          arr[i], arr[i+1] = arr[i+1], arr[i]
          swaps_done += 1
        end
        i += 1
      end
    end
    print arr
  end
  
  bubble_sort([4,3,78,2,0,2])

  def bubble_sort_by(arr)
    remain_to_sort = arr.length - 1
    swaps_done = 1
    (arr.length - 1).times do
      i = 0
      remain_to_sort -= 1
      break if swaps_done == 0
      swaps_done = 0
      while i <= remain_to_sort
        value = yield(arr[i], arr[i+1])
        if value > 0
          arr[i], arr[i+1] = arr[i+1], arr[i]
          swaps_done += 1
        end
        i += 1
      end
    end
    print arr
  end

=end
