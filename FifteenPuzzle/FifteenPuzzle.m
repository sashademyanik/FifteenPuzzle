//
//  FifteenPuzzle.m
//  FifteenPuzzle
//
//  Created by Alexander Paul Demyanik on 2/11/14.
//  Copyright (c) 2014 WSUV. All rights reserved.
//

#import "FifteenPuzzle.h"

@implementation FifteenPuzzle{
    int state[4][4];
}
-(id)init{
    int increment = 1;
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            if( i == 3 && j == 3){
                state[3][3] = 0;
            }else{
                state[i][j] = increment++;
                NSLog(@"%d", state[i][j]);
            }
        }
    }
    return self;

}
-(void)scramble:(int)n{
    int i, j;
    while (n > 0) {
        BOOL check = NO;
        i = rand()%4;
        j = rand()%4;
        
        if ([self canSlideTileUpAtRow:i Column:j] || [self canSlideTileDownAtRow:i Column:j] ||
            [self canSlideTileLeftAtRow:i Column:j] || [self canSlideTileRightAtRow:i Column:j]) {
            check = YES;
        }
        if(check){
            [self slideTileAtRow:i Column:j];
            n--;
        }
        
    }
    
}
-(int)getTileAtRow:(int)row Column:(int)col{
    return state[row][col];
}
-(void)getRow:(int*)row Column:(int*)col ForTile:(int)tile{
    for (int i = 0; i < 4; i ++) {
        for (int j = 0; j < 4; j++) {
            if (state[i][j] == tile) {
                *row = i;
                *col = j;
            }
        }
    }
}
-(BOOL)isSolved{
    BOOL check = YES;
    int test[4][4];
    int inc = 1;
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            if(i == 3 && j == 3){
                test[i][j] = 0;
            }
            else{
                test[i][j] = inc;
                inc++;
            }
        }
    }
    
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            if(state[i][j] != test[i][j]){
                check = NO;
            }
        }
    }
    
    if(check){
        return YES;
    }
    return NO;
}
-(BOOL)canSlideTileUpAtRow:(int)row Column:(int)col{
    NSLog(@"Can I slide? %d", state[row][col]);
    if(row != 0 && state[row-1][col ] == 0){
        return YES;
    }else{
        return NO;
    }
    
}
-(BOOL)canSlideTileDownAtRow:(int)row Column:(int)col{
    if(row != 3 && state[row+1][col] == 0){
        return YES;
    }else{
        return NO;
    }
}
-(BOOL)canSlideTileLeftAtRow:(int)row Column:(int)col{
    if(col != 0 && state[row][col- 1] == 0){
        return YES;
    }else{
        return NO;
    }
}
-(BOOL)canSlideTileRightAtRow:(int)row Column:(int)col{
    if(col != 3 && state[row][col + 1] == 0){
        return YES;
    }else{
        return NO;
    }
}

-(void)slideTileAtRow:(int)row Column:(int)col {
    int temp1, temp2;
    if([self canSlideTileDownAtRow:row Column:col]){
        temp1 = state[row][col];
        temp2 = state[row+1][col];
        state[row][col] = temp2;
        state[row+1][col] = temp1;
    }
    else if([self canSlideTileUpAtRow:row Column:col]){
        temp1 = state[row][col];
        temp2 = state[row-1][col];
        state[row][col] = temp2;
        state[row-1][col] = temp1;
    }
    else if([self canSlideTileLeftAtRow:row Column:col]){
        temp1 = state[row][col];
        temp2 = state[row][col-1];
        state[row][col] = temp2;
        state[row][col-1] = temp1;
    }
    else if([self canSlideTileRightAtRow:row Column:col]){
        temp1 = state[row][col];
        temp2 = state[row][col+1];
        state[row][col] = temp2;
        state[row][col+1] = temp1;
    }
}

@end
