
class FlashCards

	def initialize(array_of_card_information)
		@array_of_card_information = array_of_card_information
		@deck = []
		@guesses_counter = 0
		@number_of_questions = 0
	end

	def card_production
		l = @array_of_card_information.length/2
		for num in 0...l
			card = []
			card << @array_of_card_information[0]
			card << @array_of_card_information[1] 
			@deck << card
			@array_of_card_information.rotate!(2)
		end
		@deck
	end

	def shuffle_deck
		@deck.shuffle!
	end

	def print_cards
		print @deck
		puts
	end


	def play

		puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready?  Go!"

		l = @deck.length 
		p l
		
		for num in 0...l
			answered = false
			p @deck[num][0]
			p @deck[num][1]
			puts

			@number_of_questions += 1
			puts


			until answered

				puts @deck[num][0]
				puts 
				answer = gets.chomp!
				puts "Guess: #{answer}"

				if answer == @deck[num][1]
					puts "Correct!"
					puts
					@guesses_counter += 1
					answered = true
				else
					puts "Incorrect!  Try again."
					@guesses_counter += 1
				end
			end
		end
	end

	def results
		puts "Number of Guesses: #{@guesses_counter}"
		puts "Number of Questions: #{@number_of_questions}"
		success_index = (@number_of_questions.to_f/@guesses_counter)*100
		puts "Your success index: #{success_index}"
		puts "REMEMBER: The closer to 100 the better!"
	end
end



questions_and_answers = File.readlines('w2_d5_set_1_flashcards_1_cc.txt')
questions_and_answers.each {|x| x.chomp!}
questions_and_answers.delete("")


deck_1 = FlashCards.new(questions_and_answers)
deck_1.card_production
puts "Let's shuffle the deck!"
puts
deck_1.shuffle_deck
deck_1.play
deck_1.results






#  Maybe a better idea to have:

# class Deck
# end

# class Review
# end

# The Deck class is responsible for create a unique deck of "cards"
	# Create an array of cards and employ shuffle each time to create a unique deck to really test memory

# The Review class is responsible for "playing" the game.





