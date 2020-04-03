// snake sprite struct
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width; 
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int active;
    int applesCollected;
    int curFrame;
    int numFrames;
} SNAKESPRITE;

// apple struct
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width; 
    int height;
    int aniState;
    int active;
} APPLESPRITE;

// snake variables
SNAKESPRITE snakeHead;
SNAKESPRITE snakeBodyArray[28];
#define SNAKEBODYCOUNT 20

// apple variable
APPLESPRITE apple;

// if player has lost
extern int hasLost;

// aniState enums
enum { SNAKENEUTRAL, SNAKESAD, SNAKEHAPPY, SNAKEBODY, APPLE, BLACKBACKGROUND, SNAKEIDLE};

// function prototypes
void initSnake();
void drawSnake();
void updateSnake();
void drawApple();
void updateGame();
void initGame();
void initApples();
