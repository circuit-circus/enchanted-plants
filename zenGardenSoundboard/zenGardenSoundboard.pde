import ddf.minim.*;
import processing.serial.*;
import org.firmata.*;
import cc.arduino.*;
AudioPlayer backtrack;
Arduino arduino; 
float range;

final static String[] arcadeFiles = {
  "a0", "a1", "a5"
};

final static String[] birdFiles = {
  "b0", "b1", "b2", "b3", "b4"
};

final static String[] chimesFiles = {
  "c0", "c1", "c2", "c3", "c4"
};

final static String[] dripFiles = {
  "d0", "d1", "d3"
};

final static String[] fugleFiles = {
  "f1", "f3"
};

final static String[] impactFiles = {
  "i1", "i2", "i3"
};


final static String[] klikFiles = {
  "k0", "k1", "k2", "k3", "k4", "k5", "k6", "k7", "k8", "k9", "k10", "k11"
};

final static String[] plingFiles = {
  "p0", "p1", "p3"
};





final static AudioPlayer[] arcades = new AudioPlayer[arcadeFiles.length-1];
final static AudioPlayer[] birds = new AudioPlayer[birdFiles.length-1];
final static AudioPlayer[] chimes = new AudioPlayer[chimesFiles.length-1];
final static AudioPlayer[] drips = new AudioPlayer[dripFiles.length-1];
final static AudioPlayer[] fugle = new AudioPlayer[fugleFiles.length-1];
final static AudioPlayer[] impacts = new AudioPlayer[impactFiles.length-1];
final static AudioPlayer[] kliks = new AudioPlayer[klikFiles.length-1];
final static AudioPlayer[] plings = new AudioPlayer[plingFiles.length-1];

final Minim minim = new Minim(this);

int num = 1;

Ball[] balls;

void setup() {

  size(600, 600);
  smooth();
  noFill();
  
    
  //arduino = new Arduino(this, Arduino.list()[0], 57600);
  println(Arduino.list());

  for ( byte idx = 0; idx != arcadeFiles.length-1; 
    arcades[idx] = minim.loadFile( arcadeFiles[idx++] + ".mp3") );

  for ( byte idx = 0; idx != birdFiles.length-1; 
    birds[idx] = minim.loadFile( birdFiles[idx++] + ".mp3") );

  for ( byte idx = 0; idx != chimesFiles.length-1; 
    chimes[idx] = minim.loadFile( chimesFiles[idx++] + ".mp3") );

  for ( byte idx = 0; idx != dripFiles.length-1; 
    drips[idx] = minim.loadFile( dripFiles[idx++] + ".mp3") );

  for ( byte idx = 0; idx != fugleFiles.length-1; 
    fugle[idx] = minim.loadFile( fugleFiles[idx++] + ".mp3") );

  for ( byte idx = 0; idx !=impactFiles.length-1; 
    impacts[idx] = minim.loadFile( impactFiles[idx++] + ".mp3") );

  for ( byte idx = 0; idx != klikFiles.length-1; 
    kliks[idx] = minim.loadFile( klikFiles[idx++] + ".mp3") );

  for ( byte idx = 0; idx !=plingFiles.length-1; 
    plings[idx] = minim.loadFile( plingFiles[idx++] + ".mp3") );

  balls = new Ball[8];
  for (int i = 0; i <= balls.length-1; i++) {
    balls[i] = new Ball(i);
  }

  backtrack = minim.loadFile("backtrack.mp3", 2048);
  backtrack.loop();

  //arduino.pinMode(2, Arduino.INPUT);
}

void draw() {
  background(255);
  //range = arduino.analogRead(0);
  //Volume control
  //kliks[num].setGain(map(mouseY, 0, width, -20, 20));
  //chimes[num].setGain(map(mouseY, 0, width, -40, 20));

  for (int i = 0; i <= balls.length-1; i++) {
    balls[i].display();
  }
}