package com.tp.mes.app.prod.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 생산 KPI 요약
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductionKpiSummary {

    // 계획 정보
    private Integer totalPlans;
    private Integer completedPlans;
    private Integer inProgressPlans;

    // 생산 실적
    private Integer todayTargetQuantity;
    private Integer todayActualQuantity;
    private Double todayAchievementRate;

    // 품질 정보
    private Integer todayTotalGood;
    private Integer todayTotalDefect;
    private Double todayDefectRate;

    // 장비 현황
    private Integer totalEquipment;
    private Integer runningEquipment;
    private Integer maintenanceEquipment;
    private Integer errorEquipment;
    private Double equipmentUtilizationRate;
}
