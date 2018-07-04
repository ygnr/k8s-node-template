var http = require('http');

var PORT = 5000;
var server = http.createServer(function(req, res){
	var returnString = `Hello world, current date is ${new Date().toISOString()}`;
	res.end(returnString);
});

console.log(`Starting server on ${PORT}`);
server.listen(PORT);
