//
//  File.swift
//  
//
//  Created by Gerhard Schneider on 21.03.20.
//

import Foundation
import SwiftUI


struct TabBarPreferenceKey: PreferenceKey {

	typealias Value = [TabBarData]

	static var defaultValue: [TabBarData] = []

	static func reduce(value: inout [TabBarData], nextValue: () -> [TabBarData]) {

		value.append(contentsOf: nextValue())
	}
}

