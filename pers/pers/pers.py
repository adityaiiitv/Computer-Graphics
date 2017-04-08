from OpenGL.GL import *
from OpenGL.GLU import *
from OpenGL.GLUT import *
from numpy import *
import sys
def init():
    glClearColor(1.0, 1.0, 1.0, 1.0)
    gluOrtho2D(-15.0, 15.0, -15.0, 15.0)

def plotfunc():
    glClear(GL_COLOR_BUFFER_BIT)
    glColor3f(0.0, 0.0, 0.0)
    glPointSize(1.0)
    # Plot the coordinate axes
    glBegin(GL_LINES)
    glVertex3f(-10.0, 0.0)
    glVertex3f(10.0, 0.0)
    glVertex3f(0.0, 10.0)
    glVertex3f(0.0, -10.0)
    glEnd()
    # Plot the parametric equations
    glBegin(GL_POINTS)
    for t in arange(0,4*pi, 0.1):
        x = cos(t)
        y = sin(t)
	z = 2*t
        glVertex3f(x, y, z)
    glEnd()
    glFlush()
# End plotfunc()
def main():
    glutInit(sys.argv)
    glutInitDisplayMode(GLUT_SINGLE|GLUT_RGB)
    glutInitWindowPosition(50,50)
    glutInitWindowSize(400,400)
    glutCreateWindow("Function Plotter")
    glutDisplayFunc(plotfunc)
    
    init()
    glutMainLoop()
main()
