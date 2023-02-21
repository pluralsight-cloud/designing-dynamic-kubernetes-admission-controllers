const express = require('express');
const https = require('https');
const fs = require('fs');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());
const port = 8443;

const options = { 
  ca: fs.readFileSync('ca.crt'), 
  cert: fs.readFileSync('server.crt'), 
  key: fs.readFileSync('server.key'), 
}; 

app.post('/', (req, res) => {
  if (req.body.request === undefined || req.body.request.uid === undefined) {
    res.status(400).send();
    return;
  }

  console.log(req.body);

  const uid = req.body.request.uid;

  res.send({
      apiVersion: 'admission.k8s.io/v1',
      kind: 'AdmissionReview',
      response: {
	  uid: uid,
	  allowed: true,
	  patchType: "JSONPatch",
	  patch: "W3sib3AiOiAiYWRkIiwgInBhdGgiOiAiL21ldGFkYXRhL2xhYmVscyIsICJ2YWx1ZSI6IHsiZW52IjogImRldiJ9fV0K",
      },
  });
});

const server = https.createServer(options, app);

server.listen(port, () => {
  console.log(`Admission controller webhook "image check" running on port ${port}/`);
});
