package com.tp.mes.app.factory.repository;

import com.tp.mes.app.factory.mapper.ProductionLineMapper;
import com.tp.mes.app.factory.model.ProductionLine;
import com.tp.mes.support.OracleErrorSupport;
import java.util.List;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 * 생산라인 Repository 구현체
 */
@Repository
@RequiredArgsConstructor
@Slf4j
public class MyBatisProductionLineRepository implements ProductionLineRepository {

    private final ProductionLineMapper lineMapper;

    @Override
    public List<ProductionLine> findAll() {
        try {
            return lineMapper.findAll();
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                log.warn("production_lines table not found. Run scripts/factory-schema.sql");
                return List.of();
            }
            throw ex;
        }
    }

    @Override
    public List<ProductionLine> findByFactory(String factoryId) {
        try {
            return lineMapper.findByFactory(factoryId);
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                log.warn("production_lines table not found");
                return List.of();
            }
            throw ex;
        }
    }

    @Override
    public List<ProductionLine> findByStatus(String status) {
        try {
            return lineMapper.findByStatus(status);
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                log.warn("production_lines table not found");
                return List.of();
            }
            throw ex;
        }
    }

    @Override
    public List<ProductionLine> findRunning() {
        try {
            return lineMapper.findRunning();
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                log.warn("production_lines table not found");
                return List.of();
            }
            throw ex;
        }
    }

    @Override
    public Optional<ProductionLine> findById(String lineId) {
        try {
            return lineMapper.findById(lineId);
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                log.warn("production_lines table not found");
                return Optional.empty();
            }
            throw ex;
        }
    }

    @Override
    public void save(ProductionLine line) {
        lineMapper.insert(line);
    }

    @Override
    public void update(ProductionLine line) {
        lineMapper.update(line);
    }

    @Override
    public void delete(String lineId) {
        lineMapper.delete(lineId);
    }

    @Override
    public void updateStatus(String lineId, String status, Boolean isOperating) {
        lineMapper.updateStatus(lineId, status, isOperating);
    }

    @Override
    public void updateCurrentWorkers(String lineId, int currentWorkers) {
        lineMapper.updateCurrentWorkers(lineId, currentWorkers);
    }

    @Override
    public void updateUtilizationRate(String lineId, double utilizationRate) {
        lineMapper.updateUtilizationRate(lineId, utilizationRate);
    }

    @Override
    public int countByFactory(String factoryId) {
        try {
            return lineMapper.countByFactory(factoryId);
        } catch (DataAccessException ex) {
            if (OracleErrorSupport.isMissingTableOrView(ex)) {
                log.warn("production_lines table not found");
                return 0;
            }
            throw ex;
        }
    }
}
