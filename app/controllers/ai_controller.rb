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
        data = TrainingData.all
        input_data = data.map { |row| row.input_data }
        output_data = data.map { |row| row.output_data }
    
        model = TensorFlow::Keras::Sequential.new
        model.add(TensorFlow::Keras::layers::Dense.new(64, activation: 'relu'))
        model.add(TensorFlow::Keras::layers::Dense.new(32, activation: 'relu'))
        model.add(TensorFlow::Keras::layers::Dense.new(1, activation: 'sigmoid'))
        model.compile(optimizer: 'adam', loss: 'mean_squared_error')
    
        model.fit(input_data, output_data, epochs: 10)
      end
  end