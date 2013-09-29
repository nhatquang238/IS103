var fs = require('fs');
fs.writeFile('./log.txt', '');

pic = [
  [9,9,9,9,9,9,0],
  [9,0,0,0,0,9,0],
  [9,0,0,0,0,9,0],
  [9,0,0,9,9,9,0],
  [9,0,0,9,0,0,0],
  [9,0,0,9,9,9,0],
  [9,0,0,0,0,9,0],
  [9,0,0,0,0,9,0],
  [9,0,0,9,9,9,0],
  [9,0,0,9,0,0,0],
  [9,0,0,9,0,0,0],
  [9,0,0,9,9,9,0],
  [9,0,0,9,9,9,0],
  [9,0,0,0,0,9,0],
  [9,0,0,0,0,9,0],
  [9,9,9,9,9,9,0]
]



function fill_area(x, y, fill_color, color_xy, pic){
  var points = [];
  points[0] = [x-1, y]; // north
  points[1] = [x, y-1]; // west
  points[2] = [x, y+1]; // east
  points[3] = [x+1, y]; // south
  fs.appendFileSync('./log.txt', 'reading: '+x+','+y+'\n\n')

  for(var i=0; i<points.length; i++){
    // check surrounding points color

    var s_x = points[i][0]; // surround point x coord
    var s_y = points[i][1]; // surround point y coord
    var color_s_xy = pic[s_x][s_y]; // color of this surrounding point

    // compare color with current point
    if(color_s_xy != color_xy){
      // different color, this surrounding point is a boundary point
      if(pic[x][y] != fill_color){
        // check if current is filled already, if not fill current point
        pic[x][y] = fill_color;
        fs.appendFileSync('./log.txt','coloring: '+x+','+y+'\n\n');
      }
    }else{
      // this surrounding point has same color, recurse
      fill_area(s_x, s_y, fill_color, color_s_xy, pic)
    }
  }
  return pic;
}

fill_area(7,3,1,0, pic)