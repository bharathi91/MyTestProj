//
//  ViewController.m
//  swipedemo
//
//  Created by BharathiKumar on 26/04/16.
//  Copyright © 2016 bharathi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableDictionary *dictData;
}
@property (weak, nonatomic) IBOutlet UILabel *labelDesc;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dictData =[[NSMutableDictionary alloc]init];
    [self.scrollView setPagingEnabled:YES];
    
    self.scrollView.translatesAutoresizingMaskIntoConstraints=NO;
    NSDictionary *viewsDictionary = @{@"scrollView":self.scrollView};
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[scrollView]-0-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[scrollView]-0-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    // 3.B ...and try to change the visual format string
    //NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[redView]-30-|" options:0 metrics:nil views:viewsDictionary];
    //NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[redView]" options:0 metrics:nil views:viewsDictionary];
    
   // [self.view addConstraints:constraint_POS_H];
   // [self.view addConstraints:constraint_POS_V];
    [self createLayout];

    // Do any additional setup after loading the view from its nib.
}
-(void)createLayout
{
    int x=0;
    for (int i=0; i<5; i++)
    {
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSArray *views =[[NSBundle mainBundle] loadNibNamed:@"swipeView" owner:self options:nil];
        UIView *rootView = [[[NSBundle mainBundle] loadNibNamed:@"swipeView" owner:self options:nil] objectAtIndex:0];
        [rootView setFrame:CGRectMake(x,0 ,self.view.bounds.size.width,self.view.bounds.size.height)];
     self.labelDesc.text=[NSString stringWithFormat:@"Page %d",i];
        rootView.translatesAutoresizingMaskIntoConstraints=NO;
        [self.scrollView addSubview:rootView];
        rootView.layer.borderColor=[UIColor redColor].CGColor;
        rootView.layer.borderWidth=1.0f;
        x=x+self.view.bounds.size.width;
       NSDictionary *viewsDictionary = @{@"rootView":rootView};
       // rootView.backgroundColor=[UIColor redColor];
        NSInteger aRedValue = arc4random()%255;
        NSInteger aGreenValue = arc4random()%255;
        NSInteger aBlueValue = arc4random()%255;
        
        rootView.backgroundColor = [UIColor colorWithRed:aRedValue/255.0f green:aGreenValue/255.0f blue:aBlueValue/255.0f alpha:1.0f];
        NSArray *constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[rootView(100)]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
        
        NSArray *constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[rootView(100)]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
        //[rootView addConstraints:constraint_H];
       // [rootView addConstraints:constraint_V];
        
        // 3. Define the redView Position
        //NSDictionary *metrics = @{@"vSpacing":x, @"hSpacing":@10};
     //   NSDictionary *metrics1=[NSDictionary dictionaryWithObjectsAndKeys:@"vSpacing",x, nil];
        NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[rootView]-0-|"
                                                                            options:0
                                                                            metrics:nil
                                                                              views:viewsDictionary];
        
        NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[rootView]-0-|"
                                                                            options:0
                                                                            metrics:nil
                                                                              views:viewsDictionary];
        
        // 3.B ...and try to change the visual format string
        //NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[redView]-30-|" options:0 metrics:nil views:viewsDictionary];
        //NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[redView]" options:0 metrics:nil views:viewsDictionary];
        
      //  [self.scrollView addConstraints:constraint_POS_H];
      //  [self.scrollView addConstraints:constraint_POS_V];

    }
    [self.scrollView setContentSize:CGSizeMake(x, self.view.frame.size.height)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
