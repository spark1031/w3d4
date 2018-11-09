# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do

  User.destroy_all
  
  #Users
  user1 = User.create!(username: "Kuma")
  user2 = User.create!(username: "Sparky")
  user3 = User.create!(username: "Liz")
  
  Poll.destroy_all
  
  #Polls
  poll1 = Poll.create!(author_id: user1.id, title: "Favorite Food")
  poll2 = Poll.create!(author_id: user1.id, title: "Favorite Car")
  poll3 = Poll.create!(author_id: user2.id, title: "Favorite City")
  poll4 = Poll.create!(author_id: user3.id, title: "Favorite Bootcamp")

  Question.destroy_all
  question1 = Question.create!(poll_id: poll1.id, text: "What is your favorite Chinese Food?")
  question2 = Question.create!(poll_id: poll1.id, text: "What is your favorite Korean Food?")
  question3 = Question.create!(poll_id: poll3.id, text: "What is your favorite City in America?")
  question4 = Question.create!(poll_id: poll4.id, text: "What is your favorite Bootcamp in San Fran?")

  AnswerChoice.destroy_all
  answer1 = AnswerChoice.create!(question_id: question1.id, text: "Orange Chicken")
  answer2 = AnswerChoice.create!(question_id: question1.id, text: "Mongolian Beef")
  answer3 = AnswerChoice.create!(question_id: question2.id, text: "Bulgogi")
  answer4 = AnswerChoice.create!(question_id: question2.id, text: "BiBimBap")
  answer5 = AnswerChoice.create!(question_id: question3.id, text: "Seattle")
  answer6 = AnswerChoice.create!(question_id: question3.id, text: "Santa Cruz")
  answer7 = AnswerChoice.create!(question_id: question3.id, text: "San Diego")
  answer8 = AnswerChoice.create!(question_id: question4.id, text: "Hack Reactor")
  answer9 = AnswerChoice.create!(question_id: question4.id, text: "App Academy")

  Response.destroy_all
  response1 = Response.create!(answer_id: answer1.id, user_id: user1.id)
  response2 = Response.create!(answer_id: answer2.id, user_id: user2.id)
  response3 = Response.create!(answer_id: answer2.id, user_id: user3.id)

  response4 = Response.create!(answer_id: answer3.id, user_id: user1.id)
  response5 = Response.create!(answer_id: answer4.id, user_id: user2.id)

  response6 = Response.create!(answer_id: answer5.id, user_id: user1.id)
  response7 = Response.create!(answer_id: answer7.id, user_id: user2.id)
  response8 = Response.create!(answer_id: answer5.id, user_id: user3.id)

  response9 = Response.create!(answer_id: answer8.id, user_id: user3.id)
  
end





