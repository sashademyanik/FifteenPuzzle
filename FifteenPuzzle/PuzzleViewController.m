//
//  PuzzleViewController.m
//  FifteenPuzzle
//
//  Created by Alexander Paul Demyanik on 1/31/14.
//  Copyright (c) 2014 WSUV. All rights reserved.
//

#import "PuzzleViewController.h"

@interface PuzzleViewController ()

@end

@implementation PuzzleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.board = [[FifteenPuzzle alloc] init];
    //[self.board scramble: NUM_SHUFFLES];
    [self arrangeBoardView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)tileSelected:(UIButton*)sender{
    const int tag = [sender tag];
    NSLog(@"tileSelected: %d", tag);
    int row, col;
    [self.board getRow:&row Column:&col ForTile:tag];
    CGRect buttonFrame = sender.frame;
    if ([self.board canSlideTileUpAtRow:row Column:col]) {
        [self.board slideTileAtRow:row Column:col];
        buttonFrame.origin.y = (row - 1) * buttonFrame.size.height;
        sender.frame = buttonFrame;
        [UIView animateWithDuration: 0.5 animations:^{sender.frame = buttonFrame;}];
        
    }else if([self.board canSlideTileDownAtRow:row Column:col]){
        [self.board slideTileAtRow:row Column:col];
        buttonFrame.origin.y = (row + 1) * buttonFrame.size.height;
        sender.frame = buttonFrame;
        [UIView animateWithDuration: 0.5 animations:^{sender.frame = buttonFrame;}];
        
    }else if([self.board canSlideTileLeftAtRow:row Column:col]){
        [self.board slideTileAtRow:row Column:col];
        buttonFrame.origin.x = (col - 1) * buttonFrame.size.width;
        sender.frame = buttonFrame;
        [UIView animateWithDuration: 0.5 animations:^{sender.frame = buttonFrame;}];

        
    }else if([self.board canSlideTileRightAtRow:row Column:col]){
        [self.board slideTileAtRow:row Column:col];
        buttonFrame.origin.x = (col + 1) * buttonFrame.size.width;
        sender.frame = buttonFrame;
        [UIView animateWithDuration: 0.5 animations:^{sender.frame = buttonFrame;}];
    }
    [self arrangeBoardView];
}

-(void)arrangeBoardView {
    const CGRect boardBounds = self.boardView.bounds;
    const CGFloat tileWidth = boardBounds.size.width / 4;
    const CGFloat tileHeight = boardBounds.size.height / 4;
    for (int row = 0; row < 4; row++) {
        for (int col = 0; col < 4; col++) {
            const int tile = [self.board getTileAtRow:row Column:col];
            if (tile > 0) {
                UIButton *button = (UIButton *)[self.boardView viewWithTag:tile];
                button.frame = CGRectMake(col*tileWidth, row*tileWidth, tileWidth, tileHeight);
            }
        }
    }

}

-(IBAction)scrambleTiles:(id)sender{
    int NUM_SHUFFLES = 150;
    [self.board scramble:NUM_SHUFFLES];
    [self arrangeBoardView];
}

@end
