import consumer from "./consumer"

console.log("room_channel.js loaded");

const appRoom = consumer.subscriptions.create("RoomChannel", {
  connected() {
    console.log("WebSocket connection established.");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const messages = document.getElementById('messages');
    messages.insertAdjacentHTML('beforeend', data['message']);
    const booResponse = data['boo_response'];

    if (booResponse) {
      const booResponseElement = document.createElement('div');
      booResponseElement.classList.add('ai-response'); // 必要に応じてクラスを追加
      booResponseElement.textContent = `AI Response: ${booResponse}`;
      messages.appendChild(booResponseElement);
      scrollToBottom();
    }

    scrollToBottom();
  },

  speak: function(content) {
    console.log(content);
    this.perform('speak', { message: content });
  }
});

document.addEventListener('DOMContentLoaded', () => {
  const messageForm = document.getElementById('message-form');
  const loadingScreen = document.getElementById('loading-screen');

  messageForm.addEventListener('submit', async (event) => {
    event.preventDefault();

    const formData = new FormData(messageForm);
    const content = formData.get('message[content]');

    // ローディング画面を表示する
    loadingScreen.classList.remove('hidden');

    try {
      const response = await fetch('/rooms', {
        method: 'POST',
        body: new URLSearchParams({ 'message[content]': content }),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        }
      });

      if (response.ok) {
        const data = await response.json();
        appRoom.speak(content);
        const messages = document.getElementById('messages');
        messages.insertAdjacentHTML('beforeend', data.message);
        scrollToBottom();
        messageForm.reset();
      } else {
        const errorData = await response.json();
        console.error('Error submitting message:', errorData.error);
        // エラーメッセージを設定
        const errorMessagesElement = document.getElementById('errorMessages');
        errorMessagesElement.textContent = errorData.error;
      }
    } catch (error) {
      console.error('Error submitting message:', error);
    } finally {
      // メッセージ送信後、またはエラー発生後にローディング画面を隠す
      loadingScreen.classList.add('hidden');
    }
  });
});

function scrollToBottom() {
  const bottomOfBox = document.getElementById('box');
  bottomOfBox.scrollIntoView({ behavior: 'smooth', block: 'end' });
}
