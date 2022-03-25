require_relative "inclination"

class Question
  attr_reader :question, :answer, :points

  def initialize(question, answer, points, answer_options)
    @question = question
    @answer = answer
    @points = points.to_i
    @answer_options = answer_options
  end

  def right_answer?(users_answer)
    @answer == @answer_options[users_answer-1]
  end

  def to_s
    <<-QUESTION
#{@question} (#{@points} #{Inclination.incline("балл", @points)})
#{@answer_options.map.with_index(1) { |option, i| "#{i}. #{option}"}.join("\n")}
    QUESTION
  end
end


