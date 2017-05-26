package com.foodanalysis.biz.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.foodanalysis.biz.UserService;
import com.foodanalysis.biz.exception.BusinessServiceException;
import com.foodanalysis.data.UserDAO;
import com.foodanalysis.data.exception.DataServiceException;
import com.foodanalysis.model.ContactUsInfo;
import com.foodanalysis.model.SearchItem;
import com.foodanalysis.model.User;

@Service
public class UserServiceImpl implements UserService {

  private static Logger logger = Logger.getLogger(UserServiceImpl.class);

  @Autowired
  private UserDAO userDAO;

  @Autowired
  private JavaMailSender mailSender;

  @Override
  public void doSaveUser(User user, String role) throws BusinessServiceException {
    try {
      user.setBmi(getBMI(user.getWeight(), user.getHeight()));
      if ("admin".equals(role)) {
        user.setRole("admin");
      } else
        user.setRole("user");
      userDAO.saveUser(user);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }

  }

  private Float getBMI(Integer weight, Integer height) {
    Float bmi = null;
    if (weight != null && height != null) {
      bmi = weight / (((float) height / 100) * ((float) height / 100));
      bmi = new BigDecimal(bmi).setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
    }
    return bmi;
  }

  @Override
  public User doAuthenticateUser(String email, String password, String dbaPassword, String role)
      throws BusinessServiceException {
    User user = null;
    try {
      user = userDAO.getUserByEmail(email);
      if (user == null) {
        throw new BusinessServiceException("Email is not registered");
      }
      if (user.getRole().equals("user") && role != null) {
        throw new BusinessServiceException("Invalid login");
      }
      if (user.getRole().equals("admin") && !user.getRole().equals(role)) {
        throw new BusinessServiceException("Invalid login");
      }
      if (!user.getPasswordString().equals(password)) {
        throw new BusinessServiceException("Invalid password");
      }
      if ("admin".equals(role) && (!user.getDbaPasswordString().equals(dbaPassword))) {
        throw new BusinessServiceException("Invalid DBA password");
      }
      if ("d".equals(user.getStatus())) {
        throw new BusinessServiceException("Account is inactive");
      }
      user.setLastLogin(new Date());
      userDAO.saveUser(user);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
    return user;
  }

  @Override
  public User doGetUserById(int id) throws BusinessServiceException {
    User user = null;
    try {
      user = userDAO.getUserById(id);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
    return user;
  }

  @Override
  public User doGetUserByEmail(String email) throws BusinessServiceException {
    User user = null;
    try {
      user = userDAO.getUserByEmail(email);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
    return user;
  }

  @Override
  public User doUpdateUser(User user) throws BusinessServiceException {
    try {
      User updateUser = userDAO.getUserById(user.getId());
      updateUser.setName(user.getName());
      updateUser.setAge(user.getAge());
      updateUser.setGender(user.getGender());
      updateUser.setAlergies(user.getAlergies());
      updateUser.setPhone(user.getPhone());
      updateUser.setWeight(user.getWeight());
      updateUser.setHeight(user.getHeight());
      updateUser.setFavFriendName(user.getFavFriendName());
      updateUser.setFavMovieName(user.getFavMovieName());
      updateUser.setBmi(getBMI(user.getWeight(), user.getHeight()));
      if (StringUtils.isNotEmpty(user.getStatus())) {
        updateUser.setStatus(user.getStatus());
      }
      updateUser.setLastUpdatedOn(new Date());
      userDAO.saveUser(updateUser);
      return updateUser;
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }

  }

  @Override
  public void doUpdateUserPassword(Integer userId, String page, String passwordString,
      String dbaPwd) throws BusinessServiceException {
    try {
      User userUpdate = userDAO.getUserById(userId);
      userUpdate.setPasswordString(passwordString);
      if ("admin".equals(page)) {
        userUpdate.setDbaPasswordString(dbaPwd);
      }
      userDAO.saveUser(userUpdate);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
  }



  @Override
  public List<User> doGetAllUsers(User user) throws BusinessServiceException {
    List<User> users = null;
    try {
      users = userDAO.getAllUsers(user);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
    return users;
  }

  @Override
  public List<ContactUsInfo> doGetAllContactUsInfo() throws BusinessServiceException {
    List<ContactUsInfo> contact = null;
    try {
      contact = userDAO.getAllContactUsInfo();
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
    return contact;
  }

  @Override
  public Object[] doGetSearchItems(String search, String search2) throws BusinessServiceException {
    Object[] searchItems = null;
    try {
      searchItems = userDAO.getSearchItems(search, search2);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
    return searchItems;
  }



  @Override
  public void doChangeAdminUserStatus(int userId, String sts) throws BusinessServiceException {
    try {
      User user = userDAO.getUserById(userId);
      user.setStatus(sts);
      userDAO.saveUser(user);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
  }

  @Override
  public List<SearchItem> doGetAllFoodItems() throws BusinessServiceException {
    List<SearchItem> searchItems = null;
    try {
      searchItems = userDAO.getAllFoodItems();
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
    return searchItems;
  }

  @Override
  public void doDeleteFoodItem(int itemId) throws BusinessServiceException {
    try {
      userDAO.deleteFoodItem(itemId);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
  }

  @Override
  public SearchItem doGetFoodItemById(int id) throws BusinessServiceException {
    SearchItem searchItem = null;
    try {
      searchItem = userDAO.getFoodItemById(id);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
    return searchItem;
  }

  @Override
  public void doUpdateFoodItem(SearchItem searchItem) throws BusinessServiceException {
    try {
      userDAO.saveFoodItem(searchItem);
    } catch (DataServiceException e) {
      logger.error(e.getMessage(), e);
      throw new BusinessServiceException(e.getLocalizedMessage(), e);
    }
  }



}
