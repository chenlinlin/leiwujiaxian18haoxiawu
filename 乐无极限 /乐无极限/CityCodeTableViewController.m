//
//  CityCodeTableViewController.m
//  YiYuanWeather
//
//  Created by lanou3g on 16/1/24.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "CityCodeTableViewController.h"
//#import "GDataXMLNode.h"

//#import "TFHpple.h"
#import "AllCityModel.h"
@interface CityCodeTableViewController ()
@property(nonatomic, strong)NSMutableDictionary *datDict;
@property(nonatomic, strong)NSMutableArray *arr;

@property(nonatomic, strong)NSMutableDictionary *dic;
@property(nonatomic, strong)NSMutableArray *array;
@end

@implementation CityCodeTableViewController






-(NSDictionary *)analyCityNameData{
    
    NSString *httpUrl = @"http://apis.baidu.com/baidunuomi/openapi/cities";
    NSString *httpArg = @"";
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", httpUrl, httpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue: @"5a721bd393dbffe3e7383832e3dc2004" forHTTPHeaderField: @"apikey"];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    _dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    return _dic;
   
}

-(void)parserData{
    
    
    _array = [[NSMutableArray alloc] init];
    for (NSMutableDictionary *dic1 in _dic[@"cities"]) {
        
        
        AllCityModel *cityM = [[AllCityModel alloc] init];
        
        [cityM setValuesForKeysWithDictionary:dic1];
        [_array addObject:cityM];
        
    }
    
    for (AllCityModel *mm in _array) {
        
    }
    
}








- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"全国城市列表";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"iconfont-cuohao.png"] style:UIBarButtonItemStyleDone target:self action:@selector(cancel:)];
    [self analyCityNameData];
    [self parserData];
    //
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reCellOfcityname"];
    
    //索引字体颜色
    self.tableView.sectionIndexColor = [UIColor grayColor];
    //字体背景颜色
    self.tableView.sectionIndexBackgroundColor = [UIColor brownColor];
    //索引条点击颜色
    self.tableView.sectionIndexTrackingBackgroundColor = [UIColor greenColor];

    
}

-(void)cancel:(UIBarButtonItem *)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reCellOfcityname" forIndexPath:indexPath];
    
    AllCityModel *MM = [[AllCityModel alloc] init];
    MM = _array[indexPath.row];
    cell.textLabel.text = MM.city_name;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AllCityModel *mm = _array[indexPath.row];
    
    NSString *city = mm.city_name;
    NSLog(@"%@",mm.city_name);
    self.blockCity(city);
    
    [self.navigationController popViewControllerAnimated:YES];
}


//快速索引
-(nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    //    return @[@"A",@"B",@"C"];
    NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:26];
    for (int i = 0; i < 26; i ++) {
        char c = 65+i;
        [muArray addObject:[NSString stringWithFormat:@"%c",c]];
    }
    return muArray;
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
