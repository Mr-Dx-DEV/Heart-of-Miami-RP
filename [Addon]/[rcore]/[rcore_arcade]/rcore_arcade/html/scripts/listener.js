let url_game = "";
let alreadydid = false;
let time_seconds = 0, visual_seconds = 0;

let progressIntervalTimer = null;
let focusIntervalTimer = null;

function loadIframe(give, url) {
    url_game = url;
    if (give === false) return false;
    let $iframe = $("#browser");
    if ($iframe.length) {
        $iframe.attr("src", url);
        return false;
    }
    return true;
}

function display(bool) {
    if (bool) {
        $("#body").show();
    } else {
        $("#body").hide();
    }
}

function loadGame(seconds) {
    time_seconds = seconds;
    $("#loading").attr("value", 0);
    $("#loading").attr("max", seconds / 10);
}

function progress() {
    if (time_seconds === 0) {
        if (alreadydid === true) {
            loadIframe(true, url_game);
            alreadydid = false;
            $("#loading").hide();
        }
        clearProgressTimer();

        visual_seconds = 0;
    } else {
        visual_seconds += 0.1;
        time_seconds--;
        $("#loading").attr("value", visual_seconds);
    }
}

function clearProgressTimer() {
    if (progressIntervalTimer != null) {
        clearInterval(progressIntervalTimer)
        progressIntervalTimer = null;
    }
}

function startFocusInterval() {
    clearFocusInterval();
    focusIntervalTimer = setInterval(function () {
        document.getElementById("browser").contentWindow.focus();
    }, 50);
}

function clearFocusInterval() {
    if (focusIntervalTimer != null) {
        clearInterval(focusIntervalTimer)
        focusIntervalTimer = null;
    }
}

$(document).keyup(function (e) {
    if (e.keyCode === 27) {
        $.post("http://rcore_arcade/exit", JSON.stringify({}));
    }
});

$("#off_pc").click(function () {
    $.post("http://rcore_arcade/exit", JSON.stringify({}));
});

$(function () {
    display(false);

    window.addEventListener("message", function (event) {
        let item = event.data;
        if (item.type === "on") {
            display(true);
            $("#loading").show();

            alreadydid = true;

            if (item.gpu === "ETX660") {
                $("#cont").css("max-height", 300);
                $("#cont").css("max-width", 500);
            }
            if (item.gpu === "ETX1050") {
                $("#cont").css("max-height", 700);
                $("#cont").css("max-width", 1100);
            }
            if (item.gpu === "ETX2080") {
                $("#cont").css("max-height", 800);
                $("#cont").css("max-width", 1600);
            }

            if (item.cpu === "U9_9900") {
                loadGame(3 * 5);
            }
            if (item.cpu === "U7_8700") {
                loadGame(10 * 10);
            }
            if (item.cpu === "U3_6300") {
                loadGame(15 * 10);
            }
            if (item.cpu === "BENTIUM") {
                loadGame(20 * 10);
            }

            loadIframe(false, item.game);

            clearProgressTimer();
            progressIntervalTimer = setInterval(progress, 100);

            startFocusInterval();
        }
        if (item.type === "off") {
            clearFocusInterval();
            clearProgressTimer();
            display(false);
            loadIframe(true, "");
            $("#loading").hide();

            alreadydid = false;
            time_seconds = 0;
            visual_seconds = 0;
        }
    })
});