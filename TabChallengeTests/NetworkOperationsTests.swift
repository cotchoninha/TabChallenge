//
//  NetworkOperationsTests.swift
//  TabChallengeTests
//
//  Created by Spare on 01/06/2020.
//  Copyright © 2020 Spare. All rights reserved.
//

import XCTest
@testable import TabChallenge

let jsonString = """
   {
   "case_studies": [
     {
       "id": 1,
       "client": "TfL",
       "teaser": "Testing Tube brakes, with TfL Decelerator",
       "vertical": "Public Sector",
       "is_enterprise": true,
       "title": "A World-First For Apple iPad",
       "hero_image": "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/decelerator_header-image-2x.jpg",
       "sections": [
         {
           "title": null,
           "body_elements": [
             "With 1.34 billion passengers a year, the Tube is an intrinsic part of London life. Any disruptions, however small, to this essential service can cause a ripple effect that is felt not just on the network, but across the city itself.",
             "Examples of this can be seen in surprising places. Take brake testing. Each time a Tube train is suspected of faulty brakes, it is removed from service to be tested. This is because, in order to see if brakes are working as intended, the existing testing technology requires the train to be brought to a complete stop. The Underground’s tight schedule means if the train were left in service during this process, severe delays would occur across the line.",
             "However, what if the train’s brakes turn out to be working just fine? Removing a train from service has still proved disruptive to passengers, and incurred costs for TfL. In 2015, over a quarter of Tube trains removed for testing on just three Underground lines were actually found to be fault-free. Scale this up across all lines, and the impact to both engineering time and lost passenger hours becomes a sizeable problem.",
             {
               "image_url": "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/decelerator_tube-2x.jpg"
             }
           ]
         },
         {
           "title": "Reimagining brake testing",
           "body_elements": [
             "Since 2014, Transport for London (TfL) and The App Business have been working together to find leaner, more efficient ways of working, with the help of mobile technology. The inefficiencies within the existing brake testing process made it a prime candidate for the programme.",
             "The joint team began with a bold hypothesis: could the in-built sensors within an Apple iPad, which can measure speed, pitch, roll and yaw, match the accuracy of existing testing methods? And, most importantly, could it be used on a train in service - reducing the costly need to remove it?",
             {
               "image_url": "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/decelerator_pitch-roll-2x.jpg"
             }
           ]
         },
         {
           "title": "Increasing speed-to-value",
           "body_elements": [
             "With such a bold hypothesis, it was important to first demonstrate the iPad could be a reliable replacement for existing testing technology. Over the course of just five days, The App Business’ engineering team conducted a technical proof-of-concept that demonstrably proved the iPad was up to the task.",
             "The successful, quickfire experiment brought early value and strengthened the business case for a new, more efficient mode of brake testing. With the theory validated, the team then moved from proof-of-concept code to a production-ready app, now called Decelerator, in six short weeks.",
             {
               "image_url": "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/decelerator_graph-2x.jpg"
             }
           ]
         },
         {
           "title": "Inspiring trust through design",
           "body_elements": [
             "The interface for Decelerator is about more than just good looks. The streamlined interface directs users efficiently through the app’s different stages: from set-up, to completing a brake test and sharing the results. Subtle, bespoke animations and interactions bring Decelerator to life, helping users to understand when to provide input, and how to interpret test results.",
             {
                 "image_url": "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/decelerator_devices-2x.png"
             },
             "The design of Decelerator required the team to build a deep understanding of the conditions in which the app would be used - something that would have been impossible without close collaboration with TfL staff, and in-situ user testing. This process revealed a wealth of invaluable insight that shaped the design of Decelerator.",
             "An early iteration of the interface, for example, incorporated a bright visual theme. This was popular with users but, when tested in context underground, created too much glare. This potentially hazardous problem was resolved quickly, thanks to the app’s centrally-defined visual styles. A darker, less distracting visual theme was adopted in a matter of minutes, ready for immediate testing.",
             {
                 "image_url": "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/decelerator_ipad-2x.jpg"
             },
             "Continuing TfL’s long history of global firsts and pioneering innovation, Train Decelerator is the first app of its kind - anywhere in the world. During 2017, it will be piloted across three underground lines and in Year One, aims to reduce the number of trains removed from service by a minimum of 75%. This will drive anticipated savings of £300,000 on these three lines alone - not to mention a dramatic reduction in Lost Customer Hours, a key metric for TfL.",
             "However, this is just the start of the potential savings Train Decelerator stands to make. Rolled out across the entire Underground network, and extended to other areas of transport, Train Decelerator has the capacity to save millions of pounds per year for TfL."
           ]
         }
       ]
     }
    }
"""

class NetworkOperationsTests: XCTestCase {
    
    var expectation: XCTestExpectation!
    let apiURL = URL(string: "https://www.test.com")!
    var networkOperations: NetworkOperations!
    let data = jsonString.data(using: .utf8)
    
    override func setUp() {
        expectation = expectation(description: "Expectation")
        let configuration = URLSessionConfiguration.default
//        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession.init(configuration: configuration)
        networkOperations = NetworkOperations(session: urlSession)
    }
    
    func testSuccessfulResponse() {
//        networkOperations.requestCaseStudies { (<#Projects?#>, <#Error?#>) in
//            <#code#>
//        }
    }
    
    //MARK: helpers
    
    func createMockReponse() -> Projects {
        Projects(caseStudies: [CaseStudy(id: 1, client: Optional("TfL"), teaser: "Testing Tube brakes, with TfL Decelerator", vertical: "Public Sector", isEnterprise: true, title: "A World-First For Apple iPad", heroImage: "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/decelerator_header-image-2x.jpg", sections: [TabChallenge.Section(title: nil, bodyElements: [TabChallenge.BodyElement.bodyText("With 1.34 billion passengers a year, the Tube is an intrinsic part of London life. Any disruptions, however small, to this essential service can cause a ripple effect that is felt not just on the network, but across the city itself."), TabChallenge.BodyElement.bodyText("Examples of this can be seen in surprising places. Take brake testing. Each time a Tube train is suspected of faulty brakes, it is removed from service to be tested. This is because, in order to see if brakes are working as intended, the existing testing technology requires the train to be brought to a complete stop. The Underground’s tight schedule means if the train were left in service during this process, severe delays would occur across the line."), TabChallenge.BodyElement.bodyText("However, what if the train’s brakes turn out to be working just fine? Removing a train from service has still proved disruptive to passengers, and incurred costs for TfL. In 2015, over a quarter of Tube trains removed for testing on just three Underground lines were actually found to be fault-free. Scale this up across all lines, and the impact to both engineering time and lost passenger hours becomes a sizeable problem."), TabChallenge.BodyElement.bodyImage(TabChallenge.BodyImage(imageURL: "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/decelerator_tube-2x.jpg"))]), TabChallenge.Section(title: Optional("Reimagining brake testing"), bodyElements: [TabChallenge.BodyElement.bodyText("Since 2014, Transport for London (TfL) and The App Business have been working together to find leaner, more efficient ways of working, with the help of mobile technology. The inefficiencies within the existing brake testing process made it a prime candidate for the programme."), TabChallenge.BodyElement.bodyText("The joint team began with a bold hypothesis: could the in-built sensors within an Apple iPad, which can measure speed, pitch, roll and yaw, match the accuracy of existing testing methods? And, most importantly, could it be used on a train in service - reducing the costly need to remove it?"), TabChallenge.BodyElement.bodyImage(TabChallenge.BodyImage(imageURL: "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/decelerator_pitch-roll-2x.jpg"))]), TabChallenge.Section(title: Optional("Increasing speed-to-value"), bodyElements: [TabChallenge.BodyElement.bodyText("With such a bold hypothesis, it was important to first demonstrate the iPad could be a reliable replacement for existing testing technology. Over the course of just five days, The App Business’ engineering team conducted a technical proof-of-concept that demonstrably proved the iPad was up to the task."), TabChallenge.BodyElement.bodyText("The successful, quickfire experiment brought early value and strengthened the business case for a new, more efficient mode of brake testing. With the theory validated, the team then moved from proof-of-concept code to a production-ready app, now called Decelerator, in six short weeks."), TabChallenge.BodyElement.bodyImage(TabChallenge.BodyImage(imageURL: "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/decelerator_graph-2x.jpg"))]), TabChallenge.Section(title: Optional("Inspiring trust through design"), bodyElements: [TabChallenge.BodyElement.bodyText("The interface for Decelerator is about more than just good looks. The streamlined interface directs users efficiently through the app’s different stages: from set-up, to completing a brake test and sharing the results. Subtle, bespoke animations and interactions bring Decelerator to life, helping users to understand when to provide input, and how to interpret test results."), TabChallenge.BodyElement.bodyImage(TabChallenge.BodyImage(imageURL: "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/decelerator_devices-2x.png")), TabChallenge.BodyElement.bodyText("The design of Decelerator required the team to build a deep understanding of the conditions in which the app would be used - something that would have been impossible without close collaboration with TfL staff, and in-situ user testing. This process revealed a wealth of invaluable insight that shaped the design of Decelerator."), TabChallenge.BodyElement.bodyText("An early iteration of the interface, for example, incorporated a bright visual theme. This was popular with users but, when tested in context underground, created too much glare. This potentially hazardous problem was resolved quickly, thanks to the app’s centrally-defined visual styles. A darker, less distracting visual theme was adopted in a matter of minutes, ready for immediate testing."), TabChallenge.BodyElement.bodyImage(TabChallenge.BodyImage(imageURL: "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/decelerator_ipad-2x.jpg")), TabChallenge.BodyElement.bodyText("Continuing TfL’s long history of global firsts and pioneering innovation, Train Decelerator is the first app of its kind - anywhere in the world. During 2017, it will be piloted across three underground lines and in Year One, aims to reduce the number of trains removed from service by a minimum of 75%. This will drive anticipated savings of £300,000 on these three lines alone - not to mention a dramatic reduction in Lost Customer Hours, a key metric for TfL."), TabChallenge.BodyElement.bodyText("However, this is just the start of the potential savings Train Decelerator stands to make. Rolled out across the entire Underground network, and extended to other areas of transport, Train Decelerator has the capacity to save millions of pounds per year for TfL.")])])])
    }
}
