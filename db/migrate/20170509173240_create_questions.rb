class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table(:questions) do |q|
      q.column(:question_description, :string)
      q.column(:survey_id, :integer)
    end
  end
end
