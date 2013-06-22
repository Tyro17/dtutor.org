import vibe.d;

void index(HTTPServerRequest req, HTTPServerResponse res)
{
	res.renderCompat!("index.dt", HTTPServerRequest, "req")(req);

	// not recommended alternative, may cause memory corruption due to a DMD bug
	//res.render!("index.dt", req);
}

shared static this()
{
	auto router = new URLRouter;
	router.get("/", &index);

	auto settings = new HTTPServerSettings;
	settings.port = 32705;

	listenHTTP(settings, router);
}
