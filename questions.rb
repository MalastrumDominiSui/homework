#!/bin/env ruby
## questions (from any directory in Terminal) displays list of all questions
## questions add "What is the meaning of life?" adds the question to the list
## list is a file located at ~/questions.txt use Ruby to read from that file, and write to this file.
## getting the question


puts "Q:".chomp
aQuestion = gets.chomp 


questionFile = File.open('questions.txt', 'r+')  ## opens file (gives it a memory address)
currentQuestions = questionFile.readlines  ## takes the lines of a file and puts them into an array
questionFile.close

questionNumber = "#{currentQuestions.length + 1}\. "
currentQuestions = currentQuestions + ["\n" + questionNumber + aQuestion]  ## adds new question in an array, to our current array of questions

newQuestionFile = File.new('questions.txt', 'w') 
currentQuestions.each {|line| newQuestionFile.write line}
newQuestionFile.close