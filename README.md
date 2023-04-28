## ■ サービス概要
「飲んだお酒の写真はとるけど、そのままどこにいったか分からなくなる」と言う人のための、お酒の記録が楽しくなる酒ログサービスです

## ■ユーザーが抱える課題
飲んだお酒の写真はとるけど、そのままどこにいったか分からなくなる。投稿・記録したいわけではない。

■課題に対する仮説
- 「そのままどこにいったか分からなくなる。投稿・記録したいわけではない」
  1. 自分のために投稿するほどの意欲はなく、面倒
  2. 見返す頻度は低い
  3. お酒を飲んだ後の写真をどのように保存するかについて、明確な方針を持っていない

- 「飲んだお酒の写真はとる」理由
  1. 新しいお酒と出会ったことは記録しておきたい
  2. 美味しいお酒は後で分かるように記録しておきたい
  3. ボトルやデザインそのものが可愛く気に入った
  4. 本当は記念に取っておきたいけど飾る場所はない

#### 理想：記録自体はしておきたいと思っている。
#### 現状：使用頻度も低いため投稿や記録までは面倒と感じており、撮った後の行動方針もない。
#### ニーズ：記録が面倒だと思わず、使用する理由が記録以外にもある記録アプリが欲しい

# ■解決方法
新しいもの、美味しいものを集める「コレクション」要素を有した記録アプリを作成する。
- 新しいお酒を集めることを楽しむ「集める機能」
- ボトルやデザインを楽しむための「飾る機能」
- 飲んだ量が見える化する「積み上げる機能」

# ■メインのターゲットユーザー
・お酒が好きな人
・飲んだお酒の写真を撮ることがある人
・コンビニで新しいお酒が出ていると買ってしまう人
・お酒のボトルや缶を収集している人

# ■実装予定の機能
（以下の例は実際のアプリの機能から一部省略しています）
ています）

### 【すべてのユーザー】
#### LPに訪れたユーザーがどんなアプリか把握することができる
-   ３つの機能の閲覧ができる
    -   図鑑("集める")を閲覧できる
    -   ユーザーが投稿した"飾る"を閲覧できる
    -   ユーザーの"積み上げる"ランキングを閲覧できる
#### 使用したユーザーが複数の動線から簡単に登録することができる
   - 新規登録(認証ログイン)
    - LPから登録できる
    - 閲覧ページの「使ってみる」ボタンから登録できる
    - いいねボタンから登録できる

### 【登録ユーザー】
- 投稿機能(新規作成、編集、削除)使用することができる
	 - 写真をアップロードし、コレクションに登録
	 - 飾る、の新規作成、編集、削除
	 -  積み上げるの新規作成
 - 投稿をシェアすることができる
 - 投稿をブックマークすることができる


# ■なぜこのサービスを作りたいのか？
一応写真を撮ったけどそのままになっているものや、実は取っておきたいけど捨てなければいけないなどの場面が日常生活にたくさんあります。こういった日常の何気ない"勿体無い"や"本当はこうしたいけどしょうがない"というペインに対して楽しみや活用方法を与えてあげることで、それが楽しみに繋がってほしいと思いました。

# ■スケジュール

▼スケジュール例
企画〜技術調査：5/13〆切
README〜ER図作成：5/13 〆切
メイン機能実装：5/14 - 6/14
β版をRUNTEQ内リリース（MVP）：6/17〆切
本番リリース：7/7

# ■技術選定
- Rails7
- MySQL
- React
- Tailwind css
