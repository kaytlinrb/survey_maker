require ('spec_helper')

describe(Survey) do
  describe("#question") do
  it("tells which questions are in this survey") do
    test_survey = Survey.create({:survey_title => "new survey"})
    new_question = Question.create({:question_description => "question 1", :survey_id => test_survey.id})
    new_question2 = Question.create({:question_description => "question 2", :survey_id => test_survey.id})
    expect(test_survey.questions()).to(eq([new_question, new_question2]))
  end
end

  it("converts the first letter of each word to a capital")do
    survey = Survey.create({:survey_title => "favorite movies"})
    expect(survey.survey_title()).to(eq("Favorite Movies"))
  end
end

 
