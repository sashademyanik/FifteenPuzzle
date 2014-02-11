//
//  FifteenPuzzle.h
//  FifteenPuzzle
//
//  Created by Alexander Paul Demyanik on 2/11/14.
//  Copyright (c) 2014 WSUV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FifteenPuzzle : NSObject

-(id)init;
-(void)scramble:(int)n;
-(int)getTileAtRow:(int*)row Column:(int*)col;
-(void)getRow:(int*)row Column:(int*)col ForTile:(int)tile; 
-(BOOL)isSolved;
-(BOOL)canSlideTileUpAtRow:(int)row Column:(int)col;
-(BOOL)canSlideTileDownAtRow:(int)row Column:(int)col;
-(BOOL)canSlideTileLeftAtRow:(int)row Column:(int)col;
-(BOOL)canSlideTileRightAtRow:(int)row Column:(int)col;
-(void)slideTileAtRow:(int)row Column:(int)col;

@end
