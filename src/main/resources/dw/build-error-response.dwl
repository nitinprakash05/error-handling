%dw 2.0
output application/json
---
{
	"correlationId": correlationId,
	"error":{
		"code": error.errorType.identifier,
		"timestamp": now() as String {format: "yyyy-MM-dd'T'HH:mm:ss"}
	},
	"type": (error.errorType.namespace default "" ++ ":" ++ error.errorType.identifier default ""),
	"description": error.description default "No description provided",
	"message": error.errorMessage default "Error occurred, No further business context available",
	"httpResponse":{
		"status": vars.httpStatus
	}
}