class AddQuestionTags < ActiveRecord::Migration[6.0]
  def change
    create_table :question_tags do |t|
      t.references :question
      t.references :tag
    end
  end
end
