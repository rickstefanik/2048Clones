#include <vector>

using namespace std;

const int standardSize = 4;

class Board {
	public:
		Board();
		Board(int);
		~Board();
		int getScore();
		void setScore(int);
		void addScore(int);
		vector<vector<int> > getGrid();
		void setGrid(vector<vector<int> >);
		int numOpenSpaces();
		bool isFull();
		void displayBoard();
		void setElement(int, int, int);
		void setElement(OrderedPair, int);
		int getElement(int, int);
		int getElement(OrderedPair);
		void placeRandomly(int);
		bool isOpenSpot(OrderedPair);
		bool isBoardFull();
		OrderedPair pickRandomSpot();
		bool isInBounds(int, int);
		bool isInBounds(OrderedPair);
		bool shiftCells(int);
		bool compare2DVec(vector<vector<int> >, vector<vector<int> >);
		vector<vector<bool> > defaultFalses();
		void shiftLeft();
		void shiftRight();
		void shiftUp();
		void shiftDown();
		bool getElement(vector<vector<bool> >, int, int);
		bool getElement(vector<vector<bool> >, OrderedPair);
		bool anyCommonNeighbor();
		bool noMovesLeft();
		bool hasCommonNeighbor(OrderedPair);
	private:
		vector<vector<int> > grid;
		int score;
};
