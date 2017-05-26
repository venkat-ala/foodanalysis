package com.foodanalysis.data.access;

import java.util.Map;

import com.foodanalysis.data.access.exception.DataAccessException;

public interface DataModifier {

  public <T> T insert(T t) throws DataAccessException;

  Integer executeQuery(String queryString, Map<String, Object> params) throws DataAccessException;
}
