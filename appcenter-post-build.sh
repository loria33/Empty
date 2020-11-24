#!/usr/bin/env bash

    echo "Post Build Script Started"
    appCenterLoginApiToken="d5b653984fd851e1bb6db3f766cf883a1691bfc9"
    SolutionFile=`find "$APPCENTER_SOURCE_DIRECTORY" -name RNTest.sln`
    SolutionFileFolder=`dirname $SolutionFile`

    UITestProject=`find "$APPCENTER_SOURCE_DIRECTORY" -name RNTest.csproj`

    echo SolutionFile: $SolutionFile
    echo SolutionFileFolder: $SolutionFileFolder
    echo UITestProject: $UITestProject

    chmod -R 777 $SolutionFileFolder

    msbuild "$UITestProject" /property:Configuration="Debug"

    UITestDLL=`find "$APPCENTER_SOURCE_DIRECTORY" -name "RNTest.dll" | grep bin | head -1`
    echo UITestDLL: $UITestDLL

    UITestBuildDir=`dirname $UITestDLL`
    echo UITestBuildDir: $UITestBuildDir

    UITestVersionNumber=`grep '[0-9]' $UITestProject | grep Xamarin.UITest|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'`
    echo UITestVersionNumber: $UITestVersionNumber

    TestCloudExe=`find ~/.nuget | grep test-cloud.exe | grep $UITestVersionNumber | head -1`
    echo TestCloudExe: $TestCloudExe

    TestCloudExeDirectory=`dirname $TestCloudExe`
    echo TestCloudExeDirectory: $TestCloudExeDirectory

    APKFile=`find "$APPCENTER_SOURCE_DIRECTORY" -name *.apk | head -1`

    npm install -g appcenter-cli@2.5.0
    echo appCenterLoginApiToken
    appcenter test run uitest --app "lori.azerrad-curiositystream.com/TEST"  --devices "3f03d1be" --app-path $APKFile --test-series "master" --locale "en_US" --build-dir $UITestBuildDir --uitest-tools-dir $TestCloudExeDirectory --token appCenterLoginApiToken --async 

