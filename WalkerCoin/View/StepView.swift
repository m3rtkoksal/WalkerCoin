//
//  ContentView.swift
//  WalkerCoin
//
//  Created by Mert Köksal on 22.10.2020.
//

import SwiftUI
import HealthKit

struct StepView: View {
    private var healthStore: HealthStore?
    @State private var selectedDay = Step(count: 0, date: Date())
    @State private var steps: [Step] = [Step]()
    init() {
        healthStore = HealthStore()
    }
    private func updateUIFromStatistics(_ statisticsCollection: HKStatisticsCollection) {
        steps = []
        let now = Date()
        let startDate = Calendar.current.date(byAdding: .day, value: -14, to: Date())!
        statisticsCollection.enumerateStatistics(from: startDate, to: now) { (statistics, stop) in
            let count = statistics.sumQuantity()?.doubleValue(for: .count())
            let step = Step(count: Int(count ?? 0), date: statistics.startDate)
            steps.append(step)
        }
    }
    var body: some View {
        ZStack(alignment: .leading) {
                Image("stepsTabBG")
                    .resizable()
                    .ignoresSafeArea(.all)
                VStack {
                    HStack {
                        ScrollView(.horizontal) {
                            HStack(spacing: 30) {
                                ForEach(steps, id: \.id) { day in
                                    Text("\(Calendar.current.dateComponents([.day], from: day.date).day!)")
                                        .onTapGesture {
                                            selectedDay = day
                                        }
                                }
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width / 2)
                        .padding(10)
                        Spacer()
                    }
                    CircularProgress(steps: selectedDay.count)
                    
//                    Text(selectedDay.date, style: .date)
//                        .font(Font.custom("SFCompactDisplay", size: 14))
//                        .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
//                        .padding()
                    
                    HStack {
                        Text("Min 500")
                            .padding()
                            .padding()
                        Text("Max 15000")
                    }
                    .font(Font.custom("SFCompactDisplay", size: 14))
                    .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                    Text("BLA BLA BLA")
                        .font(Font.custom("SFCompactDisplay-Bold", size: 34))
                        .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                        .padding()
                    Text("Bla bla bla")
                        .font(Font.custom("SFCompactDisplay", size: 14))
                        .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .navigationBarHidden(true)
            }
        .navigationBarHidden(true)
        .onAppear() {
            if let healthStore = healthStore {
                healthStore.requestAuthorization { (success) in
                    if success {
                        healthStore.calculateSteps { (statisticsCollection) in
                            if let statisticsCollection = statisticsCollection {
                                updateUIFromStatistics(statisticsCollection)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct Step_Previews: PreviewProvider {
    static var previews: some View {
        StepView()
    }
}
