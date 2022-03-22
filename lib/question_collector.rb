require "rexml/document"
require_relative "question"

class QuestionCollector
  attr_reader :questions
  def initialize
    doc = REXML::Document.new(File.read(File.join(__dir__, "..", "data", "questions.xml")))
    questions = []
    doc.elements.each("questions/question") { |question| questions << Question.from_xml_element(question) }
    @questions = questions.sample(5).shuffle
  end
end
