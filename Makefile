MAKEOPTS += -j3

CLASSPATH = .:/usr/share/java/antlr-4.6-complete.jar
ANTLR = java -cp $(CLASSPATH) org.antlr.v4.Tool
GRUN = java -cp $(CLASSPATH) org.antlr.v4.gui.TestRig
CXXFLAGS = -std=c++11 -I/usr/local/include/antlr4-runtime
LDLIBS = -lantlr4-runtime
LINK.o = $(LINK.cc)

GENERATED_SRCS=$(wildcard Hello*.cpp)
GENERATED_LIBS=$(GENERATED_SRCS:.cpp=.o)

hello-main: hello-main.o $(GENERATED_LIBS)

hello: Hello.g4
	$(ANTLR) -Dlanguage=Cpp Hello.g4

hello-java: Hello.g4
	$(ANTLR) Hello.g4

gui: hello-java
	javac -cp $(CLASSPATH) Hello*.java
	$(GRUN) Hello r -gui

clean:
	rm -f *.o $(GENERATED_SRCS) $(wildcard Hello*.h)