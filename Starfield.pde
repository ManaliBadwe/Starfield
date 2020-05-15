Particle [] part; 
void setup()
{
  size(500, 500); 
  part = new Particle[800]; 
  for(int i = 0; i < part.length; i++)
  {
    part[i] = new NormalParticle();   
  }
  for(int i = 0; i < 400; i++)
  {
    part[i] = new OddballParticle();   
  }
  for(int i = 0; i < part.length; i++)
  {
    i++; 
    part[i] = new JumboParticle();   
  }
}

void draw()
{
   background(0); 
   for(int i = 0; i < part.length; i++)
   {
     part[i].show(); 
     part[i].move(); 
   }
    
   
}
class NormalParticle implements Particle 
{
  double x, y, angle, speed; 
  int color1, color2, color3;  
  NormalParticle(){
    x = 250; 
    y = 250; 
    angle = (Math.random()*(2*Math.PI)); 
    speed = (Math.random()*10)+1; 
    color1 = (int)(Math.random()*255)+1;
    color2 = (int)(Math.random()*255)+1;
    color3 = (int)(Math.random()*255)+1;
  }
  public void move(){
    x = Math.cos(angle)*speed+x; 
    y = Math.sin(angle)*speed+y;
    if(x >= 500 || y >= 500){
       x = 250; 
       y = 250;  
       angle = (Math.random()*(2*Math.PI)); 
       speed = (Math.random()*10)+5; 
    }
  }
  public void show(){
    ellipse((int)x, (int)y, 15, 15); 
    fill(color2, color3, color1); 
  }
}
interface Particle
{
   public void show(); 
   public void move(); 
}
class OddballParticle implements Particle
{
  double x, y, angle, speed; 
  int color1, color2, color3;  
  OddballParticle(){
    x = 250; 
    y = 250; 
    angle = (Math.random()*(2*Math.PI)); 
    speed = (Math.random()*10); 
    color1 = (int)(Math.random()*255)+1;
    color2 = (int)(Math.random()*255)+1;
    color3 = (int)(Math.random()*255)+1;
  }
  public void move(){
    x = Math.cos(angle)*speed+x; 
    y = Math.sin(angle)*speed+y; 
    if(x >= 500 || y >= 500){
       x = 250; 
       y = 250; 
      angle = (Math.random()*(2*Math.PI)); 
      speed = (Math.random()*10);  
    } 
  }
  public void show(){
    rect((int)x, (int)y, 25, 25); 
    fill(color1, color2, color3);
    
  }
}
class JumboParticle extends NormalParticle
{
  public void show(){
   ellipse((int)x, (int)y, 35, 35);  
   fill(color3, color1, color2); 
  }
}
