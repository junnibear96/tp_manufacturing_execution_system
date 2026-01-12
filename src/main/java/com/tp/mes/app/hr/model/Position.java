package com.tp.mes.app.hr.model;

import java.time.LocalDateTime;

/**
 * 직급 정보
 */
public record Position(
        String positionId,
        String positionName,
        String positionNameEn,
        int level, // 권한 레벨 (0~5)
        String jobCategory, // OFFICE/PRODUCTION
        LocalDateTime createdAt) {
}
