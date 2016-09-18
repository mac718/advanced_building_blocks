module Enumerable
	def my_each
		for elm in self
			yield(elm)
		end
		self
	end
end