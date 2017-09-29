//
//  ViewController.swift
//  CoreNFCDemo01
//
//  Created by 张延深 on 2017/9/29.
//  Copyright © 2017年 张延深. All rights reserved.
//

import UIKit
import CoreNFC

class ViewController: UIViewController, NFCNDEFReaderSessionDelegate {
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if UIDevice.current.systemVersion {
//
//        }
        if NFCNDEFReaderSession.readingAvailable {
            let session = NFCNDEFReaderSession.init(delegate: self, queue: nil, invalidateAfterFirstRead: true)
            session.begin()
        }
    }
    
    // MARK: NFCNDEFReaderSessionDelegate
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("出错了：", error.localizedDescription)
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        for message in messages {
            for playLoad in message.records {
                print("typeNameFormat: ", playLoad.typeNameFormat)
                print("type: ", playLoad.type)
                print("identifier: ", playLoad.identifier)
                print("payload: ", playLoad.payload)
                guard playLoad.payload.count != 0 else {
                    return
                }
                let str: NSString = NSString(data: playLoad.payload, encoding: String.Encoding.utf8.rawValue)!
                print("payloadStr: ", str)
            }
        }
    }
    
    // MARK: Event response
    
    // MARK: -

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

