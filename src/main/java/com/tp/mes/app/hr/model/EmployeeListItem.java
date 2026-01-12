package com.tp.mes.app.hr.model;

/**
 * 사원 목록 조회용 DTO (조인 결과 포함)
 */
public record EmployeeListItem(
        String empId,
        String empName,
        String email,
        String phone,
        String hireDate, // 문자열로 간단히 표현

        // 조인된 정보
        String departmentId,
        String deptName,
        String positionId,
        String positionName,

        String status,
        String jobType) {
}
