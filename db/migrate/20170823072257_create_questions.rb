class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :text
      t.string :answer
      t.integer :author_id

      t.timestamps
    end

    add_reference :questions, :user, index:true, foring_key: true
  end
end
