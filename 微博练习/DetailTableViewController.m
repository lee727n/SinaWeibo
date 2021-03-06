//
//  DetailTableViewController.m
//  微博练习
//
//  Created by tarena on 2017/2/22.
//  Copyright © 2017年 tarena. All rights reserved.
//
#import "CommentCell.h"
#import "Comment.h"
#import "DetailTableViewController.h"
#import "WeiboView.h"
#import "WebUtils.h"
@interface DetailTableViewController ()
@property (nonatomic, strong)NSArray *comments;
@end

@implementation DetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情";
    WeiboView *wv = [[WeiboView alloc]initWithFrame:CGRectMake(0, 0, kSW, [self.weibo weiboHeight])];
    
    wv.weibo = self.weibo;
    
    self.tableView.tableHeaderView = wv;
    
    
  
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CommentCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"评论" style:UIBarButtonItemStyleDone target:self action:@selector(commentAction)];

    [self loadComments];
}

- (void)loadComments{
    [WebUtils requestCommentsWithWID:self.weibo.idstr andCompletion:^(id obj) {
        self.comments = obj;
        [self.tableView reloadData];
    }];
}

- (void)commentAction {
    
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入评论的内容" preferredStyle:UIAlertControllerStyleAlert];
    [ac addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
       textField.placeholder = @"说点儿什么。。。";
    }];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *info = ac.textFields[0].text;
        
        [WebUtils sendCommentWithText:info andWid:self.weibo.idstr andCompletion:^(id obj) {
           
            
            UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"提示" message:@"评论完成！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //重新加载评论列表
                
                [self loadComments];
            }];
            
            [ac addAction:action1];
            [self presentViewController:ac animated:YES completion:nil];
            
            
            
        }];
        
        
    }];
    [ac addAction:action1];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [ac addAction:action2];
    [self presentViewController:ac animated:YES completion:nil];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.comments.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.comment = self.comments[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Comment *c = self.comments[indexPath.row];
    return 70+ [c commentHeight];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
