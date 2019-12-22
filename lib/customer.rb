class Customer
  
  #@@all = []
  
  def initialize(name, age)
    @name = name 
    @age = age 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def new_meal(waiter, total, tip)
    Meal.new(waiter, self, total, tip)
  end
  
  def meals 
    #grab all the meals, then find the meals that were orderd by this customer  
    Meal.all.find_all{ |meal| meal.customer == self }
  end
  
  def waiters 
    #grabs all the customer's meals, then returns all the waiters that carried these meals  
    self.meals.collect { |meal| meal.waiter }
  end 
  
end