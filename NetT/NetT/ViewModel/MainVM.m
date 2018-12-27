//
//  MainVM.m
//  NetT
//
//  Created by 綦帅鹏 on 2018/11/8.
//  Copyright © 2018年 綦帅鹏. All rights reserved.
//

#import "MainVM.h"
//#import <openssl/rsa.h>
//#import <openssl/pem.h>

#define RSA_Prefix @"!!0001"
#define Severs_Public_Key  @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC7T+CHj/1NZTZz+L3eX2j+8pPpIuK3ISA6E/uzQDCOqBBG6y+hoUdSMhAi/S129HOSP47bbybik2nlOvQjMC82D4tCs8KzKsudRAS8xyoTXfdOLW0CeBqx9vNWSrbQs4xhxxZHJ909kNv8S+3PyKY4GAq6H3rd9iAlXanvnqtgmQIDAQAB"

@interface MainVM ()

@property (nonatomic, copy, readonly) NSDictionary *hDic;

@end


@implementation MainVM
@synthesize title = _title;
@synthesize tableViewVM = _tableViewVM;
@synthesize hDic = _hDic;

- (NSDictionary *)hDic {
    if (_hDic == nil) {
        _hDic = @{
                  @"CInf" : @[
                          @(100),
                          @(2)
                          ],
                  @"PKGID" : @(6201),
                  @"Env" : @[
                          @"id",
                          @"ID"
                          ],
                  @"IID" : @"zk6rlxfqmnoqe6h1uwao",
                  @"TZ" : @(8),
                  @"SID" : @"HmhzjVpcNvPgN3NZbiIwBovc79KnkiB83Njyg0gXb7mprw5f6w",
                  @"TID" : @"1078341c6213317a5b1cb4b089583900",
                  @"Ver" : @"1.0.0"
                  };
    }
    
    return _hDic;
}

- (NSString *)title {
    if (_title == nil) {
        _title = @"接口";
    }
    
    return _title;
}
- (QSPTableViewVM *)tableViewVM {
    if (_tableViewVM == nil) {
        _tableViewVM = [QSPTableViewVM create:^(QSPTableViewVM *vm) {
            vm.addQSPSectionVMCreate(^(QSPTableViewSectionVM *sectionVM){
                sectionVM.addRowVMCreate(CommonTableViewCellVM.class, ^(CommonTableViewCellVM *cellVM){
                    cellVM.dataMCreate(MainCellM.class, ^(MainCellM *mainCellM){
                        mainCellM.typeSet(QSPNetworkingTypeJSONPOST).paramarySet(@{
                                                @"H": self.hDic,
                                                @"B" : @{
                                                        @"Version" : @(0)
                                                        }
                                                }).titleSet(@"查询国家区域编码").detailSet(@"country?_debug");
                    });
                });
                
                sectionVM.addRowVMCreate(CommonTableViewCellVM.class, ^(CommonTableViewCellVM *cellVM){
                    cellVM.dataMCreate(MainCellM.class, ^(MainCellM *mainCellM){
                        mainCellM.typeSet(QSPNetworkingTypeJSONPOST).paramarySet(@{
                                                @"H": self.hDic,
                                                @"B" : @{
                                                        @"Login" : @{
                                                                    @"LName" : @"8613161663589",
                                                                    @"Type" : @"LP",
//                                                                    @"Pwd" : [self RSAEncryptWithSource:@"QSP456654"],
                                                                    }
                                                        }
                                                }).titleSet(@"登录").detailSet(@"u/login?_debug");
                    });
                });
                
                sectionVM.addRowVMCreate(CommonTableViewCellVM.class, ^(CommonTableViewCellVM *cellVM){
                    cellVM.dataMCreate(MainCellM.class, ^(MainCellM *mainCellM){
                        mainCellM.typeSet(QSPNetworkingTypeGET).paramarySet(@{
                                                @"P": @"1,2",
                                                @"PKGID" : @(6201)
                                                }).titleSet(@"焦点接口").detailSet(@"banner/info");
                    });
                });
                
                sectionVM.addRowVMCreate(CommonTableViewCellVM.class, ^(CommonTableViewCellVM *cellVM){
                    cellVM.dataMCreate(MainCellM.class, ^(MainCellM *mainCellM){
                        mainCellM.typeSet(QSPNetworkingTypeJSONPOST).paramarySet(@{
                                                                                   @"H": self.hDic,
                                                                                   @"B" : @{}
                                                                                   }).titleSet(@"用户概要信息").detailSet(@"a/v1/profile?_debug");
                    });
                });
            });
        }];
    }
    
    return _tableViewVM;
}

- (void)xxx {
    
}
///**
// RSA编码
//
// @param source 编码源
// @return 编码结果
// */
//- (NSString *)RSAEncryptWithSource:(NSString *)source {
//    //格式化公钥
//    NSMutableString *publicKey = [NSMutableString string];
//    [publicKey appendString:@"-----BEGIN PUBLIC KEY-----\n"];
//    int count = 0;
//    for (int i = 0; i < [Severs_Public_Key length]; ++i)
//    {
//        unichar c = [Severs_Public_Key characterAtIndex:i];
//        if (c == '\n' || c == '\r') {
//            continue;
//        }
//        [publicKey appendFormat:@"%c", c];
//        if (++count == 64) {
//            [publicKey appendString:@"\n"];
//            count = 0;
//        }
//    }
//    [publicKey appendString:@"\n-----END PUBLIC KEY-----"];
//
//    const char *buffer = [publicKey UTF8String];
//    BIO *bpubkey = BIO_new_mem_buf((void *)buffer, (int)strlen(buffer));
//    RSA *rsaPublic = PEM_read_bio_RSA_PUBKEY(bpubkey, NULL, NULL, NULL);
//    BIO_free_all(bpubkey);
//
//    // 转为data
//    NSData *sourceData = [source dataUsingEncoding:NSUTF8StringEncoding];
//    // 加密
//    NSData *desData = [self encryptWithPublicKey:rsaPublic plainData:sourceData padding:RSA_PKCS1_PADDING];
//
//    NSString *desStr = [desData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
//
//    return [RSA_Prefix stringByAppendingString:desStr];
//}
//- (NSData *)encryptWithPublicKey:(RSA *)publicKey
//                       plainData:(NSData *)plainData
//                         padding:(int)padding
//{
//    int paddingSize = 0;
//    if (padding == RSA_PKCS1_PADDING) {
//        paddingSize = RSA_PKCS1_PADDING_SIZE;
//    }
//
//    int publicRSALength = RSA_size(publicKey);
//    double totalLength = [plainData length];
//    int blockSize = publicRSALength - paddingSize;
//    int blockCount = ceil(totalLength / blockSize);
//    size_t publicEncryptSize = publicRSALength;
//    NSMutableData *encryptDate = [NSMutableData data];
//    for (int i = 0; i < blockCount; i++) {
//        NSUInteger loc = i * blockSize;
//        int dataSegmentRealSize = MIN(blockSize, totalLength-loc);
//        NSRange range = NSMakeRange(loc, dataSegmentRealSize);
//        NSData *dataSegment = [plainData subdataWithRange:range];
//        char *publicEncrypt = malloc(publicRSALength);
//        memset(publicEncrypt, 0, publicRSALength);
//        const unsigned char *str = [dataSegment bytes];
//        int r = RSA_public_encrypt(dataSegmentRealSize,str,
//                                   (unsigned char*)publicEncrypt,
//                                   publicKey,padding);
//        if (r < 0) {
//            free(publicEncrypt);
//            return nil;
//        }
//        NSData *encryptData = [[NSData alloc] initWithBytes:publicEncrypt
//                                                     length:publicEncryptSize];
//        [encryptDate appendData:encryptData];
//        free(publicEncrypt);
//    }
//    return encryptDate;
//}

@end
