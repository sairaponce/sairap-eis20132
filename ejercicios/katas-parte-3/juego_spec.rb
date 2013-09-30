require 'rspec'
require_relative './juego.rb'


describe Game do

	describe "Game's model" do
		subject { @game = Game.new }


		it { should respond_to( :set_word) }
		it { should respond_to( :try_with) }
		it { should respond_to( :get_errors) }
		it { should respond_to( :get_length) }
		it { should respond_to( :get_state) }

	end 


	before (:each) { @game = Game.new }

	describe "set_word" do

		it "the attribute 'word' should be 'mundo'" do
			@game.set_word 'mundo'
			@game.get_word.should eq 'mundo'
		end

	end

	describe "try_with" do

		it "should return true when try_with 'n' and the @word is 'no'" do
			@game.set_word 'no'
			@game.try_with('n').should be true
		end

		it "should return false when try_with 'n' and @word is 'yes'" do
			@game.set_word 'yes'
			@game.try_with('n').should be false
		end

		it "should return nil after 6 errors" do
			@game.set_word 'yes'
			@game.try_with('1').should be false
			@game.try_with('2').should be false
			@game.try_with('3').should be false
			@game.try_with('4').should be false
			@game.try_with('5').should be false
			@game.try_with('6').should be false
			@game.try_with('7').should be nil
		end
	end

	describe "get_errors" do

		it "return zero after set_word because the game just begins" do
			@game.set_word 'mundo'
			@game.get_errors.should eq 0
		end

		it "return 1 if you try_with 'n' and @word is 'yes'" do
			@game.set_word 'yes'
			@game.try_with 'n'
			@game.get_errors.should eq 1
		end

		it "return 2 if you try_with 2 wrong words " do
			@game.set_word 'yes'
			@game.try_with 'n'
			@game.try_with 'o'
			@game.get_errors.should eq 2
		end

	end

	describe "get_length" do

		it "return '4' if @word is 'agua'" do
			@game.set_word 'agua'
			@game.get_length.should eq 4
		end

		it "return '3' if @word is 'luz'" do
			@game.set_word 'luz'
			@game.get_length.should eq 3
		end

	end

	describe "get_state" do

		it "return ------ if @word is 'person' and there are no attempts" do
			@game.set_word 'person'
			@game.get_state.should eq "------"
		end

		it "return -e---- if @word is 'person' and after try_with 'e'" do
			@game.set_word 'person'
			@game.try_with 'e'
			@game.get_state.should eq "-e----"
		end

		it "return -a-a--a if @word is 'naranja' and after try_with 'a'" do
			@game.set_word 'naranja'
			@game.try_with 'a'
			@game.get_state.should eq "-a-a--a"
		end

		it "return --s- if @word is 'naranja' and after try_with 'a' and 'c'" do
			@game.set_word 'casa'
			@game.try_with 'a'
			@game.try_with 'c'
			@game.get_state.should eq "ca-a"
		end
	
	end
	
end
