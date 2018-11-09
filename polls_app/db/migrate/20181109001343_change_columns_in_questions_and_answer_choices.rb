class ChangeColumnsInQuestionsAndAnswerChoices < ActiveRecord::Migration[5.1]
  def change
    change_column :questions, :text, :string, null: false
    change_column :answer_choices, :text, :string, null: false
  end
end
