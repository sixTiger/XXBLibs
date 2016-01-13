/**
 *
 * 单例 宏
 *
 */
// .h文件
#define XXBSingletonH(name) + (instancetype)shared##name;

// .m文件
#define XXBSingletonM(name) \
static id _instance = nil; \
+ (id)allocWithZone:(struct _NSZone *)zone\
{\
    if (_instance == nil)\
    {\
        static dispatch_once_t onceToken;\
        dispatch_once(&onceToken, ^{\
            _instance = [super allocWithZone:zone];\
        });\
    }\
    return _instance;\
}\
+ (instancetype)shared##name \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [[self alloc] init]; \
    }); \
    return _instance; \
} \
- (id)copyWithZone:(NSZone *)zone \
{ \
    return _instance; \
}