package com.techelevator.model;

public interface TagDAO {
	
	public void addTag(Tag tag);
	public Tag getTagById();
	public int getIdByTag(String tag);
	
}
