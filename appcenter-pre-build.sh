#!/usr/bin/env bash
PostBuildScriptFile=`find "$APPCENTER_SOURCE_DIRECTORY" -name appcenter-post-build.sh | grep Droid | head -1`

sed -i '' "s/--token token/--token $APPCENTER_ACCESS_TOKEN/g" "$PostBuildScriptFile"

echo "Finished Injecting App Center Login Token"