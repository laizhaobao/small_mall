package com.nf.dao;

import com.nf.entity.MessageEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author lzb
 *留言信息表
 */
public interface MessageDao {
	List<MessageEntity> getPageHelper(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
	boolean mesInsert(MessageEntity messageEntity);
	boolean mesDelete(Integer id);
	List<MessageEntity> searchName(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize,@Param("name") String name);
}
