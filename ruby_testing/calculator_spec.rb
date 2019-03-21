#spec/calculator_spec.rb
require './lib/calculator.rb'
RSpec.describe Calculator do
    describe "#add" do
      it "returns the sum of two numbers" do
        calculator = Calculator.new
        expect(calculator.add(5, 2)).to eql(7)
      end
    end
    describe "#multiply" do
        it "returns the product of two numbers" do
            calculator = Calculator.new 
            expect(calculator.multiply(5,2)).to eql(10)
        end
    end
  end