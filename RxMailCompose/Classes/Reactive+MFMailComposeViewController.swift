//
//  Reactive+MFMailComposeViewController.swift
//  RxMailCompose
//
//  Created by Presto on 2020/01/01.
//  Copyright © 2020 presto. All rights reserved.
//

import MessageUI

import RxCocoa
import RxSwift

extension Reactive where Base: MFMailComposeViewController {
  var mailComposeDelegate: DelegateProxy<MFMailComposeViewController, MFMailComposeViewControllerDelegate> {
    return RxMFMailComposeViewControllerDelegateProxy.proxy(for: base)
  }

  var result: Observable<RxMFMailComposeResult> {
    if !MFMailComposeViewController.canSendMail() {
      return .just(.cannotSend)
    }
    return mailComposeDelegate.methodInvoked(#selector(MFMailComposeViewControllerDelegate.mailComposeController(_:didFinishWith:error:)))
      .map { parameters in
        let result = parameters[1] as! Int
        let error = parameters[2] as? MFMailComposeError
        switch result {
        case 0:
          return .cancelled
        case 1:
          return .saved
        case 2:
          return .sent
        case 3:
          switch error!.code {
          case .saveFailed:
            return .saveFailed
          case .sendFailed:
            return .sendFailed
          @unknown default:
            fatalError()
          }
        default:
          fatalError()
        }
    }
    .do(onNext: { [weak base] _ in
      base?.dismiss(animated: true, completion: nil)
    })
  }
}
