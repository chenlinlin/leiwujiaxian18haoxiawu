//
//  AttractionsableViewController.m
//  乐无极限
//
//  Created by lanou3g on 16/4/19.
//  Copyright © 2016年 陈林林. All rights reserved.
//

#import "AttractionsableViewController.h"
#import "TourismModel.h"
#import "TourismCell.h"
#import "Header.h"
#import "DetailsViewController.h"
@interface AttractionsableViewController ()

@property(nonatomic,strong)NSMutableArray *array;
@end



@implementation AttractionsableViewController

-(NSMutableArray *)array{
    if (_array ==nil) {
        _array =[NSMutableArray array];
    }
    return _array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title =_nameString;
     [self.tableView registerNib:[UINib nibWithNibName:@"TourismCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self data];
}
-(void)data{
    NSURLSession *session =[NSURLSession sharedSession];
    //创建url
    NSString *urlstring =[NSString stringWithFormat:@"http://wx.fengjingkong.com:8080/tsp/sightWSAction!findAllSightByID.do?id=%@",_myID];
    
    NSURL *url =[NSURL URLWithString:urlstring];
    //通过URL初始化task 在block内处理数据
    NSURLSessionTask *task =[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        NSArray *arr =dic[@"sights"];
        for (NSDictionary *dicc in arr) {
            TourismModel *model =[[TourismModel alloc] init];
            [model setValuesForKeysWithDictionary:dicc];
            [self.array addObject:model];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            [self.tableView reloadData];
            
        });
    }];
    
    [task resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TourismCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    TourismModel *model=self.array[indexPath.row];
    if (model.sightLevel ==nil) {
        cell.nameLabel.text =[NSString stringWithFormat:@"%@",model.namec];
    }else{
       cell.nameLabel.text =[NSString stringWithFormat:@"%@(%@)",model.namec,model.sightLevel];
    }
   
    
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:model.pic] placeholderImage:Image];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailsViewController *detaVC =[[DetailsViewController alloc] init];
    TourismModel *model =self.array[indexPath.row];
    detaVC.nameString =model.namec;
    detaVC.myID =model.myId;
    [self.navigationController pushViewController:detaVC animated:YES];
    
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
