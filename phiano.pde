

HashMap hm=new HashMap();

int nok=21;
class pian_key{
   int x=0;
  int y=0;
  int wdth=displayWidth/(nok*2);
  int hght=displayHeight/4;
  pian_key()
  {
    x=0;
   y=0; 
  }
}
//___________________________________________________
class pian_key_white extends pian_key{
  int wdth=displayWidth/(nok*2);
  int hght=displayHeight/4;
  void drawme(int transx,int indx)
  {
    fill(255);
    stroke(0);
    rect(x+transx,y,wdth,hght-1,5,5,5,5);
    for(int i=0;i<wdth;i++)
    for(int j=0;j<hght-1;j++)
    {
      hm.put((i+x+transx)+(j+y)*width,indx);
    }
  }
}

//___________________________________________________
class pian_key_black extends pian_key{
  int wdth=displayWidth/(nok*4);
  int hght=displayHeight/4+displayHeight/16;
  void drawme(int transx,int indx)
  {
    fill(0);
    stroke(0);
    rect(x+transx+wdth*3/2,y,wdth,(hght-1)/2,3,3,3,3);
    for(int i=0;i<wdth;i++)
    for(int j=0;j<(hght-1)/2;j++)
    {//arx[x+transx+i+wdth*3/2][j+y]=indx;
    hm.put((x+transx+i+wdth*3/2)+(j+y)*width,indx);
    }
  }
}
//____________________________________________________

pian_key_white pk[]=new pian_key_white[nok];
pian_key_black bk[]=new pian_key_black[nok];


void setup()
{
  orientation(LANDSCAPE);
  size(320,240);
  background(255);
  for(int i=0;i<displayWidth/2+1;i++)
        {//arx[i]=new int[displayHeight/4];
      }
        
  
    for(int i=0;i<nok;i++)
    {
      pk[i]=new pian_key_white();
      pk[i].drawme(i*displayWidth/(nok*2),i);     
    }

int iu=0;
    for(int i=0;i<nok-1;i++)
    {
      if(i%7!=2 && i%7!=6)
     {bk[iu]=new pian_key_black();
     bk[iu].drawme(i*displayWidth/(nok*2),nok+iu);
     iu++;
     }
    }

}
void draw()
{
  if(mousePressed)  text(hm.get(mouseX+mouseY*width)+"",mouseX,mouseY);
}
