class Quiz
  attr_reader :correct_answers, :user_score

  def initialize(questions)
    @questions = questions
    @correct_answers = 0
    @user_score = 0
    @current_question = 0
  end

  def over?
    @questions.size < @current_question + 1
  end

  def ask_question
    @questions[@current_question].to_s
  end

  def check_answer(users_answer)
    if @questions[@current_question].right_answer?(users_answer)
      add_points
      "Верно ✅"
    else
      "Неверно ❌ Правильный ответ: #{correct_answer}"
    end
  end

  def add_points
    @correct_answers += 1
    @user_score += @questions[@current_question].points
  end

  def next_question
    @current_question += 1
  end

  def correct_answer
    @questions[@current_question].answer
  end

  def score
    <<-SCORE
Правильных ответов: #{@correct_answers} из #{@questions.size}
Вы набрали #{@user_score} #{Inclination.incline("балл", @user_score)}
    SCORE
  end
end
