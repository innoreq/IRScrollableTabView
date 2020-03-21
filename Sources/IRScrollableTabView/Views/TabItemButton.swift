//
//  File.swift
//  
//
//  Created by Gerhard Schneider on 21.03.20.
//

import Foundation
import SwiftUI


struct TabItemButton: View {
	
	
	// MARK: - Environment
	
	
	@EnvironmentObject var service: IRScrollableTabView.Service


	// MARK: - Properties
	
	
	var configuration: IRScrollableTabView.Configuration
	let index: Int
	let isSelected: Bool
	let item: IRScrollableTabView.Item

	
	// MARK: - Initializers
	

	public init(configuration: IRScrollableTabView.Configuration = IRScrollableTabView.Configuration(),
				index: Int,
				isSelected: Bool,
				item: IRScrollableTabView.Item) {
		
		self.configuration = configuration
		self.index = index
		self.isSelected = isSelected
		self.item = item
	}


	// MARK: - View Definition
	
	
	var body: some View {
		
		return self.measure(content: {
			
			Button(action: self.tabItemAction,
				   label: self.tabItemLabel)
		})
	}
	
	
	private func tabItemAction() -> Void {
		
		return self.service.selectedIndex = index
	}
	
	
	private func tabItemLabel() -> TabItemButtonLabel {
		
		return TabItemButtonLabel(configuration: self.configuration,
								  image: self.item.image,
								  title: self.item.title,
								  isSelected: self.isSelected)
	}
}


struct TabItemButton_Previews: PreviewProvider {
	
	static var previews: some View {

		Group {
			
			TabItemButton(index: 0,
						  isSelected: true,
						  item: IRScrollableTabView.Item(title: "Title", image: Image("circle")))
			
			TabItemButton(index: 1,
						  isSelected: false,
						  item: IRScrollableTabView.Item(title: "Other Title", image: Image("square")))
		}
	}
}


extension View {
	
	func measure<Content: View>(@ViewBuilder content: @escaping () -> Content) -> some View{
		
		return GeometryReader { geo in
			
			content()
		}
	}
}
