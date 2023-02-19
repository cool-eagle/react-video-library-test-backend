module.exports = (app) => {
  const video = require("../controllers/video.controller.js");

  app.post("/api/add", video.addVideo);
  app.post("/api/video", video.updateVideo);
  app.get("/api/video", video.getByCategory);
  app.get("/api/video/:id", video.getById);
  app.delete("/api/video/:id", video.deleteById);
  app.get("/api/category/:id", video.getByIdCategory);
};
