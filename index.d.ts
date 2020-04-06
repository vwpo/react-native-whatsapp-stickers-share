export interface StickerConfig {
	emojis?: string[],
	url: string
}

export interface StickerPackConfig {
	identifier: string,
	title: string,
	author: string,
	trayImage: string,
	publisherEmail: string,
	publisherURL: string,
	privacyPolicyURL: string,
	licenseURL: string,
	stickers: StickerConfig[]
}


interface ReactNativeWhatsAppStickersShare {
	isWhatsAppAvailable: () => Promise<boolean>,
	share: (config: StickerPackConfig) => Promise<true>
}

export default ReactNativeWhatsAppStickersShare