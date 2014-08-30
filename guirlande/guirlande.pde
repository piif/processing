final int LEN = 60;
final int LIGHT_RADIUS = 10;
final int FRAME_RATE = 30;

byte r[], g[], b[];

void prepareLights() {
  final int L2 = LEN / 2;
  for(int i = 0; i < LEN; i++) {
    byte c = (byte) (100 - abs(i - L2) * 100 / L2);
    r[(i + frameCount) % LEN] = c;
    g[(i + 2 * frameCount) % LEN] = c;
    b[(i + 3 * frameCount) % LEN] = c;
  }
  //println("Current = " + current);
}

void refreshLights() {
  for(int i = 0; i < LEN; i++) {
  int x = i * LIGHT_RADIUS * 2 + LIGHT_RADIUS + 1;
  fill(color(r[i], g[i], b[i]));
  rect(x, LIGHT_RADIUS + 1, LIGHT_RADIUS, LIGHT_RADIUS);
  }
}

int current = 0;

void setup() {
  rectMode(CENTER);
  colorMode(RGB, 100);
  fill(0); stroke(100);
  frameRate(FRAME_RATE);

  r = new byte[LEN];
  g = new byte[LEN];
  b = new byte[LEN];
  size(LEN * 2 * LIGHT_RADIUS + 2, LIGHT_RADIUS * 2 + 2);
  for(int i = 0; i < LEN; i++) {
    r[i] = g[i] = b[i] = 0;
  }
  refreshLights();
  noStroke();
}

void draw() {
  refreshLights();
  prepareLights();
}

