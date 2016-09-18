/**
 *
 * 单例 宏
 *
 */
// .h文件
#define XXBSingletonH(name) + (instancetype)shared##name;

// .m文件
#define XXBSingletonM(name) \
static id _instance##name = nil; \
+ (id)allocWithZone:(struct _NSZone *)zone\
{\
    if (_instance##name == nil)\
    {\
        static dispatch_once_t onceToken;\
        dispatch_once(&onceToken, ^{\
            _instance##name = [super allocWithZone:zone];\
        });\
    }\
    return _instance##name;\
}\
+ (instancetype)shared##name \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance##name = [[self alloc] init]; \
    }); \
    return _instance##name; \
} \
- (id)copyWithZone:(NSZone *)zone \
{ \
    return _instance##name; \
}
