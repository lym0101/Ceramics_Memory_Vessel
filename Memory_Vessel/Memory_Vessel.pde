//Eric Li
//Processing 11
//Memory Vessel

void setup() {
  pixelDensity(1);
  size(800,800);
  //the layer which it is drawn and overlapped
  drawSky();
  drawOcean();
  drawSand();
  drawPalmTree(200,657);
  drawStarFish(729,730);
  drawStarFish(230,710);
  drawStarFish(490,650);
  drawSun();
}

void drawSky() {
  for (int y = 0; y < 500; y++) {
    float t = map(y, 0, 500, 0, 1);
    //                  the darkest color the gradient go -> the lightest the color go and then the amount (t)
    color c = lerpColor(color(49, 71, 118), color(135, 206, 235), t); //gradient sky color from a sunny sky color to a darker midnight blue color
    stroke(c); //the color of the individual lines changing color to show the gradient
    line(0, y, width, y);
  }
}

void drawOcean() {
  // Back wave (darker)
  fill(30, 95, 170, 200);
  noStroke();
  beginShape();
  vertex(0, height);
  for (int x = 0; x <= width; x += 10) {
    float y = 420 + sin(x * 0.02) * 14;
    vertex(x, y);
  }
  vertex(width, height);
  endShape(CLOSE);

  // Front wave (lighter)
  fill(70, 140, 210, 150);
  beginShape();
  vertex(0, height);
  for (int x = 0; x <= width; x += 10) {
    float y = 530 + sin(x * 0.025 + 1) * 8;
    vertex(x, y);
  }
  vertex(width, height);
  endShape(CLOSE);
  
  // Middle wave (medium colour of those two above)
  fill(59, 119, 179, 130);
  beginShape();
  vertex(0, height);
  for (int x = 0; x <= width; x += 10) {
    float y = 455 + sin(x * 0.025 + 2) * 10;
    vertex(x, y);
  }
  vertex(width, height);
  endShape(CLOSE);
}


void drawSand() {
  fill(215, 198, 158);
  noStroke();
  beginShape();
  vertex(0, height);
  for (int x = 0; x <= width; x += 5) {
    float y = 585 + sin(x * 0.015) * 5;
    vertex(x, y);
  }
  vertex(width, height);
  endShape(CLOSE);
}

void drawPalmTree(float x, float y) {
  // Trunk that is slightly leaning right with a thicker bottom than top
  fill(130, 90, 45);
  noStroke();
  quad(x-18, y, x+15, y, x+20, y-135, x+13, y-135);

  // Leaves fanning out from top of trunk using very long ellipses rather than lines before to look more like a leaf.
  fill(50, 140, 60);
  pushMatrix();
  translate(x + 12, y - 135);
  for (int i = 0; i < 6; i++) {
    rotate(radians(60));
    ellipse(0, -30, 16, 65);
  }
  popMatrix();

  // Coconuts (three of them)
  fill(100, 65, 25);
  circle(x + 12, y - 133, 12);
  circle(x + 23, y - 128, 11);
  circle(x + 17.5, y - 118, 10);
}

void drawStarFish(float x, float y) {
  // 5 arms using rotated very long ellipses
  fill(220, 100, 50, 160);
  noStroke();
  for (int i = 0; i < 5; i++) {
    pushMatrix();
    translate(x, y);
    rotate(TWO_PI / 5*i);
    ellipse(0, -18, 17, 36);
    popMatrix();
  }
}

void drawSun() {
  noStroke();
   for (int k = 150; k > 70; k -= 10) {
      fill(255, 220, 80, 35);
      circle(590, 140, k);
   }
}
