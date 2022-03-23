require "rexml/document"
require_relative "question"

module QuestionCollector
  module_function
  def get(path, number)
    doc = REXML::Document.new(File.read(File.join(__dir__, "..", path)))
    @questions = doc.elements.collect("questions/question") { |question| Question.from_xml_element(question) }.
      sample(number).shuffle
  end
end
