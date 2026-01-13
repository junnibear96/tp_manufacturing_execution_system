package com.tp.mes.app.hr.model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 사원 정보
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Employee {
    private String empId;
    private String empName;
    private String email;
    private String phone;
    private LocalDate hireDate;
    private LocalDate birthDate;
    private String gender; // M/F/O

    // 조직 정보
    private String departmentId;
    private String positionId;
    private String jobType; // OFFICE/PRODUCTION/LOGISTICS
    private String managerEmpId;

    // 재직 상태
    private String status; // ACTIVE/LEAVE/RETIRED/TERMINATED/PROBATION
    private LocalDate leaveStartDate;
    private LocalDate leaveEndDate;
    private LocalDate terminationDate;
    private String terminationReason;

    // 생산 관련
    private String shiftType; // DAY/SWING/NIGHT
    private String factoryId;
    private String productionLineId;
    private Integer skillLevel; // 1~5

    // 메타 정보
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
