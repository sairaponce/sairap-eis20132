require 'rspec'
require_relative './roman_number.rb'

describe RomanNumber do

  describe 'initialize' do

    it 'should set value' do
      rn = RomanNumber.new('I')
      rn.value.should eq 'I'
    end

  end

  describe 'add' do

    it 'should return II when adding I and I' do
      i = RomanNumber.new('I')
      result = i.add(i.value)
      result.should eq RomanNumber.new('II').value
    end

  end
    
end
