//
//  File.swift
//  
//
//  Created by Gerhard Schneider on 21.03.20.
//

import Foundation
import SwiftUI


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

