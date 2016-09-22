module Enumerable
	def my_each
		for elm in self
			yield(elm)
		end
		self
	end

	def my_each_with_index
		i = 0
		while i < self.length
			yield(self[i], i)
			i += 1
		end
		self
	end

	def my_select
		selection_arr = []
		self.my_each do |elem|
			if yield(elem)
				selection_arr.push(elem)
			end
		end
		selection_arr
	end

	def my_all?
		self.my_each do |elem|
			if yield(elem) == false
				return false
			end
		end
		true
	end

	def my_any?
		self.my_each do |elem|
			if yield(elem) == true
				return true
			end
		end
		false
	end

	def my_none?
		self.my_each do |elem|
			if yield(elem) == true
				return false
			end
		end
		true
	end

	def my_count(arg = nil)
		count = 0
		if block_given?
			self.my_each do |i|
				if yield(i)
					count += 1 
				end
			end
		elsif arg != nil
			self.my_each do |i|
				if i == arg
					count += 1 
				end
			end
		else
			self.my_each {|i| count += 1}
		end
		count	
	end

	def my_map
		mapped_arr = []
		self.my_each do |i|
			mapped_arr << yield(i)
		end
		mapped_arr
	end

	def my_inject(x = 0)
		total = x
		self.my_each do |i|
			total = yield(i, total)
		end
		total
	end
	
	def multiply_els
		self.my_inject(1){|els, total| els * total}
	end

end