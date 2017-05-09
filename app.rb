require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require('./lib/question')
require('./lib/survey')
also_reload('lib/**/*.rb')
require("pg")

get('/') do
  erb(:index)
end

get('/surveys/new')do
  erb(:survey_form)
end

post('/surveys') do
  survey = params.fetch('survey_input')
  new_survey = Survey.create({:survey_title => survey})
  erb(:new_survey_success)
end

get('/surveys') do
  @surveys = Survey.all()
  erb(:surveys)
end

get('/surveys/:id') do
  @survey = Survey.find(params.fetch('id').to_i())
  @questions = Question.all()
  erb(:survey)
end

get('/survey/:id/edit') do
  @survey = Survey.find(params.fetch('id').to_i())
  erb(:survey_edit_form)
end

patch('/surveys/:id') do
  @survey = Survey.find(params.fetch('id').to_i())
  update_title = params.fetch('survey_title')
  @survey.update({:survey_title => update_title})
  erb(:index)
end

get('/survey/:id/questions/new')do
@survey = Survey.find(params.fetch('id').to_i())
  erb(:questions_form)
end

post('/survey/:id/question/return') do
  @survey = Survey.find(params.fetch('id').to_i())
  question = params.fetch('question_input')
  new_question = Question.create({:question_description => question, :survey_id => @survey.id()})
  @questions = Question.all()
  erb(:survey)
end

get('/questions/:id') do
  @question = Question.find(params.fetch('id').to_i())
  erb(:question_edit)
end

patch('/question/:id/edit') do
  @question = Question.find(params.fetch('id').to_i())
  updated_question = params.fetch('question_description')
  @question.update({:question_description => updated_question})
  erb(:survey)
end
