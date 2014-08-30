/**
 * my first processing sketch :-)
 * try to emulate a future arduino light animation
 */

// number of lights
final int LEN = 60;
// size of light in window 
final int LIGHT_RADIUS = 10;
// animation rate (number of step / s)
final int FRAME_RATE = 30;

/** BEGINNING of user code */
byte r[], g[], b[];

// user just have to implement these 2 functions to :
// - initialize color values at startup
// - update color values at each step

void prepareLights() {
  for(int i = 0; i < LEN; i++) {
    r[i] = g[i] = b[i] = 0;
  }
}

void updateLights() {
  final int L2 = LEN / 2;
  for(int i = 0; i < LEN; i++) {
    byte c = (byte) (100 - abs(i - L2) * 100 / L2);
    r[(i + frameCount) % LEN] = c;
    g[(i + 2 * frameCount) % LEN] = c;
    b[LEN - (i + frameCount) % LEN - 1] = c;
  }
}

/** END of user code **/

void refreshLights() {
  for(int i = 0; i < LEN; i++) {
  int x = i * LIGHT_RADIUS * 2 + LIGHT_RADIUS + 1;
  fill(color(r[i], g[i], b[i]));
  rect(x, LIGHT_RADIUS + 1, LIGHT_RADIUS, LIGHT_RADIUS);
  }
}

void setup() {
  rectMode(CENTER);
  colorMode(RGB, 100);
  fill(0); stroke(100);
  frameRate(FRAME_RATE);

  r = new byte[LEN];
  g = new byte[LEN];
  b = new byte[LEN];
  size(LEN * 2 * LIGHT_RADIUS + 2, LIGHT_RADIUS * 2 + 2);
  prepareLights();
  refreshLights();
  noStroke();
}

void draw() {
  refreshLights();
  updateLights();
}

