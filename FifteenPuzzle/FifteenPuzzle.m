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
    NSInteger nVal = 1;
    
}
-(int)getTileAtRow:(int)row Column:(int)col{
    return state[row][col];
}
-(void)getRow:(int*)row Column:(int*)col ForTile:(int)tile{
    
}
-(BOOL)isSolved{
    
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
    NSLog(@"%d", state[row][col]);
    if( state[row][col - 1] == 0){
        int temp = state[row][col];
        state[row][col] = state[row][col - 1];
        state[row][col-1] = temp;
        
    }else if ( state[row][col + 1] == 0){
        int temp = state[row][col];
        state[row][col] = state[row][col + 1];
        state[row][col + 1] = temp;
        
    }else if (state[row - 1][col] == 0){
        int temp = state[row][col];
        state[row][col] = state[row - 1][col];
        state[row - 1][col] = temp;
        
    } else if (state[row+1][col]){
        int temp = state[row][col];
        state[row][col] = state[row + 1][col];
        state[row + 1][col] = temp;
    }
    NSLog(@"%d", state[row][col]);
}

@end
