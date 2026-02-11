

var medium = ctx.getParameterValueROAccess().getParameterStrValue("KW_MEDIUM");

if (eventTypeStr.equals("EVENT_TYPE_DOCUMENT")) {
	if (medium == "EMAIL") {
		// Active extensions:
		// - Mail Subject ==> get mail subject from document content
		// - Render MAIL Body Html ==> get html mail body
		// - Render MAIL Body Text ==> get txt mail body
		// Deactivated extensions:
		ctx.deactivateExtension("Render MAIL Attachments", null);
	}
	else if (medium == "EMAILATTACHMENT") {
		// Active extensions:
		// - Render MAIL Attachments ==> get pdf attachment
		// Deactivated extensions:
		ctx.deactivateExtension("Mail Subject", null);
		ctx.deactivateExtension("Render MAIL Body Html", null);
		ctx.deactivateExtension("Render MAIL Body Text", null);
	}
}
else if (eventTypeStr.equals("EVENT_TYPE_GROUP_START")) {
	if (medium != "EMAIL") {
		// Check that group begins with body
		throw "StackExtensionDocumentException: first document must be KW_MEDIUM = EMAIL. Is there something missing?";
	}
}
