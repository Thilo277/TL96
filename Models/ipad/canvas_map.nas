var window = canvas.new({
  "name": "canvas_map",   # The name is optional but allow for easier identification
  "size": [1848, 2524], # Size of the underlying texture (should be a power of 2, required) [Resolution]
  "view": [3072, 4096],  # Virtual resolution (Defines the coordinate system of the canvas [Dimensions]
                        # which will be stretched the size of the texture, required)
  "mipmapping": 1       # Enable mipmapping (optional)
});


window.setColorBackground(1,1,1,1);
var (width,height) = (768,512);
var tile_size = 512;
var zoom = 12;

# var window = canvas.Window.new([width, height],"dialog").set('title', "Tile map demo");
var g = window.createGroup();

var maps_base = getprop("/sim/fg-home") ~ '/cache/maps';

var airac = getprop('aircraft/ipad/airac');
#print('https://nwy-tiles-api.prod.newaydata.com/tiles/{z}/{x}/{y}.png?path='~airac~'/aero/latest');
var makeUrl =
string.compileTemplate('https://nwy-tiles-api.prod.newaydata.com/tiles/{z}/{x}/{y}.png?path='~airac~'/aero/latest');
  #https://maps.wikimedia.org/osm-intl/${z}/${x}/${y}.png
  var makePath =
  string.compileTemplate(maps_base ~ '/{z}/{x}/{y}.png');
  var num_tiles = [7, 8];

  var center_tile_offset = [
  (num_tiles[0] - 1)/2,
  (num_tiles[1] - 1)/1.75
  ];


##
# initialize the map by setting up
# a grid of raster images  

var tiles = setsize([], num_tiles[0]);
for(var x = 0; x < num_tiles[0]; x += 1)
{
  tiles[x] = setsize([], num_tiles[1]);
  for(var y = 0; y < num_tiles[1]; y += 1)
  tiles[x][y] = g.createChild("image", "map-tile");
}

var last_tile = [-1,-1];

var count = 0;
##
# this is the callback that will be regularly called by the timer
# to update the map
var updateTiles = func()
{
  
  # get current position
  var lat = getprop('/position/latitude-deg');
  var lon = getprop('/position/longitude-deg');

  var n = math.pow(2, zoom);
  var offset = [
  n * ((lon + 180) / 360) - center_tile_offset[0],
  (1 - math.ln(math.tan(lat * math.pi/180) + 1 / math.cos(lat * math.pi/180)) / math.pi) / 2 * n - center_tile_offset[1]
  ];
  var tile_index = [int(offset[0]), int(offset[1])];

  var ox = tile_index[0] - offset[0];
  var oy = tile_index[1] - offset[1];

  for(var x = 0; x < num_tiles[0]; x += 1)
  for(var y = 0; y < num_tiles[1]; y += 1)
  tiles[x][y].setTranslation(int((ox + x) * tile_size + 0.5), int((oy + y) * tile_size + 0.5));

  if(    tile_index[0] != last_tile[0]
    or tile_index[1] != last_tile[1])
  {
    for(var x = 0; x < num_tiles[0]; x += 1)
    for(var y = 0; y < num_tiles[1]; y += 1)
    {
      var pos = {
        z: zoom,
        x: int(offset[0] + x),
        y: int(offset[1] + y),
      };

      (func {
        var img_path = makePath(pos);
        var tile = tiles[x][y];

        if( io.stat(img_path) == nil )
        { # image not found, save in $FG_HOME
          var img_url = makeUrl(pos);
          # print('requesting ' ~ img_url);
          http.save(img_url, img_path)
          #.done(func {print('received image ' ~ img_path); tile.set("src", img_path);})
          #.fail(func (r){ print('Failed to get image ' ~ img_path ~ ' ' ~ r.status ~ ': ' ~ r.reason);});
        }
        else # cached image found, reusing
        {
          #print('loading ' ~ img_path);
          tile.set("src", img_path)
        }
        })();
      }

        #last_tile = tile_index;
    }
};
var mapstart = func{
  if(getprop('aircraft/ipad/screen') == 2) {thread.newthread(updateTiles);}
  else{update_timer.stop();}
  #updateTiles();
  };

##
# set up a timer that will invoke updateTiles at 2-second intervals
var update_timer = maketimer(1, mapstart);
# actually start the timer




# Place it on all objects called PFD-Screen
window.addPlacement({"node": "chartsscreen"});