package com.app.dao.Impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.app.dao.TouristRequestDAO;
import com.app.dto.TouristRequestDTO;

public class TouristRequestDAOImpl implements TouristRequestDAO {

    // 예시: MyBatis 사용시
    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE = "com.app.mapper.TouristRequestMapper";

    @Override
    public void insert(TouristRequestDTO dto) {
        sqlSession.insert(NAMESPACE + ".insert", dto);
    }

    @Override
    public List<TouristRequestDTO> selectAll() {
        return sqlSession.selectList(NAMESPACE + ".selectAll");
    }

    @Override
    public TouristRequestDTO selectOne(int id) {
        return sqlSession.selectOne(NAMESPACE + ".selectOne", id);
    }

	
}