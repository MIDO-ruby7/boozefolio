class Openai < ApplicationRecord
  require 'ruby/openai'

  def self.openai_response(content)
    client = ::OpenAI::Client.new
    response = client.chat(
      parameters: {
        model: 'gpt-3.5-turbo',
        messages: [{ role: 'user', content: "#{content}に対して「このKUZU！」と言ってから20文字以内でポジテイブに返信してください。例「このKUZU！最高だ!」" }],
      }
    )
    response_hash = JSON.parse(response.to_json)
    response_content = response_hash['choices'][0]['message']['content']
    response_content
  end
end
