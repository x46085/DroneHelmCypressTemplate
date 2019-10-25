var express		= require("express");
var app 		= express();
var bodyParser	= require("body-parser"); app.use(bodyParser.text({ type: '*/*', limit: '50mb' }));
var appPort = process.env.PORT || 8080;
var appHost = process.env.IP || 'localhost';

var server = require('http').createServer(app);

app.use(express.static(__dirname + '/'));

server.listen(appPort, function () {
	console.log('App listening at http://%s:%s', appHost, appPort);
});
