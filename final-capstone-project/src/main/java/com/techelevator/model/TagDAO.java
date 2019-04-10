package com.techelevator.model;

import java.util.List;

public interface TagDAO {
	
	public void addTag(Tag tag);
	public Tag getTagById(int tagId);
	public int getIdByTag();
	
}
