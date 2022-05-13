override CXXFLAGS+=-O2 -Wall -fobjc-arc -D"NS_FORMAT_ARGUMENT(A)="

.PHONY: all clean install

all: AutoRaise AutoRaise.app

clean:
	rm -f AutoRaise
	rm -rf AutoRaise.app

install: AutoRaise.app
	rm -rf /Applications/AutoRaise.app
	cp -r AutoRaise.app /Applications/

AutoRaise: AutoRaise.mm
	g++ $(CXXFLAGS) -o $@ $^ -framework AppKit -F /System/Library/PrivateFrameworks -framework SkyLight

AutoRaise.app: AutoRaise Info.plist AutoRaise.icns
	./create-app-bundle.sh
