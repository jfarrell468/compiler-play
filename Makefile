CLASSPATH = .:/usr/share/java/antlr-4.6-complete.jar
ANTLR = java -cp $(CLASSPATH) org.antlr.v4.Tool
GRUN = java -cp $(CLASSPATH) org.antlr.v4.gui.TestRig

hello: Hello.g4
	$(ANTLR) -Dlanguage=Cpp Hello.g4

hello-java: Hello.g4
	$(ANTLR) Hello.g4

gui: hello-java
	javac -cp $(CLASSPATH) Hello*.java
	$(GRUN) Hello r -gui