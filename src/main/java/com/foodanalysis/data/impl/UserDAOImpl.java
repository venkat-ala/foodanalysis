package com.foodanalysis.data.impl;

import static org.apache.commons.lang3.StringUtils.isNotEmpty;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foodanalysis.data.UserDAO;
import com.foodanalysis.data.access.DataModifier;
import com.foodanalysis.data.access.DataRetriver;
import com.foodanalysis.data.access.exception.DuplicateRecordException;
import com.foodanalysis.data.exception.DataServiceException;
import com.foodanalysis.model.ContactUsInfo;
import com.foodanalysis.model.SearchItem;
import com.foodanalysis.model.User;

@Repository
public class UserDAOImpl implements UserDAO {
  @Autowired
  private DataRetriver dataRetriver;
  @Autowired
  private DataModifier dataModifier;

  public DataRetriver getDataRetriver() {
    return dataRetriver;
  }


  public void setDataRetriver(DataRetriver dataRetriver) {
    this.dataRetriver = dataRetriver;
  }

  public DataModifier getDataModifier() {
    return dataModifier;
  }


  public void setDataModifier(DataModifier dataModifier) {
    this.dataModifier = dataModifier;
  }


  @Override
  public void saveUser(User user) throws DataServiceException {
    try {
      dataModifier.insert(user);
    } catch (DuplicateRecordException de) {
      throw new DataServiceException("Email already exist.", de);
    } catch (Exception e) {
      throw new DataServiceException(e.getMessage(), e);
    }
  }


  @Override
  public User getUserByEmail(String email) throws DataServiceException {
    try {
      Map<String, Object> params = new HashMap<>();
      params.put("emailId", email);
      return dataRetriver.retrieveObjectByHQL("From User u where u.email=:emailId", params);
    } catch (Exception e) {
      throw new DataServiceException(e.getMessage(), e);
    }
  }


  @Override
  public User getUserById(int id) throws DataServiceException {
    try {
      Map<String, Object> params = new HashMap<>();
      params.put("id", id);
      return dataRetriver.retrieveObjectByHQL("From User u where u.id=:id", params);
    } catch (Exception e) {
      throw new DataServiceException(e.getMessage(), e);
    }
  }



  @Override
  public List<User> getAllUsers(User user) throws DataServiceException {
    try {
      Map<String, Object> params = new HashMap<>();
      params.put("userId", user.getId());
      return dataRetriver.retrieveByHQL("From User u where u.id!=:userId", params);
    } catch (Exception e) {
      throw new DataServiceException(e.getMessage(), e);
    }
  }


  @Override
  public List<ContactUsInfo> getAllContactUsInfo() throws DataServiceException {
    try {
      return dataRetriver.retrieveByHQL("From ContactUsInfo u");
    } catch (Exception e) {
      throw new DataServiceException(e.getMessage(), e);
    }
  }


  @Override
  public Object[] getSearchItems(String search, String search2) throws DataServiceException {
    Object[] res = new Object[2];
    try {
      Map<String, Object> params = new HashMap<>();
      params.put("search", "%" + search + "%");
      List<SearchItem> s1 =
          dataRetriver.retrieveByHQL("From SearchItem s where s.name like :search ", params);
      res[0] = s1;
      if (isNotEmpty(search2)) {
        params = new HashMap<>();
        params.put("search", "%" + search2 + "%");
        List<SearchItem> s2 =
            dataRetriver.retrieveByHQL("From SearchItem s where s.name like :search ", params);
        res[1] = s2;
      }
    } catch (Exception e) {
      throw new DataServiceException(e.getMessage(), e);
    }
    return res;
  }


  @Override
  public List<SearchItem> getAllFoodItems() throws DataServiceException {
    List<SearchItem> searchItems = null;
    try {
      searchItems = dataRetriver.retrieveByHQL("From SearchItem s ");
    } catch (Exception e) {
      throw new DataServiceException(e.getMessage(), e);
    }
    return searchItems;
  }


  @Override
  public void deleteFoodItem(int itemId) throws DataServiceException {
    try {
      Map<String, Object> params = new HashMap<>();
      params.put("itemId", itemId);
      dataModifier.executeQuery("delete from SearchItem si where si.id=:itemId", params);
    } catch (Exception e) {
      throw new DataServiceException(e.getMessage(), e);
    }
  }


  @Override
  public SearchItem getFoodItemById(int id) throws DataServiceException {
    try {
      Map<String, Object> params = new HashMap<>();
      params.put("id", id);
      return dataRetriver.retrieveObjectByHQL("From SearchItem u where u.id=:id", params);
    } catch (Exception e) {
      throw new DataServiceException(e.getMessage(), e);
    }
  }


  @Override
  public void saveFoodItem(SearchItem searchItem) throws DataServiceException {
    try {
      dataModifier.insert(searchItem);
    } catch (DuplicateRecordException de) {
      throw new DataServiceException("Email already exist.", de);
    } catch (Exception e) {
      throw new DataServiceException(e.getMessage(), e);
    }
  }


}
