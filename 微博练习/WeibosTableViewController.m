//
//  WeibosTableViewController.m
//  微博练习
//
//  Created by tarena on 2017/2/21.
//  Copyright © 2017年 tarena. All rights reserved.
//
#import "DetailTableViewController.h"
#import "Weibo.h"
#import "WebUtils.h"
#import "WeibosTableViewController.h"
#import "WeiboCell.h"
#import "UIImageView+AFNetworking.h"
@interface WeibosTableViewController ()
@property (nonatomic, strong)NSArray *weibos;
@end

@implementation WeibosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [WebUtils requestHomeWeibosWithCompletion:^(id obj) {
        self.weibos = obj;
        [self.tableView reloadData];
    }];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"WeiboCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
}


#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 
    return self.weibos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.weibo = self.weibos[indexPath.row];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Weibo *w = self.weibos[indexPath.row];
    
    
    return [w weiboHeight]+100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Weibo *w = self.weibos[indexPath.row];
    
    DetailTableViewController *vc = [DetailTableViewController new];
    vc.weibo = w;
    [self.navigationController pushViewController:vc animated:YES];
    
    
}



@end
