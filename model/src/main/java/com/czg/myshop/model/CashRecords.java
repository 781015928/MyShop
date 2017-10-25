package com.czg.myshop.model;

public class CashRecords {
    private Integer id;

    private String createtime;

    private String updatetime;

    private String deletestate;

    private Integer uid;

    private Float price;

    private Integer state;

    private Integer paytype;

    private String cashCode;

    private String type;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getDeletestate() {
        return deletestate;
    }

    public void setDeletestate(String deletestate) {
        this.deletestate = deletestate == null ? null : deletestate.trim();
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getPaytype() {
        return paytype;
    }

    public void setPaytype(Integer paytype) {
        this.paytype = paytype;
    }

    public String getCashCode() {
        return cashCode;
    }

    public void setCashCode(String cashCode) {
        this.cashCode = cashCode == null ? null : cashCode.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }
}