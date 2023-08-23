module ApplicationHelper
  def default_meta_tags
    {
      site: 'BoozePedia',
      title: 'お酒と出逢う投稿型百科事典',
      reverse: true,
      charset: 'utf-8',
      description: 'コンビニで、旅先で、飲み会で。あなたが出逢ったお酒を投稿しよう。',
      keywords: 'お酒、ビール、ワイン、焼酎、ウイスキー、日本酒、梅酒',
      canonical: "https://boozefolio.herokuapp.com",
      separator: '|',
      icon: [
        { href: image_url('icon192.png') }
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.jpg'),
        local: 'ja-JP'
      },

      twitter: {
        card: 'summary_large_image',
        site: '@MIDORI_ruby7',
        image: image_url('ogp.jpg')
      }
    }
  end
end
