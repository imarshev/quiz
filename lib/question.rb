require_relative "inclination"

class Question
  attr_reader :question, :answer, :points

  def initialize(question, answer, points, answer_options)
    @question = question
    @answer = answer
    @points = points.to_i
    @answer_options = answer_options
  end

  def self.from_xml_element(element)
    question = element["question"]
    answer = element["right_answer"]
    points = element["points"]
    answer_options = [answer, element["answer2"], element["answer3"], element["answer4"]].shuffle

    new(question, answer, points, answer_options)
  end

  def to_s
    "#{@question} (#{@points} #{Inclination.incline("балл", @points)})\n" +
    @answer_options.map.with_index(1) { |option, i| "#{i}. #{option}"}.join("\n")
  end

  def right_answer?(users_answer)
     @answer == @answer_options[users_answer-1]
  end


end
