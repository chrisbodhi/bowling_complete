class BowlingGame 
	attr_accessor :rolls

	def initialize
		@rolls = []
		@total_score = 0
		@current_roll = 0
	end

	# Record a roll in the BowlingGame
	#
	# pins - An Integer of pins that are knocked down in each roll.
	#
	# Returns nothing
	def roll(pins)
		@rolls << pins
	end


	# Returns the integer score for the game, taken from @rolls. Runs
	# after all rolls have been recorded.
	def score
		while @current_roll < @rolls.size
			init_roll

			if strike?
				score_strike
			elsif spare?
				score_spare
			else
				score_standard
			end
		end
					
		return @total_score
	end

	# Here begins the methods used to score the Game of the Dude.
	private

	# Initialize values for roll and next_roll.
  #
  # Returns nothing.
	def init_roll 
		@roll 			= @rolls[@current_roll]
		@next_roll 	= @rolls[@current_roll + 1]
	end

	# Returns true if the current roll is a strike, false otherwise.
	def strike?
		@roll == 10
	end

  # Scores a strike frame, and adds it to the total score for the game.
  #
  # Returns nothing.
	def score_strike
		@total_score += 10 + @next_roll + @rolls[@current_roll + 2]
		@current_roll += 1
	end

	# Returns true if the current roll and the next roll comprise a 
	# spare, false otherwise.
	def spare?
		@roll + @next_roll == 10
	end

  # Scores a spare [two frames], and adds it to the total game score.
  #
  # Returns nothing.
	def score_spare
		@total_score += 10 + @rolls[@current_roll + 2]
		@current_roll += 2
	end

  # Scores a standard roll, and adds it to the total score for the game.
  #
  # Returns nothing.
	def score_standard
		@total_score += @roll + @next_roll
		@current_roll += 2
	end
end