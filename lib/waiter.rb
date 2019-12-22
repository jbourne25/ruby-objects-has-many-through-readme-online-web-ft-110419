class Waiter
  
  def initialize(name, years_experience)
    @name = name 
    @years_experience = years_experience
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end 
  
  def meals 
    #grab all the meals, then return the waiters that carried out these meals 
    Meal.all.find_all{ |meal| meal.waiter == self }
  end 
  
  def best_tipper
    #go through the meals, find the customer that left the largest tip 
    meals.Customer.find{ |customer| customer.tip }.largest 
    
  end 
end