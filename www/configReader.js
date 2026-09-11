var exec = require("cordova/exec");

var ConfigReader = {
  /**
   * Legge una preference da config.xml
   * @param {string} key - nome della preference (case sensitive su Android, lowercase forzato su iOS internamente)
   * @param {function} successCallback - riceve il valore (string)
   * @param {function} errorCallback - riceve l'errore
   */
  getPreference: function (key, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ConfigReader", "getPreference", [key]);
  },
};

module.exports = ConfigReader;
