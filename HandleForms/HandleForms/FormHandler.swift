//
//  FormHandler.swift
//  Upload Enumerator
//
//  Created by Ryan Collins on 5/9/16.
//  Copyright © 2016 PerfectlySoft. All rights reserved.
//

import Foundation
import PerfectLib

public func PerfectServerModuleInit() {
    
    PageHandlerRegistry.addPageHandler("FormHandler") {
        (r:WebResponse) -> PageHandler in return FormHandler()
    }
    
}

class FormHandler: PageHandler {
    
    func valuesForResponse(context: MustacheEvaluationContext, collector: MustacheEvaluationOutputCollector) throws -> MustacheEvaluationContext.MapType {
        
        print("UploadHandler got request")
        
        var values = MustacheEvaluationContext.MapType()
        
        if let request = context.webRequest {
            
            // Grab the regular form parameters
            let params = request.params()
            if params?.count > 0 {
                var ary = [[String:Any]]()
                
                for (name, value) in params! {
                    ary.append([
                        "paramName":name,
                        "paramValue":value
                        ])
                }
                values["params"] = ary
                values["paramsCount"] = ary.count
            }
        }
        values["title"] = "Form Handler Example"
        return values
    }
}
