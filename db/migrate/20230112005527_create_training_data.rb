class CreateTrainingData < ActiveRecord::Migration[7.0]
  def change
    create_table :training_data do |t|

      t.timestamps
    end
  end
end
