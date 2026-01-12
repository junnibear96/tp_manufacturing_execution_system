package com.tp.mes.app.hr.model;

import java.time.LocalDateTime;

/**
 * 부서 정보
 */
public record Department(
        String departmentId,
        String deptName,
        String deptNameEn,
        String division, // PRODUCTION/LOGISTICS/MANAGEMENT
        String managerEmpId,
        LocalDateTime createdAt,
        LocalDateTime updatedAt) {
}
