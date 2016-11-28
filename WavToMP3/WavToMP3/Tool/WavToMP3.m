//
//  WavToMP3.m
//  WavToMP3
//
//  Created by wangli on 2016/11/28.
//  Copyright © 2016年 wangli. All rights reserved.
//

#import "WavToMP3.h"
#import "lame.h"
@implementation WavToMP3
+ (BOOL)wavToMP3WithwavPath:(NSString *)wavPath mp3Path:(NSString *)mp3Path{
//    NSString *mp3FilePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"record.mp3"];
    
    //   _recordUrl = [NSTemporaryDirectory() stringByAppendingString:@"record.caf"];  _recordUrl是音频存储路径
    
    @try {
        
        int read, write;
        FILE *pcm = fopen([wavPath cStringUsingEncoding:1], "rb");  //source 被转换的音频文件位置
        
        fseek(pcm, 4*1024, SEEK_CUR);                                   //skip file header
        
        FILE *mp3 = fopen([mp3Path cStringUsingEncoding:1], "wb");  //output 输出生成的Mp3文件位置
        const int PCM_SIZE = 8192;
        
        const int MP3_SIZE = 8192;
        
        short int pcm_buffer[PCM_SIZE*2];
        
        unsigned char mp3_buffer[MP3_SIZE];
        lame_t lame = lame_init();
        
        lame_set_in_samplerate(lame, 11025.0);
        
        lame_set_VBR(lame, vbr_default);
        
        lame_init_params(lame);
        do {
            read = fread(pcm_buffer, 2*sizeof(short int), PCM_SIZE, pcm);
            if (read == 0)
                write = lame_encode_flush(lame, mp3_buffer, MP3_SIZE);
            else
                write = lame_encode_buffer_interleaved(lame, pcm_buffer, read, mp3_buffer, MP3_SIZE);
            fwrite(mp3_buffer, write, 1, mp3);
        } while (read != 0);
        lame_close(lame);
        fclose(mp3);
        fclose(pcm);
    }@catch (NSException *exception) {
        NSLog(@"%@",[exception description]);
        return NO;
    }@finally {
        
        return YES;
        
    }
    
}
@end
