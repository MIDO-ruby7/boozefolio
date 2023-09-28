# BOOZEKUZU
### https://www.sakekuzu.win
<img src="https://boozepedia.s3.ap-northeast-3.amazonaws.com/material/ogp.png" width="70%" />


## ■ サービス概要
BOOZEKUZU。それは酒を飲む行為を正当化しようとする生物。新しい酒を手に取り、終電逃し、人と酒を愛するKUZU向けのSNSです。

## ■ユーザーが抱える課題
飲んだお酒の写真はとるけど、そのままどこにいったか分からなくなる。投稿・記録したいわけではない。  
また、XなどのSNSでは自分が飲んだお酒や酔った失敗、〆のご飯などを投稿する傾向にある。  
そういったお酒好きの人には、記録はしておきたいし、人との交流やお酒のエピソードを楽しみたいという潜在的ニーズがあると考え、このサービスを作りました。

## ■メインのターゲットユーザー
・お酒との出会いにときめく人  
・コンビニで新しいお酒が出ていると買ってしまう人  
・旅行先で知らないお酒を見たら写真に撮る人  
・飲むのも呑まれるのも好きな人  

## ■機能
（以下の例は実際のアプリの機能から一部省略しています）

|  |  |
| ---- | ---- |
| 酒KUZUバリデーション|Google認証ログイン|
|   <img width="270" alt="スクリーンショット 2023-09-17 7 21 38" src="https://github.com/MIDO-ruby7/boozefolio/assets/111557292/aebd9553-129b-4f3b-99f0-4198eb1aaab5"> |<img width="280" alt="スクリーンショット 2023-09-27 19 45 31" src="https://github.com/MIDO-ruby7/boozefolio/assets/111557292/943f9856-0723-492c-ac5f-2fc0df073030">|
| チュートリアル | みんなが飲んだお酒一覧 |
| <img width="270" alt="スクリーンショット 2023-09-17 7 21 38" src="https://github.com/MIDO-ruby7/boozefolio/assets/111557292/1f3d8720-d39b-43b7-8b86-eb4bba8f5800">|<img width="280" alt="スクリーンショット 2023-09-27 20 12 59" src="https://github.com/MIDO-ruby7/boozefolio/assets/111557292/d9b5da69-6591-4372-90b5-efb9155f36f2">|
| お酒投稿 | タイムライン |
| <img width="280" alt="スクリーンショット 2023-09-27 20 15 37" src="https://github.com/MIDO-ruby7/boozefolio/assets/111557292/c82eb6ef-dd52-4d37-abe6-51dae2132e9a"><br/>カテゴリを選ぶと自動で初期値が入力されます|<img width="270" alt="スクリーンショット 2023-09-27 20 17 20" src="https://github.com/MIDO-ruby7/boozefolio/assets/111557292/8a60f3ac-540c-46ee-a325-c3f2fdca9d58"> <br/>スタンプ機能とマスコットキャラからの返信機能</br>(OpenAI API)もつけています。|
| インクリメンタルサーチ | バーコード検索 |
| <img width="280" alt="スクリーンショット 2023-09-27 20 27 55" src="https://github.com/MIDO-ruby7/boozefolio/assets/111557292/4a772822-0427-4680-a6f8-4c3dc01982a5"><br/>DBから検索し、存在しなければ<br/>Yahoo APIより検索して結果を返します|<img width="280" alt="スクリーンショット 2023-09-27 20 16 55" src="https://github.com/MIDO-ruby7/boozefolio/assets/111557292/633c0304-57d3-4093-acaa-7f7744a30ad9"><br/>Yahoo APIよりJANコード検索します<br/>商品名を押すと自動で名前などの値が入ります|
| コレクション |PWA　|
|<img width="280" alt="スクリーンショット 2023-09-27 20 17 08" src="https://github.com/MIDO-ruby7/boozefolio/assets/111557292/990b397b-7b01-4f16-982e-4ff43fd61a05">|　<img width="200" alt="スクリーンショット 2023-09-27 20 17 08" src="https://boozepedia.s3.ap-northeast-3.amazonaws.com/material/icon192.png"><br/>PWAに対応させています||


## ■なぜこのサービスを作りたいのか？

現職が営業です。弊社の製品は潜在的なニーズに対して営業する商品が多く、そういった明らかでないペインやニーズにアプローチしてみたいと思いました。
私はお酒が好きで、コンビニで新しい商品が並ぶとすぐ手に取ってしまうし、旅行に行ったらご当地のお酒やビールを飲むのが楽しみです。それらの写真は撮りますが、投稿意欲はなく面倒だという気持ちが強いです。しかし、Twitterなどには投稿することがあります。この、飲んだお酒をコレクションする楽しみや誰かと共有したいという潜在的なニーズをアプリにしてみたいと思い開発に至りました。

## ■使用技術

Ruby, Rails7, Tailwind CSS, daisy UI, JavaScript, jQuery, AWS(S3), heroku

#### gem:  
🎨画像アップロード  
  carrierwave  
  mini_magick  
  fog-aws  
  
🧠OpenAI　API  
 ruby-openai  
  
🧑‍✈️Google認証  
  googleauth  
  
👥共同編集履歴管理  
  paper_trail  
  
🤷‍♀️多言語化対応  
  enum_help  
  rails-i18n  
  
🌝その他  
  meta tag  
  dotenv-rails  
  rest-client  
  amatch  
  
#### API  
 OpenAI API  
 Yahoo API  
 Google OAuth 2.0  
 
## ER図
<img width="1000" alt="スクリーンショット 2023-09-28 11 18 21" src="https://github.com/MIDO-ruby7/boozefolio/assets/111557292/d583c0b5-c139-4809-b8cf-b279a9d91947">

