const share_btn = document.getElementById('share-btn');
share_btn.addEventListener('click', async () => {
  try {
    await navigator.share({ title: document.title, url: "" });
  } catch (error) {
    console.error(error);
  }
});