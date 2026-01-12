package com.tp.mes.app.hr.repository;

import com.tp.mes.app.hr.model.Employee;
import com.tp.mes.app.hr.model.EmployeeListItem;
import com.tp.mes.support.OracleErrorSupport;
import java.sql.Date;
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
public class JdbcEmployeeRepository implements EmployeeRepository {

    private static final Logger log = LoggerFactory.getLogger(JdbcEmployeeRepository.class);
    private final JdbcTemplate jdbcTemplate;

    public JdbcEmployeeRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<EmployeeListItem> findAllWithDeptAndPosition() {
        try {
            String sql = """
                    SELECT e.emp_id, e.emp_name, e.email, e.phone,
                           TO_CHAR(e.hire_date, 'YYYY-MM-DD') as hire_date,
                           e.department_id, d.dept_name,
                           e.position_id, p.position_name,
                           e.status, e.job_type
                    FROM employees e
                    LEFT JOIN departments d ON e.department_id = d.department_id
                    LEFT JOIN positions p ON e.position_id = p.position_id
                    ORDER BY e.created_at DESC
                    """;
            return jdbcTemplate.query(sql, this::mapListItem);
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                log.warn("employees table not found. Run scripts/hrm-schema.sql");
                return List.of();
            }
            throw ex;
        }
    }

    @Override
    public List<EmployeeListItem> findByDepartment(String departmentId) {
        try {
            String sql = """
                    SELECT e.emp_id, e.emp_name, e.email, e.phone,
                           TO_CHAR(e.hire_date, 'YYYY-MM-DD') as hire_date,
                           e.department_id, d.dept_name,
                           e.position_id, p.position_name,
                           e.status, e.job_type
                    FROM employees e
                    LEFT JOIN departments d ON e.department_id = d.department_id
                    LEFT JOIN positions p ON e.position_id = p.position_id
                    WHERE e.department_id = ?
                    ORDER BY e.created_at DESC
                    """;
            return jdbcTemplate.query(sql, this::mapListItem, departmentId);
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                return List.of();
            }
            throw ex;
        }
    }

    @Override
    public List<EmployeeListItem> findByStatus(String status) {
        try {
            String sql = """
                    SELECT e.emp_id, e.emp_name, e.email, e.phone,
                           TO_CHAR(e.hire_date, 'YYYY-MM-DD') as hire_date,
                           e.department_id, d.dept_name,
                           e.position_id, p.position_name,
                           e.status, e.job_type
                    FROM employees e
                    LEFT JOIN departments d ON e.department_id = d.department_id
                    LEFT JOIN positions p ON e.position_id = p.position_id
                    WHERE e.status = ?
                    ORDER BY e.created_at DESC
                    """;
            return jdbcTemplate.query(sql, this::mapListItem, status);
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                return List.of();
            }
            throw ex;
        }
    }

    @Override
    public Optional<Employee> findById(String empId) {
        try {
            String sql = """
                    SELECT emp_id, emp_name, email, phone, hire_date, birth_date, gender,
                           department_id, position_id, job_type, manager_emp_id,
                           status, leave_start_date, leave_end_date, termination_date, termination_reason,
                           shift_type, factory_id, production_line_id, skill_level,
                           created_at, updated_at
                    FROM employees
                    WHERE emp_id = ?
                    """;
            List<Employee> results = jdbcTemplate.query(sql, this::mapRow, empId);
            return results.stream().findFirst();
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                return Optional.empty();
            }
            throw ex;
        }
    }

    @Override
    public long countByDepartment(String departmentId) {
        try {
            String sql = "SELECT COUNT(*) FROM employees WHERE department_id = ? AND status = 'ACTIVE'";
            Long count = jdbcTemplate.queryForObject(sql, Long.class, departmentId);
            return count != null ? count : 0L;
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                return 0L;
            }
            throw ex;
        }
    }

    @Override
    public void insert(Employee employee) {
        String sql = """
                INSERT INTO employees (
                    emp_id, emp_name, email, phone, hire_date, birth_date, gender,
                    department_id, position_id, job_type, manager_emp_id,
                    status, shift_type, factory_id, production_line_id, skill_level,
                    password
                ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                """;

        jdbcTemplate.update(sql,
                employee.empId(),
                employee.empName(),
                employee.email(),
                employee.phone(),
                employee.hireDate() != null ? Date.valueOf(employee.hireDate()) : null,
                employee.birthDate() != null ? Date.valueOf(employee.birthDate()) : null,
                employee.gender(),
                employee.departmentId(),
                employee.positionId(),
                employee.jobType(),
                employee.managerEmpId(),
                employee.status(),
                employee.shiftType(),
                employee.factoryId(),
                employee.productionLineId(),
                employee.skillLevel(),
                // password는 BCrypt 해시로 전달받아야 함
                "$2a$10$defaultPasswordHashHere" // 실제로는 Service에서 암호화 후 전달
        );
    }

    @Override
    public void update(Employee employee) {
        String sql = """
                UPDATE employees SET
                    emp_name = ?, email = ?, phone = ?,
                    department_id = ?, position_id = ?, job_type = ?,
                    manager_emp_id = ?, status = ?,
                    shift_type = ?, factory_id = ?, production_line_id = ?, skill_level = ?,
                    updated_at = CURRENT_TIMESTAMP
                WHERE emp_id = ?
                """;

        jdbcTemplate.update(sql,
                employee.empName(),
                employee.email(),
                employee.phone(),
                employee.departmentId(),
                employee.positionId(),
                employee.jobType(),
                employee.managerEmpId(),
                employee.status(),
                employee.shiftType(),
                employee.factoryId(),
                employee.productionLineId(),
                employee.skillLevel(),
                employee.empId());
    }

    @Override
    public void updateStatus(String empId, String status, String terminationReason) {
        String sql = """
                UPDATE employees SET
                    status = ?,
                    termination_date = CASE WHEN ? IN ('RETIRED', 'TERMINATED') THEN SYSDATE ELSE NULL END,
                    termination_reason = ?,
                    updated_at = CURRENT_TIMESTAMP
                WHERE emp_id = ?
                """;

        jdbcTemplate.update(sql, status, status, terminationReason, empId);
    }

    private EmployeeListItem mapListItem(ResultSet rs, int rowNum) throws SQLException {
        return new EmployeeListItem(
                rs.getString("emp_id"),
                rs.getString("emp_name"),
                rs.getString("email"),
                rs.getString("phone"),
                rs.getString("hire_date"),
                rs.getString("department_id"),
                rs.getString("dept_name"),
                rs.getString("position_id"),
                rs.getString("position_name"),
                rs.getString("status"),
                rs.getString("job_type"));
    }

    private Employee mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Employee(
                rs.getString("emp_id"),
                rs.getString("emp_name"),
                rs.getString("email"),
                rs.getString("phone"),
                rs.getDate("hire_date") != null ? rs.getDate("hire_date").toLocalDate() : null,
                rs.getDate("birth_date") != null ? rs.getDate("birth_date").toLocalDate() : null,
                rs.getString("gender"),
                rs.getString("department_id"),
                rs.getString("position_id"),
                rs.getString("job_type"),
                rs.getString("manager_emp_id"),
                rs.getString("status"),
                rs.getDate("leave_start_date") != null ? rs.getDate("leave_start_date").toLocalDate() : null,
                rs.getDate("leave_end_date") != null ? rs.getDate("leave_end_date").toLocalDate() : null,
                rs.getDate("termination_date") != null ? rs.getDate("termination_date").toLocalDate() : null,
                rs.getString("termination_reason"),
                rs.getString("shift_type"),
                rs.getString("factory_id"),
                rs.getString("production_line_id"),
                rs.getObject("skill_level") != null ? rs.getInt("skill_level") : null,
                rs.getTimestamp("created_at") != null ? rs.getTimestamp("created_at").toLocalDateTime() : null,
                rs.getTimestamp("updated_at") != null ? rs.getTimestamp("updated_at").toLocalDateTime() : null);
    }
}
