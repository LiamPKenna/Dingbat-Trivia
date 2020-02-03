class AddQuestionsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.column :question, :string
      t.column :correct_answer, :integer
      t.column :answer_1, :string
      t.column :answer_2, :string
      t.column :answer_3, :string
      t.column :answer_4, :string
    end
  end
end
