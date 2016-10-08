module Enumerable
	def my_each
		for i in self
			yield(i)
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
		self.my_each do |i|
			if yield(i)
				selection_arr.push(i)
			end
		end
		selection_arr
	end

	def my_all?
		self.my_each do |i|
			if yield(i) == false
				return false
			end
		end
		true
	end

	def my_any?
		self.my_each do |i|
			if yield(i) == true
				return true
			end
		end
		false
	end

	def my_none?
		self.my_each do |i|
			if yield(i) == true
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

	def my_inject(x = nil)
		self.my_each do |i|
			if x == nil
				x = self[0]
			else
				x = yield(i, x)
			end
		end
		x
	end
	
	def multiply_els
		self.my_inject {|els, total| els * total}
	end

	#Alternate my_map that accepts either a block or a proc
	def my_map(my_proc = nil)
		mapped_arr = []
		if block_given? && !my_proc
			self.my_each do |i|
				mapped_arr << yield(i)
			end
		else
			self.my_each do |i|
				mapped_arr << my_proc.call(i)
			end
		end
		mapped_arr
	end

end