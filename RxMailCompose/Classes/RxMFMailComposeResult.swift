//
//  RxMFMailComposeResult.swift
//  RespectUV
//
//  Created by Presto on 2020/01/01.
//  Copyright © 2020 presto. All rights reserved.
//

enum RxMFMailComposeResult {
  case cannotSend
  case cancelled
  case saved
  case sent
  case sendFailed
  case saveFailed

  var isSuccess: Bool {
    return [.cancelled, .saved, .sent].contains(self)
  }

  var isFailure: Bool {
    return [.cannotSend, .sendFailed, .saveFailed].contains(self)
  }
}
