#include "myLib.h"
#include "startScreen.h"
#include "gameScreen.h"
#include "pauseScreen.h"
#include "winScreen.h"
#include "loseScreen.h"
#include "game.h"
#include "spriteSheet.h"
#include <stdlib.h>
#include <stdio.h>

// State Prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// Prototypes
void initialize();
void game();

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

OBJ_ATTR shadowOAM[128];

#define SHADOWOAMLENGTH 128

// for random
int seed;

// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

int main() {

    initialize();

    while(1) {
        
        // State Machine
        switch(state) {

            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;

        }

        oldButtons = buttons;
        buttons = BUTTONS;

	}
    return 0;
}

// Initialize the game on first launch
void initialize() {

    DMANow(3, spriteSheetPal, SPRITEPALETTE, spriteSheetPalLen/2);
    DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);
    hideSprites();
    REG_DISPCTL = MODE0 | SPRITE_ENABLE;
    initSnake();
    buttons = BUTTONS; 
    goToStart();

}

// Sets up the start state
void goToStart() {
    
    state = START;
    hasLost = 0;
    seed = 0;

}

// Runs every frame of the start state
void start() {

    seed++;
    // set up display control register
    REG_DISPCTL = MODE0 | BG1_ENABLE;

    // load startScreen tile palette
    DMANow(3, startScreenPal, PALETTE, startScreenPalLen/2);

    //  set up bg 1 control register
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    // load startScreen tiles to charblock
    DMANow(3, startScreenTiles, &CHARBLOCK[0], startScreenTilesLen/2);

    // load startScreen map to screenblock
    DMANow(3, startScreenMap, &SCREENBLOCK[31], startScreenMapLen/2);

    for (int i = 0; i < SHADOWOAMLENGTH; i++) {

        shadowOAM[i].attr0 = 0;
        shadowOAM[i].attr1 = 0;
        shadowOAM[i].attr2 = 0;

    }

    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        initGame();
        goToGame(); 
    }

    if (BUTTON_PRESSED(BUTTON_LEFT)) {
        goToLose();
    }

}

// Sets up the game state
void goToGame() {

    hideSprites();
    state = GAME;

}

// Runs every frame of the game state
void game() {
    
    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;

    // load gameScreen tile palette
    DMANow(3, gameScreenPal, PALETTE, gameScreenPalLen/2);

    // set up bg 1 control register
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    // load gameScreen tiles to charblock
    DMANow(3, gameScreenTiles, &CHARBLOCK[0], gameScreenTilesLen/2);
    
    // load gameScreen map to screenblock
    DMANow(3, gameScreenMap, &SCREENBLOCK[31], gameScreenMapLen/2);
    
    updateGame();
    
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    if (snakeHead.applesCollected == 20) {
        goToWin();
    }

    if (hasLost) {
        goToLose();
    }

}

// Sets up the pause state
void goToPause() {

    state = PAUSE;

}

// Runs every frame of the pause state
void pause() {

    REG_DISPCTL = MODE0 | BG1_ENABLE;

    DMANow(3, pauseScreenPal, PALETTE, pauseScreenPalLen/2);

    // set up bg 1 control register
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    // load pauseScreen tiles to charblock
    DMANow(3, pauseScreenTiles, &CHARBLOCK[0], pauseScreenTilesLen/2);

    // load pauseScreen map to screenblock
    DMANow(3, pauseScreenMap, &SCREENBLOCK[31], pauseScreenMapLen/2);

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    
}

// Sets up the win state
void goToWin() {

    state = WIN;

}


void win() {

    REG_DISPCTL = MODE0 | BG1_ENABLE;

    DMANow(3, winScreenPal, PALETTE, winScreenPalLen/2);

    // set up bg 1 control register
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    // load winScreen tiles to charblock
    DMANow(3, winScreenTiles, &CHARBLOCK[0], winScreenTilesLen/2);
    
    // load winScreen map to screenblock
    DMANow(3, winScreenMap, &SCREENBLOCK[31], winScreenMapLen/2);
    
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }

}

// Sets up the lose state
void goToLose() {
    
    state = LOSE;

}

// Runs every frame of the lose state
void lose() {

    REG_DISPCTL = MODE0 | BG1_ENABLE;

    DMANow(3, loseScreenPal, PALETTE, loseScreenPalLen/2);

    // set up bg 1 control register
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    // load loseScreen tiles to charblock
    DMANow(3, loseScreenTiles, &CHARBLOCK[0], loseScreenTilesLen/2);

    // load loseScreen map to screenblock
    DMANow(3, loseScreenMap, &SCREENBLOCK[31], loseScreenMapLen/2);

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }

}