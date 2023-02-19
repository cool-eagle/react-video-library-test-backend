const Video = require("../models/video.model");

exports.getByCategory = (req, res) => {
  const category = req.query.category;
  if (!category) {
    Video.getAll((err, data) => {
      if (err) {
        if (err.kind === "not_found") {
          res.status(200).send({
            message: "Not found any video",
          });
        } else {
          res.status(500).send({
            message: "Server error",
          });
        }
      } else res.status(200).send({ data });
    });
  } else {
    Video.getByCategory(category, (err, data) => {
      if (err) {
        if (err.kind === "not_found") {
          res.status(200).send({
            message: `Not found video with category ${category}`,
          });
        } else {
          res.status(500).send({
            message: `Server error with category ${category}` + err,
          });
        }
      } else res.status(200).send({ data });
    });
  }
};

exports.getById = (req, res) => {
  const id = req.params.id;
  Video.getById(id, (err, data) => {
    if (err) {
      if (err.kind === "not_found") {
        res.status(200).send({
          message: `Not found video with id ${id}`,
        });
      } else {
        res.status(500).send({
          message: `Server error with id ${id}` + err,
        });
      }
    } else res.status(200).send({ data });
  });
};
exports.getByIdCategory = (req, res) => {
  const id = req.params.id;
  Video.getByIdCategory(id, (err, data) => {
    if (err) {
      if (err.kind === "not_found") {
        res.status(200).send({
          message: `Not found video with id ${id}`,
        });
      } else {
        res.status(500).send({
          message: `Server error with id ${id}` + err,
        });
      }
    } else res.status(200).send({ data });
  });
};

exports.deleteById = (req, res) => {
  const id = req.params.id;
  Video.deleteById(id, (err, data) => {
    if (err) {
      if (err.kind === "not_found") {
        res.status(200).send({
          message: `Not found video with id ${id}`,
        });
      } else {
        res.status(500).send({
          message: `Server error with id ${id}` + err,
        });
      }
    } else {
      res.status(204).send();
    }
  });
};

exports.addVideo = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty",
    });
  } else {
    const video = new Video(req.body);
    Video.getById(video.video_id, (err, data) => {
      if (!err) {
        res.status(200).send({ message: "This video already exist" });
      } else if (err.kind === "not_found") {
        Video.addVideo(video, (e, addData) => {
          if (e) {
            res.status(500).send({
              message: `Server error: ` + e,
            });
            console.log("e: ", e);
          } else {
            const category = req.body.category;
            if (category.length > 0) {
              for (const item of category) {
                Video.addVideoGenre(
                  [video.video_id, item],
                  (error, addVideoGenreData) => {
                    console.log("error: ", error);
                  }
                );
              }
            }
            res.status(201).send({ addData });
          }
        });
      }
    });
  }
};

exports.updateVideo = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty",
    });
  } else {
    const video = new Video(req.body);
    Video.deleteById(video.video_id, (err, data) => {
      if (err) {
        if (err.kind === "not_found") {
          res.status(200).send({
            message: `Not found video with id ${id}`,
          });
        } else {
          res.status(500).send({
            message: `Server error with id ${id}` + err,
          });
        }
      } else {
        Video.addVideo(video, (e, addData) => {
          if (e) {
            res.status(500).send({
              message: `Server error: ` + e,
            });
            console.log("e: ", e);
          } else {
            const category = req.body.category;
            if (category.length > 0) {
              for (const item of category) {
                Video.addVideoGenre(
                  [video.video_id, item],
                  (error, addVideoGenreData) => {
                    console.log("error: ", error);
                  }
                );
              }
            }
            res.status(201).send({ addData });
          }
        });
      }
    });
  }
};
