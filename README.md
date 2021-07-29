### 前言
http请求基本上每一个app都会使用，基与AFNetworking进行好的封装提供是非常有必要的 （https://github.com/AFNetworking/AFNetworking）
 

### 封装的目的
- 封装基本的公共方法给外部调用。get请求,Post请求。发起上传请求，发起下载请求，简化代码。

### 使用
#### 依赖  AFNetworking 3.1.0
  pod 'YXHttpEncapsulation'
  
### 枚举
```objective-c
 typedef NS_OPTIONS(NSInteger, YXHttpType) {
    YXHttpTypeGet = 0,
    YXHttpTypePost
};

typedef NS_OPTIONS(NSInteger, YXCachePolicy) {
    /**
     *  不使用缓存
     */
    YXCachePolicyNoCache = 0,
    /**
     *  从缓存读取
     */
    YXCachePolicyForceCache = 1,
    /**
     *  先从缓存读取，再从网络请求读取，会回调两次
     */
    YXCachePolicyFirstCacheThenRequest = 2,
    
    YXCachePolicyUnknown
};
```
### YXHttpClientDataSource

```objective-c
/**
 *  用于设置自定义http请求头，每条请求都会调用一次
 *
 *  @param aClient YXHttpClient实例
 *  @param anUrl   请求url
 *
 *  @return 包含请求头的NSDictionary
 */
- (NSDictionary *)httpClient:(YXHttpClient *)aClient customHeaderForUrl:(NSString *)anUrl;

/**
 *  用于自定义解析返回结果
 *
 *  @param aClient   YXHttpClient实例
 *  @param aResopnse 原始返回包
 *
 *  @return 处理过的返回包
 */
- (id)httpClient:(YXHttpClient *)aClient customResponseFromOriginal:(id)aResopnse;
```
### YXHttpCacheDataSource
缓存读取
```objective-c
- (id)fetchCacheForUrl:(NSString *)anUrl param:(NSDictionary *)aDict;
- (void)saveCacheForUrl:(NSString *)anUrl param:(NSDictionary *)aDict cacheData:(id)aData;
```
### 发起一个http请求
```objective-c
/**
 *  发起一个http请求
 *
 *  @param anUrl    请求链接，如果已设置了baseUrl，则这里传相对路径
 *  @param aMethod  请求方法，YXHttpTypeGet，YXHttpTypePost
 *  @param aParam   请求参数
 *  @param aSuccess 成功回调
 *  @param aFailure 失败回调
 *
 *  @return task
 */
- (NSURLSessionDataTask *)performRequestWithUrl:(NSString *)anUrl
                   httpMethod:(YXHttpType)aMethod
                        param:(NSDictionary *)aParam
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))aSuccess
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))aFailure;
```
### 发起上传下载请求
```objective-c
/**
 *  发起上传请求
 *
 *  @param anUrl          请求链接
 *  @param aFiles         文件列表
 *  @param aParam         参数
 *  @param aProgressBlock 上传进度回调
 *  @param aSuccess       上传成功回调
 *  @param aFailure       上传失败回调
 *
 *  @return task
 */
- (NSURLSessionDataTask *)performUploadRequestWithUrl:(NSString *)anUrl
                                                files:(NSArray *)aFiles
                                               parameters:(NSDictionary *)aParam
                                                 progress:(void (^)(NSProgress *uploadProgress))aProgressBlock
                                                  success:(void (^)(NSURLSessionDataTask *task, id responseObject))aSuccess
                                                  failure:(void (^)(NSURLSessionDataTask *task, NSError *error))aFailure;
                                                  
/**
 *  发起下载请求
 *
 *  @param anUrl              请求链接
 *  @param aProgressBlock     下载进度回调
 *  @param aDestination       下载完成后保存路径
 *  @param aCompletionHandler 下载完成后回调
 *
 *  @return task
 */
- (NSURLSessionDownloadTask *)performDownloadRequestWithUrl:(NSString *)anUrl
                                                   progress:(void (^)(NSProgress *downloadProgress))aProgressBlock
                                                destination:(NSURL *(^)(NSURL *targetPath, NSURLResponse *response))aDestination
                                          completionHandler:(void (^)(NSURLResponse *response, NSURL *filePath, NSError *error))aCompletionHandler;
```

然后你就可以愉快的开发了
