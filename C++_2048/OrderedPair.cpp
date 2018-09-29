//Richard Stefanik OrderedPair.cpp
#include <iostream>
#include "OrderedPair.h"
using namespace std;



//Default Constructor.  Important part is this OrderedPair 
//is a location that is not a valid 2D array index.  (Index
//for any array cannot be less than 0.)
OrderedPair::OrderedPair()
{
	x = -1;
	y = -1;
}


//Because in a 2D array the inedex is really (y, x), from now on,
//simply think of x as the first element of an OrderedPair, and y
//as the second element of an OrderedPair. 
OrderedPair::OrderedPair(int x, int y)
{
	this->x = x;
	this->y = y;
//	this->x = y;
//	this->y = x;
}

OrderedPair::~OrderedPair()
{

}

void OrderedPair::setX(int x)
{
	this->x = x;
}

void OrderedPair::setY(int y)
{
	this->y = y;
}


int OrderedPair::getX()
{
	return x;
}

int OrderedPair::getY()
{
	return y;
}

//Values for directions shown in enum in OrderedPair.h
//N --> North,  SW --> Southwest for instance
void OrderedPair::bump(int dir)
{
	switch (dir) {
		case (N): 
		{
			x--;
			break;
		}
		case (S): 
		{
			x++;
			break;
		}
		case (E): 
		{
			y++;
			break;
		}
		case (W): 
		{
			y--;
			break;
		}
		case (NE): 
		{
			x--;
			y++;
			break;
		}
		case (NW): 
		{
			x--;
			y--;
			break;
		}
		case (SE): 
		{
			x++;
			y++;
			break;
		}
		case (SW): 
		{
			x++;
			y--;
			break;
		}
	}
}

ostream& operator<< (ostream &a, OrderedPair &b)
{
	a << "(" << b.getX() << "," << b.getY() << ")";
	return a;
}

bool OrderedPair::operator== (OrderedPair a)
{
	if ((x == a.getX()) && (y == a.getY()))
		return true;
	return false;
}

bool OrderedPair::operator!= (OrderedPair a)
{
	if ((x == a.getX()) && (y == a.getY()))
		return false;
	return true;
}

//Flips the two elements of an OrderedPair.  Useful when
//displaying info to the user, since the indexes in a 2D 
//array are [y][x].
OrderedPair OrderedPair::flip()
{
	return OrderedPair(y, x);
}
