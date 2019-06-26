// number of loaded images for preloader progress
var loadedCount = 0; //current number of images loaded
var imagesToLoad = $('.bcg').length; //number of slides with .bcg container
var loadingProgress = 0; //timeline progress - starts at 0

$('.bcg').imagesLoaded({
    background: true
}).progress( function( instance, image ) {
    loadProgress();
});

function loadProgress(imgLoad, image)
{
    //one more image has been loaded
    loadedCount++;

    loadingProgress = (loadedCount/imagesToLoad);

    // GSAP tween of our progress bar timeline
    TweenLite.to(progressTl, 0.7, {progress:loadingProgress, ease:Linear.easeNone});

}
