package com.techelevator.model;

import java.util.List;

public interface TagDAO {
	
	public void addTag(Tag tag);
	public Tag getTagById();
	public int getIdByTag();
	
}
