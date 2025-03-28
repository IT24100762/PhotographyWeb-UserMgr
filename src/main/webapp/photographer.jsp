<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.photographerMgr.models.Photographer" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard</title>
    <link rel="stylesheet" href="assets/main.css">
    <link rel="stylesheet" href="assets/dashboards.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="background"></div>
    
    <div class="dashboard-container">
        <div class="sidebar glass-card">
            <h2 class="logo"><i class="fas fa-key"></i>Brand</h2>
            <ul class="nav-links">
                <li class="active"><a href="customer.html"><i class="fas fa-user"></i> My Profile</a></li>
                <li><a href="bookings.html"><i style="margin: 0 0 0 3px;" class="fas fa-calendar"></i> Bookings</a></li>
                <li><a href="#"><i class="fas fa-images"></i> Portfolio</a></li>
                <li><a href="favorites.html"><i style="margin: 0 3px 0 5px;" class="fas fa-dollar-sign"></i> Earnings</a></li>
                <li><a href="#"><i class="fas fa-cog"></i> Settings</a></li> 
            </ul>
            <div class="sidebar-footer">
                <a href="logoutPhotographer.jsp" class="logout-btn btn-animated"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>
        
        <% Photographer photographer = (Photographer)session.getAttribute("photographer"); %>
        <div class="main-content">
            <header class="glass-card">
            
            	<%if(photographer!=null) { %>
                	<h1>Welcome, <span id="customer-name">photographer.getFullName()</span>!</h1>
                <% } else {%>
                    <h1>Welcome to Dashboard !</h1>
                    <% } %>
                <div class="user-info">
                    <div class="notifications">
                        <i class="fas fa-bell"></i>
                        <span class="badge">2</span>
                    </div>
                    <div class="user-avatar">
                        <img src="/assets/default-avatar.png" alt="Profile Picture" id="profile-picture">
                    </div>
                </div>
            </header>
            
            <div class="content-section glass-card">
                <div class="profile-section">

                <!--Start-->
    			<% if (photographer != null) { %>
                    <div class="profile-header">
                        <h2>My Profile</h2>
                        <button type="button" id="edit-profile-btn" class="btn-animated" onclick="handleEditProfile(event)"><i class="fas fa-edit"></i> Edit Profile</button>
                    </div>
                    
                    <form action="PhotographerProfileServlet" method="post" id="profile-form">
                        <input type="hidden" name="originalUsername" value="<%= photographer.getUsername() %>">
                        <input type="hidden" name="originalEmail" value="<%= photographer.getEmail() %>">
                        <div class="profile-grid">
                        	<div class="profile-field">
                                <label>Full Name</label>
                                    <input type="text" id="fullName customer-name-input" minlength="5" maxlength="35" name="fullName" value="<%= photographer.getFullName() %>" required disabled>
                                <div class="input-box glass-input">
                                    <i class="icon fas fa-user"></i>
                                </div>
                            </div>
                        
                        
                            <div class="profile-field">
                                <label>Username</label>
                                <div class="input-box glass-input">
                                    <input type="text" id="username customer-name-input" minlength="5" maxlength="15" name="username" value="<%= photographer.getUsername() %>" required disabled>
                                    <i class="icon fas fa-user"></i>
                                </div>
                            </div>
                            
                            <div class="profile-field">
                                <label>Email</label>
                                <div class="input-box glass-input">
                                    <input type="email" id="email customer-email-input" name="email" value="<%= photographer.getEmail() %>" required disabled>
                                    <i class="icon fas fa-envelope"></i>
                                </div>
                            </div>
                            
                            <div class="profile-field">
                                <label>Gender</label>
                                <div class="gender-display glass-input" id="gender-display"><%= photographer.getGender() %></div>
                                <div class="gender-edit hidden">
                                    <div class="radio-group">
                                        <label><input type="radio" id="gender" name="gender" value="male" checked> Male</label>
                                        <label><input type="radio" id="gender" name="gender" value="female"> Female</label>
                                        <label><input type="radio" id="gender" name="gender" value="other"> Other</label>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="profile-field">
                                <label>Phone</label>
                                <div class="input-box glass-input">
                                    <input type="tel" id="phone phone-input" name="phone" minlength="10" maxlength="10"  value="<%= photographer.getPhone() %>" required disabled>
                                    <i class="icon fas fa-phone"></i>
                                </div>
                            </div>
                            
                            <div class="profile-field">
                                <label>Address</label>
                                <div class="input-box glass-input">
                                    <input type="text" id="address address-input" name="address" minlength="5" value="<%= photographer.getOriginalAddress() %>" required disabled>
                                    <i class="icon fas fa-house"></i>
                                </div>
                            </div>
                            
                            
                            <div class="profile-field">
                                <label>Skills</label>
                                <div class="input-box glass-input">
                                    <input type="text" id="customer-preferences-input" value="<%= photographer.getOriginalSkills() %>" required disabled>
                                    <i class="icon fas fa-image"></i>
                                </div>
                            </div>
                            
                            <div class="profile-field edit-only" style="display: none;">
                                <label>New Password</label>
                                <div class="input-box glass-input">
                                    <input type="password" id="password secondary-address-input" minlength="6" name="password" value="<%= photographer.getPassword() %>" placeholder="Your Password"disabled>
                                    <i class="icon fas fa-building"></i>
                                </div>
                            </div>
                            
                        </div>
                        
                        	<% if (request.getAttribute("message") != null) { %>
    	        	    	<p style="color: green;"><%= request.getAttribute("message") %></p>
    	        	    	<script>showNotification('<%= request.getAttribute("message") %>')</script>
        	    			<% } %>
            				<% if (request.getAttribute("error") != null) { %>
                			<p style="color: red;"><%= request.getAttribute("error") %></p>
                			<script>showNotification('<%= request.getAttribute("error") %>', type = "error")</script>
            				<% } %>
                        
                        <div class="form-actions hidden">
	                    	
                            <button type="submit"  class="button btn btn-animated save-btn">Save Changes</button> <!-- onclick="handleSaveProfile(event)" -->
                            <button type="button" class="btn btn-animated cancel-btn" id="cancel-edit-btn" onclick="handleCancelEdit(event)">Cancel</button>
                        </div>
                    </form>
                    
                    <div class="delete-profile-container">
                    		
                        <form>
                            <button type="button" class="btn btn-animated delete-btn" id="delete-profile-btn" onclick="handleDeleteProfile(event)">
                            	<i class="fas fa-trash-alt"></i> Delete Profile
                        	</button>
                        </form>
                    </div>
        		
   					 <% } else { %>
        			<h1>No user found in session. Please <a class="refLink" href="customer-login.jsp" >login</a>.</h1>
    				<% } %>
        			

                    <!--End-->
                </div>
            </div>
        </div>
    </div>
    

    <div class="modal" id="delete-confirmation-modal">
        <div class="modal-content glass-card">
            <h3><i class="fas fa-exclamation-triangle"></i> Delete Profile</h3>
            <p>Are you sure you want to delete your profile? This action cannot be undone.</p>
            <% if (photographer != null) { %>
            <div class="modal-actions">
            	<form action="PhotographerDeleteServlet" method="post">
            		<input type="hidden" name="usernameDel" value="<%= photographer.getUsername() %>">
                	<button type="button" class="btn btn-animated cancel-modal-btn" onclick="handleCancelDelete(event)">Cancel</button>
                	<button type="submit" class="button btn btn-animated confirm-delete-btn">Yes, Delete My Profile</button> <!-- onclick="handleConfirmDelete(event)" -->
                </form>
            </div>
            <% } %>
        </div>
    </div>
    
    <script src="assets/main.js"></script>
    <script src="assets/customer-dashboard.js"></script>
</body>
</html>
