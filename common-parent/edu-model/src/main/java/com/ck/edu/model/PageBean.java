package com.ck.edu.model;

import java.util.List;


public class PageBean<T> {
 private int size =7;//每页显示记录
 private int index = 1;//当前页号
 private int totalCount = 0;//记录总数 ok

 private int totalPageCount = 1;//总页数



 private int[] numbers;//展示页数集合
 protected List<T> list;//显示要到页面的数据集

 /**
  * 得到开始记录
  * @return
  */
 public int getStartRow(){
  return (index-1)*size;
 }

 /**
  * 得到结束记录
  */
 public int getEndRow(){
  return index*size;
 }

 public void setSize(int size){
     if(size > 0){
       this.size = size;
     }
 }
 public int getIndex(){
  if(totalPageCount == 0){
   return 0;
  }
  return index;
 }
 public int getTotalCount(){
  return totalCount;
 }

 public void setTotalCount(int totalCount){
  if(totalCount>=0){
   this.totalCount = totalCount;
  setTotalPageCountByRs();//根据总记录数计算总页
  }
 }

 public int getTotalPageCount(){
  return this.totalPageCount;
 }

 //根据总记录数计算总页
 public void setTotalPageCountByRs(){
  totalPageCount = totalCount % size ==0?totalCount/size:totalCount/size+1;
 }

 public int[] getNumbers(){
  return numbers;
 }

 public  void setNumbers(int[] numbers){
  this.numbers = numbers;
 }

 public List<T> getList(){
  return list;
 }

 public void setIndex(int index) {
  this.index = index;
 }

 public int getSize() {
  return size;
 }

 public void setTotalPageCount(int totalPageCount) {
  this.totalPageCount = totalPageCount;
 }

 public void setList(List<T> list) {
  this.list = list;
 }
}
