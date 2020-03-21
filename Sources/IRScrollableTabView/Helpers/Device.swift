//
//  File.swift
//  
//
//  Created by Gerhard Schneider on 21.03.20.
//

import Foundation
import SwiftUI


public final class Device: ObservableObject {
	
	
	@Published public var isLandscape: Bool = false
	
	
	public init(isLandscape: Bool = false) {
		
		self.isLandscape = isLandscape
	}
}


