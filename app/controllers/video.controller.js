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
