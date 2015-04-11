function pastetext(){
    $(document).ready(function() {
        if (document.querySelectorAll("[contenteditable]")){
            var ce = document.querySelectorAll("[contenteditable]");
            for (var i=0; i < ce.length; i++){
                ce[i].addEventListener("paste", function(e) {
                    e.preventDefault();
                    var text = e.clipboardData.getData("text/plain");
                    document.execCommand("insertHTML", false, text);
                });

                ce[i].addEventListener("drop", function(e) {
                    e.preventDefault();
                });
            }
        }
    });
}
