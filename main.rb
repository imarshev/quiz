require_relative "lib/quiz"
require_relative "lib/question_collector"

NUMBER_OF_QUESTIONS = 5

quiz = Quiz.new(QuestionCollector.get("data/questions.xml", NUMBER_OF_QUESTIONS))

puts "💡 Викторина! Ответите на вопросы. На каждый ответ даётся 10 секунд. Не успел — проиграл!"
puts

until quiz.over? do
  puts quiz.ask_question
  quiz.timer_start
  users_answer = gets.to_i
  quiz.timer_stop
  if quiz.timer_overdue?
    puts "Упс! Ты не успел, время вышло!"
    exit
  end
  if quiz.right_answer?(users_answer)
    quiz.add_points
    puts "Верно ✅"
  else
    puts "Неверно ❌ Правильный ответ: #{quiz.correct_answer}"
  end
  quiz.next_question
end

puts quiz.score
