//
//  MyCarInfoViewController.m
//  CarHoldAccount
//
//  Created by app08 on 12. 7. 20..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "MyCarInfoViewController.h"
#import "CarHoldAccountViewController.h"

@interface MyCarInfoViewController ()

@end

@implementation MyCarInfoViewController
@synthesize continuedRatio, oilAverage, oilinPrice, averagePrice, averageOilvalume, distance, m_continueRatio, m_oilinPrice, m_distance, m_averagePrice, m_averageOilvalume;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];	
/*    
    CarHoldAccountViewController *carHoldAccountViewController = [[CarHoldAccountViewController alloc] initWithNibName:@"CarHoldAccountViewController" bundle:nil];
    [self.navigationController presentModalViewController:carHoldAccountViewController animated:YES];
*/    
    NSLog(@"VALUE = %@", m_continueRatio);
    
    continuedRatio.text = m_continueRatio;
    oilinPrice.text = m_oilinPrice;
    distance.text = m_distance;
    averagePrice.text = m_averagePrice;
    averageOilvalume.text = m_averageOilvalume;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
