package com.photographerMgr;

public class Photographer {
    private String username;
    private String password;
    private String email;
    private String gender;
    private String address;
    private String phone;
    private String skills;
    private String prices;
    
    public Photographer() {
    	this.username = "Null";
		this.password = "Null";
		this.email = "Null";
		this.gender = "Hidden";
		this.address = "Null";
		this.phone = "Null";
		this.skills = "Null";
		this.prices = "Null";
    }

    public Photographer(String username, String password, String email, String gender, String address, String phone, String skills, String prices) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.gender = gender;
        setAddress(address); // Using setter to validate/transform address
        this.phone = phone;
        setSkills(skills);
        setPrices(prices);
    }
    
    // Getters and setters
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    /**
     * Sets the address after validating and replacing commas with @;%
     * @param address the address to set
     */
    public void setAddress(String address) {
        if (address != null) {
            // Replace all commas with "@;%"
            this.address = address.replace(",", "@;%");
        } else {
            this.address = "";
        }
    }
    
    /**
     * Returns the original address with commas restored
     * @return address with original commas
     */
    public String getOriginalAddress() {
        if (address != null) {
            return address.replace("@;%", ",");
        }
        return "";
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public void setSkills(String skills) {
    	if (skills != null) {
            // Replace all commas with "@;%"
            this.skills = skills.replace(",", "@;%");
        } else {
            this.skills = "";
        }
    }
    
    public String getSkills() {
    	return skills;
    }
    
    public String getOriginalSkills() {
        if (skills != null) {
            return skills.replace("@;%", ",");
        }
        return "";
    }
    
    public String getPrices(String prices) {
    	return prices;
    }
    
    public void setPrices(String prices) {
    	if (prices != null) {
            // Replace all commas with "@;%"
            this.prices = prices.replace(",", "@;%");
        } else {
            this.prices = "";
        }
    }
    
    public String getOriginalPrices() {
        if (prices != null) {
            return prices.replace("@;%", ",");
        }
        return "";
    }

    @Override
    public String toString() {
        return username + ", " + password + ", " + email + ", " + gender + ", " + address + ", " + phone + ", " + skills;
    }
}
