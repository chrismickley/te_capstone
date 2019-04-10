package com.techelevator.model;

import java.util.List;

public interface TagDAO {
	
	public void addTag(String tag);
	public Tag getTagById();
	public int getIdByTag(String tag);
	public List<String> getAllTags();
	public boolean tagExists(String tag);
}
