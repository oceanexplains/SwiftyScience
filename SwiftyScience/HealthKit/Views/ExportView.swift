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
    
    @StateObject var manager: HealthKitManager = HealthKitManager()
    
    var body: some View {
        VStack {
            Button("Print List") {
                print(manager.exportedProperties)
            }
            Spacer()
            Button {
                exportHealthData(manager: manager)
            } label: {
                Text("Export Step Data")
            }
//            PermissionButton()
            Button(action: {
                let typesToRead: Set<HKObjectType> = manager.unionOfHealthKitTypes([
                    manager.healthKitActivityTypesToRead,
                    manager.healthKitCharacteristicTypesToRead,
                    manager.healthKitSleepTypesToRead,
                    manager.healthKitReproductiveHealthTypesToRead,
                    manager.healthKitHearingTypesToRead,
                    manager.healthKitVitalSignsTypesToRead,
                    manager.healthKitMobilityTypesToRead,
                    manager.healthKitHearingTypesToRead,
                    manager.healthKitHearingEventsToRead,
                    manager.healthKitReproductiveTypesToRead,
                    manager.healthKitBodyMeasurementTypesToRead,
                    manager.healthKitSleepTypesToRead,
                    manager.healthKitUVExposureTypesToRead,
                    manager.healthKitAlcoholConsumptionTypesToRead,
                    manager.healthKitNutritionTypesToRead,
                    manager.healthKitDivingTypesToRead,
                    manager.healthKitSymptomsToRead,
                    manager.healthKitLabAndTestResultTypesToRead
                ])//, manager.healthKitSymptomsTypesToRead, manager.healthKitMindfulnessAndSleepTypesToRead, manager.healthKitSelfCareTypesToRead])
                manager.requestAuthorization(for: typesToRead)
            }) {
                Text("Request Permission")
            }

            HealthKitPreferencesView(manager: manager)
        }
    }
    
    
    
    //MARK: Second
    func exportHealthData(manager: HealthKitManager) {
        let healthStore = HKHealthStore()

        var sampleTypes = Set<HKSampleType>()
        for property in manager.exportedProperties {
            if let sampleType = property as? HKSampleType {
                sampleTypes.insert(sampleType)
            }
        }


        let startDate = Date.distantPast
        let endDate = Date()

        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)

        let query = HKSampleQuery(sampleType: HKQuantityType.quantityType(forIdentifier: .stepCount)!,
                                      predicate: predicate,
                                      limit: HKObjectQueryNoLimit,
                                      sortDescriptors: nil) { (query, results, error) in

            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }

            if let results = results {

                var csvText = ""
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

                for result in results {
                    if let quantitySample = result as? HKQuantitySample {
                        let date = dateFormatter.string(from: quantitySample.startDate)
                        let quantity = quantitySample.quantity
                        let unit = HKUnit(from: quantitySample.metadata?[HKMetadataKeyWasUserEntered] as? Bool == true ? "count" : "count/min")
                        let value = quantity.doubleValue(for: unit)
                        let newLine = "\(date),\(value)\n"
                        csvText.append(newLine)
                    } else if let categorySample = result as? HKCategorySample {
                        let date = dateFormatter.string(from: categorySample.startDate)
                        let value = categorySample.value == 0 ? "No" : "Yes"
                        let newLine = "\(date),\(value)\n"
                        csvText.append(newLine)
                    }
                }

                if !csvText.isEmpty {
                    let fileName = "health-data.csv"
                    let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)

                    do {
                        try csvText.write(to: path!, atomically: true, encoding: String.Encoding.utf8)

                        let vc = UIActivityViewController(activityItems: [path!], applicationActivities: [])
                        DispatchQueue.main.async {
                            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                                let window = windowScene.windows.first {
                                window.rootViewController?.present(vc, animated: true, completion: nil)
                            }
                        }
                    } catch {
                        print("Error writing CSV file.")
                    }
                }
            }
        }

        healthStore.execute(query)
    }
//MARK: original
    func exportStepData() {
        let healthStore = HKHealthStore()

        let stepCountType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let startDate = Date.distantPast
        let endDate = Date()

        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)


        let query = HKSampleQuery(sampleType: stepCountType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, results, error) in


            if let error = error {
                print("Error fetching step count data: \(error.localizedDescription)")
                return
            }

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
                    print("trying to write")
                    try csvText.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
                    let vc = UIActivityViewController(activityItems: [path!], applicationActivities: [])
                    DispatchQueue.main.async {
                        // code that interacts with UI elements goes here
                        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                           let window = windowScene.windows.first {
                               window.rootViewController?.present(vc, animated: true, completion: nil)
                        }

                    }


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


import SwiftUI
import HealthKit

struct PermissionButton: View {
    
    let healthStore = HKHealthStore()
    let dataTypesToRead: Set<HKObjectType> = [HKObjectType.quantityType(forIdentifier: .stepCount)!, HKObjectType.quantityType(forIdentifier: .heartRate)!]
    let dataTypesToWrite: Set<HKSampleType> = []
    
    var body: some View {
        Button(action: {
            self.requestPermissions()
        }) {
            Text("Request HealthKit Permissions")
        }
    }
    
    func requestPermissions() {
        healthStore.requestAuthorization(toShare: dataTypesToWrite, read: dataTypesToRead) { (success, error) in
            if success {
                print("HealthKit permissions granted.")
            } else {
                print("HealthKit permissions denied.")
            }
        }
    }
}
