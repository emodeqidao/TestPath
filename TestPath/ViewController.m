//
//  ViewController.m
//  TestPath
//
//  Created by xixi on 16/4/20.
//  Copyright © 2016年 xixi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *btn  = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 30, 100, 30);
    [btn setTitle:@"go" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(goAction) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    
    UIButton *errorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    errorBtn.frame = CGRectMake(150, 30, 100, 30);
    [errorBtn setTitle:@"error" forState:UIControlStateNormal];
    [errorBtn addTarget:self action:@selector(goError) forControlEvents:UIControlEventTouchUpInside];
    errorBtn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:errorBtn];
    
    NSArray *colors = @[
                        [UIColor purpleColor],
                        [UIColor orangeColor],
                        [UIColor cyanColor],
                        [UIColor redColor],
                        [UIColor greenColor],
                        [UIColor blueColor],
                        [UIColor yellowColor]
                        ];
    progressView = [[ZQKTip alloc] initWithFrame:CGRectMake(0, 0, 50, 50) andLineWidth:1.0 andLineColor:colors];
    progressView.center = self.view.center;
    [progressView show];
    [self.view addSubview:progressView];
    
    
    progressViewError = [[ZQKTip alloc] initWithFrame:CGRectMake(130, 200, 50, 50) andLineWidth:1.0 andLineColor:colors];
    [progressViewError show];
    [self.view addSubview:progressViewError];

}

-(void) goAction
{
    [progressView setYes];
}

-(void) goError
{
    [progressViewError setError];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
