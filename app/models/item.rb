class Item < ApplicationRecord
  require 'net/http'
  require 'dotenv'
  Dotenv.load

  belongs_to :user
  has_many :tags, through: :item_tags
  has_many :item_tags, dependent: :destroy
  mount_uploader :image, BoozeImageUploader

  def get_image_tags
    uri = URI('https://booze-folio.cognitiveservices.azure.com/vision/v3.1')
    uri.query = URI.encode_www_form({
    # Request parameters
      'visualFeatures' => 'Tags',
      'language' => 'ja'
    })

    body = {
      url: self.image.url,
      visualFeatures: 'Tags',
      language: 'ja'
    }

    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = ENV['AZURE_COMPUTER_V_KEY']
    # Request body
    request.body = body.to_json

    response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end

    data = JSON.parse(response.body)
    tags = data['tags'].map { |tag| tag['name'] }

    tags
  end
end
