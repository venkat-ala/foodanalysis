package com.foodanalysis.biz.utils;

import java.util.Locale;
import java.util.ResourceBundle;

import org.apache.log4j.Logger;

public class BusinessUtils {
  private static Logger logger = Logger.getLogger(BusinessUtils.class);

  private BusinessUtils() {}

  public static String getPropertyMessage(String key) {
    String msg = key;
    try {
      ResourceBundle resourceBundle =
          ResourceBundle.getBundle("com.foodanalysis.biz.utils.businessMesssage", new Locale("en"));
      msg = resourceBundle.getString(key);
      logger.info(String.format("value retrieved successfully for the key %s", key));
    } catch (NullPointerException e) {
      logger.error(String.format("key not found, the key is %s", key), e);
    } catch (Exception e) {
      logger.error(e.getMessage(), e);
    }
    return msg;
  }
}
