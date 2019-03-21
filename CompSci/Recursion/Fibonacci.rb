def fib(n, fib_sequence = [0, 1])
    if n < 3
        fib_sequence[0...n]
    else
   (n -2).times { fib_sequence << (fib_sequence[-2] + fib_sequence[-1])}
    fib_sequence
    end
end

def fib_rec(n, fib_sequence= [0, 1])
    if n == 1
        fib_sequence[0..-2]
    else
        fib_sequence << (fib_sequence[-2]+fib_sequence[-1])
        fib_rec(n-1,fib_sequence)
    end
end

def merge_sort(array)
    if array.length < 2 
        return array
    else
        size = array.length
        left = merge_sort(array[0..size/2-1])
        right = merge_sort(array[size/2..-1])
        merge(left,right)
    end
end

def merge(left,right)
    merged_array = []
    until left.empty? || right.empty?
        merged_array << (left.first <= right.first ? left.shift : right.shift)
    end
    merged_array + left + right
end

test = [1,56,34,23,63,62,7,5,88,53,675,34,2]
