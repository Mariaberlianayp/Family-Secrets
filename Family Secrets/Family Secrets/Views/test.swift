//
//  test.swift
//  Family Secrets
//
//  Created by Sheren Emanuela on 25/04/23.
//

import SwiftUI

struct test: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Profile.entity(), sortDescriptors: []) var profile: FetchedResults<Profile>
    
    var body: some View {
        ForEach(profile, id: \.self) { profile in
            Text("\(profile.username! )")
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
