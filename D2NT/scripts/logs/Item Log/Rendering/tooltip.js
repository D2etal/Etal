tt = null;
 
document.onmousemove = updateTT;
 
function updateTT(e) {
  if (tt != null) {
    x = (document.all) ? window.event.x + tt.offsetParent.scrollLeft : e.pageX;
    y = (document.all) ? window.event.y + tt.offsetParent.scrollTop  : e.pageY;
    tt.style.left = (x+1) + "px";
    tt.style.top   = (y+1)-50 + "px";
  }
}
 
function showTT(id) {
  tt = document.getElementById(id);
  tt.style.display = "block"
}
 
function hideTT() {
  tt.style.display = "none";
}

function handleSearch(evt) {
    var charCode = (window.event) ? event.keyCode : evt.which;
   var char = String.fromCharCode(charCode);
   var sb = document.getElementById("searchbox");
   var st = document.getElementById("search");
   
   if ( /[A-Z]/.test(char))
   {
      sb.style.display = "block";
      st.focus();
   }
   else if (charCode == 27)
   {
      var sb = document.getElementById("searchbox");
      sb.style.display = "none";
      st.value = "";
      showAll();
   }
   
   return true;
}

window.document.onkeydown= handleSearch;