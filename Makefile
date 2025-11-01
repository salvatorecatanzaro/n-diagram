# Compiler and flags
CXX := g++

CXXFLAGS := -Iimgui -Iimgui/backends -I$(shell brew --prefix glfw)/include -Wall -O2
LIBS := -L$(shell brew --prefix glfw)/lib -lglfw -framework OpenGL -ldl -lpthread

# Files
IMGUI_SRC := imgui/imgui.cpp imgui/imgui_draw.cpp imgui/imgui_tables.cpp imgui/imgui_widgets.cpp \
              imgui/imgui_demo.cpp \
              imgui/backends/imgui_impl_glfw.cpp imgui/backends/imgui_impl_opengl3.cpp

OBJS := $(IMGUI_SRC:.cpp=.o) main.o

# Target
all: main

main: $(OBJS)
	$(CXX) -o $@ $^ $(LIBS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) main

