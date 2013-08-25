# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

questions = Set.new()
questions.add("Pick a song and replace the last word with the word 'banana'.")
questions.add("What movie best describes your relationship status?")
questions.add("Would you rather be Jedi or be a Sith?")
questions.add("If we lost all memory of photoshop, but the pictures remained, which photo would be hardest to explain?")
questions.add("If companies had realistic slogans what would they be?")
questions.add("What morbid question have you always wanted to ask but haven't?")
questions.add("You are forced to become flatmates with a character from the last movie you watched. Who do you pick?")
questions.add("If your parents let you pick your name when you were 5 years old, what would your name be today?")
questions.add("You are killed and Death lets you choose a game to challenge him at for another chance at life. What game do you choose? ")
questions.add("If your parents let you pick your name when you were 5 years old, what would your name be today?")
questions.add("All films are actually parallel universes that you can travel to, but only stay in one. Which one do you pick?")
questions.add("If you could pick any mythical creature to actually exist, which would you pick and why?")

questions.each { |question|
  StammrPost.create(content: question)
}
