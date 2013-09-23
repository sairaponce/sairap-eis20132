
class Tenis

	attr_accessor :rol, :num_points, :num_games, :num_sets

	def initialize
		@rol = ""
		@num_points = 0
		@num_games = 0
		@num_sets = 0
	end

	def reset
		initialize
	end

	def first_toss (p1,p2)

		if rand(2) == 0
			p1.rol = "server"
			p2.rol = "receiver"
		else
			p1.rol = "receiver"
			p2.rol = "server"
		end
		puts "Player 1: " + p1.rol
		puts "Player 2: " + p2.rol

	end

	def swap (p1,p2)
		aux = p1.rol
		p1.rol = p2.rol
		p2.rol = aux
	end

	def rand_toss
		toss = rand(2)

		if(toss == 0)
			puts "Tiro no recibido"
		else
			puts "Tiro recibido"
		end 

		return toss
	end

	def return_num_points
		case 
		when @num_points == 0
			return "love"
		when @num_points == 1
			return "fifty"
		when @num_points == 2
			return "thirty"
		when @num_points >= 3
			return "forty"
		end
	end

	def calculate_points(p1,p2)
		if(p1.rol == "server")
			if (rand_toss == 0)
				p1.num_points += 1
				puts "Player1:server, " + p1.return_num_points + " - " + p2.return_num_points
			end
		else
			if (rand_toss == 0)
				p2.num_points += 1
				puts "Player2:server, " + p2.return_num_points + " - " + p1.return_num_points
			end
		end
	end

	def calculate_games(p1,p2)

		if(p1.num_points >= 6) and ((p1.num_points - p2.num_points) == 2)
			p1.num_games += 1
			puts "Player1's num_games: #{p1.num_games}" 
			puts "Player2's num_games: #{p2.num_games}"

			p1.num_points = p2.num_points = 0
		elsif(p2.num_points >= 6) and ((p2.num_points - p1.num_points) == 2)
			p2.num_games += 1
			puts "Player1's num_games: #{p1.num_games}" 
			puts "Player2's num_games: #{p2.num_games}"

			p1.num_points = p2.num_points = 0
		end
	end
	
	def calculate_sets(p1,p2)
		
		if(p1.num_sets == 2)
			puts "Winner: Player 1"
			p1.reset
			p2.reset
			return 1
		elsif (p2.num_sets == 2)
			puts "Winner: Player 2"
			p1.reset
			p2.reset
			return 1
		elsif(p1.num_games == 6)
				p1.num_sets += 1
				p1.num_games = p2.num_games = 0
				puts "Player1's num_sets: #{p1.num_sets}" 
				puts "Player2's num_sets: #{p2.num_sets}" 

				sleep 5
		elsif(p2.num_games == 6)
				p2.num_sets += 1
				p1.num_games = p2.num_games = 0
				puts "Player1's num_sets: #{p1.num_sets}" 
				puts "Player2's num_sets: #{p2.num_sets}"

				sleep 5
			
		end
	end
	
end

#=begin
p1 = Tenis.new
p2 = Tenis.new
ending = 0

Tenis.new.first_toss(p1,p2)

while ending != 1 do

puts "Player 1: " + p1.rol
puts "Player 2: " + p2.rol

Tenis.new.calculate_points(p1,p2)

Tenis.new.calculate_games(p1,p2)

ending = Tenis.new.calculate_sets(p1,p2)

Tenis.new.swap(p1,p2)

end

#=end




