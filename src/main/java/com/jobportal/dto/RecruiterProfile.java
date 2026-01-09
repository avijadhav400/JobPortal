package com.jobportal.dto;

public class RecruiterProfile {
    private int recruiterId;
    private String companyName;
    private String companyEmail;
    private String companyLocation;
    private boolean approviedByAdmin;

    public int getRecruiterId() {
        return recruiterId;
    }

    public void setRecruiterId(int recruiterId) {
        this.recruiterId = recruiterId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyEmail() {
        return companyEmail;
    }

    public void setCompanyEmail(String companyEmail) {
        this.companyEmail = companyEmail;
    }

    public String getCompanyLocation() {
        return companyLocation;
    }

    public void setCompanyLocation(String companyLocation) {
        this.companyLocation = companyLocation;
    }

    public boolean isApproviedByAdmin() {
        return approviedByAdmin;
    }

    public void setApproviedByAdmin(boolean approviedByAdmin) {
        this.approviedByAdmin = approviedByAdmin;
    }
}
