package com.vidyalaya.hobby.services;

import com.vidyalaya.hobby.entities.User;

public interface ProfileService {
	
	public User saveUser(User user);
	
	public void deleteUserById(Long id);
	
	public User updateProfile(User user, User newUser);
	
	public User fetchUser();
}
