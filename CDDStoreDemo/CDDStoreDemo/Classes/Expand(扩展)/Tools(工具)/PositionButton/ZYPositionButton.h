

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ZYPButtonStyle){
    ZYPButtonImageLeft = 0,   //图片在左
    ZYPButtonImageRight = 1,  //图片在右
    ZYPButtonImageTop = 2,    //图片在上
    ZYPButtonImageBottom = 3, //图片在下
};

@interface ZYPositionButton : UIButton

/**
 图片的位置，上、下、左、右，默认是图片居左
 */
@property (nonatomic, assign) ZYPButtonStyle buttonStyle;

/**
 文字与图片之间的间距，默认是0
 */
@property (nonatomic, assign) CGFloat padding;

/**
 创建button

 @param buttonType button的类型
 @param space 图片距离button的边距，如果图片比较大的，此时有效果；
              如果图片比较小，没有效果，默认居中；
 @return button
 */
+ (id)buttonWithType:(UIButtonType)buttonType withSpace:(CGFloat)space;

@end
