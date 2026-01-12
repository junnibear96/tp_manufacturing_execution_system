package com.tp.mes.app.hr.repository;

import com.tp.mes.app.hr.model.Position;
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
public class JdbcPositionRepository implements PositionRepository {

    private static final Logger log = LoggerFactory.getLogger(JdbcPositionRepository.class);
    private final JdbcTemplate jdbcTemplate;

    public JdbcPositionRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Position> findAll() {
        try {
            String sql = """
                    SELECT position_id, position_name, position_name_en, level, job_category, created_at
                    FROM positions
                    ORDER BY level DESC, position_name
                    """;
            return jdbcTemplate.query(sql, this::mapRow);
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                log.warn("positions table not found. Run scripts/hrm-schema.sql");
                return List.of();
            }
            throw ex;
        }
    }

    @Override
    public List<Position> findByJobCategory(String jobCategory) {
        try {
            String sql = """
                    SELECT position_id, position_name, position_name_en, level, job_category, created_at
                    FROM positions
                    WHERE job_category = ?
                    ORDER BY level DESC
                    """;
            return jdbcTemplate.query(sql, this::mapRow, jobCategory);
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                return List.of();
            }
            throw ex;
        }
    }

    @Override
    public Optional<Position> findById(String positionId) {
        try {
            String sql = """
                    SELECT position_id, position_name, position_name_en, level, job_category, created_at
                    FROM positions
                    WHERE position_id = ?
                    """;
            List<Position> results = jdbcTemplate.query(sql, this::mapRow, positionId);
            return results.stream().findFirst();
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                return Optional.empty();
            }
            throw ex;
        }
    }

    private Position mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Position(
                rs.getString("position_id"),
                rs.getString("position_name"),
                rs.getString("position_name_en"),
                rs.getInt("level"),
                rs.getString("job_category"),
                rs.getTimestamp("created_at") != null ? rs.getTimestamp("created_at").toLocalDateTime() : null);
    }
}
