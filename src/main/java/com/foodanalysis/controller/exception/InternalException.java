package com.foodanalysis.controller.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
public class InternalException extends RuntimeException {


  private static final long serialVersionUID = 1L;

  public InternalException() {}

  public InternalException(String message) {
    super(message);
  }

  public InternalException(Exception e) {
    super(e);
  }

  public InternalException(String message, Exception e) {
    super(message, e);
  }



}
