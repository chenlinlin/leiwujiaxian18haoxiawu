//
//  DiyiViewController.m
//  乐无极限
//
//  Created by lanou3g on 16/4/15.
//  Copyright © 2016年 陈林林. All rights reserved.
//

#import "FirstViewController.h"
#import "NewsCell.h"
#import "NewsModel.h"
#import "NewsViewController.h"
#import "Header.h"

@interface  FirstViewController()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UISegmentedControl *seg;
@property(nonatomic,strong)UITableView *tabelView1;
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,assign)int temp;
@end
@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self view1];
}
-(void)view1{
    
    self.tabelView1 =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-44) style:(UITableViewStylePlain)];
    [self.view addSubview:self.tabelView1];
    [self.tabelView1 registerClass:[NewsCell class] forCellReuseIdentifier:@"newscell"];
    self.tabelView1.delegate=self;
    self.tabelView1.dataSource =self;
    //上刷新
    self.tabelView1 .mj_header =[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNew)];
    //进入刷新状态
    [self.tabelView1.mj_header beginRefreshing];
    //下加载
    self.tabelView1 .mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(abc)];
}
-(void)loadNew{
    [self data];
}
-(void)abc{
    [self data22222];
    
    
}
-(void)data{
    
    self.array =[NSMutableArray array];
    
    
    NSURLSession *session =[NSURLSession sharedSession];
    //创建url
    NSString *urlstring =[NSString stringWithFormat:@"http://c.m.163.com/nc/article/list/T1348648517839/%d-20.html",self.temp];
    
    NSURL *url =[NSURL URLWithString:urlstring];
    //通过URL初始化task 在block内处理数据
    NSURLSessionTask *task =[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        
        NSArray *arr =dic[@"T1348648517839"];
        NSMutableArray *arrrrr =[NSMutableArray array];
        for (NSDictionary *dic1 in arr) {
            NewsModel *model =[[NewsModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dic1];
            
            if (model.url ==nil) {
                
            }else{
                [arrrrr addObject:dic1];
                
            }
            
        }
        NSArray *aaaaa =[NewsModel
                         mj_objectArrayWithKeyValuesArray:arrrrr];
        [self.array addObjectsFromArray:aaaaa];
        self.temp =0;
        
        //返回主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.tabelView1.mj_header endRefreshing];
            [self.tabelView1.mj_footer endRefreshing];
            
            [self.tabelView1 reloadData];
            
        });
    }];
    
    [task resume];
    
}
-(void)data22222{
    
    self.temp+=25;
    
    NSURLSession *session =[NSURLSession sharedSession];
    //创建url
    NSString *urlstring =[NSString stringWithFormat:@"http://c.m.163.com/nc/article/list/T1348648517839/%d-20.html",self.temp];
    
    NSURL *url =[NSURL URLWithString:urlstring];
    //通过URL初始化task 在block内处理数据
    NSURLSessionTask *task =[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        
        NSArray *arr =dic[@"T1348648517839"];
        NSMutableArray *arrrrr =[NSMutableArray array];
        for (NSDictionary *dic1 in arr) {
            NewsModel *model =[[NewsModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dic1];
            
            if (model.url ==nil) {
                
            }else{
                [arrrrr addObject:dic1];
                
            }
            
        }
        NSArray *aaaaa =[NewsModel mj_objectArrayWithKeyValuesArray:arrrrr];
        [self.array addObjectsFromArray:aaaaa];
        self.temp =0;
        
        //返回主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.tabelView1.mj_header endRefreshing];
            [self.tabelView1.mj_footer endRefreshing];
            
            [self.tabelView1 reloadData];
            
        });
    }];
    
    [task resume];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsCell *cell =[tableView dequeueReusableCellWithIdentifier:@"newscell"];
    //去掉分割线
    tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    //去掉选中时的颜色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NewsModel *model =self.array[indexPath.row];
    cell.titelLabel.text =model.title;
    cell.neirongLabel.text =model.ltitle;
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc] placeholderImage:Image];
    cell.shijianLabel.text =[NSString stringWithFormat:@"发布时间:%@",model.ptime];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 105;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsViewController *newsVC=[[NewsViewController alloc] init];
    newsVC.model =self.array[indexPath.row];
    
    [self.navigationController pushViewController:newsVC animated:YES];
}


@end
