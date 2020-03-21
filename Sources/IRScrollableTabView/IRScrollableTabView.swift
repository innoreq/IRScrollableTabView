//
//  IRScrollableTabView.swift
//  Views
//
//  Created by Gerhard Schneider on 17.03.20.
//  Copyright © 2020 innoreq GmbH. All rights reserved.
//

import SwiftUI


public struct IRScrollableTabView: View {

	
	@EnvironmentObject var service: IRScrollableTabView.Service
	
	
	private var configuration: IRScrollableTabView.Configuration

	
	public init(configuration: IRScrollableTabView.Configuration = IRScrollableTabView.Configuration()) {
		
		self.configuration = configuration
	}
	
	
	public var body: some View {

		VStack(alignment: .center, spacing: 0) {

			Rectangle()
				.foregroundColor(configuration.destinationBackgroundColor)
				.overlay(service.currentDestinationView)

			Rectangle()
				.foregroundColor(configuration.separatorLineColor)
				.frame(height: 1)

			Rectangle()
				.foregroundColor(configuration.destinationBackgroundColor)
				.frame(height: 90)
				.shadow(radius: 10)
				.overlay(IRScrollableTabView.TabBar(configuration: configuration))
		}
    }
}


struct IRScrollableTabView_Previews: PreviewProvider {

	static var previews: some View {
    
		IRScrollableTabView()
    }
}

