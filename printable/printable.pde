import java.util.Calendar;
PGraphics pg;
PImage img;
int mousePGX;
int mousePGY;

void setup() {
  size(400, 600);
  pg = createGraphics(2000, 3000);
  img = loadImage ("00222.jpg");
  pg.beginDraw();
  pg.image (img, 0, 0, 2000, 3000);
  pg.endDraw();
  frameRate(120);
}

void draw() {
  mousePGX = int (map(mouseX, 0, width, 0, pg.width));
  mousePGY = int (map(mouseY, 0, height, 0, pg.height));

  pg.beginDraw();
  if (mousePressed) {
    pg.copy(mousePGX, mousePGY, pg.width/3, pg.width/3, mousePGX+5, mousePGY+5, pg.width/3, pg.width/3);
  }
  if (keyPressed ) {
    pg.image (img, 0, 0, 2000, 3000);
  }
  pg.endDraw();

  image(pg, 0, 0, 400, 600);
}

void keyPressed() { 
  if (key == 's') {
    pg.save("printable" + timestamp() + "_.tif");
    println("Save:" + "printable"  + timestamp() + "_.tif");
  }
  if (key == 'r') {
    image (img, 0, 0);
  }
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
