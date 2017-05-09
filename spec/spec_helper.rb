ENV['RACK_ENV'] = 'test'

require("rspec")
require("pg")
require("pry")
require("sinatra/activerecord")
require("./lib/question")
require("./lib/survey")
require('rake')


RSpec.configure do |config|
  config.after(:each) do
    Question.all().each() do |question|
      question.destroy()
    end
    Survey.all().each() do |survey|
      survey.destroy()
    end
  end
end
