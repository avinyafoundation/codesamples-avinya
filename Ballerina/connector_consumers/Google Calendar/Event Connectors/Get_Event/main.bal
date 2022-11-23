import ballerina/log;
import ballerinax/googleapis.calendar;

configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string refreshToken = ?;
configurable string refreshUrl = ?;
configurable string calendarId = "43v5o118g0f6ioj1mku4t5ugbc@group.calendar.google.com";
configurable string eventId = "mpueicr0cgd7uvjk7s1ug9k314";

public function main() returns error? {
  
    calendar:ConnectionConfig config = {
        auth: {
            clientId: clientId,
            clientSecret: clientSecret,
            refreshToken: refreshToken,
            refreshUrl: refreshUrl
        }
    };
    calendar:Client calendarClient = check new (config);

    calendar:Event|error res = calendarClient->getEvent(calendarId, eventId);
    if (res is calendar:Event) {
        log:printInfo(res.id);
    } else {
        log:printError(res.message());
    }
}