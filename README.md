# IRScrollableTabView

## Purpose

A tab view where the tab bar can be scrolled and thus provide many tab items. 

The selected index is provided through the service and can be used to determine the destination view to display. 

## Installation

Use the Swift Package Manager with the repo's URL and add it to your project.

## Usage

Create a list of tab items:

	let scrollableTabItems: [IRScrollableTabView.Item] = [
	
		IRScrollableTabView.Item(title: "View 1"),
		IRScrollableTabView.Item(title: "View 2"),
		IRScrollableTabView.Item(title: "View 3"),
		IRScrollableTabView.Item(title: "View 4"),
		IRScrollableTabView.Item(title: "View 5"),
		IRScrollableTabView.Item(title: "View 6"),
		IRScrollableTabView.Item(title: "View 7"),
		IRScrollableTabView.Item(title: "View 8"),
		IRScrollableTabView.Item(title: "View 9"),
		IRScrollableTabView.Item(title: "View 10"),
	]

Create the service and add it to the environment. Provide the initially selected index to the service, as well as the tab items and a closure that provides the view to display based on the selection:

	
		let contentView = ContentView()
			.background(Color.clear)
			.environmentObject(IRScrollableTabView.Service(tabItems: scrollableTabItems,
														   initialSelectedIndex: 0,
														   selectionClosure: { index in
															
															AnyView(Text("Selected: \(index)"))
			}))
	

Use the view:

	struct ContentView: View {	
	
		var body: some View {
	    
			IRScrollableTabView()
	    }
	}
	
	
## Notes

