//
//  TourismTableViewController.m
//  乐无极限
//
//  Created by lanou3g on 16/4/18.
//  Copyright © 2016年 陈林林. All rights reserved.
//

#import "TourismTableViewController.h"
#import "TourismCell.h"
#import "Header.h"
#import "TourismModel.h"
#import "RegionTableViewController.h"
@interface TourismTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray *array;

@property(nonatomic,assign)CGFloat progressValue;
@property(nonatomic,strong)UITableView *tableView1;
@end

@implementation TourismTableViewController

-(NSMutableArray *)array{
    
    if (_array ==nil) {
        _array =[NSMutableArray array];
    }
    return _array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.tableView1 =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:(UITableViewStylePlain)];
    self.tableView1.delegate=self;
    self.tableView1.dataSource =self;
    
    [self.view addSubview:self.tableView1];
    [self.tableView1 registerNib:[UINib nibWithNibName:@"TourismCell" bundle:nil] forCellReuseIdentifier:@"cell"];

    //显示指示器
    
//    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
//    [SVProgressHUD show];
    [self data];
}


-(void)data{

    NSURLSession *session =[NSURLSession sharedSession];
    //创建url
    NSString *urlstring =@"http://wx.fengjingkong.com:8080/tsp/regionWSAction!findChildByID.do?regionId=001001";
    
    NSURL *url =[NSURL URLWithString:urlstring];
    //通过URL初始化task 在block内处理数据
    NSURLSessionTask *task =[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"加载数据失败");
             [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败!!"];
        }else{
        [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        //隐藏指示器
            
        NSArray *arr =dic[@"regions"];
        for (NSDictionary *dicc in arr) {
            TourismModel *model =[[TourismModel alloc] init];
      [model setValuesForKeysWithDictionary:dicc];
            [self.array addObject:model];
        }
        }
        //返回主线程
        dispatch_async(dispatch_get_main_queue(), ^{
         
            
            [self.tableView1 reloadData];
            
        });
    }];
    
    [task resume];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TourismCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    TourismModel *model=self.array[indexPath.row];
 cell.nameLabel.text =[NSString stringWithFormat:@"%@ ->共%ld个区域",model.namec,model.count];
    cell.menPiaoLabel.text =[NSString stringWithFormat:@"%ld家景点门票",model.sellSightCount];
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:model.pic] placeholderImage:Image];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    RegionTableViewController *regVC=[[RegionTableViewController alloc] init];
    TourismModel  *model=self.array[indexPath.row];
    regVC.myId =model.myId;
    regVC.nameString=model.namec;
    [self.navigationController pushViewController:regVC animated:YES];
}
@end
