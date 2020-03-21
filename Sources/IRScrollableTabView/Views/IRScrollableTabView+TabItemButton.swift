//
//  IRScrollableTabView+Button.swift
//  Views
//
//  Created by Gerhard Schneider on 17.03.20.
//  Copyright © 2020 innoreq GmbH. All rights reserved.
//

import SwiftUI


extension IRScrollableTabView {
	

	struct TabItemButton: View {
		
		
		var configuration: IRScrollableTabView.Configuration
		let index: Int
		let isSelected: Bool
		let item: IRScrollableTabView.Item


		public init(configuration: IRScrollableTabView.Configuration = IRScrollableTabView.Configuration(),
					index: Int,
					isSelected: Bool,
					item: IRScrollableTabView.Item) {
			
			self.configuration = configuration
			self.index = index
			self.isSelected = isSelected
			self.item = item
		}
		
		@EnvironmentObject var service: IRScrollableTabView.Service
		
		
		var body: some View {

			GeometryReader { geo in
				
				Button(action: self.tabItemAction,
					   label: {
						IRScrollableTabView.ButtonLabel(configuration: self.configuration,
														image: self.item.image,
														title: self.item.title,
														isSelected: self.isSelected)
				})
			}
		}


		func tabItemAction() -> Void {
			
			self.service.selectedIndex = index
		}
	}
}


struct IRScrollableTabView_Button_Previews: PreviewProvider {

	static var previews: some View {

		Group {
			
			IRScrollableTabView.TabItemButton(index: 0,
											  isSelected: true,
											  item: IRScrollableTabView.Item(title: "Title", image: Image("circle")))

			IRScrollableTabView.TabItemButton(index: 1,
											  isSelected: false,
											  item: IRScrollableTabView.Item(title: "Other Title", image: Image("square")))
		}
    }
}
