//
//  MyCalendarView.swift
//  DailyCosmos
//
//  Created by 박제균 on 2022/12/15.
//

import SwiftUI

struct MyCalendarView: UIViewRepresentable {

    @ObservedObject var observer: SpaceDataStore
    @Binding var isPresented: Bool
    @Binding var dateSelected: Date

    func makeUIView(context: UIViewRepresentableContext<MyCalendarView>) -> UICalendarView {

        let calendarView = UICalendarView()
        let dateSelection = UICalendarSelectionSingleDate(delegate: context.coordinator)
        calendarView.selectionBehavior = dateSelection
        calendarView.delegate = context.coordinator

        let gregorianCalendar = Calendar(identifier: .gregorian)
        calendarView.calendar = gregorianCalendar
        calendarView.tintColor = .systemMint
        calendarView.availableDateRange = DateInterval(start: .distantPast, end: .now)

        return calendarView
    }

    // @State가 업데이트 될 때마다 트리거
    func updateUIView(_ uiView: UICalendarView, context: Context) {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        dateFormatter.locale = Locale(identifier: "en-US")
//        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
//        let dateString = dateFormatter.string(from: dateSelected)
////                let dateString = dateFormatter.string(from:Date(timeIntervalSinceNow: -86400*100))
//        print(dateString)
//
//        Task {
//            observer.data = try await NetworkManager.shared.fetchDataWithURLString(urlString: NetworkManager.shared.defaultRequestURL + dateString)
//            isPresented = true
//        }
    }


    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UICalendarSelectionSingleDateDelegate, UICalendarViewDelegate {

        var calendarView: MyCalendarView

        init(_ calendarView: MyCalendarView) {
            self.calendarView = calendarView
        }

        func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
            return UICalendarView.Decoration()
        }

        func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
            print("select Date")
            return
        }

        func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
            return true
        }
    }

}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        MyCalendarView(observer: SpaceDataStore(), isPresented: .constant(false), dateSelected: .constant(Date.now))
    }
}
