//
//  FourViewController.m
//  plan
//
//  Created by Fengzy on 15/12/19.
//  Copyright © 2015年 Fengzy. All rights reserved.
//

#import "PostsCell.h"
#import "SDCycleScrollView.h"
#import "FourViewController.h"

@interface FourViewController () <SDCycleScrollViewDelegate> {
    NSMutableArray *postsArray;
    NSArray *headerImagesURLArray;
    NSArray *headerTitlesArray;
}

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"小区";
    
    postsArray = [NSMutableArray array];
    headerImagesURLArray = @[@"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                             @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                             @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
                                  @"http://file.bmob.cn/M02/FB/EF/oYYBAFZwp3uAbaT3AAYWayl5rTc443.png",
                                  @"http://file.bmob.cn/M02/FB/EF/oYYBAFZwp3SAV2t-AASOgiiHmA4853.png",
                                  @"http://file.bmob.cn/M02/FB/F0/oYYBAFZwp4KAfkI-AAg3Y3SaXls642.png"
                                  ];

    headerTitlesArray = @[@"好‘计’友，一辈子",
                          @"标题二",
                          @"标题三",
                          @"感谢您的支持，如果下载的",
                        @"如果代码在使用过程中出现问题",
                        @"您可以发邮件到gsdios@126.com",
                        @"感谢您的支持"
                        ];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableHeaderView = [self createTableHeaderView];
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIView *)createTableHeaderView {
    CGFloat fullViewHeight = HEIGHT_FULL_VIEW;
    CGFloat headerViewHeight = fullViewHeight / 3;
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 320, WIDTH_FULL_SCREEN, headerViewHeight) imageURLStringsGroup:headerImagesURLArray];
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.delegate = self;
    cycleScrollView2.titlesGroup = headerTitlesArray;
    cycleScrollView2.dotColor = [UIColor whiteColor]; //自定义分页控件小圆标颜色
    cycleScrollView2.placeholderImage = [UIImage imageNamed:@"placeholder"];
    //--- 模拟加载延迟
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        cycleScrollView2.imageURLStringsGroup = headerImagesURLArray;
//    });
    return cycleScrollView2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 295.f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    static NSString *cellIdentifier = @"UITableViewCell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
//    }
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    cell.textLabel.font = K_Font_16;
//    cell.textLabel.height = 44;
//    cell.textLabel.text = [NSString stringWithFormat:@"%@   %@", card.carNumber, card.cardName];
    
    PostsCell *cell = [PostsCell cellView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    if (tableView == self.tableView) {
//        
//        return cardArray.count;
//        
//    } else if (tableView == searchDisplayController.searchResultsTableView) {
//        
//        return searchResultArray.count;
//    }
    
    return 3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    MemberDetailViewController *controller = [[MemberDetailViewController alloc] init];
//    controller.cardId = card.cardId;
//    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"---点击了第%ld张图片", index);
}

@end