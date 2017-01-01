TAGMEM=/home/daniel-robson/Projects/tagged_memory
CLINTERP=/home/daniel-robson/Projects/clinterp
INC=-I$(TAGMEM)/inc -I$(CLINTERP)/inc
LIB=-L$(TAGMEM)/lib -L$(CLINTERP)/lib
LLFLAGS=-ltagged_memory -lclinterp -lssl -lcrypto
all: qgdb_deamon.o qgdb_connect.o
	g++ -std=c++11 -Wall -o qgdb_deamon.exec $(INC) $(LIB) qgdb_deamon.o -lboost_system -lboost_filesystem -lpthread -lboost_thread $(LLFLAGS)
	g++ -std=c++11 -Wall -o qgdb_connect.exec $(INC) $(LIB) qgdb_connect.o -lboost_system -lboost_filesystem -lpthread -lboost_thread $(LLFLAGS)

qgdb_deamon.o: qgdb_deamon.cpp
	g++ -c -std=c++11 -Wall $(INC) $(LIB) -o qgdb_deamon.o qgdb_deamon.cpp $(LLFLAGS)

qgdb_connect.o: qgdb_connect.cpp
	 g++ -c -std=c++11 -Wall $(INC) $(LIB) -o qgdb_connect.o qgdb_connect.cpp $(LLFLAGS)

clean:
	rm -f *.o
	rm -f *.exec
