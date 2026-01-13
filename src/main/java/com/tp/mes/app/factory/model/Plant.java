package com.tp.mes.app.factory.model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 사업장 (Plant) - 최상위 운영 단위
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Plant {

    private String plantId; // 사업장 ID (PK)
    private String plantName; // 사업장명
    private String plantNameEn; // 사업장명 (영문)

    // 위치 정보
    private String address; // 주소
    private String addressDetail; // 상세 주소
    private String postalCode; // 우편번호
    private String coordinates; // 좌표 (위도,경도 JSON)

    // 사업장 정보
    private String plantType; // 사업장 유형 (MAIN_FACTORY, BRANCH_FACTORY, WAREHOUSE, R&D_CENTER)
    private String status; // 운영 상태 (ACTIVE, MAINTENANCE, SUSPENDED, CLOSED)
    private Double totalArea; // 총 면적 (m²)
    private LocalDate establishedDate; // 설립일

    // 담당자 정보
    private String managerEmpId; // 담당 관리자 사번 (HR 연계)

    // 연락처
    private String phone; // 대표 전화
    private String fax; // 팩스

    // 메타 정보
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
