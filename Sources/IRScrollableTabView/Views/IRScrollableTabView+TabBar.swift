//
//  IRScrollableTabView+TabBar.swift
//  Views
//
//  Created by Gerhard Schneider on 17.03.20.
//  Copyright © 2020 innoreq GmbH. All rights reserved.
//

import SwiftUI


extension IRScrollableTabView {
	
	
	struct TabBar: View {

		
		var configuration: IRScrollableTabView.Configuration
		
		
		init(configuration: IRScrollableTabView.Configuration = IRScrollableTabView.Configuration()) {
			
			self.configuration = configuration
		}

		
		@EnvironmentObject var service: IRScrollableTabView.Service
		@State private var rect: CGRect = CGRect()


		var body: some View {

			GeometryReader { geo in
				
				if geo.size.width < self.rect.size.width {
					
					ScrollView(.horizontal) {
						
						IRScrollableTabView.TabBarItems(configuration: self.configuration,
														outerWidth: geo.size.width,
														contentWidth: self.rect.size.width)
							// This detects the effective positions of the tabs.
							.background(TabBarSetter())
					}
				} else {
					
					IRScrollableTabView.TabBarItems(configuration: self.configuration,
													outerWidth: geo.size.width,
													contentWidth: self.rect.size.width)
						// This detects the effective positions of the tabs.
						.background(TabBarSetter())
				}
			}
				// Our reference space.
				.coordinateSpace(name: "TabBarReference")

				// Update the current tab positions.
				.onPreferenceChange(TabBarPreferenceKey.self) { preferences in
					
					self.rect = preferences.first?.rect ?? CGRect()
					debugPrint(self.rect)
			}
		}
	}


	struct TabBarSetter: View {
		
		
		var body: some View {
			
			GeometryReader { geo in
				
				Rectangle()
					.fill(Color.clear)
					.preference(key: TabBarPreferenceKey.self,
								value: [TabBarData(rect: geo.frame(in: .named("TabBarReference")))])
			}
		}
	}
	
	
	struct TabBarPreferenceKey: PreferenceKey {
		
		typealias Value = [TabBarData]
		
		static var defaultValue: [IRScrollableTabView.TabBarData] = []
		
		static func reduce(value: inout [IRScrollableTabView.TabBarData], nextValue: () -> [IRScrollableTabView.TabBarData]) {
			
			value.append(contentsOf: nextValue())
		}
	}
	
	
	struct TabBarData: Equatable {
		
		let rect: CGRect
	}
}


struct IRScrollableTabView_TabBar_Previews: PreviewProvider {

	static var previews: some View {
    
		IRScrollableTabView.TabBar()
    }
}

