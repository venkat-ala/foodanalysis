package com.foodanalysis.data.exception;

public class DataServiceException extends Exception {

  private static final long serialVersionUID = 1L;

  public DataServiceException() {
    super();
  }

  public DataServiceException(String msg, Exception exception) {
    super(msg, exception);
  }

  public DataServiceException(Exception exception) {
    super(exception);
  }

  public DataServiceException(String message) {
    super(message);
  }



}
