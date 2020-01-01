//
//  RxMFMailComposeResult.swift
//  RxMailCompose
//
//  Created by Presto on 2020/01/01.
//  Copyright © 2020 presto. All rights reserved.
//

public typealias RxMFMailComposeResult = Result<RxMFMailComposeState, RxMFMailComposeError>

public enum RxMFMailComposeState {
  case cancelled
  case saved
  case sent
}

public enum RxMFMailComposeError: Error {
  case cannotSend
  case sendFailed
  case saveFailed
}
