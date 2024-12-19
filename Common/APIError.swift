//
//  APIError.swift
//  Tastify
//
//  Created by Achmad Rijalu on 18/12/24.
//


struct APIError: Error {
    let statusCode: Int
    let message: String
}
