TARGET = videocube

CC = g++
CFLAGS = -std=c++11 -O2 -D__USING_X11__
LDFLAGS =
SRCS = egl.cpp Exception.cpp main.cpp Matrix4.cpp Vector3.cpp X11Window.cpp OpenGL.cpp OpenGLException.cpp
LIBS = -lX11 -lEGL -lGLESv2 -L/usr/lib/aml_libs -lamcodec -lamadec -lamavutils -lasound -lpthread

OBJS=$(SRCS:%.cpp=%.o)

.PHONY: all clean
all: $(TARGET)

clean:
	@rm -f *.o $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

.cpp.o:
	$(CC) $(CFLAGS) -c $< -o $@
