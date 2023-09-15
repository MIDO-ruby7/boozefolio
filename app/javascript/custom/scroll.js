console.log("scroll.js loaded");

function scrollToMessage() {
  const params = new URLSearchParams(window.location.search);
  const scrollToMessageId = params.get("scroll_to_message");
  console.log("Scroll to message ID:", scrollToMessageId);
  if (scrollToMessageId) {
    const message = document.getElementById("message-" + scrollToMessageId);
    console.log("Message element:", message);
    if (message) {
      message.scrollIntoView({ behavior: "smooth" });
    }
  }
}

document.addEventListener("DOMContentLoaded", function() {
  scrollToMessage();
});

document.getElementById('scrollToBottom').addEventListener('click', function() {
  const image = document.getElementById('scrollImage');
  if (image) {
    image.src = 'https://boozepedia.s3.ap-northeast-3.amazonaws.com/material/jump.svg';
    image.onload = function() {
      image.style.width = '60px'; // 幅を設定
      image.style.height = 'auto'; // 高さを設定
      image.style.marginRight = '25px';
      image.style.marginTop = '20px';

      setTimeout(function() {
      scrollToBottom();
      }, 200);
    };
  }
});

function scrollToBottom() {
  const bottomOfBox = document.getElementById('box');
  if (bottomOfBox) {
    bottomOfBox.scrollIntoView({ behavior: 'smooth', block: 'end' });
  }
}
