package com.tp.mes.app.prod.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * BOM (Bill of Materials) - 생산 라인별 자재 소모 정보
 * 특정 생산 라인에서 생산 시 소모되는 재고 아이템과 소모율을 정의
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductionBom {

    private Long bomId; // BOM ID (PK)
    private String lineId; // 생산 라인 ID (FK)
    private Long inventoryId; // 재고 아이템 ID (FK)
    private BigDecimal consumptionRate; // 시간당 소모량 (100% 가동 시 기준)
    private String unit; // 단위 (KG, EA, L 등)
    private String notes; // 비고
    private String isActive; // 활성 여부 (Y/N)
    private LocalDateTime createdAt; // 생성 시각
    private LocalDateTime updatedAt; // 수정 시각

    // Transient fields (조인 데이터)
    private String lineName; // 라인명 (조인)
    private String itemCode; // 품목 코드 (조인)
    private String itemName; // 품목명 (조인)

    /**
     * 특정 시간 동안의 실제 소모량 계산
     * 
     * @param utilizationRate 가동률 (0~100)
     * @param hours           시간
     * @return 실제 소모량
     */
    public BigDecimal calculateActualConsumption(BigDecimal utilizationRate, double hours) {
        return consumptionRate
                .multiply(utilizationRate)
                .divide(new BigDecimal("100"), 4, java.math.RoundingMode.HALF_UP)
                .multiply(new BigDecimal(hours));
    }
}
