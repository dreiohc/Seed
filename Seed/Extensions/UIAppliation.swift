//
//  UIAppliation.swift
//  Seed
//
//  Created by Myron Dulay on 8/22/20.
//  Copyright © 2020 Myron Dulay. All rights reserved.
//

import UIKit

extension UIApplication {
	var isDebugMode: Bool {
		let dictionary = ProcessInfo.processInfo.environment
		return dictionary["DEBUGMODE"] != nil
	}
}
