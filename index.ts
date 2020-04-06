import { Linking, NativeModules } from 'react-native'

const nativeModule = Object.assign({}, NativeModules.WhatsAppStickersShare, {
	isWhatsAppAvailable: async () => Linking.canOpenURL("whatsapp://send")
})

export default nativeModule
