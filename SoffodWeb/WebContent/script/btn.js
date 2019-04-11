// Get the modal

var myModalEdit = document.getElementById('myModalEdit');
var myModalAdd = document.getElementById('myModalAdd');


//---------------------------Add  --------------------------------------
// Get the button that opens the modal
var btnAdd = document.getElementById("BtnAdd");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close1")[0];

// When the user clicks on the button, open the modal 
btnAdd.onclick = function() {
    myModalAdd.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function(event) {
    myModalAdd.style.display = "none";
}
window.onclick = function(event) {
    if (event.target == myModalAdd) {
        myModalAdd.style.display = "none";
} 
}


//-----------------------  Edit Foods ------------------------------------



