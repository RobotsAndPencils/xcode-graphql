# Apollo Xcode Add-ons

These add-ons add syntax highlighting for GraphQL query document files to Xcode.

## Installation

### Setup script

Run the following command in your terminal:

```
./setup.sh
```

Xcode 11 has changed where language specifications are stored, and no longer looks for them in `~/Library/Developer/Xcode`. A workaround is provided which installs the necessary files within Xcode itself where they'll be loaded. It goes without saying that changing the contents of Xcode's app bundle is a fragile solution that is likely to break in the future.

```
./setup.sh --embed-in-xcode /Applications/Xcode-11.app
```

### Manual installation

Please note that if you are running Xcode 8 the `Plug-ins` and `Specifications` directories might not exist.

- Copy the `GraphQL.ideplugin` directory to `~/Library/Developer/Xcode/Plug-ins/`:

	```
	cp -r GraphQL.ideplugin ~/Library/Developer/Xcode/Plug-ins/
	```
- Copy the `GraphQL.xclangspec` file to `~/Library/Developer/Xcode/Specifications`:

	```
	cp GraphQL.xclangspec ~/Library/Developer/Xcode/Specifications/
	```
