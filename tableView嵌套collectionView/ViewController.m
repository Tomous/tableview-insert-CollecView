//
//  ViewController.m
//  tableView嵌套collectionView
//
//  Created by wenhua on 2018/3/1.
//  Copyright © 2018年 wenhua. All rights reserved.
//

#import "ViewController.h"

#import "TableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,testTableViewCellDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)TableViewCell *toolCell;
@property(nonatomic,strong)NSArray *dataArr;
@property(nonatomic,strong)NSMutableDictionary *dicH;


//@property(nonatomic,strong)UILabel *numLabel;
//@property(nonatomic,strong)CADisplayLink *displayLink;
//@property(nonatomic,assign)NSTimeInterval lastTime;
//@property(nonatomic,assign)NSInteger   count;
@end
@implementation ViewController

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


-(NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = @[
                     @[@"g"],
                     @[@"g",@"b"],
                     @[@"g",@"b",@"a"],
                     @[@"g",@"b",@"c",@"e"],
                     @[@"g",@"b",@"c",@"e",@"a"],
                     @[@"g",@"b",@"c",@"e",@"b",@"c"],
                     @[@"g",@"b",@"c",@"e",@"b",@"c",@"a"],
                     @[@"g",@"b",@"c",@"e",@"b",@"c",@"b",@"c"],
                     @[@"g",@"b",@"c",@"e",@"b",@"c",@"e",@"d",@"g"],
                     @[@"g",@"b",@"c",@"e",@"b",@"c",@"e",@"d",@"a",@"c"],
                     ];
        
    }
    return _dataArr;
}

#pragma mark 保存cell高度
- (NSMutableDictionary *)dicH {
    if(_dicH == nil) {
        _dicH = [[NSMutableDictionary alloc] init];
    }
    return _dicH;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.lable.text = [NSString stringWithFormat:@"  标题:%ld",indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.deleget = self;
    cell.indexPath = indexPath;
    cell.dataArr = self.dataArr[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dicH[indexPath]) {
        NSNumber *num = self.dicH[indexPath];
        return [num floatValue]+60;
    }else{
        return 80;
    }
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"=======");
}
-(void)uodataTableViewCellHight:(TableViewCell *)cell andHight:(CGFloat)hight andIndexPath:(NSIndexPath *)indexPath{
    
    if (![self.dicH[indexPath] isEqualToNumber: @(hight)]) {
        self.dicH[indexPath] = @(hight);
        NSLog(@"indexPath.row = %ld",indexPath.row);
        NSLog(@"高度 = %lf",[@(hight) floatValue]);
        [self.tableView reloadData];
    }
    
}

#pragma mark 下面是检测流畅度
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
//    [self setupUI];
//    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayAction:)];
//    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
}

//-(void)dealloc
//{
//    [_displayLink removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
//    _displayLink = nil;
//}
//
//-(void)setupUI
//{
//    _numLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
//    _numLabel.text = @"60";
//    _numLabel.textColor = [UIColor greenColor];
//    _numLabel.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:_numLabel];
//}
//
//-(void)displayAction:(id)sender
//{
//    if (_lastTime == 0) {
//        _lastTime = _displayLink.timestamp;
//        return;
//    }
//
//    _count++;
//    NSTimeInterval delta = _displayLink.timestamp - _lastTime;
//    if (delta < 1) return;
//    _lastTime = _displayLink.timestamp;
//    float fps = _count / delta;
//    _count = 0;
//
//    NSString *text = [[NSString alloc] initWithString:[NSString stringWithFormat:@"%d FPS", (int)round(fps)]];
//    _numLabel.text = text;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

