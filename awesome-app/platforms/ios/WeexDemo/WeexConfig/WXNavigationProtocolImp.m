//
//  WXNavigationProtocolImp.m
//  WeexEros
//
//  Created by yangzhi on 2018/8/9.
//  Copyright © 2018年 benmu. All rights reserved.
//

#import "WXNavigationProtocolImp.h"

@implementation WXNavigationProtocolImp

/**
 * @abstract Returns the navigation controller.
 *
 * @param container The target controller.
 */
- (id)navigationControllerOfContainer:(UIViewController *)container {
    return container.navigationController;
}

/**
 * @abstract Sets the navigation bar hidden.
 *
 * @param hidden If YES, the navigation bar is hidden.
 *
 * @param animated Specify YES to animate the transition or NO if you do not want the transition to be animated.
 *
 * @param container The navigation controller.
 *
 */
- (void)setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated
                 withContainer:(UIViewController *)container {
    
}

/**
 * @abstract Sets the background color of navigation bar.
 *
 * @param backgroundColor The background color of navigation bar.
 *
 * @param container The target controller.
 *
 */
- (void)setNavigationBackgroundColor:(UIColor *)backgroundColor
                       withContainer:(UIViewController *)container {
    
}

/**
 * @abstract Sets the item in navigation bar.
 *
 * @param param The data which is passed to the implementation of the protocol.
 *
 * @param position The value indicates the position of item.
 *
 * @param block A block called once the action is completed.
 *
 * @param container The target controller.
 *
 */
- (void)setNavigationItemWithParam:(NSDictionary *)param
                          position:(WXNavigationItemPosition)position
                        completion:(WXNavigationResultBlock)block
                     withContainer:(UIViewController *)container {
    container.title = param[@"title"];
}

/**
 * @abstract Clears the item in navigation bar.
 *
 * @param param The data which is passed to the implementation of the protocol.
 *
 * @param position The value indicates the position of item.
 *
 * @param block A block called once the action is completed.
 *
 * @param container The target controller.
 *
 */
- (void)clearNavigationItemWithParam:(NSDictionary *)param
                            position:(WXNavigationItemPosition)position
                          completion:(WXNavigationResultBlock)block
                       withContainer:(UIViewController *)container {
    
}

/**
 * @abstract Pushes a view controller onto the receiver’s stack.
 *
 * @param param The data which is passed to the implementation of the protocol.
 *
 * @param block A block called once the action is completed.
 *
 * @param container The target controller.
 *
 */
- (void)pushViewControllerWithParam:(NSDictionary *)param
                         completion:(WXNavigationResultBlock)block
                      withContainer:(UIViewController *)container {
    
}

/**
 * @abstract Pops the top view controller from the navigation stack.
 *
 * @param param The data which is passed to the implementation of the protocol.
 *
 * @param block A block called once the action is completed.
 *
 * @param container The target controller.
 *
 */
- (void)popViewControllerWithParam:(NSDictionary *)param
                        completion:(WXNavigationResultBlock)block
                     withContainer:(UIViewController *)container {
    
}

@end
