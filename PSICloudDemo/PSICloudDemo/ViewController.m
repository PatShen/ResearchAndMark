//
//  ViewController.m
//  PSICloudDemo
//
//  Created by Wenxin Shen on 2018/9/13.
//  Copyright © 2018年 NanJing HOGE Software Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController () <UIDocumentPickerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *txtvContent;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSFileManager* fm = [NSFileManager defaultManager];
    NSURL* url = [fm URLForUbiquityContainerIdentifier:nil];
    if (url == nil) {
        NSLog(@"iCloud服务不可用");
    }
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self showiCloudDrive];
//    });
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setFrame:CGRectMake(20, 20, 100, 80)];
    [btn setTitle:@"Import" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showiCloudDrive) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    NSString *myString = @"ABCDEFG";
    const char *utfString = [myString UTF8String];
    NSRange range = {2, 4};
    NSData *data1, *data2;
    
    data1 = [NSData dataWithBytes:utfString length:strlen(utfString)];
    
    data2 = [data1 subdataWithRange:range];
    
    NSLog(@"---\n%@",[[NSString alloc] initWithData:data1 encoding:NSUTF8StringEncoding]);
    NSLog(@"---\n%@",[[NSString alloc] initWithData:data2 encoding:NSUTF8StringEncoding]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showiCloudDrive {
    NSArray* types = @[@"org.openxmlformats.wordprocessingml.document",@"com.microsoft.word.doc"];//@[@"application/msword",@"application/vnd.openxmlformats-officedocument.wordprocessingml.document"];
    UIDocumentPickerViewController *documentPicker = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:types inMode:UIDocumentPickerModeImport];
    documentPicker.delegate = self;
    if (@available(iOS 11.0,*)) {
        documentPicker.allowsMultipleSelection = YES;
    }
//    documentPicker.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:documentPicker animated:YES completion:nil];
}

// MARK: - UIDocumentPickerDelegate
- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentAtURL:(NSURL *)url {
    if (url) {
        
    }
}

- (void)documentPickerWasCancelled:(UIDocumentPickerViewController *)controller {
    
}

- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentsAtURLs:(NSArray<NSURL *> *)urls {
    if (controller.documentPickerMode == UIDocumentPickerModeImport) {
        if ([urls count] > 0) {
            NSURL* url = urls[0];
            if (url) {
                
            }
//            NSString* path = url.absoluteString;
//            CFStringRef pathExtension = (__bridge_retained CFStringRef)[path pathExtension];
//            CFStringRef type = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, pathExtension, NULL);
//            CFRelease(pathExtension);
//
//            // The UTI can be converted to a mime type:
//
//            NSString *mimeType = (__bridge_transfer NSString *)UTTypeCopyPreferredTagWithClass(type, kUTTagClassMIMEType);
//            if (type != NULL)
//                CFRelease(type);
//
//            NSLog(@"%@",mimeType);
            
//            NSData* data = [NSData dataWithContentsOfURL:url];
//            NSString* name = [url lastPathComponent];
//            if ([name hasSuffix:@"doc"]) {
//                NSString* tmp = NSTemporaryDirectory();
//                NSString* savedPath = [tmp stringByAppendingPathComponent:name];
//                [data writeToFile:savedPath atomically:YES];
//                data = [NSData dataWithContentsOfFile:savedPath];
//
//                UInt32 fcMin;
//                [data getBytes:&fcMin range:NSMakeRange(536, sizeof(UInt32))];
//                UInt32 ccpText;
//                [data getBytes:&ccpText range:NSMakeRange(588, sizeof(UInt32))];
//
//                NSRange range = NSMakeRange(fcMin + 512, ccpText);
//                NSData *textData = [data subdataWithRange:range];
//
//                NSError* attrError = nil;
//                NSDictionary* options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
//
//                NSMutableAttributedString* str = [[NSMutableAttributedString alloc] initWithData:textData options:options documentAttributes:nil error:&attrError];
//                [_txtvContent setAttributedText:str];
            
//                NSString *textContent = [[NSString alloc] initWithData:textData encoding:NSUTF16LittleEndianStringEncoding];
//                [_txtvContent setText:textContent];
            }
            
//            NSError* attrError = nil;
//            NSDictionary* options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
//
//            NSMutableAttributedString* str = [[NSMutableAttributedString alloc] initWithData:data options:options documentAttributes:nil error:&attrError];
//            [_txtvContent setAttributedText:str];
            
//            NSString* str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//            [_txtvContent setText:str];
//            NSString* docText = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//            if (docText) {
//
//            }
//        }
        
    }
}

@end
