package com.czg.myshop.model;

public class User {
    private Integer id;

    private String account;

    private String password;

    private String email;

    private String phone;

    private String headimg;

    private Integer defaultAddressId;

    private Integer sex;

    private Integer emailState;

    private String wxid;

    private String qqid;

    private String createtime;

    private String updatetime;

    private Integer deletestate;

    private Integer type;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getHeadimg() {
        return headimg;
    }

    public void setHeadimg(String headimg) {
        this.headimg = headimg == null ? null : headimg.trim();
    }

    public Integer getDefaultAddressId() {
        return defaultAddressId;
    }

    public void setDefaultAddressId(Integer defaultAddressId) {
        this.defaultAddressId = defaultAddressId;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getEmailState() {
        return emailState;
    }

    public void setEmailState(Integer emailState) {
        this.emailState = emailState;
    }

    public String getWxid() {
        return wxid;
    }

    public void setWxid(String wxid) {
        this.wxid = wxid == null ? null : wxid.trim();
    }

    public String getQqid() {
        return qqid;
    }

    public void setQqid(String qqid) {
        this.qqid = qqid == null ? null : qqid.trim();
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

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}