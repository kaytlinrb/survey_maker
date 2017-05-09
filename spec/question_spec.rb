require ('spec_helper')

describe(Question) do
  describe("#survey") do
    it("tells to which survey questions belong") do
      new_survey = Survey.create({:survey_title => "new survey"})
      test_question = Question.create({:question_description => "What is the meaning of life?", :survey_id => new_survey.id()})
      expect(new_survey.questions()).to(eq([test_question]))
    end
  end
end
