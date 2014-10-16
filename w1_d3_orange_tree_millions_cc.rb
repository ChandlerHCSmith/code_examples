

# The OrangeTree ----------------------------------

class OrangeTree

	attr_reader :age, :height, :growth_rate, :quantity_of_fruit_on_tree, :maturity_status, :quantity_of_fruit_harvested_from_tree


	def initialize(args)
		@age = args[:age]
		@height = args[:height].to_f
		@growth_rate = args[:growth_rate] 
		@life_span = args[:life_span]
		@maturity_age = args[:maturity_age]
		@maturity_status = args[:maturity_status] || false
		@quantity_of_fruit_on_tree = args[:quantity_of_fruit_on_tree] || 0
		@quantity_of_fruit_harvested_from_tree = @quantity_of_fruit_on_tree
	end

	def age!
		@age += 1
		if @age >= @maturity_age
			@maturity_status = true
		end
		change_height
		grow_fruit
		alive?
	end

	def change_height
		if @age < 45
			@height += @growth_rate
		else
			@height
			@growth_rate = 0.0
		end
	end

	def grow_fruit
		if @maturity_status
			if @age > 5 && @age <=10
				@quantity_of_fruit_on_tree = 40 + rand(40000)
			elsif @age > 10 && @age <= 15
				@quantity_of_fruit_on_tree = 60 + rand(100000)
			elsif @age > 15 && @age <= 25
				@quantity_of_fruit_on_tree = 80 + rand(150000)
			elsif @age > 25 && @age <= 40
				@quantity_of_fruit_on_tree = 80 + rand(250000)
			elsif @age > 40 && @age <= 88
				@quantity_of_fruit_on_tree = 80 + rand(350000)
			else @age > 88 && @age <= 100
				@quantity_of_fruit_on_tree = 40 + rand(200000)
			end
		else
			@quantity_of_fruit_on_tree = 0
		end
	end

	def harvest_time
		@quantity_of_fruit_harvested_from_tree = @quantity_of_fruit_on_tree
		@quantity_of_fruit_on_tree = 0
	end

	def alive?
		puts "Alas, the tree, she is dead!" if @age == @life_span
	end

end


# Each Orange --------------------------------------

class Orange

	attr_reader :diameter

	def initialize
		each_orange_harvested_this_yr = []
		diameter?
	end

	def diameter?
		@diameter = rand(5) + 2
	end

end

# Driver Code ---------------------------------------


# Making an Orange Tree------------------------------

orange_tree_1 = OrangeTree.new({:age => 5, 
								:height =>5 ,
								:growth_rate => 0.5, 
								:life_span => 100, 
								:quantity_of_fruit_on_tree => 0, 
								:maturity_age => 5, 
								:maturity_status => false})

# --------------------------------------------------

# Now, what about the specifics of each orange after only one year?


# basket_1 = []
# puts "~-~-~-~-~-~-~-~-Just one life cycle and determining its fruit~-~-~-~-~-~-~-~-~-~-~-~-~"
# x = orange_tree_1.age!
# p orange_tree_1
# p orange_tree_1.quantity_of_fruit_on_tree


# harvest_1 = (orange_tree_1.quantity_of_fruit_on_tree).times{
# 															basket_1 << Orange.new
# 															}
# puts "Here is basket_1:"
# p basket_1

# l = basket_1.length
# p l
# sum_of_all_diameters = 0
# basket_1.each{|orange|
# 				sum_of_all_diameters += orange.diameter}
# p sum_of_all_diameters

# p average_diameter = sum_of_all_diameters/l




# Going through its life cycle ---------------------

# puts "~-~-~-~-~-~-~-~-65 life cycle But only the tree's history~-~-~-~-~-~-~-~-~-~-~-~-~"

# history_of_harvests = []
# total_over_years = 0

# 65.times {p orange_tree_1
# orange_tree_1.age!
# p orange_tree_1
# orange_tree_1.harvest_time
# history_of_harvests << orange_tree_1.quantity_of_fruit_harvested_from_tree}

# history_of_harvests.each {|harvest|
# 							total_over_years += harvest}

# p history_of_harvests
# p total_over_years

# ----------- Combining both -------------


# Going through its life cycle ---------------------

puts "~-~-~-~-~-~-~-~-99 life cycle But only the tree's history~-~-~-~-~-~-~-~-~-~-~-~-~"

history_of_harvests = []
total_over_years = 0

94.times {p orange_tree_1
orange_tree_1.age!
p orange_tree_1
orange_tree_1.harvest_time
history_of_harvests << orange_tree_1.quantity_of_fruit_harvested_from_tree}

history_of_harvests.each {|harvest|
							total_over_years += harvest}

p history_of_harvests
p total_over_years

basket_lifetime = []
puts "~-~-~-~-~-~-~-~-Determining its Fruit Averages at the end of all the harvests ~-~-~-~-~-~-~-~-~-~-~-~-~"


harvest_1 = (total_over_years).times{
									basket_lifetime << Orange.new
									}
puts
puts "Here is a record of all fruits collected:"
p basket_lifetime

l = basket_lifetime.length

sum_of_all_diameters = 0
basket_lifetime.each{|orange|
				sum_of_all_diameters += orange.diameter}
sum_of_all_diameters

average_diameter = sum_of_all_diameters/l

puts
puts "Stats on our beloved Orange Tree:"
puts
puts "Age: #{orange_tree_1.age}"
puts "Number of Oranges collected to date:  #{l}."
puts "Fruit's average diameter: #{average_diameter} inches."
puts
# ------------------------

=begin
	
basket_1 = []

harvest_1 = (orange_tree_1.quantity_of_fruit_harvested_from_tree).times {
																			basket_1 << Orange.new
}

p harvest_1


# class Basket

# 	def initialize
# 		basket = []
# 	end

# end


def its_history(tree)
	history_of_harvests = []
	total = 0
	99.times {p tree
	tree.age!
	p tree
	tree.harvest_time
	history_of_harvests << tree.quantity_of_fruit_harvested_from_tree}
	p history_of_harvests
	history_of_harvests.each {|annual|
								total += annual}
	p total
end

# def  

# end

its_history(orange_tree_1)


# ------------------------------------


# class Records

# 	def initialize(tree)
# 		history_of_harvests = []
# 		@tree = tree
# 	end


# 	def its_history(yrs)
# 		yrs.times {p @tree
# 		@tree.age!
# 		p @tree
# 		@tree.harvest_time
# 		history_of_harvests << @tree.quantity_of_fruit_harvested_from_tree}
# 		p history_of_harvests
# 	end

 

# end

# records_1 = Records.new(orange_tree_1)
# p records_1
# records_1.its_history(99)



	
=end

