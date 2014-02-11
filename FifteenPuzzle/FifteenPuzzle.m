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
    state = {
        {1,2,3,4},
        {5,6,7,8},
        {9,10,11,12},
        {13,14,15,0}
    };
}
-(void)scramble:(int)n{
    
}
-(int)getTileAtRow:(int*)row Column:(int*)col{
    state[row][col];
    return state[row][col];
}
-(void)getRow:(int*)row Column:(int*)col ForTile:(int)tile{
    
}
-(BOOL)isSolved{
    
    return NO;
}
-(BOOL)canSlideTileUpAtRow:(int)row Column:(int)col{
    
    return NO;
}
-(BOOL)canSlideTileDownAtRow:(int)row Column:(int)col{
    return NO;
}
-(BOOL)canSlideTileLeftAtRow:(int)row Column:(int)col{
    return NO;
}
-(BOOL)canSlideTileRightAtRow:(int)row Column:(int)col{
    return NO;
}

@end
