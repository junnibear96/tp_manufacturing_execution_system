package com.tp.mes.app.factory.model;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 공장 (Factory) - 사업장 내 생산 기능별 구역
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Factory {

    private String factoryId; // 공장 ID (PK)
    private String plantId; // 사업장 ID (FK)

    private String factoryName; // 공장명
    private String factoryNameEn; // 공장명 (영문)
    private String factoryCode; // 공장 코드

    // 공장 정보
    private String factoryType; // 공장 유형 (ASSEMBLY, PROCESSING, PACKAGING, TESTING, LOGISTICS)
    private String status; // 운영 상태 (ACTIVE, IDLE, MAINTENANCE, SHUTDOWN)
    private String productCategory; // 생산 품목군

    // 위치 정보
    private String buildingCode; // 건물/동 코드
    private String floor; // 층
    private Double area; // 면적 (m²)

    // 운영 정보
    private Double targetUtilizationRate; // 가동률 목표 (%)

    // 담당자
    private String managerEmpId; // 담당 관리자 사번

    // 메타 정보
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
