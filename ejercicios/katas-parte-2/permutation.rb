class Permutation
	def initialize(aString)
		@aString = aString
	end
	def aString
		return @aString
	end
	def aString=(aString)
		@aString = aString
	end

	def fact(m)
		(1..m).inject:*
	end

	def permute(aString)
		cadena = aString.to_s.chars.to_a.permutation.to_a.each{|x| puts x.join}
		return cadena.length	
	end
end

#  a = Permutation.new("cadena")
#  a.permute(a.aString)
