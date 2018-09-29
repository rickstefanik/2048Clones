#include <iostream>
#include <vector>
#include <time.h>
#include <cmath>
#include <iomanip>
#include "OrderedPair.h"
#include "Board.h"

using namespace std;

Board::Board()
{
	score = 0;
	srand (time(NULL));
	vector<int> zeros;
	for (int i = 0; i < standardSize; i++) 
	{
		zeros.push_back(0);
	}	

	for (int i = 0; i < standardSize; i++)
	{
		grid.push_back(zeros);
	}

	placeRandomly((rand() % 2) + 1);
	placeRandomly((rand() % 2) + 1);
}

Board::Board(int a)
{
	score = 0;
	vector<int> zeros;
	for (int i = 0; i < a; i++) 
	{
		zeros.push_back(0);
	}	

	for (int i = 0; i < a; i++)
	{
		grid.push_back(zeros);
	}
}

Board::~Board()
{

}

vector<vector<bool> > Board::defaultFalses()
{
	vector<vector<bool> > ret;
	vector<bool> oneLine;

	for (int i = 0; i < grid.size(); i++)
	{
 		oneLine.push_back(false);
	}
	
	for (int i = 0; i < grid.size(); i++)
	{
 		ret.push_back(oneLine);
	}
	return ret;
}

void Board::displayBoard()
{
	cout << "Score: " << score << endl << endl;
	cout << "  ";
	for (int i = 0; i < grid.size(); i++)
	{
		cout << setw(5);
		cout << "v";
	}
	cout << endl << endl;
	for (int i = 0; i < grid.size(); i++)
	{
		cout << ">" << " ";
		for (int j = 0; j < grid.size(); j++)
		{
			if (getElement(i, j) == 0)
			{
				cout << "     ";
			}
			else
			{
				cout << setw(5);
				cout << right;
				cout << pow(2, getElement(i, j));
			}
		}
		cout << endl << endl << endl;
	}
}

vector<vector<int> > Board::getGrid()
{
	return grid;
}

void Board::setGrid(vector<vector<int> > grid)
{
	this->grid = grid;
}

int Board::getScore()
{
	return score;
}

void Board::setScore(int score)
{
	this->score = score;
}

void Board::addScore(int a)
{
	score = score + a;
}

int Board::numOpenSpaces()
{
	int count = 0;
	for (int i = 0; i < grid.size(); i++)
	{
		for (int j = 0; j < grid.size(); j++)
		{
			if (grid[i][j] == 0)
			{
				count++;
			}
		}
	}
	return count;
}


bool Board::isBoardFull()
{
	if (numOpenSpaces() == 0)
	{
		return true;
	}
	return false;
}

int Board::getElement(int x, int y)
{
	if (isInBounds(x, y))
		return grid[x][y];
	return -1;
}

int Board::getElement(OrderedPair a)
{
	return getElement(a.getX(), a.getY());
}


void Board::setElement(int x, int y, int val)
{
	grid[x][y] = val;
}

void Board::setElement(OrderedPair a, int val)
{
	setElement(a.getX(), a.getY(), val);
}
bool Board::isOpenSpot(OrderedPair a)
{
	if (getElement(a) == 0)
	{
		return true;
	}
	return false;
}

OrderedPair Board::pickRandomSpot()
{
	int x = rand() % grid.size();
//	cout << "x: " << x << endl;
	int y = rand() % grid.size();
//	cout << "y: " << y << endl;

	OrderedPair ret(x,y);
	return ret;
}

void Board::placeRandomly(int val)
{
	OrderedPair spot = pickRandomSpot();
	while (isOpenSpot(spot) == false)
	{
		spot = pickRandomSpot();
	}
	
	setElement(spot, val);
}

bool Board::isInBounds(int x, int y)
{
	if ((x >= 0) && (y >= 0) && (x < grid.size()) && (y < grid.size()))
		return true;
	return false;
}

bool Board::isInBounds(OrderedPair a)
{
	return isInBounds(a.getX(), a.getY());		
}

bool Board::shiftCells(int dir)
{
	vector<vector<int> > previous = getGrid();

	switch (dir)
	{
		case (N):
		{
			shiftUp();
			break;
		}
		case (E):
		{
			shiftRight();
			break;
		}
		case (S):
		{
			shiftDown();
			break;
		}
		case (W):
		{
			shiftLeft();
			break;
		}	
	
	}
	if (compare2DVec(getGrid(), previous))
	{
		return false;
	}
	return true;
}

bool Board::compare2DVec(vector<vector<int> > a, vector<vector<int> > b)
{
	if (a.size() != b.size())
	{
		return false;
	}
	for (int i = 0; i < a.size(); i++)
	{
		for (int j = 0; j < a[i].size(); j++)
		{
			if (a[i][j] != b[i][j])
				return false;
		}
	}
	return true;
}


bool Board::getElement(vector<vector<bool> > a, int x, int y)
{
	if (isInBounds(x, y))
		return a[x][y];
	return true;
}

bool Board::getElement(vector<vector<bool> > a, OrderedPair b)
{
	return getElement(a, b.getX(), b.getY());
}

void Board::shiftRight()
{
	vector<vector<bool> > changeTracker = defaultFalses();
	for (int i = 0; i < grid.size(); i++)
	{
		for (int j = grid.size() - 1; j >= 0; j--)
		{
			OrderedPair e(i, j);
			int val = getElement(e);
			if (val > 0)
			{
				setElement(e, 0);
				e.bump(E);
				while ((getElement(e) == 0) && (getElement(changeTracker, e) == false))
				{
					setElement(e, 0);
					e.bump(E);
				}
				if ((getElement(e) == val) && (getElement(changeTracker, e) == false))
				{
					setElement(e, val + 1);
					addScore(pow(2, val+1));
					changeTracker[e.getX()][e.getY()] = true;
				}
				else
				{
					e.bump(W);
					setElement(e, val);
				}
			}
		}
//		cout << endl;
	}
		
}

void Board::shiftLeft()
{
	vector<vector<bool> > changeTracker = defaultFalses();
	for (int i = 0; i < grid.size(); i++)
	{
		for (int j = 1; j < grid.size(); j++)
		{
			OrderedPair e(i, j);
			int val = getElement(e);
			if (val > 0)
			{
				setElement(e, 0);
				e.bump(W);
				while ((getElement(e) == 0) && (getElement(changeTracker, e) == false))
				{
					setElement(e, 0);
					e.bump(W);
				}
				if ((getElement(e) == val) && (getElement(changeTracker, e) == false))
				{
					setElement(e, val + 1);
					addScore(pow(2, val+1));
					changeTracker[e.getX()][e.getY()] = true;
				}
				else
				{
					e.bump(E);
					setElement(e, val);
				}
			}
		}
//		cout << endl;
	}
		
}

void Board::shiftUp()
{
	vector<vector<bool> > changeTracker = defaultFalses();
	for (int j = 0; j < grid.size(); j++)
	{
		for (int i = 1; i < grid.size(); i++)
		{
			OrderedPair e(i, j);
			int val = getElement(e);
			if (val > 0)
			{
				setElement(e, 0);
				e.bump(N);
				while ((getElement(e) == 0) && (getElement(changeTracker, e) == false))
				{
					setElement(e, 0);
					e.bump(N);
				}
				if ((getElement(e) == val) && (getElement(changeTracker, e) == false))
				{
					setElement(e, val + 1);
					addScore(pow(2, val+1));
					changeTracker[e.getX()][e.getY()] = true;
				}
				else
				{
					e.bump(S);
					setElement(e, val);
				}
			}
		}
	//	cout << endl;
	}
		
}

void Board::shiftDown()
{
	vector<vector<bool> > changeTracker = defaultFalses();
	for (int j = 0; j < grid.size(); j++)
	{
		for (int i = grid.size() - 1; i >= 0; i--)
		{
			OrderedPair e(i, j);
			int val = getElement(e);
			if (val > 0)
			{
				setElement(e, 0);
				e.bump(S);
				while ((getElement(e) == 0) && (getElement(changeTracker, e) == false))
				{
					setElement(e, 0);
					e.bump(S);
				}
				if ((getElement(e) == val) && (getElement(changeTracker, e) == false))
				{
					setElement(e, val + 1);
					addScore(pow(2, val+1));
					changeTracker[e.getX()][e.getY()] = true;
				}
				else
				{
					e.bump(N);
					setElement(e, val);
				}
			}
		}
	//	cout << endl;
	}
		
}

bool Board::noMovesLeft()
{
	return (isBoardFull() && (!anyCommonNeighbor()));
}

bool Board::anyCommonNeighbor()
{
	for (int i = 0; i < grid.size(); i++)
	{
		for (int j = 0; j < grid.size(); j++)
		{
			OrderedPair a(i, j);
			if (hasCommonNeighbor(a))
				return true;
		}
	}
	return false;
}

bool Board::hasCommonNeighbor(OrderedPair a)
{
	int val = getElement(a);

	a.bump(N);
	if (val == getElement(a))
		return true;
	a.bump(S);
	a.bump(S);
	if (val == getElement(a))
		return true;
	a.bump(N);
	a.bump(E);
	if (val == getElement(a))
		return true;
	a.bump(W);
	a.bump(W);
	if (val == getElement(a))
		return true;
	return false;
}
