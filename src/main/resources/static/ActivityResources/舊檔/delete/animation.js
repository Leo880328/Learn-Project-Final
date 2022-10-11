let EventJquery = {
    mouseSelection: ".mouseSelection"

}

function mouseEventBorder() {
    $(mouseSelection).mouseover(function () {
        $(this).css("background-color", "#333");
    })
    $(mouseSelection).mouseleave(
        function () {
            $(this).css("background-color", "white");
        }
    )

}