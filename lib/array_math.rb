require 'pry'
class Array

	def plus(array)
		result = Array.new(self)
		array.each{|x| result.push(x)}
		result
	end

	def asterisk(num)
		result = Array.new(self)
		if num.class == Fixnum
			 (1...num).step{|x| result << self}
		# (num-1).times do result << self end
			return result.flatten
		else
			return result.join(num)
		end
	end

	def ampersand(array)
		self.select{|x| array.include?(x)}
	end

end
