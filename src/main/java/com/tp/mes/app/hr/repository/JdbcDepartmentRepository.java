package com.tp.mes.app.hr.repository;

import com.tp.mes.app.hr.mapper.DepartmentMapper;
import com.tp.mes.app.hr.model.Department;
import com.tp.mes.support.OracleErrorSupport;
import java.util.List;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 * 부서 Repository (MyBatis 기반)
 */
@Repository
@RequiredArgsConstructor
@Slf4j
public class JdbcDepartmentRepository implements DepartmentRepository {

    private final DepartmentMapper departmentMapper;

    @Override
    public List<Department> findAll() {
        try {
            return departmentMapper.findAll();
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                log.warn("departments table not found. Run scripts/hrm-schema.sql");
                return List.of();
            }
            throw ex;
        }
    }

    @Override
    public List<Department> findByDivision(String division) {
        try {
            return departmentMapper.findByDivision(division);
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                log.warn("departments table not found");
                return List.of();
            }
            throw ex;
        }
    }

    @Override
    public Optional<Department> findById(String departmentId) {
        try {
            return departmentMapper.findById(departmentId);
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                log.warn("departments table not found");
                return Optional.empty();
            }
            throw ex;
        }
    }
}
