public with sharing class House {
    @AuraEnabled
    public static String getFields() {
        Http http = new Http();

HttpRequest request = new HttpRequest();
request.setEndpoint('https://api.spoonacular.com/recipes/random?apiKey=78ceb783cad6489498600dee3236639e');
request.setMethod('GET');

HttpResponse response = http.send(request);
String responseBody = '';
 System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
if(response.getStatusCode() == 200) {

    System.debug(response.getBody());
      responseBody = response.getBody();
    List<String> responseLines = responseBody.split('\n');

    // Process or log each line separately
    System.debug('Received the following response body:');
    for (String line : responseLines) {
        System.debug(line);
               }
            }
            return responseBody;
    }
}
