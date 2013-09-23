require 'rspec'
require_relative './tenis.rb'

describe Tenis do
	describe 'initialize' do
		p = Tenis.new

		it 'should be without rol' do
			p.rol.should eq ""
		end

		it 'should has zero points' do
			p.num_points.should eq 0
		end

		it 'should has zero games' do
			p.num_games.should eq 0
		end

		it 'should has zero sets' do
			p.num_sets.should eq 0
		end

	end

	describe 'first_toss' do
		p1 = Tenis.new
		p2 = Tenis.new
		Tenis.new.first_toss(p1,p2)

		it 'should be no nil' do
			p1.rol.should_not == ''
		end

		it 'should be no nil' do
			p2.rol.should_not == ''
		end
	end

	describe 'swap' do

		p1 = Tenis.new
		p2 = Tenis.new

		Tenis.new.first_toss(p1,p2)

		rol1 = p1.rol
		rol2 = p2.rol

		Tenis.new.swap(p1,p2)

		it 'p1 should be exchange rol' do
			p1.rol.should == rol2
		end	

		it 'p2 should be exchange rol' do
			p2.rol.should == rol1
		end		
	end

	describe 'rand_toss' do
		
		it 'should return 0 or 1' do
			Tenis.new.rand_toss.should be_between(0,1)
		end
	end

	describe 'return_num_points' do
		it 'return a string' do
			p = Tenis.new
			p.return_num_points.should_not == nil
		end
	end

	describe 'calculate_points' do
		p1 = Tenis.new
		p2 = Tenis.new

		p1.rol = "receiver"
		p2.rol = "server"

		it 'should or not increase player2`s num_points' do
			Tenis.new.calculate_points(p1,p2)
			p2.num_points.should be_between(0,1)
		end
	end

	describe 'calculate_games' do
		p1 = Tenis.new
		p2 = Tenis.new

		it 'should increase p1`s num_games' do
			p1.num_points = 6
			p2.num_points = 4
			Tenis.new.calculate_games(p1,p2)
			p1.num_games.should be > 0
		end

		it 'should increase p2`s num_games' do
			p1.num_points = 5
			p2.num_points = 7
			Tenis.new.calculate_games(p1,p2)
			p2.num_games.should be > 0
		end
	end

	describe 'calculate_sets' do

		p1 = Tenis.new
		p2 = Tenis.new

		it 'should increase p1`s num_sets' do
			p1.num_games = 6
			Tenis.new.calculate_sets(p1,p2)
			p1.num_sets.should be > 0
			p2.num_sets.should eq 0
		end

		it 'should reinitialize both players`s num_games' do
			p1.num_games = 6
			Tenis.new.calculate_sets(p1,p2)
			p1.num_games.should eq 0
			p2.num_games.should eq 0
		end

		it 'should print "winner" and reinitialize values and return 1' do
			p1.num_sets = 2
			Tenis.new.calculate_sets(p1,p2).should eq 1
			p1.num_sets.should eq  0
			p2.num_sets.should eq  0
		end
	end

end
