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

end