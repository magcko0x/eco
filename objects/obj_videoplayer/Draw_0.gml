var _results = video_draw();
var _status = _results[0];

setdepth()

if (_status == 0) { // 0 means the video is playing successfully
    var _surface = _results[1];
     
	draw_surface_stretched(_surface, x, y, 32 * image_xscale, 32 * image_yscale); 
}

if global.interact
	video_resume()
else {
	video_pause()
}