package com.foodanalysis.biz.exception;

public class BusinessServiceException extends Exception {

  private static final long serialVersionUID = 1L;

  public BusinessServiceException() {}

  public BusinessServiceException(String message) {
    super(message);
  }

  public BusinessServiceException(Exception e) {
    super(e);
  }

  public BusinessServiceException(String message, Exception e) {
    super(message, e);
  }


}
