def bubble_sort(x)
	count = 0
	switch = 0 
	
	while true	 
		(x.length - 1).times do 
			if x[count] > x[count + 1]
				x[count], x[count + 1] = x[count + 1], x[count]
				switch += 1
			end
			count += 1
		end
		if switch != 0
			switch = 0
		else
			break
		end
		count = 0
	end 		
	x.inspect
end

def bubble_sort_by(x)
	count = 0
	switch = 0 
	while true	 
		(x.length - 1).times do 
			if yield > 0 
				x[count], x[count + 1] = x[count + 1], x[count]
				switch += 1
			end
			count += 1
		end
		if switch != 0
			switch = 0
		else
			break
		end
		count = 0
	end 		
	x.inspect
end


puts bubble_sort([4,3,78,2,0,2])

puts bubble_sort(["hi","hello","hey"]) do |left,right|
	left.length - right.length
end