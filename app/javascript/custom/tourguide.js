import Cookies from 'js-cookie';

const options = {
  completeOnFinish: boolean = true
};

const steps = [
  {
    title: "登録有難うございます🌈",
    content: "BOOZEKUZUへようこそ！<p>まずは飲みましょう🍺乾杯！</p>",
    target: "#one",
    order: 1,
  },{
    title: "HOME🏠",
    content: "新しいお酒が追加されるとここに表示されます✨</p>",
    target: "#two",
    order: 2,
  },{
    title: "タイムライン💬",
    content: "KUZUの集い場です✨BOOからの返信も楽しんで 🐈‍⬛</p>",
    target: "#three",
    order: 3,
  },{
    title: "記録する📷",
    content: "飲んだお酒を検索して「飲んだよ」ボタンで記録しましょう。",
    target: "#four",
    order: 4,
  },{
    title: "マイページ🐈‍⬛",
    content: "初期設定はGoogleで登録した氏名になっています。「ユーザー名前を変更する」から変更してください📝",
    target: "#five",
    order: 5,
  },{
    title: "<img src='https://boozepedia.s3.ap-northeast-3.amazonaws.com/material/icon80.png' alt='アイコン画像'>",
    content: "スマートフォンの方は「ホーム画面に追加」を押すとアイコンがホーム画面に追加されます。🏠",
    target: "#six",
    order: 6,
  }
]

const tourGuideCookieName = "tourGuideShown";
const tourGuideShown = Cookies.get(tourGuideCookieName);

if (!tourGuideShown) {
  const tg = new tourguide.TourGuideClient({ steps: steps, options: options });
  tg.start();
  tg.onFinish(() => {
    Cookies.set(tourGuideCookieName, true);
  });
}