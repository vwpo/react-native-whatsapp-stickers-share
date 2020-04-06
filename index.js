import { Linking, NativeModules } from 'react-native'

export default Object.assign({}, NativeModules.WhatsAppStickersShare, {
	isWhatsAppAvailable: async () => Linking.canOpenURL("whatsapp://send")
})
