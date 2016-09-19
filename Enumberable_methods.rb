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
		self.my_each do |num|
			if yield(num)
				selection_arr.push(num)
			end
		end
		selection_arr
	end

end