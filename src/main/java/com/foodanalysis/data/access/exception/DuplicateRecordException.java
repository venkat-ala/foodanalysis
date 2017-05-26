package com.foodanalysis.data.access.exception;

public class DuplicateRecordException extends DataAccessException {

  private static final long serialVersionUID = 1L;

  public DuplicateRecordException() {}

  public DuplicateRecordException(String message) {
    super(message);
  }

  public DuplicateRecordException(Exception e) {
    super(e);
  }

  public DuplicateRecordException(String message, Exception e) {
    super(message, e);
  }

}
