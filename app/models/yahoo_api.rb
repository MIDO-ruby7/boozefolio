class YahooApi < ApplicationRecord
  def self.item_search(query, category_id)
    url = "https://shopping.yahooapis.jp/ShoppingWebService/V3/itemSearch"
    params = { appid: ENV['YAHOO_CLIENT_ID'], query: query, category_id: category_id)
    response = RestClient.get(url, params: params)
    parsed_response = JSON.parse(response.body)

    hits = parsed_response["hits"]
    items_data = hits.map do |hit|
      cleaned_name = hit["name"].gsub(/\b(?:48本|24本|送料無料|全国一律送料無料|期間限定|500ml|缶|よりどりMIX|セット|×|350ml|パック|1ケース|2ケース|よりどり2ケース|7[%％]|350ml缶\(48本入り\)|500ml缶|350ml缶|アルコール|4[%％]|\『YML\』|\(レモン&amp;グレープフルーツ\)350ml缶|ALC\.7[%％]|ALC.7|\（24本2箱\）| \（2箱\）24本|ふるさと納税|あすつく|選べる|缶チューハイ|サワー|レモンサワー|酎ハイ|缶チューハイ|レモンサワー|　|Alc.9%|ビール)\b|\【.*?\】|\([^)]*\)|[%()]/, '').strip
      {
        "name" => cleaned_name,
      }
    end

    # Return items data as JSON
    { hits: items_data }
  end
end
