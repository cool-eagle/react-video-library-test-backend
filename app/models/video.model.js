const sql = require("./db");

const Video = function (video) {
  this.video_id = video.video_id;
  this.name = video.name;
  this.description = video.description;
  this.poster_path = video.poster_path;
  this.video_path = video.video_path;
};

Video.getAll = (result) => {
  sql.query("SELECT * FROM video", (err, res) => {
    if (err) {
      result(err, null);
      return;
    }
    if (res.length) {
      result(null, res);
      return;
    }

    result({ kind: "not_found" }, null);
  });
};

Video.getById = (id, result) => {
  sql.query("SELECT * FROM video WHERE video_id = ?", id, (err, res) => {
    if (err) {
      result(err, null);
      return;
    }
    if (res.length) {
      result(null, res);
      return;
    }

    result({ kind: "not_found" }, null);
  });
};

Video.getByCategory = (category, result) => {
  sql.query(
    "SELECT v.* FROM video v, video_genre vg WHERE v.video_id = vg.video_id and vg.genre_id = ?",
    category,
    (err, res) => {
      if (err) {
        result(err, null);
        return;
      }
      if (res.length) {
        result(null, res);
        return;
      }

      result({ kind: "not_found" }, null);
    }
  );
};
module.exports = Video;
