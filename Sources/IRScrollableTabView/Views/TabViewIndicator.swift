//
//  File.swift
//  
//
//  Created by Gerhard Schneider on 21.03.20.
//

import Foundation
import SwiftUI


struct TabViewIndicator: View {
	
	
	// MARK: - Properties
	
	
	var configuration: IRScrollableTabView.Configuration
	
	
	// MARK: - Initializers
	
	
	public init(configuration: IRScrollableTabView.Configuration = IRScrollableTabView.Configuration()) {
		
		self.configuration = configuration
	}
	
	
	// MARK: - View Definition
	
	
	var body: some View {
		
		RoundedRectangle(cornerRadius: configuration.indicatorCornerRadius)
			.inset(by: 4)
			.foregroundColor(configuration.indicatorForegroundColor)
			.shadow(radius: 5)
	}
}
