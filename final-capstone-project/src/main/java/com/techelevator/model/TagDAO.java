package com.techelevator.model;

import java.util.List;

public interface TagDAO {
	
	public int addTag(String tag);
	public int getIdByTag(String tag);
	public List<String> getAllTags();
	public boolean tagExists(String tag);
}
