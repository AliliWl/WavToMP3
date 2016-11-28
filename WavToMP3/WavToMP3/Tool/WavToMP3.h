//
//  WavToMP3.h
//  WavToMP3
//
//  Created by wangli on 2016/11/28.
//  Copyright © 2016年 wangli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WavToMP3 : NSObject
+ (BOOL)wavToMP3WithwavPath:(NSString *)wavPath mp3Path:(NSString *)mp3Path;
@end
