# react-native-whatsapp-stickers-share

This package will share stickers to WhatsApp app with only URL.

## Getting started

1. `npm install react-native-whatsapp-stickers-share --save-dev`
2. Add next lines to Podfile

```
pod 'react-native-whatsapp-stickers-share', :podspec => '../node_modules/react-native-whatsapp-stickers-share/react-native-whatsapp-stickers-share.podspec'
pod 'YYImage'
pod 'YYImage/WebP'
```

3. `cd ios && pod install`

### Mostly automatic installation

For React-Native <= 0.60.0 only

1. `react-native link react-native-whatsapp-stickers-share`

## Usage
```javascript
import RNWhatsAppStickersShare, { StickerPackConfig } from " react-native-whatsapp-stickers-share";
import { Alert } from "react-native";

const config = {
		identifier: pack.data.id!,
		title: pack.data.name!,
		author: pack.data.author!,
		trayImage: "https://api.sticker.place/v2/images/5dc96428e4b0e670e6ec2d34",
		publisherEmail: "vwpo@roborox.org",
		publisherURL: "https://roborox.org",
		privacyPolicyURL: "https://roborox.org/privacy",
		licenseURL: "https://roborox.org/license",
		stickers: [
			{
				emojis: ["😍", "😻"],
				url: "https://api.sticker.place/v2/images/5dc96428e4b0e670e6ec2d3a",
			},
			{
				emojis: ["😎"],
				url: "https://api.sticker.place/v2/images/5dc96428e4b0e670e6ec2d38",
			},
			{
				url: "https://api.sticker.place/v2/images/5dc96429e4b0e670e6ec2d3c",
			},
		],
	}

const performShare = async (config: StickerPackConfig) => {
	try {
		if (await RNWhatsAppStickersShare.isWhatsAppAvailable()) {
			return await RNWhatsAppStickersShare.share(config)		
		}
		Alert.alert("You should install WhatsApp first")
	} catch (error) {
		Alert.alert("An error occured", error)
	}
} 
```


## Todo

[ ] Remove temporary images (cleanup)
[ ] Unit tests