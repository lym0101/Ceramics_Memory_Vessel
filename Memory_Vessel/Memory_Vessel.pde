//Eric Li
//Processing 11

color light = #bfcbce;
color medium = #97abb3;
color dark = #647e83;

float radius;

void setup() {
  pixelDensity(1);
  size(800,800);
  background(255);
  for (int a = 40; a <= 825; a += 80) {
    for (int b = 40; b <= 825; b += 80) {
      drawRings(b,a,80);
    }
  }
}

void drawRings(int x, int y, int r) {
  float spacing;
  spacing = r/3;
  
  circle(x,y,r);
  circle(x,y,r - spacing);
  circle(x,y,r - spacing*2);
  circle(x, y, r - spacing*3);
}
