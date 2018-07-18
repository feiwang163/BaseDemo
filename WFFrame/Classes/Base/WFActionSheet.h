//
//  WFActionSheet.h
//  WFFrame
//
//  Created by 王飞 on 17/2/21.
//  Copyright © 2017年 chongqinjialetao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WFActionSheet;
@protocol WFActionSheetDelegate <NSObject>

- (void)wf_actionSheet:(WFActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface WFActionSheet : UIView

- (instancetype)initWithTitles:(NSArray *)titles delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle;
- (void)show;
@property (nonatomic, weak) id <WFActionSheetDelegate> delegate;

@end
