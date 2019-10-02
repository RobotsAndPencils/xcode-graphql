#!/usr/bin/env bash

set -o xtrace

# Embed inside Xcode 11
# https://github.com/apollographql/xcode-graphql/issues/23#issuecomment-534634008
# Example: ./setup.sh --embed-in-xcode /Applications/Xcode-11.app
if [ "$1" == "--embed-in-xcode" ]; then
	plist_dir="$2/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageMetadata"
	spec_dir="$2/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications"

	if [ -d "$2" ] && [ -d "$plist_dir" ] && [ -d "$spec_dir" ]; then
		cp Xcode.SourceCodeLanguage.GraphQL.plist $plist_dir
		cp GraphQL.xclangspec $spec_dir
	else
		echo '⚠️ Must supply a valid path to an Xcode.app after the --embed-in-xcode flag. Either the provided path was invalid or that Xcode doesn'\''t contain the expected directory to install within.'
		exit 1
	fi
fi

plugins_dir=~/Library/Developer/Xcode/Plug-ins/
spec_dir=~/Library/Developer/Xcode/Specifications

# Create Plug-ins directory if it doesn't exist
if [ ! -d "$plugins_dir" ]; then
	mkdir $plugins_dir
fi

# Create Specifications directory if it doesn't exist
if [ ! -d "$spec_dir" ]; then
	mkdir $spec_dir
fi

cp -r GraphQL.ideplugin $plugins_dir
cp GraphQL.xclangspec $spec_dir

echo '🎉 Apollo Xcode Add-ons installation has completed! Please close and re-open Xcode.'