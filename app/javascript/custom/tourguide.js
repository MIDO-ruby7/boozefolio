const options = {
  completeOnFinish: boolean = true
};

const steps = [
  {
    title: "登録有難うございます🌈",
    content: "BoozePediaへようこそ！<p>まずは飲みましょう🍺乾杯！</p>",
    target: "#one",
    order: 1,
  },{
    title: "記録する📷",
    content: "お酒はここから記録します。<p>初めての種類であればBoozePediaにページが追加されます✨</p>",
    target: "#two",
    order: 2,
  },{
    title: "なんてお呼びしましょうか？🐈‍⬛",
    content: "初期設定はGoogleで登録した氏名になっています。「ユーザー名前を変更する」から変更してください📝",
    target: "#three",
    order: 3,
  },{
    title: "<img src='https://boozepedia.s3.ap-northeast-3.amazonaws.com/material/icon80.png' alt='アイコン画像'>",
    content: "「ホーム画面に追加」を押すとアイコンがホーム画面に追加されます。🏠",
    target: "#four",
    order: 4,
  },{
    title: "最後にお願い🌱",
    content: "マイページの「お問い合わせ」からエラーのご報告・ご意見ご要望をお願いします。🙏</p>",
    target: "#five",
    order: 5,
  }
]

const tourGuideCookieName = "tourGuideShown";
const tourGuideShown = Cookies.get(tourGuideCookieName);

if (!tourGuideShown) {
  const tg = new tourguide.TourGuideClient({ steps: steps, options: options });
  tg.start();
  tg.onFinish(() => {
    Cookies.set(tourGuideCookieName, true);
    // Perform any actions you want after the tour is finished
  });
}