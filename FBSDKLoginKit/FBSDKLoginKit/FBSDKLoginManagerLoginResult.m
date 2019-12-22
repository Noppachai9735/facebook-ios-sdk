// Copyright (c) 2014-present, Facebook, Inc. All rights reserved.
//
// You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
// copy, modify, and distribute this software in source code or binary form for use
// in connection with the web services and APIs provided by Facebook.
//
// As with any software that integrates with the Facebook platform, your use of
// this software is subject to the Facebook Developer Principles and Policies
// [http://developers.facebook.com/policy/]. This copyright notice shall be
// included in all copies or substantial portions of the software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "TargetConditionals.h"

#if TARGET_OS_IOS || TARGET_OS_MACCATALYST

#import "FBSDKLoginManagerLoginResult+Internal.h"

#ifdef FBSDKCOCOAPODS
#import <FBSDKCoreKit/FBSDKCoreKit+Internal.h>
#else
#import "FBSDKCoreKit+Internal.h"
#endif

@implementation FBSDKLoginManagerLoginResult {
  NSMutableDictionary *_mutableLoggingExtras;
}

- (instancetype)initWithToken:(FBSDKAccessToken *)token
                  isCancelled:(BOOL)isCancelled
           grantedPermissions:(NSSet *)grantedPermissions
          declinedPermissions:(NSSet *)declinedPermissions {
  if ((self = [super init])) {
    _mutableLoggingExtras = [NSMutableDictionary dictionary];
    _token = token ? [token copy] : nil;
    _isCancelled = isCancelled;
    _grantedPermissions = [grantedPermissions copy];
    _declinedPermissions = [declinedPermissions copy];
  };
  return self;
}

- (void)addLoggingExtra:(id)object forKey:(id<NSCopying>)key
{
  [FBSDKBasicUtility dictionary:_mutableLoggingExtras setObject:object forKey:key];
}

- (NSDictionary *)loggingExtras
{
  return [_mutableLoggingExtras copy];
}

@end

#endif
