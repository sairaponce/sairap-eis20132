class FizzBuzz
	def analizarFB(valor)
		if valor % 3 == 0 and valor%5 == 0
			return "FizzBuzz"
	
		elsif valor % 3 == 0
			return "Fizz"
		
		elsif valor % 5 == 0
			return "Buzz"
		
		else
			return valor
		end
	end		
end

fb = FizzBuzz.new()

for it in (1..100)
	puts fb.analizarFB(it)
end
