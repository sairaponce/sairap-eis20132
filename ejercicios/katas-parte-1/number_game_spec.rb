require 'rspec'
require_relative './fizz_buzz.rb'

describe 'analizarFB' do
	it 'Si se analiza el 6 debe imprimir Fizz' do 
		fizzbuzz = FizzBuzz.new 
		fizzbuzz.analizarFB(6).should eq "Fizz"
	end
end
