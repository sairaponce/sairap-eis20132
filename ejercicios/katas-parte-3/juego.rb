class Game

	def set_word word
		@word = word
		@errors = 0
		@status = ''
		for i in (1..@word.length)
			@status = @status + '-'
		end
	end

	def get_word 
		@word
	end
	
	def get_errors 
		@errors
	end

	def try_with a_letter
		if @errors < 6
			if @word.include? a_letter
				for i in (0..@word.length)
					if @word[i] == a_letter
						@status[i] = a_letter
					end
				end
				return true
			else 
				@errors += 1
				return false
			end
		else
			return nil
		end
	end

	def get_length
		@word.length
	end

	def get_state
		@status
	end
	
end

