package com.tp.mes.app.hr.model;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 부서 정보
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Department {
        private String departmentId;
        private String deptName;
        private String deptNameEn;
        private String division; // PRODUCTION/LOGISTICS/MANAGEMENT
        private String managerEmpId;
        private LocalDateTime createdAt;
        private LocalDateTime updatedAt;
}
