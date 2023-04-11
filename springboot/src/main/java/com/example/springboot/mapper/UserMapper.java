package com.example.springboot.mapper;

import com.example.springboot.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 程序员青戈
 * @since 2022-11-28
 */
public interface UserMapper extends BaseMapper<User> {

    int select1();

}
