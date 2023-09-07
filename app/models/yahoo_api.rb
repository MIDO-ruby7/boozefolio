class YahooApi < ApplicationRecord
  def self.item_search(query, yahoo_genre_category_id)
    url = "https://shopping.yahooapis.jp/ShoppingWebService/V3/itemSearch"
    params = { appid: ENV['YAHOO_CLIENT_ID'], query: query, genre_category_id: yahoo_genre_category_id}
    response = RestClient.get(url, params: params)
    parsed_response = JSON.parse(response.body)

    hits = parsed_response["hits"]
    items_data = hits.map do |hit|
      cleaned_name = hit["name"].gsub(/\b(?:48本|24本|送料無料|全国一律送料無料|期間限定|数量限定|よりどりMIX|セット|×|350ml|750ml|パック|1ケース|2ケース|よりどり2ケース|7[%％]|350ml缶\(48本入り\)|500ml缶|350ml缶|500ml|缶|アルコール|4[%％]|\『YML\』|\(レモン&amp;グレープフルーツ\)350ml缶|ALC\.7[%％]|ALC.7|\（24本2箱\）| \（2箱\）24本|\（2箱\）|3本|12本|24本|フルボディ|ふるさと納税|あすつく|選べる|缶チューハイ|サワー|レモンサワー|酎ハイ|チューハイ|　|Alc.9%|ビール|缶ビール|赤ワイン|白ワイン|ロゼワイン|赤|白|フランス|チリ|西伊豆海底熟成ワインVOYAGE|イタリア|アメリカ|カリフォルニア|6本セット|飲み比べ)\b|\【.*?\】|\([^)]*\)|[%()]/, '').strip
      {
        "name" => cleaned_name,
      }
    end

    sorted_items_data = items_data.sort_by { |item| item["name"].length }.first(5)

    # Return items data as JSON
    { hits: sorted_items_data }
  end
end
