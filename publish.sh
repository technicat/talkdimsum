!/bin/sh

butler push build/app/outputs/apk/release/app-release.apk technicat/talkdimsum:android
butler push build/macos/Build/Products/Release/talkdimsum.app technicat/talkdimsum:macos