const moment = require("moment");

module.exports = {
  "json": function (context) {
    return JSON.stringify(context);
  },
  "concat": function (...args) {
    return args.slice(0, -1).join("");
  },
  eq: function (v1, v2) {
    return v1 === v2;
  },
  ne: function (v1, v2) {
    return v1 !== v2;
  },
  lt: function (v1, v2) {
    return v1 < v2;
  },
  gt: function (v1, v2) {
    return v1 > v2;
  },
  lte: function (v1, v2) {
    return v1 <= v2;
  },
  gte: function (v1, v2) {
    return v1 >= v2;
  },
  and: function () {
    return Array.prototype.slice.call(arguments).every(Boolean);
  },
  or: function () {
    return Array.prototype.slice.call(arguments, 0, -1).some(Boolean);
  },
  toHumanTime: function (timestamp, options) {
    const unixts = +timestamp.split(".")[0];
    return moment.unix(unixts).format("h:mm A");
  }
};
