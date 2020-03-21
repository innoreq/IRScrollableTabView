//
//  File.swift
//  
//
//  Created by Gerhard Schneider on 21.03.20.
//

import Foundation
import SwiftUI


struct TabItemPreferenceKey: PreferenceKey {
	
	typealias Value = [TabItemData]
	
	static var defaultValue: [TabItemData] = []
	
	static func reduce(value: inout [TabItemData], nextValue: () -> [TabItemData]) {
		
		value.append(contentsOf: nextValue())
	}
}

