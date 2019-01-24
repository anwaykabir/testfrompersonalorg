public class AnimalLocator {
    public static string getAnimalNameById(Integer Id){
        Http http= new Http();
        HttpRequest request= new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+ Id);
        request.setMethod('GET');
        HttpResponse response= http.send(request);
        system.debug('response:'+response.getBody());
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        Map<String, Object> animal = (Map<String, Object>) results.get('animal');
        String AnimalName= string.valueof(animal.get('name'));
        system.debug('AnimalName:'+AnimalName);
        return AnimalName;
    }

}