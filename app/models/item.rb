class Item < ApplicationRecord
  belongs_to :user
  has_many :tags, through: :item_tags
  has_many :item_tags, dependent: :destroy
  mount_uploader :image, BoozeImageUploader

  def get_image_tags
    endpoint = 'https://westus.api.cognitive.microsoft.com/vision/v1.0/analyze'
    api_key = ENV['AZURE_COMPUTER_V_KEY_1']

    headers = {
      'Content-Type' => 'application/json',
      'Ocp-Apim-Subscription-Key' => api_key
    }

    body = {
      url: self.image.url,
      visualFeatures: 'Tags'
    }

    response = HTTParty.post(endpoint, headers: headers, body: body.to_json)
    data = JSON.parse(response.body)

    tags = data['tags'].map { |tag| tag['name'] }

    tags
  end
end
