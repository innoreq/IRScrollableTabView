//
//  File.swift
//  
//
//  Created by Gerhard Schneider on 21.03.20.
//

import Foundation
import SwiftUI
import SwiftyBeaver


struct TabBarItems: View {
	
	
	// MARK: - Environment
	
	
	@EnvironmentObject var service: IRScrollableTabView.Service

	
	// MARK: - Properties
	
	
	var configuration: IRScrollableTabView.Configuration
	var containerSize: CGSize
	var contentSize: CGSize
	
	
	// MARK: - States
	
	
	// We support up to 15 items. This is needed to determine the position of the indicator.
	@State private var rects: [CGRect] = Array<CGRect>(repeating: CGRect(), count: 15)

	
	// MARK: - Initializers
	
	
	init(configuration: IRScrollableTabView.Configuration = IRScrollableTabView.Configuration(),
		 containerSize: CGSize,
		 contentSize: CGSize) {
		
		self.configuration = configuration
		self.containerSize = containerSize
		self.contentSize = contentSize
	}
	
	
	// MARK: - View Definition
	
	
	var body: some View {
		
		ZStack {
			
			self.indicatorView()
			
			self.tabItemsView()
		}
			// We want to have the positions within this space.
			.coordinateSpace(name: "IRReference")
	}
	
	
	// MARK: - Subview Definitions
	
	
	private func indicatorView() -> AnyView {

		let selectedRect: CGRect = self.rects[self.service.selectedIndex]
		SwiftyBeaver.debug("TabBarItems Sel Rect: \(selectedRect)")
		
		return AnyView(
		
			GeometryReader { geo in
				
				TabViewIndicator(configuration: self.configuration)
					.frame(width: selectedRect.size.width + 10,
						   height: selectedRect.size.height + 20)
					.offset(x: self.offset(geo: geo))
					.animation(.easeInOut(duration: self.configuration.animationDuration))
			}
		)
	}
	
	
	private func offset(geo: GeometryProxy) -> CGFloat {
		
		let globalX = geo.frame(in: .global).minX
		let selectedRect = self.rects[self.service.selectedIndex]
		let selectedOffset: CGFloat = selectedRect.minX - globalX - geo.frame(in: .global).width / 2 + selectedRect.width / 2
		
		return selectedOffset
	}


	private func tabItemsView() -> AnyView {

		AnyView(
			
			HStack(alignment: .top, spacing: self.configuration.itemSpacing) {
				
				ForEach(0..<self.service.tabItems.count, id: \.self) { index in
					
					TabItemButton(configuration: self.configuration,
								  index: index,
								  isSelected: (index == self.service.selectedIndex),
								  item: self.service.tabItems[index])
						// We want a defined width of each tab item.
						.frame(width: self.configuration.itemWidth,
							   height: 50)
						// We need the effective position of each tab item.
						.background(TabItemViewSetter(index: index))
				}
			}
			// Update the current tab positions.
			.onPreferenceChange(TabItemPreferenceKey.self) { preferences in

				for p in preferences {

					self.rects[p.viewIndex] = p.rect
				}
			}
				// We want to know the size of the button row.
			.background(TabBarSetter())
		)
	}
}
