const express = require("express");

const app = express();

app.use("/", (req, res) => res.send("API Running"));

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Server started on port ${PORT}`);
});

//test
