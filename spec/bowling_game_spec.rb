require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../bowling_game.rb'


describe BowlingGame do 
	let(:game) { BowlingGame.new}

	describe '.initialize' do 
		it 'sets @rolls to an empty array' do 
			expect(game.rolls).to eql []
		end
	end

	describe "#score" do
		context "when we have all gutterballs..." do
			it "should set the score to 0:" do
				20.times {game.roll(0)}

				expect(game.score).to eq 0
			end
		end

		context "When one pin is knocked down on each roll..." do
		
			it "should set the score as 20:" do 
				20.times { game.roll(1) }

				expect(game.score).to eq 20
			end
		end

		context "When a spare is achieved..." do
			it "then the score should be 10 plus the number of pins knocked down on the next roll." do
				3.times {game.roll(5)}
				17.times {game.roll(0)}

				expect(game.score).to eq 20
			end
		end

		context "When a strike is thrown" do 
			it 'records the frame score as 10 plus the total number of pins knocked down in the next two rolls' do 
				game.roll(10)
				game.roll(7)
				game.roll(1)
				16.times { game.roll(0) }

				expect(game.score).to eq 26
			end
		end
		  
	end
end