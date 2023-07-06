const options = {
  completeOnFinish: boolean = true
};

const steps = [
  {
    title: "登録有難うございます‍🌈",
    content: "BoozePediaへようこそ！<p>まずは飲みましょう🍺乾杯！</p>",
    target: "#one",
    order: 1,
  },{
    title: "記録する📷",
    content: "お酒はここから記録します。<p>初めての種類であればBoozePediaにページが追加されます。</p>",
    target: "#two",
    order: 2
  },{
    title: "なんてお呼びしましょうか？🐈‍⬛",
    content: "初期設定はGoogleで登録した氏名になっています。「ユーザー名前を変更する」から変更してください",
    target: "#three",
    order: 3
  }
]

const tg = new tourguide.TourGuideClient({steps : steps, options : options});
tg.start();
