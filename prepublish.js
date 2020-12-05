// rescript lib doesn't like gentypeconfig
// so need to remove before publishing
const fs = require("fs");

const content = fs.readFileSync("./bsconfig.json");
fs.writeFileSync("./bsconfig.json.bak", content);

const contentJson = JSON.parse(content.toString());
delete contentJson["gentypeconfig"];
fs.writeFileSync("./bsconfig.json", JSON.stringify(contentJson, null, 2));
