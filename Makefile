
INC=-I/home/daniel-robson/Projects/clinterp/inc -I/home/daniel-robson/Downloads/base64/inc
LIB=-L/home/daniel-robson/Projects/clinterp/lib -L/home/daniel-robson/Downloads/base64/lib
LLFLAGS=-ltagged_memory -lintlen -lclinterp -lssl -lcrypto -lbase64
ARC=-DARC64
all: qgdb_deamon.o qgdb_connect.o
	g++ -std=c++11 -Wall $(ARC) -o qgdb_deamon.exec $(INC) $(LIB) qgdb_deamon.o -lboost_system -lboost_filesystem -lpthread -lboost_thread $(LLFLAGS)
	g++ -std=c++11 -Wall $(ARC) -o qgdb_connect.exec $(INC) $(LIB) qgdb_connect.o -lboost_system -lboost_filesystem -lpthread -lboost_thread $(LLFLAGS)

server: qgdb_deamon.o
	g++ -std=c++11 -Wall $(ARC) -o qgdb_deamon.exec $(INC) $(LIB) qgdb_deamon.o -lboost_system -lboost_filesystem -lpthread -lboost_thread $(LLFLAGS)

debugging: qgdb_connect.o
	g++ -std=c++11 -Wall $(ARC) -o debugging.exec $(INC) $(LIB) debugging.cpp qgdb_connect.o -lboost_system -lboost_filesystem -lpthread -lboost_thread $(LLFLAGS)

qgdb_deamon.o: qgdb_deamon.cpp
	g++ -c -std=c++11 -Wall $(ARC) $(INC) $(LIB) -o qgdb_deamon.o qgdb_deamon.cpp $(LLFLAGS)

qgdb_connect.o: qgdb_connect.cpp
	 g++ -c -std=c++11 -Wall $(ARC) $(INC) $(LIB) -o qgdb_connect.o qgdb_connect.cpp $(LLFLAGS)

clean:
	rm -f *.o
	rm -f *.exec
