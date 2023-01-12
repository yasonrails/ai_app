class AiController < ApplicationController
    def generate_text
      prompt = params[:prompt]
      response = Openai.completion(
        model: "text-davinci-002",
        prompt: prompt,
        max_tokens: 150
      )
      @generated_text = response.choices[0].text
    end
    def predict
        input_data = params[:input_data]
        prediction = model.predict(input_data)
        render json: { prediction: prediction }
    end
    def train
        data = TrainingDatum.all
        input_data = data.map { |row| row.input_data }
        output_data = data.map { |row| row.output_data }
    
    end
  end