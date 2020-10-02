//
//  OCPADataModel.m
//  ObjCParentApp
//
//  Created by Steven Troughton-Smith on 02/10/2020.
//

@import UIKit;

#import "OCPADataModel.h"
#import "OCPAItem.h"

@implementation OCPADataModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.items = @[];
        
        [self _generateSampleContent];
    }
    return self;
}

-(void)_generateSampleContent
{
    NSMutableArray *_mutableArray = [NSMutableArray new];
    
    for (int i = 0; i < 3; i++)
    {
        OCPAItem *item = [OCPAItem new];
        
        item.text = [NSString stringWithFormat:@"Item %i", i];
        item.image = [UIImage systemImageNamed:@"applescript.fill"];
        item.color = (i % 2 == 0) ? [UIColor redColor] : [UIColor greenColor];
        
        [_mutableArray addObject:item];
    }
    
    self.items = [NSArray arrayWithArray:_mutableArray];
}

@end
