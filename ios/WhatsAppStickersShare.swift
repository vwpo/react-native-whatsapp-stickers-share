//
//  WhatsAppStickersShare.swift
//  WhatsAppStickersShare
//
//  Created by Ivan K on 02/04/2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation

class WhatsAppStickersShare: NSObject {
    @objc
    func share(_ config: NSDictionary,
               resolver resolve: RCTPromiseResolveBlock,
               rejecter reject: RCTPromiseRejectBlock) -> Void {
        do {
            let stickerPack: StickerPack = StickerPack(
                identifier: RCTConvert.nsString(config["identifier"]),
                name: RCTConvert.nsString(config["title"]),
                publisher: RCTConvert.nsString(config["author"]),
                trayImageFileName: RCTConvert.nsString(config["trayImage"]),
                publisherWebsite: RCTConvert.nsString(config["publisherURL"]),
                privacyPolicyWebsite: RCTConvert.nsString(config["privacyPolicyURL"]),
                licenseAgreementWebsite: RCTConvert.nsString(config["licenseURL"])
            )
            
            let stickersMap: [NSDictionary] = try RCTConvert.nsArray(config["stickers"])
            let group = DispatchGroup()
            let storedError = NSError?
            
            stickersMap.forEach { (sticker: NSDictionary) -> Void in
                group.enter()
                let imageUrl: [String] = RCTConvert.nsString(sticker["url"])
                let emojis: [String] = RCTConvert.nsString(sticker["emojis"])
                
                let imagePath = DownloadManager.shared.get(imageUrl) { path, error in
                    if (error != nil) {
                        storedError = error
                    } else {
                        stickerPack.addSticker(contentsOfFile: path, emojis: emojis)
                    }
                    group.leave()
                }
            }
            
            group.notify(queue: .main) {
                if (storedError != nil) {
                    reject()
                }
                stickerPack.sendToWhatsApp { (completed: Bool) in
                    return completed ? resolve() : reject()
                }
            }
        } catch {
            reject("WhatsAppStickersShare", "an unknown error occured for whats app stickers", error)
        }
    }
}
