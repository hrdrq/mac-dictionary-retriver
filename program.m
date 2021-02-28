#import <Foundation/Foundation.h>
NSArray *DCSCopyAvailableDictionaries(); 
NSArray *DCSCopyRecordsForSearchString(DCSDictionaryRef dictionary, CFStringRef string, void *, void *);
NSArray *DCSRecordCopyData(CFTypeRef record);
NSString *DCSDictionaryGetName(DCSDictionaryRef dictID); 

int main(int argc, char * argv[])
{
	@autoreleasepool { 
    	if(argc < 2)
    	{
        	printf("Usage: %s {dictionary name} {word}\n", argv[0]);
        	return -1;
    	}

    	NSString * dictName = [NSString stringWithCString: argv[1] encoding: NSUTF8StringEncoding]; 
        CFTypeRef dictionary = NULL;
        NSArray *dicts = DCSCopyAvailableDictionaries();
        for (NSObject *aDict in dicts) {
            NSString *aShortName = DCSDictionaryGetName((DCSDictionaryRef)aDict);
            if ([aShortName isEqualToString:dictName]) {
                dictionary = (DCSDictionaryRef)aDict;
                break;
            }
        }
    	NSString * word = [NSString stringWithCString: argv[2] encoding: NSUTF8StringEncoding]; 
        NSArray *records = DCSCopyRecordsForSearchString(dictionary, (CFStringRef)word, 0, 0);
        for (id record in records) {
            printf("%s", [(NSString*)DCSRecordCopyData(record) UTF8String]);
        }
	}
	return 0;
}