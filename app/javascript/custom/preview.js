console.log("preview.js loaded")

document.addEventListener('DOMContentLoaded', function(){
  const fileInput = document.querySelector("#image_file_field")
  const previewImage = document.querySelector("#preview")

  fileInput.addEventListener('change', function(event){
    const file = event.target.files[0];
    const reader = new FileReader();

    reader.onloadend = function(event) {
    previewImage.src = reader.result;
    }
    if (file) {
    reader.readAsDataURL(file);
    }
  });
});