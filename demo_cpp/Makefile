CXXFLAGS =	-O2 -g -Wall -fmessage-length=0

OBJS =		demo_cpp.o

LIBS =

TARGET =	demo_cpp.exe

$(TARGET):	$(OBJS)
	$(CXX) -o $(TARGET) $(OBJS) $(LIBS)

all:	$(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)
