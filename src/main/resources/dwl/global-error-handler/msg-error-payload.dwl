%dw 2.0
output application/json
---
{
	api: Mule::p('application.name') as String,
	env: Mule::p('mule.env') as String,
	response: 'Error',
	statusCode: vars.httpStatus as Number default 500,
	timestamp: now() as String,
	correlationId: correlationId,
	errorType: if(!isEmpty(vars.errorDetails)) ((vars.errorDetails.errorType.namespace default "") ++ ":" ++ (vars.errorDetails.errorType.identifier default "")) else ((error.errorType.namespace default "") ++ ":" ++ (error.errorType.identifier default "")),
	errorMessage: vars.errorDetails.description default error.description
}