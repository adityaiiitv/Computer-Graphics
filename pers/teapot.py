from OpenGL.GLUT import *
from OpenGL.GL import *
from OpenGL.GLU import *
def draw():
	glClear(GL_COLOR_BUFFER_BIT)
	glutWireTeapot(0.5)	
	glFlush()
glutInit(sys.argv)
glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB)
glutInitWindowSize(250, 250)
glutInitWindowPosition(100, 100)
glutCreateWindow("Teapot Rotation")
i=-10;
while(i<10):
	glutPostRedisplay()
	gluPerspective(45.0, 1.0, 1.0, 5.0)
	gluLookAt(i, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0)
	glutDisplayFunc(draw)
	i+1

glutMainLoop()
