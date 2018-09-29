#include <iostream>
#include <cstdlib>
#include <unistd.h>
#include <cmath>
#include <string.h>
#include "OrderedPair.h"
#include "Board.h"
#include "gfxnew.h"

using namespace std;

void performUserMove(Board &, char);
void printGameOver(Board);
void drawBox(int, int, int, int, char *, int, int, int);
void boardWindow(Board);
bool isValidKey(char);
void displayGameOver();
//char * sconv(string);
void  getKeyPress(int, char &);

char font[] = "12x24";
//char font[] = "10x20";
const int xStart = 60;
const int yStart = 60;
const int xSeparation = 90;
const int ySeparation = 120;
const int height = 100;
const int width = 60;

int main()
{
	gfx_open(450, 550, "2048");
	gfx_color(200, 200, 100);
	gfx_changefont(font);

	Board b;
//	b.displayBoard();
	char userIn;
	int event;
	bool running = true;
	bool shouldQuit = false;
	boardWindow(b);

	while (running)
	{
		event = gfx_event_waiting();
		getKeyPress(event, userIn);
		if (userIn == 'q')
		{
			shouldQuit = true;
			break;
		}
		else if (isValidKey(userIn))
		{
		//	system("clear");
			performUserMove(b, userIn);
			boardWindow(b);
		//	b.displayBoard();
			running = b.noMovesLeft() ? false : true;
		}
	}
	if (shouldQuit == false)
	{
		while (true)
		{
			displayGameOver();
			event = gfx_event_waiting();
			getKeyPress(event, userIn);
			if (userIn == 'q') 
				break;
		}
	} 
	return 0;
}

void getKeyPress(int event, char & a)
{
	char userIn;
	if (event != 0)
	{
		userIn = gfx_wait();
		if (event == 1)
		{
			a = userIn;
		}
		else 
		{ 
			a= '\0';
		}

	}
}

void printGameOver(Board b)
{
	cout << "Game Over." << endl;
	cout << "Final Score: " << b.getScore() << endl;
}


bool isValidKey(char a)
{
	char b[9] = "RwQaTsSd";

	for (int i = 0; i < 8; i++)
	{
		if (b[i] == a)
			return true;
	}
	return false;
}

void performUserMove(Board &b, char userIn)
{
	bool changed;
	switch (userIn)
		{
			case('R'):
			case('w'):
			{	
				changed = b.shiftCells(N);
				break;
			}
			case('Q'):
			case('a'):
			{
				changed = b.shiftCells(W);
				break;
			}
			case('T'):
			case('s'):
			{
				changed = b.shiftCells(S);
				break;
			}
			case('S'):
			case('d'):
			{
				changed = b.shiftCells(E);
				break;
			}
		}
	if (changed && (b.isBoardFull() == false))
		b.placeRandomly((rand() % 2) + 1);
}

void drawBox(int xStart, int yStart, int height, int width, char * text, int red, int green, int blue)
{
	
	gfx_color(red, green, blue);
	gfx_fill_rectangle(xStart, yStart, width, height);
	gfx_color(100, 143, 234);

	int p_width = gfx_textpixelwidth(text, font);
	int p_height = gfx_textpixelheight(text, font);
	
//	cout << text << endl;

	gfx_text(xStart + ((width/2) - (p_width/2) ), yStart + ((height/2) +  (p_height/2)), text);
}

void boardWindow(Board a)
{
	vector<vector<int> > b = a.getGrid();
	char blank[1] = {'\0'};

	int e = a.getScore();
	string q = to_string(e);
	char *m = new char[q.length() + 1];
	strcpy(m, q.c_str());

	drawBox(xStart, 10, 35, 100, m,170, 30, 20);

	for (int i = 0; i < 4; i++)
	{
		for (int j = 0; j < 4; j++)
		{
			int h = pow(2, b[j][i]);
			string n = to_string(h);
			char *num = new char[n.length() + 1];
			strcpy(num, n.c_str());

			if (n != "1")
			{
				drawBox(xStart + (i * xSeparation), yStart  + (j * ySeparation), height, width, num, 255, 225 - (20 * b[j][i]), 40);
			}
			else
			{
				drawBox(xStart + (i * xSeparation), yStart  + (j * ySeparation), height, width, blank, 255, 225, 40);
			}
			delete [] num;
		}
	}
	gfx_flush();

}


void displayGameOver()
{
	char o[14] = "Game Over";
	
	int p_width = gfx_textpixelwidth(o, font);
	int p_height = gfx_textpixelheight(o, font);
	
	drawBox(xStart + (4 * xSeparation) - 178, yStart - 50, 35, 150, o, 100, 30, 40);
}
