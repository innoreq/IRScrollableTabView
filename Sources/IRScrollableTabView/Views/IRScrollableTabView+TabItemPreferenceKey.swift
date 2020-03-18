//
//  IRTabItemPreferenceKey.swift
//  Views
//
//  Created by Gerhard Schneider on 16.03.20.
//  Copyright © 2020 innoreq GmbH. All rights reserved.
//

import Foundation
import SwiftUI


extension IRScrollableTabView {
	

	struct TabItemPreferenceKey: PreferenceKey {
		
		typealias Value = [TabItemData]
		
		static var defaultValue: [TabItemData] = []
		
		static func reduce(value: inout [TabItemData], nextValue: () -> [TabItemData]) {
			
			value.append(contentsOf: nextValue())
		}
	}
}
