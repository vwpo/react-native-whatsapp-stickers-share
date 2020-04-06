const { Linking, NativeModules } = require('react-native')

exports.default = Object.assign({}, NativeModules.WhatsAppStickersShare, {
	isWhatsAppAvailable: async () => Linking.canOpenURL("whatsapp://send")
})
