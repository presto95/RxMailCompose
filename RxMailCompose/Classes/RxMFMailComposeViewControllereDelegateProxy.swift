//
//  RxMFMailComposeViewControllereDelegateProxy.swift
//  RespectUV
//
//  Created by Presto on 2020/01/01.
//  Copyright © 2020 presto. All rights reserved.
//

import MessageUI

import RxCocoa

final class RxMFMailComposeViewControllerDelegateProxy: DelegateProxy<MFMailComposeViewController, MFMailComposeViewControllerDelegate>, DelegateProxyType, MFMailComposeViewControllerDelegate {
  static func registerKnownImplementations() {
    register { RxMFMailComposeViewControllerDelegateProxy(parentObject: $0, delegateProxy: self) }
  }

  static func currentDelegate(for object: MFMailComposeViewController) -> MFMailComposeViewControllerDelegate? {
    return object.mailComposeDelegate
  }

  static func setCurrentDelegate(_ delegate: MFMailComposeViewControllerDelegate?, to object: MFMailComposeViewController) {
    object.mailComposeDelegate = delegate
  }
}
