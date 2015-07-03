//
//  RootViewController.m
//  下拉放大
//
//  Created by DJLee on 15-6-30.
//  Copyright (c) 2015年 yamon. All rights reserved.
//

#import "RootViewController.h"
const CGFloat TopViewH = 350;
@interface RootViewController ()
@property (nonatomic,weak) UIImageView *topView;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(TopViewH *0.5, 0, 0, 0);
    UIImageView *topView= [[UIImageView alloc]init];
    topView.image = [UIImage imageNamed:@"biaoqingdi"];
    topView.contentMode = UIViewContentModeScaleAspectFill;
    topView.frame = CGRectMake(0, -TopViewH, 320, TopViewH);
    [self.tableView insertSubview:topView atIndex:0];
    NSArray *arr = self.tableView.subviews;
    NSLog(@"%d",self.tableView.subviews.count);
    self.topView = topView;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    return cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%f",scrollView.contentOffset.y);
    CGFloat down = -(TopViewH * 0.5) -scrollView.contentOffset.y;
    if(down <= 0)return;
    
    CGRect frame = self.topView.frame;
    frame.size.height = TopViewH + down;
    self.topView.frame = frame;
}
@end
