class CreateSurveys < ActiveRecord::Migration[5.1]
  def change
    create_table(:surveys) do |s|
      s.column(:survey_title, :string)
    end
  end
end
