package com.foodanalysis.data.access.impl;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foodanalysis.data.access.DataRetriver;
import com.foodanalysis.data.access.exception.DataAccessException;

@Repository
@SuppressWarnings("unchecked")
public class DataRetriverImpl implements DataRetriver {

  private static Logger logger = Logger.getLogger(DataRetriverImpl.class);

  @Autowired
  private SessionFactory sessionFactory;


  public <E> List<E> retrieveByHQL(String queryString) throws DataAccessException {
    List<E> list = null;
    try {
      list = sessionFactory.getCurrentSession().createQuery(queryString).list();
      logger.info("data retrieval success..");
    } catch (Exception e) {
      logger.error(e.getMessage(), e);
      throw new DataAccessException(e.getMessage(), e);
    }
    return list;
  }


  @Override
  public <E> List<E> retrieveByHQL(String queryString, Map<String, Object> params)
      throws DataAccessException {
    List<E> list = null;
    try {
      Query query = sessionFactory.getCurrentSession().createQuery(queryString);
      params.forEach(query::setParameter);
      list = query.list();
      logger.info("data retrieval success..");
    } catch (Exception e) {
      logger.error(e.getMessage(), e);
      throw new DataAccessException(e.getMessage(), e);
    }
    return list;
  }


  @Override
  public <T> T retrieveObjectByHQL(String queryString, Map<String, Object> params)
      throws DataAccessException {
    T t = null;
    try {
      Query query = sessionFactory.getCurrentSession().createQuery(queryString);
      params.forEach(query::setParameter);
      t = (T) query.uniqueResult();
      logger.info("data retrieval success..");
    } catch (Exception e) {
      logger.error(e.getMessage(), e);
      throw new DataAccessException(e.getMessage(), e);
    }
    return t;
  }

}
