 	function previewImg(element) {

 	    let file = element.files[0];
 	    let img = element.parentElement.querySelector("#img");
 	    let imgPath = element.parentElement.querySelector("#imgPath");
 	    if (file) {
 	     img.src = URL.createObjectURL(file);
 	     imgPath.value = "images/"+file.name;
 	    }
   
 	}