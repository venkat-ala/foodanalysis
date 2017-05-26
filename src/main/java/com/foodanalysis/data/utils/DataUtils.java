package com.foodanalysis.data.utils;

import java.util.Locale;
import java.util.ResourceBundle;

import org.apache.log4j.Logger;

public class DataUtils {
  private static Logger logger = Logger.getLogger(DataUtils.class);

  private DataUtils() {}

  public static String getPropertyMessage(String key) {
    String msg = key;
    try {
      ResourceBundle resourceBundle =
          ResourceBundle.getBundle("com.foodanalysis.data.utils.dataMessage", new Locale("en"));
      msg = resourceBundle.getString(key);
      logger.info(String.format("Key retrived sucessfully, for the key %s", key));
    } catch (NullPointerException e) {
      logger.error(String.format("Key not found , the key is", key), e);
    } catch (Exception e) {
      logger.error(e.getMessage(), e);
    }
    return msg;
  }
}
