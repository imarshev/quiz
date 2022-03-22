require_relative "lib/quiz"
require_relative "lib/question_collector"

quiz = Quiz.new(QuestionCollector.new.questions)

puts "💡 Викторина! Ответите на вопросы:"
puts

until quiz.over? do
  puts quiz.ask_question
  if quiz.right_answer?(gets.to_i)
    quiz.add_points
    puts "Верно ✅"
  else
    puts "Неверно ❌ Правильный ответ: #{quiz.correct_answer}"
  end
  quiz.next_question
end

puts quiz.score
