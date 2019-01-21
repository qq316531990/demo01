package com.pojo;

public class SecondTypeView {
    private int secondType_id;
    private String secondType_name;
    private int type_id;
    private String type_name;

    @Override
    public String toString() {
        return "SecondTypeView{" +
                "secondType_id=" + secondType_id +
                ", secondType_name='" + secondType_name + '\'' +
                ", type_id=" + type_id +
                ", type_name='" + type_name + '\'' +
                '}';
    }

    public int getSecondType_id() {
        return secondType_id;
    }

    public void setSecondType_id(int secondType_id) {
        this.secondType_id = secondType_id;
    }

    public String getSecondType_name() {
        return secondType_name;
    }

    public void setSecondType_name(String secondType_name) {
        this.secondType_name = secondType_name;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
    }
}
