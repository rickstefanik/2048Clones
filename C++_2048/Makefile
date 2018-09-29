
CMP = g++ -std=c++11
MAIN = main2048
CLASS1 = OrderedPair
CLASS2 = Board
EXEC = play2048

$(EXEC): $(MAIN).o $(CLASS1).o $(CLASS2).o
	$(CMP) $(MAIN).o gfxnew.o $(CLASS1).o $(CLASS2).o -lX11 -o $(EXEC)

$(MAIN).o: $(MAIN).cpp
	$(CMP) -c $(MAIN).cpp

$(CLASS1).o: $(CLASS1).h $(CLASS1).cpp
	$(CMP) -c $(CLASS1).cpp

$(CLASS2).o: $(CLASS1).h $(CLASS2).h $(CLASS2).cpp
	$(CMP) -c $(CLASS2).cpp

clean:
	rm $(MAIN).o
	rm $(CLASS1).o
	rm $(CLASS2).o
	rm $(EXEC)

