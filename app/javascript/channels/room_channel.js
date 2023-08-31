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
    messages.insertAdjacentHTML('afterbegin', data['message']);
  },

  speak: function(content) {
    console.log(content);
    this.perform('speak', { message: content });
  }
});

document.addEventListener('DOMContentLoaded', () => {
  const messageForm = document.getElementById('message-form');

  messageForm.addEventListener('submit', async (event) => {
    event.preventDefault();

    const formData = new FormData(messageForm);
    const content = formData.get('message[content]');

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
        const messages = document.getElementById('messages');
        messages.insertAdjacentHTML('afterbegin', data.message);
        messageForm.reset();
      } else {
        console.error('Error submitting message:', response);
      }
    } catch (error) {
      console.error('Error submitting message:', error);
    }
  });
});

function closeModalAndResetForm() {

  const messageForm = document.getElementById('message-form');
  messageForm.reset();
}
