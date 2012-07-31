//
//  CarHoldAccountViewController.m
//  CarHoldAccount
//
//  Created by  on 12. 7. 17..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "CarHoldAccountViewController.h"
#import "MyCarInfoViewController.h"

@interface CarHoldAccountViewController ()

@end

@implementation CarHoldAccountViewController

@synthesize oilPrice, moveKm, oilvolume, textLabel, scrollView, m_kmperl, m_kmdangOilPrice, m_juhangKm, m_averageJuuPrice, m_averageVolume;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)dealloc
{
    [scrollView release];
    [super dealloc];
}

- (void) viewWillApper:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KeyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification object:self.view.window];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KeyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification object:nil];
    
    [super viewWillAppear:animated];
}

- (void) textFieldDidBeginEditing:(UITextField *) textFieldView
{
    currentTextField = textFieldView;
}

- (BOOL) textFieldShouldReturn:(UITextField *) textFieldView
{
    [textFieldView resignFirstResponder];
    return NO;
}

- (void) textFieldDidEndEditing:(UITextField *) textFieldView
{
    currentTextField = nil;
}

- (void) KeyboardDidShow:(NSNotification *) notification
{
    if(keyboardIsShown) return;
    
    NSDictionary* info = [notification userInfo];
    
    NSValue *aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [self.view convertRect:[aValue CGRectValue] fromView:nil];
    NSLog(@"%f", keyboardRect.size.height);
    CGRect viewFrame = [scrollView frame];
    viewFrame.size.height -= keyboardRect.size.height;
    scrollView.frame = viewFrame;
    
    CGRect textFieldRect = [currentTextField frame];
    [scrollView scrollRectToVisible:textFieldRect animated:YES];
    
    keyboardIsShown = YES;
}

- (void) keyboardDidHide:(NSNotification *) notification
{
    NSDictionary* info = [notification userInfo];
    NSValue* aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [self.view convertRect:[aValue CGRectValue] fromView:nil];
    CGRect viewFrame = [scrollView frame];
    viewFrame.size.height += keyboardRect.size.height;
    scrollView.frame = viewFrame;
    
    keyboardIsShown = NO;
}

- (void) viewWillDisappear:(BOOL)animated 
{  
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    [super viewWillDisappear:animated]; 
}


- (void)viewDidLoad
{
    scrollView.frame =  CGRectMake(0, 0, 320, 460);
    [scrollView setContentSize:CGSizeMake(320, 1020)];

    int year, month, day, hour, minute = 0;

	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy"];
    year = [[dateFormatter stringFromDate:[NSDate date]] intValue];
    [dateFormatter setDateFormat:@"MM"];
    month = [[dateFormatter stringFromDate:[NSDate date]] intValue];
    [dateFormatter setDateFormat:@"dd"];
    day = [[dateFormatter stringFromDate:[NSDate date]] intValue];
    [dateFormatter setDateFormat:@"HH"];
    hour = [[dateFormatter stringFromDate:[NSDate date]] intValue];
    [dateFormatter setDateFormat:@"mm"];
    minute = [[dateFormatter stringFromDate:[NSDate date]] intValue];
     
    NSString *string = [[NSString alloc] initWithFormat:@"%d년%d월%d일%d시%d분", year, month, day, hour, minute];
    
    textLabel.text = string;
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.oilPrice = nil;
    self.moveKm = nil;
    self.oilvolume = nil;
    self.textLabel = nil;
    // Release any retained subviews of the main view.
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)SaveButton:(id)sender
{
    int nOilPrice, nMoveKm, nOilVolume = 0;
    NSString *string = nil;
    int kmperl, kmdangOilPrice, juhangKm, averageJuuPrice, averageVolume = 0;
    
    nOilPrice = [oilPrice.text intValue];
    nMoveKm = [moveKm.text intValue];
    nOilVolume = [oilvolume.text intValue]; 
    string = textLabel.text;
    
    
    m_DBMOVEKM = 100;
    
    if( m_DBMOVEKM != 0 )
    {
        if( nMoveKm > m_DBMOVEKM )
        {
            kmperl = (nMoveKm - m_DBMOVEKM) / nOilVolume;    // 연비
        }
        else 
        {
            kmperl = 0;
        }
    }
    
    if( kmperl == 0 )
    {
        kmdangOilPrice = 0;
    }
    else 
    {
        kmdangOilPrice = 1900 / kmperl;                    // km당 주유비 
    }
    
    if( nMoveKm < m_DBMOVEKM )
    {
        juhangKm = 0;
    }
    else 
    {
        juhangKm = nMoveKm - m_DBMOVEKM;                     // 주행거리
    }
    
    m_DBCOUNT = 1;
    m_DBJUPLUS = 30000;
    
    if( m_DBCOUNT != 0)
    {
        averageJuuPrice = m_DBJUPLUS / m_DBCOUNT;        // 평균주유금액
    }
    else 
    {
        averageJuuPrice = nOilPrice;
    }
    
    averageVolume = averageJuuPrice / 1900;            // 평균주유리터
    
    NSString *resultString = [[NSString alloc] initWithFormat:@"%d", kmperl];
    m_kmperl = resultString;
    
    NSString *resultString1 = [[NSString alloc] initWithFormat:@"%d", kmdangOilPrice];
    m_kmdangOilPrice = resultString1;
    
    NSString *resultString2 = [[NSString alloc] initWithFormat:@"%d", juhangKm];
    m_juhangKm = resultString2;
    
    NSString *resultString3 = [[NSString alloc] initWithFormat:@"%d", averageJuuPrice];
    m_averageJuuPrice = resultString3;
    
    NSString *resultString4 = [[NSString alloc] initWithFormat:@"%d", averageVolume];
    m_averageVolume = resultString4;
}

    

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MyCarInfoViewController *mycar = [segue destinationViewController];
    
    NSLog(@"%@", [mycar description]);
    
    mycar.m_continueRatio = m_kmperl;
    mycar.m_oilinPrice = m_kmdangOilPrice;
    mycar.m_distance = m_juhangKm;
    mycar.m_averagePrice = m_averageJuuPrice;
    mycar.m_averageOilvalume = m_averageVolume;
}


@end




