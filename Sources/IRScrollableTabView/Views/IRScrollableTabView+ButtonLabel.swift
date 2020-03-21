//
//  IRScrollableTabViewButtonLabel.swift
//  Views
//
//  Created by Gerhard Schneider on 17.03.20.
//  Copyright © 2020 innoreq GmbH. All rights reserved.
//

import SwiftUI


extension IRScrollableTabView {
	
	
	struct ButtonLabel: View {
		

		var configuration: IRScrollableTabView.Configuration

		/// The image to use for the tab item.
		var image: Image?
		/// The title to use for the tab item.
		var title: String
		/// Is the tab item selected?
		var isSelected: Bool
		

		public init(configuration: IRScrollableTabView.Configuration = IRScrollableTabView.Configuration(),
					image: Image?,
					title: String,
					isSelected: Bool) {
			
			self.configuration = configuration
			self.image = image
			self.title = title
			self.isSelected = isSelected
		}

		
		var body: some View {
			
			VStack {
				
				(self.image == nil ? Image(systemName: "unexisting") : self.image!)
					.resizable()
					.aspectRatio(1, contentMode: .fit)
					.font(configuration.tabItemImageFont)
					.padding(.all, 5)
				
				Text(self.title)
					.font(configuration.tabItemTextFont)
					.lineLimit(1)
			}
			.foregroundColor(isSelected ?
				configuration.tabItemSelectedColor :
				configuration.tabItemUnselectedColor)
		}
	}
}


struct IRScrollableTabViewButtonLabel_Previews: PreviewProvider {

	static var previews: some View {
    
		Group {
			
			IRScrollableTabView.ButtonLabel(image: Image(systemName: "square"),
										   title: "Square",
										   isSelected: true)
			
			IRScrollableTabView.ButtonLabel(image: Image(systemName: "circle"),
										   title: "Circle",
										   isSelected: false)
			
			IRScrollableTabView.ButtonLabel(image: nil,
										   title: "Nothing",
										   isSelected: false)
		}
    }
}

