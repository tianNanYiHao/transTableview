//
//  ViewController.m
//  transTableview
//
//  Created by tianNanYiHao on 2017/3/27.
//  Copyright © 2017年 tianNanYiHao. All rights reserved.
//

#import "ViewController.h"
#import "HtmlViewController.h"
#import "TransferTableViewCell.h"
#import "TransferPayToolSelMode.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,TransferTableViewCellDelegate>
{
    UITableView *tbaleView;
    TransferTableViewCell *transFerCell;
    TransferPayToolSelMode *modelM;
    
    NSArray *titleArray;
    
    NSMutableArray *selectedArray;
    UIButton *selectBtn;
    
    CGFloat celldefulHeight;
    CGFloat cellallHeight;
    
}

@property (nonatomic,strong)NSMutableArray *selectedArray;
@property (nonatomic,strong)NSMutableArray *arr;
@end


@implementation ViewController
/**
 选中的对象数组
 */
- (NSMutableArray *)selectedArray{
    if (!_selectedArray) {
        _selectedArray = [NSMutableArray new];
    }return _selectedArray;
}

- (NSMutableArray *)arr{
    if (!_arr) {
        _arr = [NSMutableArray new];
    }return _arr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"Demo";
    titleArray = @[@"消费余额",@"消费余额",@"现金余额",@"现金余额",@"现金余额",@"现金余额",@"现金余额",@"现金余额"];
    NSArray *arrNum = @[@"1515****388",@"1515****388",@"1515****388",@"1515****388",@"1515****388",@"1515****388",@"1515****388",@"1515****388"];
    NSArray *arrOutPay = @[@"我的账户-消费余额",@"我的账户-消费余额",@"我的账户-现金余额",@"我的账户-现金余额",@"我的账户-现金余额",@"我的账户-现金余额",@"我的账户-现金余额",@"我的账户-现金余额",@"我的账户-现金余额",@"我的账户-现金余额"];
    NSArray *arrNumOut = @[@"可转账余额100元",@"可转账余额100元",@"可转账余额100元",@"可转账余额100元",@"可转账余额100元",@"可转账余额100元",@"1389****765",@"可转账余额100元"];
    
    
    for (int i = 0; i<titleArray.count; i++) {
        modelM = [[TransferPayToolSelMode alloc] init];
        modelM.inpayToolTitle = titleArray[i];
        modelM.inpaytTooldescribe = arrNum[i];
        modelM.outPayToolTitle = arrOutPay[i];
        modelM.outPayTooldescribe = arrNumOut[i];
        modelM.index = i+1;
        [self.arr addObject:modelM];
    }
    selectBtn = [[UIButton alloc] init];
    
    tbaleView = [[UITableView alloc] init];
    tbaleView.frame = [UIScreen mainScreen].bounds;
    tbaleView.delegate = self;
    tbaleView.dataSource = self;
    [self.view addSubview:tbaleView];
}

#pragma mark TransferPayToolCellDelegate
-(void)showRightImageView:(UIButton *)btn cellDefulHeight:(CGFloat)cellDefunHeight cellAllHeight:(CGFloat)cellAllHeight{
    
    cellallHeight = cellAllHeight;
    celldefulHeight = cellDefunHeight;
    
    //存储状态
    selectBtn = btn;
    
    if ([self.selectedArray containsObject:@(btn.tag)]) {
        [self.selectedArray removeObject:@(btn.tag)];
    }else{
        [self.selectedArray addObject:@(btn.tag)];
    }
    NSLog(@"%@",self.selectedArray);
    
    [tbaleView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return titleArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (selectBtn.selected && selectBtn.tag == indexPath.row+1){
        return cellallHeight
        ;
    }else if(celldefulHeight>0){
        return celldefulHeight;
    }else{
        return 84;  //初始状态cell高度
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    transFerCell = [TransferTableViewCell cellWithTableview:tableView];
    transFerCell.model = self.arr[indexPath.row];
    transFerCell.delegate = self;
    transFerCell.selectArr = self.selectedArray;
    
    return transFerCell;
}




@end
