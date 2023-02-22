//
//  ExportView.swift
//  SwiftyScience
//
//  Created by Tomer Zilbershtein on 2/22/23.
//

import SwiftUI
import HealthKit
import HealthKitUI

struct ExportView: View {
    var body: some View {
        Button(action: exportStepData) {
            Text("Export Step Data")
        }
    }

    func exportStepData() {
        let healthStore = HKHealthStore()

        let stepCountType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let startDate = Date.distantPast
        let endDate = Date()

        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)

        let query = HKSampleQuery(sampleType: stepCountType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, results, error) in
            if let results = results as? [HKQuantitySample] {
                let fileName = "step-count.csv"
                let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
                var csvText = "Date,Step Count\n"
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

                for result in results {
                    let date = dateFormatter.string(from: result.startDate)
                    let stepCount = result.quantity.doubleValue(for: HKUnit.count())
                    let newLine = "\(date),\(stepCount)\n"
                    csvText.append(newLine)
                }

                do {
                    try csvText.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
                    let vc = UIActivityViewController(activityItems: [path!], applicationActivities: [])
                    UIApplication.shared.windows.first?.rootViewController?.present(vc, animated: true, completion: nil)
                } catch {
                    print("Error writing CSV file.")
                }
            }

        }

        healthStore.execute(query)
    }

}


struct ExportView_Previews: PreviewProvider {
    static var previews: some View {
        ExportView()
    }
}
