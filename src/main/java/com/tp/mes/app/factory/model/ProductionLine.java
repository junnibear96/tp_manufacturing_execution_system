package com.tp.mes.app.factory.model;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 생산라인 (Production Line) - 실제 생산이 일어나는 최소 단위
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductionLine {

    private String lineId; // 라인 ID (PK)
    private String factoryId; // 공장 ID (FK)

    private String lineName; // 라인명
    private String lineCode; // 라인 코드

    // 라인 정보
    private String lineType; // 라인 유형 (MANUAL, SEMI_AUTO, FULL_AUTO)
    private String status; // 운영 상태 (RUNNING, STOPPED, IDLE, MAINTENANCE, ERROR)
    private Boolean isOperating; // 현재 가동 여부

    // 생산 능력
    private Integer maxCapacity; // 최대 생산 능력 (개/일)
    private Integer taktTime; // Takt Time (초)
    private Integer cycleTime; // Cycle Time (초)
    private Double utilizationRate; // 가동률 (%)

    // 인력 정보
    private Integer standardWorkers; // 표준 인원 (명)
    private Integer currentWorkers; // 현재 투입 인원 (명)
    private String lineLeaderEmpId; // 라인 리더 사번

    // 생산 관리
    private String producibleItems; // 생산 가능 품목 (JSON 배열)
    private String equipmentList; // 주요 설비 목록 (JSON 배열)
    private String shiftPattern; // 작업 교대 (DAY_ONLY, 2_SHIFT, 3_SHIFT, 24_HOURS)

    // 메타 정보
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private LocalDateTime lastOperatedAt; // 마지막 가동 시각
}
