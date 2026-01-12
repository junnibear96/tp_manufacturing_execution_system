package com.tp.mes.app.hr.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 사원 정보
 */
public record Employee(
        String empId,
        String empName,
        String email,
        String phone,
        LocalDate hireDate,
        LocalDate birthDate,
        String gender, // M/F/O

        // 조직 정보
        String departmentId,
        String positionId,
        String jobType, // OFFICE/PRODUCTION/LOGISTICS
        String managerEmpId,

        // 재직 상태
        String status, // ACTIVE/LEAVE/RETIRED/TERMINATED/PROBATION
        LocalDate leaveStartDate,
        LocalDate leaveEndDate,
        LocalDate terminationDate,
        String terminationReason,

        // 생산 관련
        String shiftType, // DAY/SWING/NIGHT
        String factoryId,
        String productionLineId,
        Integer skillLevel, // 1~5

        // 메타 정보
        LocalDateTime createdAt,
        LocalDateTime updatedAt) {
    // 부서명, 직급명을 포함한 DTO용 생성자 (조인 쿼리 결과용)
    public Employee withDeptAndPosition(String deptName, String positionName) {
        return this; // 실제로는 별도 DTO 클래스가 필요할 수 있음
    }
}
