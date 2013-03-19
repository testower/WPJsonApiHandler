//
//  WPJsonApiHandler.h
//  WPJsonApiHandler
//
// Copyright (C) 2013 Tom Erik Støwer <testower@gmail.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this
// software and associated documentation files (the "Software"), to deal in the Software
// without restriction, including without limitation the rights to use, copy, modify,
// merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to the following
// conditions:
// 
// The above copyright notice and this permission notice shall be included in all copies
// or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
// INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
// PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import <Foundation/Foundation.h>

@class WPJsonApiHandler;

@protocol WPJsonApiHandlerDelegate <NSObject>

@required
- (void)handler:(WPJsonApiHandler*)handler didSucceed:(id)json;

@optional
- (void)handler:(WPJsonApiHandler*)handler didFail:(NSError *)error;

@end

@interface WPJsonApiHandler : NSObject

@property (strong,nonatomic) id<WPJsonApiHandlerDelegate> delegate;
@property (strong,nonatomic) NSString *site;

#pragma mark init methods
- (id)initWithSiteAsString:(NSString *)site andDelegate:id;

#pragma mark -
#pragma mark API methods

- (void)getPostWithId:(NSString *)id;

@end