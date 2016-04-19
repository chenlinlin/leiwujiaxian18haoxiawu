//
//  FoodDetailsTableViewController.m
//  乐无极限
//
//  Created by lanou3g on 16/4/19.
//  Copyright © 2016年 陈林林. All rights reserved.
//

#import "FoodDetailsTableViewController.h"
#import "Header.h"
#import "FoodTableViewCell.h"
#import "PlayVeiw.h"
@interface FoodDetailsTableViewController ()
@property(nonatomic,strong)NSMutableArray *array;

@property(nonatomic,assign)NSInteger temp;
@property(nonatomic,strong)UIImageView *img;
@end

@implementation FoodDetailsTableViewController{
    PlayVeiw *avView;
}


-(void)data{
    _array =[NSMutableArray array];
    NSDictionary *dic =@{@"methodName":@"HomeSerial",@"page":@"1",@"serial_id":_model.ID,@"size":@"6",@"user_id":@"0",@"version":@"1.0"};
    NSLog(@"%@",dic);
    
    [[AFHTTPSessionManager manager] POST:@"http://api.izhangchu.com/" parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
     
        NSArray *arr =responseObject[@"data"][@"data"];
        
        for (NSDictionary *dicc in arr) {
            FoodModel *model =[[FoodModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dicc];
       
            [self.array addObject:model];
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer endRefreshing];
            [self.tableView reloadData];
            
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
     [self.tableView registerNib:[UINib nibWithNibName:@"FoodTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    //上刷新
    self.tableView .mj_header =[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNew)];
    //进入刷新状态
    [self.tableView.mj_header beginRefreshing];
    //下加载
    self.tableView .mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(abc)];
    
}
-(void)loadNew{
    [self data];

}
-(void)abc{
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    FoodModel *model =self.array[indexPath.row];

    [cell.img sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:Image];
    cell.nameLabel1.text =model.title;
    cell.nameLabel2.text =model.desc;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 240;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FoodModel *model =self.array[indexPath.row];
    [avView stop];
    [avView removeFromSuperview];
    avView = [[PlayVeiw alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 300) url:model.video];
    _img =[[UIImageView alloc] initWithFrame:avView.frame];
    [_img sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:Image];
    [avView play];
    [self.view addSubview:avView];
    UIButton *but =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    but.frame =CGRectMake(ScreenWidth-50, 30, 40, 40);
    [but setTitle:@"关闭" forState:(UIControlStateNormal)];
    
    [but addTarget:self action:@selector(tuichuBut) forControlEvents:UIControlEventTouchUpInside];
    [avView addSubview:but];
    
}
-(void)tuichuBut{
    //简单的动画效果
    [self.view addSubview:self.img];
    [avView removeFromSuperview];
    [UIView animateWithDuration:1.0 animations:^{
        _img.frame= CGRectMake(ScreenWidth/2, 0, 0, 0);
        [avView stop];
    } completion:^(BOOL finished) {
    }];
    
    
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
