// const createProxyMiddleware = require("http-proxy-middleware");
// module.exports = app => {
//     app.use(
//         '/api',
//         createProxyMiddleware(
//             "/review",
//             {
//                 target: "http://localhost:8080",
//                 changeOrigin: true,
//                 // ws: true,
//                 // router: {
//                 //   "/socket.io": "ws://{서버 엔드포인트 주소}"
//                 // }
//             }
//         )
//     )
// }