document.addEventListener('DOMContentLoaded', function(){
    const fileInput = document.querySelector("#item_photos_attributes_0_image")
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