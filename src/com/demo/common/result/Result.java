package com.demo.common.result;

import java.io.Serializable;
import java.util.List;

public class Result implements Serializable{
    
    /**
     * 
     */
    private static final long serialVersionUID = 2807935741076243785L;
    
    private boolean success = true;
    private String errorMsg;
    private List data;
    
    public String getErrorMsg() {
        return errorMsg;
    }
    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }
    public boolean isSuccess() {
        return success;
    }
    public void setSuccess(boolean success) {
        this.success = success;
    }
    public List getData() {
        return data;
    }
    public void setData(List data) {
        this.data = data;
    }
}
