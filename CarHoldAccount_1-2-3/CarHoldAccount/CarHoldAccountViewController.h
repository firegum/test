//
//  CarHoldAccountViewController.h
//  CarHoldAccount
//
//  Created by  on 12. 7. 17..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarHoldAccountViewController : UIViewController
{
    IBOutlet UIScrollView *scrollView;
    UITextField *currentTextField;
    BOOL keyboardIsShown;
    
    UILabel *textLabel;
    UITextField *oilPrice;
    UITextField *moveKm;
    UITextField *oilvolume;
    
    NSString *m_kmperl;
    NSString *m_kmdangOilPrice;
    NSString *m_juhangKm;
    NSString *m_averageJuuPrice;
    NSString *m_averageVolume;
    
    int m_DBMOVEKM;
    int m_DBCOUNT;
    int m_DBJUPLUS;
}

@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UILabel *textLabel;
@property (nonatomic, retain) IBOutlet UITextField *oilPrice;
@property (nonatomic, retain) IBOutlet UITextField *moveKm;
@property (nonatomic, retain) IBOutlet UITextField *oilvolume;

@property (nonatomic, retain) NSString *m_kmperl;
@property (nonatomic, retain) NSString *m_kmdangOilPrice;
@property (nonatomic, retain) NSString *m_juhangKm;
@property (nonatomic, retain) NSString *m_averageJuuPrice;
@property (nonatomic, retain) NSString *m_averageVolume;

- (IBAction)SaveButton:(id)sender;
- (IBAction)textFieldRetrun:(id)sender;    // 사용자가 백그라운드를 터치 하면 키보드를 감춘다.
- (IBAction)backgroundTouch:(id)sender;

@end
