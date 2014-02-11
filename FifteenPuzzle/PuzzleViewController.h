//
//  PuzzleViewController.h
//  FifteenPuzzle
//
//  Created by Alexander Paul Demyanik on 1/31/14.
//  Copyright (c) 2014 WSUV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FifteenPuzzle.h"

@interface PuzzleViewController : UIViewController
@property(strong, nonatomic) FifteenPuzzle *board;
@property (weak, nonatomic) IBOutlet UIView *boardView;
-(IBAction)tileSelected:(UIButton*)sender;
-(IBAction)scrambleTiles:(id)sender;
@end
