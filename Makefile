

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	OPENCV_PATH = /usr/local/Cellar/opencv/4.6.0_1
	CFLAGS = -I$(OPENCV_PATH)/include/opencv4
	LDFLAGS = -L$(OPENCV_PATH)/lib -lopencv_core -lopencv_imgproc -lopencv_highgui -lopencv_videoio -lopencv_imgproc
endif
ifeq ($(UNAME_S),Darwin)
	OPENCV_PATH = /usr/local/Cellar/opencv/4.6.0_1
	CC = g++ -std=c++11
	CFLAGS = -I$(OPENCV_PATH)/include/opencv4
	LDFLAGS = -L$(OPENCV_PATH)/lib -lopencv_core -lopencv_imgproc -lopencv_highgui -lopencv_videoio -lopencv_imgproc
endif

# Target
TARGET = main
# Source files
SRC = main.cpp
# Object files
OBJ = $(SRC:.cpp=.o)

# Makefile rules
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CC) $(CFLAGS) -c $<
clean:
	rm -f $(OBJ) $(TARGET)

# End of Makefile