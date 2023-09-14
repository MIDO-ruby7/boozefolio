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