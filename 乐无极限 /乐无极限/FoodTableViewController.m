//
//  FoodTableViewController.m
//  乐无极限
//
//  Created by lanou3g on 16/4/19.
//  Copyright © 2016年 陈林林. All rights reserved.
//

#import "FoodTableViewController.h"
#import "Header.h"
#import "FoodModel.h"
#import "FoodCollectionViewCell.h"
#import "WYScrollView.h"
#import "FoodDetailsTableViewController.h"

@interface FoodTableViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,WYScrollViewLocalDelegate,WYScrollViewNetDelegate>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *array;
/**
 *滚动列表数据源
 */
@property(nonatomic,strong)NSMutableArray *carouselArray;
//

@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation FoodTableViewController
/**
 *滚动列表数据源懒加载
 */
-(NSMutableArray *)carouselArray{
    if (_carouselArray ==nil) {
        _carouselArray =@[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg"].mutableCopy;
    }
    return _carouselArray;
}
-(NSMutableArray *)array{
    if (_array ==nil) {
        _array =[NSMutableArray array];
    }
    return _array;
}
-(NSMutableArray *)dataArray{
    if (_dataArray ==nil) {
        _dataArray =[NSMutableArray array];
    }
    return _dataArray;
}
-(void)data{
    NSDictionary *dic =@{@"methodName":@"HomeIndex",@"user_id":@"0",@"versi":@"1.0"};
    NSLog(@"%@",dic);
    
    [[AFHTTPSessionManager manager] POST:@"http://api.izhangchu.com/" parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
      
        NSArray *arr =responseObject[@"data"][@"category"][@"data"];
        
        for (NSDictionary *dicc in arr) {
            FoodModel *model =[[FoodModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dicc];
            NSLog(@"%@",model.image);
            [self.array addObject:model];
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];

        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self data];
    [self view1];

}
-(void)view1{
    self.view.backgroundColor =[UIColor whiteColor];
    UIView *view6 =[[UIView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, 1)];
    [self.view addSubview:view6];
    /** 设置本地scrollView的Frame及所需图片*/
    WYScrollView *WYLocalScrollView = [[WYScrollView alloc]initWithFrame:CGRectMake(0, 64,ScreenWidth, 200) WithLocalImages:self.carouselArray];
    
    /** 设置滚动延时*/
    WYLocalScrollView.AutoScrollDelay = 2;
    
    /** 获取本地图片的index*/
    WYLocalScrollView.localDelagate = self;
    
    /** 添加到当前View上*/
    [self.view addSubview:WYLocalScrollView];
    
    
    //创建flowlayout
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc] init];
    //设置行间距
    layout.minimumLineSpacing =10;
    //设置列间距
    layout.minimumInteritemSpacing =10;
    //设置item大小
    layout.itemSize =CGSizeMake(self.view.frame.size.width/3-18, self.view.frame.size.width/3-18);
    layout.scrollDirection =UICollectionViewScrollDirectionVertical;
    //设置分区间距
    layout.sectionInset =UIEdgeInsetsMake(10, 10, 10, 10);
    _collectionView =[[UICollectionView alloc] initWithFrame:CGRectMake(0, ScreenHeight/2-100, ScreenWidth, ScreenHeight-150) collectionViewLayout:layout];
    _collectionView.backgroundColor =[UIColor clearColor];
    _collectionView.delegate =self;
    _collectionView.dataSource =self;
  
    [_collectionView registerNib:[UINib nibWithNibName:@"FoodCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:_collectionView];
}

/** 获取本地图片的index*/
-(void)didSelectedLocalImageAtIndex:(NSInteger)index
{
    NSLog(@"点中本地图片的下标是:%ld",(long)index);
}


//代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.array.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FoodCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    FoodModel *model =self.array [indexPath.item];
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:Image];
    cell.nameLabel.text =model.text;
    
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.item);
    FoodDetailsTableViewController *foodVC =[[FoodDetailsTableViewController alloc] init];
    FoodModel *model =self.array[indexPath.item];
    foodVC.model =model;
    [self.navigationController pushViewController:foodVC animated:YES];
    
    
    
    
}

@end
