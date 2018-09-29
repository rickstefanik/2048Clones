//Richard Stefanik OrderedPair.h

#include <iostream>
using namespace std;

enum directions {N, NE, E, SE, S, SW, W, NW};

class OrderedPair{
	friend ostream& operator<< (ostream&, OrderedPair&);
	public: 
		OrderedPair();
		OrderedPair(int, int);
		~OrderedPair();

		void setX(int);
		void setY(int);
		
		int getX();
		int getY();

		void bump(int);
		
		OrderedPair flip();
		string toOutput();
		bool operator== (OrderedPair);
		bool operator!= (OrderedPair);
	private: 
		int x;
		int y;
};
