let diff = 0;
let ticking = false;

const wheelEvent = 'onwheel' in document.createElement("div") ? 'wheel' : 'mousewheel';

const list = document.querySelector('.a');

function doSomething(diff) {
    list.scrollLeft += (diff);
}

list.addEventListener('wheel', function(e) {
    diff = e.deltaY;
    if (!ticking) {
        window.requestAnimationFrame(function() {
            doSomething(diff);
            ticking = false;
        });
    }
    ticking = true;
}, { passive: true });

$(".a").on('mousewheel',function(e){

    var wheelDelta = e.originalEvent.wheelDelta;

    if(wheelDelta > 0){

        console.log("up");

        $(this).scrollLeft(-wheelDelta + $(this).scrollLeft());

    }else{

        console.log("down");

        $(this).scrollLeft(-wheelDelta + $(this).scrollLeft());

    }

});