//
//  SwiftChildWidget.swift
//  SwiftChildWidget
//
//  Created by Steven Troughton-Smith on 02/10/2020.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: OCPAConfigurationIntent())
    }
    
    func getSnapshot(for configuration: OCPAConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }
    
    func getTimeline(for configuration: OCPAConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: OCPAConfigurationIntent
}

struct SwiftChildWidgetEntryView : View {
    var entry: Provider.Entry
    var dataModel:OCPADataModel
    
    var body: some View {
        
        VStack {
            ForEach(0 ..< dataModel.items.count) { i in
                ZStack {
                    RoundedRectangle(cornerRadius: 4, style: .continuous)
                        .fill(Color(dataModel.items[i].color))
                    HStack {
                        Image(uiImage: dataModel.items[i].image)
                        Text(dataModel.items[i].text)
                    }
                }
            }
        }
        .padding()
    }
}

@main
struct SwiftChildWidget: Widget {
    let kind: String = "SwiftChildWidget"
    
    let dataModel = OCPADataModel()
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: OCPAConfigurationIntent.self, provider: Provider()) { entry in
            SwiftChildWidgetEntryView(entry: entry, dataModel:dataModel)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct SwiftChildWidget_Previews: PreviewProvider {
    static var previews: some View {
        SwiftChildWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: OCPAConfigurationIntent()), dataModel:OCPADataModel())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
