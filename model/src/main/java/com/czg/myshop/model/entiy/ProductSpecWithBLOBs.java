package com.czg.myshop.model.entiy;

public class ProductSpecWithBLOBs extends ProductSpec {
    private String color;

    private String modeltype;

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color == null ? null : color.trim();
    }

    public String getModeltype() {
        return modeltype;
    }

    public void setModeltype(String modeltype) {
        this.modeltype = modeltype == null ? null : modeltype.trim();
    }
}