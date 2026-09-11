package net.gamlab.utils;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPreferences;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Map;

public class ConfigReader extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) {
        try {
            CordovaPreferences preferences = this.preferences;

            if (action.equals("getPreference")) {
                String key = args.getString(0);
                String value = preferences.getString(key, null);
                if (value != null) {
                    callbackContext.success(value);
                } else {
                    callbackContext.error("Preference '" + key + "' non trovata in config.xml");
                }
                return true;
            }

            return false;
        } catch (JSONException e) {
            callbackContext.error("Errore parsing argomenti: " + e.getMessage());
            return false;
        }
    }
}