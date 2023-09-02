module ApplicationHelper
  def default_meta_tags
    {
      site: 'BOOZEKUZU',
      title: '酒KUZUのためのコレクションアプリ',
      reverse: false,
      charset: 'utf-8',
      description: 'あなたが出逢ったお酒をコレクション。',
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
        image: image_url('ogp.png'),
        local: 'ja-JP'
      },

      twitter: {
        card: 'summary_large_image',
        site: '@MIDORI_ruby7',
        image: image_url('ogp.png')
      }
    }
  end
end
