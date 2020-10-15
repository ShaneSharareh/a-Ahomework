require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) {Dessert.new("Cheesecake",12,chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("Cheesecake")
    end
    it "sets a quantity" do
      expect(dessert.quantity).to eq(12)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients.empty?).to eq(true)
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("Brownie","twelve",chef)}.to raise_error{ArgumentError}
    end
  end

  describe "#add_ingredient" do
    before(:each) do
      dessert.add_ingredient("Fleetwood Cake")
    end
    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients.last).to eq(dessert.ingredients.last)
    end
  end
  
  test_ingredients = ["Fleetwood Sauce","Zeppagain Syrup","Chocolate Sauce","Extra Cherries","olives","cranberries","milk"]

  describe "#mix!" do
    before(:each) do 
      test_ingredients.each{ |ele|dessert.add_ingredient(ele)}
    end
    it "shuffles the ingredient array" do 
      #before 
      expect(dessert.ingredients).to eq (test_ingredients)
      #mix
      dessert.mix!
      #after
      expect(dessert.ingredients).to_not eq (test_ingredients)
    end
  end

  describe "#eat" do
    
    it "subtracts an amount from the quantity" do
       amount = 5
      #before 
      quantity_before_eat = dessert.quantity
      #eat
      dessert.eat(amount)
      #after
      expect(dessert.quantity + amount).to eq(quantity_before_eat)
    end

    it "raises an error if the amount is greater than the quantity"
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve.include?(chef.titleized)).to eq(true)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
