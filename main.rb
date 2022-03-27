require_relative "lib/quiz"
require_relative "lib/question_parser"

NUMBER_OF_QUESTIONS = 5
TIME_TO_ANSWER = 10 #Seconds

quiz = Quiz.new(QuestionParser.get("data/questions.xml", NUMBER_OF_QUESTIONS))

puts "💡 Викторина! Ответите на вопросы. На каждый ответ даётся #{TIME_TO_ANSWER} секунд. Не успел — проиграл!"
puts

until quiz.over?
  puts quiz.ask_question

  begin
    users_answer = Timeout::timeout(TIME_TO_ANSWER) { gets.to_i }
  rescue Timeout::Error
    puts "Упс, время истекло! Ты не успел :("
    break
  end

  puts quiz.check_answer(users_answer)
  quiz.next_question
end

puts quiz.score
