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

    public Double getTodayAchievementRate() {
        if (todayAchievementRate != null)
            return todayAchievementRate;
        if (todayTargetQuantity == null || todayTargetQuantity == 0)
            return 0.0;
        if (todayActualQuantity == null)
            return 0.0;
        return Math.round(todayActualQuantity * 100.0 / todayTargetQuantity * 100) / 100.0;
    }

    public Double getTodayDefectRate() {
        if (todayDefectRate != null)
            return todayDefectRate;
        long total = (todayTotalGood != null ? todayTotalGood : 0) + (todayTotalDefect != null ? todayTotalDefect : 0);
        if (total == 0)
            return 0.0;
        return Math.round((todayTotalDefect != null ? todayTotalDefect : 0) * 100.0 / total * 100) / 100.0;
    }
}
