document.addEventListener("turbolinks:load", function () {
    var slider = document.getElementById('range');
    slider.innerHTML=""
    var slider2 = noUiSlider.create(slider, {
        start: [5, 20],
        connect: true,
        range: {
            'min': 5,
            'max': 20
        },
        margin: 1,
        pips: {
            mode: 'steps',
            density: 5,
        }
    });
})
