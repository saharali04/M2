#include "game.h"
#include "myLib.h"
#include <stdlib.h>

// keeps track if player has lost
int hasLost;

// initializes snake and apples
void initGame() {
    initSnake();
    initApples();
}

// initialize snake
void initSnake() {
    
    // initialize snake's head
    snakeHead.active = 1;
    snakeHead.width = 8;
    snakeHead.height = 8;
    snakeHead.col = SCREENWIDTH/2 - (snakeHead.width/2) - 40;
    snakeHead.row = SCREENHEIGHT/2 - (snakeHead.height/2) - 10;
    snakeHead.cdel = 8;
    snakeHead.rdel = 8;
    snakeHead.aniCounter = 0;
    snakeHead.aniState = SNAKENEUTRAL;
    snakeHead.applesCollected = 0;
    snakeHead.curFrame = 0;
    snakeHead.numFrames = 2;  

    // initialize snake's body
    for (int i = 0; i < SNAKEBODYCOUNT; i++) {
        snakeBodyArray[i].width = 8;
        snakeBodyArray[i].height = 8;
        snakeBodyArray[i].col = snakeHead.col + (8 * (i+1));
        snakeBodyArray[i].row = snakeHead.row;
        snakeBodyArray[i].aniState = SNAKEBODY;   
        snakeBodyArray[i].active = 0;
    }

}

// updates position of snake and checks for collision
void updateSnake() {

    if (snakeHead.aniState != SNAKEIDLE) {
        snakeHead.prevAniState = snakeHead.aniState;
        snakeHead.aniState = SNAKENEUTRAL;
    }

    if(snakeHead.aniCounter % 25 == 0) {

            snakeHead.curFrame = (snakeHead.curFrame + 1) % snakeHead.numFrames;
	} else {
        snakeHead.aniCounter++;
    }

    if (BUTTON_HELD(BUTTON_UP)) {
        
        for (int i = SNAKEBODYCOUNT; i > 0; i--) {

            snakeBodyArray[i].col = snakeBodyArray[i-1].col;
            snakeBodyArray[i].row = snakeBodyArray[i-1].row;

        }

        snakeBodyArray[0].col = snakeHead.col;
        snakeBodyArray[0].row = snakeHead.row;

        snakeHead.aniState = SNAKEHAPPY;
        snakeHead.row-=snakeHead.rdel;
        
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {

        for (int i = SNAKEBODYCOUNT; i > 0; i--) {

            snakeBodyArray[i].col = snakeBodyArray[i-1].col;
            snakeBodyArray[i].row = snakeBodyArray[i-1].row;

        }

        snakeBodyArray[0].col = snakeHead.col;
        snakeBodyArray[0].row = snakeHead.row;

        snakeHead.aniState = SNAKEHAPPY;
        snakeHead.row+=snakeHead.rdel;

    }
    if (BUTTON_HELD(BUTTON_LEFT)) {

        for (int i = SNAKEBODYCOUNT; i > 0; i--) {

            snakeBodyArray[i].col = snakeBodyArray[i-1].col;
            snakeBodyArray[i].row = snakeBodyArray[i-1].row; 
            
        }

        snakeBodyArray[0].col = snakeHead.col;
        snakeBodyArray[0].row = snakeHead.row;

        snakeHead.aniState = SNAKESAD;
        snakeHead.col-=snakeHead.cdel;
        
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {

        for (int i = SNAKEBODYCOUNT; i > 0; i--) {

            snakeBodyArray[i].col = snakeBodyArray[i-1].col;
            snakeBodyArray[i].row = snakeBodyArray[i-1].row;
            
        }

        snakeBodyArray[0].col = snakeHead.col;
        snakeBodyArray[0].row = snakeHead.row;

        snakeHead.aniState = SNAKESAD;
        snakeHead.col+=snakeHead.cdel;
        
    }
    
    if (snakeHead.aniState == SNAKEIDLE) {
            snakeHead.curFrame = 0;
            snakeHead.aniState = SNAKENEUTRAL;
    } else {
        snakeHead.aniCounter++;
    }

    //  draw snake head
    shadowOAM[0].attr0 = snakeHead.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = snakeHead.col | ATTR1_TINY;
    shadowOAM[0].attr2 = ATTR2_TILEID(snakeHead.aniState, snakeHead.curFrame);

    // draw snake body
    for (int i = 0; i < SNAKEBODYCOUNT; i++) {

        if (snakeBodyArray[i].active) {
            shadowOAM[i+33].attr0 = snakeBodyArray[i].row | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i+33].attr1 = snakeBodyArray[i].col | ATTR1_TINY;
            shadowOAM[i+33].attr2 = ATTR2_TILEID(snakeBodyArray[i].aniState, 0);
            DMANow(3, shadowOAM, OAM, 128 * 4);
        }

    }

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

}

// increases size of snake
void extendBody() {

    for (int i = 0; i < SNAKEBODYCOUNT; i++) {
        if (snakeBodyArray[i].active == 0) {
            snakeBodyArray[i].active = 1;
            break;
        }
    }

}

// updates the apple and snake
void updateGame() {
    
    drawApple();
    
    updateSnake();

    if (collision(snakeHead.col, snakeHead.row, snakeHead.width, snakeHead.height, apple.col, apple.row, apple.width, apple.height)) {
        shadowOAM[2].attr0 = apple.row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[2].attr1 = apple.col | ATTR1_TINY;
        shadowOAM[2].attr2 = ATTR2_TILEID(BLACKBACKGROUND, 0);
        DMANow(3, shadowOAM, OAM, 128 * 4);
        apple.active = 0;
        snakeHead.applesCollected++;   
        extendBody();
    }

    if (apple.active == 0) {
        initApples();
    }

    if ((snakeHead.row > 152) | (snakeHead.row < 0) | (snakeHead.col < 0) | (snakeHead.col > 232)) {
        hasLost = 1;
    }

    for (int i = 0; i < SNAKEBODYCOUNT; i++) {

        if (snakeBodyArray[i].active) {
           if (collision(snakeHead.col, snakeHead.row, snakeHead.width, snakeHead.height, snakeBodyArray[i].col, snakeBodyArray[i].row, snakeBodyArray[i].width, snakeBodyArray[i].height)) {
                hasLost = 1;
             }
        }
    
    }
    waitForVBlank();

}

// gives the apples it's values

void initApples() {

    apple.width = 8;
    apple.height = 8;
    apple.col = (rand() % 224);
    apple.row = (rand() % 144);
    apple.active = 1;
    apple.aniState = APPLE;

}

// draws an apple
void drawApple() { 

    shadowOAM[2].attr0 = apple.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[2].attr1 = apple.col | ATTR1_TINY;
    shadowOAM[2].attr2 = ATTR2_TILEID(apple.aniState, 0);
    DMANow(3, shadowOAM, OAM, 128 * 4);

}
