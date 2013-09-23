require 'rspec'
require_relative './permutation.rb'

describe Permutation do

	describe 'initialize' do

		it 'should set value' do
			p = Permutation.new('cadena')
			p.aString.should eq 'cadena'
		end

	end

	describe 'permute' do

		it 'the number of permutations = fact(size of the string)' do
			p = Permutation.new('cadena')
			factOfSize = p.fact(p.aString.length)
			p.permute(p.aString).should eq factOfSize
		end
	end
end
