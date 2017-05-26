package com.foodanalysis.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "food_items")
public class SearchItem {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  private String name;

  private String fats;

  private String proteins;

  private String carbohydrates;

  private String vitamins;

  private String sugar;

  private String calorie;

  private String benefits;

  private String disadvantages;

  @Column(name = "bmi_start")
  private Integer bmiStart;

  @Column(name = "bmi_end")
  private Integer bmiEnd;

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

  public String getFats() {
    return fats;
  }

  public void setFats(String fats) {
    this.fats = fats;
  }

  public String getProteins() {
    return proteins;
  }

  public void setProteins(String proteins) {
    this.proteins = proteins;
  }

  public String getCarbohydrates() {
    return carbohydrates;
  }

  public void setCarbohydrates(String carbohydrates) {
    this.carbohydrates = carbohydrates;
  }

  public String getVitamins() {
    return vitamins;
  }

  public void setVitamins(String vitamins) {
    this.vitamins = vitamins;
  }

  public String getSugar() {
    return sugar;
  }

  public void setSugar(String sugar) {
    this.sugar = sugar;
  }

  public String getCalorie() {
    return calorie;
  }

  public void setCalorie(String calorie) {
    this.calorie = calorie;
  }

  public String getBenefits() {
    return benefits;
  }

  public void setBenefits(String benefits) {
    this.benefits = benefits;
  }

  public String getDisadvantages() {
    return disadvantages;
  }

  public void setDisadvantages(String disadvantages) {
    this.disadvantages = disadvantages;
  }

  public Integer getBmiStart() {
    return bmiStart;
  }

  public void setBmiStart(Integer bmiStart) {
    this.bmiStart = bmiStart;
  }

  public Integer getBmiEnd() {
    return bmiEnd;
  }

  public void setBmiEnd(Integer bmiEnd) {
    this.bmiEnd = bmiEnd;
  }



}
