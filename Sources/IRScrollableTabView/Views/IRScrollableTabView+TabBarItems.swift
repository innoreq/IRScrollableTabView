//
//  IRScrollableTabView+TabBarItems.swift
//  Views
//
//  Created by Gerhard Schneider on 18.03.20.
//  Copyright © 2020 innoreq GmbH. All rights reserved.
//

import SwiftUI


extension IRScrollableTabView {
	
	
	struct TabBarItems: View {

		
		var configuration: IRScrollableTabView.Configuration

		
		init(configuration: IRScrollableTabView.Configuration = IRScrollableTabView.Configuration(),
			 outerWidth: CGFloat = UIScreen.main.bounds.width,
			 contentWidth: CGFloat = UIScreen.main.bounds.width) {
			
			self.configuration = configuration
			self.outerWidth = outerWidth
			self.contentWidth = contentWidth
		}
		

		// We support up to 15 items.
		@State private var rects: [CGRect] = Array<CGRect>(repeating: CGRect(), count: 15)
		@EnvironmentObject var service: IRScrollableTabView.Service
		@State var outerWidth: CGFloat = UIScreen.main.bounds.width
		@State var contentWidth: CGFloat = UIScreen.main.bounds.width
		
		
		var body: some View {
			
			ZStack {
				
				GeometryReader { innerGeo in
					
					IRScrollableTabView.Indicator(configuration: self.configuration)
						.frame(width: self.rects[self.service.selectedIndex].size.width + self.configuration.indicatorEnlargement,
							   height: self.rects[self.service.selectedIndex].size.height + self.configuration.indicatorEnlargement)
						.padding()
						.offset(x: self.offset(innerGeo: innerGeo))
						.animation(.easeInOut(duration: self.configuration.animationDuration))
				}
				
				HStack(alignment: .top, spacing: self.configuration.itemSpacing) {
					
					ForEach(0..<self.service.tabItems.count, id: \.self) { index in
						
						TabItemButton(configuration: self.configuration,
											  index: index,
											  isSelected: (index == self.service.selectedIndex),
											  item: self.service.tabItems[index])
									// We want a fixed tab item with.
									.frame(width: self.configuration.itemWidth)
								
								// This detects the effective positions of the tabs.
								.background(TabItemViewSetter(index: index))
					}
				}
					
					// Update the current tab positions.
					.onPreferenceChange(TabItemPreferenceKey.self) { preferences in
						
						for p in preferences {
							
							self.rects[p.viewIndex] = p.rect
						}
				}
			}
				// We want to have the positions within this space.
				.coordinateSpace(name: "IRReference")
		}

		
		private func offset(innerGeo: GeometryProxy) -> CGFloat {
			
			let globalX = innerGeo.frame(in: .global).minX
			let selectedRect = self.rects[self.service.selectedIndex]
			let selectedOffset: CGFloat = selectedRect.minX - globalX - innerGeo.frame(in: .global).width / 2 + selectedRect.width / 2
			
			return selectedOffset
		}
		
		
		private func shallScroll() -> Bool {
			
			return outerWidth < contentWidth
		}
	}

	
	struct Setter: View {
		
		
		let index: Int
		
		
		var body: some View {
			
			GeometryReader { geo in
				
				Rectangle()
					.fill(Color.clear)
					.preference(key: IRPreferenceKey.self,
								value: [IRData(viewIndex: self.index,
											   rect: geo.frame(in: .named("IRReference")))])
			}
		}
	}
	
	
	struct IRPreferenceKey: PreferenceKey {
		
		typealias Value = [IRData]
		
		static var defaultValue: [IRScrollableTabView.IRData] = []
		
		static func reduce(value: inout [IRScrollableTabView.IRData], nextValue: () -> [IRScrollableTabView.IRData]) {
			
			value.append(contentsOf: nextValue())
		}
	}
	
	
	struct IRData: Equatable {
		
		let viewIndex: Int
		let rect: CGRect
	}
}


struct IRScrollableTabView_TabBarItems_Previews: PreviewProvider {

	static var previews: some View {
    
		IRScrollableTabView.TabBarItems()
    }
}
