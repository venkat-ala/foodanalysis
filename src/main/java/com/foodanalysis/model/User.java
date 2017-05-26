package com.foodanalysis.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "users")
public class User {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;

  @Column(name = "name")
  private String name;


  @Column(name = "email")
  private String email;



  @Column(name = "last_login")
  private Date lastLogin;

  @Column(name = "last_updated_on")
  private Date lastUpdatedOn;

  @Column(name = "password")
  private String passwordString;

  @Transient
  private String confirmPasswordString;

  @Column(name = "dba_password")
  private String dbaPasswordString;

  @Transient
  private String confirmDbaPasswordString;


  private String age;

  private String gender;

  private Integer weight;

  private Integer height;

  private String alergies;

  private String phone;

  @Column(name = "fav_friend")
  private String favFriendName;

  @Column(name = "fav_movie")
  private String favMovieName;

  private String status;

  private Float bmi;

  private String role;

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }



  public Date getLastLogin() {
    return lastLogin;
  }

  public void setLastLogin(Date lastLogin) {
    this.lastLogin = lastLogin;
  }

  public Date getLastUpdatedOn() {
    return lastUpdatedOn;
  }

  public void setLastUpdatedOn(Date lastUpdatedOn) {
    this.lastUpdatedOn = lastUpdatedOn;
  }

  public String getPasswordString() {
    return passwordString;
  }

  public void setPasswordString(String passwordString) {
    this.passwordString = passwordString;
  }

  public String getConfirmPasswordString() {
    return confirmPasswordString;
  }

  public void setConfirmPasswordString(String confirmPasswordString) {
    this.confirmPasswordString = confirmPasswordString;
  }

  public String getAge() {
    return age;
  }

  public void setAge(String age) {
    this.age = age;
  }

  public String getGender() {
    return gender;
  }

  public void setGender(String gender) {
    this.gender = gender;
  }

  public Integer getWeight() {
    return weight;
  }

  public void setWeight(Integer weight) {
    this.weight = weight;
  }

  public Integer getHeight() {
    return height;
  }

  public void setHeight(Integer height) {
    this.height = height;
  }

  public String getAlergies() {
    return alergies;
  }

  public void setAlergies(String alergies) {
    this.alergies = alergies;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getFavFriendName() {
    return favFriendName;
  }

  public void setFavFriendName(String favFriendName) {
    this.favFriendName = favFriendName;
  }

  public String getFavMovieName() {
    return favMovieName;
  }

  public void setFavMovieName(String favMovieName) {
    this.favMovieName = favMovieName;
  }

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public Float getBmi() {
    return bmi;
  }

  public void setBmi(Float bmi) {
    this.bmi = bmi;
  }

  public String getDbaPasswordString() {
    return dbaPasswordString;
  }

  public void setDbaPasswordString(String dbaPasswordString) {
    this.dbaPasswordString = dbaPasswordString;
  }

  public String getConfirmDbaPasswordString() {
    return confirmDbaPasswordString;
  }

  public void setConfirmDbaPasswordString(String confirmDbaPasswordString) {
    this.confirmDbaPasswordString = confirmDbaPasswordString;
  }

  public String getRole() {
    return role;
  }

  public void setRole(String role) {
    this.role = role;
  }

}
