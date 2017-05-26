package com.foodanalysis.data.access;

import java.util.List;
import java.util.Map;

import com.foodanalysis.data.access.exception.DataAccessException;

public interface DataRetriver {

  public <E> List<E> retrieveByHQL(String query) throws DataAccessException;

  public <E> List<E> retrieveByHQL(String query, Map<String, Object> params)
      throws DataAccessException;

  <T> T retrieveObjectByHQL(String queryString, Map<String, Object> params)
      throws DataAccessException;

}
