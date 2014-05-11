//
//  ViewController.m
//  fontlist
//
//  Created by morimoto on 2014/05/11.
//  Copyright (c) 2014年 Jun Morimoto. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

#define MARGIN_X    8
#define MARGIN_Y    8
#define PADDING_Y   8

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString* sample_text = @"Howdy, World!";
    UIColor* limegreen = [UIColor colorWithRed:0.196 green:0.804 blue:0.196 alpha:1];
    UIColor* lawngreen = [UIColor colorWithRed:0.486 green:0.988 blue:0.000 alpha:1];
    int lasty=0;
    int n=0;

    self.sv.contentSize = self.view.frame.size;

    NSArray* fontfamilynames = [UIFont familyNames];
    for(int i=0; i<[fontfamilynames count]; i++){
        NSArray* fontnames = [UIFont fontNamesForFamilyName:[fontfamilynames objectAtIndex:i]];
        for(int j=0; j<[fontnames count]; j++){
            NSString* fontname = [fontnames objectAtIndex:j];
            UIColor* color = (n++)%2 ? limegreen : lawngreen;

            {
                UILabel* label = [[UILabel alloc] init];
                label.frame = CGRectMake(MARGIN_X, lasty, 320, 10);
                label.text = fontname;
                label.numberOfLines = 0;
                label.backgroundColor = color;
                [label sizeToFit];
                CGRect rect = CGRectMake(label.frame.origin.x, label.frame.origin.y, self.view.frame.size.width-(MARGIN_X*2), label.frame.size.height);
                [label setFrame:rect];
                [self.sv addSubview:label];
                lasty += label.frame.size.height;
            }

            {
                UILabel* label = [[UILabel alloc] init];
                label.frame = CGRectMake(MARGIN_X, lasty, 320, 10);
                label.text = sample_text;
                label.numberOfLines = 0;
                label.font = [UIFont fontWithName:fontname size:24];
                label.backgroundColor = color;
                [label sizeToFit];
                CGRect rect = CGRectMake(label.frame.origin.x, label.frame.origin.y, self.view.frame.size.width-(MARGIN_X*2), label.frame.size.height);
                [label setFrame:rect];
                [self.sv addSubview:label];
                lasty += label.frame.size.height;
            }
        }

        lasty += PADDING_Y;
    }

    [self.sv setContentSize:CGSizeMake(self.view.frame.size.width, lasty+(PADDING_Y*2))];
}

@end
