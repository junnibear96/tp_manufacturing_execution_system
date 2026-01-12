package com.tp.mes.app.hr.repository;

import com.tp.mes.app.hr.model.Department;
import com.tp.mes.support.OracleErrorSupport;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

// @Repository - TEMPORARILY DISABLED
public class JdbcDepartmentRepository implements DepartmentRepository {

    private static final Logger log = LoggerFactory.getLogger(JdbcDepartmentRepository.class);
    private final JdbcTemplate jdbcTemplate;

    public JdbcDepartmentRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Department> findAll() {
        try {
            String sql = """
                    SELECT department_id, dept_name, dept_name_en, division,
                           manager_emp_id, created_at, updated_at
                    FROM departments
                    ORDER BY division, dept_name
                    """;
            return jdbcTemplate.query(sql, this::mapRow);
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
            String sql = """
                    SELECT department_id, dept_name, dept_name_en, division,
                           manager_emp_id, created_at, updated_at
                    FROM departments
                    WHERE division = ?
                    ORDER BY dept_name
                    """;
            return jdbcTemplate.query(sql, this::mapRow, division);
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                return List.of();
            }
            throw ex;
        }
    }

    @Override
    public Optional<Department> findById(String departmentId) {
        try {
            String sql = """
                    SELECT department_id, dept_name, dept_name_en, division,
                           manager_emp_id, created_at, updated_at
                    FROM departments
                    WHERE department_id = ?
                    """;
            List<Department> results = jdbcTemplate.query(sql, this::mapRow, departmentId);
            return results.stream().findFirst();
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                return Optional.empty();
            }
            throw ex;
        }
    }

    private Department mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Department(
                rs.getString("department_id"),
                rs.getString("dept_name"),
                rs.getString("dept_name_en"),
                rs.getString("division"),
                rs.getString("manager_emp_id"),
                rs.getTimestamp("created_at") != null ? rs.getTimestamp("created_at").toLocalDateTime() : null,
                rs.getTimestamp("updated_at") != null ? rs.getTimestamp("updated_at").toLocalDateTime() : null);
    }
}
