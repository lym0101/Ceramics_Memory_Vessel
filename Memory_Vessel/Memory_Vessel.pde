//Eric Li
//Processing 11
//Memory Vessel

color light = #bfcbce;
color medium = #97abb3;
color dark = #647e83;

int offset = 0;
float radius;
float waveOffset = 0;
float wave = 0;

void setup() {
  pixelDensity(1);
  size(800,800);
  waveOffset += 0.05;
  drawSky();
  drawSand();
  drawWaves();
}

void drawWaves() {
  // Ocean (3 wavy layers)
  for (int layer = 0; layer < 3; layer++) {
    fill(30, 90, 160, 180 - layer * 30);
    noStroke();
    beginShape();
    vertex(0, height);
    for (int x = 0; x <= width; x += 10) {
      float y = 260 + layer * 30 + sin(x * 0.02 + wave + layer) * 15;
      vertex(x, y);
    }
    vertex(width, height);
    endShape(CLOSE);
  }
}

void drawSand() {
  // Sandy beach in the lower portion
  fill(210, 195, 160);
  noStroke();
  beginShape();
  vertex(0, height);
  for (int x = 0; x <= width; x += 5) {
    float y = 360 + sin(x * 0.01 + offset * 0.3) * 6;
    vertex(x, y);
  }
  vertex(width, height);
  endShape(CLOSE);
  // Wet sand near waterline (slightly darker strip)
  fill(180, 165, 130, 150);
  beginShape();
  for (int x = 0; x <= width; x += 5) {
    float y = 340 + sin(x * 0.01 + waveOffset * 0.3) * 6;
    vertex(x, y);
  }
  vertex(width, 360);
  vertex(0, 360);
  endShape(CLOSE);
}

void drawSky() {
  for (int y = 0; y < 600; y++) {
    float inter = map(y, 0, 200, 0, 1);
    color c = lerpColor(color(60, 70, 100), color(120, 150, 150), inter);
    stroke(c);
    line(0, y, width, y);
  }
}
