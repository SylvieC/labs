#Title: Gluten Free

#Prerequisites:
#- Ruby
#    - Exceptions
#    - Hashes & Arrays
#    - Objects & Classes

#Objectives:
#- Work with exceptions, classes, class variables, conditions

"======================================================================"

# Create a Person class. A person will have a stomach and allergies
# Create a method that allows the person to eat and add arrays of food to their stomachs
# If a food array contains a known allergy reject the food.

#stomach takes in arrays and is itself an array
#allergies is also an array
class AllergyError < ArgumentError
end

class Person
	attr_accessor :stomach, :allergies

	def initialize(allergies)
		@allergies = allergies
		@stomach = []
	end

	def food_ok?(food)
		for food_item in food do
			for allergy in @allergies do
				if allergy == food_item
				return false
			end
		end
		end
		return true
	end

	def eat(food)
		if food_ok?(food)
		@stomach += food
    end

		begin
			if !food_ok?(food)
				 puts "I think I'm going to throw up"
				 @stomach = []
			   raise  AllergyError.new("Don't eat that")
      end 
		rescue AllergyError =>  error 
			puts "Allergy!"
			
		end

	end
end








# Create a Person named Chris. Chris is allergic to gluten.
# Create a Person named Beth. Beth is allergic to scallops.
# Feed them the following foods

Chris = Person.new(["gluten"])
Beth = Person.new(["scallops"])

pizza = ["cheese", "gluten", "tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]


Chris.eat(pizza)
Chris.eat(pan_seared_scallops)
Chris.eat(water)

Beth.eat(pizza)
Beth.eat(pan_seared_scallops)
Beth.eat(water)




# When a person attempts to eat a food they are allergic to, raise a custom exception
# For example:  AllergyError

# Bonus: When a person attempts to eat a food they are allergic to,
#        ... remove ALL the food from the person's stomach before raising the exception
