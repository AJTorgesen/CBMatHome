
function getSelectionText() {
    var text = "";
    if (window.getSelection) {
        text = window.getSelection().toString();
    } else if (document.selection && document.selection.type != "Control") {
        text = document.selection.createRange().text;
    }
    return text
     .split(' ')
     .filter(function(n) { return n != '' })
     .length;
}

$( document ).on("shiny:sessioninitialized", function(event) {
Shiny.setInputValue("wordcount", getSelectionText(), {priority: "event"});
});

Shiny.addCustomMessageHandler('generate', function(e) {
	Shiny.setInputValue("wordcount", getSelectionText(), {priority: "event"});
});

function getSelectionLetters() {
    var text = "";
    if (window.getSelection) {
        text = window.getSelection().toString();
    } else if (document.selection && document.selection.type != "Control") {
        text = document.selection.createRange().text;
    }
    return text
     .replace(/[\n\r]/g, "")
     .split('')
     .join(' ')
     .split(' ')
     .filter(function(n) { return n != '' })
     .length
}

$( document ).on("shiny:sessioninitialized", function(event) {
Shiny.setInputValue("lettercount", getSelectionLetters(), {priority: "event"});
});

Shiny.addCustomMessageHandler('generateL', function(e) {
	Shiny.setInputValue("lettercount", getSelectionLetters(), {priority: "event"});
});
