//
//  File.swift
//  
//
//  Created by Gerhard Schneider on 21.03.20.
//

import Foundation
import SwiftUI


struct TabItemButtonLabel: View {
	
	
	// MARK: - Properties
	
	
	var configuration: IRScrollableTabView.Configuration
	
	/// The image to use for the tab item.
	var image: Image?

	/// The title to use for the tab item.
	var title: String

	/// Is the tab item selected?
	var isSelected: Bool
	

	// MARK: - Initializers
	
	
	public init(configuration: IRScrollableTabView.Configuration = IRScrollableTabView.Configuration(),
				image: Image?,
				title: String,
				isSelected: Bool) {
		
		self.configuration = configuration
		self.image = image
		self.title = title
		self.isSelected = isSelected
	}
	
	
	// MARK: - View Definition
	
	
	var body: some View {
		
		VStack {
			
			(self.image == nil ? Image(systemName: "unexisting") : self.image!)
				.resizable()
				// We want it to fit.
				.aspectRatio(1, contentMode: .fit)
				// The size is determined by the configuration.
				.font(configuration.tabItemImageFont)
				// We want some space between image and text.
				.padding([.bottom], 5)
			
			Text(self.title)
				.font(configuration.tabItemTextFont)
				// We allow just one line of text.
				.lineLimit(1)
		}
			// The color depends on the status.
			.foregroundColor(isSelected ?
				configuration.tabItemSelectedColor :
				configuration.tabItemUnselectedColor)
	}
}


struct TabItemButtonLabel_Previews: PreviewProvider {
	
	static var previews: some View {
		
		Group {
			
			TabItemButtonLabel(image: Image(systemName: "square"),
							   title: "Square",
							   isSelected: true)
			
			TabItemButtonLabel(image: Image(systemName: "circle"),
							   title: "Circle",
							   isSelected: false)
			
			TabItemButtonLabel(image: nil,
							   title: "Nothing",
							   isSelected: false)
		}
	}
}

