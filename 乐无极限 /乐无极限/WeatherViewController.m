//
//  WeatherViewController.m
//  乐无极限
//
//  Created by lanou3g on 16/4/18.
//  Copyright © 2016年 陈林林. All rights reserved.
//

#import "WeatherViewController.h"
#import "CityModel.h"
#import "WeatherView.h"
#import "Header.h"
#import "AllCityModel.h"
#import "CityCodeTableViewController.h"
@interface WeatherViewController ()
@property(nonatomic,strong)UIView *vie11;
@property(nonatomic, assign)NSInteger responseCode;
@property(nonatomic,strong)CityModel *cityM;
@property(nonatomic, strong)NSString *responseString;
@property(nonatomic, strong)NSDictionary *dic;
@property(nonatomic, strong)NSString *strUTF8;
@property(nonatomic,strong)WeatherView *wView;

@property(nonatomic,strong)UIButton *but;

@property(nonatomic,strong)UITableView *tabelView1;
@end

@implementation WeatherViewController

-(void)viewWillAppear:(BOOL)animated{
    self.wView.dView.image =[UIImage imageNamed:@"tu"];
    
    [self tianqi];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.wView =[[WeatherView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.wView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"iconfont-shezhichilun.png"] style:UIBarButtonItemStyleDone target:self action:@selector(jump:)];
   
    
}
-(void)jump:(id)sender{
    CityCodeTableViewController *cicoVC = [[CityCodeTableViewController alloc] init];
    
    __weak typeof(self)temp = self;
    cicoVC.blockCity = ^(NSString *string){
        
        temp.strUTF8 = string;
        
    };
    
  
    
    
    [self.navigationController pushViewController:cicoVC animated:YES];
}
-(void)tianqi{
    NSString *httpUrl = @"http://apis.baidu.com/showapi_open_bus/weather_showapi/address";
    if (_strUTF8 == nil) {
        _strUTF8 = @"北京";
    }
    
    NSString *httpArg = [_strUTF8 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    httpArg = [NSString stringWithFormat:@"%@%@%@",@"area=",httpArg,@"&needMoreDay=0&needIndex=0&needAlarm=0&need3HourForcast=0"];
    [self request: httpUrl withHttpArg: httpArg];//
    
    
}



-(void)request: (NSString*)httpUrl withHttpArg: (NSString*)HttpArg  {
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", httpUrl, HttpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue: @"51880bccb95f575979f8696de6bdecee" forHTTPHeaderField: @"apikey"];
    [NSURLConnection sendAsynchronousRequest: request queue: [NSOperationQueue mainQueue]
                           completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
                               
                               if (error) {
                                   NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
                               } else {
                                   _responseCode = [(NSHTTPURLResponse *)response statusCode];
                                   _responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                   
                                   NSData *jsonData = [_responseString dataUsingEncoding:NSUTF8StringEncoding];
                                   NSError *err;
                                   _dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                          options:NSJSONReadingMutableContainers
                                                                            error:&err][@"showapi_res_body"];
                                   
                                   [_dic writeToFile:@"/Users/lanou3g/Desktop/pppp/nee.plist" atomically:YES];
                                   
                                   
                                   _cityM = [[CityModel alloc]init];
                                   [_cityM setValuesForKeysWithDictionary:_dic];
                                   
                                   
                                   [_cityM setValuesForKeysWithDictionary:_cityM.cityInfo];
                                   [_cityM setValuesForKeysWithDictionary:_cityM.f1];
                                   [_cityM setValuesForKeysWithDictionary:_cityM.f2];
                                   [_cityM setValuesForKeysWithDictionary:_cityM.now];

                               }
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   
                                   [self parserData];
                                   
                               });
                               
                               
                           }];
    
    
}
-(void)parserData{
 
    if ([_cityM.now[@"weather"] isEqualToString:@"阴"]) {
        self.wView.dView.image =[UIImage imageNamed:@"tu"];
    }else if ([_cityM.now[@"weather"] isEqualToString:@"晴"]){
        self.wView.dView.image =[UIImage imageNamed:@"qing"];

    }
    
    self.wView.cityIdLabel.text = _cityM.cityInfo[@"c1"];
    self.wView.cityLabel.text = _cityM.cityInfo[@"c3"];
    NSMutableString *String1 = [[NSMutableString alloc] initWithString:_cityM.f1[@"day"]];
    [String1 insertString:@" " atIndex:4];
    [String1 insertString:@" " atIndex:7];
    self.wView.dateLabel.text =String1;
    self.wView.temperaLabel.text = [NSString stringWithFormat:@"当前气温:  %@ ℃",_cityM.now[@"temperature"]];
    self.wView.weatherTypeLabel.text = _cityM.now[@"weather"];
    [self.wView.picView sd_setImageWithURL:[NSURL URLWithString: _cityM.now[@"weather_pic"]]];
    self.wView.daytemperaLabel.text = [NSString stringWithFormat:@"%@ ℃", _cityM.f1[@"day_air_temperature"]];
    self.wView.nighttemperaLabel.text = [NSString stringWithFormat:@"%@ ℃",_cityM.f1[@"night_air_temperature"]];
    self.wView.RecentlyLabel.text =[NSString stringWithFormat:@"实时 %@",_cityM.now[@"temperature_time"]];
    self.wView.fengLabel.text =[NSString stringWithFormat:@"%@:%@",_cityM.now[@"wind_direction"],_cityM.now[@"wind_power"]];
    self.wView.zhiliangLabel.text = _cityM.now[@"aqiDetail"][@"quality"];
}

-(void)viewWillDisappear:(BOOL)animated{
    
    NSLog(@"222");
    self.hidesBottomBarWhenPushed=NO;

    
}




@end
