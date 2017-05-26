package com.foodanalysis.data.access.exception;

public class DataAccessException extends Exception {

  private static final long serialVersionUID = 1L;

  public DataAccessException() {}

  public DataAccessException(String message) {
    super(message);
  }

  public DataAccessException(Exception e) {
    super(e);
  }

  public DataAccessException(String message, Exception e) {
    super(message, e);
  }

}
