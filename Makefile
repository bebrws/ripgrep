all: rg

rg: main.o
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang++ -fcolor-diagnostics -L/opt/theos/lib -ggdb -L/opt/theos/vendor/lib -lobjc -framework Foundation -framework Security -framework CoreFoundation               -isysroot "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/" -miphoneos-version-min=12.0 -Xlinker -segalign -Xlinker 4000 -multiply_defined suppress -stdlib=libc++ -lc++ -arch arm64 target/universal/debug/liblibrg.a  /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/lib/libresolv.tbd  /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/lib/libresolv.9.tbd  -lresolv -o rg main.o
	#/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang++ -fcolor-diagnostics -L/opt/theos/lib -ggdb -L/opt/theos/vendor/lib -lobjc -framework Foundation -framework CoreFoundation               -isysroot "/opt/theos/sdks/iPhoneOS13.4.1.sdk" -miphoneos-version-min=6.0 -Xlinker -segalign -Xlinker 4000 -multiply_defined suppress -stdlib=libc++ -lc++ -arch arm64 /Users/bbarrows/repos/ripgrep/target/universal/debug/liblibrg.a  /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/lib/libresolv.tbd  /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/lib/libresolv.9.tbd  -lresolv -o rg main.o
	#/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang++ -fcolor-diagnostics -L/opt/theos/lib -ggdb -L/opt/theos/vendor/lib -lobjc -framework Foundation -framework CoreFoundation -isysroot "/opt/theos/sdks/iPhoneOS13.3.1.sdk" -miphoneos-version-min=12.0 -Xlinker -segalign -Xlinker 4000 -multiply_defined suppress -stdlib=libc++ -lc++ -arch arm64  -O0 -o rg main.o
main.o:
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang++ -x objective-c -c -I/opt/theos/include -I/opt/theos/vendor/include -I/opt/theos/include/_fallback -include /opt/theos/Prefix.pch -fcolor-diagnostics -DTARGET_IPHONE=1 -O0 -Wall -ggdb -Werror -isysroot "/opt/theos/sdks/iPhoneOS13.3.1.sdk" -miphoneos-version-min=12.0  -fobjc-arc -DDEBUG -O0 -DTHEOS_INSTANCE_NAME="\"rg\"" -arch arm64 -std=c99 main.mm -o main.o 

target/universal/debug/liblibrg.a:
	cargo lipo --release 

clean:
	rm -rf main.o rg