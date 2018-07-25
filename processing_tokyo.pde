PImage img;
int time = 1;
int mosaicWidth = 80;
int mosaicHeight = 80;
color[] col = new color[600000];
int textAlpha = 0;

int deg = 200;
int num=114;

void setup() {
  size(600, 400);
  img = loadImage("tokyo.jpg");
  img.resize(width, height);
  frameRate(60);
  

  
  noStroke();
  
}

void draw() {
  
  image(img, 0, 0);
  filter(GRAY);
  loadPixels();
  
  if (mosaicWidth > 1 || mosaicHeight > 1) {
    for(int j = 0; j < height; j+=mosaicHeight) {  
      for(int i = 0; i < width; i+=mosaicWidth) {  
        color c = pixels[j * width + i];
        fill(c);
        rect(i, j, mosaicWidth, mosaicWidth);
      }
    }
    
  mosaicWidth -= 1;
  mosaicHeight -= 1;
  }
  
   flash();
   
   
   
   if (time > 114) {
    paint(deg);
    
    if (deg < 80) {
      textSize(48);
      
      for (int i= 0; i < 3; i ++) {
        fill(255, 255, 255, textAlpha);
        text("Processing!", 250, 230);
      
        textAlpha += 3;
      }
    }
    
    if (deg < 100) {
      deg -= 8;
    } else {
      deg -=  4;
    }
   
  }
  
  
}

void flash() {
  if (time > 113) {
     filter(GRAY);
  } else if (time > 111) {
    fill(255, 255, 255, 100);
    rect(0, 0, 1000, 600);  
  } else if (time > 107) {
    image(img, 0, 0);
  } else if (time > 101) {
    fill(255, 255, 255, 100);
    rect(0, 0, 1000, 600);
  } else if(time > 93) {
    image(img, 0, 0);
  } else if(time > 83) {
    fill(255, 255, 255, 100);
    rect(0, 0, 1000, 600);
  }
  
  time++;
}


void paint(int deg) {
  if (time > num) {
    paintTower(deg);
  }
  
  num++;
}

void paintTower(int val) {
  for (int j = 0; j < img.height; j++){
    for (int i = 0; i < img.width; i++){
       color col = img.get(i, j);
       stroke(col);
       float red = red(col);
       if (red > val) {
        
        point(i,j);       
       }
    }  
  }  
}
