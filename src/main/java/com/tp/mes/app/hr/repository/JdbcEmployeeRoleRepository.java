package com.tp.mes.app.hr.repository;

import com.tp.mes.support.OracleErrorSupport;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

// @Repository - TEMPORARILY DISABLED
public class JdbcEmployeeRoleRepository implements EmployeeRoleRepository {

    private static final Logger log = LoggerFactory.getLogger(JdbcEmployeeRoleRepository.class);
    private final JdbcTemplate jdbcTemplate;

    public JdbcEmployeeRoleRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<String> findRolesByEmpId(String empId) {
        try {
            String sql = "SELECT role_id FROM employee_roles WHERE emp_id = ?";
            return jdbcTemplate.queryForList(sql, String.class, empId);
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                log.warn("employee_roles table not found. Run scripts/hrm-schema.sql");
                return List.of();
            }
            throw ex;
        }
    }

    @Override
    public void insert(String empId, String roleId, String grantedBy) {
        String sql = "INSERT INTO employee_roles (emp_id, role_id, granted_by) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, empId, roleId, grantedBy);
    }

    @Override
    public void deleteAllByEmpId(String empId) {
        String sql = "DELETE FROM employee_roles WHERE emp_id = ?";
        jdbcTemplate.update(sql, empId);
    }
}
