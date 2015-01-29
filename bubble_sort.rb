def bubble_sort(array)

	a = array
	swapped = true
	while swapped do
    	swapped = false
    	0.upto(a.size-2) do |i|
        if a[i] > a[i+1]
            a[i], a[i+1] = a[i+1], a[i]
            swapped = true
        end
        end
    end

    return a

end

def bubble_sort_by(array)

    a = array
    swapped = true
    while swapped do
        swapped = false
        0.upto(a.size-2) do |i|
        if yield(a[i], a[i+1]) > 0
            a[i], a[i+1] = a[i+1], a[i]
            swapped = true
        end
        end
    end

    return a

end

bubble_sort([1,2,3,4,5,6,7,3,4,3,2,5,7])

bubble_sort_by(["hey", "hello", "hi"])