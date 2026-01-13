package com.tp.mes.app.hr.repository;

import com.tp.mes.app.hr.mapper.PositionMapper;
import com.tp.mes.app.hr.model.Position;
import com.tp.mes.support.OracleErrorSupport;
import java.util.List;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 * 직급 Repository (MyBatis 기반)
 */
@Repository
@RequiredArgsConstructor
@Slf4j
public class JdbcPositionRepository implements PositionRepository {

    private final PositionMapper positionMapper;

    @Override
    public List<Position> findAll() {
        try {
            log.debug("Calling PositionMapper.findAll()");
            List<Position> results = positionMapper.findAll();
            log.debug("PositionMapper.findAll() returned {} positions", results.size());
            return results;
        } catch (DataAccessException ex) {
            log.error("DataAccessException in PositionRepository.findAll()", ex);
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                log.warn("positions table not found. Run scripts/hrm-schema.sql");
                return List.of();
            }
            throw ex;
        } catch (Exception ex) {
            log.error("Unexpected exception in PositionRepository.findAll()", ex);
            throw ex;
        }
    }

    @Override
    public List<Position> findByJobCategory(String jobCategory) {
        try {
            return positionMapper.findByJobCategory(jobCategory);
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                log.warn("positions table not found");
                return List.of();
            }
            throw ex;
        }
    }

    @Override
    public Optional<Position> findById(String positionId) {
        try {
            return positionMapper.findById(positionId);
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                log.warn("positions table not found");
                return Optional.empty();
            }
            throw ex;
        }
    }
}
