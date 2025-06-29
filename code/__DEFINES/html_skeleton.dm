/*
* Provides a default HTML Skeleton header
*/
#define HTML_SKELETON_HEADER(head, body) \
 "<!DOCTYPE html><html><head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'><meta http-equiv='X-UA-Compatible' content='IE=edge'>[head]</head><body>[body]</body></html>"

/*
* Provides a HTML title element
*/
#define HTML_SKELETON_TITLE(title, body) HTML_SKELETON_HEADER("<title>[title]</title>", body)

/*
* Wraps an HTML body in a default header
*/
#define HTML_SKELETON_BODY(body) HTML_SKELETON_HEADER("", body)
