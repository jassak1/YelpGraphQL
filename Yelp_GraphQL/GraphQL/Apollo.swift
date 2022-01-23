//
//  Apollo.swift
//  Yelp_GraphQL
//
//  Created by Adam Jassak on 22/01/2022.
//

import Foundation
import SwiftUI
import Apollo


class Network {
    static let shared = Network()
    
    private(set) lazy var apollo = {() -> ApolloClient in
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        
        let client = URLSessionClient()
        let provider = NetworkInterceptorProvider(client: client, store: store)
        let url = URL(string: "https://api.yelp.com/v3/graphql")!
        
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
        return ApolloClient(networkTransport: requestChainTransport, store: store)
    }()
}


class NetworkInterceptorProvider: DefaultInterceptorProvider {
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        var interceptors = super.interceptors(for: operation)
        interceptors[0] = UserManagementInterceptor()
        return interceptors
    }
}

struct UserManagementInterceptor: ApolloInterceptor {
    func interceptAsync<Operation>(chain: RequestChain, request: HTTPRequest<Operation>, response: HTTPResponse<Operation>?, completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) where Operation : GraphQLOperation {
        request.addHeader(name: "Authorization", value: "YOUR_TOKEN_GOES_HERE")
        request.addHeader(name: "Accept-Language", value: "en-US")
        chain.proceedAsync(request: request, response: response, completion: completion)
    }
}

