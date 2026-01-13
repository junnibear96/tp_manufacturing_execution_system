package com.tp.mes.app.hr.model;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 직급 정보
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Position {
        private String positionId;
        private String positionName;
        private String positionNameEn;
        private int level; // 권한 레벨 (0~5)
        private String jobCategory; // OFFICE/PRODUCTION
        private LocalDateTime createdAt;
}
