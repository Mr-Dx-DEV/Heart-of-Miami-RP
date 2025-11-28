menuOpen = false;
let currentHeight = 1.0;
let minHeight = 50;
let maxHeight = 120;
translations = [];

document.getElementById('heightSlider').addEventListener('input', function() {
    const value = parseFloat(this.value);
    const min = parseFloat(this.min);
    const max = parseFloat(this.max);
    currentHeight = value / 100;
    document.getElementById('heightValue').value = currentHeight;
    const percent = ((value - min) / (max - min)) * 100;
    this.style.background = `linear-gradient(90deg, 
        #4169E1 0%, 
        #4169E1 ${percent}%, 
        rgba(255, 255, 255, 0.2) ${percent}%, 
        rgba(255, 255, 255, 0.2) 100%
    )`;
    post(`https://${GetParentResourceName()}/setHeight`, {height: currentHeight});
});

document.getElementById('heightValue').addEventListener('input', function() {
    const value = parseFloat(this.value);
    const min = parseFloat(document.getElementById('heightSlider').min);
    const max = parseFloat(document.getElementById('heightSlider').max);
    currentHeight = value;
    // document.getElementById('heightValue').value = currentHeight;
    const percent = ((value * 100 - min) / (max - min)) * 100;
    document.getElementById('heightSlider').value = value * 100;
    document.getElementById('heightSlider').style.background = `linear-gradient(90deg, 
        #4169E1 0%, 
        #4169E1 ${percent}%, 
        rgba(255, 255, 255, 0.2) ${percent}%, 
        rgba(255, 255, 255, 0.2) 100%
    )`;
    if (value === 0) return;
    post(`https://${GetParentResourceName()}/setHeight`, {height: currentHeight});
});

document.getElementById('saveBtn').addEventListener('click', function() {
    post(`https://${GetParentResourceName()}/setHeight`, {height: currentHeight});
    menuOpen = false;
    document.getElementById("container").style.display = "none";
    post(`https://${GetParentResourceName()}/close`, {});
});

document.getElementById('resetBtn').addEventListener('click', function() {
    const value = 100;
    const min = parseFloat(document.getElementById('heightSlider').min);
    const max = parseFloat(document.getElementById('heightSlider').max);
    currentHeight = value / 100;
    document.getElementById('heightValue').value = currentHeight;
    const percent = ((value - min) / (max - min)) * 100;
    document.getElementById('heightSlider').value = value;
    document.getElementById('heightSlider').style.background = `linear-gradient(90deg, 
        #4169E1 0%, 
        #4169E1 ${percent}%, 
        rgba(255, 255, 255, 0.2) ${percent}%, 
        rgba(255, 255, 255, 0.2) 100%
    )`;
    post(`https://${GetParentResourceName()}/resetHeight`, {});
});

window.addEventListener('message', function(event) {
    ed = event.data;
    if (ed.action === "openMenu") {
        menuOpen = ed.state;
        if (menuOpen) {
            document.getElementById("container").style.display = "flex";
            const heightValue = document.getElementById('heightValue');
            const heightSlider = document.getElementById('heightSlider');
            minHeight = ed.minHeight;
            maxHeight = ed.maxHeight;
            heightSlider.min = minHeight * 100;
            heightSlider.max = maxHeight * 100;
            currentHeight = ed.scaleVal;
            heightValue.value = ed.scaleVal;
            heightSlider.value = currentHeight * 100;
            const value = parseFloat(heightSlider.value);
            const min = parseFloat(heightSlider.min);
            const max = parseFloat(heightSlider.max);
            const percent = ((value - min) / (max - min)) * 100;
            heightSlider.style.background = `linear-gradient(90deg, 
                #4169E1 0%, 
                #4169E1 ${percent}%, 
                rgba(255, 255, 255, 0.2) ${percent}%, 
                rgba(255, 255, 255, 0.2) 100%
            )`;
            translations = ed.translations;
            for (var key in translations) {
                if (translations.hasOwnProperty(key)) {
                    var elements = document.getElementsByClassName(key);
                    for (var i = 0; i < elements.length; i++) {
                        elements[i].innerHTML = translations[key];
                    }
                }
            }
        } else {
            document.getElementById("container").style.display = "none";
        }
    }
    document.onkeyup = function(data) {
		if (data.which == 27 && menuOpen) {
			menuOpen = false;
            document.getElementById("container").style.display = "none";
            post(`https://${GetParentResourceName()}/close`, {});
		}
	}
})

function post(url, data) {
    var xhr = new XMLHttpRequest();
	xhr.open("POST", url, true);
	xhr.setRequestHeader('Content-Type', 'application/json');
	xhr.send(JSON.stringify(data));
}