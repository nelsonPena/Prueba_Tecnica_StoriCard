//
//  URLSessionHTTPCLient.swift
//  images
//
//  Created by Nelson Geovanny Pena Agudelo on 14/10/23.
//

import Foundation

/// `URLSessionHTTPCLient` es una implementación de un cliente HTTP que utiliza la API URLSession de Foundation para realizar solicitudes HTTP.

class URLSessionAsyncHTTPCLient: HttpClient {
    
    /// Configura y devuelve una instancia de URLSession personalizada.
    ///
    /// Esta función crea una configuración de sesión con valores predeterminados, establece los intervalos de tiempo de espera para las solicitudes y los recursos,
    /// y devuelve una instancia de URLSession con la configuración proporcionada, delegado y cola de delegado.
    ///

    private let requestMaker: UrlSessionRequestMaker
    private let errorResolver: URLSessionErrorResolver
    
    /// Inicializa una nueva instancia de `URLSessionHTTPCLient` con las dependencias necesarias.
    ///
    /// - Parameters:
    ///   - requestMaker: Un creador de solicitudes personalizado.
    ///   - errorResolver: Un resolutor de errores personalizado.
    init(requestMaker: UrlSessionRequestMaker,
         errorResolver: URLSessionErrorResolver) {
        self.requestMaker = requestMaker
        self.errorResolver = errorResolver
    }
    
    /// Realiza una solicitud HTTP GET y devuelve una respuesta decodificada de tipo genérico utilizando async/await.
    ///
    /// - Parameters:
    ///   - requestModel: El modelo de la solicitud.
    ///
    /// - Returns: Una respuesta decodificada de tipo genérico o lanza un error de `HttpClientError`.
    func makeRequest<T: Decodable>(requestModel: RequestEntity) async throws -> T  {
        
        guard let url = self.requestMaker.urlRequest(requestModel: requestModel) else {
            throw HttpClientError.badURL
        }

        let timeStart = DispatchTime.now()
        print("URL: \(url)")

        do {
            let (data, response) = try await URLSession.shared.data(for: url)
            
            let timeStop = DispatchTime.now()
            let waitTime = timeStop.uptimeNanoseconds - timeStart.uptimeNanoseconds
            let totalTime = Double(waitTime) / 1_000_000 // Convertir nanosegundos a milisegundos

            guard let httpResponse = response as? HTTPURLResponse else {
                throw HttpClientError.badURL
            }

            guard httpResponse.statusCode == 200 else {
                throw self.errorResolver.resolve(statusCode: httpResponse.statusCode)
            }

            let responseString = String(data: data, encoding: .utf8) ?? "No read response JSON"
            print("""
                  Response: \(responseString)
                  """)

            let messageLogs = """
                              ******************** Response ********************
                              URL: \(url)
                              EndPoint \(requestModel.endPoint)
                              Headers \(requestModel.headers)
                              Body \(requestModel.body ?? ["": ""])
                              time Start \(timeStart)
                              time Stop \(timeStop)
                              lat: \(totalTime)
                              response: \(responseString)
                              ******************** Response ********************
                              """
            print(messageLogs)

            let decodedObject = try JSONDecoder().decode(T.self, from: data)
            return decodedObject
            
        } catch {
            if let urLError = error as? URLError, urLError.code == .timedOut {
                throw HttpClientError.timeOut
            } else if let decodingError = error as? DecodingError {
                print("Decoding error: \(decodingError)")
                throw HttpClientError.parsingError
            } else {
                throw error
            }
        }
    }
}
