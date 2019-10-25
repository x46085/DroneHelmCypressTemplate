// Wait till the browser is ready to render the game (avoids glitches)
window.requestAnimationFrame(function () {
  new GameManager(4, KeyboardInputManager, HTMLActuator, LocalScoreManager);
});


    var imageList = [
        "/tigers/8_212.gif",
        "/tigers/8_212.gif",
        "/tigers/8_212.gif",
        "/tigers/8_212.gif",
        "/tigers/7_212.gif",
        "/tigers/6_212.gif",        
        "/tigers/5_212.gif",
        "/tigers/4_212.gif",
        "/tigers/3_212.gif",        
        "/tigers/2_212.gif",
        "/tigers/1_212.gif",
        "/tigers/8_114.gif",
        "/tigers/8_114.gif",
        "/tigers/8_114.gif",
        "/tigers/8_114.gif",
        "/tigers/7_114.gif",
        "/tigers/6_114.gif",        
        "/tigers/5_114.gif",
        "/tigers/4_114.gif",
        "/tigers/3_114.gif",        
        "/tigers/2_114.gif",
        "/tigers/1_114.gif",
    ];
    for(var i = 0; i < imageList.length; i++ ) 
    {
        var imageObject = new Image();
        imageObject.src = imageList[i];
    }
