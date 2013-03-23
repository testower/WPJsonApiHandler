//
//  WPJsonApiHandler.m
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

#import "WPJsonApiHandler.h"
#import "AFJSONRequestOperation.h"

@implementation WPJsonApiHandler

@synthesize delegate;
@synthesize site;

- (id)initWithSiteAsString:(NSString *)siteAsString
{
    self = [super init];
    if (self) {
        self.site = siteAsString;
    }
    return self;
}
- (id)initWithSiteAsString:(NSString *)siteAsString andDelegate:(id)someDelegate
{
    self = [self initWithSiteAsString:siteAsString];
    self.delegate = someDelegate;
    return self;
}

- (void)makeAPIRequestWithResource:(NSString *)resource
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://public-api.wordpress.com/rest/v1/sites/%@%@", self.site,resource]];
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:url
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:60.0];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:theRequest
                                                                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                                                            [self.delegate handler:self didSucceed:JSON];
                                                                                        }
                                                                                        failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                                                            NSLog(@"error: %@", error);
                                                                                            if ([self.delegate respondsToSelector:@selector(handler:didFail:)]) {
                                                                                                [self.delegate handler:self didFail:error];
                                                                                            }
                                                                                        }];
    [operation start];
}

#pragma mark -
#pragma mark API methods

- (void)getPostWithId:(NSString *)postId
{
    NSString *resource = [NSString stringWithFormat:@"/posts/%@", postId];
    [self makeAPIRequestWithResource:resource];
}

- (void)getPostWithSlug:(NSString *)slug
{
    NSString *resource = [NSString stringWithFormat:@"/posts/slug:%@", slug];
    [self makeAPIRequestWithResource:resource];
}
@end
