Package.describe({
	name: 'rocketchat:ufsc',
	version: '0.0.1',
	summary: 'UFSC rules for Rocket.Chat',
	git: ''
});

Package.onUse(function(api) {
	api.versionsFrom('1.0');

	api.use([
		'coffeescript',
		'rocketchat:lib@0.0.1'
	]);

	api.addFiles('server.coffee', 'server');
});

Package.onTest(function(api) {

});
