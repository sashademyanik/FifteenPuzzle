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
    //[self arrangeBoardView];
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
    }
}
-(IBAction)scrambleTiles:(id)sender{
    
}

@end
