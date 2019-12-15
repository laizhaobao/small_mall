package com.nf.service;

import com.nf.entity.MessageEntity;

import java.util.List;

public interface MessageService {
	List<MessageEntity> getPageHelper(int pageNum, int pageSize);

	boolean mesInsert(MessageEntity messageEntity);

	boolean mesDelete(Integer id);

	List<MessageEntity> searchName(int pageNum, int pageSize, String name);
}
