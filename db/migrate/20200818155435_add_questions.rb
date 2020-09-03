class AddQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :heading
      t.text :description
      t.timestamps
    end
  end
end
