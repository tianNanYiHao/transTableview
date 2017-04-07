//
//  TransferTableViewCell.m
//  transTableview
//
//  Created by tianNanYiHao on 2017/3/27.
//  Copyright © 2017年 tianNanYiHao. All rights reserved.
//

#import "TransferTableViewCell.h"
#import "TransferPayToolSelMode.h"
#define payToolTitleColor [UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:1]
#define describeColor [UIColor colorWithRed:133/255.0 green:133/255.0 blue:133/255.0 alpha:1]

#define viewSzieW [UIScreen mainScreen].bounds.size.width


@interface TransferTableViewCell(){
    
    CGFloat leftSpace;
    CGFloat topSpace;
    CGFloat selectImageTopSpace;
    CGFloat titleSize;
    CGFloat describeSize;
    CGFloat lineH ;
    CGFloat commitW;
    CGFloat spaceToHeadImageView;
    
    CGFloat celldefulHeight;
    CGFloat cellAllHeight;

    //UI
    UIImageView *otherHeadImageVIew;
    UILabel *inpayToolTitleLab;
    UILabel *inpayDescribtLab;
    UIButton *btnner;
    
    UIView *halfBgview; //下半部分view
    
    UIImageView *ownHeadImageVIew;
    UILabel *outpayToolTitleLab;
    UILabel *outpayDescribtLab;
    
    UIImageView *leftImageView;
    
    
    
    
    
}@end


@implementation TransferTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableview:(UITableView*)tableView{
    static NSString*str = @"str";
    // 缓存中取
    TransferTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    //创建
    if (!cell) {
        cell = [[TransferTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        topSpace = 20;
        leftSpace = 15;
        titleSize = 13;
        describeSize = 11;
        lineH = 1;
        selectImageTopSpace = 36;
        spaceToHeadImageView = 22.5;
        commitW = viewSzieW - 2*leftSpace;
        
        [self createUI];
    }
    return self;
}



-(void)createUI{
    
    
    
    //1 inpay
    //icon
    UIImage *headImageOther = [UIImage imageNamed:@"select_account_otherphoto"];
    otherHeadImageVIew = [[UIImageView alloc] initWithImage:headImageOther];
    otherHeadImageVIew.layer.masksToBounds = YES;
    otherHeadImageVIew.layer.cornerRadius = headImageOther.size.height/2;
    [self.contentView addSubview:otherHeadImageVIew];
    
    
    //payToolTitle
    inpayToolTitleLab = [[UILabel alloc] init];
    inpayToolTitleLab.textColor = payToolTitleColor;
    inpayToolTitleLab.font = [UIFont systemFontOfSize:titleSize];
    [self.contentView addSubview:inpayToolTitleLab];
    
    
    //describtLab
    inpayDescribtLab = [[UILabel alloc] init];
    inpayDescribtLab.textColor = describeColor;
    inpayDescribtLab.font = [UIFont systemFontOfSize:describeSize];
    [self.contentView addSubview:inpayDescribtLab];
    
    //leftImage
    UIImage *leftImage = [UIImage imageNamed:@"select_account_default"];
    leftImageView = [[UIImageView alloc] initWithImage:leftImage];
    [self.contentView addSubview:leftImageView];
    
    //coverBtn
    btnner = [[UIButton alloc] init];
    [btnner addTarget:self action:@selector(clickSelect:) forControlEvents:UIControlEventTouchUpInside];
    [btnner setImage:nil forState:UIControlStateNormal];
    [self.contentView addSubview:btnner];
    
    
    halfBgview = [[UIView alloc] init];
    halfBgview.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:halfBgview];
    
    //虚线
    UIView *pointlineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, commitW+leftSpace, lineH)];
    pointlineView.backgroundColor = [UIColor whiteColor];
    [self drawLineOfDashByCAShapeLayer:pointlineView lineLength:6 lineSpacing:2 lineColor:[UIColor colorWithRed:235/255.0f green:235/255.0f blue:235/255.0f alpha:1]];
    [halfBgview addSubview:pointlineView];

    
    //2 outpay
    UIImage *headImageOwn = [UIImage imageNamed:@"select_account_myphoto"];
    ownHeadImageVIew = [[UIImageView alloc] initWithImage:headImageOwn];
    ownHeadImageVIew.layer.masksToBounds = YES;
    ownHeadImageVIew.layer.cornerRadius = headImageOwn.size.height/2;
    [halfBgview addSubview:ownHeadImageVIew];
    
    
    outpayToolTitleLab = [[UILabel alloc] init];
    outpayToolTitleLab.textColor = payToolTitleColor;
    outpayToolTitleLab.font = [UIFont systemFontOfSize:titleSize];
    [halfBgview addSubview:outpayToolTitleLab];

    outpayDescribtLab = [[UILabel alloc] init];
    outpayDescribtLab.textColor = describeColor;
    outpayDescribtLab.font = [UIFont systemFontOfSize:describeSize];
    [halfBgview addSubview:outpayDescribtLab];
    
    
    
    
    
    
    
    //设置frame
    //1默认部分
    CGFloat labW = commitW - spaceToHeadImageView - headImageOther.size.width - leftImage.size.width;
    otherHeadImageVIew.frame = CGRectMake(leftSpace, topSpace, headImageOther.size.width, headImageOther.size.height);
    inpayToolTitleLab.frame = CGRectMake(headImageOther.size.width+spaceToHeadImageView, topSpace, labW, topSpace);
    inpayDescribtLab.frame = CGRectMake(headImageOther.size.width+spaceToHeadImageView, CGRectGetMaxY(inpayToolTitleLab.frame)+topSpace/4, labW, topSpace);
    leftImageView.frame = CGRectMake(CGRectGetMaxX(inpayToolTitleLab.frame), selectImageTopSpace, leftImage.size.width, leftImage.size.height);
    btnner.frame = CGRectMake(0, 0, viewSzieW, self.bounds.size.height*2);
    
    //默认高度
    CGFloat defulHeight = headImageOther.size.height + 2*topSpace;
    celldefulHeight = defulHeight;
    
    //2.下半部分
    CGFloat halfHeight = headImageOwn.size.height + 2*topSpace;
    CGFloat lab2W = commitW - spaceToHeadImageView - headImageOther.size.width - headImageOwn.size.width;
    CGFloat ownHeadImageViewX = viewSzieW - headImageOwn.size.width - leftSpace;
    halfBgview.frame = CGRectMake(0, defulHeight, viewSzieW, halfHeight);
    pointlineView.frame = CGRectMake(inpayToolTitleLab.frame.origin.x, 0, viewSzieW-inpayToolTitleLab.frame.origin.x, lineH);
    ownHeadImageVIew.frame = CGRectMake(ownHeadImageViewX, topSpace, headImageOwn.size.width, headImageOwn.size.height);
    outpayToolTitleLab.frame = CGRectMake(inpayToolTitleLab.frame.origin.x,topSpace, lab2W, topSpace);
    outpayDescribtLab.frame = CGRectMake(inpayToolTitleLab.frame.origin.x, CGRectGetMaxY(outpayToolTitleLab.frame)+topSpace/4, lab2W, topSpace);
    
    //总高度
    CGFloat cellHeight = defulHeight + halfHeight;
    cellAllHeight = cellHeight;
    
    
    
    
    
}

#pragma clickBtn
-(void)clickSelect:(UIButton*)btn{
    
    if ([_delegate respondsToSelector:@selector(showRightImageView:cellDefulHeight:cellAllHeight:)]) {
        [_delegate showRightImageView:btn cellDefulHeight:celldefulHeight cellAllHeight:cellAllHeight];
    }
    
}



#pragma mark -setter

-(void)setModel:(TransferPayToolSelMode *)model{
    _model = model;
    
    btnner.tag = model.index;
    
    //inpay
    inpayToolTitleLab.text = model.inpayToolTitle;
    inpayDescribtLab.text = model.inpaytTooldescribe;
    
    //outpay
    outpayToolTitleLab.text = model.outPayToolTitle;
    outpayDescribtLab.text = model.outPayTooldescribe;
    
    
    
}

-(void)setSelectArr:(NSMutableArray *)selectArr{
    _selectArr = selectArr;
    
    if (_selectArr.count == 0) {
        leftImageView.hidden = YES;
        halfBgview.hidden = YES;
        
        btnner.selected = NO;
        btnner.userInteractionEnabled = YES;
    }
    for (int i = 0; i<_selectArr.count; i++) {
        if (btnner.tag == [_selectArr[i] integerValue]) {
            leftImageView.hidden = NO;
            halfBgview.hidden = NO;
            
            btnner.selected = YES;
            btnner.userInteractionEnabled = YES;
        }else{
            leftImageView.hidden = YES;
            halfBgview.hidden = YES;
            
            btnner.selected = NO;
            btnner.userInteractionEnabled = NO;
        }
    }
    
}

/**
 *  通过 CAShapeLayer 方式绘制虚线
 *
 *  param lineView:       需要绘制成虚线的view
 *  param lineLength:     虚线的宽度
 *  param lineSpacing:    虚线的间距
 *  param lineColor:      虚线的颜色
 **/
- (void)drawLineOfDashByCAShapeLayer:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL,CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

@end
