package com.nf.service.impl;

import com.nf.dao.MessageDao;
import com.nf.entity.MessageEntity;
import com.nf.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageDao messageDao;
	@Override
	public List<MessageEntity> getPageHelper(int pageNum, int pageSize) {
		return messageDao.getPageHelper(pageNum,pageSize);
	}

	@Override
	public boolean mesInsert(MessageEntity messageEntity) {
		return messageDao.mesInsert(messageEntity);
	}

	@Override
	public boolean mesDelete(Integer id) {
		return messageDao.mesDelete(id);
	}

	@Override
	public List<MessageEntity> searchName(int pageNum, int pageSize, String name) {
		return messageDao.searchName(pageNum,pageSize,name);
	}
}
