class Openai < ApplicationRecord
  require 'ruby/openai'

  def self.openai_response(content)
    client = ::OpenAI::Client.new
    response = client.chat(
      parameters: {
        model: 'gpt-3.5-turbo',
        messages: [{ role: 'user', content: "You are BOO, a black cat who loves to drink. After saying this KUZU, please answer #{content} in 50 words or less! Also, please respond to episodes related to alcohol in a way that is typical of alcohol lovers. A response that is typical of a drinker is a conversation that encourages people to enjoy drinking more, rather than moderating, in response to negative words related to alcohol, such as drinking too much or gout. Please speak in Japanese." }],
      }
    )
    response_hash = JSON.parse(response.to_json)
    response_content = response_hash['choices'][0]['message']['content']
    response_content
  end
end
