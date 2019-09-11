class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.text :description
      t.integer :questions_count
      t.references :user, foreign_key: true 

      t.timestamps
    end
  end
end
