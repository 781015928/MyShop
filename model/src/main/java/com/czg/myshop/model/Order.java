package com.czg.myshop.model;

public class Order {
    private Integer id;

    private Integer uid;

    private Integer addressId;

    private Integer productId;

    private String createtime;

    private String updatetime;

    private Integer deletestate;

    private Integer productSpecId;

    private Integer count;

    private Float price;

    private Float unitPrice;

    private Integer payState;

    private Integer logisticsState;

    private Integer state;

    private Integer afterServiceState;

    private Integer logisticsId;

    private Integer cashId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime == null ? null : updatetime.trim();
    }

    public Integer getDeletestate() {
        return deletestate;
    }

    public void setDeletestate(Integer deletestate) {
        this.deletestate = deletestate;
    }

    public Integer getProductSpecId() {
        return productSpecId;
    }

    public void setProductSpecId(Integer productSpecId) {
        this.productSpecId = productSpecId;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Float getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Float unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Integer getPayState() {
        return payState;
    }

    public void setPayState(Integer payState) {
        this.payState = payState;
    }

    public Integer getLogisticsState() {
        return logisticsState;
    }

    public void setLogisticsState(Integer logisticsState) {
        this.logisticsState = logisticsState;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getAfterServiceState() {
        return afterServiceState;
    }

    public void setAfterServiceState(Integer afterServiceState) {
        this.afterServiceState = afterServiceState;
    }

    public Integer getLogisticsId() {
        return logisticsId;
    }

    public void setLogisticsId(Integer logisticsId) {
        this.logisticsId = logisticsId;
    }

    public Integer getCashId() {
        return cashId;
    }

    public void setCashId(Integer cashId) {
        this.cashId = cashId;
    }
}