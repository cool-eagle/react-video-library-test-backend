const express = require("express");
const cors = require("cors");

const app = express()

app.use(cors());

app.get('/', (req, res) => {
  res.json({message: "Backend is working!"})
})

const PORT = 3100;
app.listen(PORT, () => {
  console.log(`Server is running at ${PORT} port`)
})