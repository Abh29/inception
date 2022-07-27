var express = require("express");
 
var app = express();


app.use(express.static('public'));

//make way for some custom css, js and images
app.use('/css', express.static(__dirname + '/public/css'));
app.use('/js', express.static(__dirname + '/public/js'));
app.use('/images', express.static(__dirname + '/public/images'));

var server = app.listen(8081, function(){
    var port = server.address().port;
    console.log("Server started at http://localhost:%s", port);
});

// const http = require("http");


// app.use(express.static('public'));

// //make way for some custom css, js and images
// app.use('/css', express.static(__dirname + '/public/css'));
// app.use('/js', express.static(__dirname + '/public/js'));
// app.use('/images', express.static(__dirname + '/public/images'));

// const server = http.createServer((req, res) => {
//   const urlPath = req.url;
//   if (urlPath === "/overview") {
//     res.end('Welcome to the "overview page" of the nginX project');
//   } else if (urlPath === "/api") {
//     res.writeHead(200, { "Content-Type": "application/json" });
//     res.end(
//       JSON.stringify({
//         product_id: "xyz12u3",
//         product_name: "NginX injector",
//       })
//     );
//   } else {
//     res.end("Successfully started a server");
//   }
// });

// server.listen(8081, "localhost", () => {
//   console.log("Listening for request");
// });
