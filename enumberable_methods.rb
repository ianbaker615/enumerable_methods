module Enumberable
	def my_each
		i = 0
		while i < self.size
			yield(self[i])
			i+=1
		end
		self
	end

	def my_each_with_index
		i = 0
		while i < self.size
			yield(self.index(self[i]))
			i+=1
		end
		self
	end

	def my_select
		result = []
		self.my_each do |x|
			result << x if yield(x)
		end
		result
	end

	def my_all?
		i = 0
		self.my_each do |x|
			if yield(x)
				i+=1
			else
				return false
			end
		end
		return true if i == self.length
	end

	def my_any?
		i = 0
		self.my_each do |x|
			i+=1 if yield(x)
		end
		return true if i > 0
	end


	def my_none?
		i = 0
		self.my_any? do |x|
			i+=1 if yield(x)
		end
		if i == 0
			return true 
		else
			return false
		end
	end

	def my_count
		i = 0
		self.my_each do |x|
			i+=1 if yield(x)
		end
		return i
	end

	def my_map(proc)
		result = []
		self.my_each do |x|
			result << proc.call(x) 
		end
		return result
	end

	def my_inject(initial = nil)
      memo = initial ? initial : self.shift
      self.my_each do |item|
        memo = yield(memo, item)
      end
      memo
    end

end

	def multiply_els(arr)
	  arr.my_inject{|x,y| x*y}
	end

