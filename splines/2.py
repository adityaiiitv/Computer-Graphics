import sys, pygame
from pygame.locals import *
from pygame.constants import *
from OpenGL.GL import *
from OpenGL.GLU import *
from load_room_obj import *
pygame.init()
viewport = (800,600)
hx = viewport[0]/2
hy = viewport[1]/2
srf = pygame.display.set_mode(viewport, OPENGL | DOUBLEBUF)
glEnable(GL_DEPTH_TEST)
obj = OBJ(sys.argv[1], swapyz=True)
clock = pygame.time.Clock()
glMatrixMode(GL_PROJECTION)
glLoadIdentity()
width, height = viewport
gluPerspective(60.0, width/float(height), 1, 100.0)
glEnable(GL_DEPTH_TEST)
glMatrixMode(GL_MODELVIEW)
rx, ry = (0,0)
tx, ty = (0,0)
zpos = 0
rotate = move = False
entry=False

while 1:
    x = glGetDoublev(GL_MODELVIEW_MATRIX)
    #print x
    clock.tick(60)
    for e in pygame.event.get():
        if e.type == QUIT:
            sys.exit()
        elif e.type == KEYDOWN:
          rx=ry=0
          if entry==False:
            if e.key == K_ESCAPE:
                sys.exit()
            if e.key == K_UP:
              	if x[3,0]<4.59 and x[3,0]>4.09 and x[3,1]<-0.94: 
              	  ty += 0.1
              	  entry=True
              	if  (x[3,0]>4.59 and x[3,1]<-0.94) or (x[3,0]<4.09 and x[3,1]<-0.94):
              	  ty+=0.0
              	else : ty+=0.1
              
            if e.key == K_DOWN:
               
                ty -= 0.1
           
            if e.key == K_LEFT:
                if x[3,0]>4.59:
                  tx-=0
                else:
                  tx -= 0.1
            if e.key == K_RIGHT:
               if x[3,0]<-2.59:
                  tx+=0
               else:
                  tx += 0.1
          if entry==True:
            if e.key == K_ESCAPE:
                sys.exit()
            if e.key == K_UP:
              	if x[3,1]<-2.233 :
                   ty+=0
                elif x[3,0]<3.7 and x[3,0]>-2.5  and x[3,1]<-1.55 and x[3,1]>-2.02: 
              	    ty += 0
                    
              	else:
                    ty+=0.1            
            if e.key == K_DOWN:
                if x[3,0]<4.59 and x[3,0]>4.09 and x[3,1]>-0.94: 
              	  ty -= 0.1
              	  entry=False
                elif x[3,0]<3.7 and x[3,0]>-2.5  and x[3,1]<-1.71 and x[3,1]>-2.22:
                  ty-=0
                if (x[3,0]>4.59 or x[3,0]<4.09) and x[3,1]>-1.23: 
              	  ty -= 0.0
              	else : ty-=0.1
                
           
            if e.key == K_LEFT:
                if x[3,0]>4.59:
                  tx-=0
                elif x[3,0]<3.7 and x[3,0]>-2.65  and x[3,1]<-1.71 and x[3,1]>-2.02:      
                  tx-=0
                 
                else:
                  tx -= 0.1
            if e.key == K_RIGHT:
               if x[3,0]<-2.59:
                  tx+=0
               elif x[3,0]<3.8 and x[3,0]>-2.5  and x[3,1]<-1.71 and x[3,1]>-2.02:
                  tx-=0
                  
               else:
                  tx += 0.1
      
                     
        elif e.type == MOUSEBUTTONDOWN:
            #if e.button == 4: zpos = max(1, zpos-1)
           # elif e.button == 5: zpos += 1
            if e.button == 1: rotate = True
          #  elif e.button == 3: move = True
        elif e.type == MOUSEBUTTONUP:
            if e.button == 1: rotate = False
            #elif e.button == 3: move = False
        elif e.type == MOUSEMOTION:
            i, j = e.rel
            if rotate:
                rx += i/100
                ry += j/100
            if move:
                tx += i/100
                ty -= j/100
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    glLoadIdentity()
    gluLookAt(0.0, 15.0, 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0)    
    glTranslate(tx, ty, -zpos)
    glRotate(ry, 0, 0, 1)
   
    glCallList(obj.gl_list)
    pygame.display.flip() 
