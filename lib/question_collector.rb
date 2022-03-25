require "rexml/document"
require_relative "question"

module QuestionParser
  module_function
  def get(path, number)
    doc = REXML::Document.new(File.read(File.join(__dir__, "..", path)))
    @questions = doc.elements.collect("questions/question") do |question|
      Question.new(
        question["question"],
        question["right_answer"],
        question["points"],
        [question["right_answer"], question["answer2"], question["answer3"], question["answer4"]].shuffle
      )
    end.sample(number).shuffle
  end
end
