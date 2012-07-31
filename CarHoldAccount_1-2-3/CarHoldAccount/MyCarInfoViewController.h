//
//  MyCarInfoViewController.h
//  CarHoldAccount
//
//  Created by app08 on 12. 7. 20..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCarInfoViewController : UIViewController
{
    UILabel  *continuedRatio;
    UILabel  *oilinPrice;
    UILabel  *distance;
    UILabel  *averagePrice;
    UILabel  *oilAverage;
    UILabel  *averageOilvalume;
    
    NSString *m_continueRatio;
    NSString *m_oilinPrice;
    NSString *m_distance;
    NSString *m_averagePrice;
    NSString *m_averageOilvalume;
}

@property(strong, nonatomic) IBOutlet UILabel  *continuedRatio;
@property(strong, nonatomic) IBOutlet UILabel  *oilinPrice;
@property(strong, nonatomic) IBOutlet UILabel  *distance;
@property(strong, nonatomic) IBOutlet UILabel  *averagePrice;
@property(strong, nonatomic) IBOutlet UILabel  *oilAverage;
@property(strong, nonatomic) IBOutlet UILabel  *averageOilvalume;

@property(strong, nonatomic) NSString *m_continueRatio;
@property(strong, nonatomic) NSString *m_oilinPrice;
@property(strong, nonatomic) NSString *m_distance;
@property(strong, nonatomic) NSString *m_averagePrice;
@property(strong, nonatomic) NSString *m_averageOilvalume;

@end
