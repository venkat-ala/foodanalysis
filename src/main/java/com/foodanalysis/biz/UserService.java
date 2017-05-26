package com.foodanalysis.biz;

import java.util.List;

import com.foodanalysis.biz.exception.BusinessServiceException;
import com.foodanalysis.model.ContactUsInfo;
import com.foodanalysis.model.SearchItem;
import com.foodanalysis.model.User;

public interface UserService {

  void doSaveUser(User user, String role) throws BusinessServiceException;

  User doAuthenticateUser(String email, String password, String dbapassword, String page)
      throws BusinessServiceException;

  User doGetUserById(int id) throws BusinessServiceException;

  User doGetUserByEmail(String email) throws BusinessServiceException;

  User doUpdateUser(User user) throws BusinessServiceException;

  void doUpdateUserPassword(Integer userId, String page, String password, String DBAPwd)
      throws BusinessServiceException;

  List<User> doGetAllUsers(User user) throws BusinessServiceException;

  List<ContactUsInfo> doGetAllContactUsInfo() throws BusinessServiceException;

  Object[] doGetSearchItems(String search, String search2) throws BusinessServiceException;



  void doChangeAdminUserStatus(int userId, String sts) throws BusinessServiceException;

  List<SearchItem> doGetAllFoodItems() throws BusinessServiceException;

  void doDeleteFoodItem(int itemId) throws BusinessServiceException;

  SearchItem doGetFoodItemById(int id) throws BusinessServiceException;

  void doUpdateFoodItem(SearchItem searchItem) throws BusinessServiceException;



}
