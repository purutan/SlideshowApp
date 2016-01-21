//
//  ViewController.m
//  SlideshowApp
//
//  Created by 藤田 優介 on 2016/01/17.
//  Copyright © 2016年 YusukeF Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSInteger countNumber;
    UIImageView *aImageView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    countNumber = 0;
    [self setupBackground];
    [self setupButton];

}

-(void)setupButton{
    UIButton *buttonNext = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonNext.frame = CGRectMake(0, 0, 70, 70);
    buttonNext.center = CGPointMake(270, 440);
    buttonNext.titleEdgeInsets = UIEdgeInsetsMake(75, 0, 0, 0);
    buttonNext.imageEdgeInsets = UIEdgeInsetsMake(-10, 40, 0, 0);

    [buttonNext setTitle:@"進む" forState:UIControlStateNormal];
    [buttonNext setTitleColor:[ UIColor blackColor ] forState:UIControlStateNormal ];
    [buttonNext setBackgroundImage:[UIImage imageNamed:@"buttonNext.png"] forState:UIControlStateNormal];


    [buttonNext addTarget:self action:@selector(showNext:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonNext];
    
    UIButton *buttonBack = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonBack.frame = CGRectMake(0, 0, 70, 70);
    buttonBack.center = CGPointMake(50, 440);
    buttonBack.titleEdgeInsets = UIEdgeInsetsMake(75, 0, 0, 0);
    buttonBack.imageEdgeInsets = UIEdgeInsetsMake(-10, 40, 0, 0);
    
    [buttonBack setTitle:@"戻る" forState:UIControlStateNormal];
    [buttonBack setTitleColor:[ UIColor blackColor ] forState:UIControlStateNormal ];
    [buttonBack setBackgroundImage:[UIImage imageNamed:@"buttonBack.png"] forState:UIControlStateNormal];
    [buttonBack addTarget:self action:@selector(showBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonBack];
    
}

-(void)showNext:(id)sender{
    if (countNumber== 4 ) {
        countNumber = 0;
    } else if (countNumber==3) {
        countNumber = -1;
    }

    countNumber++;
    //NSLog(@"CehckNo1は%ld",(long)countNumber);
    aImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"number_%ld.png",(long)countNumber]];

}

-(void)showBack:(id)sender{
    if (countNumber== 0 ) {
        countNumber = 4;
    } else if (countNumber== -1 ) {
        countNumber = 3;
    }
    countNumber --;
    //NSLog(@"CehckNo2は%ld",(long)countNumber);
    aImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"number_%ld.png",(long)countNumber]];

    
}


-(void)setupBackground {
    aImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    aImageView.image = [UIImage imageNamed:@"number_0.png"];
    [self.view addSubview:aImageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
