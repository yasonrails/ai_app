class CreateTrainingData < ActiveRecord::Migration[7.0]
  def change
    create_table :training_data do |t|
      t.text :input_data
      t.text :output_data
      t.timestamps
    end
  end
end
