//Eric Li
//Processing 11
//Memory Vessel

color light = #bfcbce;
color medium = #97abb3;
color dark = #647e83;

int offset = 0;
float radius;
float waveOffset = 0;

void setup() {
  pixelDensity(1);
  size(1200,1000);
  background(255);
  waveOffset += 0.05;
  for (int a = 40; a <= 825; a += 80) {
    for (int b = 40; b <= 825; b += 80) {
      drawWaves();
       background(255);
  for (int y = -80; y <= height +80; y += 80) {
    for (int x = -80; x <= width +80; x += 80) {
      noFill();
      circle(x-offset, y, 110);
    }
    if (offset == 0) offset = 40;
    else offset = 0;
  }
    }
  if (offset == 0) offset = 40;
    else offset = 0;
  }
  drawSky();
}

void drawWaves() {
  noFill();
  beginShape();
  curveVertex(0,  364);
  curveVertex(120,  394);
  curveVertex(272,  76);
  curveVertex(84,  68);
  curveVertex(128, 400);
  curveVertex(128, 400);
  endShape();
}

void drawSand() {
  // Sandy beach in the lower portion
  fill(210, 195, 160);
  noStroke();
  beginShape();
  vertex(0, height);
  for (int x = 0; x <= width; x += 5) {
    float y = 340 + sin(x * 0.01 + offset * 0.3) * 6;
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

void drawSky {
  for (int y = 0; y < 200; y++) {
    float inter = map(y, 0, 200, 0, 1);
    color c = lerpColor(color(60, 70, 100), color(100, 130, 150), inter);
    stroke(c);
    line(0, y, width, y);
  }
}
