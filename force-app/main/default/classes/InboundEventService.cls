public class InboundEventService {
	public static String sendEvent(String jsonBody) {
        String endpoint = System.Url.getOrgDomainUrl().toExternalForm() + '/services/data/v62.0/connect/orchestration/inbound-events';

        //String jsonBody = '{"type": "AKASSETFAULT","eventData": "{\\"Event\\":[{\\"assetId\\":\\"02iB0000002WBFlIAO\\",\\"id\\":\\"02iB0000002WBFlIAO\\",\\"businessObjectType\\":\\"Asset\\",\\"signals\\":[{\\"thresholds\\":{\\"lower\\":\\"1500\\",\\"upper\\":\\"1880\\"}}]}]}"}';

        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('POST');
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        req.setHeader('Content-Type', 'application/json');
        req.setBody(jsonBody);

        Http http = new Http();
        HttpResponse res = http.send(req);

        // Check for successful response
        if (res.getStatusCode() == 201) {
            System.debug('success');
            return res.getBody();
        } else {
            // Log any errors for troubleshooting
            System.debug('Error: ' + res.getStatusCode() + ' ' + res.getStatus()+ '' + res.getBody() );
            return null;
        }
	}
} 