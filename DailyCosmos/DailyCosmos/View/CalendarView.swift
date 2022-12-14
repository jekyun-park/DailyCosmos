//
//  CalendarView.swift
//  DailyCosmos
//
//  Created by 박제균 on 2022/12/15.
//

import SwiftUI

struct CalendarView: UIViewRepresentable {
    
    @Binding var selection: UICalendarSelection
    
    func makeUIView(context: UIViewRepresentableContext<CalendarView>) -> UICalendarView {
        let calendarView = UICalendarView()
        let gregorianCalendar = Calendar(identifier: .gregorian)
        calendarView.calendar = gregorianCalendar
        calendarView.tintColor = .systemMint
        calendarView.availableDateRange = DateInterval(start: .distantPast, end: .now)
        return calendarView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(selection: .constant(UICalendarSelection(self)))
    }
}
