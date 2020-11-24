#!/usr/bin/env bash
PostBuildScriptFile=`find "$APPCENTER_SOURCE_DIRECTORY" -name appcenter-post-build.sh | head -1`
echo $PostBuildScriptFile
echo $APPCENTER_ACCESS_TOKEN
echo "THIS IS THE TOKEN ABOVE ME.."
echo $loginToken

echo "THIS IS THE loginToken TOKEN ABOVE ME.."

sed -i '' "s/--token token/--token $APPCENTER_ACCESS_TOKEN/g" "$PostBuildScriptFile"

echo "Finished Injecting App Center Login Token"